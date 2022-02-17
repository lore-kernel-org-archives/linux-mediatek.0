Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D1FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 14:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=meXLA5XYeadVUrc8RKCqAm2gpWyVJCGPwEjUQlDi8c8=; b=fww2HcF9RD8LBR
	QoI82zPSszwBkUIXCk4nCuol5COj6mHZr5+pZTvSDAoZXl51M+MY3Eo/dBRcA1avK6sPNjFStEi1K
	I3DgDSdZZ5ZR4vFuKLN0WNUwE5thimNtPgBmkMawLXTEM9vt/S6aX9ppgGpHNbVJfkfkTbh+XDav5
	NqzhRNpGUjFhMgj6Fd6rZm5YLjGFuPFVHVigrVxyukgP1iWsZP8C8vJglrsk4ixE/ycZ9D1uM/nPl
	FYLwjwZNIAz6yOlaft52RDbEXo65iUU/PNMGCLyQT64+SLXqpyoAz+Tiy6jd0ulbasxkq2tjUp2ot
	g2Gl7Na67qOMf7i4f3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKhl1-00B0eV-Fs; Thu, 17 Feb 2022 14:27:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKhPS-00Arbw-V8; Thu, 17 Feb 2022 14:05:30 +0000
X-UUID: a2b2b2b791e94bc280cadca005b09ce0-20220217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YVmSAFjMYYK4YApAqr/DFYroAZSP9YlEkKTdk/DMBVY=; 
 b=dpmDL92IqNRD6Ukr/XtvLJeTj6P347hTWgvx44pohwGsMSASbTF8jMN0Je47jg0J7w5OjZztF5XmgyGvyRwO3FjRNMOJvkl3cZeWqZskmJHkjlsxA9arPIakV4vd8066rQLkBiss7p5zRLcxYPOo7QeG/3SKqRBNj4q020muRoY=;
X-UUID: a2b2b2b791e94bc280cadca005b09ce0-20220217
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1132538243; Thu, 17 Feb 2022 07:05:23 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 06:05:22 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Feb 2022 22:05:08 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 22:05:07 +0800
Message-ID: <62ad00889c7cf0e1f7501b9e5b3ab1b132639281.camel@mediatek.com>
Subject: Re: [PATCH 05/15] ASoC: mediatek: mt8186: support hw gain in
 platform driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <perex@perex.cz>, <p.zabel@pengutronix.de>,
 <geert+renesas@glider.be>, <trevor.wu@mediatek.com>, <tzungbi@google.com>,
 <zhangqilong3@huawei.com>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 17 Feb 2022 22:05:07 +0800
In-Reply-To: <YgZ9gadN8RksWeWN@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <20220211103818.8266-6-jiaxin.yu@mediatek.com>
 <YgZ9gadN8RksWeWN@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_060527_049028_D3085B09 
X-CRM114-Status: GOOD (  14.53  )
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

On Fri, 2022-02-11 at 15:15 +0000, Mark Brown wrote:
> On Fri, Feb 11, 2022 at 06:38:08PM +0800, Jiaxin Yu wrote:
> 
> Again, mostly looks good just some minor issues (I've not repeated
> some
> that applied to the prior code):
> 
> > +static const struct snd_kcontrol_new mtk_hw_gain2_in_ch1_mix[] = {
> > +	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN15,
> > +				    I_ADDA_UL_CH1, 1, 0),
> > +};
> 
> These end up as regular user visible controls so should have standard
> control names - in this case ending in Switch since it's a simple
> on/off.  A similar issue was there in the earlier patches.
Yes, I have corrected the control names in the other patches together.

> 
> > +static const struct snd_kcontrol_new mtk_hw_gain_controls[] = {
> > +	SOC_SINGLE("HW Gain 1", AFE_GAIN1_CON1,
> > +		   GAIN1_TARGET_SFT, GAIN1_TARGET_MASK, 0),
> > +	SOC_SINGLE("HW Gain 2", AFE_GAIN2_CON1,
> > +		   GAIN2_TARGET_SFT, GAIN2_TARGET_MASK, 0),
> 
> These should have standard names like "HW 1 Volume" so userspace has
> a
> better idea how to display them.

Ok, I see.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
