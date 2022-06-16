Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA5AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 02:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhBtibn7C/yz4vKqsDQRURimrz+0niz40Jmk1OUnqgU=; b=rydO3GgKVO/XJt8wT5hQWHFKJh
	LFdySIkXZWWOMi2cF6k9JuwotquGA13DkB9lmgd9XpoRzaGpR5PMt3/ADneXP9DwIZE+DKaGmlmYL
	JdbV70sxg8VjrZOOkZX+V9RH6hCEfj9HhqM3MeIyyuYWgnCNFg9jw5BkSt1hCG6/iIEghStqMy9oX
	VphITT+hvodMi2mXTYYQelbr7DZFkCXQjd+8LvVi9obLSOTJtc/ovOl/s5hPI1Ma5+w8FJtj3TJ68
	j/bNQxBqwZm+ZLPiV+Qk1gETfeSMpnWoUAJyQbb0GHle0od0okh5ySpbk2mBhM9x80OLvjC5MsyMt
	F8kDxRLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ffB-0009oW-UC; Thu, 16 Jun 2022 02:55:17 +0000
Received: from mail-co1nam11on2060e.outbound.protection.outlook.com ([2a01:111:f400:7eab::60e] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ff1-0009lT-2y; Thu, 16 Jun 2022 02:55:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asariG3I1XsbsLdZvlU7JD7bgUWn7ouo8GIp8JJ5HLGnKARBBtsUQ/SfD7VHIb1SPe8YmVt9zofiaCUshvKwkMDxwOWeBhPKVaoiBeiAq+C5tSVebLBTn9yGoh1cHONgtP53mZr0RBoGdutD2jqzyInvD9Abrm6lAI/unFo+dAf6GHQAn7wBVtEGw4tke6u8UK/E2rRQU6bKs6ezfdal/9+3UetzzZyBfKvQ/awW9a2/xv2eSV6VJhTnXnY1QTVs1Wc8aosYZunXU9nqMBVwNRSl7kRjPW/uk8Rg4GMret6jpT0mJWMX4rhkJAslxVlBr9Zj5yK/6WAXOC6sQuF4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhBtibn7C/yz4vKqsDQRURimrz+0niz40Jmk1OUnqgU=;
 b=Bm8SX8RfwpvvCdmFVoRT82gfe8P24noxdJ5T92qIjgTpsVE61SdprlmGhftuEwA8CuwtKLk/Y2tR82N/wEcHi0hxq11dRKGZtxNMImlDpcCuKaq28WgcdDVBopMi+w2ReYgqD4UuKpZDxioaFd+08QvClcGu1Y51UFt8HDavgctfRoEgGjoH5y8uHGhQR/MctTQImKWMckDK9Z8kcuf736wneTbwJGoZflNcOgaLUAMLbul/yR2XwxM3Iu1Nh5VGM9PoaHkLvHSahdOonpepEEaiCSiMkl9t6W9W0f5mgX/fWNhKviKB2Cnnttz7LQ6barBP5yu9vPX19dflC0BiEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhBtibn7C/yz4vKqsDQRURimrz+0niz40Jmk1OUnqgU=;
 b=tipximkeSNPWNhyrfTMN9HOlM6t4uiw4MXbXWVCaHeG+h7d8tDudSYkrNzJ/50JWHFpfRsTMYVj5alXvurTkcvxpz7oDkMSFqVGdxsarkF5vtxp5wB+rBbLaM9peZZ1mX0V/Fj15Drosk2s+VVC6t+S7dU2NlNsTq9ZZVkBXjVFIt14Zw10+5J704OX0gIsCjJIRb4POiXGwhDMlVNgKaCUIxCq2arwl7RQkeQKYX5bnBavM1g/xZKBPxqzD/aqoBUJLKlySJT+pwEqSjieXq2wpQekMvY7mTc2CHmCMDUNxuWQIuXmduiXk9BcG7p2G9Pk/umAWLrOcVF7R7il1iQ==
Received: from DM6PR03CA0039.namprd03.prod.outlook.com (2603:10b6:5:100::16)
 by MN2PR12MB2990.namprd12.prod.outlook.com (2603:10b6:208:cc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 16 Jun
 2022 02:40:13 +0000
Received: from DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::b1) by DM6PR03CA0039.outlook.office365.com
 (2603:10b6:5:100::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15 via Frontend
 Transport; Thu, 16 Jun 2022 02:40:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT005.mail.protection.outlook.com (10.13.172.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5332.12 via Frontend Transport; Thu, 16 Jun 2022 02:40:12 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Thu, 16 Jun
 2022 02:40:08 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 15 Jun
 2022 19:40:07 -0700
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22 via Frontend
 Transport; Wed, 15 Jun 2022 19:40:04 -0700
Date: Wed, 15 Jun 2022 19:40:02 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
CC: <joro@8bytes.org>, <will@kernel.org>, <marcan@marcan.st>,
	<sven@svenpeter.dev>, <robin.murphy@arm.com>, <robdclark@gmail.com>,
	<matthias.bgg@gmail.com>, <orsonzhai@gmail.com>, <baolin.wang7@gmail.com>,
	<zhang.lyra@gmail.com>, <jean-philippe@linaro.org>,
	<alex.williamson@redhat.com>, <jgg@nvidia.com>, <kevin.tian@intel.com>,
	<suravee.suthikulpanit@amd.com>, <alyssa@rosenzweig.io>,
	<dwmw2@infradead.org>, <yong.wu@mediatek.com>, <mjrosato@linux.ibm.com>,
	<gerald.schaefer@linux.ibm.com>, <thierry.reding@gmail.com>,
	<vdumpa@nvidia.com>, <jonathanh@nvidia.com>, <cohuck@redhat.com>,
	<thunder.leizhen@huawei.com>, <tglx@linutronix.de>,
	<christophe.jaillet@wanadoo.fr>, <john.garry@huawei.com>,
	<chenxiang66@hisilicon.com>, <saiprakash.ranjan@codeaurora.org>,
	<isaacm@codeaurora.org>, <yangyingliang@huawei.com>,
	<jordan@cosmicpenguin.net>, <iommu@lists.linux-foundation.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<virtualization@lists.linux-foundation.org>, <kvm@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] iommu: Return -EMEDIUMTYPE for incompatible
 domain and device/group
Message-ID: <YqqYAtfn7PQeCxgW@Asurada-Nvidia>
References: <20220616000304.23890-1-nicolinc@nvidia.com>
 <20220616000304.23890-2-nicolinc@nvidia.com>
 <0c0e6ec8-725d-93e8-44f1-db6c8a673a97@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0c0e6ec8-725d-93e8-44f1-db6c8a673a97@linux.intel.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f4b40cf-3b78-4593-41b5-08da4f4189d1
X-MS-TrafficTypeDiagnostic: MN2PR12MB2990:EE_
X-Microsoft-Antispam-PRVS: 	<MN2PR12MB2990BF315D3E7101FA85B8B3ABAC9@MN2PR12MB2990.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HwdzFIEdlNpfJjfm+z36VuJ0NsCdJyymn+4PuqriQ52llbjQjZKtB67FKv5ZNq43v082E/05qYv1LZTW2l9JnHlWVmTK9Vzo7PbUITUtxRFeKwVaot0/W4L30fASq/Pnw2Zqg7dKa/n2KDTXEV0wh07urfOQNtUrjPPtVCcZpXLP5qew/tGmTSSA3jB1Dxj8Z8ag44OyU8rtPGGPm7MCbSxS/kb+Zq3uFnnajKR+pnTZVHKSshdZnPoiPzzAM6SuLu6Ta1KFQqOFvmC5V7bI8E8/b8AlE81Mbw8glsGK86I3MpwIy8pijZ+YjYNNVmTtI7N6ZmGvm/zHAWSOXmaZfdxTMW0aa28jjrokSC22SGP9O3amKHycFDW76sVYI8Y9JN5P0e6w+2HYqagE7OMo2W7ImW2F7GNTUikt96fwPafAhuLQ1dTnYs2oSD6E/jMezii0MF57mbf76nXplH6LvipiLlzo2q4wIT3Z5W1Q6Xo+MjM4MYltIRVB9Sj011KnPhrQTjth2pXSjTYNP9ExiuosEHVlKVDTL821HVdCRcJwWOio5yQfPnOCa8S4UPzbS/G7/e5h//3VZmL+rpGN+1n47XxpNbD2Fj7wzEC1CGHsqJAmT1/uoyne4TYDCH5L5gNX7/m8ezEqX9njhPzYOCf2WO68qp0BxNkkq7EK3hZGhMavDiCdmXwJU0pgley9mttfIGdG0/D+Lted9HwGIw==
X-Forefront-Antispam-Report: 	CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(36840700001)(40470700004)(46966006)(81166007)(86362001)(53546011)(33716001)(82310400005)(54906003)(6916009)(186003)(5660300002)(36860700001)(7406005)(7416002)(40460700003)(508600001)(83380400001)(26005)(55016003)(9686003)(2906002)(356005)(8936002)(316002)(47076005)(336012)(426003)(4326008)(70586007)(70206006)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 02:40:12.8757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4b40cf-3b78-4593-41b5-08da4f4189d1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2990
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_195507_166397_B5DC6149 
X-CRM114-Status: GOOD (  14.58  )
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

On Thu, Jun 16, 2022 at 10:09:49AM +0800, Baolu Lu wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 2022/6/16 08:03, Nicolin Chen wrote:
> > diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> > index 44016594831d..0dd13330fe12 100644
> > --- a/drivers/iommu/intel/iommu.c
> > +++ b/drivers/iommu/intel/iommu.c
> > @@ -4323,7 +4323,7 @@ static int prepare_domain_attach_device(struct iommu_domain *domain,
> >               return -ENODEV;
> > 
> >       if (dmar_domain->force_snooping && !ecap_sc_support(iommu->ecap))
> > -             return -EOPNOTSUPP;
> > +             return -EMEDIUMTYPE;
> > 
> >       /* check if this iommu agaw is sufficient for max mapped address */
> >       addr_width = agaw_to_width(iommu->agaw);
> > @@ -4331,10 +4331,10 @@ static int prepare_domain_attach_device(struct iommu_domain *domain,
> >               addr_width = cap_mgaw(iommu->cap);
> > 
> >       if (dmar_domain->max_addr > (1LL << addr_width)) {
> > -             dev_err(dev, "%s: iommu width (%d) is not "
> > +             dev_dbg(dev, "%s: iommu width (%d) is not "
> >                       "sufficient for the mapped address (%llx)\n",
> >                       __func__, addr_width, dmar_domain->max_addr);
> > -             return -EFAULT;
> > +             return -EMEDIUMTYPE;
> >       }
> >       dmar_domain->gaw = addr_width;
> 
> Can we simply remove the dev_err()? As the return value has explicitly
> explained the failure reason, putting a print statement won't help much.

Yes. As long as no one has objection, I can remove that in the next
version.

