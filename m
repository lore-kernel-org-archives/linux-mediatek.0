Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD07AC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 11:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c6nAEtYYIyMv/voYZ+VggtxK/Au/TTTiV28Y880j9BQ=; b=uMm9LyBgPl12yTGyqcg6EsoCoL
	vYW+hnXAYyDylLKuzRjBT0hio7E3RKR40Wo16o87yFW3jZXRCi/tHPBw/1y6WbnNWBW/QGYg2H0V3
	H37JtTHlTfaCqLhFqKaGv3jHpYP4A3C7Jm8P9gqvb0CjhUCnZXVEUs0qnzOCrBPACaT3a6AXzsdyR
	B8ESIaurGgrkxAN9eq7NeXDrwSvSGgVsRMiT6IQSnVKPrqO3Kxnhy5M2myGnwTkmhvZbzdSwc4tof
	SCKhWZaKc4y2mBpGXomI5UKe+tFus7WZUSi9rF03LA36xYwRZV/gZBd2w7cnSEPSIKtm39xJ0dZzQ
	S6Y+ewSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68aW-00EM7K-PH; Fri, 16 Dec 2022 11:09:12 +0000
Received: from mail-am6eur05on2068.outbound.protection.outlook.com ([40.107.22.68] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68aU-00EM4v-28; Fri, 16 Dec 2022 11:09:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWqEV8KcOgv6IQXeN0GpQsNfoDkQj0bB1Miizp1cw1zyb47cIHWE0AkPhJgjzUWFUqFWmk11g17dSZPZJW4wSCBMXqR73WQoVvcTnZEmCy+gDwkEdsRYRAdykH1Ow+gx05yBzqRB7z6oHq7wkQFr2zIALBLVUYaYeLAIIvNu4UgWk/hIznVzl7+km6Bc5fUcoNZCFO0jZ8/be4YTxnH6RnjLtbGruXlXUw8sfrvNIFG6C/UhZTDErr+00wUMTKYAkyZ65yg3dCgxUfff3X+bNkk12cwurDqLm1nErc7xv2Oj3IbIb9M8IWdL/GjBslkG5K2vck9D0SsZCPrPkOTEjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6nAEtYYIyMv/voYZ+VggtxK/Au/TTTiV28Y880j9BQ=;
 b=Ald4U04ClG9nt/isVx+DHg9hyj23p7Yp773GFDIHZHHpqNNC8lozaQfZget5TPT/lv4+mOC/oBScDotOEsWRwYPWk1xU4FNBaeiSr6CyMjeOaC1hxHMP1uym362IgJcm2OkxjTRdwENUjg6boz/wCekcJjXdI7CfZmX/zEVv3v9CA9RYYaaIlRLKKivaTZ4KqLCmey1D3uJ84OnM+4dm0zOZ8HJNilsUIfa20cNwk0r6ewx/nqfP90ASbS2KdqMPW93rF0OJyNNVXRzfXRw+oYemXDIQp8x10Gjhg4GmS2rTLTzZdRvNhA7clwboUxa35+eYbvKSk36u9oYxO/CWMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6nAEtYYIyMv/voYZ+VggtxK/Au/TTTiV28Y880j9BQ=;
 b=JKWzFvOWnxWJS372q0XvQ1Leldvsv+h7imGbCxc7EiWPKZ0MTIj2sabcRudf/6PvJwGC7FlP+u8HEpqtLd6MRy2YroHsNwmhL+REdiZYE+vq3wNkC4Rvvoj2ou4e9MIrSTd46Gv3RemIvkoYvE4zmzy6W9PSZxyssLjMBS7nI0TlSQVMHJ7AzPN0frv5+2h484rztB+ieJrFUKmABe2KGufIVK4HxL03xyrNEmNo+ETaY2t4CUVX4wELfcDQXJuA0SDVovmkx42oPs1EN8Ck9WeMvh31W2hfIMeYJYzqHeuCV60JuAYbCia8Ox7PxwK/I1MyZAo43Apyv52g48tUVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB6PR0402MB2789.eurprd04.prod.outlook.com (2603:10a6:4:94::7)
 by PA4PR04MB7773.eurprd04.prod.outlook.com (2603:10a6:102:cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15; Fri, 16 Dec
 2022 11:09:05 +0000
Received: from DB6PR0402MB2789.eurprd04.prod.outlook.com
 ([fe80::facd:e9d7:d5c3:dc2c]) by DB6PR0402MB2789.eurprd04.prod.outlook.com
 ([fe80::facd:e9d7:d5c3:dc2c%5]) with mapi id 15.20.5880.021; Fri, 16 Dec 2022
 11:09:05 +0000
Message-ID: <29c8b913-53cf-096f-fe44-832ceaeac116@suse.com>
Date: Fri, 16 Dec 2022 12:09:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
From: Matthias Brugger <mbrugger@suse.com>
Subject: [GIT PULL] soc: mediatek: fixes for v6.1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::13) To DB6PR0402MB2789.eurprd04.prod.outlook.com
 (2603:10a6:4:94::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2789:EE_|PA4PR04MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d5b633-9ffb-4b83-c2c5-08dadf55f1f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	o8cOkcnni5k4rKq2IeUJMtExqKjLOoPFXmpCDfel2eb3xsOm+Fbu9DTx+bUOCrGSO9St2Wa0UVtCRq7kala4AtleyrRuJuEly4nH3CtCXfrLSrXznFDbKpZRB+IpFgo2DBwDxXMXMnrYa6VczcbEGx9jjIlsmsrmF69oeohe/afh1yMtUbq+Td1FirMm2lVGfUzhfCCcbI9p3HOMNuymAkKA1w7BJGPe4RpNlPZ5R2bj0Q3PA96yPdBdQbrdI3HSNlSXeCei5dyQCEAdk4/sxbu5J7BE2rp0pf8B9Fbdr+lApoGNIIL0wBQW5gtC6lIo0kU7rukpB+55s/2uOEfrlIuzTkNPpe6ElneYuBrR0dnt2syOsIuB/ycRtrJGs/vhHbx3TAF3nMJz3mQUxwuYYNQM0oo3LiN5s4e8MtYQv2mOJn+LaNeDSlEAvr3JELY34HSRNrdSoVhRBZz2TXzgO0wmyKYlSsrLLYv+gmoqy41z7SduvWZS1q6JwAe4HQcGxXRWbWFAPOifDPCoFL47Bx/xhISM/2otvTHP0VkQZiDcUQcquBY4yYKLn9PKzO2qMuRrWeVtVMw9yy6/ZETc+mz+EB8pi86rVRe8Zm3iFsngkO7yeMvpGlVgcwda+WrBXfK6FcKiivRYMMbVqM5t187Q/mn3dpQ4ZoJ9PEQKd+1pApcUbCYrNGg1IRow+VAyV1dU6ZxDMPXg0bxEPng42pdOAb9CYhNG31YoqmnX5Tc3+Zj3k/q27uqWmPwbKel8
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2789.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199015)(31686004)(31696002)(86362001)(36756003)(38100700002)(83380400001)(2616005)(26005)(6512007)(186003)(6506007)(478600001)(966005)(6486002)(316002)(54906003)(110136005)(66476007)(8676002)(4326008)(66946007)(66556008)(41300700001)(8936002)(4001150100001)(2906002)(5660300002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZWRURG9FOXBsdHlMMFAreVpIRVhNMlBpekhKYWRaQTFJUWFNVUlSNHhvSDlx?=
 =?utf-8?B?Z3UzQnpHWjdKZ3lCd08vaG5JZ2huRWdZZUw5MExhU25jWGJ4MUl2eW9JL3VQ?=
 =?utf-8?B?MGJtOGpZc2NDUUVHY3pSNXdqa3VvYXlYK25KcWwzbmxmcUE0NitMdER3bk5k?=
 =?utf-8?B?alkxbU1SVStwTitpemFYUG5Eck96amVRd3RRbGFGTTNzVVZoc3RnajRMUWFa?=
 =?utf-8?B?aUVaYWtHZEYzblFlQmxpM3FHd1YwTitBMnBzMk1hVXBpVDBtZEJXYWF6QU03?=
 =?utf-8?B?bW9jOUYxd2hGWE9HM2NuaUdRYnJyR0tkeDRnYkJMUWplRFVwdUwvbjBXU292?=
 =?utf-8?B?Lzh2UmVac0tza1JoaHFRRnNCT1VaMFVMT0Fqck94R2pCRXdlWHQ3MWVCbllN?=
 =?utf-8?B?T1BSYVdST3kyMFNPRmx3MktJWTJvYWR0eExOcFljTXhNOUtEKzVGajEwWWdT?=
 =?utf-8?B?ZFZHQVJ6dXY5ekl2anc4WTltWGxCTlFNdzB1UTliY1FBTmtDbTVlSDI0YXEx?=
 =?utf-8?B?cXdraThqdTF3N3NqckZBUytWa0VWQ1JwQjJQKzZ4cTgrc21wVzJKN3ljMmpC?=
 =?utf-8?B?VDJpV1VFL28yNUtpaWxJRHlCR3EzU2dNTDIwaDc1Qm1HSjJlc3JoeTdrL3ZR?=
 =?utf-8?B?RUJNd3RjM2g3UjVIY3NOMEhMejlsRTdYQ2VzZXI3dWpyTzdkdEM5eGlQcWlY?=
 =?utf-8?B?OU1pYVhvTW13L2MxL3g0dDV2eHdsdW9aTWJGdSsvalU4Q2ZTdHdNdGlhd3Nj?=
 =?utf-8?B?SVRiNmsvdEVHd0Z5YVY4UDhNS0xJYU8xU3d4dkgwcDdaL1V3dnVMaVJKdm9C?=
 =?utf-8?B?UHo2bFlzTG96aDB4b1hoVURDdWM1aDZVZERHcG5Vc0d0UENOa0MvQTFPRzVP?=
 =?utf-8?B?cmVwdy9iUERDMWdXK3lsREpwRVN1eHQ4NURwR29QelVodkVhSlJBRWs4L1py?=
 =?utf-8?B?cjJaT0pONTJrZmJzZ0phOGpXczJLeWhFWGpNblFLN0JQZ00ydXdsenBCcjFz?=
 =?utf-8?B?eFBoV2hVeXhFWElncUFpVUc2c2Q2bkM5V1ZNNVViOCtGWXN2QjN1bGRBemwy?=
 =?utf-8?B?ODNucTl0aURualJQaDYzYVNHL0FMcC82TTlDN0tQbDN5NmpodFhLcnhEaTUr?=
 =?utf-8?B?U2ZJOUtJYVNUWEtZNFJ1cTVUTSthV1pUN3NpdHVUVDc5Vnk1UFBQUWlnMkdE?=
 =?utf-8?B?Y3RkVUFodjdDdk5remFmaU1sZExVN2xxb2ZueDBJSEVHOW5lUG5VbzFVbldQ?=
 =?utf-8?B?Y2pXY0ozWjRHMG5MWUpORU94QWtmV3V5TzE1SnkzQjhJUEtkOERtY0tuRVFq?=
 =?utf-8?B?UG8yL3BhbngrV0IzRWRHS0M2QWthanNINlZhUXpxbmprNGFQQ2lLL1FLM3Nk?=
 =?utf-8?B?MmV2dVpydjVIbFdDMlVOTkZBWlFlWFZ6aGFYTWk2ekl5ZU1wdmNlZ2JTTG13?=
 =?utf-8?B?SXBHdmdONXdQNzRMK2dIaDJkUE1sUnJvTi8zWUVSVEVieTE0Ry9xOURHcENl?=
 =?utf-8?B?My9oMWFCZ1ZyeWdFeHgxVEdHaGMxRkg2a2t0OEcrNGlwcTNlbWRURk54ZmxB?=
 =?utf-8?B?Sm5XK29ONzFkRnpKL0NmYUc0c3pMejd2SzFwVHB4aGxKWWRJWko2RlpEWGdG?=
 =?utf-8?B?S0ZUUW9tM2dyeXlncFEvNi8rKzlDT0g1NEVsNTZYOHhTTlpJNUMxam9WVExn?=
 =?utf-8?B?TW82cEJETU92OWgrY0NCZlZsUi9USklCaWh4SStBc0pDL3RxZjNwa00wUCtP?=
 =?utf-8?B?a3NhSFpUbnBwckh5WXhadGFrcWI4czBoZ0hIVTZsekc4RkxMQURsem51dlBa?=
 =?utf-8?B?THpDZnM5YkN5Y2h5eEQ0RzlUUTRQVDNNYlJkMCtnSHhocFYwRWROSVJZTUl0?=
 =?utf-8?B?Y3NqTVJOWEpoQkkzYUFlWSt1d1NIMnNPOVhuaitxOEwxOEw2SDdQdUpCZ2lz?=
 =?utf-8?B?V0k1MVE0dnlyY2dMK2FRbkcxUlJCMnZvRzI1RGlhMDhPMHR5YUdGdmE2cSs5?=
 =?utf-8?B?eC80ZmpzUUlIK2RaN29DOWdsRlZnbUt3OHNia3BLcHRiM3ZlZlNLTkd4MXRK?=
 =?utf-8?B?cWF3N3VEU2Y3NUhsQlBqZmVrd0h3Q0JVNHZzZTR5MXRCdHlkR1BwZTRqWmpq?=
 =?utf-8?Q?LiPDw093mtbQxiA4aJENR7zJh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d5b633-9ffb-4b83-c2c5-08dadf55f1f3
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2789.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 11:09:05.2094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VH8I17Vo8p0dJlsRH+8205BFYuOE5DgGI09Qrlf0UQNaz/5DlPxJwcnik6aII3VCnbDohno3Z3BprWW33fLq0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_030910_145966_050E031B 
X-CRM114-Status: UNSURE (   8.15  )
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

Hi Arnd and Olof,

Please have a look at the following fix for v6.1

Regards,
Matthias

---
The following changes since commit 830b3c68c1fb1e9176028d02ef86f3cf76aa2476:

   Linux 6.1 (2022-12-11 14:15:18 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.1-soc-fixes

for you to fetch changes up to dba8eb83af9dd757ef645b52200775e86883d858:

   soc: mediatek: pm-domains: Fix the power glitch issue (2022-12-16 11:41:18 +0100)

----------------------------------------------------------------
PM domains: enable isolation before resetting power

----------------------------------------------------------------
Chun-Jie Chen (1):
       soc: mediatek: pm-domains: Fix the power glitch issue

  drivers/soc/mediatek/mtk-pm-domains.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

