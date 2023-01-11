Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DD2C46467
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 03:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tPBVLufhdIhjett3dh8ZSV7+mAa/jQgjUH4vRx9Y3lE=; b=Of45lP/G1Ma+9wZ1v3bjd0VS5r
	WFfVyXbo8yDhsicj/x5JaPyl71OpO5fjb8putxsy28LaRJntQqf2Lj0OzKWIc4zEufm1B9xxtcgkX
	aNaqy1IFLqwyPq+/NC84i/2JzrTk2fJa01Sk2NPDeMNDIiIQGmpes1k2dctHVCvmTdNtps/9G3jer
	n/ml6ztzuNpLkfKypCaYsPLUS544tIYDv6xShvugMFrWufwyE66LrajkbBY5bc1NhXO0eeuDD6B8+
	oht2krQx+DXP47ub1rYJD1/Y/e9hD9cwLEG56KaCfx5QmzO66aUVzvujloT0hcxGd1xyDHlzw7FnC
	lHmtyd+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFS6w-009S11-8M; Wed, 11 Jan 2023 03:49:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFS6u-009S0c-MF; Wed, 11 Jan 2023 03:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=tPBVLufhdIhjett3dh8ZSV7+mAa/jQgjUH4vRx9Y3lE=; b=k9+cPGJI/0VQjcip4JgLaZK5ed
	WTS9UM6x5itStYLGNRC1i+5BftF1R2m5bw9TpFb3XXZifF32KVbDIANFmxBvfqAdTuiUZCfNsqBBN
	bQgJgviO56VMUPxtwVJuyeFcJIFW3346JU1ngzVsOuj2NIj2y2xXz6dcTXESxVnBBwJ2CGrMnLIUn
	9+gUDz2Pdf5/8bVhmItyfeL0KM6yLMm4zfO4uaccauh70AhtfpYLbYhQpnhzngGn3DULyWVhPqtbl
	KHLa6cqVekUuasH9Aww+lutuh8SF9/CpWxizgtFVGGhUni9jaVHvAPK8lLElwG/R+j7O4YoWavjYB
	7neIAfdg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pFS6f-003WKf-0q;
	Wed, 11 Jan 2023 03:48:57 +0000
X-UUID: d4323c70916211edbbe3f76fe852e059-20230110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tPBVLufhdIhjett3dh8ZSV7+mAa/jQgjUH4vRx9Y3lE=;
	b=DOI5jzxG6HFIMtvAtsFfBTJqYudpd8TXViEzSc+BnEFdTQHzfUME/i9HZIW6SVrGeI3vDJRUnLJSuLs1HXvCi6xXHg3XBR14xpVRyinwUV82waZEB4a+oHJJSpwJPmVtdETMAdxvcJsn3lUw+WpMGM4B5mdGwQPWA6M2vbl+OjA=;
X-CID-CACHE: Type:Local,Time:202301102026-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:b11b3cd2-d88c-4c29-a772-4bb919718fff,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:21e275f5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: d4323c70916211edbbe3f76fe852e059-20230110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jian.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1592166630; Tue, 10 Jan 2023 20:48:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 11 Jan 2023 11:28:33 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 11:28:32 +0800
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
Subject: [PATCH 0/2] PCI: mediatek-gen3: Support controlling power and reset of downstream componennt
Date: Wed, 11 Jan 2023 11:28:28 +0800
Message-ID: <20230111032830.20447-1-jian.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_034855_206711_40008500 
X-CRM114-Status: UNSURE (   7.41  )
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


