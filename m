Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67B1C27C40
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 16:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dijjnmcTwEIG43n1u0a4rcB854nzj8vKoYIf9eO0DwA=; b=PCqzvB/kdYY+PxcyHeo9iIwZrf
	mxr7DKLxm8TNxJQYXXylNHEo126c8SNWV1fV3H3swhjCDhDq9jyZ2wsDKTQRPpK3661+ImEpEUpEq
	XMpTd7gxp2f+P+osXbqA62ejUeqIWRz94Kj2zwIE9QFfbOewq6vKgUZFDtZL1T5KKgSzuuR9vbOOy
	TzCKPItI6mhvFw3Ndc6fNIPyQdM161tJoCqKY9Q/sq4pPDgxbj75ib0oRUTv3DKuQzzj3Oe4w1l0I
	2D9JO9p/e3c66vbQGOIVUODinBc2l2NL1J1T0IadTu9usuMiK1MesDi4riAvyL6H74TwYCfonn7IR
	PmLWQbtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYr39-0017q0-39;
	Wed, 23 Aug 2023 16:49:44 +0000
Received: from mail-bn8nam12on2061b.outbound.protection.outlook.com ([2a01:111:f400:fe5b::61b] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYr1Y-001692-0k;
	Wed, 23 Aug 2023 16:48:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fksyCxY78VmFj9jTPOeRG7tEDr4evSjRD+2YN4hUD6k0kb9ti9gumfKpAbUQPl+/ESXI0Mpl7RF3QXZK5+PINw8GiO73Ylmn1/mRniLM3rzObSWc6p7fT3HNTOpwsIeEjIGeCCwqK5RjWE/4SYq5QGgt8SVZhg6hv5/xkQNespe0sIL6oIZIOAvncU2dzGX7PbiJ7HuW0XqfyNCQoYsyk9Dt7SITwgEUez+fyAfFec7IE826w8V+ZjEsARJ/ZpJQMrpD6Yqc5ce6gq4sXVGa/3+rxQtUpLzV0gRpMg/OiLvbDrDPVH2vjcMuYyJ7HufplxD3eIY7FuaYX8YQIm0Mqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dijjnmcTwEIG43n1u0a4rcB854nzj8vKoYIf9eO0DwA=;
 b=cmWUYjBCwV7pPkus5V076VDE8NtUaMmftez4ikWvJ4CW7AYAEjbwBvX0wrH+XrtBr0lc27jM7/WTT0uPdZd/tduA2yvVF16+7GOTCBtSnk1y37ozv1YZZLUnWBGyt3f9T4uqZG/BgPMXIPGYnXsr6c26rhERLTYQLop7GOPKHajk7Jgfbes/vUAg96ch6pMFocdh1lUEuOheXDhiLzQr97FhIN86jj+/bHGAvI3zXYTuF6r5P7dMlZ4tWIqd9T5S5yZRe1ckdUdAbRIHEO5xFv7D4fJKahVHY3ehvuK/sh93W7bR8FJ8Jxi2rKGKQFJo4fTUsExrvOLqHhEhwuU8nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dijjnmcTwEIG43n1u0a4rcB854nzj8vKoYIf9eO0DwA=;
 b=GLgVzGy/q267Fg2e7eUr4a75axKOjb8Tb30NsehpAS3pOQSDnWwdvRW2UUHmIjO61Bfro/dOtVr3rcPoGiPP8lU38QV/iskQb1q/oHJukZ/e65syS3Sbw+MsfHbGskjJpteEBvRO4NPraDf+V54Vl5Hcl93nwdy6G6yKCJyPO7KMDPNiKGQ88wXqZYBRLm6uRNOF7wNZWb+zB5ciBEmnRwyTl4gS2TrsjIo/eLoZq76RZ2N7cJZeN5xVFaCVc1/0cCfCOt+lclYPGXqav1dF55/sPgHw3AP7tmBH32MEAyK3UAJP6e6OsFC/QwjMgOsgF05zPxGPc9r97YkH2C1+2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:52 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:52 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Andy Gross <agross@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	linuxppc-dev@lists.ozlabs.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Steven Price <steven.price@arm.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH v7 07/24] iommu/mtk_iommu_v1: Implement an IDENTITY domain
Date: Wed, 23 Aug 2023 13:47:21 -0300
Message-ID: <7-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR20CA0003.namprd20.prod.outlook.com
 (2603:10b6:610:58::13) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 6191f347-3296-43b0-9036-08dba3f8ac4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 033gPEKOPZi2dMkERjDPoVi6jpbAKV9YvQzSQJGZzMOBx24e0D6HT0NypdN6EJh6wJa+3l23hNOkWA5Jz48CYgaPhWfIbxTE1M8UYvH29zhIIG+GLxad/tVd1cHAM+vVH7cYO6vdLOuKVlgvqYC8YL5nEPZ1vQUGoVDgsnXHQDmdUUyqZ3ZoK54cKY5YCU+G70wCE+2XLnsIvmGLpbqF/ANcOUC6yIlF/Lt/iJp5dQw//rlNCk8BGbCAMrQnFBZkoKT9C4tr+1nPCT2TKf4Fzyc1X7/A0CTGhToWEQavjTbqzCvHXP8fMGBzO6maWqNLhGmzLsxrUAHSlwY1q8QTFtWNbw1kqPGnJG7A6XFMIiEKZIRAng25/yym85YTaeuj7w/zRyzVsa4nKcW6KgPQAvo+pv9c6m3SVPLbOYbGTALsX1lzlVVMSpJb/2eRxqb//Z6WtQOlTo8QSHBGJGzbI7W1VeZYzlxtoil4AAfIbXwyIzHvCzTvrY7uequp4Zu3RIFRrslpRfhGd/tOuarAp5oYWVDqPEKSMUrf+KYZ5lGAx2Pv84U+d4Fin7sqvGhLvCWSAQpdMC18IAf1Nl4w9iEK0qvAUw4d+/jh2JWdY3FVu9F7UiFlKSK3HhTrzfOs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?evJTVMWrKKykVUWO7uLrApmaD9mIvR1Y+SkA0+jQXiJbeJnhrPXru4+wtZBc?=
 =?us-ascii?Q?OJsTrtGdgFplwIHY1shFvIgzHYuWCAzx5hSEpVUGmzcSOdSi4ILPyAROVs0o?=
 =?us-ascii?Q?D0/pIWiD5wG5NxK7qMsYVebgZUUPOKS2gAKn0mRSujIYYeHdbmtw+8On9ZJI?=
 =?us-ascii?Q?8ypRrs9ztI/Ae3O+C5ehYPBhK6lxbFy0MVNAk1lzkMi8yivQNXwFsC2iJ3FF?=
 =?us-ascii?Q?nI3dGqqPtmX2ie95tHs6zO7+zPgzDJAe682TiZlYmQWZdf/0uWrHXzJb+K0F?=
 =?us-ascii?Q?ScKUrOaFyNJZ1We/1qSgHEiqfhg1l1OizpGX0/DNBLyOmm3ophqqFXGyLIcn?=
 =?us-ascii?Q?kjFiUZNKiShcwyG3Sm31+lHKAJUlLsNGB6II1eBqd/DbqdxSFvJWQ0veXdOY?=
 =?us-ascii?Q?RNuFh9bWCshw3FHtylbA+NEG0DXENBwrqw1l3ht2u/pwt3KkGaZNHaDIYYxF?=
 =?us-ascii?Q?LZSMHlLalwdH1JKZgnMREP/ZZutlE2fQDLyP7Kw1OYgQQcQUbVa+f26O7Cmg?=
 =?us-ascii?Q?eJr+g51n9m8MacerUmZRnVYMXC71WFXfEVIw++F46tiHI+P0Kjl8mEUoG1Ha?=
 =?us-ascii?Q?yYHWdj2N567+JNrf24PXuZhMeqb9nfUgs7SDGUqYL+BCq1JbCiJMyg/K2c4z?=
 =?us-ascii?Q?pa1LMkxqjj0aC2rSph+ba7RO+lQhQoQkAqTuSGz/1to+TgveHrX40QPaEREt?=
 =?us-ascii?Q?1AR87eV16QyIsqlQm91oC8F1+CJ5TrvKiMrAHQEvH6Csh3efrgmglvI2F4sO?=
 =?us-ascii?Q?ggG8uHHvD3c66kGJD3SOJNAxwTngE5Hm90bAfWW8Y+qQal/oSkpcrURXyFxZ?=
 =?us-ascii?Q?QnglAg00ZajxKlWGQc1q4jjp1d/9KxkqvrEwvwCLEU21QIQAUQ2h3SGSdpl0?=
 =?us-ascii?Q?27wUFnTCXckGccZAJeOjRGoLW91xI+H1mmHUpeXYECfXBE9/AYtfAbEEaBxx?=
 =?us-ascii?Q?YhMwVkjqWhh4ITsT0a0JpH0X6jZ0Pv484fvXE6Bbm1FY1+/qIulpj0zHjORB?=
 =?us-ascii?Q?ifBbWVFaZOSGVxAeB+c3/tsrv7bGqJBtxjWJDx9opWYu7W3G4oHyEsB42vqC?=
 =?us-ascii?Q?rPcjplswVhLGdULl6I/GeUn0gCr2HrLKE/u3y228jcy9dp7+rOnE28sTxHIy?=
 =?us-ascii?Q?+wU5aJFE1sRVF53jZF145wVgAN8lcrRUCq6IClorvM1Tj54+065diC8hnC2p?=
 =?us-ascii?Q?axN9ADAGlzervqCU5FhAmdtjcJX471TlhOrYHaOqewlepCPX7/scdv4RT3tb?=
 =?us-ascii?Q?6rKGmzqf2AotH9QtUePU8SxXQJfCw1VWEMrcBvacno9lXYlnELSgvsV/HM64?=
 =?us-ascii?Q?e769giVIF4LLtcK/UrcHU9g5Zd+4y+P2oXqdrmZ/By1UtIVoxSXBYpxgLvyX?=
 =?us-ascii?Q?qvrPcTlUVQ7U4qYHDehXP4uzuyEFk+zdPvrqfh6nxmSNX1bjDy51TQhEzZif?=
 =?us-ascii?Q?6kZuCcnuSuLHR6tHLtKrWJ6FHsf0UXVz+JofhTwHdORjkKVa6bG4zLrQTNdP?=
 =?us-ascii?Q?OmnTRN+z9Zz5g2a17DmJGhJImy9PtTBIelOyYo6WYe4saqKS2uMg0ri4297s?=
 =?us-ascii?Q?tmxD8Tz+rpNookQBD1TxayVvc+GISLdH17COCm6F?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6191f347-3296-43b0-9036-08dba3f8ac4d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:44.4165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPnqT+su8pQfrN0Paumgb9olDTLHgL45RPVnzUwCZzMkBCrVFai69LcH8jFVfo2A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6346
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_094804_296873_A49F55DC 
X-CRM114-Status: GOOD (  13.63  )
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

What mtk does during mtk_iommu_v1_set_platform_dma() is actually putting
the iommu into identity mode. Make this available as a proper IDENTITY
domain.

The mtk_iommu_v1_def_domain_type() from
commit 8bbe13f52cb7 ("iommu/mediatek-v1: Add def_domain_type") explains
this was needed to allow probe_finalize() to be called, but now the
IDENTITY domain will do the same job so change the returned
def_domain_type.

mkt_v1 is the only driver that returns IOMMU_DOMAIN_UNMANAGED from
def_domain_type().  This allows the next patch to enforce an IDENTITY
domain policy for this driver.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/mtk_iommu_v1.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 8a0a5e5d049f4a..cc3e7d53d33ad9 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -319,11 +319,27 @@ static int mtk_iommu_v1_attach_device(struct iommu_domain *domain, struct device
 	return 0;
 }
 
-static void mtk_iommu_v1_set_platform_dma(struct device *dev)
+static int mtk_iommu_v1_identity_attach(struct iommu_domain *identity_domain,
+					struct device *dev)
 {
 	struct mtk_iommu_v1_data *data = dev_iommu_priv_get(dev);
 
 	mtk_iommu_v1_config(data, dev, false);
+	return 0;
+}
+
+static struct iommu_domain_ops mtk_iommu_v1_identity_ops = {
+	.attach_dev = mtk_iommu_v1_identity_attach,
+};
+
+static struct iommu_domain mtk_iommu_v1_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &mtk_iommu_v1_identity_ops,
+};
+
+static void mtk_iommu_v1_set_platform_dma(struct device *dev)
+{
+	mtk_iommu_v1_identity_attach(&mtk_iommu_v1_identity_domain, dev);
 }
 
 static int mtk_iommu_v1_map(struct iommu_domain *domain, unsigned long iova,
@@ -443,7 +459,7 @@ static int mtk_iommu_v1_create_mapping(struct device *dev, struct of_phandle_arg
 
 static int mtk_iommu_v1_def_domain_type(struct device *dev)
 {
-	return IOMMU_DOMAIN_UNMANAGED;
+	return IOMMU_DOMAIN_IDENTITY;
 }
 
 static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
@@ -578,6 +594,7 @@ static int mtk_iommu_v1_hw_init(const struct mtk_iommu_v1_data *data)
 }
 
 static const struct iommu_ops mtk_iommu_v1_ops = {
+	.identity_domain = &mtk_iommu_v1_identity_domain,
 	.domain_alloc	= mtk_iommu_v1_domain_alloc,
 	.probe_device	= mtk_iommu_v1_probe_device,
 	.probe_finalize = mtk_iommu_v1_probe_finalize,
-- 
2.41.0


