Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D491C77B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 18:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FVPFlkCWGbx2AUI+Aq7ZHWQcyKexNy/PYpt15ANVKgY=; b=oGe/A7GNJQxEWCMTu2nt3msf22
	8MEMuuy4aWV83sNqzcxk5bwgSJ6R9WcDI37ysyHo/oKsoUDSDUsGwcH3Tjf0qvctD3diPHCamkgYy
	1mbdL3hjZDbB9HwtaRnyI62tNlsEwfbQUZIgKGsy93xclki25yM9HFCASG/OcdcKOB2jUAHl/aZcZ
	2skIBHV/wiH2m27ZkQReWfJ0QQH3QAAlvQADP8fkv6hmbT4cJ338eWDGjhF9RIDpa60J5oI9APEnV
	toxrfjbhKd97yrNKUeqW+yyEZts8JlluVM0dCdAB2q3s8ws8RntLL4AwdxnHFlr+jRpgeD4Dz21IZ
	FGvbP4DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poTKp-00HI6N-2s;
	Mon, 17 Apr 2023 18:12:15 +0000
Received: from mail-bn8nam11on20600.outbound.protection.outlook.com ([2a01:111:f400:7eae::600] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poTKh-00HI1Z-1k;
	Mon, 17 Apr 2023 18:12:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2ZAyJa9MqgQ8jtWD9QQbsCDGQBtJNW/bL5akaYDVGFPP/xBW8Gj4cndTtVLuMWYR7VL9jn5Ad5+4g8W0TX+vJR/Xbrvd0mgAIPxuCX93at+Uu3UWp8peXviTnpAm8jud120a0pVZptIOwuq5ucvyHm1mOkCUm+5+VHrvPsK1aqCPtn1MfDPSl9pW6vJdaYB20mzLmZkLR2pCfnzdD48/bUAQYUsqNt7eaQFd20XfvdpJ1l++W09eQI+RC1Cv/nkZafBK8u/RQrCtI7Vov+dcfUcg8MQEIGvzo0VRoKZjFczloj8BGJOyp6R9qKsYHeJfI+S6GvSgQXJf0uy8Q7vOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVPFlkCWGbx2AUI+Aq7ZHWQcyKexNy/PYpt15ANVKgY=;
 b=YZyjcUdVaU1lO35LxbLVmgDGHt02STwOem/74Erlr3APqQ1SkawtP0OxDEa5O1yhnoaa4OEAA+QrFW8BoyXlQlBPWoNOtABJV84zR7Sl0SdDv4Fs2QhB4szXb72z1FDZO+WP9uzfVR8VGIn/OGjodSeR+1AQYwpeeGlJlrdQv8mqGAA8RX38GXTQ6MOEbu1UGGUiSLUhASVDI0ie9pBd1rkg/viBlROgWhv7prNjoVhhJ136IWxbYq0w66oa2Vd1Uz2MQyYMhslHQn330r5jpVEXrHh7juqdqAiz+7iPCJIHU2jbLNBbGZb3+xL+LNCOe+XCE6bTw3QIscsyQmKO9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nbd.name smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVPFlkCWGbx2AUI+Aq7ZHWQcyKexNy/PYpt15ANVKgY=;
 b=CauRnS297/MsSbyUdYfLz1GKKNJ7jfb3USuXTKTuMje08elu6ERoJx54HVaHoGnDcDhiUCKeCPyZ3eI9Vcl5CXqIOGoNAxqesJkLFg8eB0p/x9EHbSx8aTmA7VHjU5Zy8EHMKJCKAwIFZ24vOKZT+7yzQW8WZHJ5EGT64qUBeLs=
Received: from MW4PR03CA0322.namprd03.prod.outlook.com (2603:10b6:303:dd::27)
 by MW3PR12MB4489.namprd12.prod.outlook.com (2603:10b6:303:5e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 18:11:45 +0000
Received: from CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::82) by MW4PR03CA0322.outlook.office365.com
 (2603:10b6:303:dd::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Mon, 17 Apr 2023 18:11:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT083.mail.protection.outlook.com (10.13.174.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.20 via Frontend Transport; Mon, 17 Apr 2023 18:11:44 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 13:11:42 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, "Lorenzo
 Bianconi" <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Kai-Heng Feng <kai.heng.feng@canonical.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Anson Tsao <anson.tsao@amd.com>, Sean Wang
	<sean.wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Kalle Valo
	<kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, <linux-wireless@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] wifi: mt76: mt7921e: Set memory space enable in PCI_COMMAND if unset
Date: Mon, 17 Apr 2023 13:11:29 -0500
Message-ID: <20230417181130.4445-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT083:EE_|MW3PR12MB4489:EE_
X-MS-Office365-Filtering-Correlation-Id: da242e3e-5fea-4985-a135-08db3f6f33f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Hy+lxpGBwatzEc7B96xE2tY976FX0sSfLaIYkYvGqVayNTLZVMsqbLW0ruYBw8UWPod9bTlYUUFdUVdCRJIiG3Qrq7c6axwhBSvthyWGNf8mzr5JrsPS1xVljk2vzYDaBCU/Yr/TvqZPmCaGGJCy6afweVlWGxyQBDrheMVgIr/cNF9s+EXmzsab2fbaVFCcZUh9QaGIZWcmRzVRn7Sjkr3dXgq3YpieC9L0DnzoQE72rT3h7eb6VpFwzJEHmPby1Jww2OuIHX2VSMa1l5jmIAeV4BnR93ax6EqoW0XR+FI1jgxADLC0Dliundw/M83qD5vwAS/CdBgmMdCQBm9n1WxZyVKFMo0+OtFtMExZvy64RE6G1zkAX+Rt0aIdymR7SpU51xBwsH+5k0VGTsk8h6/2dwqDT5jyQrUHVn3tzV8J1rW5VTRwN/Y7y2RZx+k6Vyb+/mlipWOAzZSWvQNk3jpMcaAndaUcvWBMkQJGqqduDfxE9zwHjVn6vNoJRrSrIj1XAEB8zXV2CHtgMvWftE5vWPOXMfWoCRRhmBjoa4BbQ2ZEMrDuEOtdf5iQhKYWNzp+7EXLKHF1Dx+R2szm+toQ8OR0WEJkNsROJYlTEpxq12bfgb+/x7YH7Drg7KsAw+bXssbZUe6HwZJQlnXgG+bWxXhQFDGmdIAbzr/QqBiI9PJlVaOtL6dO20uoLwV8SOVvHgotQXekq/XG7Zuy1Y4AFCVoi3CSEfoWZvIpRPA=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199021)(40470700004)(46966006)(36840700001)(54906003)(110136005)(40480700001)(6666004)(478600001)(7696005)(356005)(81166007)(316002)(83380400001)(41300700001)(82740400003)(426003)(336012)(47076005)(4326008)(2616005)(36860700001)(186003)(16526019)(26005)(1076003)(70586007)(70206006)(5660300002)(44832011)(7416002)(2906002)(8936002)(8676002)(40460700003)(86362001)(82310400005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 18:11:44.6887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da242e3e-5fea-4985-a135-08db3f6f33f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4489
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_111207_585149_B677E71B 
X-CRM114-Status: GOOD (  11.12  )
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

When the BIOS has been configured for Fast Boot, systems with mt7921e
have non-functional wifi.  Turning on Fast boot caused both bus master
enable and memory space enable bits in PCI_COMMAND not to get configured.

The mt7921 driver already sets bus master enable, but explicitly check
and set memory access enable as well to fix this problem.

Tested-by: Anson Tsao <anson.tsao@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Sean Wang <sean.wang@mediatek.com>
---
v1->v2:
 * Pick up tag from Sean
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 5c23c827abe47..41be108e1d5a1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -263,6 +263,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	struct mt76_dev *mdev;
 	u8 features;
 	int ret;
+	u16 cmd;
 
 	ret = pcim_enable_device(pdev);
 	if (ret)
@@ -272,6 +273,11 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
+	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
+	if (!(cmd & PCI_COMMAND_MEMORY)) {
+		cmd |= PCI_COMMAND_MEMORY;
+		pci_write_config_word(pdev, PCI_COMMAND, cmd);
+	}
 	pci_set_master(pdev);
 
 	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
-- 
2.25.1


