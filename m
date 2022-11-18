Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329F0C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 19:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9pF5mpVc3B6b5fPqNSwwVAKIqb3BcTax6YAV4Xry14=; b=q6pS08WtY7EwIOYMUtX9GIR3F8
	TQ+mNxTK3NxsqZ/70EJSp+ldSMc45nobbiOqjnP3bEiWo2FlVz3G4jiWkSadBOBjrK0yE5ou9+XMM
	BzsrdYuRAbKTIpO5l8hy0GA8DVmfiM971dM09vrMCI8yNx5TT8LG1KLlVDEnsbq5INdiexk8N9Bys
	4C5F8FqEnetupnL2mIyGO/A7bFgOY30Suo7XTdlx2lGnhsxkzBaY7ZAbuArMhpdyi441E8c9KBw09
	50dWrqX2AoWIZQN+W0gwoMwhCeCx7AihWb6rTHO9LbDhwD2DT2OrCxuoJlw9VZtKwHpnPQjO8fsKz
	MidvM2Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow7U9-007maH-18; Fri, 18 Nov 2022 19:57:13 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow7Pe-007k1h-43
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 19:52:37 +0000
Received: by mail-pj1-x102b.google.com with SMTP id h14so5387329pjv.4
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Nov 2022 11:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9pF5mpVc3B6b5fPqNSwwVAKIqb3BcTax6YAV4Xry14=;
        b=qNg0CIGaljUFzhEfI4vH3ilp1WNLxwEYLuLTg2/nDaXyF8RtJ5J3fgSt4pPrMuPHR/
         3fX9ZMJkyKJ1L7i9ZYga96hfG9qF/5dKmouAS75cDgAltrEShqqjpKRVJBjeWrGs84s8
         zb2FOwrJSVJdoIW3D6bJ254XqCIvEAc84niDnr+CWTj59FHI1er80f1dLbL+G2DnlM01
         dWAtjzn1xEu0sLWlhAdPV677CD6o87LRCx83oGwqmm0HmYSjMRKkbki5Q/xWGpUob1r2
         tm7wTT5W2DjIlJv37BC3hQ22uIsDDggSkg9opQG56JJeDw+vQFmGP6MRbPfDpWt9X/ZL
         23WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9pF5mpVc3B6b5fPqNSwwVAKIqb3BcTax6YAV4Xry14=;
        b=KoxjCvzozeU/Nj3netD3fJCLtp6AdhP0aZyajK9QmiRhyJ9FVOATU6f9mI6kZ/ooQ3
         2OAvcloIWEOJB4JphD99vpzU/bwi610Clpc/8SDYym1HtVD79PjGiMKMJlTG4FiT8TQk
         PF/DbfJEPWi7uGvLLHvq/UCDPdkhjmMPNaWCt3GINoXyS4lqR4eOaeCwikNKAnLROdea
         PBjzJPQviHGqidWxI+dDO1NPjoZ8oKzS0gCx1uARIeOqosagCK5EC4KkpJCm7zRNsqi6
         kGEUlS+Awyn/r3AHSYbXp0bNmXNL+1OtI1Q63OX/jMXS2Qsh2cmGdAZPzt4sgdvj5yA1
         fXiQ==
X-Gm-Message-State: ANoB5pkGR5nCht8MLHHdTJkS6XbTp4NYI9BxZvVVrCphIshvN3gj9UAj
	NINrAxCnGPYYgg/bV+ZjgOBETQ==
X-Google-Smtp-Source: AA0mqf7FWoYKybRn5fseRjhUf3xjBQFYjHdmdctR3NDS0M1rjX+qWJeY5s1nwX21Y9ulybgSC9iwJw==
X-Received: by 2002:a17:902:ebc1:b0:176:a6c5:20c9 with SMTP id p1-20020a170902ebc100b00176a6c520c9mr1028458plg.57.1668801151469;
        Fri, 18 Nov 2022 11:52:31 -0800 (PST)
Received: from localhost ([75.172.139.56])
        by smtp.gmail.com with ESMTPSA id w10-20020a63160a000000b00473c36ea150sm3106891pgl.92.2022.11.18.11.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 11:52:30 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bernhard
 =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogiocchino.delregno@collabora.com
Subject: Re: [PATCH v3 4/7] dt-bindings: pinctrl: add bindings for Mediatek
 MT8365 SoC
In-Reply-To: <06e916b7-f8f2-6de5-f86e-7b020c052451@linaro.org>
References: <20221117210356.3178578-1-bero@baylibre.com>
 <20221117210356.3178578-5-bero@baylibre.com>
 <06e916b7-f8f2-6de5-f86e-7b020c052451@linaro.org>
Date: Fri, 18 Nov 2022 11:52:30 -0800
Message-ID: <7ha64o9h1d.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_115234_400399_4767E5CB 
X-CRM114-Status: GOOD (  15.05  )
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

Hi Krzysztof,

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> On 17/11/2022 22:03, Bernhard Rosenkr=C3=A4nzer wrote:
>> Add devicetree bindings for Mediatek MT8365 pinctrl driver.
>>=20
>> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>
>
> Thank you for your patch. There is something to discuss/improve.
>
>> +
>> +  pins-are-numbered:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description: |
>> +      Specify the subnodes are using numbered pinmux to specify pins.
>
> Why would you name pins differently per board? And why this different
> naming of the same pins is a property of hardware?
>
> This looks like something to drop.

Yeah, having this as a flag kind of implies that this could be present
for some boards but not others.  But in practice, the driver requires it
to be present or just fails[1].  What's the right way to describe that?
We're just trying to add a binding that reflects the existing driver.

We also noticed that there's another documented binding with this
same flag[2] where similiarily, the driver simply requires it to be
present[2].

So is the way this flag is documented in the stm32 binding OK for the
mediatek one also?  If not, what would you suggest?

Thanks for the review,

Kevin

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/pinctrl/mediatek/pinctrl-mtk-common.c#n1053
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml#n37
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/pinctrl/stm32/pinctrl-stm32.c#n1499


