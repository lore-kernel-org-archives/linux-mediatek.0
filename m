Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C30EC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 19:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4t2tMU26BQlyqKCQrdW0JpcVFyJO+mK2EE2oPATlIlA=; b=EdbSI+56BUxeyMXY0cUcM+N+nO
	4utpJr6fc/+2BfmIKmoFaYbsaDFRgQzsQlUiJ8AJHjnk7Ud7qT9bvRTrd/BKkLOa7HLcn7esRTQiZ
	CvcmCR7RztX2yes7B45LsHrsGPNhCpTZHOyvuFyOhOJXx+6SBQw1K3rAWSy3S9srX8qPhs8WpucPf
	AENsLwhgM3h9k8M+zBoIkAX/DfM72lDoYVD2LKikevXGTy0pC2WRs3O2OD3oiSyPiDbWmZtUXAmAa
	JvphGwhU5tNQbdlvq6FCAGe2eT/TjlPNx99eYO3fWwrtqsAA003oITyO0PFsMluab+xT3HfpdDE7t
	Im9mLXOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6dfP-00Dr1M-6A; Wed, 29 Jun 2022 19:48:03 +0000
Received: from mail-mw2nam12on2056.outbound.protection.outlook.com ([40.107.244.56] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6df3-00DqqP-QK; Wed, 29 Jun 2022 19:47:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0PJX5RBvOQJXizsm7XXk5ibev9vGSpfBPSn4WdyVa5ghrFuCQFae5qTXcaCWk6xS50Ef/p/HkBXOBmsVjA7GSq0W2eq+KIuffcDoaZoYolI1NDr0MvrSTY053ipmO2PVyyaaQXT4tavqhKI9CHxoCfkCFGy1kOcBBhGf6n9MtJ35ko4u5+I5Ax4ujWkOxP2zwAK7PD70e+7Qkjg0pPHFXmnMGt6NqUdYsNVr1EQLipy5WBUC7Hn0pt3XBrNzCLDZrPmLyXF0lsq+nfhUqZ5qepSUqM2y9ZuOorMdihawoNmQC/FMYyD5SO3kuu1KkcN3SYX8phA+obprcgkMPlQ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4t2tMU26BQlyqKCQrdW0JpcVFyJO+mK2EE2oPATlIlA=;
 b=jpTRnHFVFndMxq3v3N/DsLcCopksASQG2tSes+XRlcpr3NnnfzOmb6ARuSVY9cqWty9YxbYZLjlUNDIb3fjuGcpXqA8rs/QTcVC+at7FX8scfWeM0owd1Rv9bWAlOeBQAdLcPg76BIHX1Lm2aqbErpTuH+foXu0ybORfWxub6Ynj1vC8FTN5WxuuY61N9xEpF01IqOLXZAxHxd2gIRiGQBUeNK41aompUfEUYfS1nRlQS7BbdjadblK0joCyscNYO4f6zPBw9Pyt5QRgDjDbuWnJJxd5zNlZ6AVCuB44s74ojp9iQFAufp49AubKBO+hVh2beXmWSHg+TGTjAijR8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=rosenzweig.io smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4t2tMU26BQlyqKCQrdW0JpcVFyJO+mK2EE2oPATlIlA=;
 b=kbSpzWzRS1YUALOvepkAP54VOl8DFy3BXMyZtvElr0/sgXBKuvsoovdvw/j7z29Xy+8+zNA+uGQYhodL2XVyI/k4D33mMLIxVZcaQgU4SLywxUt8qaAE6D7UOxG0834eE3JdNBZm6kevU3BXtq1ZZSbCH4bSjRSXp0SvgJRCM0gMqwHd96XA+jrHf46f7zrbcfupeajYgYobAVhrbTvQvzSMqjx6tgaVqvsxapPmh5R4roDsl93Fv0LZc93VithZBkTENvMgwrkCzuGlAro2zxj3BQOrCLWE3ZQKDuFyEQ6JE5jO3Q5sw43iYRuHskEmbwN/+/FJ0a7wg7foxqnOAg==
Received: from DS7PR03CA0055.namprd03.prod.outlook.com (2603:10b6:5:3b5::30)
 by BL1PR12MB5221.namprd12.prod.outlook.com (2603:10b6:208:30b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 19:47:35 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b5:cafe::74) by DS7PR03CA0055.outlook.office365.com
 (2603:10b6:5:3b5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Wed, 29 Jun 2022 19:47:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 19:47:34 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Wed, 29 Jun
 2022 19:47:34 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Wed, 29 Jun
 2022 12:47:33 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26 via Frontend
 Transport; Wed, 29 Jun 2022 12:47:31 -0700
Date: Wed, 29 Jun 2022 12:47:30 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Yong Wu <yong.wu@mediatek.com>
CC: "Tian, Kevin" <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Baolu Lu <baolu.lu@linux.intel.com>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"jordan@cosmicpenguin.net" <jordan@cosmicpenguin.net>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, "will@kernel.org"
	<will@kernel.org>, "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>, "yangyingliang@huawei.com"
	<yangyingliang@huawei.com>, "orsonzhai@gmail.com" <orsonzhai@gmail.com>,
	"gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "dwmw2@infradead.org"
	<dwmw2@infradead.org>, "marcan@marcan.st" <marcan@marcan.st>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"baolin.wang7@gmail.com" <baolin.wang7@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>
Subject: Re: [PATCH v3 1/5] iommu: Return -EMEDIUMTYPE for incompatible
 domain and device/group
Message-ID: <YrysUpY4mdzA0h76@Asurada-Nvidia>
References: <20220623200029.26007-1-nicolinc@nvidia.com>
 <20220623200029.26007-2-nicolinc@nvidia.com>
 <270eec00-8aee-2288-4069-d604e6da2925@linux.intel.com>
 <YrUk8IINqDEZLfIa@Asurada-Nvidia>
 <8a5e9c81ab1487154828af3ca21e62e39bcce18c.camel@mediatek.com>
 <BN9PR11MB527629DEF740C909A7B7BEB38CB49@BN9PR11MB5276.namprd11.prod.outlook.com>
 <19cfb1b85a347c70c6b0937bbbca4a176a724454.camel@mediatek.com>
 <20220624181943.GV4147@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220624181943.GV4147@nvidia.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d217259-e4d1-4143-1a2e-08da5a0836ac
X-MS-TrafficTypeDiagnostic: BL1PR12MB5221:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	tial0svSqsOBWr4UrH8SCwFIjyQnY3PhwdCieiCRyW+x6vi6nufunUUzfl8XQu8vEaRhJjGBAe4pGe+ZKAfR+B3ov2ln3fdvF0zUhQDAoDJZAm1CfwEJ2JURkCkbc2Q478avagu2XGxhl64JAxb8w+lDpT8aK3PHZ/LfhjAQoqrimWhE2UhfvN24fwDp23yFkeRn+H/kaZ79l4vS2s8AbT/vCOT6O3Jvk0Y6HEcDPlc0VC6l3C/01Q3BPHx0oPlI9KDRXO4pMSE5pvnkF8RmYHIfIISfgUWB7nsuhuzHWuBojcb6rsblTsRxNH0Fp1lK17/I1anKUpXUNmyOKW9OIHIg6Evd4yVFb5DvzvcQ7xaMbss+QpYJQv6oOxwC2QmSNsH3x7ybT5PNdcUMxSMpFf4zX6htMZ77H6It2PS0ueapWuyq+3vJ4+5Vvc0gB2Dxly6eOldTjlwgi/Q6YcJlwHTiIyOpua7KNiNJVOCZn9jas+cQTv46a0febV9sve/Z4MeylJc2s4MbOkEL367bIRjRTbdXy7qmC/y8a8Cn4dagtC3VPlg34Nnm4aD6dWo+5U36sBQOe8N1UVpIdYcZu8eZJ4WIEdJA0ok2GiIdHvicgQbnlGX56hNp4gCurZw+0FZ3KS9CcnYyVuWGMg7oi7o3i4b/FV+KaivcYLJXFieb2yCtFDXk0UOIkhe4saVqE0wh44G0seXU9OKYk+fij1dEt11l7/CKpaRSkWBojSOF+IOwWIih6hk4tDde2pb/MaCPEwtaJFvcdYb2jrqQXLv8ADvPXts+hOQmbXpusmZeVStCPYWHCV9iSMXicf0t5CiYmppSKIA/rg0RSoztiw==
X-Forefront-Antispam-Report: 	CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966006)(40470700004)(36840700001)(8676002)(70206006)(70586007)(4326008)(9686003)(36860700001)(7416002)(41300700001)(478600001)(26005)(86362001)(40480700001)(82740400003)(40460700003)(6916009)(186003)(81166007)(55016003)(8936002)(356005)(47076005)(82310400005)(33716001)(2906002)(336012)(54906003)(316002)(426003)(7406005)(5660300002)(83380400001)(4744005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 19:47:34.8739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d217259-e4d1-4143-1a2e-08da5a0836ac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5221
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_124741_881605_85CEBE50 
X-CRM114-Status: GOOD (  17.31  )
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

On Fri, Jun 24, 2022 at 03:19:43PM -0300, Jason Gunthorpe wrote:
> On Fri, Jun 24, 2022 at 06:35:49PM +0800, Yong Wu wrote:
> 
> > > > It's not used in VFIO context. "return 0" just satisfy the iommu
> > > > framework to go ahead. and yes, here we only allow the shared
> > > > "mapping-domain" (All the devices share a domain created
> > > > internally).
> 
> What part of the iommu framework is trying to attach a domain and
> wants to see success when the domain was not actually attached ?
> 
> > > What prevent this driver from being used in VFIO context?
> > 
> > Nothing prevent this. Just I didn't test.
> 
> This is why it is wrong to return success here.

Hi Yong, would you or someone you know be able to confirm whether
this "return 0" is still a must or not?

Considering that it's an old 32-bit platform for MTK, if it would
take time to do so, I'd like to drop the change in MTK driver and
note in commit log for you or other MTK folks to change in future.

Thanks
Nic

