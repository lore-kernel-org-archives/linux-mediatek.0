Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56457606A323
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 06:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F/ZTdiF0;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=hLF6TkzV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DJ87lMtIEjrR51mZJkFz/vkD5C108fNlWDaTyP3AJig=; b=F/ZTdiF0xTrbxeUqQIPOiujyLA
	V4Dwdf0YxWV1gkBAhppMDmPf71Bqjr1g7tesUnttqfgBkmMVPJjPq+dTnWuy+CWlhsegUb0d5Vcgk
	A5bOkyI4r+T+OglbYgwPNjQYU1QbiYlujkg/2hrSV7xiss2n5lbOYDkCIgseJcnx/OSF4cdER6lGh
	2Y1mvr+kLhzSEgN2XAh9IxtqHdGiV5FEQdhHWedCuAD5Qfx4QKogcST8m9XcTJuXe9rdj/LK3db9n
	OzjRVvUzTdhHxM/wprsIpFzFncK0qptXUpDngOJuQ/i7n9IBpwPJVrsz3ApwDR8MnedCMkQ78/WBY
	mEFtUFig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW63x-00000008VMK-0JYq;
	Wed, 25 Nov 2026 06:01:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW63u-00000008VKI-1vNm;
	Wed, 25 Nov 2026 06:00:59 +0000
X-UUID: 91ab4f7ae89511f1afed4741b24580c9-20261124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=DJ87lMtIEjrR51mZJkFz/vkD5C108fNlWDaTyP3AJig=;
	b=hLF6TkzV+NKQlZoqLToaS5DnH/0Xq6t7q1+VFBnpwMtae3Sq1RvOu98LaKBL9atI8DNUy5Cc957JYsa3UILVnWwQbJngRtVy70DGX+CU6nrWPIXQ8rwRORgR/tTfaqbQbPHt/B7S0w03g+67Fx6zLOh/qAI7M4C2PagpXgzvShg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:5c50d861-e7b0-4934-a360-405424545997,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:21ef5031-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 91ab4f7ae89511f1afed4741b24580c9-20261124
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <echo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1000899253; Tue, 24 Nov 2026 23:00:51 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:00:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:00:48 +0800
From: Echo Zhang <echo.zhang@mediatek.com>
To: Echo Zhang <echo.zhang@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, MMDVFS Team
	<linux-mediatek@lists.infradead.org>, <kyrie.wu@mediatek.com>,
	<ming-fan.chen@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: [PATCH 1/7] dt-bindings: clock: mediatek: add MT8196 MMDVFS clock IDs
Date: Wed, 25 Nov 2026 14:00:06 +0800
Message-ID: <20261125060037.649659-2-echo.zhang@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125060037.649659-1-echo.zhang@mediatek.com>
References: <20261125060037.649659-1-echo.zhang@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_220058_500621_AE7C9BCF 
X-CRM114-Status: GOOD (  14.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add clock IDs for the MT8196 MMDVFS clock provider.

These IDs describe the clocks exposed by the MMDVFS block and are used by
device tree consumers to request multimedia performance levels through the
standard clock framework.

Signed-off-by: Echo Zhang <echo.zhang@mediatek.com>
---
 .../clock/mediatek,mt8196-mmdvfs.h            | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 include/dt-bindings/clock/mediatek,mt8196-mmdvfs.h

diff --git a/include/dt-bindings/clock/mediatek,mt8196-mmdvfs.h b/include/dt-bindings/clock/mediatek,mt8196-mmdvfs.h
new file mode 100644
index 000000000000..428d8a35abdb
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt8196-mmdvfs.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 MediaTek Inc.
+ * Author: MediaTek MMDVFS Team
+ */
+
+#ifndef _DT_BINDINGS_MMDVFS_CLK_MT8196_H
+#define _DT_BINDINGS_MMDVFS_CLK_MT8196_H
+
+/*
+ * MMDVFS Clock IDs for MT8196
+ *
+ * These IDs are used by multimedia clients in device tree to reference
+ * MMDVFS virtual clocks for DVFS voting.
+ *
+ * MT8196 uses HWCCF (Hardware Clock Control Fabric) architecture.
+ *
+ * Usage in device tree:
+ *   clocks = <&mmdvfs MMDVFS_USER_VDEC>;
+ *   clock-names = "mmdvfs";
+ */
+
+/* Core user clocks used by multimedia hardware drivers */
+#define MMDVFS_USER_DISP	0	/* user-disp */
+#define MMDVFS_USER_MDP		1	/* user-mdp */
+#define MMDVFS_USER_MML		2	/* user-mml */
+#define MMDVFS_USER_SMI		3	/* user-smi */
+#define MMDVFS_USER_JPEGDEC	4	/* user-jpegdec */
+#define MMDVFS_USER_JPEGENC	5	/* user-jpegenc */
+#define MMDVFS_USER_VENC	6	/* user-venc */
+#define MMDVFS_USER_VFMT	7	/* user-vfmt */
+#define MMDVFS_USER_IMG		8	/* user-img */
+#define MMDVFS_USER_CAM		9	/* user-cam */
+#define MMDVFS_USER_VCORE	10	/* user-vcore */
+#define MMDVFS_USER_VMM		11	/* user-vmm */
+#define MMDVFS_USER_VDISP	12	/* user-vdisp */
+#define MMDVFS_USER_VDEC	13	/* user-vdec */
+#define DUMMY_USER_DIS		14	/* dummy-dis */
+#define DUMMY_USER_MDP		15	/* dummy-mdp */
+#define DUMMY_USER_MML		16	/* dummy-mml */
+#define DUMMY_USER_SMI		17	/* dummy-smi */
+#define DUMMY_USER_VEN		18	/* dummy-ven */
+#define DUMMY_USER_VDE		19	/* dummy-vde */
+#define DUMMY_USER_IMG		20	/* dummy-img */
+#define DUMMY_USER_CAM		21	/* dummy-cam */
+#define MMDVFS_USER_CAM_SMI	22	/* user-cam-smi */
+#define MMDVFS_USER_VCP_SMI	23	/* user-vcp-smi */
+
+/* AP voter clocks (24-33) - System level control */
+#define MMDVFS_AP_CAM		24
+#define MMDVFS_AP_CAMTM		25
+#define MMDVFS_AP_VDE		26
+#define MMDVFS_AP_IMG		27
+#define MMDVFS_AP_IPE		28
+#define MMDVFS_AP_DIS		29
+#define MMDVFS_AP_MML		30
+#define MMDVFS_AP_SMI		31
+#define MMDVFS_AP_VEN		32
+#define MMDVFS_AP_MDP		33
+
+/* VCP voter clocks (34-43) - VCP firmware control */
+#define MMDVFS_VCP_CAM		34
+#define MMDVFS_VCP_CAMTM	35
+#define MMDVFS_VCP_VDE		36
+#define MMDVFS_VCP_IMG		37
+#define MMDVFS_VCP_IPE		38
+#define MMDVFS_VCP_DIS		39
+#define MMDVFS_VCP_MML		40
+#define MMDVFS_VCP_SMI		41
+#define MMDVFS_VCP_VEN		42
+#define MMDVFS_VCP_MDP		43
+
+#define MMDVFS_USER_NUM		44
+#endif /* _DT_BINDINGS_MMDVFS_CLK_MT8196_H */
-- 
2.45.2


