From: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] xhci: create one unified function to calculate TRB TD
 remainder.
Date: Fri, 11 Sep 2015 12:08:05 +0800
Message-ID: <1441944485.25974.8.camel@mhfsdcap03>
References: <55EEBC33.5030906@intel.com>
	 <1441710591-4267-1-git-send-email-mathias.nyman@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441710591-4267-1-git-send-email-mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi,
On Tue, 2015-09-08 at 14:09 +0300, Mathias Nyman wrote:
> xhci versions 1.0 and later report the untransferred data remaining in a
> TD a bit differently than older hosts.
> 
> We used to have separate functions for these, and needed to check host
>  version before calling the right function.
> 
> Now Mediatek host has an additional quirk on how it uses the TD Size
> field for remaining data. To prevent yet another function for calculating
> remainder we instead want to make one quirk friendly unified function.
> 
> Signed-off-by: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/usb/host/xhci-ring.c | 106 ++++++++++++++++++-------------------------
>  drivers/usb/host/xhci.h      |   2 +
>  2 files changed, 46 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index a47a1e8..57f40a1 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -3020,21 +3020,6 @@ int xhci_queue_intr_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  }
>  
>  /*
> - * The TD size is the number of bytes remaining in the TD (including this TRB),
> - * right shifted by 10.
> - * It must fit in bits 21:17, so it can't be bigger than 31.
> - */
> -static u32 xhci_td_remainder(unsigned int remainder)
> -{
> -	u32 max = (1 << (21 - 17 + 1)) - 1;
> -
> -	if ((remainder >> 10) >= max)
> -		return max << 17;
> -	else
> -		return (remainder >> 10) << 17;
> -}
> -
> -/*
>   * For xHCI 1.0 host controllers, TD size is the number of max packet sized
>   * packets remaining in the TD (*not* including this TRB).
>   *
> @@ -3046,30 +3031,36 @@ static u32 xhci_td_remainder(unsigned int remainder)
>   *
>   * TD size = total_packet_count - packets_transferred
>   *
> - * It must fit in bits 21:17, so it can't be bigger than 31.
> + * For xHCI 0.96 and older, TD size field should be the remaining bytes
> + * including this TRB, right shifted by 10
> + *
> + * For all hosts it must fit in bits 21:17, so it can't be bigger than 31.
> + * This is taken care of in the TRB_TD_SIZE() macro
> + *
>   * The last TRB in a TD must have the TD size set to zero.
>   */
> -static u32 xhci_v1_0_td_remainder(int running_total, int trb_buff_len,
> -		unsigned int total_packet_count, struct urb *urb,
> -		unsigned int num_trbs_left)
> +static u32 xhci_td_remainder(struct xhci_hcd *xhci, int transferred,
> +			      int trb_buff_len, unsigned int td_total_len,
> +			      struct urb *urb, unsigned int num_trbs_left)
>  {
> -	int packets_transferred;
> +	u32 maxp, total_packet_count;
> +
> +	if (xhci->hci_version < 0x100)
> +		return ((td_total_len - transferred) >> 10);
> +
> +	maxp = GET_MAX_PACKET(usb_endpoint_maxp(&urb->ep->desc));
> +	total_packet_count = DIV_ROUND_UP(td_total_len, maxp);
>  
>  	/* One TRB with a zero-length data packet. */
> -	if (num_trbs_left == 0 || (running_total == 0 && trb_buff_len == 0))
> +	if (num_trbs_left == 0 || (transferred == 0 && trb_buff_len == 0) ||
> +	    trb_buff_len == td_total_len)
>  		return 0;
>  
I think when trb_buff_len == td_total_len, the TD only needs one trb, so
num_trbs_left will equal to 0; that means no need add this condition.

> -	/* All the TRB queueing functions don't count the current TRB in
> -	 * running_total.
> -	 */
> -	packets_transferred = (running_total + trb_buff_len) /
> -		GET_MAX_PACKET(usb_endpoint_maxp(&urb->ep->desc));
> -
> -	if ((total_packet_count - packets_transferred) > 31)
> -		return 31 << 17;
> -	return (total_packet_count - packets_transferred) << 17;
> +	/* Queueing functions don't count the current TRB into transferred */
> +	return (total_packet_count - ((transferred + trb_buff_len) / maxp));
>  }
>  
> +
>  static int queue_bulk_sg_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  		struct urb *urb, int slot_id, unsigned int ep_index)
>  {
> @@ -3191,17 +3182,12 @@ static int queue_bulk_sg_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  		}
>  
>  		/* Set the TRB length, TD size, and interrupter fields. */
> -		if (xhci->hci_version < 0x100) {
> -			remainder = xhci_td_remainder(
> -					urb->transfer_buffer_length -
> -					running_total);
> -		} else {
> -			remainder = xhci_v1_0_td_remainder(running_total,
> -					trb_buff_len, total_packet_count, urb,
> -					num_trbs - 1);
> -		}
> +		remainder = xhci_td_remainder(xhci, running_total, trb_buff_len,
> +					   urb->transfer_buffer_length,
> +					   urb, num_trbs - 1);
> +
>  		length_field = TRB_LEN(trb_buff_len) |
> -			remainder |
> +			TRB_TD_SIZE(remainder) |
>  			TRB_INTR_TARGET(0);
>  
>  		if (num_trbs > 1)
> @@ -3364,17 +3350,12 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  			field |= TRB_ISP;
>  
>  		/* Set the TRB length, TD size, and interrupter fields. */
> -		if (xhci->hci_version < 0x100) {
> -			remainder = xhci_td_remainder(
> -					urb->transfer_buffer_length -
> -					running_total);
> -		} else {
> -			remainder = xhci_v1_0_td_remainder(running_total,
> -					trb_buff_len, total_packet_count, urb,
> -					num_trbs - 1);
> -		}
> +		remainder = xhci_td_remainder(xhci, running_total, trb_buff_len,
> +					   urb->transfer_buffer_length,
> +					   urb, num_trbs - 1);
> +
>  		length_field = TRB_LEN(trb_buff_len) |
> -			remainder |
> +			TRB_TD_SIZE(remainder) |
>  			TRB_INTR_TARGET(0);
>  
>  		if (num_trbs > 1)
> @@ -3412,7 +3393,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  	struct usb_ctrlrequest *setup;
>  	struct xhci_generic_trb *start_trb;
>  	int start_cycle;
> -	u32 field, length_field;
> +	u32 field, length_field, remainder;
>  	struct urb_priv *urb_priv;
>  	struct xhci_td *td;
>  
> @@ -3485,9 +3466,15 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  	else
>  		field = TRB_TYPE(TRB_DATA);
>  
> +	remainder = xhci_td_remainder(xhci, 0,
> +				   urb->transfer_buffer_length,
> +				   urb->transfer_buffer_length,
> +				   urb, 1);
> +
>  	length_field = TRB_LEN(urb->transfer_buffer_length) |
> -		xhci_td_remainder(urb->transfer_buffer_length) |
> +		TRB_TD_SIZE(remainder) |
>  		TRB_INTR_TARGET(0);
> +
>  	if (urb->transfer_buffer_length > 0) {
>  		if (setup->bRequestType & USB_DIR_IN)
>  			field |= TRB_DIR_IN;
> @@ -3816,17 +3803,12 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  				trb_buff_len = td_remain_len;
>  
>  			/* Set the TRB length, TD size, & interrupter fields. */
> -			if (xhci->hci_version < 0x100) {
> -				remainder = xhci_td_remainder(
> -						td_len - running_total);
> -			} else {
> -				remainder = xhci_v1_0_td_remainder(
> -						running_total, trb_buff_len,
> -						total_packet_count, urb,
> -						(trbs_per_td - j - 1));
> -			}
> +			remainder = xhci_td_remainder(xhci, running_total,
> +						   trb_buff_len, td_len,
> +						   urb, trbs_per_td - j - 1);
> +
>  			length_field = TRB_LEN(trb_buff_len) |
> -				remainder |
> +				TRB_TD_SIZE(remainder) |
>  				TRB_INTR_TARGET(0);
>  
>  			queue_trb(xhci, ep_ring, more_trbs_coming,
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index dbda41e..ea8b904 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1136,6 +1136,8 @@ enum xhci_setup_dev {
>  /* Normal TRB fields */
>  /* transfer_len bitmasks - bits 0:16 */
>  #define	TRB_LEN(p)		((p) & 0x1ffff)
> +/* TD Size, packets remaining in this TD, bits 21:17 (5 bits, so max 31) */
> +#define TRB_TD_SIZE(p)          (min((p), (u32)31) << 17)
>  /* Interrupter Target - which MSI-X vector to target the completion event at */
>  #define TRB_INTR_TARGET(p)	(((p) & 0x3ff) << 22)
>  #define GET_INTR_TARGET(p)	(((p) >> 22) & 0x3ff)


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
