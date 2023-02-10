Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3D6C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 09:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JO1AgozF/Zya9WC0NgRmz45Iqf3MdEInH4N2K136jyM=; b=m1udBy4Q866bukYCbEaHsHVj68
	3a26lCmGi967LiVMW3d49eI2r42PVAKG0recGUdZlZT8Qr902UdHq4KSSoNjkT/a1runloNttXAUH
	kbhl0ObbRoRoQ0CAjqXZOqXHNV237POtm+4dGFBrMQ9Sxpey6QOQS3Eji8K235hmsdlNPHbLCzudN
	UaidxainGsEG819UnV5CXmmAcBdAuKZy6apOnsXKXHOJU6qL1fs8C5OppDNIdUFlkQZinAFF8mN+I
	FYkLkJf0IODr/JEHN+fZqmuWfJo1cqVg0soYcmPOk46V+KtobX3040BWjCTt8p4CfCxVrWwIX6kWE
	RnVXZx8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPQZ-004yAX-R8; Fri, 10 Feb 2023 09:10:43 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPQL-004y19-JD
	for linux-mediatek@lists.infradead.org; Fri, 10 Feb 2023 09:10:32 +0000
Received: by mail-ed1-x532.google.com with SMTP id q19so4206806edd.2
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Feb 2023 01:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JO1AgozF/Zya9WC0NgRmz45Iqf3MdEInH4N2K136jyM=;
        b=ZyFniiCCjmt9CvFd63F1Zj3IXNi4mNYXxXKEnzHLxPlFTMzNhXgAL3mcNuX5cYUWEW
         XLgUon3TpGuOxN5yFBKHZWe5rBLfxrjBjRkVxf8O9KheaOLF+XS9EoTuMNMEfPc1n0bG
         MDJvJGNT7D3w1/12SrGKArBX/1Vntjt1I19b1FyqOOW2athWYZaaYf/6UDVjWsYb0lTn
         YGVnI8UiVgl3HmOuryhDtX/pWrRHQJ9cfaT6GEsrsnD029W1HFFHZW9dhw34yvyh0u6u
         qEbrE6+qN40u0WDcfwsWEk26o50aD4BioUHqSaOaj+Aj7nKGSWgBi/xYTszNMgBq0sv1
         aJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JO1AgozF/Zya9WC0NgRmz45Iqf3MdEInH4N2K136jyM=;
        b=upWXAvKaC8voiaRe1oO/2L+HmucTm1rll9dZU2CdbXEl9XCOleTlUg7pylA5Y5BaHk
         XZAAhgXR54igH8TjtCvmP507llLdIWN11AMybCR7kgHK6l7ZMSqLodCGKoQ2dmf1PU+J
         DFmgdslvHYcuKfVs338lSRO0jzIMqJeKygubihhN48//qzepBdxbSFk5wfvl4rGiDjzi
         M9z3SzjJ/SYZlQr6eQ/iGv9sKarP0h5/RrakTiVlVNqjP7DcyG4H/y/MFJPwA+FIl26Z
         oMMa2AlBKXsB142+XlQbUsnBytTOaAnl3VUf9B0gFQ+8++tDqBEL1a4Q2TX4M4C8h9UM
         r0Sg==
X-Gm-Message-State: AO0yUKXshYJ9704NIutc9ScUzydNcKp+ZMSbkPS+iuINQgJ+oOh8t7nl
	ZUnoRwINsjE01ZpK/MUNsdcT3GwwwkiBObZ18F3J0g==
X-Google-Smtp-Source: AK7set+IPEknsk8g/iIkwkkIan5htfnLkZaV7RhcstO9zjt8469/p979SjeKGgF3Upg96TNj1/y34dRtZXAYJDOE77o=
X-Received: by 2002:a50:d7c1:0:b0:4ab:2517:ca8 with SMTP id
 m1-20020a50d7c1000000b004ab25170ca8mr791593edj.7.1676020227744; Fri, 10 Feb
 2023 01:10:27 -0800 (PST)
MIME-Version: 1.0
References: <20230209105628.50294-1-bchihi@baylibre.com> <20230209105628.50294-3-bchihi@baylibre.com>
 <167596964747.647630.15058465615417584783.robh@kernel.org>
In-Reply-To: <167596964747.647630.15058465615417584783.robh@kernel.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Fri, 10 Feb 2023 10:09:52 +0100
Message-ID: <CAGuA+oqjQPQoJOzXdNxO+831noyGmiLcvzG1sGv6SFkr92XFCg@mail.gmail.com>
Subject: Re: [PATCH v14 2/6] dt-bindings: thermal: mediatek: Add LVTS thermal controllers
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, khilman@baylibre.com, 
	rdunlap@infradead.org, daniel.lezcano@linaro.org, devicetree@vger.kernel.org, 
	p.zabel@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com, linux-pm@vger.kernel.org, rafael@kernel.org, 
	amitk@kernel.org, rui.zhang@intel.com, krzysztof.kozlowski+dt@linaro.org, 
	ye.xingchen@zte.com.cn, linux-kernel@vger.kernel.org, robh+dt@kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_011029_663503_3B99EB17 
X-CRM114-Status: GOOD (  10.06  )
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

Hi Rob,

On Thu, Feb 9, 2023 at 8:07 PM Rob Herring <robh@kernel.org> wrote:
>
>
> On Thu, 09 Feb 2023 11:56:24 +0100, bchihi@baylibre.com wrote:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > Add LVTS thermal controllers dt-binding definition for mt8192 and mt8195.
> >
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > ---
> >  .../thermal/mediatek,lvts-thermal.yaml        | 142 ++++++++++++++++++
> >  .../thermal/mediatek,lvts-thermal.h           |  19 +++
> >  2 files changed, 161 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> >  create mode 100644 include/dt-bindings/thermal/mediatek,lvts-thermal.h
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thank you for the review!

>

Best Regards,
Balsam

