Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276EFC43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 08:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lk5MPhn0CyinDmwrb6nwbsmO48XP+LjkhP+k9n9Fcps=; b=ehYaJn7wi/f4ypkHMa+SzD9c5a
	dtNbwLwHqipu4U2kACeX0JKGDrtnPgmuoVsqfIwK8WND+BtSKHWONk72zBm9IXhhyjbIfiMRy8wMJ
	lSBwlxRP+EzEcxyIKiVYpucy7m8beLVCTrWnV22Zr0vuQGLf4HeoIS8mmFiXUZsszfcS9b56CD1RY
	8jpKgGULRp7qh/fy1gryuIhuEcq7oteB+uKSXx6Wrh76U1CbLX4EXy4snLX7xTvtYdv7rtZm20zou
	3SOKt5qpZLsxoB7Ao5f1lbUGCXIRBlGK4+vluo+LYllePouljKeTlRJT/KGidzHucnx46XaH+OkDd
	/U2zGDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fMj-0065fq-BW; Thu, 01 Dec 2022 08:56:21 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fMh-0065dh-7l
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 08:56:20 +0000
Received: by mail-vs1-xe32.google.com with SMTP id g65so880223vsc.11
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 00:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lk5MPhn0CyinDmwrb6nwbsmO48XP+LjkhP+k9n9Fcps=;
        b=IaPnOYrtEU5ugaHonkNjPY3SKoPQRP0UDXUd0bz70mdsqdf5Cfz1vOukaEsvFe/OVw
         u0ZzUsuP0XdE7y5GJj+Uqx+OT1+1fNJd/TB1nEo3L/wWbae+DVc6/ASj/Vjpry/2A6nl
         OXBFmV58hXRVW8HHEuc6KAktXRH+g9c5UYfVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lk5MPhn0CyinDmwrb6nwbsmO48XP+LjkhP+k9n9Fcps=;
        b=N7RAi47f2uCAXcev5uij1VzxEVHKWTMizr9DfnlLOaWm6mhqEHSDtiJpiRoKR+/foC
         wVOCMjLi8zc932cvDKY/8MbvSueENAbs0nG7fJzKGYIv3tb2oAtjcJqXG6cPfXzOhKky
         Y65yVoQu0dUuDB6XG948qnjVgT/Ps6pgtPTmNxNfEDK9Nk1m73DKqxKbnO8/7gcDLWg3
         QH6iUk939+cfZvaG559VTRxj2NyqO1gukyh01YXW+5704WiwEbo0lA89C7Oa9+ffnK11
         +ZqsfW7azMVl6HBHu1QQcbIR+z1g6T2VkXI1kC3r9NvHbOwqp+sAVTpc2TFGPbv/zJZJ
         2XjA==
X-Gm-Message-State: ANoB5plKtg8894LN8CzvtebfQnmqX8jg43yhybc5OARAnbdDdrcoa3B/
	dVQoNGXPOF+1sugtouc0GD3zjSzkGsxJm8/jMBUiVA==
X-Google-Smtp-Source: AA0mqf6zTU3Ioqgl4/U57LTo9n7P+kL6p/D8JBOWTZMFr5NC17aGV0O7ANxrIhs37CKnfz5cNOELbyalAE1ZP8QP8WQ=
X-Received: by 2002:a05:6102:e0c:b0:3b0:6da7:39ba with SMTP id
 o12-20020a0561020e0c00b003b06da739bamr24409177vst.26.1669884974559; Thu, 01
 Dec 2022 00:56:14 -0800 (PST)
MIME-Version: 1.0
References: <20221130031741.3176853-1-wenst@chromium.org> <2ec80bd8-dfef-d2e6-eb41-6e6088043e33@collabora.com>
In-Reply-To: <2ec80bd8-dfef-d2e6-eb41-6e6088043e33@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Dec 2022 16:56:03 +0800
Message-ID: <CAGXv+5E=X_hwg76=B_jqWrpieo8bR-=r8NLbNz2=JzE=kBwMWQ@mail.gmail.com>
Subject: Re: [PATCH resend] arm64: dts: mediatek: mt8192: Mark scp_adsp clock
 as broken
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_005619_347268_67102571 
X-CRM114-Status: GOOD (  20.73  )
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

On Wed, Nov 30, 2022 at 7:10 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 30/11/22 04:17, Chen-Yu Tsai ha scritto:
> > The scp_adsp clock controller is under the SCP_ADSP power domain. This
> > power domain is currently not supported nor defined.
> >
> > Mark the clock controller as broken for now, to avoid the system from
> > trying to access it, and causing the CPU or bus to stall.
> >
> > Fixes: 5d2b897bc6f5 ("arm64: dts: mediatek: Add mt8192 clock controllers")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> ....or we can add the ADSP power domain to actually fix this properly, which looks
> like being a generally good idea :-)

Sure, but that and any driver changes have to be backported, or anything
touching the clocks will still break the system.

There's no reason we can't have both. I think having this one merged and
backported to stable first, then adding the SCP_ADSP power domain, and tying
it to the clock controller as a follow up addition works best.

What do you think?

ChenYu

> Allen, can you please take care of that?
>
> Thank you,
> Angelo
>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 6b20376191a7..ef91941848ae 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -575,6 +575,8 @@ scp_adsp: clock-controller@10720000 {
> >                       compatible = "mediatek,mt8192-scp_adsp";
> >                       reg = <0 0x10720000 0 0x1000>;
> >                       #clock-cells = <1>;
> > +                     /* power domain dependency not upstreamed */
> > +                     status = "broken";
> >               };
> >
> >               uart0: serial@11002000 {
> >
>

