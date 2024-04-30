Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330EEC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 01:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E7qOPXMN3EtN709VL/sVHkpUIxB3GzdKBCh9pB/IiYI=; b=W2LYdzODaG0Am/ZPjMT7Fm5nd6
	fWo+0xQE05SMtvIhnwFHXEzkaYB+zuIXrwmtMZjQe9rxZxrFMHK0GMU61PKmT7DiLNbEKk0fW9pgt
	TLgE+RPyE2z0aa36EaEPCViKYtlz7J2NwWERkpOKCaTRRQFJ8I+dZA5GjeIdzHKH95Z/42gk4Oo+S
	z1z6WJFYouC78ZGr3bfFj0W4NX0KAC8V3SbX2kTMElOGIuesPoc47ZRic8FFjUcwGl2m3LUXCKLWs
	nRbrtdKeIM3qnViTRzZYv+krVDmE1U5Qs/HVWAR0TI6piNr9vlgzVX2arV0r58g7/095jzWkcs/6f
	gXwL6OFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1c6k-00000004eVK-1QLv;
	Tue, 30 Apr 2024 01:16:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1c6g-00000004eR0-2cCI;
	Tue, 30 Apr 2024 01:16:32 +0000
X-UUID: 41b288c0068f11efa8f1cd58ee6c2400-20240429
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=E7qOPXMN3EtN709VL/sVHkpUIxB3GzdKBCh9pB/IiYI=;
	b=WIMtMFirpKj9IulHiTt0u8xMJKx6YyRc494w108Pd7UwmfZxWfy0+0zd1WbS1Y+S4ZREuq3rxlInQZNUdR30IFJIV+HdeynWUWquadjJvKpXTP7x85etCgQS7OppPLC0mWfQdXZodTdg8vjs7l153TlvNlIkrEFgFjljJZErdJs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:2b207815-5a9a-4cfc-a454-6ed4ec4b67cf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:cf2d2a92-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 41b288c0068f11efa8f1cd58ee6c2400-20240429
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1595439313; Mon, 29 Apr 2024 18:16:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 30 Apr 2024 09:15:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 30 Apr 2024 09:15:49 +0800
From: Olivia Wen <olivia.wen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tinghan
 Shen <tinghan.shen@mediatek.com>, <linux-remoteproc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-ch.chen@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, <olivia.wen@mediatek.com>
Subject: [PATCH v4 0/4] Support MT8188 SCP core 1
Date: Tue, 30 Apr 2024 09:15:30 +0800
Message-ID: <20240430011534.9587-1-olivia.wen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_181630_739051_9B6D3C7B 
X-CRM114-Status: UNSURE (   8.20  )
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

Change in v4:
Updating the description of PATCH v4 4/4.

Olivia Wen (4):
  dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP
  remoteproc: mediatek: Support MT8188 SCP core 1
  remoteproc: mediatek: Support setting DRAM and IPI shared buffer sizes
  remoteproc: mediatek: Add IMGSYS IPI command

 .../devicetree/bindings/remoteproc/mtk,scp.yaml    |   2 +
 drivers/remoteproc/mtk_common.h                    |  11 +-
 drivers/remoteproc/mtk_scp.c                       | 230 +++++++++++++++++++--
 drivers/remoteproc/mtk_scp_ipi.c                   |   7 +-
 include/linux/remoteproc/mtk_scp.h                 |   1 +
 5 files changed, 225 insertions(+), 26 deletions(-)

-- 
2.6.4


