Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAE2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 08:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZt0iNaxxlrLLPM8FK7r1ksZ7Cm39nNPV8ZqV4pbzrk=; b=W59/hcuk9mwltC
	eUuD2EQWjn6VMYxt0zp6anFFGttHsO5GRbkznM31uvHwBz79+AQF8fvwFakUhTOd3+pBpj2aleac1
	ajraU5OeQ7ziphOJrx3a4yKARIqboHhuTM30Gk08eCgukB2SS4v1g+nOaEyIBMP8ANfBKuCrei8NZ
	KjcLfdgDGqxbIEtXV1LrGI2sqiWuHyONoFxtXw+lZ6UC0POnuWtwCju9ef9DuJJ790G6ZPz4/buyF
	jRDIGzbcQrg9WXH1Y1V6RQ0NQ0F5jmXGVMrh762HbKzJwNSZGRu/ITxjm51XOu941k5sYuVW/yXSF
	gzsYvoqul53KOT0bfD6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnyuz-00D9TU-I0; Mon, 09 May 2022 08:39:01 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnyuW-00D98c-MV
 for linux-mediatek@lists.infradead.org; Mon, 09 May 2022 08:38:34 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2496VW3e001166;
 Mon, 9 May 2022 03:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=36HXijmydYE4zY1or9WwEGwBGzA/Xuz1kNxpjRTbtcQ=;
 b=Cklqhy702Q0ZFNrwkaxYr5GIHrrmUl8XzgHm+DRCZunh30jsRdGYCtMnEjzWbOqGef04
 qpBdZy+nm89bNuZSiORPXjUGbtxDsdzEqLCPmoUxveGjGgo4fh3oFxJUjDMRjBhARh6U
 xUMragOqFRtnl2qUlwlphzpc9/3HJPv7E5e0Uie6w/xC+9gc/qEHr1BA5oBIfM+gSVNW
 znPvtO9URWfc06ONWxIF3EOfY1W0LNheQ50avR/tM00WW5wSgS0jyOOtPjzK2WruZOL+
 9jkYy16mqSW4derTugfO19YuGERAf+VjGozwKimHt0ivEY9Kqcy1QvXlHMTHJcVgk7oM rQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fwn6ntddq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 09 May 2022 03:37:30 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 09:37:29 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 9 May 2022 09:37:29 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1C9F0B10;
 Mon,  9 May 2022 08:37:29 +0000 (UTC)
Date: Mon, 9 May 2022 08:37:29 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kirill Marinushkin <kmarinushkin@birdec.com>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <codrin.ciubotariu@microchip.com>, <lars@metafoo.de>,
 <cychiang@chromium.org>, <tzungbi@google.com>, <bleung@chromium.org>,
 <matthias.bgg@gmail.com>, <oder_chiou@realtek.com>,
 <steven.eckhoff.opensource@gmail.com>,
 <srinivas.kandagatla@linaro.org>, <alexandre.belloni@bootlin.com>,
 <kuninori.morimoto.gx@renesas.com>, <jiaxin.yu@mediatek.com>,
 <alsa-devel@alsa-project.org>, <chrome-platform@lists.linux.dev>,
 <linux-mediatek@lists.infradead.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH 01/38] ASoC: soc-component: Add comment for the
 endianness flag
Message-ID: <20220509083729.GX38351@ediswmail.ad.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
 <20220504170905.332415-2-ckeepax@opensource.cirrus.com>
 <ec86bdc6-b3c4-e595-02c8-e0687c442fd3@birdec.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec86bdc6-b3c4-e595-02c8-e0687c442fd3@birdec.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: t50DEXpTLvmQxPAQqhw5qQCpY1C6gaNp
X-Proofpoint-GUID: t50DEXpTLvmQxPAQqhw5qQCpY1C6gaNp
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_013832_952076_B544B523 
X-CRM114-Status: GOOD (  26.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, May 08, 2022 at 10:34:12PM +0200, Kirill Marinushkin wrote:
> In the [PATCH 00/38] of this patch set, you write:
> > 2) Devices behind non-audio buses, SPI just moves bits and doesn't
> > really define an endian for audio data on the bus. Thus it seems the
> > CODEC probably can care about the endian. The only devices that fall
> > into this group (mostly for AoV) are: rt5514-spi.c, rt5677-spi.c,
> > cros_ec_codec.c (only the AoV).
> 
> From my experience with some PCM codecs by TI, they can not care about the
> endianness. For example, in driver [1], if I allow BE format as
> well, and configure
> the sound card to use BE, it will not work. I have no sound with BE.
> In these cases, the codec HW supports *only* LE. That's why their
> `snd_soc_dai_driver`
> structures provide only LE in the `format` field.
> If such drivers specify `endianness = 1`, then `soc-core` will
> extend their supported
> formats with BE counter-parts, see [2]. AFAIU, it will have the same
> effect, as if the
> drivers themselves provided their formats in both LE | BE.
> 
> I don't think adding `endianness = 1` to such codecs will work as expected.
> Unfortunately, I don't have an easy access to HW today, to confirm
> or disprove
> this understanding.
> 

This sounds like an error on the CPU side of the DAI link rather
than the CODEC side of the DAI link. The formats that will be
supported on the link are the union of the CPU and CODEC supported
formats, ie. a format must be supported on both for the DAI to
support it.

The CPU I2S hardware should be sending out the bits in the same
order regardless of if the data you feed it is BE or LE, as I2S
specifies an ordering for the bits. If this is not the case then
the host I2S controller is claiming to support an endian it does
not, and the problem should be fixed on that side by removing the
supported endian.

Thanks,
Charles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
