Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC541C25B4F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 15:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAAlwkv+gqHtqv9gdmsDAmswtyM2rZtbA7wobI7iOcM=; b=R0rLAaLz7Wos867knIGAQFHLOo
	pH7QERFMmcSIPkwl6vd9D+FBHiplVlzUN8noEe4yfag4G3dS++UI/BAIepTZC2usPZTnfSt6vJyRI
	QMg52xqeZCzKywL/J0Jl0wBlQmPz1biHEO47Y2OiXIbrv82B1c7s2DzJe038fxOTm3hBP8PnT7Q0g
	cwvgmuTKQJSjNZWWqTR9JiCMAKgwZlA3L/uaRKL+CtbK6x+zJSB6R1AUHNd2YSVWgzdKkjykLglJU
	avYOpqs2vpgXgEw2bB4SpAx7Npcu4aFo7G0B+KhFBOlYYYN7UsXqOTGg0jYEg9yGKMrq/llshyVR0
	x77ZElsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4N2N-0000000BnVw-0t8j;
	Tue, 07 May 2024 15:47:27 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4N2K-0000000BnUi-01oL;
	Tue, 07 May 2024 15:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715096844; x=1746632844;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=xFtdF3uTU5MeX8fnf2MUp8GBQN6t+Xi9H2w0W2kvsQc=;
  b=drqp5XSasnNubtxwi0U39dm56jyYdSGxfHgIsCnZVXW6zo7DQA1ORUsl
   AOGOrfppuCX5eE3MtxigznLM1G6nCZGOGqepPtwGbpRj6bzlvuXTsN/2L
   7G7wYebxD69IT8VESJ9n4wAc5EI/V32tncdRhyL/NEjiAX7OY/5W5IaHN
   bLJTQEZ0zclht3EJ3rdWf2v1dFkP+QHbEOOaKWbpoWDe2kpjCiuwPiZBy
   2sqLmNWK/cedfNHEQeEHLiMC67sJd8sk9GfvrDmLX05+HMz5f2lTdgWQw
   E+oc9RXFrHGIWtEPejSPQQ6eo8i3gD+yuB3GAZ4mFaZNcEmFUzzLnMHnr
   A==;
X-CSE-ConnectionGUID: YeEbBHIaTLS07hkiieFcEw==
X-CSE-MsgGUID: rwC9TYR/SsmkCbA4zOLMpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10769954"
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; 
   d="scan'208";a="10769954"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 08:47:22 -0700
X-CSE-ConnectionGUID: GS7VStP7RHqVGxZtgN+Owg==
X-CSE-MsgGUID: TUTdfKEJQ4ulaKZM+Ou4ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; 
   d="scan'208";a="28536771"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 May 2024 08:47:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 08:47:21 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 08:47:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 08:47:21 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 08:47:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGxHjAnhUsNU36ROwUYrxBojo2kdbzdi4kQD6WjezB0fxJ513x6AlrqcbvKqCpYVUpKU+Q06xi0/5mZwJMw9wRA9QBxvDGm5GML0CHFWZJdxJfMVMErAQtxwRYx1WXIaP//CGcbfey0D2HJCX9oWzmaMRAY2kWeobYpW+gHjWEH6SKXoKE/nzovagOlkba8VRm7Zu6WSe3SOjMkHY1smht21yKmiPqFbqxxeSzdtlPHxAdFB4R88TnbX1JpmKlLKrX5DV/d4+gTvpDqZX69gUYkjKOXybWwmAUlLKD6Cej0wykQ9LfY6krGpJzhCCNkAzG6h2cbDxSpPJare5W2vfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAAlwkv+gqHtqv9gdmsDAmswtyM2rZtbA7wobI7iOcM=;
 b=VQHYEpk1zK+DFTCC6Cq6sxPhR5o/SBG2coADA6OwieivUleVn3DuPBcU94F/8jZvL5RCEAUf13vQDGsDn/ghcCh3WCYuhWkKVfpcrY+kapHxibSEmO4XkiEGx7JVf/jt95Ws10xKtqqZoSMZZ6jP80sIxM/sQTXFPRDhFkuoSwn4axLvSez98JjHVNzxitnqYNupmVG4cceuZdezBl73sCZNSeNUBpF7DawWgZMIkVEWA9ZyOsNNZH5o704ryzJbkAu8nP5+KBlFqguofmrX+A2TSlvzzzMsqtYVHlVtOiLXAQJDx+8oy7gWepCSmskrAMsKL/gkD9hBgDQds4qZdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8102.namprd11.prod.outlook.com (2603:10b6:208:46d::9)
 by PH0PR11MB5207.namprd11.prod.outlook.com (2603:10b6:510:32::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 15:47:19 +0000
Received: from MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::bfb:c63:7490:93eb]) by MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::bfb:c63:7490:93eb%3]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 15:47:19 +0000
Message-ID: <2a5459a7-954c-4841-8ad5-ac93596fc21f@intel.com>
Date: Tue, 7 May 2024 17:47:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/2] net: ethernet: mediatek: split tx and rx
 fields in mtk_soc_data struct
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Felix Fietkau <nbd@nbd.name>, "Sean
 Wang" <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "Lorenzo
 Bianconi" <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <6747c038f4fc3b490e1b7a355cdaaf361e359def.1715084578.git.daniel@makrotopia.org>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
In-Reply-To: <6747c038f4fc3b490e1b7a355cdaaf361e359def.1715084578.git.daniel@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0207.namprd04.prod.outlook.com
 (2603:10b6:303:86::32) To MN6PR11MB8102.namprd11.prod.outlook.com
 (2603:10b6:208:46d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8102:EE_|PH0PR11MB5207:EE_
X-MS-Office365-Filtering-Correlation-Id: 780f638d-37db-4125-7b31-08dc6eacfa58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|7416005|1800799015|921011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmtwWWx6cnBBVW94M2F1VU5jc21DTnRwWGFWMHZvdGpKTHMyTFN3d3J1TVZS?=
 =?utf-8?B?Sy9PNkdqSldHUEt3S25tV1JiaFdVcng2Nm85QVhaTVloWmZVSXBDYUFOUlNi?=
 =?utf-8?B?SkhNbkJGRTlhZEFDb0psYnErODNpa2dKbWUyR0dyaHRQNGI4NlFDR0YwSGtM?=
 =?utf-8?B?OGZ5aUxWbzhHZXc0VGhQc2JQZ2Z6NnpMSHB6K3lUSldsSFBNc1BGR05weExq?=
 =?utf-8?B?emdlZTBKM2I4VTBzT2tpSEVwTlFRY0gzU0w4ZUdlMFR4Z21uMW1BcEFGNlg0?=
 =?utf-8?B?VnJ1bzFEL1FnWkJaZUdyMlpqRFNiYU54bGk2Nk5nRHYwVVVJbGJRVENpbnJJ?=
 =?utf-8?B?R0FPU2ZObDc5bkowU09kNkwxS01QRUxBTjZ2cFFsUS9SbUt0N1VSd205QmlN?=
 =?utf-8?B?ZTNNekFKTWVMSVpkMkFGS2ZMd3lKanpFNnJEYkNrRVBDN3B6V0x2N3Q3VFg5?=
 =?utf-8?B?K3NkZEJOaXlpSGFMWE5VWCtvQnZkM3ZRb0FxUjErWUMzaSswaSt3bFJzeFNa?=
 =?utf-8?B?Tnp3bGNiWkljckZXRlJzbWp4anBTcE1SZE5NZDFJTTFveVUxUzg1bHFwcUQv?=
 =?utf-8?B?ZzZpTGVFN1EvdFBWYjdac3ErbXBGVzYvZ3hMZ2NhN2ZLT2w1Q2I4WXNXdmtl?=
 =?utf-8?B?aVkwdXRoV2hNOFBBOXVlbXB3YnVBb08ydUQxdVMwQ0tVaG5UUXU3TnUyK1Iy?=
 =?utf-8?B?NWhlMmdUWnZtcitWY0NjU2lJSXhWSG5uQ016UmVxRFU3dytNSUJFOWZuOTBS?=
 =?utf-8?B?OUJqUTJyZmRHWFRIT25RdlN3WXZ6Uit5WnRsTlpXRTlLSHdxZ2p4UkRhQkFk?=
 =?utf-8?B?bC8zdjc2eStneFN0d2ZMMjVJOXJDQ1B6NkQ2VHRzYk9FTytkWTkzdGwzVHc3?=
 =?utf-8?B?M3N1TGNwMUdRV3dhNnhqQ0Q4TGVkajRDaEVTMlFVRnc3NEE2K0MveGFsWXlM?=
 =?utf-8?B?aXpkSGZwanEwU0VTaHY4RGZ6dSszKzFwZmZkS2pjRW1HU1EwdWFZMXMzTWFJ?=
 =?utf-8?B?ZU5SdWJLWWRMUlIyYitkcm90dmlPUXNTUWxCYW1JQmZSWkhNS05MRExQZ0o2?=
 =?utf-8?B?bEY2Y2NJdVlERlJZSGh0RlFDeUdTR05CcW43Zy9wMWdxRjA2UGdZbWNiVVNM?=
 =?utf-8?B?T3U0MW5iYUFTZXdPOUd2bm9NbkZvWmpHTDY0U2d5M0JRQmphWko5endtUm8w?=
 =?utf-8?B?cUN3SHVVNkxwU1FwS2FPSjdweldZTDk3VURBMlVpYVlNMy9WV3JqbktxSGRU?=
 =?utf-8?B?M2tqRW0zbWhQWFVRZjZQa3BmaTEwTk1RZVF2aHQycmc4Uk4ydHNXK1hPc3lD?=
 =?utf-8?B?clpxZkRENFJIam15NHNYNDVWc2srQjJYYTRTcHZITlVteHZ4K0VFbnd4clhQ?=
 =?utf-8?B?eXZCV2hpalY5dWJjQ2hDamFKL2gvWXBCbWxMQVU5ZWlMYytqeWZKTDFzYU1Q?=
 =?utf-8?B?OCs1Z0hDQU55SFV2WGVWdUxacGZFZHhVN2VjSVd5S2tJRVMwZFpXcnJBVFkx?=
 =?utf-8?B?eFlFN1h6YWw0ZVp5S0JBTUdOMU9NYWt3ZzJnVld0dnp1S3FMS0NsWEZleWFX?=
 =?utf-8?B?ck1XSjUrM3MvazhpUUFEQnFFZ1gzelhiVlhTd2Z2U05TTjJndWZpdEhFYmFn?=
 =?utf-8?B?SHBsNTZMR2R1WjFGQ1QwTWdaTUxJRnBWdGF2NTV6Tko1UHpuWkkwc1lJcXV3?=
 =?utf-8?B?dnlQcnNadVAwYWdzOWUzQmkreTI4TkhkeGpoWXhsdXUzMk9HeUdwOHpERHVs?=
 =?utf-8?Q?wbkofXS6c3hVisiVyH7QbftH2k3WofuKj8+/yAV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR11MB8102.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(7416005)(1800799015)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnFuOCt3d2RWTDBiUS9xdzhlL0hZZjFuT3dHNVE1RXdVOGF5TmRYUjd0c1hI?=
 =?utf-8?B?OVdxbm1DTEtCV0gxM2NJd2xQN1VxVTR1OWhOb0RzVGFKdW5HVVU3ZFpNVXhq?=
 =?utf-8?B?Qk02UkNITFBhSCtlMklnVHd6b0xYWWJjZ1Z2SGUvTHZFU1ovblZjeGpUZERy?=
 =?utf-8?B?WUd5ZWVSVnBHL2thS244MjNHQUFaS3llZVk5RkRJNkgvVnNuSWxVd2F0a05T?=
 =?utf-8?B?RTVaQVhEb2x1OGJaQVNkZ2piaGxiQzg2Wk5zeExESFcxcGh0R2lJV09MNGk3?=
 =?utf-8?B?RGs5OXJwZ1pvZlZDdWNYNzZuMmNhd3FCQnp3dzNwVFFyREdlL3MxVUIzZm9B?=
 =?utf-8?B?d2FhaHRDcnQvRG5PZFMxSjhKcWJWcytqWjFiSCswWXpreUZmK1hDYnJFQlZR?=
 =?utf-8?B?ZFNHYkp2QTNNaXEzOExNTWdnZkV1U3lJZTJvOFgwckxaa1dxbmcvN2s2bUQ1?=
 =?utf-8?B?L2JqSkpYZ3c3b1B2SFN5RTllRTRYNkhKOERMWmp1bTVjSnIxTGJ4Mlljcmph?=
 =?utf-8?B?MVBrVnp5K3R2NFM5MTdua1hCeG1lN2lndWNKR1dNTit2a2Z0K3dkc1VYVmU5?=
 =?utf-8?B?aDd5czRVRWsyYUNkbG5VY0ZaYk5VREtiTWVuckdKN1p3WlI3bW1yVlhGV0RT?=
 =?utf-8?B?b3c3OVBpdWt1bDFVbzNBM0dvSW9tOW9UMlFzZHd6SWNHQTNLVUtXVGRiRjBs?=
 =?utf-8?B?OGhnazYzUktCeWNCaC9yYWN5UUU2eGFnVGVtendzRTFMTTQ4bGRpZjNVSXpB?=
 =?utf-8?B?R1RlWmszTTNvelJpaUpHL3NiZjhGODlaL29wcGoyMUFkNXl0MHROazNvYUxL?=
 =?utf-8?B?dXNEa3lVR1I5bGpHV3BGZ2hVNmlTZCtyODZaRVhoRkV1WmMxV3J6MU5uSlha?=
 =?utf-8?B?QlJ6eHpYdE1oZXhTNlFyNzRuN2NWdndsUEdFTlMxckpHbGFNMlZVMGt1aHcz?=
 =?utf-8?B?bmsvQjk3bEJ5d2twcDB3QW9udGhBYzFrNFVORnNYUVppTjFkOTJPNUlZVXNr?=
 =?utf-8?B?NE5kZkJEYTBTRkZxTDdCUFdxVGp3SEZ6TWdINlVaaWNRdktwdTEyVm5KaEFq?=
 =?utf-8?B?RTB1V2FWV1B2MVdxSHNneVZrOWpmaEpqOFZ6UnRvTWVQMmJlK2hRTS9rc0M2?=
 =?utf-8?B?T1JEL0pQN3V3eFIrK1VEdy9QK1BNRGx3RmdzWUVtdlBjYnVrSGFGOWxhKys2?=
 =?utf-8?B?bHlQSnFkMVoxVmptV1hWaVVPZE9ad05KbEJQSFBjQk1qUkkrUTgzRjM3alJ6?=
 =?utf-8?B?QjE1VjExSXZXWFVuMzNIU3A2WlhpT0xoSkZXMGw5YWVOMW5PTTMvb0Vua1Jr?=
 =?utf-8?B?RlZrOHhYL013ZTlJQ3dsLzhUclBiTmFaQ0s5SUR0Mm9yemRCNVBFdFdDU1Bu?=
 =?utf-8?B?cEpBNEFZNWNHR1dxSHNPTStnZFdGNnovbE50aWRyOURCS2VsMS9KRnJLdkpT?=
 =?utf-8?B?MEZPZVVjaURPSDI5Zmx0WVNFNUNITVRLWVhuclIra3o2UGpHYjlvSkl1V3hY?=
 =?utf-8?B?bmFYOW1VQkpIbGZXNVhQTEZPSmc4U1ZpUTg1cWJSSTRkeThYcm1XaFJrdTRT?=
 =?utf-8?B?OHQ4aDQ0Q3dydGJvY2ZEWFd6cS9lNWNnY25hQm1zL3dUeGt2SFdnUmR4VWJC?=
 =?utf-8?B?S3BOeGh1V3hjTzJKWHZWMHBBMFJSV3I0Z1FQVlNzaDJFQ1YyUVMzYXlMTm9v?=
 =?utf-8?B?cVpGTTZYc1laSmpickZEc0V2ZXFHNFJGV1VtYnV6eXJ4ZXJGeGFhQmtZQTZV?=
 =?utf-8?B?ZXlxem9Ra1pvU0ZIUzBtR0x1c2c0NFViY1VoY2M4ZDlNM1JZeHZMMXFMK0hK?=
 =?utf-8?B?ZjZTQlloaGVVSWxWd2pRTzdHVExFSDMyaENiaDV3dGVBVHJRVEVFUzc0Um1p?=
 =?utf-8?B?OTRadEVIZ2VmR0xFWlN5aWw5bGluTU5YKzlZODBZYTFseUpLaWZyeDYycGR0?=
 =?utf-8?B?eGZJWDJGZ3pkRmlGTGdzZm80c0VRd002ODN6dFBxTkw1NHlGeU5NenF4czh4?=
 =?utf-8?B?OVZYR3I1SUlhaVdwd2pRVXpJYXNyeVljNU5jcThwMTI2M1B3SUlOeU5lZWJ2?=
 =?utf-8?B?MW5FcGNkYm1qQmozcmJnMktpSXV6YUhoSXU1V2NkQTlWNVhiTGRqVTR2T1B1?=
 =?utf-8?B?YTQzeFpyNnBHbHhXaSt0eHNTaTJXNmVCcERYUmJNTzYwa1BiT3l0YzVnb2dD?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 780f638d-37db-4125-7b31-08dc6eacfa58
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8102.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 15:47:19.4634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5loo1Ju8m2gm74FtdS+8FrKBGuiGqCGoQG2AACfau+sj5VHcYFKxSBGK9KNay+Rmj8XAB5b4LN6eQhLaKWmAyM39rIL0ZXAW00BJj6HTFnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5207
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_084724_235584_C082380B 
X-CRM114-Status: GOOD (  18.58  )
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

On 5/7/24 14:24, Daniel Golle wrote:
> From: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> Split tx and rx fields in mtk_soc_data struct. This is a preliminary
> patch to roll back to ADMAv1 for MT7986 and MT7981 SoC in order to fix a
> hw hang if the device receives a corrupted packet when using ADMAv2.0.
> 
> Fixes: 197c9e9b17b1 ("net: ethernet: mtk_eth_soc: introduce support for mt7986 chipset")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v2: improve commit message
> 
>   drivers/net/ethernet/mediatek/mtk_eth_soc.c | 210 ++++++++++++--------
>   drivers/net/ethernet/mediatek/mtk_eth_soc.h |  29 +--
>   2 files changed, 139 insertions(+), 100 deletions(-)
> 

Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>

(please find some possible followups below)

// ...

> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> index 9ae3b8a71d0e..39b50de1decb 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h

// ...

> @@ -1153,10 +1153,9 @@ struct mtk_reg_map {
>    * @foe_entry_size		Foe table entry size.
>    * @has_accounting		Bool indicating support for accounting of
>    *				offloaded flows.
> - * @txd_size			Tx DMA descriptor size.
> - * @rxd_size			Rx DMA descriptor size.
> - * @rx_irq_done_mask		Rx irq done register mask.
> - * @rx_dma_l4_valid		Rx DMA valid register mask.
> + * @desc_size			Tx/Rx DMA descriptor size.

I find it a bit misleading that you could document fields of named
members at top level like that, but this is not an issue to be resolved
via -net patch.

> + * @irq_done_mask		Rx irq done register mask.
> + * @dma_l4_valid		Rx DMA valid register mask.
>    * @dma_max_len			Max DMA tx/rx buffer length.
>    * @dma_len_offset		Tx/Rx DMA length field offset.
>    */
> @@ -1174,13 +1173,17 @@ struct mtk_soc_data {
>   	bool		has_accounting;
>   	bool		disable_pll_modes;
>   	struct {
> -		u32	txd_size;
> -		u32	rxd_size;
> -		u32	rx_irq_done_mask;
> -		u32	rx_dma_l4_valid;
> +		u32	desc_size;
>   		u32	dma_max_len;
>   		u32	dma_len_offset;
> -	} txrx;
> +	} tx;
> +	struct {
> +		u32	desc_size;
> +		u32	irq_done_mask;
> +		u32	dma_l4_valid;
> +		u32	dma_max_len;
> +		u32	dma_len_offset;
> +	} rx;

you could consired a followup that reorders fields to fillup holes

>   };
>   
>   #define MTK_DMA_MONITOR_TIMEOUT		msecs_to_jiffies(1000)


