Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715D8C52D6F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Aug 2024 08:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tfvrvcu6RP0eyXcpdgDoO9aUBkQLTiA9tNk3AuOteYE=; b=sRTm5KFmpiIKQe13p9Za+AEXiZ
	Sgs7MSw526qQK7yjBQFBOhizGneNAsPXx01uzYLJgRWgBkMUck4BQZgyIUNsTQUWAUBxbF2qdxlGI
	b67D9J7FzirPBZrIssJqR//O04OsgQVtJoJlYsGX4hthcBE+uejH3YAB2AZDkeBCeQKXQRl/mlm88
	ylBuQT+jgcHtZjSFLzoP7GIspBJDbq5Ke7AyIzRpeCtdqQDuV+aAGwnima/CBclJyBRXEKcSwScBl
	e0jy3pHPglLt8IQ1qgkGaY9ct5ufTEB0gtBG+RJwlUx/baDv+teRPC7bEsoqM+1D+11IPdMwA7wtI
	yKcir9nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgh2F-000000088yK-448a;
	Wed, 21 Aug 2024 08:49:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgh1V-000000088oo-1aBB;
	Wed, 21 Aug 2024 08:48:58 +0000
X-UUID: 31da7afc5f9a11efba0aef63c0775dbf-20240821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Tfvrvcu6RP0eyXcpdgDoO9aUBkQLTiA9tNk3AuOteYE=;
	b=NpNDCJ6TeOrQ6ob9e6NG5fX5nALXRFHZqFoT9yH+Cyehb1PdWjVhC4Z0nUvf8cNznm8KNsYmHoVwipUJA6kNYxaxR2A4sno6xnPxwA4o+yV6x3iBn5oDz5b6GRz6mQvRWjDXefZaFoNjiRbRObzSlIM/56ccyYZKlOoiNJJKMFw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:9cfacdc9-0864-43f1-b5fb-cdc1c243ed16,IP:0,U
	RL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:6dc6a47,CLOUDID:6e36cb5b-248b-45cb-bde8-d789f49f4e1e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 31da7afc5f9a11efba0aef63c0775dbf-20240821
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 560780176; Wed, 21 Aug 2024 01:48:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 21 Aug 2024 16:28:47 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 21 Aug 2024 16:28:46 +0800
From: friday.yang <friday.yang@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Yong Wu <yong.wu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Friday Yang <friday.yang@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 0/4] Add SMI clamp and reset
Date: Wed, 21 Aug 2024 16:26:48 +0800
Message-ID: <20240821082845.11792-1-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.945500-8.000000
X-TMASE-MatchedRID: VM+0CAai3W23D+jgn28P5kLcvIIgiVuN9pLnYtQ99xJh2fnHe1cil/Ds
	kP9n+KGGhKaZgkam63X6BsxBntd8/69VPpt+QVb+QpxiLlDD9FWZ2scyRQcer19eTSR8I6duVkP
	jnlLOkq2MVdvRiR/Be0ixezJGk2ozwuTfHDVJ/15VTfJWlqPdDEyQ5fRSh265NSweOixQAJJHdE
	c8dOyw1Vl+Hk3Iw2bEgDLqnrRlXrYbaLjLw/bFed0H8LFZNFG73Yq8RVaZivWLgpbqFBoHY1+gu
	K2n/tPR07d2g0qCMsnZWKG32TjC/QGeyeOvBlDN
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.945500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 45E3677124D75BD3EF1299E16BE0A636DF103054266AA26AA09BEE43E120A57C2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_014857_445198_4908A9DC 
X-CRM114-Status: GOOD (  14.07  )
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

Based on tag: next-20240821, linux-next/master

Refer to the discussion in the following link:
https://lore.kernel.org/all/CAFGrd9qZhObQXvm2_abqaX83xMLqxjQETB2=wXpobDWU1CnvkA@mail.gmail.com/
https://lore.kernel.org/all/CAPDyKFpokXV2gJDgowbixTvOH_5VL3B5H8eyhP+KJ5Fasm2rFg@mail.gmail.com/
SMI clamp and reset operations should be implemented in SMI driver
instead of PM driver.

When we enable/disable power domain, the SMI LARBs linked to this power
domain could be affected by the bus glitch. To avoid this issue, SMI
need to apply clamp and reset opereations.

These patches mainly add these functions:
1) Register genpd callback for SMI LARBs and handle this power domain
   status change into SMI driver.
2) Add SMI reset control driver to implement SMI reset opereations.
3) Add bindings for describing the reset control regmap and SMI Sub Common.

friday.yang (4):
  dt-bindings: memory: mediatek: Add mt8188 SMI reset control binding
  dt-bindings: memory: mediatek: Add smi-sub-common property for reset
  memory: mtk-smi: mt8188: Add SMI clamp function
  reset: mediatek: Add reset control driver for SMI

 .../mediatek,smi-common.yaml                  |   2 +
 .../memory-controllers/mediatek,smi-larb.yaml |  22 +++
 .../bindings/reset/mediatek,smi-reset.yaml    |  46 ++++++
 drivers/memory/mtk-smi.c                      | 148 ++++++++++++++++-
 drivers/reset/Kconfig                         |   9 ++
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-mediatek-smi.c            | 152 ++++++++++++++++++
 include/dt-bindings/reset/mt8188-resets.h     |  11 ++
 8 files changed, 389 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/mediatek,smi-reset.yaml
 create mode 100644 drivers/reset/reset-mediatek-smi.c

--
2.46.0


