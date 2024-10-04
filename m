Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C12ECF884F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 22:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGh5UxPXp2DdIe8VsofUOz8SeFE5BKxcPoOfQoVL7WI=; b=4sF0mda6iV6tZcPgfTj3ZeIJSf
	C2KNCTjta+pVizc8GtYyBuq2anfM0mDCNKynO7Lxn54Qc0PrrHDz4c+E1Q4bEXJd6PTl8SVnMshyV
	xUXodh8EDp2nZlZNnGenjQHJOeta1xy2Gt84mKOIl7MLEo5NMjspUov4DtViRbFqAvp/eok4IXAEw
	PFtXEyGzZzdZmmZnZPvC8m47t3mgA428Y2wknMEQVaOsYIKxLlbhOAzdX4L5DiMAMbHBaZ6k8M19u
	eQtwbXtAPgmO/1QhDlttMCi7IWSlsvrO0C2WxDwd1VVaOZC0nRDDa95y43gmYbgkwfqy9ikybUXDa
	pDQObR9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swr8p-0000000EOOU-1oYD;
	Fri, 04 Oct 2024 22:51:19 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swr7Y-0000000EOKW-0onG;
	Fri, 04 Oct 2024 22:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728082200; x=1759618200;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=K0bZKfnFW9ufNznQNfEJJMfexnxN9hk5ifs9Iq37xBA=;
  b=RgCTX9ettWW1Dzs0JfXDElBt3xByN2aR4yv08RElKkWgcIG8NlrYdaDy
   3nfFaWAn7gaKsAeSZmqrEhrbid4p4sqhkDiiFHM1VWgN6CW4BfgLuiWWN
   hZ9e44OvNEL/RqtwhCUd6FHVV8XUdPxu0nuPdoTTvn+qaMHwJkpd2DOOI
   6AuWf6VD7CCiuZpSDcpWMrbTiYo4eOEDc5+s62jG4DXTdRAO2c7O2Oo6e
   +E9+eDmfZcNf03HPSU1uWwU1ZoZ2Vv7v2YQjF/2tvoni9WqrFwjvkmStr
   lUBPTU1ANNKrIjS8lG/YVQYF+J/+CTh6Kd0LV9zBxrA28XyEVukySVZpy
   A==;
X-CSE-ConnectionGUID: dNOyhbstTJSoaJ5678Ko6A==
X-CSE-MsgGUID: Q5+pz9g7QKmf33A2wOgieQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="52716238"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="52716238"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 15:49:56 -0700
X-CSE-ConnectionGUID: uIGFpY22SuSW6FvwsfDfwQ==
X-CSE-MsgGUID: s+m/TMcfRW2bliL0Q+qnzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="74675254"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Oct 2024 15:49:56 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 15:49:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 15:49:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 15:49:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UY/72m0xloLFZRqWv23VwAIexZ+FajGmbYBXs99VB+BibChz/H4+1i80SDxyGPc7K2Fbh1a3qVcZ8KXNRUpwgXHhi43ajFG+nYxx57fTdn+edAvADS346J73wMWCIiTvO9vDP62u/Jpw+sqMg/d+QzmMv1FXvWEtZUDTT1GAIdNV89pyKgt3ojn1Y+VaxAMBOyeMS57IZgxdDlC0vCe6X5P6czamUhCqWwPVwgK7FrrsY6kprOKpwYQld0o5YhR5dkWZN87Mudlmj9AbYYlOb3RsmBN8TVbRRVMJgVe6vzZAjzc1r7BwD5BciHXGZnJ0VQSaMTuppwUv4ZnCwvgluQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGh5UxPXp2DdIe8VsofUOz8SeFE5BKxcPoOfQoVL7WI=;
 b=YEnzOaku6RvmQUy+9Sh9lT+ph4m/z/PWNPqqNWlt1aQC52Bg+O01kvltPzWPDQu4MlayypwGsDw62xmuom4hg8Nz0+kGd0evOjlKZyyf6shgtIGXRNl9vb6071DTwmT1T5RoFGegS2BoHYOKJ7lLgCi+kT8fbMrHTKA4HQUzLdp7Z1TlfXWXSNM8ZJv9kOR0uGiQLcei9hn2FtTT6xaKUfkAP9vbj6sAi5dS/buYE/2iDF2AjHLq1PHLzCkoYXy2oKkZRoofKi/qBebOktK0WoL7ijp6A21ODduy7SbXHzdB2igcfPNkUhnZXpTWCp1uEs1nGxOpfTsM48iKexyQ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by MW5PR11MB5907.namprd11.prod.outlook.com (2603:10b6:303:1a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 22:49:52 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%4]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 22:49:52 +0000
Message-ID: <e4574a97-8e34-49be-9ec6-bb787104e6db@intel.com>
Date: Fri, 4 Oct 2024 15:49:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: airoha: Fix EGRESS_RATE_METER_EN_MASK
 definition
To: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, "Sean
 Wang" <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>
References: <20241004-airoha-fixes-v1-1-2b7a01efc727@kernel.org>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20241004-airoha-fixes-v1-1-2b7a01efc727@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0062.namprd05.prod.outlook.com
 (2603:10b6:a03:74::39) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|MW5PR11MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: 71fa1b58-578b-4ecb-847e-08dce4c6dbd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXBzN3pLNnZzY2w1ZWpMUkNkdThoZWdEc3BEQmU3QysxRjVsZzVDMWNJMDJY?=
 =?utf-8?B?NGRsWGZ6L2ttbzFOVEh6OWNFeVp4RTNCUStZVkx4TzcxY0ZTandET0txdHdt?=
 =?utf-8?B?TnhlaklEcEV4anVUYzlYNHduZFhwVkpacUorOGJldzMwak9CS3MxYjZOQ3Nz?=
 =?utf-8?B?SFpVWjlsKzhSUlV6ZzJJbWNhQmtzcjV4eWR6RkpNY1cxUVl4aGtJZzRLTGpQ?=
 =?utf-8?B?QUZBbUNtUmVmc25kMXE0YXIvMHZXUVRJYjNJV210Ky9PNTAwWnNXS2w2dmdD?=
 =?utf-8?B?aFFsSGprK0NscHJQbkE4Wk0vczJLZXNvb0xiOTFDc1VPNG1hUGxzWHVaL0xi?=
 =?utf-8?B?WFc1QmNTODVtUXJQL01TbVVCV3laQ3BUT3g0RkdoYVpFRytqOTE0cjFEZCtW?=
 =?utf-8?B?aHNyK3ZmOUpMazFYbHA0YzFrTXhCRDhlSGlQQUt4QnBicDVhelk1VEhzajd6?=
 =?utf-8?B?c0VmMi9mSlRxTGFTRnVYWDE4M0orcjJ0dkt0aUVoVHhwM1BsVXhONTJzM3RK?=
 =?utf-8?B?bTVQMTduMUFKaVcvczVKV2JvSnVLVmlDNjFORVJxWDZmK3RONDJtSnRNNEVx?=
 =?utf-8?B?cnBteDMwWndZVzhKclk4ZjZKL2ZjTWxVYzEyTFF5b1NZZktIdS9KNWhPTkZL?=
 =?utf-8?B?bE9mV0E0ODgrcTNFVTM3RUk5b1Jrck1WSmNmV2VtcG9XZG9QaUJmdm5pREVQ?=
 =?utf-8?B?WlpZMjd2d3VQZ2lqWnVkWCsxV2Q0SmZGN3Y3dVVzZG0zbENxbzRUU1NnOFcx?=
 =?utf-8?B?aWFLdEd2NGc3UVdTU1JkaWtqbG94ZXlnN1FuaUUzYVVkWlhIREZJYkhUb0ZQ?=
 =?utf-8?B?ak1XZWFWV0I3UXNMRzZnS1NCSnd3T09RYVMyVzgyam5ReHpOODZPQkVPeGNF?=
 =?utf-8?B?VGJBSStMTUVEdzN4cENSQzkzTGZSdGlSMFNQZWNqbEI0ZGNtMzU2VjdMd09Q?=
 =?utf-8?B?SVBncnArdkNYWnovZjl1REpPVzl2UHVCeGtDUlV1UHllMjArYW9YVmtNUGJp?=
 =?utf-8?B?MVlyVE00VCtuTk9WbkM1VUdTWnVyNld6czNJVmRuS3BXdkR3SFFRZk1LSGwz?=
 =?utf-8?B?bHZBMnM5UVdJSzExVTFXQVB6ZW1sOUxHWmt5ODBwNTllSjNza2kydmNrZHNx?=
 =?utf-8?B?eXNVMjZQeUV4clczUDNtY29jU2txYzB1SlRSK2ZiTFBIU1JrQjNla0JEK1FW?=
 =?utf-8?B?STB6cm5NUmZBa0llR2pKdUEyd1ZKOFFCaWl4THYxaFVNd1VTQjdJWkV0MjM0?=
 =?utf-8?B?T3AweWZacDBtYXB4c0NwNE90ZGdiMUZkMFAxbmZIdHQ3YVpSaWpHZ0R2dzdN?=
 =?utf-8?B?RHUva1N0SUhseVBqN0JxQ1BJeE9xMEhGRnd1dkZTU0ljdUcrN1dmaW1ja0VN?=
 =?utf-8?B?cnh4RFFyWjNKam9nSzZwVW5wTUN5UFg2QThGK0U1RDNId0FGUnk1L3greWFR?=
 =?utf-8?B?YjhWRkZIdVJFcCtwQ0svcE1OZ0lwL3E1S2ZFMXJOcW5vSUZiYjU1UFlBL1VS?=
 =?utf-8?B?clgyQUJ3ZGFUaFYreFZBYUwyN3Z3VTMwNmtMbGNmTmJwcXI5TGp3TUN4T2JE?=
 =?utf-8?B?aldtcVlKalNWTnA0UUZDSWhaOWdySm1VZHRmYjJCUHFyS3M3WkU2ek9ueVpq?=
 =?utf-8?B?cDZpRlJVaGErbi9ScC9pNCthNk1ub2dvSG9ZcW5aNklodklKMWpKRjJqNmNn?=
 =?utf-8?B?NTJ0RVZCejFQOUIzRXFRZDltVXRIYm9wTmZTeHlsZlhiTGFXSmJidDVmLzkw?=
 =?utf-8?Q?YmNIR0Prnz7eppKi9J3CwUUf6iP4rrIFQw97F2+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHYzSFQrdHlRcFV1WVB5YU9TcUIwUml0aDlKZGQ2UThtdTFxVm1wdS93bjFs?=
 =?utf-8?B?NmdtbU53NlFpMWk1Uk04OStvdmcwRmdsVkhvUXVUSE5MNHBYTDQ3OXFoUTBk?=
 =?utf-8?B?RnlzaEdudEJ1cEswTEJReG8rQzBKSngwZm5vTUUrQTZJMnZ3ay9kRzVzdzY4?=
 =?utf-8?B?OWlwaURYUlVXY1g0WTRLbkg4SGdrMWVieGx3UTF3RENXelFvdncxdnJqYk5m?=
 =?utf-8?B?UXlNNHc5RkU5TFlUNmExNVpCdHYzcEQwQXlxbng4ZngvSnUxQ2VSOFBNRTZh?=
 =?utf-8?B?Wkp4NmVaS2FBSVIrQzFIZHk4VHdFMHg1WFpFMFoyaWhuUVNiS1hsQlhFNFRG?=
 =?utf-8?B?elBOZE1WRjE4SFRMeXdPeWhIdEdabCs5VUNVM1Z5Z3VjZnhjUTVINVN1T1ls?=
 =?utf-8?B?RFA2UzloN05aSzNhUnVoL25sSURmd3F2MFZwekUxZ3NmQVlwQ1BtU3dUS1FP?=
 =?utf-8?B?SkRvN2ZPWWVJRTNSSUdXT0srUCs3ekpDamRweWI2UDdyN3lVTTdIWWQwcmNs?=
 =?utf-8?B?WWR3QTAxRGNZR05CTHZyYzlWQlA2bmg0SmFOWVFUYnNMSTdtYmUwbHJ5NVli?=
 =?utf-8?B?Q0lmbjFmN25OeXAxSjlTTUtsaUVucnlyR2xwK2lKK2NqZVUwZU4ybUY5aDlU?=
 =?utf-8?B?L0tjK0hkcncvb3lPb2FLQkNjVTVsTkx5OU9QOHVFbnorRE9TMFQ0RTFUS000?=
 =?utf-8?B?clgwczdnZEVzM0c1N2ozMWRUUEpRdUhKNkdQOG9Qb0pqa251UWgrN1FtSTRR?=
 =?utf-8?B?d2xSVkhsSzhxSDhDUUpWTzFKN0VEVkdsbk9NS3JzRmI3OU9JMHFvVVdNZEUy?=
 =?utf-8?B?L2lSUDVWQWtmWjhUTlFnZkJGdWJpbHR1ZUZmMUdlOS9kTnVLU0ZCeWZFY1BO?=
 =?utf-8?B?UkRkWncrQXcxQnJLaG9SdFo1SEloT2o4QWg5Y1huRU1jOFNCb2l0UVZ3WmJm?=
 =?utf-8?B?a3hsWUxpTXF1UW1IWmEvWXM5elVqRHlHWFQyOTlBbHZoZXF6UkNDZGtuYzBw?=
 =?utf-8?B?WG1UQm82TTVScUZZU0hqVzdCSWtJWS8zTXZWd0VPWDNtYmpzci9YVkF4KzRa?=
 =?utf-8?B?Q2k4TXBhUGxGUjAvYUdrT3VSTWtrdkN5UW5mUnBkTlE4N1NsZzdHY2QwTU00?=
 =?utf-8?B?WDdidE5WcEUxcjZmTWJWNFI3cGdYM0QwZFRWaWdZcFNnY1h2QmtpbkNFVHhv?=
 =?utf-8?B?WGZCUFRSbE1YUzhEMURqREZNVHhhMGUwQ0YwUEliQjVaSDNIb3NQUFhJQVRI?=
 =?utf-8?B?TnU1eGNxNEhlNjBOR05aTzQrUlRocGdUM2pxbHhwYXF4ekYveVVpYUVuM2xm?=
 =?utf-8?B?WkNJTU9yRTZnU2JIZlBCR1IvN0FaRkRNVzRPend1ZmQ0MWl2V3IvMUl2M1BM?=
 =?utf-8?B?dzQ0ZkowM0x3VElnTWNZUUdFcS9ST3paRk9HczZTemdlUytwVTdteHE0N1hQ?=
 =?utf-8?B?Nk1ORDAzSGgwRzRxckJxQzhQcG9hNVF5VXBZNkM3V2puMGt5WW96TWxxTjEr?=
 =?utf-8?B?dnMvRFQ0UmVLbDVDdndOajhrMWh3V1FpNEk5RU1ZcFZRNHQvOXcyT3ozakVQ?=
 =?utf-8?B?UTZpclYvNkIrR2o5V1ZhdVNaVDhGM0NOR1BPR0F5TEF5VVQzRXVMZ2djb2lz?=
 =?utf-8?B?SXprM0lObk1xZWYrUXNIaXRRMXo4WEVrbXR5dDBlMTFzc01pS2VhTi9sYi82?=
 =?utf-8?B?cDJteWNRd0NTVWdTdXgzc2FRS0NsdkFJQmNmMjRCSWo2dGF0ckZjOHRwYmdk?=
 =?utf-8?B?aW5ZRWwzaGlnSjNHejJoQ2x0V3ZWeWdDbDBoZ3FEQWhLaWM0LzJPVDNUeDBE?=
 =?utf-8?B?Y0ZmTGkxcmFwRjVQRUZWMHo1bjVLTFM0aHRMOW5CaVM3T3MvYUpPeU1kQ2sw?=
 =?utf-8?B?M2c4QStYUGUwZmtiYTMyUWZnYXdSS2EyMHVJR3NIOE5HdnNZUS91UjFxMzRw?=
 =?utf-8?B?SVJyaTFjUFhTak1rSVEyV1JDcHpXN2FQTEFpRlFSS0xsMUoxaWIxUFFVU256?=
 =?utf-8?B?czNIZG4wL2QydFlCWmRUbDZpMUxjK2NmT3VuNlc1UlY0THRmT1RyQnlFZGVj?=
 =?utf-8?B?NExrWFNIbFF6MWhBRndKcDBQUU52TlJHUTVablNDdUsybzAySXdQYnBJUzNC?=
 =?utf-8?Q?UEZXvBa5YduwWiMZZ+055kg//?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fa1b58-578b-4ecb-847e-08dce4c6dbd9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 22:49:52.3724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcscRYHK4GNwNuZnA2bgrhk07pEM3KgShzrVyj4zExP0eXnlJy7kKQpZ1SJZCtHrpG5NNxs3c9PEQQwwCbWhpMnOQvCzHEBS7wABF30hCtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5907
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_155000_288205_E7111EC3 
X-CRM114-Status: GOOD (  16.81  )
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



On 10/4/2024 2:51 PM, Lorenzo Bianconi wrote:
> Fix typo in EGRESS_RATE_METER_EN_MASK mask definition. This bus was not
> introducing any user visible problem.
> 

I'm not sure I follow. This bit is used by airoha_qdma_init_qos which
sets the REG_EGRESS_RATE_METER_CFG register?

How does this not provide any user visible issues? It seems like an
incorrect enable bit likely means that QOS is not enabled? I'm guessing
bit 29 is reserved?

It would be good to understand why this is not considered a fix?  The
offending commit is in the net branch already.

> Introduced by commit 23020f049327 ("net: airoha: Introduce ethernet support
> for EN7581 SoC")
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/airoha_eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
> index 2e01abc70c170f32f4206b34e116b441c14c628e..a1cfdc146a41610a3a6b060bfdc6e1d9aad97d5d 100644
> --- a/drivers/net/ethernet/mediatek/airoha_eth.c
> +++ b/drivers/net/ethernet/mediatek/airoha_eth.c
> @@ -554,7 +554,7 @@
>  #define FWD_DSCP_LOW_THR_MASK		GENMASK(17, 0)
>  
>  #define REG_EGRESS_RATE_METER_CFG		0x100c
> -#define EGRESS_RATE_METER_EN_MASK		BIT(29)
> +#define EGRESS_RATE_METER_EN_MASK		BIT(31)
>  #define EGRESS_RATE_METER_EQ_RATE_EN_MASK	BIT(17)
>  #define EGRESS_RATE_METER_WINDOW_SZ_MASK	GENMASK(16, 12)
>  #define EGRESS_RATE_METER_TIMESLICE_MASK	GENMASK(10, 0)
> 
> ---
> base-commit: c55ff46aeebed1704a9a6861777b799f15ce594d
> change-id: 20241004-airoha-fixes-8aaa8177b234
> 
> Best regards,


