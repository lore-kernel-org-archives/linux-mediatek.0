Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF6AC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Dec 2022 13:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7lyfBuWeSNrAyCwcg9wzU9pJA5ycM/kWnTIeANWKgU=; b=l5JMS5swMuUBm2rEMjJZ/cUf3B
	XawwprPSxYzeQJiBnH/yuz64lWDDBv5DuzcuvKrnYYH2pSGXeRRKqc2gzttqb1qmyXu78Iurb7z4/
	bQRIub0fM/vycgA36QBcfeHAEDZwumIXOQJK8TMZgz8vKB/AUJsjov6d4gzhAD0YEsKygLpsV6/ye
	9Skys9cCqVj8HJhCNJpA2xMc8gEYtq+b792qpy5b5fKDWxaJp8B9wE2jCSfuAcdmgZVAAfrvkvzW/
	dYsHaug2wwM6CdNE88x8JdY0t+0PGoCwxPsYC6slbvGFysbAAvVa/KVh7pN84WSQfY9svPmXXq1To
	6SOOKdHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7GS4-00EEgN-GT; Mon, 19 Dec 2022 13:45:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7GRg-00EEJ1-T3; Mon, 19 Dec 2022 13:44:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 497F9B80D88;
	Mon, 19 Dec 2022 13:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722FFC43392;
	Mon, 19 Dec 2022 13:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671457477;
	bh=8DEgaFyMiCI3pSsPns5LyeczUD+tuBdDkZplPN5MN3w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KcJTAvDOgM0317Zd/7NS68fk1vL2OhbuCdZsh3KXYOdLv37PS/qvzQrl1IElfIMde
	 uyIbgGGtIn1f1JQi5upRyoyPde3NJ+X/NApt/CcAsBKcK4xDKTM/6NxNJDhiU0wHId
	 gWNgRfIxDZSwZd932a6bs0r4Dpagjn14d3CtqJObUVDAeOjhbbgOsgkJsKIhD+pyat
	 kirGWt5XiwM1BggeeLvovsA3atyRXN2v9umAuIORaEzgtvAiq9gkxmk6GBbOG8jdzH
	 K6lfmisgPbLjUEyjjxQzgzEZBqWbEpia3l83j0Zv3H0ALhlhhNeZs4uGYQqrqtC65R
	 lO4Ai5kTNbl/A==
Received: by mail-ua1-f52.google.com with SMTP id s25so2084069uac.2;
        Mon, 19 Dec 2022 05:44:37 -0800 (PST)
X-Gm-Message-State: ANoB5plAsrb+JwH9GhI9ZkEfsWutPrLonvExg8huur7ilRaXP0MkvV/F
	I88IZJlFtURjQK2QNC/Zdb7+6G/HAH/TPmzOYw==
X-Google-Smtp-Source: AA0mqf6LC1L0ban3MuhHS7gUmnouWiwkw8y6mxyOu/PDQgiPs+tMBZ2XJgfnpdm8nKWdWQUXjnc8n7jH7ilawhRzDAE=
X-Received: by 2002:ab0:3a96:0:b0:419:678:cf31 with SMTP id
 r22-20020ab03a96000000b004190678cf31mr38454625uaw.63.1671457476346; Mon, 19
 Dec 2022 05:44:36 -0800 (PST)
MIME-Version: 1.0
References: <20221207094921.15450-1-moudy.ho@mediatek.com> <20221207094921.15450-2-moudy.ho@mediatek.com>
In-Reply-To: <20221207094921.15450-2-moudy.ho@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 19 Dec 2022 07:44:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKdaVmGKSwR0yiYGKc6Kp6jki632GA6CBOOjGzUmvSRWA@mail.gmail.com>
Message-ID: <CAL_JsqKdaVmGKSwR0yiYGKc6Kp6jki632GA6CBOOjGzUmvSRWA@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] dt-bindings: arm: mediatek: mmsys: Add support for
 MT8195 VPPSYS
To: Moudy Ho <moudy.ho@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_054445_293007_EE848D20 
X-CRM114-Status: GOOD (  14.20  )
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

On Wed, Dec 7, 2022 at 3:49 AM Moudy Ho <moudy.ho@mediatek.com> wrote:
>
> For MT8195, VPPSYS0 and VPPSYS1 are 2 display pipes with
> hardware differences in power domains, clocks and subsystem counts,
> which should be determined by compatible names.
>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml     | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

This landed in today's linux-next causing the following binding
warnings. Is this a fix? Only fixes for 6.2 should be added during the
merge window.

/builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.example.dtb:
clock-controller@14000000: $nodename:0: 'clock-controller@14000000'
does not match '^syscon@[0-9a-f]+$'
        From schema:
/builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.example.dtb:
clock-controller@14000000: compatible: 'oneOf' conditional failed, one
must be fixed:
        ['mediatek,mt8195-vppsys0'] is too short
        'mediatek,mt8195-vppsys0' is not one of
['mediatek,mt2701-mmsys', 'mediatek,mt2712-mmsys',
'mediatek,mt6765-mmsys', 'mediatek,mt6779-mmsys',
'mediatek,mt6795-mmsys', 'mediatek,mt6797-mmsys',
'mediatek,mt8167-mmsys', 'mediatek,mt8173-mmsys',
'mediatek,mt8183-mmsys', 'mediatek,mt8186-mmsys',
'mediatek,mt8188-vdosys0', 'mediatek,mt8192-mmsys',
'mediatek,mt8365-mmsys']
        'mediatek,mt8195-mmsys' was expected
        'mediatek,mt7623-mmsys' was expected
        From schema:
/builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml

