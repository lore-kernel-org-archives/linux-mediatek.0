Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ABCC6FA82
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZN65V4SAsmTbXDdrExx0lCRQba9W/e1iDSip9LqBfA=; b=hx02tpMBbe+XQ3JMi/yDghOd/l
	/7naW46yTyWrdxCHMHNbcv31IbYFUlwdgeSwM11e0n+gY6VkabImMVdJgLuRyMoCeSCB5A0TpsJXz
	1AIsvSELY4a+AZ5DN3SKzc+BKYdU09pE858MZG/J00/IafihuY6WYj0txDumvh2CJa1O96kdxeL2g
	11TbkA8JFBy3PxcSMXkCypjavtYYYNsdBcpJx+JiNbFyOy1VH0o64ZIZDL2A74DIYu2A67hIh3p+4
	IhkS1BHBzBDPlrXqYvQCnFIn3fTMUuHpRFsvBR8ejlO2uXKRYeLh5wlaShQUW0Fm9jnVkJlQh3Agl
	5NsFNrGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obIHx-00EOE5-9J; Thu, 22 Sep 2022 09:14:33 +0000
Received: from mail-mw2nam12on2052.outbound.protection.outlook.com ([40.107.244.52] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obHz3-00EIkh-II; Thu, 22 Sep 2022 08:55:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gl1OgbEPGCN/5ZDzPQCZ+t6bbpl9Dfn3/LP+vs+UwLwWWMdZcGOkVda3WAygVu5PPE8KVuPqucB7Im7jHEVaUPbEPBj8645sfGSKJKs4UmcgG09+rxIlNIXqxBgHO+dDnic7P2A7YPDJkpujfabx2fMpTVkMFTMhT7r22x2gWgteyho0rSPdlBmD7zGtVL+o9v/Ww7lZeSfrXc1vqaZFDomYDjzHK+U+jHFBLJo2IxVjFMf7l+ssuTw5PKMKACJJKpmZIKR0ZtpQ+Yx99abCryMkFryiHIsb7wQ7bvO1MK6SxlBGzKOtazD0/XEiQw9ymcY5KQkK8Pu1PaTggyJo5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZN65V4SAsmTbXDdrExx0lCRQba9W/e1iDSip9LqBfA=;
 b=GoHVCQz/7wB1nUDiarLFicgSiG3N4qv6jbr84D+K0JM5swYFrDkuJgp2hpqhzXd4dCX/fSF8c89hesp2H1bc2/KVk5VAnznFhr8hg8S4DrE8rp+i/ce526NrVxC3Xe1QzJPiuS3VDS9SA8G7J8xW4MhC5MAEgz9/HTTzWVHB6QeTFE2uFDh98HxIY88Wc389W5Wbw3xYoDu1m9Wd4kHkIZwY+jrhVDuK4FwlX5ZGgoNOailNHODABQkiDOpS+jsMezoQj3+t3K+bRVVO4kOsCtSdLwfGKefsBYlokz+eubsZDnizzodF7D+wEV3AiZ/Bme4gY+BfzmWoiQ78kMnonw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=mediatek.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZN65V4SAsmTbXDdrExx0lCRQba9W/e1iDSip9LqBfA=;
 b=Qci4lV28XLVRQMqOVyqdOx2pimXOBk5KnBKhcL5a9bZCjTP6Zjtf2U73tGGgP6QlzgzPjfNCkkQXTsvzy8xtkvp0xpAW6CWiX/xT9lEbfxYt3QsMd1Gc8yewsoHZRa7RGii4XyKtBDl3DtTD9FYl/bot7X5g3Yg4hrXnb4KUeMtFhsURiHa26KfziqdvJ4RSNmM2ajq5ZcDHU5vPR0v+3XcxRDfnTZeSC2aHu+LdVAgS3S3gM26djEZyNa+Pw9qvsofkCthvDVB0PmzIo5H89JxVbxN/szaWHjq2gnPq/VlsSrq8aiFM9mRy+GAEE9hENmtoZbzRKzgZcDHCbKcLyA==
Received: from DS7PR03CA0179.namprd03.prod.outlook.com (2603:10b6:5:3b2::34)
 by DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Thu, 22 Sep
 2022 08:54:57 +0000
Received: from DS1PEPF0000B078.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::1a) by DS7PR03CA0179.outlook.office365.com
 (2603:10b6:5:3b2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17 via Frontend
 Transport; Thu, 22 Sep 2022 08:54:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0000B078.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.11 via Frontend Transport; Thu, 22 Sep 2022 08:54:56 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 22 Sep
 2022 01:54:47 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 22 Sep
 2022 01:54:47 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Thu, 22 Sep 2022 01:54:46 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <yong.wu@mediatek.com>, <joro@8bytes.org>, <will@kernel.org>,
	<robin.murphy@arm.com>, <matthias.bgg@gmail.com>, <jean-philippe@linaro.org>
CC: <jgg@nvidia.com>, <kevin.tian@intel.com>, <iommu@lists.linux.dev>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <virtualization@lists.linux-foundation.org>
Subject: [PATCH v5 6/6] iommu: Propagate return value in ->attach_dev callback functions
Date: Thu, 22 Sep 2022 01:54:45 -0700
Message-ID: <8040df414a1d4bc007a25553b8341acf37ead670.1663836372.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1663836372.git.nicolinc@nvidia.com>
References: <cover.1663836372.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000B078:EE_|DM6PR12MB4340:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bfc6a9e-f145-4243-a1ec-08da9c781fc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VGbJnvZ2iFM93zBbE7+1JwSfYOBhb+OyC/cMymuv8267ylo9TT2HuV0DBG8/xw3eqlPdE3TzEx72tyCVCXEpBtPS1VvhznLdsP4oN8wxAUja/fwVjZ1qriEh9t6RMXMCf/Tu8X4nLZUctxa3hekqtq2i2vKZHrIPOGGDwk16RbcS71trnqZyc4fKdTaLpfGn6D/RUf/LpHUUR634fJQRTYGJfGioEa65SuMLeGpspq1AWCbwt7jja6/cuUQ83OKZ14+pQ8zENhRtoCgJTIVI+y6QONUm5SdL39mOY4QBjUbkkVIxf/bFVvxDm/QLguqR5Jla9hgCHViedvTwX3qafMffu+j7A8sdI8VIwGXNs6mLaIskXRuMEEg0eA5vJbjw35y8tboQIFyi4Ify2eskqiCv8jC8rLeI86Q/AlsqfcgfzK4+Bnrr0116hcPCBbFN92s1ra3RWWwHrF8aSmhESdkiirWPUj1JyFbbcYNMwjSryJdx2wN4qdR9wZC4X+3vd6QUF97edhmTrTAD563LPwqbG4Qzx2WK28OJ+JvNiveTgtxUsSsOnL30RtUMJQrubLvncL11ppDzEcEDEIs+NLwPhklJ7kfWXZrLpsBEICwzW+0l+VP/0qqvXHGo4xMLEFl4GEQtDh/pb/HIuYPb3GDY5RzRTMHB4bFxDUKJayGq2a401jeXATSt4p+SuoNoe6f+r50veV81NDBrBkSMPYPPlWBRJjjFuPCHsVK+TBg2TyuBe4Jzym125T4JT0CbA8o/OPO+BCQIKfQIgjTyFw==
X-Forefront-Antispam-Report: 	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(82310400005)(478600001)(4326008)(36756003)(70586007)(70206006)(41300700001)(110136005)(8936002)(40460700003)(54906003)(8676002)(316002)(186003)(36860700001)(7636003)(2616005)(40480700001)(86362001)(82740400003)(426003)(336012)(7696005)(26005)(356005)(83380400001)(47076005)(2906002)(5660300002)(7416002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 08:54:56.7666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfc6a9e-f145-4243-a1ec-08da9c781fc0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DS1PEPF0000B078.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4340
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_015501_668340_B8E95E5F 
X-CRM114-Status: GOOD (  11.74  )
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

The mtk_iommu and virtio drivers have places in the ->attach_dev callback
functions that return hardcode errnos instead of the returned values, but
callers of these ->attach_dv callback functions may care. Propagate them
directly without the extra conversions.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/mtk_iommu.c    | 2 +-
 drivers/iommu/virtio-iommu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index be1a7d1cc630..c30dc8f81778 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -666,7 +666,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 		ret = mtk_iommu_domain_finalise(dom, frstdata, region_id);
 		if (ret) {
 			mutex_unlock(&dom->mutex);
-			return -ENODEV;
+			return ret;
 		}
 		dom->bank = &data->bank[bankid];
 	}
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 87128266b6e3..35de7b433b17 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -696,7 +696,7 @@ static int viommu_domain_finalise(struct viommu_endpoint *vdev,
 		if (ret) {
 			ida_free(&viommu->domain_ids, vdomain->id);
 			vdomain->viommu = NULL;
-			return -EOPNOTSUPP;
+			return ret;
 		}
 	}
 
-- 
2.17.1


