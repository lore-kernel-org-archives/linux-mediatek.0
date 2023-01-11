Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51067C54EBC
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 03:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tPBVLufhdIhjett3dh8ZSV7+mAa/jQgjUH4vRx9Y3lE=; b=c2Jkcsn69Vw5YTQNzbUu5wOF5s
	yWpuPuhsror9subir/KQ9yOGHwrErkWOn1wvZfOLDGkd7e3lmMo20XRHDwYWzfg4lorppfrQFhbRM
	yu8nu3Sov4RFoUL4cS5dZvY4LrxfMtFGVItdWtXlM/AKCP9m+1Vv2WemLT7S0EE/b+6S5pe5C1uGd
	AEdeetFpJwVsEB6zdqqRQY1hPilD72ly37lBgKRGFu7PwJmK1U9rz6gsxjIt9Q70Qc8lqSqANERld
	LgIO7L65nlMPo5xmWQxPIEWqSewPBkUtAI0qjwUPzhUkBmjfWvRyD6ZMuFl27CI/EtwzLGCYySeF3
	YGPm5HYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFRlA-009PCJ-4s; Wed, 11 Jan 2023 03:26:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFRl8-009PBo-EC; Wed, 11 Jan 2023 03:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=tPBVLufhdIhjett3dh8ZSV7+mAa/jQgjUH4vRx9Y3lE=; b=LOjd5ZqN7v6JxPn/9HXcybbcxY
	ZkZLJv8fPFw3DNixFVD42ZH8Bzb+reLJnJFGK46iiKSugEjQSd0UyuOLBFAOcVOFdTncdHVVMyXuP
	q4GVtjRiR4eKlA6cpXjuMv8ZHHBx7pO0SLuY98W6kGVlof92zeWh5G8LpMiIEgPikshi9d+dN5+j4
	1PM6+hJTfz2VkQ7OaJ2MTOpMCV5b9/zc6+JFe4mGo8tsgvSYmNyAEtvbuLRHQFc9vrQa0yPOWpLvr
	XAbMRvo3CuFymPR2mXLN1YmH07BZB3Y1S98cTEbEXnJMha75t9CVgRP2yC6XVpKrE87QzkZKvU+XS
	I64QbtKw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pFRkv-003W4z-1o;
	Wed, 11 Jan 2023 03:26:29 +0000
X-UUID: b70e4b96915f11edbbe3f76fe852e059-20230110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tPBVLufhdIhjett3dh8ZSV7+mAa/jQgjUH4vRx9Y3lE=;
	b=C8tFDmU1S95DzL54D0/ikMhTr+vl+7WI6TQavdRFkN+OE+S/NDg+kOtO+wO0ceOvxjYmwVs0B5fcuRlF26Jv1U4c7LJRChxVr9wBKLnKKGd0UC3EHnU64N2LUsbn4gQb/m5ZQcw6H/9vbb2OuF9SbvnMCmcPND8nTKFfTOxGRQo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:5322ebfc-c830-492f-99a2-b84a8063de81,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:21e275f5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: b70e4b96915f11edbbe3f76fe852e059-20230110
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jian.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1812994122; Tue, 10 Jan 2023 20:26:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 11 Jan 2023 11:25:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 11:25:43 +0800
From: Jian Yang <jian.yang@mediatek.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Jianjun Wang
	<jianjun.wang@mediatek.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee
	<ryder.lee@mediatek.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kw@linux.com>
CC: <linux-pci@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jian.yang@mediatek.com>, <chuanjia.liu@mediatek.com>,
	<jieyy.yang@mediatek.com>, <qizhong.cheng@mediatek.com>,
	<rex-bc.chen@mediatek.com>, <david-yh.chiu@mediatek.com>
Subject: [PATCH 0/2] PCI: mediatek-gen3: Support controlling power supplies
Date: Wed, 11 Jan 2023 11:25:40 +0800
Message-ID: <20230111032542.20306-1-jian.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_032626_411769_3CD5FF40 
X-CRM114-Status: UNSURE (   7.28  )
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

From: "jian.yang" <jian.yang@mediatek.com>

These series patches add support for controlling power supplies and reset
GPIO of a downstream component in MediaTek's PCIe GEN3 controller driver.

jian.yang (2):
  PCI: mediatek-gen3: Add power and reset control feature for downstream
    component
  dt-bindings: PCI: mediatek-gen3: Add support for controlling power and
    reset

 .../bindings/pci/mediatek-pcie-gen3.yaml      |  23 ++++
 drivers/pci/controller/pcie-mediatek-gen3.c   | 114 +++++++++++++++++-
 2 files changed, 136 insertions(+), 1 deletion(-)

-- 
2.18.0


