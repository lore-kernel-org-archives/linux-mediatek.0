Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670CEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 10:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjmlCUH8BC/z7526c9BSfdqbEzI1xNWjWAJ9dT8PhfQ=; b=K0XH9Hr7kcJDJf
	VC9kSWbu84D4iegFi9pZ1OkTkmTV5KYGwrE4VReLliq1HFUFFK+GmI031LbqsAYjLS/knu15X25NM
	xYFZ35FZu9Ye1nWXY0SpUnSGQJZa/kGO/h+bSHurGYYwGA5aPVOqDX5HLkcyonbND7dyJdPCK3LOL
	FizRQD/LFN2hxpE2Cnla1iYHnX7UlaSbmVnBvpuyZdqGe9CBFatHaaNcZYkUug3ENKqKPblreSC0Q
	WGotxnejNpL5ZAjfAuk8JBOABxnTOLxn/OlFa17Cnigj+VRIaZl3DoQRp58t6D3EmSly3pf8zosMu
	9Dh+b0sief1q9SGJ2npQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmvJ7-002jm0-7b; Fri, 06 May 2022 10:35:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmvJ4-002jkW-GT; Fri, 06 May 2022 10:35:32 +0000
X-UUID: d2231dc3b7e24f24b5071850f8e50f1d-20220506
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:ed62d4c1-61cd-4007-88a2-8bb208f962fc, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:5970d6b2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: d2231dc3b7e24f24b5071850f8e50f1d-20220506
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1022230282; Fri, 06 May 2022 03:35:24 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 03:25:22 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 18:25:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 May 2022 18:25:20 +0800
Message-ID: <21767265818ad000f3bfea576d26b919347126c2.camel@mediatek.com>
Subject: Re: [PATCH V5 00/16] Cleanup MediaTek clk reset drivers and support
 MT8192/MT8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
 <sboyd@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, Chun-Jie Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=B5=9A=E6=A1=80=29?= <Chun-Jie.Chen@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>, Runyang Chen
 =?UTF-8?Q?=28=E9=99=88=E6=B6=A6=E6=B4=8B=29?= <Runyang.Chen@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 6 May 2022 18:25:20 +0800
In-Reply-To: <20220428115620.13512-1-rex-bc.chen@mediatek.com>
References: <20220428115620.13512-1-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_033530_586511_241E228C 
X-CRM114-Status: GOOD (  22.18  )
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

On Thu, 2022-04-28 at 19:56 +0800, Rex-BC Chen wrote:
> In this series, we cleanup MediaTek clock reset drivers in
> clk/mediatek
> folder. MediaTek clock reset driver is used to provide reset control
> of modules controlled in clk, like infra_ao.
> 
> Changes for V5:
> 1. Add all infra reset bits for MT8192 and MT8195.
> 2. Fix reviewers' comments.
> 
> Changes for V4:
> 1. Abandon the implementation of reset-cell = 2, and use reset index
> to
>    determine which reset bit is used.
> 2. Add documentation for enum/structure/function in reset.h.
> 3. Combine binding/drvier support patch for MT8192 and MT8195.
> 4. The MT8195 DTS is accepted by Matthias, and I add new DTS patch to
>    support infracfg_ao reset for MT8195. The DTS of MT8195 is still
>    not merged into mainline. Please refer to [1].
> 
> [1]: 
> https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=for-next&id=37f2582883be7218dc69f9af135959a8e93de223
> 
> Changes for V3:
> 1. Modify drivers for reviewers' comments.
> 2. Add dt-binding patch for MT8192/MT8195 infra.
> 3. Add reset property of infra node for MT8192.
> 4. Use original function for simple operation.
> 
> Changes for V2:
> 1. Modify drivers for reviewers' comments.
> 2. Use simple reset to replace v1.
> 3. Recover v2 to set_clr.
> 4. Separate error handling to another patch.
> 5. Add support for input offset and bit from DT.
> 6. Add support for MT8192 and MT8195.
> 
> Rex-BC Chen (16):
>   clk: mediatek: reset: Add reset.h
>   clk: mediatek: reset: Fix written reset bit offset
>   clk: mediatek: reset: Refine and reorder functions in reset.c
>   clk: mediatek: reset: Extract common drivers to update function
>   clk: mediatek: reset: Merge and revise reset register function
>   clk: mediatek: reset: Revise structure to control reset register
>   clk: mediatek: reset: Support nonsequence base offsets of reset
> registers
>   clk: mediatek: reset: Change return type for clock reset register
> function
>   clk: mediatek: reset: Add new register reset function with device
>   clk: mediatek: reset: Add reset support for simple probe
>   dt-bindings: arm: mediatek: Add #reset-cells property for
> MT8192/MT8195
>   dt-bindings: reset: mediatek: Add infra_ao reset bit for MT8195
>   dt-bindings: reset: mediatek: Add infra_ao reset bit for MT8192
>   clk: mediatek: reset: Add infra_ao reset support for MT8192/MT8195
>   arm64: dts: mediatek: Add infra #reset-cells property for MT8192
>   arm64: dts: mediatek: Add infra #reset-cells property for MT8195
> 
>  .../mediatek/mediatek,mt8192-sys-clock.yaml   |   3 +
>  .../mediatek/mediatek,mt8195-sys-clock.yaml   |   3 +
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi      |   1 +
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  13 +-
>  drivers/clk/mediatek/clk-mt2701-eth.c         |  10 +-
>  drivers/clk/mediatek/clk-mt2701-g3d.c         |  10 +-
>  drivers/clk/mediatek/clk-mt2701-hif.c         |  10 +-
>  drivers/clk/mediatek/clk-mt2701.c             |  22 ++-
>  drivers/clk/mediatek/clk-mt2712.c             |  22 ++-
>  drivers/clk/mediatek/clk-mt7622-eth.c         |  10 +-
>  drivers/clk/mediatek/clk-mt7622-hif.c         |  12 +-
>  drivers/clk/mediatek/clk-mt7622.c             |  22 ++-
>  drivers/clk/mediatek/clk-mt7629-eth.c         |  10 +-
>  drivers/clk/mediatek/clk-mt7629-hif.c         |  12 +-
>  drivers/clk/mediatek/clk-mt8135.c             |  22 ++-
>  drivers/clk/mediatek/clk-mt8173.c             |  22 ++-
>  drivers/clk/mediatek/clk-mt8183.c             |  18 +-
>  drivers/clk/mediatek/clk-mt8192.c             |  18 ++
>  drivers/clk/mediatek/clk-mt8195-infra_ao.c    |  15 ++
>  drivers/clk/mediatek/clk-mtk.c                |   7 +
>  drivers/clk/mediatek/clk-mtk.h                |   9 +-
>  drivers/clk/mediatek/reset.c                  | 172 ++++++++++++--
> ----
>  drivers/clk/mediatek/reset.h                  |  77 ++++++++
>  include/dt-bindings/reset/mt8192-resets.h     | 163
> +++++++++++++++++
>  include/dt-bindings/reset/mt8195-resets.h     | 170
> +++++++++++++++++
>  25 files changed, 759 insertions(+), 94 deletions(-)
>  create mode 100644 drivers/clk/mediatek/reset.h
> 
> -- 
> 2.18.0
> 

Hello Stephen and Michael,

Could you spare some time to give us some suggestion?
Patches of this series are all reviewed.

Many thanks!

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
