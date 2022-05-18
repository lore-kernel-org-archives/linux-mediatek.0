Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA122C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 10:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vQNSOnR7Mwo24KHHc9gKbPrGYNfSUQkQ2OHh7PTLiBU=; b=hUbeSfnEOJBDqR
	N6ni5YdcLtqcqpvx0D8GMnrMhYy7Ztd/l+MvhLvr9uI2yaZHQfkJj21DqVADUAUqVwdQUACryrm1R
	J0HXg17v9umLfPUY3ulkeBIoXZz2P7MZmTP19HvPsr9oJ2ZMZ4zmu4YVsoueaCC9FoNJ16wGUPIbV
	unzdeWoEkPuVK1Jq6zIrCEVDg8SGsjWGJMiudruxsE1c0mvEhooBbJ+YHjomv21NLT6iId5MSKLVz
	HC5OYb58Lk52wLyNVMlxpVKPQCWq8dn6IL//J9XRRMHfYpSuu3Lg5HtKN3a8lUdUrX7MvCLnP6yFM
	DwiJA1E0HS4MQpogTaVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrGZG-001F5l-Lp; Wed, 18 May 2022 10:06:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrGYN-001Eex-EY; Wed, 18 May 2022 10:05:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8EE241F44E07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652868311;
 bh=U70cvP2/Lgt8lNyOqWL39jq+Fark+U7neoHz5F2M2Nw=;
 h=From:To:Cc:Subject:Date:From;
 b=IsAoTuF0LZAK/38ZusnqIkI10GGd2aWgxdN2rhyFkvOY3sbmzggDeRnYWAI6SbDSu
 ARC0oZ7uzAKHX27vDoS7ruoS1PWqv19s3xjNgagzfltsoJoxEwnlt9krLrIyuiHFtA
 W1CTf+5vhhtcu5bLxzlld4STZIHFdhy4fyYNrI6EDrOKNkmJwa1uFM9LvBqyqPBccP
 XnRtWgFvqjV1XeLyqQmiPp3KzW3TvugS98vL9sYxT8ECATIakSJ28M1nmHK/W+Bhh4
 y+fiK2jGk5YvAyqJN/bapRl105yVdat8KERFg8G1mNKQbiRToc6Qqn5wyKjN55r32X
 4HvGjdXoTvj5Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@linaro.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/7] mtk_iommu: Specify phandles to infracfg and pericfg
Date: Wed, 18 May 2022 12:04:56 +0200
Message-Id: <20220518100503.37279-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_030515_654472_336E16D3 
X-CRM114-Status: UNSURE (   9.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The IOMMU has registers in the infracfg and/or pericfg iospaces: as
for the currently supported SoCs, MT2712 and MT8173 need a phandle to
infracfg, while MT8195 needs one to pericfg.

Before this change, the driver was checking for a SoC-specific infra/peri
compatible but, sooner or later, these lists are going to grow a lot...
...and this is why it was chosen to add phandles (as it was done with
some other drivers already - look at mtk-pm-domains, mt8192-afe

Please note that, while it was necessary to update the devicetrees for
MT8173 and MT2712e, there was no update for MT8195 because there is no
IOMMU node in there yet.

Changes in v2:
 - Squashed dt-bindings patches as suggested by Matthias
 - Removed quotes from infra/peri phandle refs
 - Changed dev_warn to dev_info in patches [2/7], [3/7]

AngeloGioacchino Del Regno (7):
  dt-bindings: iommu: mediatek: Add phandles for mediatek infra/pericfg
  iommu: mtk_iommu: Lookup phandle to retrieve syscon to infracfg
  iommu: mtk_iommu: Lookup phandle to retrieve syscon to pericfg
  arm64: dts: mediatek: mt8173: Add mediatek,infracfg phandle for IOMMU
  arm64: dts: mediatek: mt2712e: Add mediatek,infracfg phandle for IOMMU
  dt-bindings: iommu: mediatek: Require mediatek,infracfg for
    mt2712/8173
  dt-bindings: iommu: mediatek: Require mediatek,pericfg for
    mt8195-infra

 .../bindings/iommu/mediatek,iommu.yaml        | 30 +++++++++
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |  2 +
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  1 +
 drivers/iommu/mtk_iommu.c                     | 66 ++++++++++++-------
 4 files changed, 75 insertions(+), 24 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
