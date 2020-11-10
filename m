Return-Path: <SRS0=XLXJ=EQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBBCC55ABD
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 08:54:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 237472080A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 08:54:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YCRvpdCC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NPfjehDP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 237472080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZHqQ7uQQc5fVqLBrL0Ihec6pSuX9Jw6Dx+eDQ1tmG1g=; b=YCRvpdCCp+3kCU2nJW3Zh7fld
	YyDBTpOLM7paXNRkgmJ4eFgjxpHFPuXmkseF1zEOzyop6YeMDbFVJ7hry98h2nYQIGVh93VceKSkg
	YqRSDc8fPlVFcXmWOcWxAJzBqCt8wdzGo6u567G3XBOMDHMRbOpZv1SEGebmOMR8QN/+F2uRDpCon
	buZifLSSlMAlD80sHELDNMJlcNu3wzw97VpADxOcP0iiSiLXOuiUJtzd5RNxZ6WYLoR2d2ngP3RRh
	BA6i8OK5bTpcynQoyJWssDY3u/1llTeN5aU2z+3/4emiY05WeKMIRLzxX6XmgjKXRKNdetOwR1BSg
	JV6pavI2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcPQM-0008Ps-1i; Tue, 10 Nov 2020 08:54:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcPQJ-0008Oj-1t; Tue, 10 Nov 2020 08:54:45 +0000
X-UUID: 94e613d7d7db432bb324e0cc75e79bb8-20201110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=busI8tzaIjOQfi9V2ZmeWHinzielzkKRRHvJYt8BzSk=; 
 b=NPfjehDP/QTMD0Rx8pJej3wWOzg4bHtIK/C0ZzLlQugZK5CE+5d6jpeJYiSN54qjirdxIr+qZDDsP3jBV6HfvI6FYSingDFc1Sn7zaVEssBwXjOU9y0BUJoNbU7Vlplbb0RBhmb/Thq2/51ycSeBifdeXDL1ITcr9r14elAtt5E=;
X-UUID: 94e613d7d7db432bb324e0cc75e79bb8-20201110
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 892568965; Tue, 10 Nov 2020 00:54:38 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Nov 2020 00:54:37 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Nov 2020 16:54:30 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Nov 2020 16:54:30 +0800
Message-ID: <1604998469.2817.3.camel@mtkswgap22>
Subject: Re: [PATCH v2] ALSA: usb-audio: disable 96khz support for HUAWEI
 USB-C HEADSET
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Greg KH <greg@kroah.com>
Date: Tue, 10 Nov 2020 16:54:29 +0800
In-Reply-To: <X6pUaatZ7aML4sKq@kroah.com>
References: <1604995443-30453-1-git-send-email-macpaul.lin@mediatek.com>
 <1604997774-13593-1-git-send-email-macpaul.lin@mediatek.com>
 <X6pUaatZ7aML4sKq@kroah.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6DB580D9FD98F3A3017B4D3065C7D004E39255AD44F7F8ECCD7CD23B23672D3B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_035443_304205_AB0F243E 
X-CRM114-Status: GOOD (  21.87  )
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
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Alexander Tsoy <alexander@tsoy.me>, linux-mediatek@lists.infradead.org,
 Nick Kossifidis <mickflemm@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Nicola Lunghi <nick83ola@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Ainge Hsu <ainge.hsu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-11-10 at 09:50 +0100, Greg KH wrote:
> On Tue, Nov 10, 2020 at 04:42:54PM +0800, Macpaul Lin wrote:
> > The HUAWEI USB-C headset (VID:0x12d1, PID:0x3a07) reported it supports
> > 96khz. However there will be some random issue under 96khz.
> > Not sure if there is any alternate setting could be applied.
> > Hence 48khz is suggested to be applied at this moment.
> > 
> > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > Signed-off-by: Eddie Hung <eddie.hung@mediatek.com>
> > Cc: stable@vger.kernel.org
> > ---
> > Changes for v2:
> >   - Fix build error.
> >   - Add Cc: stable@vger.kernel.org
> > 
> >  sound/usb/format.c |    6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/sound/usb/format.c b/sound/usb/format.c
> > index 1b28d01..7a4837b 100644
> > --- a/sound/usb/format.c
> > +++ b/sound/usb/format.c
> > @@ -202,6 +202,7 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
> >  		fp->rate_min = fp->rate_max = 0;
> >  		for (r = 0, idx = offset + 1; r < nr_rates; r++, idx += 3) {
> >  			unsigned int rate = combine_triple(&fmt[idx]);
> > +			struct usb_device *udev = chip->dev;
> >  			if (!rate)
> >  				continue;
> >  			/* C-Media CM6501 mislabels its 96 kHz altsetting */
> 
> Did you run this patch through checkpatch.pl?
> 

I've ran checkpatch for this patch v2, and it shown
"total: 0 errors, 0 warnings". We're using 5.9-rc1 internal.

However, I'll send patch v3 according to Takashi's suggestion.

Thanks
Macpaul Lin
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
