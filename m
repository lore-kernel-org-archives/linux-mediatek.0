Return-Path: <SRS0=XLXJ=EQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F554C388F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 08:18:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DEEA2080A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 08:18:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="waVCwc+j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qV4ZFRGJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DEEA2080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bKH95GSCiV+k2E2V6zXOltqFfXy7wwSz/94tR9hPHig=; b=waVCwc+joGZR36uHMXz67GUHi
	Wo41ms22jlTWt9K0dW4oci1WlF2IV8aCw1qeBwIcge0rqgR3CTURHAYkctkZdrUtVT3tDb4pf7CcF
	nfR1G2DIw/H+UoXoUKxHZ85QbbjlyVN+//tH3Amu60RaZMwo7nQgnrCuu7X/CvUJZKswe7kIyj0Je
	v1zRxvGeQ5GOoerf55SgOKj8UzR1I9pY+zO9jHOx94F131dWp5gggcKahjOWkxAiLUPd4dL0uIiAq
	gcFCYCNB5AoQj1yImfPvvxxBJnkyPOFnw1rR3ZAwS5Sl8yB7FDYoWoOmabnnkWrZsra2ZFP3P0W6i
	cBEd/CiTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcOqo-0003uc-5b; Tue, 10 Nov 2020 08:18:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcOql-0003tQ-99; Tue, 10 Nov 2020 08:18:00 +0000
X-UUID: c678496dd7c142699dde032310821275-20201110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TKBOSDs5SG5iZh6CckK8QZc6kQZOfaoRrMqk9Jg2YQY=; 
 b=qV4ZFRGJ4M3K3wl2UkqLeqkyOBnIzys1mMY6TwESiHcNcaJackGWhab8/s4HSCbn2Uce2PVIMqrJczBRse4zAIA607xYtZrwSNrpxhHzWZY7yTJ/ZFT7VkGzjdjbBJCAV/SjAMqlJB7XASfaAsKVKZRDzjKdM3I5wH4ZllyNCkY=;
X-UUID: c678496dd7c142699dde032310821275-20201110
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1574035773; Tue, 10 Nov 2020 00:17:56 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Nov 2020 00:17:54 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Nov 2020 16:17:46 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Nov 2020 16:17:47 +0800
Message-ID: <1604996266.2817.1.camel@mtkswgap22>
Subject: Re: [PATCH] ALSA: usb-audio: disable 96khz support for HUAWEI USB-C
 HEADSET
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Nov 2020 16:17:46 +0800
In-Reply-To: <s5h5z6dljf7.wl-tiwai@suse.de>
References: <1604995443-30453-1-git-send-email-macpaul.lin@mediatek.com>
 <s5h5z6dljf7.wl-tiwai@suse.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_031759_499173_DB9F13F1 
X-CRM114-Status: GOOD (  20.27  )
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
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Christopher Swenson <swenson@swenson.io>, linux-kernel@vger.kernel.org,
 Macpaul Lin <macpaul@gmail.com>, Eddie Hung <eddie.hung@mediatek.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Alexander Tsoy <alexander@tsoy.me>,
 linux-mediatek@lists.infradead.org, Nick Kossifidis <mickflemm@gmail.com>,
 Matthias
 Brugger <matthias.bgg@gmail.com>, Nicola Lunghi <nick83ola@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Ainge Hsu <ainge.hsu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-11-10 at 09:12 +0100, Takashi Iwai wrote:
> On Tue, 10 Nov 2020 09:04:03 +0100,
> Macpaul Lin wrote:
> > 
> > The HUAWEI USB-C headset (VID:0x12d1, PID:0x3a07) reported it supports
> > 96khz. However there will be some random issue under 96khz.
> > Not sure if there is any alternate setting could be applied.
> > Hence 48khz is suggested to be applied at this moment.
> > 
> > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > Signed-off-by: Eddie Hung <eddie.hung@mediatek.com>
> > ---
> >  sound/usb/format.c |    5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/sound/usb/format.c b/sound/usb/format.c
> > index 1b28d01..6f6e79b 100644
> > --- a/sound/usb/format.c
> > +++ b/sound/usb/format.c
> > @@ -217,6 +217,11 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
> >  			    (chip->usb_id == USB_ID(0x041e, 0x4064) ||
> >  			     chip->usb_id == USB_ID(0x041e, 0x4068)))
> >  				rate = 8000;
> > +			/* Huawei headset can't support 96kHz fully */
> > +			if (rate == 96000 &&
> > +			    chip->usb_id == USB_ID(0x12d1, 0x3a07) &&
> > +			    le16_to_cpu(udev->descriptor.bcdDevice) == 0x49)
> 
> This causes the compile error due to the unknown udev.
> Is this bcdDevice check mandatory?

This means firmware version of the headset as far as I know..
Sorry I'll check the compile error and resend later.

> 
> thanks,
> 
> Takashi

Thanks
Macpaul Lin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
