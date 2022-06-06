Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475AFC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 16:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qcg36C/x15uXXmnswQOM8oeiQW+NpUInoEGTBxP/F9Y=; b=zoc8iwkcbrlF4Z
	KRAE0hEDQg2cUzjR+po/7VFbR8jSbBBTy/drQ/KUcIyYNoB1nW4lBHSPoSrJQkd2D4yzMtRcDnAEJ
	UHbtc7Rv08ajg5KCTFuw4le2+b8r0yDFHLiDAUgxFkCjN6YqSlkejRaXwZKGoD1HqHZ+7iWsAGmbf
	cvU2Hw8BYsDDoI0c0IhW5PwSx0fVElYwy9kTMEmhbTF2Bzg7aqZxoOQwYf+lDR98Zg9G/H3WkyNU5
	gLrruhoWUrk5JsPxS1frTCcbn58AGMqYact7/1s0N/oqfPJv+KXP5v5kCZuNW3RMsXfUC0IBZP+PZ
	xyFX6vL+IVlHmwL3YhMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyFx6-0028fa-OL; Mon, 06 Jun 2022 16:51:40 +0000
Received: from mail-mw2nam10on20613.outbound.protection.outlook.com ([2a01:111:f400:7e89::613] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyFwv-0028c9-7W; Mon, 06 Jun 2022 16:51:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtCVqcRIucmWe+mEk+B3YnXBnrlz+9qnSrH8iVZTDtvd0VTCn4XBS16Jj4i+CC0Ib0UlDpPUqznN4xqTvgcjiKzrPcf8OW+jf0FDIsOfVU4S3HoXcGN5YxKzZf9oL5wtXA16PPoDdXREussQMUuLV9VGdCiwh2h4Zpn3wJwbgM9s+REx9ZU94EvW8FObem6+yE8gC3GztMWco/qWT+YiupyTgNu8RXlG4JYafewoba58waiRBgA7EzM0C6UyERPOF88tMZWnlKjD3J03AaMNmuP2mKiN8+Rc+o+oHxOZXJ4evkmCQzbgVBsJJPK6/jQvy1WjP3a6d7BVz6xK1yLqSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Hdvzb/DdjhHYGSNy9UQ2o7bsQj6hNcDtAAubHjVpQM=;
 b=aIVy/0SEWiKvqh7NZ1beFDMKXxakSWNdsDvrtFm3mVrK6YrY03IphbTFebujbQVZBwhlVa89tNUXeiO22PabjsbT3SUiOHdXUgCjnKDhN+tciKrbQrOLVUatqbcPgXjRRYvwo+7E9fs7WPBZpjljDxv3EzBZvubi6zFmQ+NEWGCo8ZOA6qS2/Z1S5AOj0okZqCKLkojNleS2DNd+r7OpHgESqB0vxRSvjm+XMj7NaWtFWd0PDQ8IXDvzNDoURoBR/Ct63S3/mVb1OhYeBRfhLu4c7DV7Hm1syRqBfMlcFbntraraFL0gahLoO6z0nali78ZYDtFcDIAsB07TEVXBVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=samsung.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Hdvzb/DdjhHYGSNy9UQ2o7bsQj6hNcDtAAubHjVpQM=;
 b=JqjHf+zW8Wx5v048GenopBuqJQY0XhFW5XtPUZlM2SQqZzd695+e+afR9Vp7DWp/ltsIfHwivK1FwvejtYEE7ayW0uhcTInnzXIu1l+3j0BwMEdKvIO4zXnFJz5oR0AlSSVFWp7s4wMNGJrYpGZ7cOkxLDZbqLFzZAIZRb9kIhBIkrv961StBfkDrDZQ9mXACBwpGrssWL4YCqBdCXGwhI0mKtIaKLbadiv5+8BUoMFfegHsDEsf0hYjLHu7EwcoSPmqeupzS++fTr9d7JBJD9yCQT/f1B2OpgL3quodGO9RBlS3Er6RUiqiQbW/0v5rnGNzGUue0+v+DXhitc9xqw==
Received: from DM5PR19CA0059.namprd19.prod.outlook.com (2603:10b6:3:116::21)
 by CH2PR12MB5530.namprd12.prod.outlook.com (2603:10b6:610:35::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 16:51:25 +0000
Received: from DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:116:cafe::e1) by DM5PR19CA0059.outlook.office365.com
 (2603:10b6:3:116::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19 via Frontend
 Transport; Mon, 6 Jun 2022 16:51:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT012.mail.protection.outlook.com (10.13.173.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 16:51:24 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Mon, 6 Jun 2022 16:51:23 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 6 Jun 2022 09:51:23 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22 via Frontend
 Transport; Mon, 6 Jun 2022 09:51:21 -0700
Date: Mon, 6 Jun 2022 09:51:20 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
CC: <jgg@nvidia.com>, <joro@8bytes.org>, <will@kernel.org>,
	<marcan@marcan.st>, <sven@svenpeter.dev>, <robdclark@gmail.com>,
	<m.szyprowski@samsung.com>, <krzysztof.kozlowski@linaro.org>,
	<baolu.lu@linux.intel.com>, <agross@kernel.org>,
	<bjorn.andersson@linaro.org>, <matthias.bgg@gmail.com>, <heiko@sntech.de>,
	<orsonzhai@gmail.com>, <baolin.wang7@gmail.com>, <zhang.lyra@gmail.com>,
	<wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<jean-philippe@linaro.org>, <alex.williamson@redhat.com>,
	<suravee.suthikulpanit@amd.com>, <alyssa@rosenzweig.io>,
	<alim.akhtar@samsung.com>, <dwmw2@infradead.org>, <yong.wu@mediatek.com>,
	<mjrosato@linux.ibm.com>, <gerald.schaefer@linux.ibm.com>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<cohuck@redhat.com>, <iommu@lists.linux-foundation.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <virtualization@lists.linux-foundation.org>,
	<kvm@vger.kernel.org>
Subject: Re: [PATCH 2/5] iommu: Ensure device has the same iommu_ops as the
 domain
Message-ID: <Yp4wiJZWxoCLY8tm@Asurada-Nvidia>
References: <20220606061927.26049-1-nicolinc@nvidia.com>
 <20220606061927.26049-3-nicolinc@nvidia.com>
 <1e0e5403-1e65-db9a-c8e7-34e316bfda8e@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e0e5403-1e65-db9a-c8e7-34e316bfda8e@arm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a451f386-62ff-4630-c883-08da47dccab5
X-MS-TrafficTypeDiagnostic: CH2PR12MB5530:EE_
X-Microsoft-Antispam-PRVS: 	<CH2PR12MB5530383D1535572BE22B389BABA29@CH2PR12MB5530.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	pZiq+ND8CO2amXmNIxVaMtKaraIW4f8vTJiY9NgKkJZULPQnAn0NN9dDhRfW4kJ7TbWHwmqIS1l8JpoBweBdDwTxB4OmTkH31biKB1MsIsCGDS1+df29XGZSdNh9kFTIZulZJkONV88r3aUljC6cKCgXN+dWEp2n6cZQuYOQGzqJjMrLEdZe6x8i1d3BaU+pqMWdgRdvfAlJ0CF3lXU+ZoNH37t+N6Ih+7G617MvEwTU7DQijmGcuJSVC7HC4IA8skZgfk9NCut7ZA1JqChuITMXcKHw0sncB1dOOz3rwdGYulhmqAY/CCEoRxsgjDJppllnOEtc0Aj0GRvlbyz+PFisVwJGiw7YJ2cJLUN3qJDXQrqPtlQzC5hkIYjl+CNRrzwt0EMrzqrBBcrbitaT4YErGYYj9lVfcVL34LHkgA2VIwoWyKy+z6l0W//UjdUWCpPBsWfGO2DdeuEVtvZkCFvyTzyNbE1tre3z2Ot0MlqFsO8MuLeQWdsoLtZSL3cVTyJ1kYQUkX/Lj6mk82MaV5Gqp4l2A0CfeopHBKHsknX/F4uuK18v6KaJlqVNTq/pfxx5qRGx7Tw0SVYDEw4ig/Sq9Er0kOBb3rJTLro4bxcTD4WHZq2a8XTazHVCPws847GwkiNJ3MTCUUFZqrR4ZRmOyo0+ChwLcq38gQ5tpaKbSg9SvzNvnq+n6/YkcCRM0aKY2uJaDBHFvQvnVWCatQ==
X-Forefront-Antispam-Report: 	CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(356005)(26005)(55016003)(2906002)(6916009)(40460700003)(81166007)(426003)(47076005)(9686003)(54906003)(53546011)(316002)(86362001)(36860700001)(83380400001)(336012)(7406005)(8676002)(4326008)(7416002)(33716001)(70586007)(70206006)(5660300002)(186003)(508600001)(82310400005)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 16:51:24.4541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a451f386-62ff-4630-c883-08da47dccab5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5530
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_095129_492908_49897A11 
X-CRM114-Status: GOOD (  25.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Robin,

On Mon, Jun 06, 2022 at 03:33:42PM +0100, Robin Murphy wrote:
> On 2022-06-06 07:19, Nicolin Chen wrote:
> > The core code should not call an iommu driver op with a struct device
> > parameter unless it knows that the dev_iommu_priv_get() for that struct
> > device was setup by the same driver. Otherwise in a mixed driver system
> > the iommu_priv could be casted to the wrong type.
> 
> We don't have mixed-driver systems, and there are plenty more
> significant problems than this one to solve before we can (but thanks
> for pointing it out - I hadn't got as far as auditing the public
> interfaces yet). Once domains are allocated via a particular device's
> IOMMU instance in the first place, there will be ample opportunity for
> the core to stash suitable identifying information in the domain for
> itself. TBH even the current code could do it without needing the
> weirdly invasive changes here.

Do you have an alternative and less invasive solution in mind?

> > Store the iommu_ops pointer in the iommu_domain and use it as a check to
> > validate that the struct device is correct before invoking any domain op
> > that accepts a struct device.
> 
> In fact this even describes exactly that - "Store the iommu_ops pointer
> in the iommu_domain", vs. the "Store the iommu_ops pointer in the
> iommu_domain_ops" which the patch is actually doing :/

Will fix that.

> [...]
> > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > index 19cf28d40ebe..8a1f437a51f2 100644
> > --- a/drivers/iommu/iommu.c
> > +++ b/drivers/iommu/iommu.c
> > @@ -1963,6 +1963,10 @@ static int __iommu_attach_device(struct iommu_domain *domain,
> >   {
> >       int ret;
> > 
> > +     /* Ensure the device was probe'd onto the same driver as the domain */
> > +     if (dev->bus->iommu_ops != domain->ops->iommu_ops)
> 
> Nope, dev_iommu_ops(dev) please. Furthermore I think the logical place
> to put this is in iommu_group_do_attach_device(), since that's the
> gateway for the public interfaces - we shouldn't need to second-guess
> ourselves for internal default-domain-related calls.

Will move to iommu_group_do_attach_device and change to dev_iommu_ops.

Thanks!
Nic

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
