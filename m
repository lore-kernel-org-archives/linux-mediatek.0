Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5915D606A32A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 06:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g+kiq6Rw;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=LhgaupVj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OQ8eDMcUmdXK5He2mvO2Ew0LR++K/A/qA850U/+NkVc=; b=g+kiq6RwnFzpuGgZjeLBeVUU4I
	Zf6f7FeYtqrXCH3HjofXSHLLMEL1EouojcS0bnwWK0xllAP7IMjw2k9yI9bS+odkQxqzgm9BlHNCQ
	xpqnsE73gjf1QNR88LL8NAyvNvXFlZdB8Ep+72Cq+kDkIWR+xiN17sSudKRC+coOQQgakNE3t/Kwr
	oPEryRFVD60gmUg6kZSlZiGoWRZhAz5zTUcH8/g/c7cFKBIU+d5zwvW8jDgNbu1RJrodpEfpMS4cw
	Iy7lOenBZEzKxv6rwfagWa9GF5PMQsMgW0ZUHkRnhk/C9DXshhcTgTy68uw7jCHJrn54bXGo5V4K3
	Pkn6SAVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW63v-00000008VL6-3suu;
	Wed, 25 Nov 2026 06:00:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW63t-00000008VKE-27Jw;
	Wed, 25 Nov 2026 06:00:58 +0000
X-UUID: 8e8fcb36e89511f1afed4741b24580c9-20261124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From; bh=OQ8eDMcUmdXK5He2mvO2Ew0LR++K/A/qA850U/+NkVc=;
	b=LhgaupVjGQwjbqLhYKwr6pJeANpRf/BeFwXLwtzhvMi5JB7Eal0zzyVfFH0ITNNl3rHZj4GHAfPPrQZYGHieuE/IjyvpuR+5IbYykgHHmIAHM5UO0lCOGOjrQQ+Eb6P0tl8k5HuWjGoXpuZLJU1wyTrdl7WJHNMGI2Oydv3WU6A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:3a2c32b3-0d4e-4943-8758-0257e43964eb,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:bc97081a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:2|-100,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8e8fcb36e89511f1afed4741b24580c9-20261124
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <echo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 450014979; Tue, 24 Nov 2026 23:00:46 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:00:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:00:42 +0800
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
Subject: [PATCH 0/7] soc: mediatek: add MMDVFS support for MT8196
Date: Wed, 25 Nov 2026 14:00:05 +0800
Message-ID: <20261125060037.649659-1-echo.zhang@mediatek.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_220057_555939_1A8EE454 
X-CRM114-Status: GOOD (  13.47  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for the MediaTek Multimedia Dynamic Voltage and
Frequency Scaling (MMDVFS) controller on MT8196. The controller provides
virtual clocks for multimedia hardware blocks and coordinates their
performance requests with platform voltage resources. The driver
aggregates consumer rate requests and programs the MT8196 hardware clock
control fabric (HWCCF) voter. Its VCP/MMUP backend coordinates shared
memory and IPI communication with firmware.

The series introduces the clock IDs and device tree bindings, followed by
the common clock provider, VCP backend and MT8196 topology and voting
data. It also adds a read-only debugfs status view and a MAINTAINERS entry.

This series depends on Xiangzhi Tang's MediaTek VCP remoteproc series,
which provides the public VCP API used by MMDVFS:
https://lore.kernel.org/r/20260427111446.22955-1-xiangzhi.tang@mediatek.com

Patch layout:
  1/7: Define the MT8196 MMDVFS clock IDs used by DT consumers.
  2/7: Document the common MMDVFS and MT8196 DT bindings.
  3/7: Add the common driver, virtual clock provider and vote handling.
  4/7: Add the VCP/MMUP shared-memory and IPI backend.
  5/7: Add MT8196 topology data and HWCCF voting operations.
  6/7: Add a read-only debugfs status view.
  7/7: Add the MMDVFS files and contacts to MAINTAINERS.

Validation: the two MMDVFS bindings passed dt_binding_check. Each driver
commit built cumulatively with arm64 Clang on top of the VCP dependency.
The production changes were also ported to the MT8196 sapphire validation
tree, retaining its older VCP API compatibility and separate internal test
hooks. Its full package build and board boot passed. The status interface
reported initialization with three resource controllers, seven muxes. The
user, vote_step and force_step test completed with zero functional failures;

Echo Zhang (7):
  dt-bindings: clock: mediatek: add MT8196 MMDVFS clock IDs
  dt-bindings: soc: mediatek: add MMDVFS binding
  soc: mediatek: add MMDVFS core driver
  soc: mediatek: mmdvfs: add VCP backend
  soc: mediatek: mmdvfs: add MT8196 support
  soc: mediatek: mmdvfs: add read-only status debug
  MAINTAINERS: add MediaTek MMDVFS entry

 .../soc/mediatek/mediatek,mmdvfs.yaml         |   60 +
 .../soc/mediatek/mediatek,mt8196-mmdvfs.yaml  |   87 ++
 MAINTAINERS                                   |   11 +
 drivers/soc/mediatek/Kconfig                  |   19 +
 drivers/soc/mediatek/Makefile                 |    1 +
 drivers/soc/mediatek/mmdvfs/Makefile          |   10 +
 drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c      |  447 +++++++
 drivers/soc/mediatek/mmdvfs/mmdvfs-core.c     |  651 ++++++++++
 drivers/soc/mediatek/mmdvfs/mmdvfs-debug.c    |  200 +++
 drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h |  361 ++++++
 drivers/soc/mediatek/mmdvfs/mmdvfs-mt8196.c   |  637 ++++++++++
 drivers/soc/mediatek/mmdvfs/mmdvfs-up-priv.h  |   57 +
 drivers/soc/mediatek/mmdvfs/mmdvfs-up.c       |  275 +++++
 .../soc/mediatek/mmdvfs/mmdvfs-vcp-memory.h   |  104 ++
 drivers/soc/mediatek/mmdvfs/mmdvfs-vcp.c      | 1075 +++++++++++++++++
 .../clock/mediatek,mt8196-mmdvfs.h            |   74 ++
 include/soc/mediatek/mmdvfs.h                 |   90 ++
 17 files changed, 4159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mmdvfs.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-mmdvfs.yaml
 create mode 100644 drivers/soc/mediatek/mmdvfs/Makefile
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-core.c
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-debug.c
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-mt8196.c
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-up-priv.h
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-up.c
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-vcp-memory.h
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-vcp.c
 create mode 100644 include/dt-bindings/clock/mediatek,mt8196-mmdvfs.h
 create mode 100644 include/soc/mediatek/mmdvfs.h

-- 
2.45.2


