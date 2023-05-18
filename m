Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B800C7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 15:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j8IDeOQK/fCZAR6RFCb4PKe3IkP6qRYWnBkJ1qFeuVo=; b=M3Vg/JBrtzkLSxZ2+M5vz+XFYE
	rm4/V3Hvfb8meNppOPwrzfdMoaQ5IC3/63ysTIwCDSlGxrgsZfSngHdYF6PW2BrHPiM1n1SSWPeNU
	PSZOjvW/lPzjhPJETrwvlH3/sqcEGAeqsx9m7PLIM5EF3LnbxUgH8DvzngZlvKDJb5Gz96fyrEHHW
	5/B0Lm9UEEYjQmgdRzgFvjlCk5mFj5rxbIRQyYFlwGh5U8/PN06L6AbBTz5xGXXT823TYkzAZb2Ig
	49ARkUXUPv1CKEvF1qi4eM41RhUVPA5324eiH5ToK0huf2XTzQoE0s+SR0Qic+m/lpkrOKda41R41
	MaMj9Stg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfXn-00DJ2e-2d;
	Thu, 18 May 2023 15:27:55 +0000
Received: from mail-dm6nam12on2062c.outbound.protection.outlook.com ([2a01:111:f400:fe59::62c] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfXj-00DJ20-31;
	Thu, 18 May 2023 15:27:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuoY6Rf4WuQE9R5gOnuop/UOVDkeK7BDVujrwXcRGlp2U+SarHACOzc7xWk5nATfLaJqQOwvsl/7ZSxggXt9tMd2dfAZ3CMXYbXZY4pQ7T/CRWjB0kA30B6t9h1w3bQ+34s4o2bSOShhpxjUleRzDpDkLrtkJkMmFi+PWWAc7oUFFrB+uRLH8EgoY9IfXNG5af+2YQs9r7IlwP3MUCrRBvy3Y+hPCMiW7li6xnLttLNNWkKz7qCmxTewbu5xHEkDKiLbZ0B+GvQZf31z/RBLsXR7jXhdkPOB8JyXOxOumyEqgKf4PRPn/CDg2A0w6sWhUIj0rgQD2Miqpqto0C4xcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8IDeOQK/fCZAR6RFCb4PKe3IkP6qRYWnBkJ1qFeuVo=;
 b=a+88gaRwx8L9CVBngwiQ7mVUH9/ZZrnBFuhrtWJbNKfMKoF5cKErYGapihYKE/4PHrJ7W8j6vASS1H8ZjUhKU1AIk1oEHRIEtUcQgEImWw4ja8lUWd25NxB7BlHDFrLrli7JxK6bfePaD05UkNXbzrILUr2w8b43dQ48pyI6+DhxNV8N7W/fbnMq6rGGHmDxiv6Ze89r/0ypLKepeV6MI7VPp1aSdA/9e1kdH5PBH9SVKRxWiYBvAdTyTq4vq+MsTH+vm41ORWZZnm/trweV8Fg3fcHJVCah/HttjkpaAoZqiXXC6MNHMDF9Bezf/6B3peKK58Mw1lxk2wW8+x+7ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8IDeOQK/fCZAR6RFCb4PKe3IkP6qRYWnBkJ1qFeuVo=;
 b=Vmw3elRK9emXvHlz09iBGHmQDD00GfgbYo6mVkWwFaxzxZ2pK/ILsUe6Pd0PqshjpvzzX1/TBE7bJIpkXBYteKf3tV0yukEA7G1LFHX+MAMBmFOD5cBur4PM7j7QZMcYSSFCxsyBY2b7rlw0cGoV5JH/u0BlGMdZbp2/udpPVpc=
Received: from MW4PR04CA0267.namprd04.prod.outlook.com (2603:10b6:303:88::32)
 by SA0PR12MB7480.namprd12.prod.outlook.com (2603:10b6:806:24b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 15:27:44 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::12) by MW4PR04CA0267.outlook.office365.com
 (2603:10b6:303:88::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 15:27:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.20 via Frontend Transport; Thu, 18 May 2023 15:27:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 10:27:43 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 18 May 2023 10:27:41 -0500
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<geert+renesas@glider.be>, <mazziesaccount@gmail.com>,
	<conor.dooley@microchip.com>, <j@jannau.net>, <mailingradian@gmail.com>,
	<me@iskren.info>, <lpieralisi@kernel.org>, <devicetree@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH] dt-bindings: arm: Add Cortex-R52 to the list of enum
Date: Thu, 18 May 2023 16:27:30 +0100
Message-ID: <20230518152730.82954-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT033:EE_|SA0PR12MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ee5c76-0921-449d-591c-08db57b46d39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	w4HAmigCsMumbKDmq9NN/ANg6N6U2pniZZ//BUOqNdmi4B6BEow8XdjDOlZvRJSr3CjrrH1S7bfmU4YaJVZpZOKJi8euYUMxBmtWqchixWpaE0z7y+Zb0COxSVmD5XLe9I5/why/HJi06ibg/qotE0BqD8aKi1HuCNxdbUxJH2yRDPrzw0e7S1bDbXfIk4YODw9zOgyUT5N1reRAPtPI7B3K/pp3Rx4tEk8RKOMLkOdErmDloqo+UKkHNI6pBiB4G7vtKCdFIZKX3VxGQU1NO/z3UIJ5gYLvM+fhRTYFjHhf8TP5uPnAw7jaUcK0FOWRvPCrrMZ8MkR/3qczUxZ3BofE1OKIUjjUnmiymtPMmM8WKK12yMUHfKKJ4OynHUqAiHXDVKWIaN0xdSokDwgfJDmthD6z71T2X6K4FJcMnWi4N63+WGjqaHL0LxaUL3qCOvLH9HrL+TbRbTstHAW506d1OOVydu0q385Hg2Yg+w9sX0FHF1J7SKHV0nMYVCm2BzoWUQekSZB42Iy2zLp/zeKzknKGXtscUCSmlbZOapu3TVUKfUBaIgUbL5MfIeLiTbu2r1dx2w1KalIo4xI7WGby1ycx91rLjt8vSRL72hhVdaaNOxCga9XyyS1cKVs4EKsOduPqKUX7VFSrL+ofgU2ghYsyuFZvCr+E9Sz4JZEKEESAegVsnVwbVX2ATdQt3oJXSeFe3efcUQ14wpK7zlVqsznknGTQKPtXPxWLWdgb/r6miR/fa1hxTazCbWtURl7ql8+/WSnw4VzSXrG7b3/IRq/h9GXv2eXD0ec9JF/Vx8TL064kCqgh//44VWoB2V3vE+t62ROy441yGn67/xZt8axf4UN+5/x+UxsJSWI=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199021)(40470700004)(46966006)(36840700001)(6666004)(40480700001)(40460700003)(1076003)(186003)(26005)(5660300002)(7416002)(82310400005)(41300700001)(8676002)(8936002)(4326008)(86362001)(82740400003)(356005)(921005)(70586007)(70206006)(103116003)(81166007)(316002)(54906003)(336012)(2616005)(426003)(36860700001)(2906002)(4744005)(36756003)(47076005)(478600001)(110136005)(781001)(2101003)(83996005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 15:27:43.9543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ee5c76-0921-449d-591c-08db57b46d39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7480
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_082751_995947_BCC44D7D 
X-CRM114-Status: UNSURE (   9.55  )
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

As a pre-requisite for porting Xen on a Cortex-R52 based System-on-chip, we
need to add "cortex-r52" to the list of enum.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index ff272e517d57..64b58238e3a1 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -153,6 +153,7 @@ properties:
       - arm,cortex-r4
       - arm,cortex-r5
       - arm,cortex-r7
+      - arm,cortex-r52
       - arm,cortex-x1
       - arm,cortex-x1c
       - arm,cortex-x2
-- 
2.25.1


