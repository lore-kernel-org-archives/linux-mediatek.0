Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0612C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 22:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRmIP8znmtXCxGg/0nCAah4uNhMATzm14FiLLgF+JEI=; b=J2vrCKnoTMCH4sfg4zG5GcLj2w
	n3hyqMzEt4KUWrJEW0RrRP+SKJgK8MJsFhdMePzDeDdXLnFLFEHzl6E+Tl3h1fFTMoOGZCvEMKSQA
	u34KEp+XCPlJR3S5mBY2xpMqtEvAvHb9698Nk3Z2fgoajFSgioe1HeY7d+pSVvHLJjjM5ufOQQ0gX
	rg9rX1dgYtDoTEpf69eQzQqJ0EE41nvjXbXW78bNgiUgAgMPJdnZg3qRWCCk0ZwAsen2aVLCzt0G3
	CiT2IKnZSYlcZe7L864iez1S7lIrsRA6QU5220QVKc4XPfawGYhDuValKczoLdl2P/XKFNCmTtEC0
	21Fvxy6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1xuc-004bIZ-Eu; Thu, 16 Jun 2022 22:24:26 +0000
Received: from mail-dm6nam12on20619.outbound.protection.outlook.com ([2a01:111:f400:fe59::619] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1xuP-004bFI-KN; Thu, 16 Jun 2022 22:24:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=diktG6hTdVQkBYVmDWXs0LJ54eVpVmRRjxPSUwgnDQKDY12A2eqKbc8Lw3OKTM/9XWg4kmSW4dgBQoOiPJogJRV3VUEV9t2HAbObrX35mPmExrvsMVnwyaYibzocMJK2pFi5w2xrecJ+n3Ew/iY5MOeqddeTuOX+o78B34RS563gSMOPSJSTj3bQ8oG78QPOHtvJOHTq5ZJWwxYBXtpqaoC0g3JaAD9btfc3JTinpcGg/j/kCUkWfOcI0zR1MvDBK3kd8snxpKH/djUVcVWLM/6BiH4Mn3ksl3ECQQOK+AnS7xhU2UnZxTv/877hRANrw1zs2J7WsQ5DvlJ/05phUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRmIP8znmtXCxGg/0nCAah4uNhMATzm14FiLLgF+JEI=;
 b=HzVY8FXIRgnanWofdJci4xsAJn2JyV7PDewVi4d3i+cYztYF5QqOAnP7ni5v5Kv6WEgBlhyMgUyytxk0/QQBVHLgy58+fLp7+dTPfzqPb25gcmuVtAyMX53WCSJBeF5BWmiBaqBvEr79MxqxQRmfOayrHY+RBk9xHFCtdI2ekf9oAONZNy8644MQrBd7NgXMQDbkwtVZra6mtLrFD2DZevffquN60pQB/ptZqGjBXSxXIm76ftBZBr+erT5E9BQpbsIRpSr3G+c4pZztNVv4LOaihsGgxEAsW2CciK5SSNcAsbEkPFhozF4AplQLAAQoTCgiVAsK1CPvmT7vlxFjeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRmIP8znmtXCxGg/0nCAah4uNhMATzm14FiLLgF+JEI=;
 b=XD08cyGk43jniY/h0cH/KRq2Ju/iMhqb2p48bh7WL7jWU91aveqlvUhHDO/XOjT5msITe9lBuhTVo5nAgRZgbnC9/YT+3QVzJjqv+IfNf84QBplaSekFuwtvixR/5BUuxezkTVVt/dr8m5HRbDMyFlxXWo+1s/BXT7zEuFGQyOnQ6BntfSbO89qi4riuUxUacpYcFdx9LcD9sNoQ5Xgkf3CsExCEA20+mepmhj2y9pRFGoschtKSN/ToF0Tghy4M7x82HmfoHNzihQA8U9bVz8MvMg8Pl8VleCX+UZE7qQOPx4LwhsTSCTfbDaZjMRtVkSve+YU6WwplE2oPbgYSQQ==
Received: from BN6PR17CA0019.namprd17.prod.outlook.com (2603:10b6:404:65::29)
 by BN8PR12MB4595.namprd12.prod.outlook.com (2603:10b6:408:72::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 16 Jun
 2022 22:24:08 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:65:cafe::3b) by BN6PR17CA0019.outlook.office365.com
 (2603:10b6:404:65::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15 via Frontend
 Transport; Thu, 16 Jun 2022 22:24:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5332.12 via Frontend Transport; Thu, 16 Jun 2022 22:24:08 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Thu, 16 Jun
 2022 22:23:35 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 16 Jun
 2022 15:23:34 -0700
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22 via Frontend
 Transport; Thu, 16 Jun 2022 15:23:31 -0700
Date: Thu, 16 Jun 2022 15:23:30 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: "joro@8bytes.org" <joro@8bytes.org>, "will@kernel.org" <will@kernel.org>,
	"marcan@marcan.st" <marcan@marcan.st>, "sven@svenpeter.dev"
	<sven@svenpeter.dev>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"robdclark@gmail.com" <robdclark@gmail.com>, "baolu.lu@linux.intel.com"
	<baolu.lu@linux.intel.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "orsonzhai@gmail.com" <orsonzhai@gmail.com>,
	"baolin.wang7@gmail.com" <baolin.wang7@gmail.com>, "zhang.lyra@gmail.com"
	<zhang.lyra@gmail.com>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"alyssa@rosenzweig.io" <alyssa@rosenzweig.io>, "dwmw2@infradead.org"
	<dwmw2@infradead.org>, "yong.wu@mediatek.com" <yong.wu@mediatek.com>,
	"mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, "vdumpa@nvidia.com"
	<vdumpa@nvidia.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "thunder.leizhen@huawei.com"
	<thunder.leizhen@huawei.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
	"john.garry@huawei.com" <john.garry@huawei.com>, "chenxiang66@hisilicon.com"
	<chenxiang66@hisilicon.com>, "saiprakash.ranjan@codeaurora.org"
	<saiprakash.ranjan@codeaurora.org>, "isaacm@codeaurora.org"
	<isaacm@codeaurora.org>, "yangyingliang@huawei.com"
	<yangyingliang@huawei.com>, "jordan@cosmicpenguin.net"
	<jordan@cosmicpenguin.net>, "iommu@lists.linux-foundation.org"
	<iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] vfio/iommu_type1: Remove the domain->ops
 comparison
Message-ID: <YqutYjgtFOTXCF0+@Asurada-Nvidia>
References: <20220616000304.23890-1-nicolinc@nvidia.com>
 <20220616000304.23890-4-nicolinc@nvidia.com>
 <BL1PR11MB52717050DBDE29A81637BBFA8CAC9@BL1PR11MB5271.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR11MB52717050DBDE29A81637BBFA8CAC9@BL1PR11MB5271.namprd11.prod.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34a7c6cd-c395-44b9-2216-08da4fe6ee1c
X-MS-TrafficTypeDiagnostic: BN8PR12MB4595:EE_
X-Microsoft-Antispam-PRVS: 	<BN8PR12MB459545D1FE6C9E3F4E15CA9BABAC9@BN8PR12MB4595.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4BW5EicNQc0DG3bTHZFYE46rqR0BOhsWHPiXGhS7TfHcSjU8MMwC/IJHvrLx0CaVwHdd8AJLM82kAzglyvUTCCTzKEhVVFFDcULjKeWhwWCse2Lgs8mVFw7PloxbTOsnmuUmIrWVq+VIqSyEqzMsT2TDxyLIHOX1/apavt2HQSQ5T89cNIza8Vyk7Vt9ajaqpv/XD35ru5rAT0WSx5uGEpckyfO0CAz+hMWWHTkTVrbhmAHAxC9O/VonXQ8VpV7i/m2xQYxCEHy/vmTwWtVQpeA6tFNVs4joB48SKRUHUpXJTwwyWVcDO60XVu0yv3ICoOExE9VQRVQpcAzn3dtsTViAwJu6rmi59cNcL6jFv12WxO4FPvo76qeRiVFFo9XEoI8S8b/urlou7suodXRXI6FwGEw9z6jQFOdl117q+XhIait02lHusaiQBIFxTo388sEof4ybRsfFXhH5RgPucgxXNg/wXockX9BQMWYj3la2434ieBpGOvuGn+w5JvrmNsmy1vjuriQYu+xcSWPmIF121UIcXhyrGTBjvFldQpc7VIipcbLfnNHMfwHc4RO7fki5nKMsD7G2mEKsAG1Tng1PSLFxU8WIND92WkHbGtxypEuqQQW5kDYl9MR6hp1sT7lQWGzI6Z8lEk4nogG00rFn5qahPaJ1LgN/s7lJuZhDTasJ7S9eqTAA5yRs1sC/05xICgCPyJGQRIjiaxU6OA==
X-Forefront-Antispam-Report: 	CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(46966006)(40470700004)(36840700001)(356005)(81166007)(36860700001)(186003)(316002)(336012)(47076005)(7406005)(7416002)(8676002)(8936002)(5660300002)(70206006)(2906002)(82310400005)(33716001)(55016003)(4326008)(4744005)(40460700003)(6916009)(54906003)(26005)(9686003)(86362001)(70586007)(498600001)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 22:24:08.0521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a7c6cd-c395-44b9-2216-08da4fe6ee1c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB4595
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_152413_928002_50BBACA2 
X-CRM114-Status: GOOD (  12.75  )
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

On Thu, Jun 16, 2022 at 06:40:14AM +0000, Tian, Kevin wrote:

> > The domain->ops validation was added, as a precaution, for mixed-driver
> > systems. However, at this moment only one iommu driver is possible. So
> > remove it.
> 
> It's true on a physical platform. But I'm not sure whether a virtual platform
> is allowed to include multiple e.g. one virtio-iommu alongside a virtual VT-d
> or a virtual smmu. It might be clearer to claim that (as Robin pointed out)
> there is plenty more significant problems than this to solve instead of simply
> saying that only one iommu driver is possible if we don't have explicit code
> to reject such configuration. 😊

Will edit this part. Thanks!

