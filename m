Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02318EBFD0A
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2026 07:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+9DOIPBCDXn1gL4EYuRhhyUJKMqKeMJcK0WHANYjnaQ=; b=NsjEPsrVOHTv6aktitgha4P+WR
	XF9d9BB4pD81MNVdDk+YHCHHDbgUqwjHyQ1ibdFDJc5a+WQXnce0+b2/SAkSJhWz+8SRh2Hu+hHlt
	6q8ywijRRBJe7s8irNYiKAUqMWEpsdyWyk1RDFQHyClLtS/utuiq/B6wNns7zkuY2kGT3qaF7CHSL
	PueATX9b1bHi9xnKdLWVK0UsFG9qjGpxqj/F+v9+fYJF3fG0f63EjIsYgowiwm4oTqXzmKz5e+96K
	dixQWgg+rCCsmWNzhcSOT3FQWldiIMwClR43T5852T/2ckD/wX/1xOpMMXbJsrrLykgNUZ6JPc/me
	HXCIv7uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBUw-0000000F7OM-1VJ6;
	Mon, 13 Apr 2026 07:14:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBUt-0000000F7Nm-2sg9
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Apr 2026 07:14:16 +0000
X-UUID: 5dbfce3c370811f19e7563141e833ce8-20260413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+9DOIPBCDXn1gL4EYuRhhyUJKMqKeMJcK0WHANYjnaQ=;
	b=UJBWpx5Rvxo5tloIEnswGWZ9Xa7i4JKEvGpSj6WlRyLYZMw0vu6XduZXGv44MbHQgyV0LVm3mHqQyEFWzi13CVBxkyu70Vb6KTF9j0lMhJaSsQNT09+SEe2Bfp2tNgNqAr3BM5jhzJSk6jPZfdWOfpBo4MI5MKKH0Fgn+yKPoWo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:2fc7dea8-740f-40e8-b562-f6c5224cc5ef,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:54d5cb24-cb5c-4236-a89a-9a7fb20c9bc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5dbfce3c370811f19e7563141e833ce8-20260413
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jian.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1327665788; Mon, 13 Apr 2026 00:14:09 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 13 Apr 2026 15:14:07 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 13 Apr 2026 15:14:06 +0800
From: Jian Yang <jian.yang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jian.yang@mediatek.com>, <chuanjia.liu@mediatek.com>,
	<yonglong.wu@mediatek.com>
Subject: [PATCH 0/2] PCI: mediatek-gen3: Fix the control timing of PERST#
Date: Mon, 13 Apr 2026 15:13:54 +0800
Message-ID: <20260413071401.1151-1-jian.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_001415_740132_45B8F41B 
X-CRM114-Status: UNSURE (   8.36  )
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

Dear maintainers,

The purpose of this patch series is to fix the PERST# control timing
in the MediaTek PCIe Gen3 controller driver so that it complies with
the PCIe CEM specification.

In the current MediaTek PCIe Gen3 controller driver, there are two
issues with PERST# timing:
1. During the power-up phase (i.e., before PCIe link-up), on some
MediaTek SoCs PERST# is de-asserted before the REFCLK becomes stable;
2. During system shutdown, PERST# is not asserted before power is
removed.

Patch 1 fixes the reset signal sequencing during the power-up phase.

Patch 2 adds a shutdown callback to control PERST# during system
shutdown.

Best regards,
Jian Yang

Jian Yang (2):
  PCI: mediatek-gen3: Fix PERST# control sequence at system startup
    phase
  PCI: mediatek-gen3: Add shutdown callback to cotnrol PERST# signal

 drivers/pci/controller/pcie-mediatek-gen3.c | 30 ++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

-- 
2.45.2


