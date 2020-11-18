Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AA7C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 05:33:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 658CD24654
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 05:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dxWUTfdc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="a4k3PkcT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 658CD24654
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AB2FGMaCv29EJ8uRIKMb4IrxGuapztkeGrOT56vLehQ=; b=dxWUTfdcyVxVm90bnQJCyiXps
	S9qVbbQdDAOl0J5h1Khxe1WELBx+8Mn3kCp4kAcK7uX1B0kTP43axcjazIIZcNqf5yPhflJoMGDUu
	etFPvUTl6CHmbf84qVtH+8srrqwSOeqc5jjkPOXNyJUz4oeMGuEOr1tGy69Ui06UaN1HFy+28RYwN
	WVmZ1qIK6d/RUgFRNE9VFLmZYBWUHJryDLJxn2wwMZUTHZZBjTbNtfmJrX99mu4atqZFRs5sbSe9C
	VmVQIJOeQxvgCIrIJnQgQvexOQpRdqxzh7W1+9uTf2vrQlJVszT/TbgxVq7nkReRTEw0iXoMWbfk1
	nDoE4+j6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfG5f-0006o2-CK; Wed, 18 Nov 2020 05:33:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfG5c-0006nM-O4; Wed, 18 Nov 2020 05:33:09 +0000
X-UUID: ff84decfe88c4800b0d5b933a83b2ac6-20201117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=feaWGkTA0pDN4xL1xb59wAcryyZv9HU/J1oPsDG2QIk=; 
 b=a4k3PkcTINTrAWBn6Epajgg+DALT6tdEx7w4hlTLfUR7/dPOXPCtqlAnLhMJYdypMbI3xiM7vSt5gk1Lz8LRGf8LaeA8AX5VkUgsvylr8wtre6txmF8R62CEk+t3/JnYGmffC/h05hvGbIVVxCoT4fMgcvUG01jyAWWKAJmIs2A=;
X-UUID: ff84decfe88c4800b0d5b933a83b2ac6-20201117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 842217243; Tue, 17 Nov 2020 21:33:02 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Nov 2020 21:26:08 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 13:26:07 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Nov 2020 13:26:07 +0800
Message-ID: <1605677166.23663.4.camel@mtkswgap22>
Subject: Re: [PATCH v3] ALSA: usb-audio: disable 96khz support for HUAWEI
 USB-C HEADSET
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Takashi Iwai <tiwai@suse.com>
Date: Wed, 18 Nov 2020 13:26:06 +0800
In-Reply-To: <1604999048-20294-1-git-send-email-macpaul.lin@mediatek.com>
References: <1604996266.2817.1.camel@mtkswgap22>
 <1604999048-20294-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_003308_986877_26711161 
X-CRM114-Status: GOOD (  19.20  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Christopher Swenson <swenson@swenson.io>, Macpaul Lin <macpaul@gmail.com>,
 Eddie Hung =?UTF-8?Q?=28=E6=B4=AA=E6=AD=A3=E9=91=AB=29?=
 <Eddie.Hung@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Chunfeng Yun =?UTF-8?Q?=28=E4=BA=91=E6=98=A5=E5=B3=B0=29?=
 <Chunfeng.Yun@mediatek.com>, Alexander Tsoy <alexander@tsoy.me>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Nick
 Kossifidis <mickflemm@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Nicola Lunghi <nick83ola@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Ainge Hsu =?UTF-8?Q?=28=E5=BE=90=E5=B7=A7=E5=AE=9C=29?=
 <ainge.hsu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-11-10 at 17:04 +0800, Macpaul Lin wrote:
> The HUAWEI USB-C headset (VID:0x12d1, PID:0x3a07) reported it supports
> 96khz. However there will be some random issue under 96khz.
> Not sure if there is any alternate setting could be applied.
> Hence 48khz is suggested to be applied at this moment.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Eddie Hung <eddie.hung@mediatek.com>
> Cc: stable@vger.kernel.org
> ---
> Changes for v2:
>   - Fix build error.
>   - Add Cc: stable@vger.kernel.org
> Changes for v3:
>   - Replace "udev" with "chip->dev" according to Takashi's suggestion. Thanks.
> 
>  sound/usb/format.c |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/sound/usb/format.c b/sound/usb/format.c
> index 1b28d01..0aff774 100644
> --- a/sound/usb/format.c
> +++ b/sound/usb/format.c
> @@ -217,6 +217,11 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
>  			    (chip->usb_id == USB_ID(0x041e, 0x4064) ||
>  			     chip->usb_id == USB_ID(0x041e, 0x4068)))
>  				rate = 8000;
> +			/* Huawei headset can't support 96kHz fully */
> +			if (rate == 96000 &&
> +			    chip->usb_id == USB_ID(0x12d1, 0x3a07) &&
> +			    le16_to_cpu(chip->dev->descriptor.bcdDevice) == 0x49)
> +				continue;
>  
>  			fp->rate_table[fp->nr_rates] = rate;
>  			if (!fp->rate_min || rate < fp->rate_min)

Sorry for bothering again, please hold-on this patch.
I'm still trying to clarify if there is another approach for this
interoperability issue.
I'll update this thread once the result has came out.

Thanks
Macpaul Lin
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
