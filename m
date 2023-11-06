Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A99EC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 06:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=grp1AlMkyekbeDiBRfj+htcx3Y2qk/xgnK8jPrJfTv8=; b=W4BpGvTjsrstCv7sIiDpj/msyz
	CnmqBPYmpvg5n6e7osbb4+ppWzH0Afit/UKlQnDc9/EOl566xvpe7M0uiL86K1b/TZDvUkGghzaKl
	/tgsOK67PDxgBwYDcJ97/lhfmirGD7Fs4uNVjn2n1vx4CEAll4dT7imgs13vQvLRqGNOhL4UOuWNM
	xicDB/YIndfg6Q4y6lVdwh7727pa+zcypWrI48jb/znLrQipOTW7UcQohpJpxuE7l4buX6QYyzYSx
	Ej3vuZVRdZFcEA5RSZXCiUv+1PGq+d+6RfDH9IBlwcLVtlVzJE8TnsXp0WJEwM3jH1TgX9irb1kAt
	kG7cO3Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzsqf-00FviD-1b;
	Mon, 06 Nov 2023 06:12:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzsqc-00FvhP-2P;
	Mon, 06 Nov 2023 06:12:31 +0000
X-UUID: 751a95e47c6b11ee9b7791016c24628a-20231105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=grp1AlMkyekbeDiBRfj+htcx3Y2qk/xgnK8jPrJfTv8=;
	b=a3tmYAYGbxzC1lsN+xzDtWfpfUPBRpzY1PLA+VYSf34M6/rbe5S5fPw/9kRhucpuKDFuMuYaeOxUmgWKt4r1/RJTtao8C42Dfm3/P0aUrssX6p0DcvdJYpG71y1B7WK2djJ7ErcRdwsyxZtLz3Ei+nveJN/2JKv4VNksCoJ1L3w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:3ab13be0-ce90-4951-96bb-8b87b6895ac4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:ad0f0e95-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 751a95e47c6b11ee9b7791016c24628a-20231105
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jian.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 230391046; Sun, 05 Nov 2023 23:12:26 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 6 Nov 2023 14:12:23 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 6 Nov 2023 14:12:22 +0800
From: Jian Yang <jian.yang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kw@linux.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, Jianjun Wang
	<jianjun.wang@mediatek.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<Chuanjia.Liu@mediatek.com>, <Jieyy.Yang@mediatek.com>,
	<Qizhong.Cheng@mediatek.com>, <Jianguo.Zhang@mediatek.com>, Jian Yang
	<jian.yang@mediatek.com>
Subject: [PATCH v4 0/2] PCI: mediatek-gen3: Support controlling power supplies
Date: Mon, 6 Nov 2023 14:12:18 +0800
Message-ID: <20231106061220.21485-1-jian.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231105_221230_798518_8638BE51 
X-CRM114-Status: UNSURE (   7.05  )
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

Add support for controlling power supplies and reset GPIO of a downstream
component in Mediatek's PCIe GEN3 controller driver.

Changes in v4:
1. Rename power supplies properties in DT binding and driver.
2. Reorder variables alphabetically.
3. Use 'dev_err_probe' to do some error handling stuff.

Changes in v3:
1. Modify description of power supply properties in DT binding.
2. Remove unused header files.
3. Use 'device_wakeup_path' to determine whether the downstream component
needs to skip the reset process in system suspend scenarios.

Changes in v2:
1. Remove an unnecessary property in dt-bindings file.
2. Use the flag 'GPIOD_OUT_LOW' to set initial state of a downstream
component's reset GPIO.
3. Keep downstream component powered on in suspend state if it is capable
of waking up the system.

jian.yang (2):
  dt-bindings: PCI: mediatek-gen3: Add support for controlling power and
    reset
  PCI: mediatek-gen3: Add power and reset control feature for downstream
    component

 .../bindings/pci/mediatek-pcie-gen3.yaml      | 30 +++++++
 drivers/pci/controller/pcie-mediatek-gen3.c   | 89 ++++++++++++++++++-
 2 files changed, 118 insertions(+), 1 deletion(-)

-- 
2.18.0


