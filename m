Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65220CF31A9
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 09:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVn/KurR8MY/RIldL7Em7rZPWlFY3kF2+adiMu1A/Mw=; b=th5NWSeb0A3dy5M3BZIvnRh3vY
	F/dTwFQggZvT7RRmG6zu6B1058gAHZAiAYyU4T1QhqzPQM2Ukbwf1bqImPdUqTGcBgKFYgfO9QHdR
	di+HfjrCBvrvskuSYGdDO9Mbytxs0D4y3ka4FoyUsya/eP5l1NihN5Do4YEny7eLT7Dsr8meTAcXi
	nGY9AgO8oo85Qf0x2UZjIWeT8mllreBVHmD3BEdn4TXoxH+E7ikXOismTCDn2jU7j3Wblma+oRksg
	a0v2rX1UYUeiRQwl0zGNdZqIiRGavuJrIGqUmXxojvdaWm2I8o3ga/NFH8aEEoIi9N9HongStgj2b
	3iDVjJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svvo2-00000005MiA-1xDL;
	Wed, 02 Oct 2024 09:38:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svvje-00000005LeK-2fCP;
	Wed, 02 Oct 2024 09:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727861609;
	bh=njMg/9RI1rTkCGQDwWauI7hP2kFYOcqvpE1iClQ224M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kLqObsbjFwS3kY6Nc6E0IPIIAOHgFf10svfRZIS/xyS+ycUcrWhUfaVjIv4jOKu/R
	 dQ8UjzMpzv7T8bQKCHZbWZpfEHu1DkPNoHmNk21HdrSnNctsM0amLlWcfcj98QTS/x
	 1iXNqP0knFJQsHYd4Uw7kthQALxeTKHFBTxlN2bNHMGkaKTXPYitGdF56vNO4mohOa
	 xUlgCub9uJbaM3OGd2WN0jZqs6C5F9knxB9I3pH+F3IaW1U5FaaLSF+IN6ZSeGCdRX
	 DT4cE3xW9UNMvhcqVxNze+9mKdc8hZe97QoAbelEJWnKq+c6u5cHV2Z2VhSczjV/gm
	 gUBRmv0XA32SQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0398217E120B;
	Wed,  2 Oct 2024 11:33:27 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Rohit Agarwal <rohiagar@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, 
 Chris-qj chen <chris-qj.chen@mediatek.com>, 
 MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
In-Reply-To: <20241002051620.2050-1-macpaul.lin@mediatek.com>
References: <20241002051620.2050-1-macpaul.lin@mediatek.com>
Subject: Re: (subset) [PATCH v5 1/5] arm64: dts: mt8195: Fix dtbs_check
 error for infracfg_ao node
Message-Id: <172786160795.39477.6513480009726463898.b4-ty@collabora.com>
Date: Wed, 02 Oct 2024 11:33:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_023330_876225_4968F758 
X-CRM114-Status: UNSURE (   7.02  )
X-CRM114-Notice: Please train this message.
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

On Wed, 02 Oct 2024 13:16:16 +0800, Macpaul Lin wrote:
> The infracfg_ao node in mt8195.dtsi was causing a dtbs_check error.
> The error message was:
> 
> syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon',
>                  'simple-mfd'] is too long
> 
> To resolve this, remove 'simple-mfd' from the 'compatible' property of the
> infracfg_ao node.
> 
> [...]

Applied to v6.12-next/dts64, thanks!

[1/5] arm64: dts: mt8195: Fix dtbs_check error for infracfg_ao node
      https://git.kernel.org/mediatek/c/c14ab45f

Cheers,
Angelo



