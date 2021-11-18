Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17046C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 10:08:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1C5B6108B
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 10:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1C5B6108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWTbYrl1ng1HN9rKFGOTlZ96rbwHYD9WHuOUvfJn700=; b=ltIkv6Tft6K28W
	vkbxSqiEqfMxdivdFxMplo+/qV9BSPgA/hoc/rhPZGoquE0P/8EJVto+hRmn4ODUhL+qVwZ+WirG3
	f7CKmRWMFOa36FdStodvXwEbkx442HHBfkUt6W4Hqh5K45yYc5zI/luFlJ1CJ7g4CdzvE3aRZMILL
	RuHkAzXyDMgd6TUr47AqaLMddy/qfreQBP63wCH7DEk1GfBst4XfFyvH+bbr5vVlEvJaXsY0eYSSm
	EslUT9xuf0tZ7aeFnUjBT3yFGhJSz7AV2HgtKlAKSKXHJEMql9mVKLKqMwTwm2fguKGa+XtJ3B7Ld
	BTYh9qJZeMinYx3Et2Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mneLE-007QSD-3Y; Thu, 18 Nov 2021 10:08:28 +0000
Received: from mail-eopbgr80081.outbound.protection.outlook.com ([40.107.8.81]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mneLA-007QM6-6S
 for linux-mediatek@lists.infradead.org; Thu, 18 Nov 2021 10:08:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1sDWguXVcB7Fa3Ojonzqw5sl6WDYcB/xmoDz9vCslq6XkHVxCsHQxHMd0QPMzFOgZUZoJMi54DmSkvhwtyau+vXBAmBFENpIaamvYspp3cf8eVFCRSh1s9f++vL2/jQtg2TsOjNWJt2a95HCwSbrN2fm2y351i4JA1T7qYFh6cTNf6v5vauZTJHvFm9mdrzeP5g09jteELvRtT2wnkdoOZz3td6axQ0UKJzkzhO0ug2KVoQDto7Ggj0HRergVRRbxTKceUbZH8mN+zWCbY5igoXXa5HztleuXoA9gc/aM9Fq+WF3tIS3i2Veh90z1swndQhpzBWnK1m16rSTNCaUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOwDMy3pCYOj2cKXYjxWmjMT9TIZXKzxthvh9HezVq4=;
 b=XpWT2jdqrjbFW8QM1F+ug3SwYerRMcp6Dlky1qgtNZnWJWTvoQSikeb91fdt+cDmf3pwlRTw+sJZgZ8ttJG8BaOPWggB+fmETdhCFCFt8rjnp0LTTcr4akxJNsvj5HQ5GagYPimzUO7zEwd5/flpuepHLIjml1TeWJvx14vn1dOaIM/9J9aRRZgQZreighVGccM3Wm1LAWxvB3DrMw6rMqOTDC6ZxwmKodlb1etxcDXmUzME0MqrgAMe2kSaZjHABEVoNxerfglbEoW6vcs8hvypBqQU8ZUYVfgcL4XxgmY+CAvtwEp5Xkjud6GLKYpya73VFyYXXBkgrxpyG3b+/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOwDMy3pCYOj2cKXYjxWmjMT9TIZXKzxthvh9HezVq4=;
 b=XBNmYbat1SSNqAVhHgdEGOPiobLyfYlW95LFZw/wKnTR+gbMBfOG62XvTYW9y9uAQaB1BE25PCskVId4NWAmcsxKUL6le//ZwxkfgjdQICQWCeOJV2FaiNylrSQemZo3liVBdsfFnTFXwrNkdWuT0KTumJ4rYyuR32X9WAJu9uQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4285.eurprd04.prod.outlook.com (2603:10a6:803:4a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 10:08:16 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 10:08:16 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 daniel.baluta@nxp.com, daniel.baluta@gmail.com,
 linux-kernel@vger.kernel.org, yc.hung@mediatek.com,
 linux-mediatek@lists.infradead.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: [PATCH v2 4/8] ASoC: SOF: mediatek: Add fw loader and mt8195 dsp ops
 to load firmware
Date: Thu, 18 Nov 2021 12:07:45 +0200
Message-Id: <20211118100749.54628-5-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
References: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
X-ClientProxiedBy: AM4PR0902CA0008.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:863d:d4f3:969f:6fa)
 by AM4PR0902CA0008.eurprd09.prod.outlook.com (2603:10a6:200:9b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 10:08:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bb75a4a-b757-4e0b-f970-08d9aa7b55f1
X-MS-TrafficTypeDiagnostic: VI1PR04MB4285:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB42857044E54E12245B2023A1B89B9@VI1PR04MB4285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5+H3P4LzcZ0fASYmPQgjpzCOqo7gtx6LCzEHBL4jVoE4vN/W7r0pFN0ArWgugT9KXXfBBzuROAMtR8uAFd5ywODzwP+GDfEaDnfMoAljYOq3eFLXOH04o9NM5wcBC/EQ0Hf9H4t+xSsBhn0TQsJJqTf5cP05yJhKMrvngYpjGTaQdcW9Lrv6CoMHkO603xKGJsOfgj26OiHDh5575vPG3popYkVTveNxflWt1trqrxAgp/ayovfxXFUGfFdevZ1jVNVrDiZsD7EtFIyybiwuWkmdCZ6fqrRzwiymWYvVdAOD4MI0tingTXipArCW8ka2RRM7x4GSlbEfoEc3whT+055MgZNf5cG4WYTbKW2oT1NlMZC7JPT+Wb2913IW5y5rdknf9+/LZacH7o4MgKwFH4LWIEacFqagfHkD3JnJrCnRnaIC+CEvVNn+lW5J+5TSqtRl+3FjgHSJUsibzE50bDn+uLIqD8c5zYQHvYILZez+I6+o0NspnVTpPB2BlKVRcOmhzD4OSrtJgdCGE4LyYeln/6nIGItYyJ1SRgeofkrC/RHaP92hCnKYS56SmrjK4yQRUdg0v3y4EyPVoBv5NwLahatLbSUQL17rY77cghq9yMXZepRJlXgKcTR2bFz8qSJ5XjQf/ghTEhjkHQ5vNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(54906003)(8676002)(2616005)(4326008)(44832011)(86362001)(7416002)(38100700002)(316002)(508600001)(2906002)(52116002)(6506007)(6486002)(1076003)(6666004)(66556008)(8936002)(83380400001)(66946007)(66574015)(66476007)(5660300002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RURqTGdOdHptMC9KL2pmQ3JqczRQL2tpcEh1TTl1VVFOWWM5SG5sQkt4YVZ2?=
 =?utf-8?B?RUdwVnBjeFVQaDhVQ25nS1ZTN2w1YmNvSGFiQVY5emd2eVhpQitWK1NuRFFs?=
 =?utf-8?B?TjY4eklMTHgzaDIrVDVvNHVncU5SWXo3QS9HaUxmNkU5RS9sMFlYK0hCT3Y2?=
 =?utf-8?B?RG9Nc0xUZnlRenBRR2pGeVlMUXU1RTNUdCs4YXRVTzlQUG4zRFFRdUpmOTFB?=
 =?utf-8?B?dVh5Q3VBYTdqRkpwMWpIWXEyZGliTmcxaXFWTDB3cWxSWk9EeW9IVVU2ankr?=
 =?utf-8?B?YUo1YjB3R3NDdTVuK2o3TnpSdk85SlRxSFRHUUNWcVhjak52b1ZxQ2xBd2FL?=
 =?utf-8?B?YWN4MWk4a3o3eTQ1ZEJ2ci85Nk9uQWFDcGF0V2h6VVcxY3pEMFRLTFQ3VHVR?=
 =?utf-8?B?OC9WbkkrQ1hEQUV0dkhPSU1qemVEYTJrYTJVakhLM0NZc1pQWHcwbzNVV05T?=
 =?utf-8?B?VlJpZWcvWkZvQ2NWNXhLaFdWZjFrUjdwbnNGVUhadWthQmpOOEI2Z09PMXVR?=
 =?utf-8?B?WU5MaEM4QWptbkp2RWdSVUJUOW1YOU5DT3ZnbFdQRnhKU0d3eFZ4VjhQb2Ni?=
 =?utf-8?B?WTQ5VGxUWDJpMWZ0aUhMdzNCWGFvVlVFVFJoQ05hbnZoK2VLdVZmdDNSREc5?=
 =?utf-8?B?RnVZYWlDYUtkd0VPRUQ2Ky9wSGlMcmk3QVErUlZWZ2NDeGZqQVpsRHB0RHd6?=
 =?utf-8?B?cDk1ZFpxalpUUXovWVEzc3hGUWVtT0orckdIUG5pZ2VYZnI3ajhmczVzTWhl?=
 =?utf-8?B?VkJORldoV0Z1M213K293bkpWTGFiaW1oMEJ4Vkt0bi9vQWUvUzlIRG5lS0Yy?=
 =?utf-8?B?V1MrdUlLYTluZFl2cTVBbHRhYzdoRjd2UjNxeXFaeHBuRFJCR2U2UGY5NVRD?=
 =?utf-8?B?NmFQaUJ3Y1NTSnZpWUhLMzMzMkphOFRUMmNhUklIODdWZS9rYkh0V3hGZ1hQ?=
 =?utf-8?B?NmtLaWgrbkRlbEpsbUx0LzB4cGFnUis5SG1BOWJpNlhlQ2tnckRKU0ptZWZw?=
 =?utf-8?B?SEpPcmxFeVVML3dxZnNNY2RVWnUvL2htRWR1b1ZmcU1INFpDUXMxdG43dURq?=
 =?utf-8?B?WDEyK0tyOGlHT1llOVJZR3N2NUFuSUEyalRrQi9ZeVZaSm41Sm14YkcxcWhR?=
 =?utf-8?B?U0hVcHZoSm5mWmU1UVhQdkpDNHBSQTVqRzUwU3hIYnozMFN2WUU2cGt5TnRx?=
 =?utf-8?B?dGRTMWl6dWVhMUJhTVlhMkdWczF0Zk5RUlZVMWlOa0g0anlaWTd5dld2U1Br?=
 =?utf-8?B?MURDbmIvcWdEY1FaeWE1aXEwaGpySFdKYjJGZ1VURmdYZUFNNlRWK1NIU2RK?=
 =?utf-8?B?UEE2U2g0bWZ5a0NVa3RhNEVyVTc4Mm9PY1FqaFFabmJCTWFmeSs1cW5xdHc4?=
 =?utf-8?B?QThXbFJWNDJVRFVvQUFQTFl0RW8xclNrTlZiZjR3ckVFQm1SeTRYRGFVQ01R?=
 =?utf-8?B?V0JaWFpSRy9tT3hEM2tDME1RbkV5R1g4YlJZdWlzRzRiSzRJOHcva3VHR3Nz?=
 =?utf-8?B?aHRXNUxWb3g5S0NKZGhpVUlBWTN4TW9DNklDSU9FQ2pSSmQ1SHFkaFk0L2Rj?=
 =?utf-8?B?d21XUEhhNk9XYnBxaUtoZ3lVaXl0U3krS0Q4L0VxOXZTUlZURWN4S3VsQzNm?=
 =?utf-8?B?QktxS0pJRWNzSi9EeFJYT3lVRXZZVjd6Tk9BNWNCdnJ2cTAzQ1gvbVd2V2tP?=
 =?utf-8?B?ZlF1SW5DU3pwek1nMDE5ZE82WkEyTjFmQk10d1h1eDdvYnEvcEtCSWVIR0cx?=
 =?utf-8?B?RktqUDdHMnFBNTBES0FjaVVhUVVqUS9xeEF4T0R6TGpNT1U0Wkx3cDdWU2Vq?=
 =?utf-8?B?bnZuVzM1Q3NabU03TktCZHVISGFjTE56L0J4YThlTWtHcTZvSzFTNUlUbUVl?=
 =?utf-8?B?SzFLMGJwb2RmcmZiUVhWVEJVRDRBQU4xK1pPRld1NDQ2SUJMRWthSGhaT0FQ?=
 =?utf-8?B?Uit6dVU3T3J6T0w0TkdWSXp3S0swbkJrbmo1SDVmR0F2eU1weElTdHpabVg4?=
 =?utf-8?B?ZW1ueGt3cE05NjdiSE9ESkxIRTFKMzk0WU1JVWF2VWVZL0Yxa1NXSHNwTU96?=
 =?utf-8?B?UXNQckxvcUt0S0Zha29nNUQrRnB1cUFZM2pqZjFhdzZsUTloT1E4M1ZtdHNt?=
 =?utf-8?B?VGFTdUpMbTZ0bXJzUld3dkxZaTJ6M2FEQmFxckVuN3JjMUtjejhZYWJiYjF5?=
 =?utf-8?B?UTQ5Z3VOU0Y2TG1HMW5iNks3blcrd2hWZHp6RjFoRWxZUklXQnlpVGhMN2g2?=
 =?utf-8?Q?jlSYPiG1YrOg6PpgukDmpqlLDRa7fzfNDxfvqjhm0Y=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb75a4a-b757-4e0b-f970-08d9aa7b55f1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:08:15.9910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1qCdBtU+0R9i/UufcCsvyE4Eg9KsYVfZ5OMCat0Mgm5cFdwQ9ydToLt5mEzIupE4Y4yUKukFhTogBPEG7sung==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4285
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_020824_326386_A160C93B 
X-CRM114-Status: GOOD (  18.54  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogWUMgSHVuZyA8eWMuaHVuZ0BtZWRpYXRlay5jb20+CgpBZGQgbXQ4MTk1LWxvYWRlciBt
b2R1bGUgd2l0aCBvcHMgY2FsbGJhY2sgdG8gbG9hZCBhbmQgcnVuIGZpcm13YXJlCm9uIG10ODE5
NSBwbGF0Zm9ybS4KClNpZ25lZC1vZmYtYnk6IFlDIEh1bmcgPHljLmh1bmdAbWVkaWF0ZWsuY29t
PgpSZXZpZXdlZC1ieTogUMOpdGVyIFVqZmFsdXNpIDxwZXRlci51amZhbHVzaUBsaW51eC5pbnRl
bC5jb20+ClJldmlld2VkLWJ5OiBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJv
c3NhcnRAbGludXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogUmFuamFuaSBTcmlkaGFyYW4gPHJh
bmphbmkuc3JpZGhhcmFuQGxpbnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEthaSBWZWhtYW5l
biA8a2FpLnZlaG1hbmVuQGxpbnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEd1ZW5uYWRpIExp
YWtob3ZldHNraSA8Z3Vlbm5hZGkubGlha2hvdmV0c2tpQGxpbnV4LmludGVsLmNvbT4KUmV2aWV3
ZWQtYnk6IERhbmllbCBCYWx1dGEgPGRhbmllbC5iYWx1dGFAbnhwLmNvbT4KU2lnbmVkLW9mZi1i
eTogRGFuaWVsIEJhbHV0YSA8ZGFuaWVsLmJhbHV0YUBueHAuY29tPgotLS0KIHNvdW5kL3NvYy9z
b2YvbWVkaWF0ZWsvbXQ4MTk1L01ha2VmaWxlICAgICAgICB8ICAyICstCiBzb3VuZC9zb2Mvc29m
L21lZGlhdGVrL210ODE5NS9tdDgxOTUtbG9hZGVyLmMgfCA1NiArKysrKysrKysrKysrKysrKysr
CiBzb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUuYyAgICAgICAgfCAxOSArKysr
KysrCiBzb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUuaCAgICAgICAgfCAgMyAr
CiA0IGZpbGVzIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUtbG9hZGVy
LmMKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9NYWtlZmlsZSBi
L3NvdW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1L01ha2VmaWxlCmluZGV4IGRkMmI2ZTRhZmZj
OS4uNjZjZGMwZTdiZjNjIDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5
NS9NYWtlZmlsZQorKysgYi9zb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9NYWtlZmlsZQpA
QCAtMSwzICsxLDMgQEAKICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkg
T1IgQlNELTMtQ2xhdXNlKQotc25kLXNvZi1tdDgxOTUtb2JqcyA6PSBtdDgxOTUubworc25kLXNv
Zi1tdDgxOTUtb2JqcyA6PSBtdDgxOTUubyBtdDgxOTUtbG9hZGVyLm8KIG9iai0kKENPTkZJR19T
TkRfU09DX1NPRl9NVDgxOTUpICs9IHNuZC1zb2YtbXQ4MTk1Lm8KZGlmZiAtLWdpdCBhL3NvdW5k
L3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1L210ODE5NS1sb2FkZXIuYyBiL3NvdW5kL3NvYy9zb2Yv
bWVkaWF0ZWsvbXQ4MTk1L210ODE5NS1sb2FkZXIuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwMDAuLmVkMThkNjM3OWU5MgotLS0gL2Rldi9udWxsCisrKyBiL3NvdW5kL3Nv
Yy9zb2YvbWVkaWF0ZWsvbXQ4MTk1L210ODE5NS1sb2FkZXIuYwpAQCAtMCwwICsxLDU2IEBACisv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMy1DbGF1c2Up
CisvLworLy8gQ29weXJpZ2h0IChjKSAyMDIxIE1lZGlhdGVrIENvcnBvcmF0aW9uLiBBbGwgcmln
aHRzIHJlc2VydmVkLgorLy8KKy8vIEF1dGhvcjogWUMgSHVuZyA8eWMuaHVuZ0BtZWRpYXRlay5j
b20+CisvLworLy8gSGFyZHdhcmUgaW50ZXJmYWNlIGZvciBtdDgxOTUgRFNQIGNvZGUgbG9hZGVy
CisKKyNpbmNsdWRlIDxzb3VuZC9zb2YuaD4KKyNpbmNsdWRlICJtdDgxOTUuaCIKKyNpbmNsdWRl
ICIuLi8uLi9vcHMuaCIKKwordm9pZCBzb2ZfaGlmaXhkc3BfYm9vdF9zZXF1ZW5jZShzdHJ1Y3Qg
c25kX3NvZl9kZXYgKnNkZXYsIHUzMiBib290X2FkZHIpCit7CisJLyogQURTUCBib290dXAgYmFz
ZSAqLworCXNuZF9zb2ZfZHNwX3dyaXRlKHNkZXYsIERTUF9SRUdfQkFSLCBEU1BfQUxUUkVTRVRW
RUMsIGJvb3RfYWRkcik7CisKKwkvKiBwdWxsIGhpZ2ggUnVuU3RhbGwgKHNldCBiaXQzIHRvIDEp
ICovCisJc25kX3NvZl9kc3BfdXBkYXRlX2JpdHMoc2RldiwgRFNQX1JFR19CQVIsIERTUF9SRVNF
VF9TVywKKwkJCQlBRFNQX1JVTlNUQUxMLCBBRFNQX1JVTlNUQUxMKTsKKworCS8qIHB1bGwgaGln
aCBTdGF0VmVjdG9yU2VsIHRvIHVzZSBBbHRSZXNldFZlYyAoc2V0IGJpdDQgdG8gMSkgKi8KKwlz
bmRfc29mX2RzcF91cGRhdGVfYml0cyhzZGV2LCBEU1BfUkVHX0JBUiwgRFNQX1JFU0VUX1NXLAor
CQkJCURTUF9SRVNFVF9TVywgRFNQX1JFU0VUX1NXKTsKKworCS8qIHRvZ2dsZSAgRFJlc2V0ICYg
QlJlc2V0ICovCisJLyogcHVsbCBoaWdoIERSZXNldCAmIEJSZXNldCAqLworCXNuZF9zb2ZfZHNw
X3VwZGF0ZV9iaXRzKHNkZXYsIERTUF9SRUdfQkFSLCBEU1BfUkVTRVRfU1csCisJCQkJQURTUF9C
UkVTRVRfU1cgfCBBRFNQX0RSRVNFVF9TVywKKwkJCQlBRFNQX0JSRVNFVF9TVyB8IEFEU1BfRFJF
U0VUX1NXKTsKKworCS8qIHB1bGwgbG93IERSZXNldCAmIEJSZXNldCAqLworCXNuZF9zb2ZfZHNw
X3VwZGF0ZV9iaXRzKHNkZXYsIERTUF9SRUdfQkFSLCBEU1BfUkVTRVRfU1csCisJCQkJQURTUF9C
UkVTRVRfU1cgfCBBRFNQX0RSRVNFVF9TVywKKwkJCQkwKTsKKworCS8qIEVuYWJsZSBQRGVidWcg
Ki8KKwlzbmRfc29mX2RzcF91cGRhdGVfYml0cyhzZGV2LCBEU1BfUkVHX0JBUiwgRFNQX1BERUJV
R0JVUzAsCisJCQkJUERFQlVHX0VOQUJMRSwKKwkJCQlQREVCVUdfRU5BQkxFKTsKKworCS8qIHJl
bGVhc2UgUnVuU3RhbGwgKHNldCBiaXQzIHRvIDApICovCisJc25kX3NvZl9kc3BfdXBkYXRlX2Jp
dHMoc2RldiwgRFNQX1JFR19CQVIsIERTUF9SRVNFVF9TVywKKwkJCQlBRFNQX1JVTlNUQUxMLCAw
KTsKK30KKwordm9pZCBzb2ZfaGlmaXhkc3Bfc2h1dGRvd24oc3RydWN0IHNuZF9zb2ZfZGV2ICpz
ZGV2KQoreworCS8qIENsZWFyIHRvIDAgZmlyc3RseSAqLworCXNuZF9zb2ZfZHNwX3dyaXRlKHNk
ZXYsIERTUF9SRUdfQkFSLCBEU1BfUkVTRVRfU1csIDB4MCk7CisKKwkvKiBSVU5fU1RBTEwgcHVs
bCBoaWdoIGFnYWluIHRvIHJlc2V0ICovCisJc25kX3NvZl9kc3BfdXBkYXRlX2JpdHMoc2Rldiwg
RFNQX1JFR19CQVIsIERTUF9SRVNFVF9TVywKKwkJCQlBRFNQX1JVTlNUQUxMLCBBRFNQX1JVTlNU
QUxMKTsKK30KKwpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NvZi9tZWRpYXRlay9tdDgxOTUvbXQ4
MTk1LmMgYi9zb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUuYwppbmRleCA5NjZi
ODY2MGUyMWMuLjg4ZGE2YzJkZTA3MCAxMDA2NDQKLS0tIGEvc291bmQvc29jL3NvZi9tZWRpYXRl
ay9tdDgxOTUvbXQ4MTk1LmMKKysrIGIvc291bmQvc29jL3NvZi9tZWRpYXRlay9tdDgxOTUvbXQ4
MTk1LmMKQEAgLTE5OCw2ICsxOTgsMTcgQEAgc3RhdGljIGludCBhZHNwX3NoYXJlZF9iYXNlX2lv
cmVtYXAoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwgdm9pZCAqZGF0YSkKIAlyZXR1cm4g
MDsKIH0KIAorc3RhdGljIGludCBtdDgxOTVfcnVuKHN0cnVjdCBzbmRfc29mX2RldiAqc2RldikK
K3sKKwl1MzIgYWRzcF9ib290dXBfYWRkcjsKKworCWFkc3BfYm9vdHVwX2FkZHIgPSBTUkFNX1BI
WVNfQkFTRV9GUk9NX0RTUF9WSUVXOworCWRldl9kYmcoc2Rldi0+ZGV2LCAiSElGSXhEU1AgYm9v
dCBmcm9tIGJhc2UgOiAweCUwOFhcbiIsIGFkc3BfYm9vdHVwX2FkZHIpOworCXNvZl9oaWZpeGRz
cF9ib290X3NlcXVlbmNlKHNkZXYsIGFkc3BfYm9vdHVwX2FkZHIpOworCisJcmV0dXJuIDA7Cit9
CisKIHN0YXRpYyBpbnQgbXQ4MTk1X2RzcF9wcm9iZShzdHJ1Y3Qgc25kX3NvZl9kZXYgKnNkZXYp
CiB7CiAJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IGNvbnRhaW5lcl9vZihzZGV2LT5k
ZXYsIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UsIGRldik7CkBAIC0yOTQsNiArMzA1LDkgQEAgY29u
c3Qgc3RydWN0IHNuZF9zb2ZfZHNwX29wcyBzb2ZfbXQ4MTk1X29wcyA9IHsKIAkucHJvYmUJCT0g
bXQ4MTk1X2RzcF9wcm9iZSwKIAkucmVtb3ZlCQk9IG10ODE5NV9kc3BfcmVtb3ZlLAogCisJLyog
RFNQIGNvcmUgYm9vdCAqLworCS5ydW4JCT0gbXQ4MTk1X3J1biwKKwogCS8qIEJsb2NrIElPICov
CiAJLmJsb2NrX3JlYWQJPSBzb2ZfYmxvY2tfcmVhZCwKIAkuYmxvY2tfd3JpdGUJPSBzb2ZfYmxv
Y2tfd3JpdGUsCkBAIC0zMDcsNiArMzIxLDExIEBAIGNvbnN0IHN0cnVjdCBzbmRfc29mX2RzcF9v
cHMgc29mX210ODE5NV9vcHMgPSB7CiAJLyogbWlzYyAqLwogCS5nZXRfYmFyX2luZGV4CT0gbXQ4
MTk1X2dldF9iYXJfaW5kZXgsCiAKKwkvKiBtb2R1bGUgbG9hZGluZyAqLworCS5sb2FkX21vZHVs
ZQk9IHNuZF9zb2ZfcGFyc2VfbW9kdWxlX21lbWNweSwKKwkvKiBmaXJtd2FyZSBsb2FkaW5nICov
CisJLmxvYWRfZmlybXdhcmUJPSBzbmRfc29mX2xvYWRfZmlybXdhcmVfbWVtY3B5LAorCiAJLyog
RmlybXdhcmUgb3BzICovCiAJLmRzcF9hcmNoX29wcyA9ICZzb2ZfeHRlbnNhX2FyY2hfb3BzLAog
CmRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUuaCBiL3Nv
dW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1L210ODE5NS5oCmluZGV4IDQ4Y2JiYjVhYWNiNS4u
OTI5NDI0MTgyMzU3IDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9t
dDgxOTUuaAorKysgYi9zb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUuaApAQCAt
MTAsNiArMTAsNyBAQAogI2RlZmluZSBfX01UODE5NV9ICiAKIHN0cnVjdCBtdGtfYWRzcF9jaGlw
X2luZm87CitzdHJ1Y3Qgc25kX3NvZl9kZXY7CiAKICNkZWZpbmUgRFNQX1JFR19CQVNFCQkJMHgx
MDgwMzAwMAogI2RlZmluZSBTQ1BfQ0ZHUkVHX0JBU0UJCQkweDEwNzI0MDAwCkBAIC0xNTIsNCAr
MTUzLDYgQEAgc3RydWN0IG10a19hZHNwX2NoaXBfaW5mbzsKICNkZWZpbmUgRFJBTV9SRU1BUF9T
SElGVAkxMgogI2RlZmluZSBEUkFNX1JFTUFQX01BU0sJCShCSVQoRFJBTV9SRU1BUF9TSElGVCkg
LSAxKQogCit2b2lkIHNvZl9oaWZpeGRzcF9ib290X3NlcXVlbmNlKHN0cnVjdCBzbmRfc29mX2Rl
diAqc2RldiwgdTMyIGJvb3RfYWRkcik7Cit2b2lkIHNvZl9oaWZpeGRzcF9zaHV0ZG93bihzdHJ1
Y3Qgc25kX3NvZl9kZXYgKnNkZXYpOwogI2VuZGlmCi0tIAoyLjI3LjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
