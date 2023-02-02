Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB4CC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 03:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRvgZHNe7ra9m4s5E9GktRBZ7PTO6blvfnKeKReW0js=; b=3fg2YxGzJRn3Q61+1Xgxoh5Wh8
	xUsAo/vMSOCmZW1wXYkSNgjbpLRxztq6Im822u35+L8jlDqH1l22m3PW7nk+LRgnwvvuAyNdx8P/N
	CnJAMamWevsSi5f6bAukfBrLQXPow0AIzVdE2IilbyXAXpFANGGyF/7qMuLpKoZgXYxzD7JPnNb3t
	xtvNNWrwCS/TabzP8AfIciaJXatCivEL8ojUbTf8dYU8OtXPrVqlkjV+GZdX3QEqs+rZ9r7c6qPpI
	1dpj/bY/rHmRtHyjvKkFFup68EDQsEz/dEw8gbNoKm2d/yl0ILfQr1UkyFXzCjbABFi/BRaup3Z63
	VQ1tJpaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNQcQ-00EHfi-Vc; Thu, 02 Feb 2023 03:50:38 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNQcF-00EHdK-CK; Thu, 02 Feb 2023 03:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675309827; x=1706845827;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VRvgZHNe7ra9m4s5E9GktRBZ7PTO6blvfnKeKReW0js=;
  b=HPs4UAhnCiAIDWYI1bSBSZUBGyAU0euojJH9wAsM/M/tJITVMtFME60N
   WOuC6Ty7UOvNadQLgG3v5M1HIrdiK0TZwhhobPTsMdUezSAfH2VEr+bUo
   4lXkCjL58gG+Uq9JF/UTOycvKoG1YrQInQe5gXA0T5EyVBkzHtS7SrBd8
   vrEXDlD7bk+94LqC9LVo98rXajKmpTw89u23WoIxB8aVQOZEbrzimJj6s
   8LHpETD8+oDsMs57NwAlLwEnEyM0sIFvTX7YCzAb1U6qvbU17s6Pabiai
   3szqoq0z9tDbPltDDPBmZ1YWStAht+/LEEwdVSfBYky4vyF95KXGY0GBt
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="392924513"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="392924513"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 19:50:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="789135407"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="789135407"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP; 01 Feb 2023 19:50:19 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 19:50:19 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 19:50:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 1 Feb 2023 19:50:18 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Feb 2023 19:50:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqSm60rOooax6NBS/WOsbeoVGYrVwK8pXKV/0LJjslpYUnOWZ56KjIQljwQ2pp+jt377b1ekm/e68gxUC5yxh8fPn0GJ7vea3e0b8Z0tfH812VZScn6On8l47qEZ1aJQzOR0wf29ZakZaEWivxzvU/pBAB4LPaugWexfCQn/xdGQm7+aOXirnuGWlN/+J+Zb+7JEO04VDn2IAh9oZ2Pu7nZNKfClfk3K6QGaYtK0mZruHxAPLcQNeixU4JSzlEn5RYCq4l7tnDgE5JHOxJFJvuIrYdTBbdmB+s0COjWU5TXY2ZERy+Ldu+1Z0ER0V0LIPDBtADtCMWghcO1YMEOHYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRvgZHNe7ra9m4s5E9GktRBZ7PTO6blvfnKeKReW0js=;
 b=Dk7EGjY3rVpIzbineJCfz8CjGa9ywFYQx2GL8EoBxhwTMrA1mdq140ZWE7JzBoDpWgO0c4YmsC3TEvuYNSgyHYIEFGwvqXsjaxSCzT/ARQNZkFMC+4+zFaFrNRkvdr+OeXk5C2ErBZbXeffUCu3c8HRHgy+GRYMfFZPHhRwBloqSSVpS/7pk5XAJQmuhQfYapYg+bmVBNWcp7CfKySr6fjbLnqMqfJSiA+CIiJK/U5fmfjNPwPq7ada2KUPWEqkl8TncJe1Cbl5p2j4Q0knENuD1bER02zgq/xLrDDuSzWY56HmPejg3DV9qTZtRch0AMjCkPBr3pP/KP/cOVxaQew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CY8PR11MB7800.namprd11.prod.outlook.com (2603:10b6:930:72::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 03:50:16 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%8]) with mapi id 15.20.6064.027; Thu, 2 Feb 2023
 03:50:15 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Robin Murphy <robin.murphy@arm.com>, Nicolin Chen <nicolinc@nvidia.com>,
	"joro@8bytes.org" <joro@8bytes.org>, "will@kernel.org" <will@kernel.org>,
	"agross@kernel.org" <agross@kernel.org>, "andersson@kernel.org"
	<andersson@kernel.org>, "konrad.dybcio@linaro.org"
	<konrad.dybcio@linaro.org>, "yong.wu@mediatek.com" <yong.wu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"vdumpa@nvidia.com" <vdumpa@nvidia.com>, "jonathanh@nvidia.com"
	<jonathanh@nvidia.com>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: RE: [PATCH 1/4] iommu: Add a broken_unmanaged_domain flag in
 iommu_ops
Thread-Topic: [PATCH 1/4] iommu: Add a broken_unmanaged_domain flag in
 iommu_ops
Thread-Index: AQHZMoqzsVwORV4fDkqb25GPYvi+2K6yz/kAgAAgNYCAAhsCEIAB7paAgAJ2Q5CAAMVyAIAA2Chg
Date: Thu, 2 Feb 2023 03:50:15 +0000
Message-ID: <BN9PR11MB52766E8C47B04FC4FE252D0F8CD69@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1674849118.git.nicolinc@nvidia.com>
 <0875479d24a53670e17db8a11945664a6bb4a25b.1674849118.git.nicolinc@nvidia.com>
 <dfad6d75-6f4d-99ef-1c6a-4bf397dcaa13@arm.com> <Y9RkG2dejdXptUTB@nvidia.com>
 <BN9PR11MB5276C9BDCCA7FB295C25BC738CD29@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Y9fHJSTIP6zXAStX@nvidia.com>
 <BN9PR11MB52769E3A3DD09983C11677F88CD19@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Y9p9ehPsg9Hdn1OK@nvidia.com>
In-Reply-To: <Y9p9ehPsg9Hdn1OK@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CY8PR11MB7800:EE_
x-ms-office365-filtering-correlation-id: 46b46fcb-354b-4535-9dba-08db04d09844
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DJEfSYbZ6YbO+gs97SsNl5cmV0kXh00MYEVztvjYcdRVyw30Bf1Z9vGhqLfUgvEemCXLIfP+7TVU0JMa9ok3Wc9h2SLJDivPWI0U89buwd8n0JwU8m2Kic0mBA8ynP5OUD9AYRglmgkwEIWChkbJkKCunplsKUKWLifua6xG4iAo7FJ++3F4CjdVX+VzHFs4N5M5mdR4xuiwKnrp40+KQxczgkRMNnNVSGziIWNdoT1xHyKcuHQscc9W/pW3C0w1k5YbacxGv0Iq6J3byBJZ8s7HgKNHG6ohnZJqvISzCOfPrZkAds0NCspWWG3mzn+PyK3iEG2frMMfgdCkTMEpwmEs2eihUjxXBAtYLl/9XIweAsdRtLfF87Oug18ePusAjjnioj9PpMK0KEdL1TJCdRIUtbHcRKFggJXlgyH5KstsZMTnXYZ7Fg1dL0DwvQwkVDzSoQmrtOAXVUzwze+j3k4UrF8fYAGxl2DVHdiCVKmktpeJFFtTkaDqQ6XB8m3OWPhuL/Ud1dCpwPFHH1EnGNtUHrAWv2XdCZ86mez7syNMW48S0FO4mfQwfiaT0sX543vKI2LIYwuLWE9mSF+Ads0wYIC8DLhMjV4zjzNYwRT+2V8KiemntBi0DMHCOVvR0KyDA70HCYTGSx/pzZw7soiAj7kQt9FB0M23XSGIH8P/283Ir1Wr8THfuKJ7v6U9zQuNx2vLpZ59OEc+ZF3APg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199018)(38100700002)(83380400001)(71200400001)(54906003)(8676002)(33656002)(2906002)(316002)(122000001)(82960400001)(66446008)(66946007)(6506007)(76116006)(66476007)(6916009)(26005)(7696005)(9686003)(186003)(478600001)(41300700001)(52536014)(64756008)(55016003)(86362001)(66556008)(4326008)(7416002)(8936002)(38070700005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kGwUmhbsjXWydpyDnezmfm+GNC5nSPvr3aCOw+1Vr5PqDLOJ6WEo+qh6fWyo?=
 =?us-ascii?Q?zCLvRiYbNWKiUKeuFqy8M+LVG4n5bquPwv43VU3/iqq9zieSkAw0pEF87Ip4?=
 =?us-ascii?Q?CMUvuBUDBzC3y3V/6XenDm2idheJlvSGPPXCXE3zwcYfVRUKnEs9dQ4sw5dI?=
 =?us-ascii?Q?mGSErJKb0vChEDvsoXa4cO9dG5rxRsvRyHyJaAAu4IbLUYvbSPmuO/6BcQ3Y?=
 =?us-ascii?Q?TKe939UuRoD7ijCgX6i1Mov/7VvE6JiQBqZ1FkulMKoqLj5kXYlYhtRbnfSG?=
 =?us-ascii?Q?rL9umD01RQjaE4ErNqTuzxEZXGZjUhlQZquLskg3aChZmXnvBE19FIAf4Awd?=
 =?us-ascii?Q?e+GwCb4PUFPOzcyZxGreM2xCVxEu9mMe4UtBet5q2ra5+dL8hutTz0dZvrd9?=
 =?us-ascii?Q?LN8wF9AA8tc7+gnP1kaONQcden/YW3XivZzZCHqBTH3bh07QUI/wO2af+6eL?=
 =?us-ascii?Q?qDuCmQr5E55MjNRA6k7PpzCwiZsSFvOGYLWpO6UGLKvrgJtpqIHcsS3w0QVQ?=
 =?us-ascii?Q?oOa4SfXyzfSuLqb+TSCi0ycR4XwwXne+ueW3Fo/B1Y6CNXmec3bhCrtcfKKu?=
 =?us-ascii?Q?FEekSCb6HDWAUpBz1LLfbuegVJKeQb/V0D9UlSkB4l24+apL4vn8eqQp+GHe?=
 =?us-ascii?Q?Hgzh9nfRFMtN6a9QNnQ1ah8kvH2z7FY8Gh9KjyFfm9uqVWIrMsgGLwR9jmu7?=
 =?us-ascii?Q?SRharjy/ynr6V3xAdG0t+2u7ZVq1h6lZvvjaRUd/JnbvrAQPvgmVAXRk1EAI?=
 =?us-ascii?Q?G22bEVyeW1mwVzUpq66Fx1uM9RacKLD7ToLgBpAlTI6FjkMovNy84kKuxZqB?=
 =?us-ascii?Q?zoMlKYam0600XTaFZlJl0A6axHmR454iIdNZqiewk0KvkXCV9EtfdYWpw1+p?=
 =?us-ascii?Q?1/5Agl6G/owdVtmhBlcRHiTnjNTSWuSAGGoKM6rjpr1X0drc8hw1IfEwa0B5?=
 =?us-ascii?Q?lFog2tVmribguoBBkxRN+ApfupHqW+/FwNLgzVj8wHHz56PtvaQuNpCF01Qh?=
 =?us-ascii?Q?G0WWyxX3jtVYKfPLJNz5nJnEHIwX1R8P+jdjF76rTUbROGaGHR6bj8msvZ8W?=
 =?us-ascii?Q?S61hHizmdpC7npPA3Tch68xnHyforEAPeA2GupJHkQJnicV59gLpAfbd8yRG?=
 =?us-ascii?Q?oaZVS/Zm6pUFwvw6O/cPplZeP7qkh+s8Pk3b+ShSe8aLphY3kSvFRkx7alaA?=
 =?us-ascii?Q?0+t2vTuoUwblvmrO3vP+z2//6qM5DRMLTWiqt7Wyd3wykJoTEewMvyPcM29h?=
 =?us-ascii?Q?Hx7et4Pmt6FlbSqALS+VEhUjXlQt3t8D+pEbpsitmoR1rs7hsIb5x3W9uOOF?=
 =?us-ascii?Q?VoQC8RcuNFs8IJeNeaOuwQLr2cY1r3pi/PI1n9EfcN4hJOI0th5/KHbx/oWc?=
 =?us-ascii?Q?10OEi0odEwmQ/3FdVyA70YugvsVkXNqgqXtWC2QIU1Ymb3J0X8s7xXQYIabh?=
 =?us-ascii?Q?7oprTjQoH2fQ9o6bNzyGSCpEuGxMEcKvsuOLJpsuOzclUkgGBozdPd6BEYUW?=
 =?us-ascii?Q?vnuZDGaS09klzdRi+OrtPmQ26AP/8ydyXPQAJYQYUppjLpZB6I849RTDJD3v?=
 =?us-ascii?Q?TxNQsJXru+qGenx5zBJ+jZE1sm9KZDYfkcGDVW+s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b46fcb-354b-4535-9dba-08db04d09844
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 03:50:15.7087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V54JMvDmgdpB6ZTicbwoBacPnuSJQJTAegmODN27hSBN3/U5jy9dUitfgs4um+K5sztSC2yt0s9nilCZQBXrog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7800
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_195027_512308_12286CFA 
X-CRM114-Status: GOOD (  24.07  )
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

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Wednesday, February 1, 2023 10:56 PM
>=20
> On Wed, Feb 01, 2023 at 03:14:03AM +0000, Tian, Kevin wrote:
> > > From: Jason Gunthorpe <jgg@nvidia.com>
> > > Sent: Monday, January 30, 2023 9:33 PM
> > >
> > > On Sun, Jan 29, 2023 at 08:11:48AM +0000, Tian, Kevin wrote:
> > >
> > > > " I'd also question sprd-iommu, which hardly has a generally-useful
> > > > domain size, and has only just recently gained the ability to unmap
> > > > anything successfully."
> > >
> > > So long as it has a correct kernel API and exposes the right (small)
> > > aperture then it is OK.
> > >
> > > The device will not be useful for qemu, but it would run some dpdk
> > > configurations just fine.
> >
> > I still didn't get the restriction here. Can you elaborate why it works
> > with dpdk but not qemu?
>=20
> dpdk needs like, say, 64M of aperture and doesn't care what the IOVAs
> are
>=20
> qemu needs the entire guest memory of aperture and must have IOVAs
> that are 1:1 with the GPA.
>=20
> So aperture size and location can exclude qemu
>=20
> > Can qemu verify this restriction via existing path or need new uAPI
> > flag to communicate?
>=20
> It already happens, the aperture/etc is convayed to qemu through
> IOMMUFD_CMD_IOAS_IOVA_RANGES and if qemu cannot get the IOVA's it
> needs to create the guest it should fail.
>=20

Make sense.

