Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340CCC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 06:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJ74egfCAIfjp3R2RhVDn/vzBqH9Y9BbPxTC35JFhFg=; b=Mfc3b2ERQIS9NZdB14nkOHAGLO
	Zu3L5Wwi/QB4DIiOJra5nAO8XWVAZCPCTcoQVc9lvbri0mQXzC72+/PlnGBmZ305M8Vf9P9B22bYC
	FxU5OTJXVVAKnUOaGcYbmvlgVQGHyTZC7fQrBVX83MpZ9MyKrOwDEyYMjGszT7dG2AcwZjuosjH5L
	xiqpCEm90S2lATdIBxfhE64yFKSnD11qENtHwsywX0+5+hulqc8PWE6R9rTivIjKtGxsd907Z1sZs
	LZ9I1GyWBCkZ3aOivb48bytU8MpkHbykxelEjhZITfqPdVWBtG/Jo4OPcC24K7VFoa8dJ9knhmcnx
	LLs6lCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ihu-00GGIe-3n; Mon, 27 Jun 2022 06:58:50 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5igk-00GFj7-Hj; Mon, 27 Jun 2022 06:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656313058; x=1687849058;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GJ74egfCAIfjp3R2RhVDn/vzBqH9Y9BbPxTC35JFhFg=;
  b=bt+7zzOqqO/3p+YetqVs+BmpjSf0wBmVpfwFlsF37gBeqYNA7hvbUEa7
   a1DiyHDstvxdLqM/aTm+IIGAJp0BsiszyHmU6k852ehoEjPSSylP5YwA+
   3fRImmay5G76I3SMG8G9Qk3cGDZG7zM+57r36xc5NbHVR7TlqWFpszu2f
   J27Roq/gQm4qzqb1SuPzmg2nEN0iB/o9sIsS6qOUco9LF7u4ThwojtTjS
   Z2vCr+gtdjttEkE7kx2ygcG5JR3c50K8dvzsMUWIh+R876ciLAqZzY3Mt
   Mik2K4S+AT9cZNJubZzmPLhFX36NCETcyb9ToQBoP/3fMrk0vhvJMqq8I
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="367691082"
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; 
   d="scan'208";a="367691082"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2022 23:57:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; 
   d="scan'208";a="616688781"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga008.jf.intel.com with ESMTP; 26 Jun 2022 23:57:33 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 26 Jun 2022 23:57:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 26 Jun 2022 23:57:32 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 26 Jun 2022 23:57:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/4H6BsGr1k0/RE79FQ2tSufXqCVfoTbXTEeK5Nz1FZoLcC9bs/LXtpRpK/o2OFepDdRSVIY3bh5aLyzXoGeM+vqvTn4KKQdy/idbrhXwoVKHDEf2V+xcOkW9jigO07xLzMEz+ewzb30Pa5ufs4l31Umq16h2XuGleWnXTpzB/8K+rKeu5kxAQzn16kIua/vGcMPBHKPYEEUji+rBee/DsxH0CtEo8e8sjSslQ+45MXuQja0NVnIwyAlkKxmjnxhC410jhLwHzCDlNWhMiv9EnAPeGhLENUKVh1GeBSP+WO2jxZi3P0+C5+X3mKKcQ/upXPFp3QfcG2pCy6fWD4G0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJ74egfCAIfjp3R2RhVDn/vzBqH9Y9BbPxTC35JFhFg=;
 b=FfvK4KyHZ3+9aUCSV8SLDw7SXXTeD3A54mj5i/CrHXmD8q7tCWstVUcELVWXA0K8exjg29vUHmceXYQUp7WxaAmu3UKze92Qc858sTne6ZMlyp2a2SxUoJRMVzbD+pTYrCUlZyH3Zdjj+SIm5OOGWHzUmTMGMjf0gohhZvvuXWE091U+CJmmbzaN0tsRL+teVUqSPmXVcfkdwd+SqQooDO2gNiWNCQqtJr06bSpWUIBo3ukJxLOD8qFcSkwX+cqmid5xsslXr0negXfYboNeYDR3oLG4Fn4BrQWuXY2GihHeh/w4mnsw8bFyk+tnt8oe3thNDVQ4C3d9gCIcSjv3Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CY4PR1101MB2214.namprd11.prod.outlook.com (2603:10b6:910:19::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 06:57:30 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 06:57:30 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"will@kernel.org" <will@kernel.org>, "marcan@marcan.st" <marcan@marcan.st>,
	"sven@svenpeter.dev" <sven@svenpeter.dev>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "robdclark@gmail.com" <robdclark@gmail.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "orsonzhai@gmail.com"
	<orsonzhai@gmail.com>, "baolin.wang7@gmail.com" <baolin.wang7@gmail.com>,
	"zhang.lyra@gmail.com" <zhang.lyra@gmail.com>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>
CC: "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"alyssa@rosenzweig.io" <alyssa@rosenzweig.io>, "dwmw2@infradead.org"
	<dwmw2@infradead.org>, "yong.wu@mediatek.com" <yong.wu@mediatek.com>,
	"mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, "vdumpa@nvidia.com"
	<vdumpa@nvidia.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "thunder.leizhen@huawei.com"
	<thunder.leizhen@huawei.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"chenxiang66@hisilicon.com" <chenxiang66@hisilicon.com>,
	"christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
	"john.garry@huawei.com" <john.garry@huawei.com>, "yangyingliang@huawei.com"
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
Subject: RE: [PATCH v3 5/5] vfio/iommu_type1: Simplify group attachment
Thread-Topic: [PATCH v3 5/5] vfio/iommu_type1: Simplify group attachment
Thread-Index: AQHYhzwe4VU2czSkkECgi7i4dXum561i1xTw
Date: Mon, 27 Jun 2022 06:57:30 +0000
Message-ID: <BN9PR11MB527662B37F6BDB3EE79F3A5D8CB99@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220623200029.26007-1-nicolinc@nvidia.com>
 <20220623200029.26007-6-nicolinc@nvidia.com>
In-Reply-To: <20220623200029.26007-6-nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d08ade97-d304-4d78-b73e-08da580a4dd2
x-ms-traffictypediagnostic: CY4PR1101MB2214:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c91xJ8+DANXwUlxMKqmOF7yZVjjzefwDQb4/RCpizllo9kGvnmCMTIqyGIKRvLRIbTC8yfg50CubG90FeHab/Xs9wCAH++oEuf5JdPv8Lkla+Dfnys5pxrwcL05hvDLuGyOtXTvstP8rH/L54iCby1awpeOP0BG3DmW08tqT4SekwaWmouNPUxokTa5GvH6329uraexMddwhOoeXK7q6y+ZZP5MupH28UC18HVaGE3C3FAMEacDdHNOeDy21ytxpKMhO840M2RgvKo/xsW2hECnK+Sc35daOZ6qNcXtbMt8Uaq/sCb4qbhA8u43QuRaCAfTIiyUxlk6HiDOWkDOpXvKeQfDpfILXG3haa9d1G/78W9Xit7aG+rvi1vHYsl/ZO5pCst5M86d/5Ynh0tRY9HdOSansSa8v95owYyfHBTjzpWJx8k9dr0OMJimX7ZIciT3+VMhfBTy9O3fOJVhJqIh8tKi2bZDAkl1Y7hAbVk2fAapc74+N+vDFGnK2dvHPFsgNrVZVGOLE0bpPICzj0sEfhrifcaDZLS3k2J+dJo8F0BUwk6riFitFnGZ9vOMnMcYOdbhEK23+mWHBvItCGUpSPASRDk2QEAfEquTQBk1IK/DvknDDdHQMT2hh/mE73wui3bfQ3+/Zk0EpYnNVpuy+firjF8lneKiBGqjOioOnoCWXavdEOC2nGuMgkdZEo4gVNEkxG+v8wlsj5HJaBj4JWjoTdKEQz1L33B3DFQh54hXCiMYSR6qtYPx3dcqi0khNVD/wELw0lOXfUlEV3Uzi4p/MgYclljetl2GVXwfaMDErAjhveXXB20+MIVF1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(366004)(396003)(39860400002)(136003)(41300700001)(55016003)(66446008)(83380400001)(64756008)(4326008)(316002)(71200400001)(52536014)(86362001)(76116006)(8676002)(66946007)(9686003)(66556008)(7696005)(6506007)(26005)(54906003)(110136005)(478600001)(66476007)(186003)(2906002)(38100700002)(122000001)(5660300002)(921005)(82960400001)(7406005)(7416002)(4744005)(38070700005)(8936002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U0ISetns/7YYIPmiG2s/ghnARNAWiMm30fqBpO86rgtEjJELKEK+B5L8OBS/?=
 =?us-ascii?Q?E9/IQaK4vDRc7ltxv4cBnHCbWGWMKFOJ8fFugoJZINrBtPCyNNBoNpPES6u1?=
 =?us-ascii?Q?+JFG9rm84t9y0SDO/nEHyVBltIR3mJcM1NeAGUkzBoToIbr5Yv/gdFjsN+9g?=
 =?us-ascii?Q?ZOFJ5ax29o8giHH1pdD3qf4kew+e+BN+y+HDiEntnpSrOeNksRxPWlNFbaSW?=
 =?us-ascii?Q?8mI2ijM/kcaKclLbCxf0O6aWBKjkyTStI7KPNZ444sq5zFednETHngR/Uqgn?=
 =?us-ascii?Q?vK2Pyag2GRGOOGttGHPW5PCPmB7s+APd+hkSHfzirKypxeOz89teLnd3wtID?=
 =?us-ascii?Q?djL/nodFDfWdzYCUOhEH7A7jlS8pVq2Wvz1IbrYLME6ziuuMMGM0RV/npmeF?=
 =?us-ascii?Q?CpcvZge7WdEnIzvv/UhV05doEg5Wu2DXpfWfXLYgeK9n7Ee3+ReI0i1drMAb?=
 =?us-ascii?Q?n9/jxbcOz3ijQlB9hkSpUen6d6ezFa0Z6yZsvN/cgD1DMmGlz/zheqPbHkWz?=
 =?us-ascii?Q?2a66CyGrlqUXWY3N061Xm/WycLp746X/dy94KrQFMoHJjwH2niv3AosURIPQ?=
 =?us-ascii?Q?do/KyOndALws/OgOHuy4C1uHBg531p5B5WcAfI0BZFTrD889Atdi00O0XRMj?=
 =?us-ascii?Q?QY+hMxsFoOaqxNUFpp5b6PeVNo8FExijXIYmj46nXwxc2cuQoSlNPsB8zn88?=
 =?us-ascii?Q?FR3TDmimGlf0XVEAgSRsoNiLJRBkfBs1cE5B/i5ysfqI+Xm1iuX66JCiXkCh?=
 =?us-ascii?Q?Sehlv00B5nMFUixPmvwbC53KxW4bXyQEvAKtW6Td6Y3RNP9HejyamK6iIG3U?=
 =?us-ascii?Q?VAOUq0Pp1JQ4H4IwHpLT6zV4aTSWE2R4dRpGJrZ6ZKZiENzhQ2Fjwgc6YRE/?=
 =?us-ascii?Q?dD82glrEEhpBM5u6VPZADFDaWvoDu6ToChe0GI/+VBdEWqK3vEtS+BN0xxFz?=
 =?us-ascii?Q?6/ahqg5IIrzomKBrlV6ng07ABYGH+gy+kNpVr2WwR1oIbMoLyXzeIck/nI3R?=
 =?us-ascii?Q?VcqvDzvSosUB22s2r0j2/r1jCbRr/dCJS1/Snsy+qmw4l309ZpToC5TNiTBm?=
 =?us-ascii?Q?yf8quB+InfG0GowStcwKySduRpVGNgahe3l+tAL5B0BxYzyfXWu9SGJFvcG6?=
 =?us-ascii?Q?EE82SPXkBDkLVCvoo+Gf5mJNnxaIAuGj91LFiemxTcbY+zSxx4ueJxDFZRzz?=
 =?us-ascii?Q?zKQgf/8DS7+cGgE4AK3P4ucZUuc8C3fF1RtDCUSxGYa4+Q95UKZ4jAGd2U/r?=
 =?us-ascii?Q?wFwf2U3bMkShez0Rm00o1z1Gl+CrdeZQ/97N5dR6yc6apBg84QQ7lbiwZhwo?=
 =?us-ascii?Q?A6aFYXjKteJxdkZ4LLZXgyJuj6ccMwaCf43NomvFbHx7wUowZ4BhBGPc8V/2?=
 =?us-ascii?Q?+ea3SLTNNSV2ubsrC7L+pJgtNwjxxjCsbf6LY+DsYYtgLWi4P+dgCIvNxkjo?=
 =?us-ascii?Q?Acvj07cfdtM+Ya8wcEwUPnN0BIPF93RBMK4i7+V4cnFngfvPNjv1aE+qi+Yh?=
 =?us-ascii?Q?tXIyhWKX/RneJFKfXy0MFZ/syqSFN78NgmzKiouVnr3F0dK15ZJenS2t0iKu?=
 =?us-ascii?Q?+vbFa8YRcRHXhbI8NlzxlaB83rawatEoWkV1uq34?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d08ade97-d304-4d78-b73e-08da580a4dd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 06:57:30.4606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZLHODCDg/nvbZBmzFibGKv+r9QBs+OyrmBQIEqfgN08DJbr1ExOA1Ow83yk+7JPwsISi8JiKKs/gF/EVF1FOVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2214
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_235738_652213_62A7AA6B 
X-CRM114-Status: GOOD (  10.50  )
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

> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Friday, June 24, 2022 4:00 AM
>=20
> Un-inline the domain specific logic from the attach/detach_group ops into
> two paired functions vfio_iommu_alloc_attach_domain() and
> vfio_iommu_detach_destroy_domain() that strictly deal with creating and
> destroying struct vfio_domains.
>=20
> Add the logic to check for EMEDIUMTYPE return code of
> iommu_attach_group()
> and avoid the extra domain allocations and attach/detach sequences of the
> old code. This allows properly detecting an actual attach error, like
> -ENOMEM, vs treating all attach errors as an incompatible domain.
>=20
> Co-developed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

