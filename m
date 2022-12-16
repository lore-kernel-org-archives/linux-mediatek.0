Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E73C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 11:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oAUb5Bm1oiFNvY9wO1PSs/LG20yM9huOeKXyuHl9BxQ=; b=hdmQHbCYp425JBKvW06bif1SrR
	wSAqgNVzWR+F8Kfo5ywvAT1N4Fh0gd4kTl5iUn/6t454mLhm9GCjJCMwmGgtLYZrdl2QZ/8Ar9KPM
	GOJC90XBvcXC4TJq3pEJchrKbC+sY/juJpH5vEdJh9MOcEsU9ocGN70QS4MeP3eBCkg00PWdVIv7z
	znHyM2vub+NOXXvcrWRgDaDcF8DK5pOW/IFEjIgOFEjFmi+t7L2BjzduFVTQwJio6CDDjI93k/xPD
	hm2AjLp9HcrBfhrpSzTAyd88w9caTNvlAcJGxmCQGvBRiULFI4KzKQtwUi+knjwlgNIi1nd8RhsFP
	zbV85QJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68Yu-00ELOX-PT; Fri, 16 Dec 2022 11:07:32 +0000
Received: from mail-db3eur04on2079.outbound.protection.outlook.com ([40.107.6.79] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68Yr-00ELKq-EB; Fri, 16 Dec 2022 11:07:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mn5g4pzgtBixvAFyCHgLjY+fHzsnrusq6ZpS0/xxjyyBArYBq7sbiTOPeNrbSEAiUYI6/J6IP9G7ZStP7AYmbc5R3PuZ0ijUMq9+duKaKFUminKIilyNAg/CKGrrI+9WKJuFO85+PDkB27nlyBUGaZVhCdmQOtL10gGqFRP1jTD2LBkA0fu2J82NyE1UiefxLNVaBYQ7c0sV4nNyrIv0dFBPoRSbuoUozkzovlEwHRchCC3OPGW8SG77j2yfo+X3nfIzZM12jFoIyhXjUIrbmAtnLiOr0bXPdMj3mNf9jNvSlufMHVefOnn8bOLIWLpW18Wo+A+/wbTxSJj2rmMldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAUb5Bm1oiFNvY9wO1PSs/LG20yM9huOeKXyuHl9BxQ=;
 b=kuj8eNz79am0L/RwFIumTVzoqbIjpeGbsGnCm1S+UHrm2vrcJq9AzGM2apn6Pp70dXS+DY0xKDeL6q/hEedU5XWONFsLeU9SzGjU0Y1OorglR8lFUhlja7jHcvpAU7i55UlXJovMWchGNjVqLlQsWh7EhCnz2kpxgNnQQ2EfI0lSmrqrM7FvX0pqHLfnDRxKu1I5SwXqEaWkuxGO8/0UqqSlHslLObRb3KnoziHigoRipS52/omBL2V5JAuUIN3qKri3b/C6RIR0ms+qHPuSy6IC65N0bSoZGfIa8koK0kg2nXaY78ryLW/wSwvqENw09nah7QolKcXlfHAlqfTYHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAUb5Bm1oiFNvY9wO1PSs/LG20yM9huOeKXyuHl9BxQ=;
 b=FHyB8FakRKQw6AMyhn0350wTsfxxnwpmCo8EFBh0q2X9/E4Yw1ewqZoJJASA94mVONdxzWRnZpoFQx2PqTpVeZxenonGU3za9oCMJXx9+8kpxVlWEGCxtaZFaWXHBtRQHHvjn2rbICudr8wmgsvtxgQtwtSY1Ij1lQ/+h6eLVlBpYZ61cttiwE/hNW5AhLzClqEeh/d4cUoVCId2iqUhBzMpZDdS8SoqTu/M8nE+bUr+VUGN+0ZNbHC5hzevOK4NefVA+9XxXen9aprHxUi0JilyWMDkOvifVqs40KvmTSTMTdBDOk2VghhJy/HiTPNBgOv6YnX6xuhMx2yjukNIiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB6PR0402MB2789.eurprd04.prod.outlook.com (2603:10a6:4:94::7)
 by PA4PR04MB7773.eurprd04.prod.outlook.com (2603:10a6:102:cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15; Fri, 16 Dec
 2022 11:07:23 +0000
Received: from DB6PR0402MB2789.eurprd04.prod.outlook.com
 ([fe80::facd:e9d7:d5c3:dc2c]) by DB6PR0402MB2789.eurprd04.prod.outlook.com
 ([fe80::facd:e9d7:d5c3:dc2c%5]) with mapi id 15.20.5880.021; Fri, 16 Dec 2022
 11:07:22 +0000
Message-ID: <af4c45ce-a150-438f-dab4-e47b120c32c4@suse.com>
Date: Fri, 16 Dec 2022 12:07:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Chen-Yu Tsai <wens@csie.org>,
 Macpaul Lin <macpaul.lin@mediatek.com>
From: Matthias Brugger <mbrugger@suse.com>
Subject: [GIT PULL] arm64: dts: fixes for v6.1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To DB6PR0402MB2789.eurprd04.prod.outlook.com
 (2603:10a6:4:94::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2789:EE_|PA4PR04MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: c169bcfa-d497-4865-74be-08dadf55b3e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	85L0Q6/ZJtHWf9G28fyjzbW5sHbTMpv1AprVWs4eEVJ4wjW+2xKm01I8qJPe4Y6JJraStkTbRlX80ROiQkY1hlb5Vb+o5lcliAc6mu7ALCi/77dv86iOxsDwdo5bZYVJsWni0aB2mrF/i0u9T6wnD9OHyXgFHcdPieARahxYRDCKEFkzn2RBZfCYnUbj0IhnY4/Nb7g14VFHTveGgsMzsuywRMCT2eQJ1o8XqiJvau76bNGB0JsAfVxGzCPxsh76BeGWRykSfqb+Fep1kZXIL3aNq3BshTeQgjPZmc9QqbxejsBrM+OrvKy0zWUt2JPSE/f01k3LP5PIu0JuMwDKpGHryMxwh3q9AXCYCGIlevnRgqLObos1SNGWLZiZw/f8qyP1IfQMAm8UkJWhYZYC7ZdzmggW4f4JfdNAZM0/grh/mC5QWk/CgJODeSNqS59VDN2607XfbykKFJEnIHCleovilt6RYrsH+uFxBUZutGQjMj8ZVgKdEZ/TyMitWk3fJfojYXv5JnF2kPrY1axFBIUdC7pQ+LgmhHLgjal2VmTNM3VOKvgSdjwuKnOzeFR1Riwj/RTpAfD+/eQLz5b6sDNEQvSXkDSk8rIBhLCJmksp1E8Msq+fw8/Lu2bz1njb5DdNEKep4MU4XRumRn/lQdxUeYFPpIdre/aEYFlshK3RYrPKkcM2ttp6PRco/HyJWzRsJVYbU0EFTZh4aXngTRDS6mV++i6nG1FltIcNmrCecN642r+fDxw2GmjhbO2B0Uu4MkoXhMMP37yb9vK2Rg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2789.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199015)(31686004)(31696002)(86362001)(36756003)(38100700002)(83380400001)(2616005)(26005)(6512007)(186003)(6506007)(6666004)(478600001)(966005)(6486002)(316002)(54906003)(110136005)(66476007)(8676002)(4326008)(66946007)(66556008)(41300700001)(8936002)(4001150100001)(2906002)(5660300002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?N3BqUnNXRFp3ZlJCeFJkSk9DL0VRbEc3ZXorRWJwbUxhY2RHaWNoYldvRUdn?=
 =?utf-8?B?WDFackswWmxiWXlRVjhDY2NoV1BURG01MmtNU251aXRQdEFzN2FlUXFMZ05v?=
 =?utf-8?B?eFZ6ZnVvVHpJLzdReGV0WktOQnBCQnphM0lZek9iT3RqemZwdFRIWmJMN255?=
 =?utf-8?B?anVkTGZ5MjA2OHhvZGlXTUwrcjJ5WDlySUp2RDM4SG9hS0QveE5yajQvZ2pG?=
 =?utf-8?B?WTF1eEdUK1M1R1NHcFo0L2t0bm1VdzBwSWlkWkxsN3M2Z0tZaXh2WnczTFhj?=
 =?utf-8?B?TExIQUpLUytYYzZJZ0tja3Y4SnJOYVdYckJiMnl5YnpKNWhpczg0TXBCUGJq?=
 =?utf-8?B?cHFldmIrbUkxMzBZTTlWQ1NKY08zNXpBaklkL2I2R1ZSbkZFaWQ4UzYxS2pQ?=
 =?utf-8?B?RHV5VVQ5K2Z3Z2kzVk5OZC8vVEtTbXIybUdaTGJTVzNRNTBqbXZhQkVCV01Y?=
 =?utf-8?B?Mlc2QmdXeTFzMlR6bE41YURsOVk1R0VSOUxxbFpvNTJyTDJ0Z2I1WG4yS2U3?=
 =?utf-8?B?YngyZ0JtV0xYR0JmZFVTQUtXZ1NvT2xqR3FuK0p3bUNTUzhrUVdJUFpmb1hQ?=
 =?utf-8?B?R2JRN2NQTDREeitOZGFJMkpUWjQrY3AralpCb21nRUdMUm4yNlcwVG5jVERJ?=
 =?utf-8?B?T00wU1c1akUwOVp0QjhtZFhXWE9vSVRJRmprRElxNlhYY0RKT3ZlZTQvQWRL?=
 =?utf-8?B?eVZmSzlweFdqa0FwS3dEQWNrT2h6aXpwMWJnQ1plTnJDWU9pc3pKNFRvdG1k?=
 =?utf-8?B?UE5tUkJjRUZyMDhsZVFNbkFjb2dBYkpiREIwTXJhNW14cU8yQXA0bWRJL1ht?=
 =?utf-8?B?d0kraEswc1BpNHRDcVp6NzMwMGxoRG9ZQjNtTjN5RVVCOTRyWWVTY1IxcjFG?=
 =?utf-8?B?S1BYUUtVb2FtWC9HVzJzRC9kNERBWGtyeHMxME10YjVPdXcvdUZXZE16MHhP?=
 =?utf-8?B?Sm5DTGpVbGxIVWZ1VFJ4djFpMktILzlMUGZ4c3ZkM3BSdWg4djhWZDg1SXNI?=
 =?utf-8?B?L2pabkRoZEFFMjhFZ1pZUDRVLzVTZW9rTkZmWVpNZ2lyZ2VTemp3S2FMN0dZ?=
 =?utf-8?B?RUd1OXpqR1hzbzRpMU1HakE4WTN1UXVXY0VuWEE5V0hURThzL3RJNW1aQTEr?=
 =?utf-8?B?ZUZibmRQSGRtWEdKYmtSbGIyVjFOZEgvSndUb3BYTEx3VUlJdHhFeUdIbXdv?=
 =?utf-8?B?c2tvSWpLSWxST2drSkZCMXp0WnAyeW10c21EcnpPZDZOVS9pR2VjRWxTenF3?=
 =?utf-8?B?MkFpZjRPU1hOK21yNkdBRUFsVGFLdWdSRjdUMkcwRjBhSXcvSFhSQXlEajNs?=
 =?utf-8?B?dDJRekN4akhYZlNITHNWY21veUZiZHFUNFkwekk2MW5GYTFKT1JtU2RKM0Vw?=
 =?utf-8?B?MHlLZ1cvcWZCNGl2RGp2N1NZbi85NC8rSzZSYW9NVXNjQ2s2a2JWY3Y2cFJQ?=
 =?utf-8?B?RzVuUFdwWVQwd0g3VlNlSzRaQUs4U1dWa2VFR0l5ZmdOQ0tHSEszb3NlZEV4?=
 =?utf-8?B?VlhlWmdrZVM1ZVltamxBaGlQVlAxcUQrYmttYytxK1NPR3AxK2N6VmFUOEc5?=
 =?utf-8?B?ZTFqaG1XcksxY3Y2bWdBM1JxbDdSdVdqQjc3LzNBaWlLOS9pYXNpRTNtU2xo?=
 =?utf-8?B?NWpOdFlKMzZBeHFhVklaRC9JMmJRTklFSHkzYVh6ek9aVW9OKzZrd0dOZHh1?=
 =?utf-8?B?MGV5ViszbVBlcmlzQVp1clgvRVZzSDZjaXozVVZQdGJUcWpGTnZrV3VEOGcz?=
 =?utf-8?B?Zjhwd3lXU1B6SkxJNjBWaEZDTHdPWnJJRk5YOUdmRnpDbGNzbDJJV2VVWFVq?=
 =?utf-8?B?TFluUDB2T3ZWMmxKZy96Qll2WnFxK1NidWxhWlNtMzYyZkhQM2FKM2N5VkZ2?=
 =?utf-8?B?RmNMNGh5NDJKbEpKa1ErV0hIMTZjSmhUZ3VsTVlXQm9NQm41MW9RbWVVMDlp?=
 =?utf-8?B?OTVGZVNCN2ZUemZaSkF4SE41Z25uaEk2UER2ZHhyVy9aQldvQkxKci9LMFg1?=
 =?utf-8?B?QzduRWdtODFOZXBTUUlqOU9HRnMrbHNCZ1RUSkVFQVJjcUZKNDN3KzR2RXda?=
 =?utf-8?B?cVErZmdGUEhlSTRqcGlkL2J3OTNZVW1uYWU0YkR3dGhWV09QVzJEeVRHR1U4?=
 =?utf-8?Q?ZuXSbrzUBrIGEjW0hkp4cFFJV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c169bcfa-d497-4865-74be-08dadf55b3e2
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2789.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 11:07:22.7021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Zsnop1iNs5//2ifDl8T38b5M/v32woLQE2WI2yuyr8c/wEbMXrXnqlmc+4SYK6DhVB8+kmrqPo3qWwbveXJgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_030729_564802_7C3F99DE 
X-CRM114-Status: UNSURE (   9.12  )
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

Hi Olof and Arnd,

Please pull the following fixes for v6.1.

Thanks,
Matthias

---
The following changes since commit 830b3c68c1fb1e9176028d02ef86f3cf76aa2476:

   Linux 6.1 (2022-12-11 14:15:18 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.1-dts64-fixes

for you to fetch changes up to ad2631b5645a1d0ca9bf6fecf71f77e3b0071ee5:

   arm64: dts: mt8183: Fix Mali GPU clock (2022-12-16 11:41:45 +0100)

----------------------------------------------------------------
MT8183: fix phandle for GPU clock
MT8195 demo: fix size of secmon reserved memory area

----------------------------------------------------------------
Chen-Yu Tsai (1):
       arm64: dts: mt8183: Fix Mali GPU clock

Macpaul Lin (1):
       arm64: dts: mediatek: mt8195-demo: fix the memory size of node secmon

  arch/arm64/boot/dts/mediatek/mt8183.dtsi     | 2 +-
  arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 4 ++--
  2 files changed, 3 insertions(+), 3 deletions(-)

