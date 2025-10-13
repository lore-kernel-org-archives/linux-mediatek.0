Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B882CCD18D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 18:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xkS9wqt6rMxoJ6WboptAtLN/bXSuc1NV3hZ+JyctS8=; b=NSD3f+IcALdO9e+JB0i8MtgHRQ
	sscSyjqLJeY52FqUeGFVeb1TP2oMWWMZVFI4D8nZxkQ54gNn35PV3tHU2JgE/9Vcg0EcMpB0Tu8aV
	FruAP5fUgu925Z/2YeGUhpiCdJBzGuc9rx5XpKtSMqVrT3bdQtoLAIxnG+c5wa+v7E6U+WbLR6bBP
	sKwgdAxxmzgEI+G5hLt5u3vt09GTpRynchho2Ro6Vu/KN8oH+g5tsTKKCGYxqquYhrvc1AmT81nB+
	sNSJbbMnmLu51Zyt3O7L4L3Ys1xBW91bRVlhge2UoxKRZhM0CVPlaQ+oTVu/nhU1GSkT0qFresiWR
	FXVwG8vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8N1P-0000000E7WN-2BnO;
	Mon, 13 Oct 2025 18:11:47 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8N1N-0000000E7Vc-2RzZ
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 18:11:46 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 3B83C2C00A2;
	Mon, 13 Oct 2025 18:11:41 +0000 (UTC)
Received: from [192.168.100.159] (firewall.candelatech.com [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id B5F6213C2B0;
	Mon, 13 Oct 2025 11:11:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com B5F6213C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1760379098;
	bh=rcxIt2RQI0BgZtE3ekGXC9YLRzn4DsngXvvFTtKNsBs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=fPEEYJ4NZVwND8uh+UdUs8ZS4psQw5dIQX5OkY4yz1vI6RhqlJ6qhNwWlnDnoPniu
	 RZaMefmYk6/N1O/Xmwlnb5Nhu6wiF8LOvya6M5Vi5GibZBRlc+HgSrV+QNkPjulq3Z
	 9O8558y3vynWFJk1Q9ex9IU0ShiF3GTI1TASTtlE=
Message-ID: <f2c4c835-bc90-c4d1-b1e0-f85b8a945ee9@candelatech.com>
Date: Mon, 13 Oct 2025 11:11:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [report] wifi: mt76: mt7996: fix FCS error flag check in RX
 descriptor
Content-Language: en-US
To: Peter Chiu <chui-hao.chiu@mediatek.com>,
 ALOK TIWARI <alok.a.tiwari@oracle.com>, Bo.Jiao@mediatek.com,
 howard-yh.hsu@mediatek.com, meichia.chiu@mediatek.com,
 Money.Wang@mediatek.com, StanleyYP.Wang@mediatek.com,
 ryder.lee@mediatek.com, shayne.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, =?UTF-8?B?54+K6Yi6IOiUoQ==?=
 <Evelyn.Tsai@mediatek.com>
References: <ba082ece-a6a6-4287-9cb9-b216b865b8f4@oracle.com>
 <96f5ff922d22d66ad271a37f2babd60bd2cfb7dc.camel@mediatek.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <96f5ff922d22d66ad271a37f2babd60bd2cfb7dc.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MDID: 1760379102-rD26PMJf0pCZ
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;at1;1760379102;rD26PMJf0pCZ;<greearb@candelatech.com>;2bc1667803e43859c13b14ba9db8f4db
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_111145_703171_E901AEE8 
X-CRM114-Status: GOOD (  27.87  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Peter,

To help understand the severity of this problem, can you let us know when
the incorrect bit is set?  In other words, would looking at the wrong bit
erroneously cause good frames to be dropped, or was the bit always zero and
it just allowed bad frames to be accepted?

Thanks,
Ben

On 10/12/25 20:19, Peter Chiu wrote:
> On Sun, 2025-10-12 at 22:02 +0530, ALOK TIWARI wrote:
> 
> Hi Alok,
> 
> Thanks for your mail.
> Your understanding is correct.
> There is a typo in mt7996.
> 
> Thanks,
> Peter Chiu
> 
>> 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>> 
>> 
>> Hi,
>> 
>> While looking through the FCS error handling in the mt76 drivers,
>> I noticed that mt7996 uses rxd1 to check the MT_RXD3_NORMAL_FCS_ERR
>> bit,
>> whereas other Connac3-based drivers (such as mt7925) use rxd3.
>> 
>> According to the definitions, MT_RXD3_NORMAL_FCS_ERR is located in
>> the
>> fourth
>> RX descriptor word (rxd3), so I prepared a small patch to switch the
>> check from
>> rxd1 to rxd3 for consistency and correctness.
>> 
>> Before sending it formally, I wanted to confirm whether this
>> understanding is correct.
>> is mt7996 indeed supposed to use rxd3 for this flag, like mt7925?
>> 
>> Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-
>> Fi
>> 7 (802.11be) devices")
>> 
>> Thanks,
>> Alok
>> 
>> ---
>>   drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
>> b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
>> index 9501def3e0e3..59744e5593b6 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
>> @@ -527,7 +527,7 @@ mt7996_mac_fill_rx(struct mt7996_dev *dev, enum
>> mt76_rxq_id q,
>>              !(csum_status & (BIT(0) | BIT(2) | BIT(3))))
>>                  skb->ip_summed = CHECKSUM_UNNECESSARY;
>> 
>> -       if (rxd1 & MT_RXD3_NORMAL_FCS_ERR)
>> +       if (rxd3 & MT_RXD3_NORMAL_FCS_ERR)
>>                  status->flag |= RX_FLAG_FAILED_FCS_CRC;
>> 
>>          if (rxd1 & MT_RXD1_NORMAL_TKIP_MIC_ERR)
>> --
>> 2.50.1
> 
> ************* MEDIATEK Confidentiality Notice
>   ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
>   
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
> 

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com



