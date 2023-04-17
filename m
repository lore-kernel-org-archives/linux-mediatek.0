Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6264EC77B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 18:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVPFlkCWGbx2AUI+Aq7ZHWQcyKexNy/PYpt15ANVKgY=; b=4rEMOjKTrRX6oZbDHR/FT90d1o
	nAw1FiNkRui/4NSLURzn7ZCIPsmdSoqy9Z1jR2g9OXH/czhp62OtbcWoC8myGvZ/wPfeWxjQIs63a
	mIVOWjQoeQ5ImTzEwmwXuqSMDnXZABGJSnZwBLnF4h4kPdA/J/dKE+51SQOEW0Si6SAXNJJvTMTkQ
	QyGHJiTywxcKp1jgz6gwOe6Yh9TeDH737mKVkvubhvGlaWbgyveh2M070LkFeqeU5w/EwPwikSRky
	hg3HlNbk/xkK1ECCo8tiup0WuFjNyTHn4/rMZfJSZwC0mm0i48yp05vYRgZhjTq4zgBS4RraxoNQG
	A/q+NM3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poTKk-00HI5G-13;
	Mon, 17 Apr 2023 18:12:10 +0000
Received: from mail-sn1nam02on20629.outbound.protection.outlook.com ([2a01:111:f400:7ea9::629] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poTKe-00HI1e-22;
	Mon, 17 Apr 2023 18:12:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0ewRoiknnlgkOXjbnpS9dvyw1gFhwyG3/rSly+Kf+RlUT606HqWVsIFE2gQ0mzwfczmSC6oL4ssQXeXll+/gDLsr+9PLJcc64neeLHJvOVTTiz6GJoUkE0rFcksaSB2q4Jz/YAGO+u9BeH5tuGhpKDgfZ1Figc6w55GAGmDL/6UPT/1krycbOpLWERF6mCenDtfcV3OcoP0/s2OgUN4GMXQJAegukJXJPv0Ff/KcN3UVGSRSR1cFy+59Slse94zBIPps2vBWol3THciM2TvVlfezj2aY0luedUF5iPX0M5D+yN2aqrxyTxlVxjhUQV825Xh4TgfQreoRxfKPHc9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVPFlkCWGbx2AUI+Aq7ZHWQcyKexNy/PYpt15ANVKgY=;
 b=PlC+wSGIbNkKX7btB3Xdj08k7FjYoMMDCXzLYyvUoj4J++BAU0EqaKTAK68NgHX1pDhMRkSnHAqmUYrdPDX19iylShAjEL+YUK/8E+TiE5pRexqx+UBo/j+MGGAOexdlWtXnZGRvR5VmviQfaXhFn6pQMHa1JOWq3VpaFXXeAvqmDt0qc695Up4VuQhUgZC2srNw8moWjcbOlSphe1hVL8qd2U101XUALdxWDE+cKDIHQ9EkHYfL3fAwZBwHDU76rwgtpigCglkCVjtLirisIeGmNwbyalE7V7/Qz1zfDI3CXhtA1cxwBP4q4nQyq87mQnU7O7+j5QtKSqvaLdRqRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nbd.name smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVPFlkCWGbx2AUI+Aq7ZHWQcyKexNy/PYpt15ANVKgY=;
 b=RoY3taR1T4JXRKg9v3GBe54lzZdfeVfALN9KSWfZ0GiWHfnjI0EUVmozBR+Bl/sDXh80EBSfQkaVquNcIe008zdvKXVl97s1eoq1FZxMMU6Z3ai7pCi4KxeNTyhTzR8L9ZjYon1tVzM553n1p4HRcsdin7zPxfy2rgFeARgsM/g=
Received: from MW4PR03CA0308.namprd03.prod.outlook.com (2603:10b6:303:dd::13)
 by MW5PR12MB5652.namprd12.prod.outlook.com (2603:10b6:303:1a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 18:11:46 +0000
Received: from CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::77) by MW4PR03CA0308.outlook.office365.com
 (2603:10b6:303:dd::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Mon, 17 Apr 2023 18:11:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT083.mail.protection.outlook.com (10.13.174.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.20 via Frontend Transport; Mon, 17 Apr 2023 18:11:46 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 13:11:44 -0500
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
Date: Mon, 17 Apr 2023 13:11:30 -0500
Message-ID: <20230417181130.4445-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230417181130.4445-1-mario.limonciello@amd.com>
References: <20230417181130.4445-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT083:EE_|MW5PR12MB5652:EE_
X-MS-Office365-Filtering-Correlation-Id: febcff06-71e2-45d8-5390-08db3f6f350d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2aHYYuvZ7Z3lsceNoAGAruipanXIiJqfKoo5OZ9MlNH83bY8ZejsrPxEoQ5EYvADML45cbkLxt3bgh1BueCjjWVsK3bdclyuuuZGvNzAXfGgFy2n5s1OmI/XgghppHBbAfNV8HecYJDFrKMGQJlYzTJENXQweV/qrqHwl+Dd0G64enT0yGVDNU002opCygTs7QKmyw6esmLGX3upmJba0BEuiT3qRL60i1IxgIAeXM73yRSaQRijM4sqtdPwJ04ppON6MHRbAryfpsuw5jHL1VBKdHSGU8Jtv2PAoTKsK8nC9fpaVrVq48gHiwbLW4W4Wxlf8b63GkqAapVS4pjULqb1OheFiecDd5ZLGbRzdjYkyyqedxlJL61p6zqaqDMlcxkaA+5sSR/fHj473RyKImUgpH5GilmWgClKHzZmAgWkprbdR6yTbdVfYiMpBaNlmfHFn27xbZKEUVPrO7C0tsgqjYejVbng7NMbCP/D+o3yuXAUzL5ZZXxUrzdoHqXwKnRz52BMjiEP2fTS38NpxbcChCpXmKyzoKYzJlzBYtj/xKIWo+1i2yEDcbjHMYYyA1+kET40rUFstslL6dUJos5YgcN2gRneYECzYwsafQ4aFcwRClB/8rdcB5YnQB18QFxVXuAtsANGsIk6BKF8d3ItGBZB2CTKuwpVlIscYr7R1HWl454L7Yo0mdzuCDUlvbwtIKDwNDwIW2eFbCDO1VZJRM2QF58xS5j8khqHWSo=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199021)(46966006)(40470700004)(36840700001)(110136005)(336012)(426003)(26005)(1076003)(54906003)(40480700001)(47076005)(186003)(83380400001)(2616005)(16526019)(36860700001)(40460700003)(7696005)(5660300002)(478600001)(41300700001)(6666004)(82310400005)(316002)(8676002)(82740400003)(356005)(8936002)(86362001)(81166007)(70206006)(70586007)(36756003)(4326008)(2906002)(7416002)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 18:11:46.5324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: febcff06-71e2-45d8-5390-08db3f6f350d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5652
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_111204_696616_BBFDDE51 
X-CRM114-Status: GOOD (  11.59  )
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


