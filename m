Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFCEC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 06:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrpQaBNpbz5C7gEc30JXJD4ksBAoVukkRs4REF7J3cA=; b=z15GYfm12IPj3QF5WyLFgBA+fg
	pU7HW180cVIqHOGi8e5QWrLFzSXoQgAfv+2QzhBrDHREIQic21CZqxh7+0ziUq+lA9NYFRy//RpVI
	Q4/rDwg3i3bnFxcYlWTLcsR7c1B7HiJiqi/TWMqp1pAh+BBIEiannso5NvuYz2eTUMTNBU5g0GYgc
	3NsIa+Ne3J7GUMO9dr2evfl8Ip8P8EStlyQqr0rcuh/g0a12mQbPDz0ADe9qynpuEUqhDYJPxfgpC
	VkVLjJBKtxJd2haXMYFyQ0y5SknA2gBUJwVNTBL19TSTM7WJcvEacuhUSntbdJkmjqvGEnZOKgMkB
	Q30q7+ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB96d-006Xzt-QM; Fri, 30 Dec 2022 06:43:03 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB96U-006Xtv-91
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 06:42:56 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id m2so20454078vsv.9
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Dec 2022 22:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XrpQaBNpbz5C7gEc30JXJD4ksBAoVukkRs4REF7J3cA=;
        b=ieXRxqKlr8oyA7r8oWv5vNjeFdB1A3ZleV0nsNDeN+cCb+ZLeuFA5X93VFGh/jXSpy
         8vhLveMu+xVU3utEC/s5ogI75eX3T82AglX1Uu2BHmrdqEb5fqhkuelWB5l3GEOzeI0i
         GFlJcKDDe2AAgKzGmoaCY8hHz4nCxh5d6ERJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrpQaBNpbz5C7gEc30JXJD4ksBAoVukkRs4REF7J3cA=;
        b=Ozzqt+qDvXHfarFiX25RWyDv5FsD4QdfSgxv9PqhuFefGFj1i42OvaLKVYy7HHzWjL
         FMWcvW6h/LeyuL93DVVJS+1geImK4kDdpz6NPs2P55xVO41jml1hjMgUSHl7243gVMl+
         Qo0SdXM4ZUiq14Ghg1aqJ8P0iyFFuF6h4T5k1sMx1X0RTszdSbVjBDwd9o77o8rGPizI
         CmtM+Jz4Vzpd382QN+v9FcNo3EzNQ48lteNTwH8WmOWBcStYbizq1zanc8q+DWBj8rzU
         vCWdykbNfmxSCzD91EiKaVarDmpk8O7pvODqW6Bf5ea7os6qOIhndGSh6h1UzmM7xoRN
         ofiw==
X-Gm-Message-State: AFqh2kpBtO3tEI9LPEj/KvFAq1ADVum8Iny9pWTYdIQxFzljLtztlhVn
	xnhkAXG2jhkK92NJZWFkMMXO8VipW3PwIuZX5sSFUA==
X-Google-Smtp-Source: AMrXdXvrIUXju3J24bym43P+d+BGgTRL65FUNwwpDeRTxYGdxEQI/sLV9PJ9RkGhzNeKQ2VL0EKFXN2ejtTMxQEBC1c=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr2656935vsv.9.1672382570811; Thu, 29 Dec
 2022 22:42:50 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221230061309.16643-1-miles.chen@mediatek.com>
In-Reply-To: <20221230061309.16643-1-miles.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Dec 2022 14:42:39 +0800
Message-ID: <CAGXv+5HqLc2xsz6b_d5hrPiAu363aMcJkQrqX32ukA2pcsj6kQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/23] MediaTek clocks cleanups and improvements
To: Miles Chen <miles.chen@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com, chun-jie.chen@mediatek.com, 
	daniel@makrotopia.org, devicetree@vger.kernel.org, fparent@baylibre.com, 
	ikjn@chromium.org, johnson.wang@mediatek.com, jose.exposito89@gmail.com, 
	kernel@collabora.com, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, msp@baylibre.com, mturquette@baylibre.com, 
	nfraprado@collabora.com, pablo.sun@mediatek.com, rex-bc.chen@mediatek.com, 
	robh+dt@kernel.org, ryder.lee@kernel.org, sam.shih@mediatek.com, 
	sboyd@kernel.org, weiyi.lu@mediatek.com, y.oudjana@protonmail.com, 
	yangyingliang@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_224254_853951_C283FADA 
X-CRM114-Status: GOOD (  19.35  )
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

On Fri, Dec 30, 2022 at 2:13 PM Miles Chen <miles.chen@mediatek.com> wrote:
> > Changes in v2:
> >  - Moved dt-bindings CLK_DUMMY to clk-mtk.h instead
> >
> >
> > This series performs cleanups and improvements on MediaTek clock
> > drivers, greatly reducing code duplication (hence also reducing
> > kernel size).
> >
> > There would be a lot to say about it, but summarizing:
> >
> > * Propagates struct device where possible in order to introduce the
> >   possibility of using Runtime PM on clock drivers as needed,
> >   possibly enhancing reliability of some platforms (obviously, this
> >   will do nothing unless power-domains are added to devicetree);
> >
> > * Cleans up some duplicated clock(s) registration attempt(s): on
> >   some platforms the 26M fixed factor clock is registered early,
> >   but then upon platform_driver probe, an attempt to re-register
> >   that clock was performed;
> >
> > * Removes some early clock registration where possible, moving
> >   everything to platform_driver clock probe;
> >
> > * Breaks down the big MT8173 clock driver in multiple ones, as it's
> >   already done with the others, cleans it up and adds possibility
> >   possibility to compile non-boot-critical clock drivers (for 8173)
> >   as modules;
> >
> > * Extends the common mtk_clk_simple_probe() function to be able to
> >   register multiple MediaTek clock types;
> >
> > * Removes duplicated [...]_probe functions from multiple MediaTek SoC
> >   clock drivers, migrating almost everything to the common functions
> >   mtk_clk_simple_probe();
> >
> > * Adds a .remove() callback, pointing to the common mtk_clk_simple_remove()
> >   function to all clock drivers that were migrated to the common probe;
> >
> > * Some more spare cleanups here and there.
> >
> > All of this was manually tested on various Chromebooks (with different MTK
> > SoCs) and no regression was detected.
> >
> > Cheers!
>
> I tested this v2 series on mt6779 and mt8192 without any problem.

Please give Tested-by. :)

