Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CE2ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 05:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OPtdK5vqb2uGFrkAaeT6Is+ZY7/2n2KqH/pCDOzYZdE=; b=TITbnD80ACw8xlGPESFwa8FUR7
	SN7VLj6xrM9e4IeN4hLyX1oqAXLgpgjS14oJKE/rGrgXL88opFXDpbkfVg2dZIDJKhnI1oL8lpmZs
	WXgb5L6c21LJKDbMkm42crRIUbad1ra+N9MCBRQPvuPywtrH32/KEDArZR7RW/JUAJWvA84BwUtTU
	6syIU4+rCaFaKD5iobCwEmSdGMsZR+SlhxGaOyFp4/w83cGKHLM5Z4aLmGsY9+TKK5gvkV0LuDUG0
	b+H7336p/1svOfOgJgm3I4sLxKBH1HAeepYkUeZ0Zi6AmmX/9+SvbVVH6SYI3MLr/chD87d+UNZBT
	W5L5589g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYKkU-007NJN-GC; Wed, 14 Sep 2022 05:15:46 +0000
Received: from mail-mw2nam12on2040.outbound.protection.outlook.com ([40.107.244.40] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYKkP-007NE6-Va; Wed, 14 Sep 2022 05:15:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ug0OYAESwdsIHjRJKrI6BimqFBYFFPsgWbIFZyrUEXwMdRwyE3a4FsY0qWa/20n7mOF/9M4YhT2aDCCm2SLg0MOSytOHjNxQtURtyKuqXkW/FtWppBCQDxEMutXXbVXqF3EA9Sl6EdBhGQ81tzHNnRvmtzaghH5UaKSQQZR5DuExbl9bUGbZloqhUXXQOLnSlMCFCKF+de89+2zjGeT37WfQWUeBOl+S+UUEYeFuxO44Sp5VnHD2kMnVq6NrdJlKqPtDz+ENrkuunoxYw33yNBaC62l3+ee1EEo6e1gqpchOStP0yRt1Sb6MzQb3/KMzii0WG3X52UcAQlzkXpPUHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPtdK5vqb2uGFrkAaeT6Is+ZY7/2n2KqH/pCDOzYZdE=;
 b=CSFEaQlPDDUXxHD7S9gBdM3nvRP9/9NZaf8Hp3Oq6R2JN5Cp1MwviGXMI5z5VgaOdy0ijiSuQe39UIDz83IwF5bjxWZGBNULWYlFqzukezMzgts6lCZ68fjlaFeQ+CBUtvI4zNa7LazHX4cFb0hf50ypFmCsBcwVU9f2sG23VGqBv8QaASqXevjUu+3oxBV4GGwgbhZnrxkf4Y6OPaFw++6z2cWAi7ZZoGzbIc1e7oe0dnnFy1qKz5//MXOzdPeTMHbp3DGLHr1aZLDw3Re/sNPNf10XpO9B8HTsK95iF+qit31lYQAU2DKpzjgWbSzg0FiMejuSDWOjNdEIoINWlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=mediatek.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPtdK5vqb2uGFrkAaeT6Is+ZY7/2n2KqH/pCDOzYZdE=;
 b=VsQtF5xwzu5p7RiK9qU0p1KdUO9Y7tpthE3HvKtzgf6x1nM1ScI8MFylkEYajzqGUkSN63wj7tscUyfC21DDc3kdoF+f0RymI6+sE2pdAa4usHGolMsOSeTfwyiub5wGn3WPVcBiSnwlF1h1RldJv+/ibbHhMQLRNtlk46hlSper06Js0aRJpTMU0gjVxx/8/HGTsNc5xxVJYtmwySy3vFuH+o7n3SGg8UhuxhV0DRqVXc5e14K2NVn/Vbq4xi031RgI8nW2CecBU2bUcjHndmtnuCZotGAEQRgexOocJ1MX+6oonuKwC53GkO/JyMhCD+8mjEiQ+zIPzJoxX9BXFg==
Received: from BN7PR02CA0018.namprd02.prod.outlook.com (2603:10b6:408:20::31)
 by DM4PR12MB6232.namprd12.prod.outlook.com (2603:10b6:8:a5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.22; Wed, 14 Sep 2022 05:15:37 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::8e) by BN7PR02CA0018.outlook.office365.com
 (2603:10b6:408:20::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.12 via Frontend
 Transport; Wed, 14 Sep 2022 05:15:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Wed, 14 Sep 2022 05:15:36 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 13 Sep
 2022 22:15:16 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 13 Sep
 2022 22:15:15 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Tue, 13 Sep 2022 22:15:15 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <yong.wu@mediatek.com>, <joro@8bytes.org>, <will@kernel.org>,
	<robin.murphy@arm.com>, <matthias.bgg@gmail.com>
CC: <jgg@nvidia.com>, <kevin.tian@intel.com>, <iommu@lists.linux.dev>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 08/13] iommu/mtk: Constrain return value of ->attach_dev()
Date: Tue, 13 Sep 2022 22:15:14 -0700
Message-ID: <20220914051514.10432-1-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT021:EE_|DM4PR12MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c3b14b-006d-4a6a-c4cd-08da9610281f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/djJLJQhhY+mtv/eKvdFSwD4dHm3oEYjTJcn17NteG7cJMlUbcTzCpd6YwHJHqGzG+qpdMX575C7TXZO2tMrVuD3O+4naN3SLTQiSWpFXCIz58NL7y41N/7ke3eGLKGtKUOZaitakmV9wRpBsSN8VDOdubjBwsjaAeBb2EIOLeefgkvtXwSUAGxJKnua3qOzX5bpgiIDLCad6PnA5l6jI+O7yk/xOOzIoPnCCb8jTSFgfdOv8FSMFBvgcm5a59RX+oA67jrWbMILtTk3p6swxVwtW7kP0EhEi86/qd6L3SWi3IqAzWYpjFT3N+p4SjSI+jLPCoZJtDuXeaYVkzvIQI7umGDvzsM4KWKBE746GUVX5RggTu0Ns49fYahiexC1MjI+cFK+yTNP4SFMO07ZLR2UBEqkYhQ3H6FKHO+yHvOG8vj+fbAQPeE45AsAltO1OFLb+sTpFoaNTiuvvFR4kdqhR2cAW7uAwoJoXbjqYZha9dCGcDxYICjGMXUQqFtqv8GOJo0cRD/jMh268TWt58zPvZd6RJa0eCTi1WRDmzj0KVPHfH7jPD0hdOKS6R25Te5XZLw++ORtaq09roGWVofG2WDGgahJZogfXW2ERtmU5u9Rx3h0N/LAfJg9SaReeywpJqSihDzInVRyarBnG2yXAd7mEc2D68NRF9+mng2/BojpG0U8KV2A/bHxJCtYV9jh2U4Monf0aA+0eQH8X0GrTZPxIALuJl3BIRjqHquEkR0EVRNwUQuk7Auo23XAg+XawEa4HWA6+gkSHOcMKA==
X-Forefront-Antispam-Report: 	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(86362001)(8676002)(110136005)(41300700001)(8936002)(40460700003)(2906002)(1076003)(54906003)(70206006)(83380400001)(40480700001)(7696005)(478600001)(4326008)(2616005)(7636003)(356005)(316002)(5660300002)(36756003)(426003)(26005)(82740400003)(47076005)(70586007)(7416002)(82310400005)(186003)(36860700001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 05:15:36.0972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c3b14b-006d-4a6a-c4cd-08da9610281f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6232
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_221542_072018_D65B1380 
X-CRM114-Status: GOOD (  12.05  )
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

Ensure attach_dev() callback functions only return errno values expected
from the attach_dev() op. In particular, only return -EINVAL when we are
sure that the device is incompatible with the domain.

Also drop any dev_err next to -EINVAL, following the attach_dev op kdocs.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/mtk_iommu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 7e363b1f24df..78c31b307ee1 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -655,7 +655,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 
 	region_id = mtk_iommu_get_iova_region_id(dev, data->plat_data);
 	if (region_id < 0)
-		return region_id;
+		return -ENODEV;
 
 	bankid = mtk_iommu_get_bank_id(dev, data->plat_data);
 	mutex_lock(&dom->mutex);
@@ -678,12 +678,14 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 		ret = pm_runtime_resume_and_get(m4udev);
 		if (ret < 0) {
 			dev_err(m4udev, "pm get fail(%d) in attach.\n", ret);
+			ret = -ENODEV;
 			goto err_unlock;
 		}
 
 		ret = mtk_iommu_hw_init(data, bankid);
 		if (ret) {
 			pm_runtime_put(m4udev);
+			ret = -ENODEV;
 			goto err_unlock;
 		}
 		bank->m4u_dom = dom;
@@ -693,7 +695,10 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	}
 	mutex_unlock(&data->mutex);
 
-	return mtk_iommu_config(data, dev, true, region_id);
+	ret = mtk_iommu_config(data, dev, true, region_id);
+	if (ret)
+		ret = -ENODEV;
+	return ret;
 
 err_unlock:
 	mutex_unlock(&data->mutex);
-- 
2.17.1


