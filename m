Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6785AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 11:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fk9jAuxsOpFzp8rpVn28WblrpVWEu2vXM+PXwLciPxk=; b=ePBfDeuIGiVhHHVpMwNh2OydWo
	Sf7sakMPlB9ed3OyEdi9W4JWL3V37RSpGqgs5zk4ZynU1kxapG6As34KBgNcFiAy3ysGoOn4/0BB9
	41vR7taO+ITqs6kE4Y6EjznGeKNN39GxDRh92tnCLBqD2s4HlnCQb5Iaj6jnKzzyjOErmqcTZGbXz
	XLSKd8THLxPUyIOAhCqkRdVzCIfKDCsGH1EdaYhbeX2dEE0eyVCFKvCqExSBdn700qnMZ6sUvBX3B
	hzdc4i+d2KPz9T0GT35g8+CFGeDkXRZipfyBy8t4n0nP1Sn8uINYVwAPWJpWUb1fZ5SXpR7L7Ow3Y
	z5+O+VOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myB38-009fOx-QA; Fri, 17 Dec 2021 11:05:18 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myB33-009fLe-Hx; Fri, 17 Dec 2021 11:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639739113; x=1671275113;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G25DkFb4HNWk41Ihod4FGrE9OmwvnIQxqHl69zJHwFc=;
 b=ee0vE4bLQyJ6xuv3ilOvmF7ME/j+LzociezPoQ92hAVQHEjFtpolaDF6
 e19uLAQHQe21jXG2d3era7S7wQcs0/1cPUh6Ual7nlFccfuhRDGlyBmJn
 uQDu9i1TarEP4c9KdUyKTHguSCUH4cSgkc538LFfqj6zKOr/Oukn0hNbK
 RujLqTZEYzHLgUL522F1PGP2NetQ7wpekNdF4+/r3nytAtZyLZ/GAu9iZ
 9bohPeqqayT83S/1DXqkTrDHSeACx7Msdu4TfbtP0Q4GMf8cEr0EpPQQB
 wF6n4if591URvS9ITS48W+ZRw5Z5xV0M1mU0vlFAS+it9nwY9guWYhsV/ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239543604"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="239543604"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 03:05:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="519704204"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga008.jf.intel.com with ESMTP; 17 Dec 2021 03:05:11 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 17 Dec 2021 03:05:11 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 17 Dec 2021 03:05:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 17 Dec 2021 03:05:10 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 17 Dec 2021 03:05:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h96FvLsK5lUQ0Z6V8gJRHE9bWM+WwLkIN2Iys1If2ifqShWxBdElyFMcJLgUbDEt7mfomW5hs0UDnQduN8Bjgr9d0eTYaFoodQegTAe+e7W2X+z4VGTP/ldgxzU7iqCmjdPZsvHvGr6EkE/PKQQ7mbZgnQuhvv9YDQr1KHl63Gdvc3gzntY8iK5Z+UkQZYcIVpmpxnksJ7UYOHxmZDQFq1Eye019FQ/tlXo+UXr1tUSNugR5HQ4rXhOMyTmepzYEf9sIrp8EKO8YHn4HKV9JFNGajegB+DboZZPfYF7/STG2AL8O9YX8oW4I8Y7VEGqgfxi2K4NhCBbkHfSYuLufSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/B21F1AoZ/8US3d6BVNOwyuYb9qizbl07UZKfHdVeCU=;
 b=TBlXcqSV/I2+bZwEgmi84IhZNhMbrndrPo+0ZNl/xME0+gBHeyeXp2BFJobkknqz1iLTXMLZ2Ak6fyzTBYT/KokG0nv3UVX+L5UyuVfY6NyOgyn1t53moPm0bjKLEkSmHNToHdSWIr3J7h3TfifnVdzkeX24gh7DcDp6lKBvwVa0C4/ML1n6CVLnAT1UCNvXIqBJOH86L1Q+MLWi4dAUpe6mZdfUSRM0zzx2UvZ/n145oAEIFgjr0xPB8rsCeEIC/I7zm98+m6DEpDjnjuzQcJCCCuTW2tetF2FvfY9EyHJZ74dYxELhRQO0skxIxXAWrO/ppkBF8Y59kr3zRj8QcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN6PR11MB4052.namprd11.prod.outlook.com (2603:10b6:405:7a::37)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 11:05:09 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%4]) with mapi id 15.20.4778.018; Fri, 17 Dec 2021
 11:05:09 +0000
Message-ID: <cfb2d2f7-06fc-5930-4d24-b51e8b69c9bd@intel.com>
Date: Fri, 17 Dec 2021 12:05:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [PATCH v2] dt-bindings: dsp: mediatek: add mt8195 dsp document
Content-Language: en-US
To: YC Hung <yc.hung@mediatek.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <daniel.baluta@nxp.com>,
 <trevor.wu@mediatek.com>, <allen-kh.cheng@mediatek.com>
References: <20211217070835.31709-1-yc.hung@mediatek.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20211217070835.31709-1-yc.hung@mediatek.com>
X-ClientProxiedBy: LO2P265CA0125.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::17) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fab9662-d4d6-41c9-dc50-08d9c14d16db
X-MS-TrafficTypeDiagnostic: BN6PR11MB4052:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB405255F626354DFE5625CB39E3789@BN6PR11MB4052.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qdke4xeQH4Tpoc+o1AYo+Rbh3y+titP9iU8EpDY7qfcF2RLyiFQ5/C/yAIaI+7OqArTPyY8ZQOYrDQkowAA6hgUTCXFG+wkpovw2mc20wWfiTX+jLbfrujMqdjHiEB7lANx2GU2+yjVOugC+3F4NbHCucCjFO012y7RWkUS6ZgOXGxTx9rmlF6YA7v8z9Qv+EHv5hPVrsSHHhjn1+iLZaDat8uCo3Ko07SeypcyiGuOQqQD/pIq9wkRFAvccop+dvO/pU+BaFCyHrD4lCFtWCp/4zae9yTzmds3iW7S115vaRrXHqMjPjtsTqKdR/ESiE4l43KxNiyjBAAc/vQXnVy/CVUecjGH585cHPnRY1IKNzapYI9bqSiV1eC7zH3Kdbx5rl1+HT/5N8dZUvVnr7euFqAKw7rgdSP4RAkHVqS2Q2HebG1Sc36K/5PdrJIwbZGPAAlOx7J2ADqDGBF3Uu3FipMJ5pebkUCJAyJ2ITYEiRASvlmvygbl9bWwY7wb9oMRVjRLljpKdFJsAKbV8MQC9Vt9U8HyzSBo1xjeG/Z11TB0/5CR551HCzqP+4AMAMFDuVda3tK5SEi4KvVaE36ZGTmd3fOBAlnxE6c5BNlgdej6ERuzPavGLEZpDqhrRomPq/M6cJdrzp96PeVk7HcNdyRympLgMXSziJF9x7RMjCyLUcao4UTNl3ku1x4JI4s2Yy8tIargLu39fd5aegmDKENuvmzwGCdSypF+IAH3O09NVHjB8BxOf+mnBCPM6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(6512007)(6506007)(44832011)(36756003)(5660300002)(8936002)(31686004)(31696002)(2616005)(2906002)(83380400001)(82960400001)(53546011)(66476007)(86362001)(4001150100001)(6486002)(4326008)(66946007)(508600001)(186003)(6666004)(38100700002)(66556008)(26005)(4744005)(316002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTJMclUyNDRtR0h1Vm0ybGM3VGhXOW9aYWh0REl5NzZ4KzZQNjJycEU0THkv?=
 =?utf-8?B?NlhkUlhjK0xEYmpVRjV0dDZNUDNSdnl1RXlGZ1RoeUJncDh5ODIxME5RV3ZU?=
 =?utf-8?B?MkhacFpzL2NDbnhUWlE3bUx5aG5pTzlvcXlWczQ1WVRpOThMT1NlYlQybnpF?=
 =?utf-8?B?OFpUMUc1bDM5a3lqN001ZlVheVI5dytRNDJLSlZFTUVIQmIwTWxLRE1aU1Nw?=
 =?utf-8?B?bmwwUHkzTWw2Mk1xazRkR0kxengvRng0UklMTkhzajB6dC8yVHVLZlhwcll6?=
 =?utf-8?B?KzRwUDFzdjRRMVQ1KzhTd0E3ZEEyelBpd1NUTVZXUVd6R2pndVJLSjlYdkd0?=
 =?utf-8?B?VE5CT1ZnRXpER1dEdmEvUHR2WlZNeHRrRmJmOUhhalhxV05RWVNPalhBTFVY?=
 =?utf-8?B?YjZnT2h0eDJ6QmplM2U0bldqTElIbSsxZjZLcEpSRTltR2hTZ0VIUzVDQWp4?=
 =?utf-8?B?TkpBalpQaDBDTFhLM1RhMFBSanpSWkRKU0IvNzlucjRPVTVKNUtyNkNsdlZC?=
 =?utf-8?B?T3ZaYllYTnRBOFd4cnB1Rk5OVjFlNFgyUExJZVJWNlRnR2dqeUc1UzVBZ1Iw?=
 =?utf-8?B?MHY3SExkUkJla01mZDg4UnhIYmtzSDF2YzFmb3hGdSt3U2E3ZStVV1hmTlJM?=
 =?utf-8?B?TUNUUTNPa0xzUFZENGxXWlFYVDFBL1BvdHZMVkZ2UldEeHhnTUhQTzEyQzN5?=
 =?utf-8?B?OVlnOHFWRU5xalc1WjVuUkVmU0c1dmxEWDVWQkd2dU1nLzVvWExjczh3YXB0?=
 =?utf-8?B?ZW81dkp0bTU0TlFSVU4rRjBIam0ra1F4SDJzdFZIRGFYWXlXc3hwckpjazFz?=
 =?utf-8?B?RWxDUFBtQnVNcVhobFFpVUJhWnpXdjBqN1ZscHBMa3c2bVhmK0V3QzBRdFFB?=
 =?utf-8?B?K0d6aEFMS2xoNnVRcmRoS1JQN2Y0bWwwSDJ1WmhVMkhxM2ZsVFZHS1U0eWZD?=
 =?utf-8?B?amgrb0YyT21GRkNxc0tEZjlPWWZHTjdSVnQ5bzJ4L25VakVHbk5uK3NQRC9a?=
 =?utf-8?B?NStNVjREenkvcUY3MEJKalBudjFQTlBneWd0dm9CTkcwZHZPdGJVTTFWRVZS?=
 =?utf-8?B?NHpyV2g3N0owK016NmhIRFFOcGFUeXphWWVaZUc3TkpXSGdiOHZHWlFBRlBN?=
 =?utf-8?B?RUJTOWxBNE9MTWkzYks4NmFreTRwN1RPcUZBTzVmdmg2NzlUaFFNck5RalhS?=
 =?utf-8?B?aGxGRlcxdEdtNGtoeEo2aUcxN29oNVk5ZC9PdS9PNWhkZ2x2RU16MTUvc0kw?=
 =?utf-8?B?TytCbmRYbDlyWWNNUUtROGNEYU1BT1MwNW45QU5pU2tpK1NBUWh4TnhpUUJY?=
 =?utf-8?B?bmM3anJubEhGRGdtaHJQSjZyOVMrZC9tNGV5aDVQMFAvNUhCcmY5RUsrSmIz?=
 =?utf-8?B?c2FwUStMQUl2U2kwdURsaVFIWFl2WkZyWEN0TzNMOFhJMFRUV0wwVUtGMExU?=
 =?utf-8?B?SFZOYjZJaEpqMFk2bHQ0NTczbGl6Q0hvdTFOZW1oQVEvZVc5alBjWWdpbDI2?=
 =?utf-8?B?OEFHNWJMbGlkZTZnOVF6b0tTU2VnT3NZS2wxWkYyMmZQbXlmWTIraDg2YVBW?=
 =?utf-8?B?Y2hDbC9Kdm03QVRmTVFHWFIvOWM4aC9mQ011bnNUR3M5SEo1N3FGOHZpN2hI?=
 =?utf-8?B?b0lsblFUUzZVOFI4emNEY2VuS1Q3Q3pjS25sZS81bkdUVzBBYWFQa1RmejZl?=
 =?utf-8?B?OHVVZ2IwT0svM0U4SDYrYWJidXNCWWdxWGlySVhZVGlZQkxEb0xpSnZNTDNP?=
 =?utf-8?B?U1pHK3B0RDRKOHBxSXE0R1RMdnBXN3Yzb0Y2Y0NGUnM1MzUrVmh4UkRTK2Q2?=
 =?utf-8?B?Z2FsckFPZks0SjhtM2lGL3R0a1grV3NkSGZMM3lQZG01OEpJZkJJVGphd3Nx?=
 =?utf-8?B?cGZ4OHZhNjV0WXAxbEhjTGEwK3BwUDJqdUZpOWJYbjQxZEtnQXJidWxJZ0NJ?=
 =?utf-8?B?ajhaWFRhVDBEWStRL2NEa3JXa2dsMy81TmhCSHJGVE5FTVQ3WVlyWkF2Rjcw?=
 =?utf-8?B?bkFtaU1FMnloRWZ0a3NCZStBRTZBMGR6MkM0b1BNcDRzMGhIMjQ1VXJqc2hi?=
 =?utf-8?B?Szg5OVdoUkVCZjNCN2FOOWZRR0JlWS9tZEtSbkpjbEQwak5uOU9HTExYZ1J5?=
 =?utf-8?B?UWY0QmJGcnZ2Z3JVOWFuSUZoMkpxQ0RiWWR2NmRseldITXVKamdORk1iTloz?=
 =?utf-8?B?RXljVHdTaTUwWlhHVlNYVHNEQkc3aFNoMGFoMlRucmswQ0h5L2t6K1lMamEr?=
 =?utf-8?Q?KQGbeFWuvt5NlvfP0m4jK7KFS3V8SEs1b0TigdtvjM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fab9662-d4d6-41c9-dc50-08d9c14d16db
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 11:05:09.1834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v88vHqgILvcliPAhbD+6csfLRh3gk3jyYMZjpiTtMyPqo7pOvtNTp1dK2maqnHZHRrYCV9msbKduF2dDfoSSnSQzThOkka9Py6sGPYvgCr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4052
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_030513_737650_E4216AFC 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-12-17 8:08 AM, YC Hung wrote:
> From: "yc.hung" <yc.hung@mediatek.com>
> 
> This patch adds mt8195 dsp document.

Hello,

While above statement is correct, the commit message would probably 
benefit if expanded a bit. Don't get me wrong, I also find describing 
rather obvious changes problematic.

Here, stating what 'mt8195 dsp' is and what's use, even in a single 
sentence, would probably do the job.


Regards,
Czarek

> Signed-off-by: yc.hung <yc.hung@mediatek.com>
> ---
> Changes since v1:
>    Rename yaml file name as mediatek,mt8195-dsp.yaml
>    Refine descriptions for mailbox, memory-region and drop unused labels
>    in examples.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
