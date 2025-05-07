Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F017EC3ABBF
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 May 2025 19:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQlx7CN8Ni09siUtT48ueGEzTyBDSauggMZUTdHd6UM=; b=Yj+RZV3xA/oEe34dUkOZgTVTfG
	6dfTds7k2LcnQtJ7BLZ9ZCBp4ZveNU4Vw7DXDzmn0ca+vcQSNvSg3lnz5JqbIjN5Mc4GhLuglwYA5
	VzuKK0PT83heBluOecvwnouzByaFxQgA8WegnLGjvKi6/Wpcj+CIU/e1QVVBdVUuECMzm62rEvk2a
	8G7gAjrXEgienY4vz241nFqLgittscaNeP4Fe9YUD7zJtr4S25gMdqQtFduJjjP95rquUzC4l+Nfn
	PZTihN8/srd+KEWWxE2O2kIuSQYMwCoSNklAI/d6vCS7Q5AVPL/+1iilntRapYGW4vfO3rC3VsLso
	OxPlOtAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCkWT-0000000GaIE-3lWp;
	Wed, 07 May 2025 19:33:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCkUW-0000000GaAN-0K21;
	Wed, 07 May 2025 19:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746646297;
	bh=XkT3rf/GhFkQ/rhyKTyqEyqJNDGvu/1GzX9MJDAJu64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m+buex5RPLqc5Lxi+5UspQuvlsrpHUCgfknhkggqX56fSWjdqwBNQemBl+XLqGlNx
	 T9ajjjib1yET3HT2K6UZs0EaU3SxQPlhqtRnBte3crUksQL+6QRLMLBz9lHmwUY4v6
	 IyAPxzdMR5aiMRlJTFEOxHUwJMznAIrFl4EgAd9RUDpSi6hgyMUDs4ok0pDQcdOMwV
	 dnHCVaUZ6aYQ3K5V6apNvxzzLFp6+QgFjQeIAaSUsA3qraAx6IZyhqiRr4avwTWAWH
	 yTqd8Ym24aUYBQfQF9FENZ8whUsdWyMt7K/GgVoSBjIihkX+d4SX+Y4AA1jF/TOaw4
	 2sU1W6+UAP80g==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C2A4917E04C0;
	Wed,  7 May 2025 21:31:34 +0200 (CEST)
Date: Wed, 7 May 2025 15:31:32 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Zoran Zhan <zoran.zhan@mediatek.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: select
 CONFIG_SND_SOC_MT6359_ACCDET
Message-ID: <5e45cf78-ea88-4a93-83e6-9022feed0421@notapiano>
References: <20250505052106.1811802-1-arnd@kernel.org>
 <d9642581-3fed-47d8-9661-4335ec1e9c27@notapiano>
 <86a3a0ab-be37-4b4d-a5a5-32d09c1a75ce@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86a3a0ab-be37-4b4d-a5a5-32d09c1a75ce@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_123140_267306_19CC35EE 
X-CRM114-Status: GOOD (  22.90  )
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

On Wed, May 07, 2025 at 07:10:54PM +0200, Arnd Bergmann wrote:
> On Wed, May 7, 2025, at 18:41, Nícolas F. R. A. Prado wrote:
> > On Mon, May 05, 2025 at 07:20:52AM +0200, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >> 
> >> The driver support was added without selecting the codec, which leads to
> >> a link failure:
> >> 
> >> aarch64-linux-ld: sound/soc/mediatek/mt8188/mt8188-mt6359.o: in function `mt8188_mt6359_init':
> >> mt8188-mt6359.c:(.text+0x19f0): undefined reference to `mt6359_accdet_enable_jack_detect'
> >
> > Hm, I cannot seem to reproduce this. I just tried to build on today's next with
> > CONFIG_SND_SOC_MT6359_ACCDET disabled and have tried
> > CONFIG_SND_SOC_MT8188_MT6359 both =m and =y, but in both cases it compiles fine.
> 
> The config that failed for me had CONFIG_SND_SOC_MT6359_ACCDET.
> 
> > I wonder if somehow your tree was missing "ASoC: mediatek: mt6359: Add stub for
> > mt6359_accdet_enable_jack_detect" [1]
> 
> > https://lore.kernel.org/all/20250306-mt8188-accdet-v3-3-7828e835ff4b@collabora.com/
> 
> I had not seen that patch, but with that applied, my patch needs to
> be revised as well. If the idea is that CONFIG_SND_SOC_MT8188_MT6359
> can work correctly without CONFIG_SND_SOC_MT6359_ACCDET, it should be
> 
>       depends on SND_SOC_MT6359_ACCDET || !SND_SOC_MT6359_ACCDET
> 
> in order to force SND_SOC_MT8188_MT6359=m if the ACCDET portion
> is in a loadable module.

Ah indeed, that's it. The stub was added to allow MT8188_MT6359 to work without 
ACCDET, but we still need to prevent the MT8188_MT6359=y and ACCDET=m case, like
you suggest. I can send that patch right away.

Thanks,
Nícolas

