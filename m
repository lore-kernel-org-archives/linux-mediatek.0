Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB7BC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 17:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPoVcwtRbGSiLeVXAGH9tTE5yFfHt4VtDzD+IwSxJVU=; b=nsxj/T2okcLD9hv4vTOIWBGppv
	g9g/3vc+A1ILgASwguN3w2zqynshNGRHRkB3ofH6x+pCkywGOmZSdUQXFHFnSW3qGfHKnQbAC/oo6
	imQgLzEThU8Ng9U+V14ebqbKw+dz+3+nQFiKERvSOm5v9uKnGIoOgVUFcJMAseWBjBWi3K93PhrDL
	nu1C4RYWrk/G/ifsIZ9OVaAJEyFPgFWwMd1xRJnpvrokr0gnmSby7/ScsVb/2Eryo8qLDAdTpNhhd
	6IACJLteZFocfYblH05+pyLF13FhBW9xo1bLFDGmNCkdsMvj8Xejt/QTKeeKn3VtxVYBXRFEJoeem
	EfE5tMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDqxB-00EJek-4m; Fri, 06 Jan 2023 17:56:29 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDqwz-00EJbR-HA; Fri, 06 Jan 2023 17:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673027777; x=1704563777;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7d7yQGe1Ahz4ag93wVj+FsNMkDt7GGN7PT9IH3Cdz4w=;
  b=dcxoWfpo0L3pmFvF5bSvf5WUdNmEWe+XOjqFYLsROWABWsEWPSU8kQ8F
   iXiSDUulf1IFWEEbazubvdcYTIHxZy/0XT12hW2lrDR452LXQuPV8+46C
   z3ooE9CEh4fT7hAxUDNKDyHt+l1Kq8qZe96JfyZ38XOuV4TnU4Rc1Ffix
   I/q8gr2D0Ipl3vKY1L/K2Wp7J7eaIAc/kQpotSnVBMA0wYAOpHdhvl+En
   6C6kDlEex3gw7CBR4Vdksrs5jjaCSrDVChDXLTYqPi880cwyUdBvQzbDL
   EMnS8FZfVjGtwrgjUrQG5Ee2fX2nVZWdZwPgOAfDVdOD0wZB+f1tC7Ph7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="408776044"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; 
   d="scan'208";a="408776044"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 09:56:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="605963991"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; 
   d="scan'208";a="605963991"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga003.jf.intel.com with ESMTP; 06 Jan 2023 09:56:15 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 6 Jan 2023 09:56:14 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 6 Jan 2023 09:56:14 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 6 Jan 2023 09:56:14 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 6 Jan 2023 09:56:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwlV2JEQzxr4T8Lm0TGoHuWJHK7sWWPjOBbZNxYJ2dt66oMtkN/4ez2w3w8X1i9NBz4btfuCKqVY/kA/HKlk+rqTIFI7mGkCrcFNRySbWlTS6DbuM2hZu6CzBnHjhIrBl715A5cnjz0fOXRlUWjKF6xCS557a4qgs0/uKLcf+4BoWGwO9WrPBHTJqMqnrCS82kTQA0RgjLVJa8oW8KHgZ1gXvayVyIeczgaTWJjre3EK4n9Ku59QUich7OiEcV6KOULt4jWmzzEIIAAkOgW2Vt7I0EbFuSZAhQA9R7XeLM4HlQVwQ1aEUBoBIjAdYWff51bfmvpoflGE/Nhme6j48Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPoVcwtRbGSiLeVXAGH9tTE5yFfHt4VtDzD+IwSxJVU=;
 b=a2FUnmrOpM6drGnWpoGyuSRiD7hmiPdGysT/SZn9bGf8uM6Qixh1hAx498OlqpXyqwL8JgIp2TFKXuwtQCn70F++m63mW8G37G0IpOLORV/lu6riEcoqD2vdPevWa5Fvs63A1MyE3IjTWLKJcGuz0VIg8o8i0fGh9/piaZkuqNd0rx0tNzzchBiNWNjTvvEylHu7oNmTdtYkimGQQmvBquAVANWPLTm9J1jZdpFKXv29jFPR2Mi4RI2LZhTBgIP3yr3ZKFSP2umAxc1hxA/sepwiwvSF+JhNT9rwoooqccIt/VzQxi4kZDHhfQhnoANpxnt+xKX74dwT4laBkA4NXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 by BL3PR11MB6364.namprd11.prod.outlook.com (2603:10b6:208:3b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 17:56:08 +0000
Received: from CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::6ce9:35:a5db:f6dc]) by CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::6ce9:35:a5db:f6dc%6]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 17:56:08 +0000
Message-ID: <33cd1459-336b-8cd2-55b5-50151375f471@intel.com>
Date: Fri, 6 Jan 2023 09:56:05 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 net-next 1/5] net: wwan: t7xx: Add AP CLDMA
To: <m.chetan.kumar@linux.intel.com>, <netdev@vger.kernel.org>
CC: <kuba@kernel.org>, <davem@davemloft.net>, <johannes@sipsolutions.net>,
	<ryazanov.s.a@gmail.com>, <loic.poulain@linaro.org>,
	<ilpo.jarvinen@linux.intel.com>, <ricardo.martinez@linux.intel.com>,
	<chiranjeevi.rapolu@linux.intel.com>, <haijun.liu@mediatek.com>,
	<edumazet@google.com>, <pabeni@redhat.com>, <linuxwwan@intel.com>,
	<linuxwwan_5g@intel.com>, <chandrashekar.devegowda@intel.com>,
	<matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Madhusmita Sahu
	<madhusmita.sahu@intel.com>, Moises Veleta <moises.veleta@linux.intel.com>
References: <cover.1673016069.git.m.chetan.kumar@linux.intel.com>
 <fd62d56541165222fe2153093bcd705bd8b54e65.1673016069.git.m.chetan.kumar@linux.intel.com>
Content-Language: en-US
From: Jesse Brandeburg <jesse.brandeburg@intel.com>
In-Reply-To: <fd62d56541165222fe2153093bcd705bd8b54e65.1673016069.git.m.chetan.kumar@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To CO1PR11MB4914.namprd11.prod.outlook.com
 (2603:10b6:303:90::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4914:EE_|BL3PR11MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: e8eb20ae-142a-4c3a-c164-08daf00f49df
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F2tPy+P2LGO49MxVAFRsqxTNhbOEhjcM7is8ba2+lcD38ujggRsnYzw5rcDy2vcnhn+usOcjE8OWaNyXeqJOKFBLL9cOKc0BjldIUewkkGQ+CYbZNv2IBRinWmZYBi16Gd9kwOPmFn7u1hnHlYGaXtLgCqq1etoNzZTT+OlaN0UMm+OlUaHBNKC2yuh5aigu5ojyx7sYBl+OtbyNUW2G3nPWzGhO2Px85pJhIAT0nXR94mJ2pBmKYHCh2vShp11ksnaLYuNFhUIUbzClU3SYHvENP991h1YJzKoajA0rBgB7/kvOz7B9V0qRDsDrgsry5+llKri8/HKdGFX5piQn2RFw2B6kBi8j7oV0H6DCDrTsH11YIkexiUP1Wcih0qhD1+V+ihSRNWtzmOHj03Icj5v+wYDks2fmjuQqWxmxANpOE5nnEfVL1Zv2ttPhCpMSpjM2uzsjUXWuI2N0cdP2lHuVjgKTUCPM+Vd10Pun8P9cbmc87tLXNtr71PKn7GFwROPi/7y4oLqNY3wl/4582O3sd5kh9BQlYTY3ICOGvDSnjaEeJ+9XOmEsUoEXMbyD4V8Gf/6xWC7O9D+FpttOxNm2qyK/oQNCY8xGnZy66XcLzkG9DAfiBVayyg5MepIrvjUV0u7X2LEmZ6/MloTDOxmIEgarBSXzNO2rVNYMpUGnBasVjzDOB/s/51Ej+WJiXwOhpnkY17JJQeYp2K/bq+ss2J7XU7JbojPCfMtLgPc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4914.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(39850400004)(136003)(396003)(366004)(451199015)(2616005)(186003)(44832011)(26005)(6512007)(31696002)(86362001)(36756003)(38100700002)(82960400001)(54906003)(478600001)(2906002)(316002)(66946007)(8676002)(4326008)(41300700001)(7416002)(5660300002)(8936002)(6486002)(66556008)(66476007)(6666004)(31686004)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzJVZmZUZ1VOc2ZRVDdldmI2eEM2VU5HbDFHMkJLNEozWGJpc0hZSHV1MW1G?=
 =?utf-8?B?VWtLQTdGS09TUkxQQ01Gb1VZS0FUMVU3TFNWWEhHMUVRRVVYcnYvdlpYaDla?=
 =?utf-8?B?R1MzR0VmK3Rxdk9rV2VCUXBhOEZ4WkVHL0IyQ3RlZ25lZENEVHIvOWFwK29R?=
 =?utf-8?B?RitkRk5wcHpScWZuSGRBRnZiZjd5TGV6RkRMU1lKUnkvSG9QWVBycUlENkhw?=
 =?utf-8?B?V2JnZEZISFA4YUo2TEluZE8xUWY3TEUzUlpVTVdGanJ1bHNtL3h3VGZKTFZK?=
 =?utf-8?B?YjB6NzdNckNzTSt0dkVuRll3NU9hY3dKZkFleU1rNnZibXpnYWlRK2RUQ1BK?=
 =?utf-8?B?b2tVbHdsWXlMSlVhbXZiY0ppSWR2YTVXVytSZHJRbEZKS1JHUmI2emkzQ05q?=
 =?utf-8?B?NzZsbEZZREhRQUN6M3hmUVVvdWdKQVZxcGdVeVlWS09SYTlPbUxFOVdzSzB6?=
 =?utf-8?B?Rk5oYzQwSWtQNEJBS2lLOHZyaGlXeW0xZXlkUzNRSDhWUGVZSzU0VU8wYjlZ?=
 =?utf-8?B?bGQvRzhYQm1xVUFoa0VkTGNFNW9GblhHbFlKZlRvVGU3ZnRXeUQvWUxKaW5y?=
 =?utf-8?B?MmhybXBTRzlPVHdZUHorR3M2VSswTWNha2Q3MUZ3OWhKd1NlYitXNUg5aHpU?=
 =?utf-8?B?cnJxYXBZNTY1azhGc0hLYTdlN3puVnJueTg3MFk0NklHVFZjL1lnbDUzQmtw?=
 =?utf-8?B?VDRsaVFnWTN5VytiVEtYTjdOc0dUdmZadWRRY2FLdy90YmRDU1NUTzR2OWsy?=
 =?utf-8?B?SEZ1Z0FIVnVPV2gwVzBrR2VhMUZVb0dIaDVrVUJsOHRBNm5KU0tzQXdCR1Yz?=
 =?utf-8?B?b3AwNzFDS253MyttRUt0MGtIRWl4c0xac2JUeXM2ZG5tMTV4M0dUV0pNamRO?=
 =?utf-8?B?ZzVpbWJyRXpmek5NMzVjT0xoZmZpMSs5V2xYYzF2SlhJS215QVlGNW51RDhn?=
 =?utf-8?B?c2l1SkdzcGN0WE91YTc4S1AzSkNmSUw0a3NRb3ZyT29ud2JVOFd0d0FwLyto?=
 =?utf-8?B?b0taenhuL011aCt4SlJ6M3hQMW5TaHI4NGh6by9KWmFRbE5FWnc1VTZGRTBJ?=
 =?utf-8?B?S3hjaEM2ajRsTTc2SVNibEF6QmxrcTJEcjd0UTQybzRBQmlucEg5UDdxUXE1?=
 =?utf-8?B?akxuSmxUT1drWnNzMTU0MmZQWEZJRjhzTXBERWZEM3hJRE8xNzRYVTZIWDFP?=
 =?utf-8?B?VHF5L0JJWHByNzJDVjk1MkxjR253bmNIdDdSbmtnMWZHYlZWekliRW8xL1Za?=
 =?utf-8?B?ZHd4SFNST01VOHpZMUx5cVdGUHorRnNXUUR1Y0tiYWhuTkF1WU95MXpZQnVk?=
 =?utf-8?B?L1NnL1RBR1M2Q2pBdjNYOWNiVXBUbEdEWllER1BjMDJjTlVVWGFwdCtJYjBs?=
 =?utf-8?B?L3h5ajhhdXhmd0dCZmJFdFMybEluY1lLRmNreGZvOUJjblMxelpFdFNNRXhG?=
 =?utf-8?B?b1M3cDlXY0UreEc3eXVnL3c3RmlHZDNzQkMrMHdHSUhwbHM4ekkrZmQyRUxz?=
 =?utf-8?B?a1o2djhRaldpbG1VM3pMYUpRaWNuMGpNNUpsTVd3bElVM1VsWFdKMFc0cWNj?=
 =?utf-8?B?c0tuUkFuME84U0QwREp2RE4vVUhMazRPcEtyRXRDbWh0cTB4NTFxc3ZvalVT?=
 =?utf-8?B?by9WNVkrL3JIUmxJUGRyT0M0MG5YY0RsZnVpQjJNUGJEc1NCTUs0VFRhNVFM?=
 =?utf-8?B?TUlhUHBPdlIwQVRJa3dYR3pPcmtzTzUzRjFia1hqdGk1ZlllMjJOYUtxa2xE?=
 =?utf-8?B?aHhFWFkraUFYZTZ2WUFkcXNHZmhWRXUyNlJWOUgvMi9SbjNpbUQycTUvUytX?=
 =?utf-8?B?N3VJeEE1Nit3SFJPekZVU3hYQm5yV3RNWW1iWWRxS202T05ub0RWZDBzcStS?=
 =?utf-8?B?ZGJRRlR0N2ZEVG1zNkh2QTBSSUwxa1hQZU5ZRHl1bzBheTdUUEt2SWc1SUIx?=
 =?utf-8?B?bDRvSm5MMDJab3AyWlJyVGRMcmNObUl2UWJ3TGEzMjl3MjZRUGNRditpVlph?=
 =?utf-8?B?WFc0WU95ckpPcnJtZklCTE1BbFJMUFlWdjZEc053amFJcDdBWW5rNVREQ2ty?=
 =?utf-8?B?Rit3TEZHbHBhc1dEdm51enI4aTIrblViZWNTQzRJN1k1ZDlIeW9RZyt0Z2ZD?=
 =?utf-8?B?SVJkdS9QbW1Gc1VGQlhFRldQYmlZZ1pWcnBIb3pUZ2x5U0Y5VzR0MjI1QXRW?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8eb20ae-142a-4c3a-c164-08daf00f49df
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 17:56:08.2642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vBA0n//FJMgA6npJFYpMYHi5WpI5OwrsEamVXgK1kJfHSpDgqrgZ+eQYYQ8ujLWGWjqprqFi6ux34S8wLsWHF1Fleag/FPwhjKL6NItjMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6364
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_095617_603000_9E1C37F8 
X-CRM114-Status: UNSURE (   9.17  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 1/6/2023 8:26 AM, m.chetan.kumar@linux.intel.com wrote:
> From: Haijun Liu <haijun.liu@mediatek.com>
> 
> The t7xx device contains two Cross Layer DMA (CLDMA) interfaces to
> communicate with AP and Modem processors respectively. So far only
> MD-CLDMA was being used, this patch enables AP-CLDMA.
> 
> Rename small Application Processor (sAP) to AP.
> 
> Signed-off-by: Haijun Liu <haijun.liu@mediatek.com>
> Co-developed-by: Madhusmita Sahu <madhusmita.sahu@intel.com>
> Signed-off-by: Madhusmita Sahu <madhusmita.sahu@intel.com>
> Signed-off-by: Moises Veleta <moises.veleta@linux.intel.com>
> Signed-off-by: Devegowda Chandrashekar <chandrashekar.devegowda@intel.com>
> Signed-off-by: M Chetan Kumar <m.chetan.kumar@linux.intel.com>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
> --
> v3:
>   * No Change.
> v2:
>   * Reuse handshake_wq for AP work.
>   * Remove AP trace port tx/rx channel id.
>   * Rename t7xx_md_port_conf to t7xx_port_conf.

Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>



