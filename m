Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569C3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 09:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifMGK4BEOK5aIKdEQym334+P2hnzf+TQs+eCHzsP5LI=; b=GxoJn6VfLEJMju3aCjauV933CP
	2P5wyTdorpEPw8ZdFgxP/DYwCqnuBbQTSzxOm8X3D8uzBnEezisfZ0fZUCau9hXkhrhyZMo58b1Hf
	gHLEdBzfnHG2fuTaO+XsUx6olChVWZMGaOFHeK2Nrw/WgS/cB5FSDxATapH8IhqMCozgr5iQjgpse
	oyR+p/ftsFr4GJ0bvSXEUXugrnC6nUMXu2dfInGuWBQuokYoHk7e2lopQcRPYFL1FQasL2lbGDAbt
	EF/9rfdQzv4iqCGP803s55YvM8QhW6ySIG4plxsVf1dZ7MkQOJ5koJwbZuPMSnhztv46oI9DeSGDF
	nlbmDzQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4gVF-00B3c2-WE; Tue, 04 Jan 2022 09:53:14 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4gVC-00B3bH-Uw; Tue, 04 Jan 2022 09:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641289990; x=1672825990;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bzw7+sx9QMNXCIrHh6ILC8GvvDb6Q6gJRxz4VK21qkk=;
 b=fIFs7aiuIFT5FfjwSGMQHek/BNfQMR7sd3RA3ipYxw7oPiTW510MrioT
 tWTJTJwcwMeVl/0/m1vQtagoY7AEZbs1nvRHsxYP2dz2iQIMrF8nTTn49
 68KX8vmcCv5htLs2BNPv3+AL85NXLMwtzyLUZ3UGlSGoSCzcqX/Qro4Ne
 Wky33lh/PdSPpKNAQbFyzhk8odUiHaozyGfbap22o5STyTZ6ot3vCZ9vp
 MxdQ1zY0x+sskioVCWQLxnpBsUKid+mUzzQd2Xdq2nC9ZdzRFAMXBWh1S
 bPrHHVC2q1/kqqB2CP1N16QwdFdB5krvOPaTCX3ykezU0yEfq3iy8Aex6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="239736238"
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; d="scan'208";a="239736238"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 01:53:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; d="scan'208";a="590627345"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 04 Jan 2022 01:53:09 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 01:53:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 01:53:08 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 4 Jan 2022 01:53:08 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 4 Jan 2022 01:53:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgEQNfnUtI+vi53EyH6gc9L+FJ/tLQ7BBLvNImE/j83ZdAu7H7M0CVVa8yt3XNEqlk2pUC8EviWU2KppVHQtx+Sa9rJLJRLA6HqKVhFo2WKvf/MUcKNEkwvHNABHdipYBz1lZRqGuemDaauenwjucOJRPH2VntltleT4YjScgD6NAzo0qZd6acbN5+/7e1RPGGgLjF6BTkVuTc1Yy4N2Okvb+zrenWY8zHM/+QSTwGY6Ex/DOoDA3o34sznCkgQMLyl/DymHLo1awRr/w1KlwqFOklLcDCNN/8aU3O9+ecde5AkS3f3LWzShtzM4jY+FdBf9MC45ZQk7YK9ApOeGrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgyc+tPOkAH48yXgpWYShZIfXh/rvOtwujupFhu4maM=;
 b=SAsOykbGhvibD+/+/RM2GBgKb6sRP1ekT/q2y5/deTpW9Ne+7/F3/bi65Y0gtpgZ3SFn0wg2jILEyEOIWe/wBj7dSZJiwS6/TKQATzs504tYipqExHFfjOAeuYMC1QIDvDUhcY8rMr2JoyVttAKkpvqpnONto8qyYT1IpwAGWfcwoMYed0VwMWtck+bdH6C8S22g8en4UU6IF1K+HCpyXB5FrQJxrhtllThb680nc7kiewCSScswbOURZ6NWjvLTn2wtmvO4a1qbOtKBFoVGUm5UUFJVh7/wDdMGvstRkaesrlAbsDqwM7P7cTL2jm0XmQwf17HfNpFBLne0KMkYVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM6PR11MB3244.namprd11.prod.outlook.com (2603:10b6:5:8::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.14; Tue, 4 Jan 2022 09:53:02 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d%3]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 09:53:02 +0000
Message-ID: <2c69d44c-5e33-03d3-d981-425ee2167cf9@intel.com>
Date: Tue, 4 Jan 2022 10:52:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>
CC: <chunkuang.hu@kernel.org>, <airlied@linux.ie>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <kernel@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20211210113617.196204-1-angelogioacchino.delregno@collabora.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20211210113617.196204-1-angelogioacchino.delregno@collabora.com>
X-ClientProxiedBy: AM6P191CA0024.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::37) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82b92a88-d1c6-4742-329b-08d9cf67ff1f
X-MS-TrafficTypeDiagnostic: DM6PR11MB3244:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB3244248E2737AE57B8936B06EB4A9@DM6PR11MB3244.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uBxD4WCKozax5au/gLF9BwY/ent9KqR/8A3zPAEgj8bim/W6yAbxuk0qpbba0QGUBm30NbunDSHmPidX/D9k0OiFji13x0orAVYrKv46BndArlP/9qGy82ceUdPkaodopxZ+WfOYOq9Aq1DAr71ngnO1lnJHqe+1Hrm/Bc637zk4VnwPMqQ2ygvuCm0OLv6BD6NWZ/NdP5CanDdvz3MSPRMZLztjB6LBhO9k+irAuSJSzH0SFZ6tw0HbPhq2JIMwgwEJOgzch6n+pXIR4PTIPoWNeDiSLmkpdOlm8AYkO1IzPLcoe5XTaiHvZeU6YYQ2T3CnhRfvVKutySfnKkiIBUVuypQLIhHAgX1sh43txMn7rnvVYvBYWrwsh+obm3osAhYV0+VsqC8SLOcuSKwzwq38jN+aKWptgDLoSVmXgajdygJxEofh+SWHk39KzZVhJW9PsF5Nhu3//o5Uhg8j/r545WAXLKU3lvjPGvVQH4bX7SGiVpRkI6l4JNUo4TYikh1uDj4DYrjdHrMJTuX3Kx3LHVoAcBtnknpDXdB/FywHwjgK+DDFHCz6c6+x3qxA2VeKRsynJWzLFBcV5sQXi8PcDkR+WhishbrL4dtN7/rkSGNXKyyJlYcQ36KX7ti/mBnN8nrf2A6kLJzJDatXNMJji/55Dhvmpur2QBOURdeaY3nGxc666VpFRgQwKXThYnv6KidDXQacEAQqkc6Gr3D0il6x7F75wbjVwJzmNTs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(5660300002)(82960400001)(26005)(83380400001)(6666004)(66556008)(6512007)(38100700002)(6486002)(36916002)(44832011)(186003)(316002)(6506007)(8676002)(66476007)(53546011)(2906002)(8936002)(86362001)(66946007)(36756003)(2616005)(4326008)(508600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWNuV3lDTWkwRG83VVQ1dkx1d1A2eHBoL3pLUWw0L3kxSzY5S25PekZ6Skl1?=
 =?utf-8?B?bDJqd1RHS0VDZFoyaGxtNExnUWNMRkZoejVKdlhQSitJcmttZUhLN1VWRW9M?=
 =?utf-8?B?d1VqRUxYaWhkbUtIdzV5bCtvb3dDcGVVbjZSWGpzUzk3RmxjaStOQk1rZ3lU?=
 =?utf-8?B?R0hGUTZzY1VnMWY1K1QyMngyMFV5YnhyWkxpKzJ1b2hlWTBQYTNkZzZDVzND?=
 =?utf-8?B?Y09jZXd6VWlaUDJBVlhtWVBzOWloNTFEc2RsY3p0eHo5MTVpcDUzRGJjTGNu?=
 =?utf-8?B?bFplMVlLcTdmUUxDc3lTVlRia3NsRnZ5VGxXOVFZNkgza3dDbWpNOWtseFBj?=
 =?utf-8?B?TXpyN3BSK2x3K2wybUk5RHJxTDQvVG5SVTNkclI1V3YwY2Z1VTlDb05VSnk1?=
 =?utf-8?B?cmZPd29NWGg5VUtqZVVUaXBxM2R2VlNUamxQbHFRZTNSYkVNNzRuQm93R2Z1?=
 =?utf-8?B?dVFhM3VwVUFMdHJsVS9vWG52eGFYVFpTeFRmL1p2VjljZFA2U0JUNVo5Sjll?=
 =?utf-8?B?VElISDkxVGFSdVBQeDZ1MWNGU3p5Qm8yS3phZVp4UnZqNEhNdG1qTmpUaHlI?=
 =?utf-8?B?STdEdGt1ZWRmQUtubzRJYTBxU2hTYTdPZklYNUltcUN5aUgydlRrNHRxU3RX?=
 =?utf-8?B?OURSdERacVAzK2N1czRYSW1FWFA5US9pck1mZG9JMkdkL3FMbG4wbGpLQmdE?=
 =?utf-8?B?SFYrSE5pK2VCdUpWcUR6MU1YZUY5bldtS0lLK3NORFUzMGlaTUhMS1dRbm5N?=
 =?utf-8?B?WHVTR01WbmdPZXBBdHd6a0NBL0c4a1pvMnBNbjN3YkY5cFZKOVJDbjdLK05Z?=
 =?utf-8?B?UXVPc1BmT2ZVMDJ6cENhOGNwZEpGRFcrdm5kcDF3bUtNQkF5OEhrVGRBRS9B?=
 =?utf-8?B?YjMvZFJ2SStNcml6UEhKRVVKN1dXa3QwTW1aRFREUEhoMUpoM01BZ1NQWVU4?=
 =?utf-8?B?cTQxQ1ZQOEpRTUc0ZFRrKy8valQ5RGsyMFcyQ0RNY3JETEtrNFI5NmRic3Zi?=
 =?utf-8?B?ays3YWR5QzJmMGpnbnRSWSt3aE9hc0Y0R0tvaC9YeUFMaTB3NXphMkJUdG9l?=
 =?utf-8?B?ejFHRDBiMnZ2N3JNZGxvYVdzeXRwSlg0YWRhcG1WNU9NR0EzZUE3aWhXV203?=
 =?utf-8?B?V3pPSnM4cWdLN1RwU3BIaVdWNDdXdjBvU0VqbElmY1JjU1VYVE5zNnA3VThM?=
 =?utf-8?B?ODBJMWZYaURtN29xRlhIT2tDejNzdmhIaHNKRVlFMkpDTWRBUEhsclBtcDFW?=
 =?utf-8?B?TFE2ZlhFLy9DSXRWcEZJTlMzb00yRWJ2RmYzbjRmZUR2c283ZW5mbGJaZ1V0?=
 =?utf-8?B?SzZoMFVndTdXTkNMOXhzRnJWNWNsTi9EQ0o5Nlh6VmNnSy9qTVR2S0tIb3pN?=
 =?utf-8?B?V095ZkpPckJ2ckZLamdWblNhVWtOSFRhYkg4cnNhcXhoSEZ5bTJOYWM3RXpn?=
 =?utf-8?B?c3ljY1VObEtSRkFiN3ZzQlU4S01FSlpmbDhBd081V3hORXhPNnhFamVyVEts?=
 =?utf-8?B?bExieFBHN0xxcGFsMnZTaWFBemptTythVUw0dEcwazVjVWpFam01cENFR1Zk?=
 =?utf-8?B?OG45d1RWbFo4SnhaNEhNN0tldTVsKzZOYVYxVjMvMlZibWgyanJHbG5FdTY4?=
 =?utf-8?B?SzNSUnZHcjR4eXBuS1BXazNHSTZid2J3cmoyR1E4QnRYWEJPaGt0clh1NVlM?=
 =?utf-8?B?b0NoVll0VmlFdW9JbFZDTFpDczh6cENzZ2Y3RkdmTTR5RTVodFJWY0ZTdWFQ?=
 =?utf-8?B?eUdTZFQzckNxNW54UlQ4a0FOT0I5VXRJQkNYa3huaXJyeERFUVdIK3RBbkxC?=
 =?utf-8?B?NmlNYnVKMTVtT1NGYXpMbk4wcFYwSkNJZ1ZSSE4vdkloSzFCejJYZ3JSOUVy?=
 =?utf-8?B?V1lDWkx1WllGZ1pKWUk3RFk0NlVzTm9RUmZCQTVRUVRQdWxnbVBkQmlqa1Vw?=
 =?utf-8?B?TzBqRUFHWTZoTG5DVDVhY3VHdDNaRzZSMnY1WmUyVjd4dFZmT2RSRFEyc3hC?=
 =?utf-8?B?ekMwQ0FSeXNrL2d0VkZwL3FBdGlYUlBXOHFwOTRSWm5Ydkx6ZDlrUlVMOGVG?=
 =?utf-8?B?UU1Na2lYcUVEQUd3OGJHSzIzbFE0UzVnS0FWNmVQeTNocC9oL2libEJlakcy?=
 =?utf-8?B?RGZYNHR4a1Y4cFlsSGVicEpsYU1TS2J4MjFVbXN1ZStVMmQrMlpJNG5EQm5n?=
 =?utf-8?Q?dmyQDopBClCrJucyk0M7AcU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b92a88-d1c6-4742-329b-08d9cf67ff1f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 09:53:02.1107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCfPy73AHfsutXEwzd6ITXkjyNTwADfFDfn29D6qCig/ppNTo56QvQ9Cee3QFXJdJT2MG+048baMWq2MQgIW7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3244
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_015311_072156_61141554 
X-CRM114-Status: GOOD (  31.45  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAxMC4xMi4yMDIxIDEyOjM2LCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90
ZToKPiBEUk0gYnJpZGdlIGRyaXZlcnMgYXJlIG5vdyBhdHRhY2hpbmcgdGhlaXIgRFNJIGRldmlj
ZSBhdCBwcm9iZSB0aW1lLAo+IHdoaWNoIHJlcXVpcmVzIHVzIHRvIHJlZ2lzdGVyIG91ciBEU0kg
aG9zdCBpbiBvcmRlciB0byBsZXQgdGhlIGJyaWRnZQo+IHRvIHByb2JlOiB0aGlzIHJlY2VudGx5
IHN0YXJ0ZWQgcHJvZHVjaW5nIGFuIGVuZGxlc3MgLUVQUk9CRV9ERUZFUgo+IGxvb3Agb24gc29t
ZSBtYWNoaW5lcyB0aGF0IGFyZSB1c2luZyBleHRlcm5hbCBicmlkZ2VzLCBsaWtlIHRoZQo+IHBh
cmFkZS1wczg2NDAsIGZvdW5kIG9uIHRoZSBBQ0VSIENocm9tZWJvb2sgUjEzLgo+Cj4gTm93IHRo
YXQgdGhlIERTSSBob3N0cy9kZXZpY2VzIHByb2JlIHNlcXVlbmNlIGlzIGRvY3VtZW50ZWQsIHdl
IGNhbgo+IGRvIGFkanVzdG1lbnRzIHRvIHRoZSBtdGtfZHNpIGRyaXZlciBhcyB0byBib3RoIGZp
eCBub3cgYW5kIG1ha2Ugc3VyZQo+IHRvIGF2b2lkIHRoaXMgc2l0dWF0aW9uIGluIHRoZSBmdXR1
cmU6IGZvciB0aGlzLCBmb2xsb3dpbmcgd2hhdCBpcwo+IGRvY3VtZW50ZWQgaW4gZHJtX2JyaWRn
ZS5jLCBtb3ZlIHRoZSBtdGtfZHNpIGNvbXBvbmVudF9hZGQoKSB0byB0aGUKPiBtdGtfZHNpX29w
cy5hdHRhY2ggY2FsbGJhY2sgYW5kIGRlbGV0ZSBpdCBpbiB0aGUgZGV0YWNoIGNhbGxiYWNrOwo+
IGtlZXBpbmcgaW4gbWluZCB0aGF0IHdlIGFyZSByZWdpc3RlcmluZyBhIGRybV9icmlkZ2UgZm9y
IG91ciBEU0ksCj4gd2hpY2ggaXMgb25seSB1c2VkL2F0dGFjaGVkIGlmIHRoZSBEU0kgSG9zdCBp
cyBib3VuZCwgaXQgd291bGRuJ3QKPiBtYWtlIHNlbnNlIHRvIGtlZXAgYWRkaW5nIG91ciBicmlk
Z2UgYXQgcHJvYmUgdGltZSAoYXMgaXQgd291bGQKPiBiZSB1c2VsZXNzIHRvIGhhdmUgaXQgaWYg
bXRrX2RzaV9vcHMuYXR0YWNoKCkgZmFpbHMhKSwgc28gYWxzbyBtb3ZlCj4gdGhhdCBvbmUgdG8g
dGhlIGRzaSBob3N0IGF0dGFjaCBmdW5jdGlvbiAoYW5kIHJlbW92ZSBpdCBpbiBkZXRhY2gpLgo+
Cj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2Fj
Y2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMgfCAxNjcgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspLCA4MyBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IGluZGV4IDVkOTBkMmViMDAxOS4uMmZmMzQ3ZGEz
NWMyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTc4NiwxOCArNzg2
LDEwMSBAQCB2b2lkIG10a19kc2lfZGRwX3N0b3Aoc3RydWN0IGRldmljZSAqZGV2KQo+ICAgCW10
a19kc2lfcG93ZXJvZmYoZHNpKTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgaW50IG10a19kc2lfZW5j
b2Rlcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVjdCBtdGtfZHNpICpkc2kpCj4g
K3sKPiArCWludCByZXQ7Cj4gKwo+ICsJcmV0ID0gZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQoZHJt
LCAmZHNpLT5lbmNvZGVyLAo+ICsJCQkJICAgICAgRFJNX01PREVfRU5DT0RFUl9EU0kpOwo+ICsJ
aWYgKHJldCkgewo+ICsJCURSTV9FUlJPUigiRmFpbGVkIHRvIGVuY29kZXIgaW5pdCB0byBkcm1c
biIpOwo+ICsJCXJldHVybiByZXQ7Cj4gKwl9Cj4gKwo+ICsJZHNpLT5lbmNvZGVyLnBvc3NpYmxl
X2NydGNzID0gbXRrX2RybV9maW5kX3Bvc3NpYmxlX2NydGNfYnlfY29tcChkcm0sIGRzaS0+aG9z
dC5kZXYpOwo+ICsKPiArCXJldCA9IGRybV9icmlkZ2VfYXR0YWNoKCZkc2ktPmVuY29kZXIsICZk
c2ktPmJyaWRnZSwgTlVMTCwKPiArCQkJCURSTV9CUklER0VfQVRUQUNIX05PX0NPTk5FQ1RPUik7
Cj4gKwlpZiAocmV0KQo+ICsJCWdvdG8gZXJyX2NsZWFudXBfZW5jb2RlcjsKPiArCj4gKwlkc2kt
PmNvbm5lY3RvciA9IGRybV9icmlkZ2VfY29ubmVjdG9yX2luaXQoZHJtLCAmZHNpLT5lbmNvZGVy
KTsKPiArCWlmIChJU19FUlIoZHNpLT5jb25uZWN0b3IpKSB7Cj4gKwkJRFJNX0VSUk9SKCJVbmFi
bGUgdG8gY3JlYXRlIGJyaWRnZSBjb25uZWN0b3JcbiIpOwo+ICsJCXJldCA9IFBUUl9FUlIoZHNp
LT5jb25uZWN0b3IpOwo+ICsJCWdvdG8gZXJyX2NsZWFudXBfZW5jb2RlcjsKPiArCX0KPiArCWRy
bV9jb25uZWN0b3JfYXR0YWNoX2VuY29kZXIoZHNpLT5jb25uZWN0b3IsICZkc2ktPmVuY29kZXIp
Owo+ICsKPiArCXJldHVybiAwOwo+ICsKPiArZXJyX2NsZWFudXBfZW5jb2RlcjoKPiArCWRybV9l
bmNvZGVyX2NsZWFudXAoJmRzaS0+ZW5jb2Rlcik7Cj4gKwlyZXR1cm4gcmV0Owo+ICt9Cj4gKwo+
ICtzdGF0aWMgaW50IG10a19kc2lfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZp
Y2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPiArewo+ICsJaW50IHJldDsKPiArCXN0cnVjdCBkcm1f
ZGV2aWNlICpkcm0gPSBkYXRhOwo+ICsJc3RydWN0IG10a19kc2kgKmRzaSA9IGRldl9nZXRfZHJ2
ZGF0YShkZXYpOwo+ICsKPiArCXJldCA9IG10a19kc2lfZW5jb2Rlcl9pbml0KGRybSwgZHNpKTsK
PiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwlyZXR1cm4gZGV2aWNlX3Jlc2V0
X29wdGlvbmFsKGRldik7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIG10a19kc2lfdW5iaW5kKHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAo+ICsJCQkgICB2b2lkICpk
YXRhKQo+ICt7Cj4gKwlzdHJ1Y3QgbXRrX2RzaSAqZHNpID0gZGV2X2dldF9kcnZkYXRhKGRldik7
Cj4gKwo+ICsJZHJtX2VuY29kZXJfY2xlYW51cCgmZHNpLT5lbmNvZGVyKTsKPiArfQo+ICsKPiAr
c3RhdGljIGNvbnN0IHN0cnVjdCBjb21wb25lbnRfb3BzIG10a19kc2lfY29tcG9uZW50X29wcyA9
IHsKPiArCS5iaW5kID0gbXRrX2RzaV9iaW5kLAo+ICsJLnVuYmluZCA9IG10a19kc2lfdW5iaW5k
LAo+ICt9Owo+ICsKPiAgIHN0YXRpYyBpbnQgbXRrX2RzaV9ob3N0X2F0dGFjaChzdHJ1Y3QgbWlw
aV9kc2lfaG9zdCAqaG9zdCwKPiAgIAkJCSAgICAgICBzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpk
ZXZpY2UpCj4gICB7Cj4gICAJc3RydWN0IG10a19kc2kgKmRzaSA9IGhvc3RfdG9fZHNpKGhvc3Qp
Owo+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gaG9zdC0+ZGV2Owo+ICsJaW50IHJldDsKPiAgIAo+
ICAgCWRzaS0+bGFuZXMgPSBkZXZpY2UtPmxhbmVzOwo+ICAgCWRzaS0+Zm9ybWF0ID0gZGV2aWNl
LT5mb3JtYXQ7Cj4gICAJZHNpLT5tb2RlX2ZsYWdzID0gZGV2aWNlLT5tb2RlX2ZsYWdzOwo+ICsJ
ZHNpLT5uZXh0X2JyaWRnZSA9IGRldm1fZHJtX29mX2dldF9icmlkZ2UoZGV2LCBkZXYtPm9mX25v
ZGUsIDAsIDApOwo+ICsJaWYgKElTX0VSUihkc2ktPm5leHRfYnJpZGdlKSkKPiArCQlyZXR1cm4g
UFRSX0VSUihkc2ktPm5leHRfYnJpZGdlKTsKCgpIZXJlIHdlIGhhdmUgaW1wbGljaXQgYXNzdW1w
dGlvbiB0aGF0IHBvcnQgbm9kZSAoMCwwKSBwb2ludHMgYWx3YXlzIHRvIAp0aGUgJ2RldmljZScu
IEkgZ3Vlc3MgaXQgaXMgdHJ1ZSBmb3Igbm93LCBidXQgY291bGQgYml0ZSBzb21lZGF5LiBBbnl3
YXkgCmltcHJvdmluZyBpdMKgIHdvdWxkIHJlcXVpcmUgYWRkaW5nIHNvbWUgYWRkaXRpb25hbCBo
ZWxwZXIgZm9yIGdldHRpbmcgCmJyaWRnZSBiYXNlZCBvbiBtaXBpX2RzaV9kZXZpY2UgYW5kIHNo
b3VsZCBiZSBkb25lIGluIHNlcGFyYXRlIHBhdGNoc2V0LgoKCj4gKwo+ICsJZHJtX2JyaWRnZV9h
ZGQoJmRzaS0+YnJpZGdlKTsKPiArCj4gKwlyZXQgPSBjb21wb25lbnRfYWRkKGhvc3QtPmRldiwg
Jm10a19kc2lfY29tcG9uZW50X29wcyk7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJRFJNX0VSUk9SKCJm
YWlsZWQgdG8gYWRkIGRzaV9ob3N0IGNvbXBvbmVudDogJWRcbiIsIHJldCk7Cj4gKwkJZHJtX2Jy
aWRnZV9yZW1vdmUoJmRzaS0+YnJpZGdlKTsKPiArCQlyZXR1cm4gcmV0Owo+ICsJfQo+ICAgCj4g
ICAJcmV0dXJuIDA7Cj4gICB9Cj4gICAKPiArc3RhdGljIGludCBtdGtfZHNpX2hvc3RfZGV0YWNo
KHN0cnVjdCBtaXBpX2RzaV9ob3N0ICpob3N0LAo+ICsJCQkgICAgICAgc3RydWN0IG1pcGlfZHNp
X2RldmljZSAqZGV2aWNlKQo+ICt7Cj4gKwlzdHJ1Y3QgbXRrX2RzaSAqZHNpID0gaG9zdF90b19k
c2koaG9zdCk7Cj4gKwo+ICsJZHJtX2JyaWRnZV9yZW1vdmUoJmRzaS0+YnJpZGdlKTsKPiArCWNv
bXBvbmVudF9kZWwoaG9zdC0+ZGV2LCAmbXRrX2RzaV9jb21wb25lbnRfb3BzKTsKCgpPcmRlciBz
aG91bGQgYmUgcmV2ZXJzZWQuCgpXaXRoIHRoaXMgZml4ZWQ6CgpSZXZpZXdlZC1ieTogQW5kcnpl
aiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+CgoKUmVnYXJkcwoKQW5kcnplagoKCj4g
KwlyZXR1cm4gMDsKPiArfQo+ICsKPiAgIHN0YXRpYyB2b2lkIG10a19kc2lfd2FpdF9mb3JfaWRs
ZShzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAgewo+ICAgCWludCByZXQ7Cj4gQEAgLTkzOCw3MyAr
MTAyMSwxNCBAQCBzdGF0aWMgc3NpemVfdCBtdGtfZHNpX2hvc3RfdHJhbnNmZXIoc3RydWN0IG1p
cGlfZHNpX2hvc3QgKmhvc3QsCj4gICAKPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWlwaV9kc2lf
aG9zdF9vcHMgbXRrX2RzaV9vcHMgPSB7Cj4gICAJLmF0dGFjaCA9IG10a19kc2lfaG9zdF9hdHRh
Y2gsCj4gKwkuZGV0YWNoID0gbXRrX2RzaV9ob3N0X2RldGFjaCwKPiAgIAkudHJhbnNmZXIgPSBt
dGtfZHNpX2hvc3RfdHJhbnNmZXIsCj4gICB9Owo+ICAgCj4gLXN0YXRpYyBpbnQgbXRrX2RzaV9l
bmNvZGVyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgc3RydWN0IG10a19kc2kgKmRzaSkK
PiAtewo+IC0JaW50IHJldDsKPiAtCj4gLQlyZXQgPSBkcm1fc2ltcGxlX2VuY29kZXJfaW5pdChk
cm0sICZkc2ktPmVuY29kZXIsCj4gLQkJCQkgICAgICBEUk1fTU9ERV9FTkNPREVSX0RTSSk7Cj4g
LQlpZiAocmV0KSB7Cj4gLQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gZW5jb2RlciBpbml0IHRvIGRy
bVxuIik7Cj4gLQkJcmV0dXJuIHJldDsKPiAtCX0KPiAtCj4gLQlkc2ktPmVuY29kZXIucG9zc2li
bGVfY3J0Y3MgPSBtdGtfZHJtX2ZpbmRfcG9zc2libGVfY3J0Y19ieV9jb21wKGRybSwgZHNpLT5o
b3N0LmRldik7Cj4gLQo+IC0JcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2goJmRzaS0+ZW5jb2Rlciwg
JmRzaS0+YnJpZGdlLCBOVUxMLAo+IC0JCQkJRFJNX0JSSURHRV9BVFRBQ0hfTk9fQ09OTkVDVE9S
KTsKPiAtCWlmIChyZXQpCj4gLQkJZ290byBlcnJfY2xlYW51cF9lbmNvZGVyOwo+IC0KPiAtCWRz
aS0+Y29ubmVjdG9yID0gZHJtX2JyaWRnZV9jb25uZWN0b3JfaW5pdChkcm0sICZkc2ktPmVuY29k
ZXIpOwo+IC0JaWYgKElTX0VSUihkc2ktPmNvbm5lY3RvcikpIHsKPiAtCQlEUk1fRVJST1IoIlVu
YWJsZSB0byBjcmVhdGUgYnJpZGdlIGNvbm5lY3RvclxuIik7Cj4gLQkJcmV0ID0gUFRSX0VSUihk
c2ktPmNvbm5lY3Rvcik7Cj4gLQkJZ290byBlcnJfY2xlYW51cF9lbmNvZGVyOwo+IC0JfQo+IC0J
ZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2Rlcihkc2ktPmNvbm5lY3RvciwgJmRzaS0+ZW5jb2Rl
cik7Cj4gLQo+IC0JcmV0dXJuIDA7Cj4gLQo+IC1lcnJfY2xlYW51cF9lbmNvZGVyOgo+IC0JZHJt
X2VuY29kZXJfY2xlYW51cCgmZHNpLT5lbmNvZGVyKTsKPiAtCXJldHVybiByZXQ7Cj4gLX0KPiAt
Cj4gLXN0YXRpYyBpbnQgbXRrX2RzaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRl
dmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQo+IC17Cj4gLQlpbnQgcmV0Owo+IC0Jc3RydWN0IGRy
bV9kZXZpY2UgKmRybSA9IGRhdGE7Cj4gLQlzdHJ1Y3QgbXRrX2RzaSAqZHNpID0gZGV2X2dldF9k
cnZkYXRhKGRldik7Cj4gLQo+IC0JcmV0ID0gbXRrX2RzaV9lbmNvZGVyX2luaXQoZHJtLCBkc2kp
Owo+IC0JaWYgKHJldCkKPiAtCQlyZXR1cm4gcmV0Owo+IC0KPiAtCXJldHVybiBkZXZpY2VfcmVz
ZXRfb3B0aW9uYWwoZGV2KTsKPiAtfQo+IC0KPiAtc3RhdGljIHZvaWQgbXRrX2RzaV91bmJpbmQo
c3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCj4gLQkJCSAgIHZvaWQg
KmRhdGEpCj4gLXsKPiAtCXN0cnVjdCBtdGtfZHNpICpkc2kgPSBkZXZfZ2V0X2RydmRhdGEoZGV2
KTsKPiAtCj4gLQlkcm1fZW5jb2Rlcl9jbGVhbnVwKCZkc2ktPmVuY29kZXIpOwo+IC19Cj4gLQo+
IC1zdGF0aWMgY29uc3Qgc3RydWN0IGNvbXBvbmVudF9vcHMgbXRrX2RzaV9jb21wb25lbnRfb3Bz
ID0gewo+IC0JLmJpbmQgPSBtdGtfZHNpX2JpbmQsCj4gLQkudW5iaW5kID0gbXRrX2RzaV91bmJp
bmQsCj4gLX07Cj4gLQo+ICAgc3RhdGljIGludCBtdGtfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4gICB7Cj4gICAJc3RydWN0IG10a19kc2kgKmRzaTsKPiAgIAlzdHJ1
Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+IC0Jc3RydWN0IGRybV9wYW5lbCAqcGFuZWw7
Cj4gICAJc3RydWN0IHJlc291cmNlICpyZWdzOwo+ICAgCWludCBpcnFfbnVtOwo+ICAgCWludCBy
ZXQ7Cj4gQEAgLTEwMjEsMTkgKzEwNDUsNiBAQCBzdGF0aWMgaW50IG10a19kc2lfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgIAkJcmV0dXJuIHJldDsKPiAgIAl9Cj4gICAK
PiAtCXJldCA9IGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZShkZXYtPm9mX25vZGUsIDAsIDAs
Cj4gLQkJCQkJICAmcGFuZWwsICZkc2ktPm5leHRfYnJpZGdlKTsKPiAtCWlmIChyZXQpCj4gLQkJ
Z290byBlcnJfdW5yZWdpc3Rlcl9ob3N0Owo+IC0KPiAtCWlmIChwYW5lbCkgewo+IC0JCWRzaS0+
bmV4dF9icmlkZ2UgPSBkZXZtX2RybV9wYW5lbF9icmlkZ2VfYWRkKGRldiwgcGFuZWwpOwo+IC0J
CWlmIChJU19FUlIoZHNpLT5uZXh0X2JyaWRnZSkpIHsKPiAtCQkJcmV0ID0gUFRSX0VSUihkc2kt
Pm5leHRfYnJpZGdlKTsKPiAtCQkJZ290byBlcnJfdW5yZWdpc3Rlcl9ob3N0Owo+IC0JCX0KPiAt
CX0KPiAtCj4gICAJZHNpLT5kcml2ZXJfZGF0YSA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShk
ZXYpOwo+ICAgCj4gICAJZHNpLT5lbmdpbmVfY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgImVuZ2lu
ZSIpOwo+IEBAIC0xMDk4LDE0ICsxMTA5LDYgQEAgc3RhdGljIGludCBtdGtfZHNpX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAJZHNpLT5icmlkZ2Uub2Zfbm9kZSA9IGRl
di0+b2Zfbm9kZTsKPiAgIAlkc2ktPmJyaWRnZS50eXBlID0gRFJNX01PREVfQ09OTkVDVE9SX0RT
STsKPiAgIAo+IC0JZHJtX2JyaWRnZV9hZGQoJmRzaS0+YnJpZGdlKTsKPiAtCj4gLQlyZXQgPSBj
b21wb25lbnRfYWRkKCZwZGV2LT5kZXYsICZtdGtfZHNpX2NvbXBvbmVudF9vcHMpOwo+IC0JaWYg
KHJldCkgewo+IC0JCWRldl9lcnIoJnBkZXYtPmRldiwgImZhaWxlZCB0byBhZGQgY29tcG9uZW50
OiAlZFxuIiwgcmV0KTsKPiAtCQlnb3RvIGVycl91bnJlZ2lzdGVyX2hvc3Q7Cj4gLQl9Cj4gLQo+
ICAgCXJldHVybiAwOwo+ICAgCj4gICBlcnJfdW5yZWdpc3Rlcl9ob3N0Ogo+IEBAIC0xMTE4LDgg
KzExMjEsNiBAQCBzdGF0aWMgaW50IG10a19kc2lfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gICAJc3RydWN0IG10a19kc2kgKmRzaSA9IHBsYXRmb3JtX2dldF9kcnZkYXRh
KHBkZXYpOwo+ICAgCj4gICAJbXRrX291dHB1dF9kc2lfZGlzYWJsZShkc2kpOwo+IC0JZHJtX2Jy
aWRnZV9yZW1vdmUoJmRzaS0+YnJpZGdlKTsKPiAtCWNvbXBvbmVudF9kZWwoJnBkZXYtPmRldiwg
Jm10a19kc2lfY29tcG9uZW50X29wcyk7Cj4gICAJbWlwaV9kc2lfaG9zdF91bnJlZ2lzdGVyKCZk
c2ktPmhvc3QpOwo+ICAgCj4gICAJcmV0dXJuIDA7CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
