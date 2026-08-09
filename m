Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57DBC5AD5A
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 18:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKfWVbm9KpeTwL3/mVwrfju84PrObkxu9nWfkWUyNGM=; b=Znv2h5ipWsXcYFAuXmN3bkQnfq
	yEwGOxFOmn0wzzIGkvs0ZsyFdbRq98BdK6t+ovH+DLXTWAGVdfSyPCbeWYOulSrxmnD56nZYww6IA
	D0gnY8nFB+kdpN9sLXmTlC3xYLCFkgX7KutxSMNA/Hp6SRuXeOex3J5RjzdaJrnlCxNmMHmTZ/76U
	fbHK+CN+cpR6QDIwW9OTur/GjgTFrPoArqkMp9AFK/aDbeK4MYqC7fO5BON4FeRLDbkxi9BfTgkyv
	jurWzfi3Os28XJcNNF6/5u3fk5Q2bMLvwmXAaZCJrFgCzj5EL5low6u0E2Wi+4+9rbyT+tXAsX19R
	JoY6+SzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt8go-0000000AazF-2iWz;
	Sun, 09 Aug 2026 18:56:06 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt8gm-0000000AayX-2YF6
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 18:56:05 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c20755e8295so217142866b.0
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 11:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786301762; cv=none;
        d=google.com; s=arc-20260327;
        b=We276Dd87+f2f32j8OEkCyR7eYRJH3Tp3cs9vbeYG9WPtB6gNpya6rUtGGpNKqrCtd
         34Px+Acq6zh/Ug3JQi59dOisydQeNYTjJcp8RZjQshGRcrN480VpnvPhPseZtD4NWU5W
         jodwXl8TTEoGdc2h52Fk2sVFDVWiShJIBu5HGi5E/OnipZ+AUT11vqVH4BDoIwBdsZ6z
         dA2NRDZU+Q8skon/vKjzNMsbbJ6lc1H1/zwxgFzqkqn2RDK5QaHHvqAH9EPr972aPF7u
         m2Adc363k37mUvs1788QslXmvgVo8CjW5MvVpaNfKuxs4mxlqCNa51OYV/O1vcF2kcHN
         hGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fKfWVbm9KpeTwL3/mVwrfju84PrObkxu9nWfkWUyNGM=;
        fh=+O0ctHGjiTyc6s3JvCmsWEEWz6GTDxlkLtSPYZEaZWw=;
        b=CBappYOv30ZaB2AdxzfMmyCaVBxAVzPHibPHnEzFk52Sic/Khb2GpoB8I6gd4KSrfG
         vKpxCMOC7qEuWkSP9gXfc99v5OvjyA6ZupVODT7ffcwD4j+iOtL97ZE98tziCV1SqIEm
         9tMvhGlDhziwOAtvlBXhsd/yK/DrZuhA5DyKzF8kw9ADKFfkxnGQT11wQfcqYZp61PNl
         4Wtancdi/4ydWjq/NYGO9rVu2jBNALylIVai1OfRz+XUFQPsbi46jrFqcb24jJVOgmkq
         k+VZr81cEI0MNE2tEkp8CZtQJzaHM7WRMKNzT5vVBGSSCg80zpZnUyFmIooHtRnUj4xa
         j9kQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786301762; x=1786906562; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKfWVbm9KpeTwL3/mVwrfju84PrObkxu9nWfkWUyNGM=;
        b=nIv2hoVtQRBv1NLX9uE0lcT2z/6+toMkHsotDN1ktaDwus7XIVMsgNpI7YCeR2hMGm
         WlT6PlECDtyq/Jc2uFE7GNdPFs7uNHT1JI+adWwzdybgNDVtgQ2GAzvgzfUr4cHPoCtI
         Iqzk+TbULXACJP6nwIJuOZiwLz7c/Ei5jXSUrBnQ/s1feeUYMkvOnDtJc3M/oxmBUAO9
         xcxnl+5buKryHj2ZNbR8Yg24x6FRu08xE10moNRI0m9OnooZcViirVQhFkPfNLMm2Ksl
         u0vCOVBwCT8/bbfOOM/28y6uGg4E6vunUX3FIiaNcaqgRgR/lN/3qA/nCNnFUvubKS3R
         FrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786301762; x=1786906562;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fKfWVbm9KpeTwL3/mVwrfju84PrObkxu9nWfkWUyNGM=;
        b=qnqPaLC+8rkNv23Nh4bW67cg6XUKQ2gslrP1SB1nw0wt3iNDXy+5X4MVbAwiDVQjnK
         CD5EomzW/aoa4AqUI7MMwhcjKdPFStGkkhOufxN3KRX6HMmjjTgpI64SSTvm/pEQliix
         Divs2i4WDwsYhM4IoCo/Wed9/C79ypoqrdRC7oYg32tiABS5x3d4sDWuuONa88uNGDZe
         PWXEXgNLalVHRatek/cHzkBvgSA/z6WTh5mR2xHSbxxecmNogfZcUM3BL1VlLR/tP1jj
         2hMMqO3wOvSlK+oT1KqmXYlXESsXN9fSKAxbo7jcFaJtHWEJ/fKkzKSxeQZGuBuPzAZT
         PnRQ==
X-Forwarded-Encrypted: i=1; AHgh+RoI0jfJ1e+hKyTF5LX7qh01IeBlZ8/Jxm8f3HQ9uownpR833Zxr/GhI1loC0K6u/7vO4ymSBfBkoAERl4QFpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGL6ffNr6bBj0pXUzx4khtQG2H3bF9Jciq4rl/Lxr31J52W7HQ
	Vi8gG1Tn25uDeKxc5lXIXPpG1g68EgBCxWkZrrZHsbiXw/oC/vSwUCi0hXEiu5QkAPyOOCcoksR
	R2IiL94dpi00y6ZqrFM9D50o6kGo3gQM=
X-Gm-Gg: AR+sD11ba7MdPAebrc4qqL1pbHs7kGY/3Lod3UUBmiY5MWBD0XE8S9Ymx/mpa6BAfVL
	q4JeW9GW8b/cwARo8rY4uoG3Y2Miw9QaQcQeo+Jmj2q3YSWGTTe5tIJLxieE5ogeFh+vplnPd+6
	AofLm82SBizrTzW20xWq1axSFtVcgfexEfZ5xYhMEhyn/bSPQtmURqJxi+pEj7r5FlgTNvK9vm2
	w/4YQWS0Zwc10V2OdAALdV9PN0RPTdnadztNHPU10iyyqu8uRW9BV9tw0davuYJFKT5O7kkIxr/
	XGJmrNBUThQ9+najO1jTbn45KcdsyZeq+j9u8A1rSwnDraJd55DmRlcE59UsPxFXZNrM2j8L/0k
	9f3vhRGMIRQ==
X-Received: by 2002:a17:907:962a:b0:c12:b58c:fd7a with SMTP id
 a640c23a62f3a-c208d4b5c1bmr643267266b.9.1786301762159; Sun, 09 Aug 2026
 11:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-4-l.scorcia@gmail.com>
 <aniv5B4jz07mI70D@buffalo-ssd> <0e4dfe8b-af67-4dcf-92fc-cd564d7c3744@roeck-us.net>
In-Reply-To: <0e4dfe8b-af67-4dcf-92fc-cd564d7c3744@roeck-us.net>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Sun, 9 Aug 2026 20:55:51 +0200
X-Gm-Features: AUfX_mw2G_pgmXXoJxjvv-8va564k6KXHRWKZyjeue4zkg_p1JWDElM0hRbQ6kQ
Message-ID: <CAORyz2+op80Tj1Ax1PD8wN9fAT5QfAev+vEPBgihvM0O-tWXPA@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] arm: dts: mediatek: mt6589: Enable toprgu reset controller
To: Guenter Roeck <linux@roeck-us.net>
Cc: Akari Tsuyukusa <akkun11.open@gmail.com>, linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_115604_687409_A5A0CBB4 
X-CRM114-Status: GOOD (  15.80  )
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

Hi,
I added his Signed-off tag as he provided basically this same patch in
a separate series [1] slightly before this submission and I wanted to
acknowledge his work. As far as I understand, this attribution is
within the guidelines.

[1] https://lore.kernel.org/linux-mediatek/20260716161923.266315-8-akkun11.open@gmail.com/

Il giorno dom 9 ago 2026 alle ore 19:49 Guenter Roeck
<linux@roeck-us.net> ha scritto:
>
> On 8/9/26 10:04, Akari Tsuyukusa wrote:
> > On Sun, Aug 09, 2026 at 06:03:27PM +0200, Luca Leonardo Scorcia wrote:
> >> Enable the toprgu reset controller feature for the mt6589 SoC. This
> >> allows generating reset signals for the 12 subsystems managed by its
> >> top reset generation unit.
> >>
> >> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> >> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> >> ---
> >>   arch/arm/boot/dts/mediatek/mt6589.dtsi | 2 ++
> >>   1 file changed, 2 insertions(+)
> >
> > I provided "Acked-by", not "Signed-off-by"...
> > https://lore.kernel.org/linux-mediatek/amEBgRmQktZ44jc1@buffalo-ssd/
> >
> > PS: I am also fine with this patch carrying my Signed-off-by.
> > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> >
>
> That is completely inappropriate and unacceptable. You are not in the
> Sign-off chain.
>
> Guenter
>


-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

