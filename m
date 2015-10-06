From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] xhci: create one unified function to calculate TRB TD
 remainder.
Date: Tue, 06 Oct 2015 16:48:32 +0300
Message-ID: <5613D130.1030905@linux.intel.com>
References: <55EEBC33.5030906@intel.com>	 <1441710591-4267-1-git-send-email-mathias.nyman@linux.intel.com> <1441944485.25974.8.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441944485.25974.8.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: chunfeng yun <chunfeng.yun@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 11.09.2015 07:08, chunfeng yun wrote:
> Hi,
> On Tue, 2015-09-08 at 14:09 +0300, Mathias Nyman wrote:
>> xhci versions 1.0 and later report the untransferred data remaining in a
>> TD a bit differently than older hosts.
>>
>> We used to have separate functions for these, and needed to check host
>>   version before calling the right function.
>>
>> Now Mediatek host has an additional quirk on how it uses the TD Size
>> field for remaining data. To prevent yet another function for calculating
>> remainder we instead want to make one quirk friendly unified function.
>>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
>>   drivers/usb/host/xhci-ring.c | 106 ++++++++++++++++++-------------------------
>>   drivers/usb/host/xhci.h      |   2 +
>>   2 files changed, 46 insertions(+), 62 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>> index a47a1e8..57f40a1 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
>> @@ -3020,21 +3020,6 @@ int xhci_queue_intr_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>>   }
>>
>>   /*
>> - * The TD size is the number of bytes remaining in the TD (including this TRB),
>> - * right shifted by 10.
>> - * It must fit in bits 21:17, so it can't be bigger than 31.
>> - */
>> -static u32 xhci_td_remainder(unsigned int remainder)
>> -{
>> -	u32 max = (1 << (21 - 17 + 1)) - 1;
>> -
>> -	if ((remainder >> 10) >= max)
>> -		return max << 17;
>> -	else
>> -		return (remainder >> 10) << 17;
>> -}
>> -
>> -/*
>>    * For xHCI 1.0 host controllers, TD size is the number of max packet sized
>>    * packets remaining in the TD (*not* including this TRB).
>>    *
>> @@ -3046,30 +3031,36 @@ static u32 xhci_td_remainder(unsigned int remainder)
>>    *
>>    * TD size = total_packet_count - packets_transferred
>>    *
>> - * It must fit in bits 21:17, so it can't be bigger than 31.
>> + * For xHCI 0.96 and older, TD size field should be the remaining bytes
>> + * including this TRB, right shifted by 10
>> + *
>> + * For all hosts it must fit in bits 21:17, so it can't be bigger than 31.
>> + * This is taken care of in the TRB_TD_SIZE() macro
>> + *
>>    * The last TRB in a TD must have the TD size set to zero.
>>    */
>> -static u32 xhci_v1_0_td_remainder(int running_total, int trb_buff_len,
>> -		unsigned int total_packet_count, struct urb *urb,
>> -		unsigned int num_trbs_left)
>> +static u32 xhci_td_remainder(struct xhci_hcd *xhci, int transferred,
>> +			      int trb_buff_len, unsigned int td_total_len,
>> +			      struct urb *urb, unsigned int num_trbs_left)
>>   {
>> -	int packets_transferred;
>> +	u32 maxp, total_packet_count;
>> +
>> +	if (xhci->hci_version < 0x100)
>> +		return ((td_total_len - transferred) >> 10);
>> +
>> +	maxp = GET_MAX_PACKET(usb_endpoint_maxp(&urb->ep->desc));
>> +	total_packet_count = DIV_ROUND_UP(td_total_len, maxp);
>>
>>   	/* One TRB with a zero-length data packet. */
>> -	if (num_trbs_left == 0 || (running_total == 0 && trb_buff_len == 0))
>> +	if (num_trbs_left == 0 || (transferred == 0 && trb_buff_len == 0) ||
>> +	    trb_buff_len == td_total_len)
>>   		return 0;
>>
> I think when trb_buff_len == td_total_len, the TD only needs one trb, so
> num_trbs_left will equal to 0; that means no need add this condition.
>

Sorry about the really long delay, I had to focus on other things for a while.

You're right, but I didn't want to change the functionality of the old code.

For some reason the old code called xhci_td_remainder() for both older (0.9)
and newer (>= 1.0) xhci hosts in the control transfer case.
I wanted the outcome to stay the same as with the old code, With the old code the
TD size of a control tranfers was usually 0, without the additional
check we would end up with a remainder of "1". (as num_trbs_left is one)

This should enable easier TD size quirking for control transfers

I'll add the tested-by tag you sent in a later mail

-Mathias
