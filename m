Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A5FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Cc:To
	:Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ngs2ArSHINdN7HFAwASbFD5WBQZlXmfDRuyax3LPwmI=; b=elYZmuxKeyTf2McMNKtAQadwel
	oWPvlk0AIoFOUtkH1DiJD0MIuClgTdgRw6jyPnFOGpt5Ov8E7P9M4O4TCfBkMDsJHQlr9yEhjMvHj
	iWvOcdnMlzrjoIjiMPoKR4qmSAGEDd7f2ConCytqwrHn35Xu6l/oPnLdPA7ubSkwm6b65xmZ7vFW2
	G5O73d1qmL0aHa2QoRuL53UXDI2LsJPuuMo96PozWn6hxLG+LzUL+UN4eRKDElVB8ay9XL7sogjGq
	odIgDz+gR087UzMfpn8o6eav2Nxv8OkCwIwVSzAClD7FTCA2CI8OFggupxVuAd4ENkJSg7Psx3xEW
	d3CoDYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrhjP-007j0N-Tu; Thu, 19 May 2022 15:06:27 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrgkf-007Ea2-KB; Thu, 19 May 2022 14:03:43 +0000
Received: by mail-ej1-x62b.google.com with SMTP id i19so10125110eja.11;
 Thu, 19 May 2022 07:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:message-id:in-reply-to:references
 :mime-version; bh=qWNcKlbHWt+buYUPc86j5JlNPnGvKXkUMAum0oQSfJ0=;
 b=LcE9bEgfBwTo+FP+bLoachNEfeucJ1OepYalzxu7uc6jEmRley8APjmdkai6m/XVAc
 Ya75wYu2NMpfUANb1K7kUDHYWCcXkmTEbT8b7eC6obk6nmJdBqKhFhrN0XlEGUOS38va
 4ldMm/u49lHcF+2IBH75a8sAghe0xurqgbWccyAqO4mLCKlrctVwIpqpzjLDyGQzcirk
 n7m5dGw5dWTOgBJbZYpl3B7KJMFjTe8NedjJ7o/o2Y1HzA1yOOepTTvUkxg1N4L8fNYZ
 ifLUQ4h2MYsaO+czOwRsRl85AqrCFL8vjJcLLAtxcS5VB2E6d1Yw/qOO6W6fRmbYAr3h
 YCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
 :references:mime-version;
 bh=qWNcKlbHWt+buYUPc86j5JlNPnGvKXkUMAum0oQSfJ0=;
 b=bPfnKP/dBvBh1EP5Tl/NvNKYDpwEcr6fMsgFK1+7TseMyuvsBY7yqCwR3hMHSVCwge
 QMf2KKha3Rn+GxLJwNWU3vfkhpYyvPI7fwc6qNdWoH0f6RC1pI3FKgBR4eSAX9QzIGa9
 jRsv2Qu8BYCW7L4E0D+zraEbqdpm968ECYGcVAJo9XyiEgXY9Wd+Ut+XNqZHaiefQxGw
 TRh+Gquy/sPzMszmeUhuBBvr/ZnY44q6xUXKfnGx0DH9+rG61NKoHDZrDjpr4wrijfOW
 UnIVtNyxYvKvUEfIS7YpdNVhn6HGMfBO62EgzmTaUxp1MRoOTPUDMj8b6fdw0P32QJMO
 7stw==
X-Gm-Message-State: AOAM530dKYJLJRpj4Sd3kwKJnX+uWG+S16giTkP9Mn1OMI0b8PrOlNcg
 bLR/HfoE7fB8kv/9GWmEnN8=
X-Google-Smtp-Source: ABdhPJyhieqoXKbfvsM8fh2dawCAGVx37vJQhD8YjDO0OoeyTXCFh58t3tmMrLP80r47m9bY8FV3oQ==
X-Received: by 2002:a17:907:7b85:b0:6fd:d799:ef4e with SMTP id
 ne5-20020a1709077b8500b006fdd799ef4emr4492401ejc.319.1652969017544; 
 Thu, 19 May 2022 07:03:37 -0700 (PDT)
Received: from [192.168.52.247] ([217.138.206.82])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a17090672cd00b006f3ef214e3esm2097890ejl.164.2022.05.19.07.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:03:37 -0700 (PDT)
Date: Thu, 19 May 2022 18:03:14 +0400
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH 0/6] clk: mediatek: Improvements to simple probe/remove
 and reset controller unregistration
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 =?iso-8859-1?q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Message-Id: <E1V4CR.LC9T17R2IY1M2@gmail.com>
In-Reply-To: <20220519134728.456643-1-y.oudjana@protonmail.com>
References: <20220519134728.456643-1-y.oudjana@protonmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_070341_734301_963B9BE1 
X-CRM114-Status: GOOD (  18.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, May 19 2022 at 17:47:22 +0400, Yassine Oudjana 
<yassine.oudjana@gmail.com> wrote:
> This series started as part of an earlier series adding support for 
> the main
> clock controllers on MediaTek MT6735[1]. It has since been split off 
> and
> expanded. It adds a new function to unregister a reset controller and 
> expands
> the mtk_clk_simple_probe/remove functions to support the main 5 types 
> of clocks:
> - PLLs		(new)
> - Fixed clocks	(new)
> - Fixed factors	(new)
> - Muxes		(new)
> - Gates		(supported previously)
> This should allow it to be used in most clock drivers, resulting in 
> reduced
> code duplication. It will be used in MT6735 clock drivers in the 
> upcoming v2
> of the MT6735 main clock controller series.
> 
> Dependencies:
> - clk: mediatek: Move to struct clk_hw provider APIs (series)
>   
> https://patchwork.kernel.org/project/linux-mediatek/cover/20220510104804.544597-1-wenst@chromium.org/
> - Cleanup MediaTek clk reset drivers and support MT8192/MT8195 
> (series)
>   
> https://patchwork.kernel.org/project/linux-mediatek/cover/20220503093856.22250-1-rex-bc.chen@mediatek.com/
> - Export required symbols to compile clk drivers as module (single 
> patch)
>   
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220518111652.223727-7-angelogioacchino.delregno@collabora.com/
> 
> Yassine Oudjana (6):
>   clk: mediatek: gate: Export mtk_clk_register_gates_with_dev
>   clk: mediatek: Use mtk_clk_register_gates_with_dev in simple probe
>   clk: mediatek: reset: Return reset data pointer on register
>   clk: mediatek: reset: Implement mtk_unregister_reset_controller() 
> API
>   clk: mediatek: Unregister reset controller on simple remove
>   clk: mediatek: Add support for other clock types in simple
>     probe/remove
> 
>  drivers/clk/mediatek/clk-gate.c   |   1 +
>  drivers/clk/mediatek/clk-mt8192.c |   7 +-
>  drivers/clk/mediatek/clk-mtk.c    | 123 
> +++++++++++++++++++++++++-----
>  drivers/clk/mediatek/clk-mtk.h    |  22 +++++-
>  drivers/clk/mediatek/reset.c      |  41 ++++++----
>  drivers/clk/mediatek/reset.h      |  20 +++--
>  6 files changed, 167 insertions(+), 47 deletions(-)
> 
> --
> 2.36.1
> 

Replying since there is a missing reference:

[1] 
https://patchwork.kernel.org/project/linux-clk/cover/20220504122601.335495-1-y.oudjana@protonmail.com/



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
