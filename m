Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4AEC19F32
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Mar 2025 04:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2lcpX+IlnKiqGflIhoKQBvRKuXdx1/MDcNs/9JevPw=; b=EMdncjLFkbNCfd9/CmEPtDT6Vl
	TUSq4s1FDZKBzAAt9/yFo5Dffy8JxivrPAtD8Fjobb2rVZQhAmHHGERhGjdNOoCngmSUwVGu9lHmi
	Vn2ceOoCo8x8lB0vHZ1dbc2viXHbmce3iFGI7evCQsn4l/oB/V4hWLAE1Z67bBEgyVZjVfuM3t1qe
	t4Ixb3ZG3XC6wSehru0+/16A/VbrYuDsbRut1OR4aUCXivHq0B/nik4ONZ7ZHK4pYeRgslBJqV+Q+
	See5DlT1874stU7YFTwqA6LCp3yONGMaOzQ9E/PE4oZc1aKpfpF2+xOJJ6uQxdUeiKGmt6qq8TS4q
	nE19Q2Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqPa6-0000000D9F8-1Doy;
	Fri, 07 Mar 2025 04:45:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqP8P-0000000D668-0ulf;
	Fri, 07 Mar 2025 04:16:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87A8EA45181;
	Fri,  7 Mar 2025 04:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFD3C4CED1;
	Fri,  7 Mar 2025 04:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741320987;
	bh=ajKfc7gigb87SKdIwwoyRysY03B56hMMZRp8G59YjxI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=CL8qtgn4sJhzjtBviEMGu4ppipSMtJP1w4YUcCjeddS/TRxWje5+TJIy3dXVaUI6A
	 u5aFCJGR3DzAofl6XVgrJDurLXP0fkkO5TTHU8VlztHuKM3SnugeseRfiprGsKPt1F
	 eCHE+DV/OdEbO0DNd0r4S0wjHRkpL2+J66I0jkFNx35ap50y+r1uZTWtaVKHQCuMp/
	 q0K9I1KC1M0XV2CIWBY9Rx8yXkC18p9jUmC8GgN88p8mByq379KjmUD35A/7QVupeb
	 iLJ7UW5iJEAlTK3uebsBOKmYokopK1R3yHgo7M2n3WZJD/HSLz3aifEIMGKMQZ5oLT
	 0jFmn7DGsrUlg==
Date: Thu, 06 Mar 2025 22:16:26 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
To: Guangjie Song <guangjie.song@mediatek.com>
In-Reply-To: <20250307032942.10447-7-guangjie.song@mediatek.com>
References: <20250307032942.10447-1-guangjie.song@mediatek.com>
 <20250307032942.10447-7-guangjie.song@mediatek.com>
Message-Id: <174132098632.2770289.10803747794522136743.robh@kernel.org>
Subject: Re: [PATCH 06/26] dt-bindings: clock: mediatek: Add new MT8196
 clock
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_201629_342915_FB10C5C3 
X-CRM114-Status: GOOD (  10.16  )
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


On Fri, 07 Mar 2025 11:27:02 +0800, Guangjie Song wrote:
> Add the new binding documentation for system clock and functional clock
> on Mediatek MT8196.
> 
> Signed-off-by: Guangjie Song <guangjie.song@mediatek.com>
> ---
>  .../bindings/clock/mediatek,mt8196-clock.yaml |   66 +
>  .../clock/mediatek,mt8196-sys-clock.yaml      |   63 +
>  include/dt-bindings/clock/mt8196-clk.h        | 1503 +++++++++++++++++
>  3 files changed, 1632 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8196-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.yaml
>  create mode 100644 include/dt-bindings/clock/mt8196-clk.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.example.dtb: clock-controller@10000800: reg: [[0, 268437504], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250307032942.10447-7-guangjie.song@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


