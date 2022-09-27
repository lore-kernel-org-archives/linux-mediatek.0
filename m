Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0BCC07E9D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 03:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EdUjnIdrI6CEvlP6x0Ld3GV/+CJojbuPjOYUrASLVW4=; b=oAhMo6iynNhlcWplwGWQxcAWhS
	BsSrEk5XkzQ/ATmJr/qdT4cz9yjwICskLWlIftLg28GqXbaOSYnCmZNu60XReFTOE4B8lAJhmz30r
	uKpBjQMSLKkHIWuejTRCNUYM4iZPNUeQ047B1ZmP0hE9skL6i2qqn//VqZwZKiJaVHdvPrPIzu3Nh
	NQ/piUgQy6RYTclzbDDkUZyApLmdFf2XY7rPKR2GtRaMT0V2vvobSl8EMZqgEsTRtgmNkWYCh7038
	Sca3X+71bhNQEu1Ra0hUP6wW5dBlKqv7T5dbHK897XkNqPMMGQJqkn61p4VSwwAgoH6vgIr9uj1DG
	6c5nkNug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od1Pg-0086LF-44; Tue, 27 Sep 2022 03:37:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od1Pd-0086KP-1q; Tue, 27 Sep 2022 03:37:38 +0000
X-UUID: 86a909bf59ec4611a7ed9373bffd0a11-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=EdUjnIdrI6CEvlP6x0Ld3GV/+CJojbuPjOYUrASLVW4=;
	b=aQAykFibKy0AiUx5RmIjnEZwz5IVXHnpkvVhqlGEx8XY+2DlTHdooFmInMjOBwcqCZo4eCSn9d97BlDTsmVFJfR5qriU8tcz+m6QFtLyOzX6AzOOIqkeM6X+R8EHg9/ohl/zF5AGGZ4SmoBRvI2RJmf6ZlQkWhpR/VKz4YqcvP0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:830e0f0c-6c5a-480e-896a-e3faab9805f6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:88ce1e07-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 86a909bf59ec4611a7ed9373bffd0a11-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 736118332; Mon, 26 Sep 2022 20:37:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 27 Sep 2022 10:56:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Sep 2022 10:56:25 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, "Andrew-CT
 Chen" <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v3 00/11] Add support for MT8195 SCP 2nd core
Date: Tue, 27 Sep 2022 10:55:55 +0800
Message-ID: <20220927025606.26673-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_203737_114636_4125A18D 
X-CRM114-Status: GOOD (  11.45  )
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

The mediatek remoteproc driver currently only allows bringing up a 
single core SCP, e.g. MT8183. It also only bringing up the 1st 
core in SoCs with a dual-core SCP, e.g. MT8195. This series support 
to bring-up the 2nd core of the dual-core SCP.

v2 -> v3:
1. change the representation of dual-core SCP in dts file and update SCP yaml
2. rewrite SCP driver to reflect the change of dts node
3. add SCP core 1 node to mt8195.dtsi
4. remove redundant call of rproc_boot for SCP
5. refine IPI error message

v1 -> v2:
1. update dt-binding property description
2. remove kconfig for scp dual driver
3. merge mtk_scp_dual.c and mtk_scp_subdev.c to mtk_scp.c

Tinghan Shen (11):
  dt-bindings: remoteproc: mediatek: Give the subnode a persistent name
  dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP
  arm64: dts: mt8195: Add SCP core 1 node
  remoteproc: mediatek: Remove redundant rproc_boot
  remoteproc: mediatek: Add SCP core 1 register definitions
  remoteproc: mediatek: Add MT8195 SCP core 1 operations
  remoteproc: mediatek: Probe MT8195 SCP core 1
  remoteproc: mediatek: Control SCP core 1 boot by rproc subdevice
  remoteproc: mediatek: Setup MT8195 SCP core 1 SRAM offset
  remoteproc: mediatek: Handle MT8195 SCP core 1 watchdog timeout
  remoteproc: mediatek: Refine ipi handler error message

 .../bindings/remoteproc/mtk,scp.yaml          | 132 ++++++++--
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   2 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  14 +-
 .../mediatek/vcodec/mtk_vcodec_fw_scp.c       |   2 +-
 drivers/remoteproc/mtk_common.h               |  35 +++
 drivers/remoteproc/mtk_scp.c                  | 241 +++++++++++++++++-
 include/linux/remoteproc/mtk_scp.h            |   1 +
 7 files changed, 397 insertions(+), 30 deletions(-)

-- 
2.18.0


