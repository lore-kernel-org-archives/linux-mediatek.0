Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE7AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 08:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKgSKs8a3yg8x417fbWfzZQuTzfwhYeymbjt8sW+85Y=; b=TALW0MXVNExoi3BAEkrMirmjSY
	JDjEbfAmF0NVr0VLvKXwfd/vfHuC7bOoGgLuxCSryBpEUYDebJu2oThBh7UumYVHhFsIC/BePm5Bh
	tdUGuPqbwzjWx8qesBFcLvyIzAQxvg3hk04yrwuBHd4nCUxeW80dTAgE/q3HCQ7caiOQW6iUAcQJL
	l0KXwqKrTl2jrkSSYQ91ZiGelrdxcEAKUzrgo7GNcZ5M0uMvgL+wOn6EafUR1LC10F+lvJfV086RE
	rh3LMOJ7e+qp+uT2tSWFimUuilGS0KCtAGxsIoKFn/0JGDj0vvdHfe6OFXLvpX+YepnpUYBeu4sWj
	/BNBNU5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noLhg-000j59-4x; Tue, 10 May 2022 08:58:48 +0000
Received: from mail-psaapc01on2071b.outbound.protection.outlook.com
 ([2a01:111:f400:feae::71b]
 helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noLhT-000j38-6z; Tue, 10 May 2022 08:58:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLHyZuBZc00TCl7rBBnu2AJfFSWLyj4AhP3Sx4Cn2bHmS6w5eKSAgdY/ruHtonR9YDdSdCArE/33swfejreAo4JkweWeBDWDg5iNDTMBqDfoVjVm4UEyDyglCHvK+sEmdiNPZJADyszyOc2ynq3BHbL0NEhQsXUzLWTlIS3ObAdq7bcV6web32BTcnZCEKVKWo+62cCajXTJiPfqbpWWhJ1K+T6zR86Z+JW1b4y4hBQHBqY32N6fB3G56yGl/j43lFiuSgdrPnCcvbtxCGY3ngYd9N2xvWRomVFhu1VrVeW8IY/pEjMTrtmuJKTLUAehJTR6DpRmDkFl+v0LP/rCKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpTV4jcTfGSCwCEdF/tvCptoMP4B05/I8ORAxt9ovcw=;
 b=V2YwFx0DSYRyrhQrjAzv6Vxk/PWeOItAvK8Q7KfoOhRAvVyW5F3E8fQQxvo9ic3ySD/EHlIK7Vh2r6Q/knOrfOKqGvW0J3g/0KkrMkk6JiESXD8qkxVFqwhn0KA1tepgDdLtJt2z/WhAM/dQ8xUId7km8OFYtyYlmv/Us/gVWr7XW5IbCs15EtT6JfaLp8PLAffZbzmELXP9kG93embtj5Av3rz0I96HcPo1L9QNyj3vv7c9ykhLj203UcIQocXCyPtWhU8f3PbbassIRrIfTiX8j812nZ/cT8AoImJTAv4t/dvo5OgeKFZPwLl7N8vTxrgso+CPTUm2DC/T/n3+uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpTV4jcTfGSCwCEdF/tvCptoMP4B05/I8ORAxt9ovcw=;
 b=hLNCf7AewqKtJAiLX6EounHUc0fT9MAnBTTis0byVet75rjTRAiKgvaG7f2wFNWKDtcWdEpCHHjPsgCg8yQkdN2vSbs80aztLA8aXmU0N78ri+EGY4ElIEihYlyPyrfA7/Ibp4Pt+b15my15CBupUjdmUjmtle4aZO0JQeQcLTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 PUZPR06MB4601.apcprd06.prod.outlook.com (2603:1096:301:a5::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.20; Tue, 10 May 2022 08:58:27 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::4591:4f3e:f951:6c8c]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::4591:4f3e:f951:6c8c%7]) with mapi id 15.20.5227.022; Tue, 10 May 2022
 08:58:26 +0000
Message-ID: <340a3029-1ab1-0e64-0c18-bb2464614919@vivo.com>
Date: Tue, 10 May 2022 16:58:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] cpufreq: mediatek: Fix potential deadlock problem in
 mtk_cpufreq_set_target
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220510080136.11950-1-wanjiabing@vivo.com>
 <20220510081232.4u25qgryszzqblho@vireshk-i7>
 <61a4b23f-9740-6fb4-abd0-640d3353e788@vivo.com>
 <20220510085050.tza6rjvdkjsrhrjv@vireshk-i7>
From: Jiabing Wan <wanjiabing@vivo.com>
Organization: vivo
In-Reply-To: <20220510085050.tza6rjvdkjsrhrjv@vireshk-i7>
X-ClientProxiedBy: TYAPR01CA0170.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::14) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21773d30-f202-41a3-8dfd-08da32633ed8
X-MS-TrafficTypeDiagnostic: PUZPR06MB4601:EE_
X-Microsoft-Antispam-PRVS: <PUZPR06MB46014DE3B5057462740256D2ABC99@PUZPR06MB4601.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S2Mrp96E+9BLxAhY/tyzVmBAIC/j6EkCiUymO54SGqIe/ZiTYGTNpv9SWB0mLxLDH/ipOWx+8m+WcCb9VqQKYCoXPjV9SgK4ERlc4wPUI8/yUXavQOi4JRiXTNLGtwJKx21y4LddqV5bo01phPP/OZbwssaXAskyKS4rAMAYI1blzhs1DBKv9QJgIkodp3YCiO7r/owUpX15FjiJkhx+L/E8/7pmtjDS8d5VwoCq5nefYmyvjudeQVrPU5k9tkqn+tZqRg9aCXCnLUss+0zfvzpecqOlnAlQIppMf9alLApScN3OBWfoO0HOry6DllB6Pc4DvF22piM1bAfhUCVjcE9EddHN/7u/OTRtLgv9huokFniOuLJaVxvpSgXatXM5R14WGazfhCtmBIOnvGEOGUhZt0aHRDTYMR0l5yr9KpxWYq52nocw8fxrH7lw6xwozRP78u6Bttt2mHPlfU2+3DqzKfqG0M9EEgfmxabJj0Acc49MM/Gci+gjvL1ehobctU3yKaZ1JOM6S0iKcACK+d3jXPKb+ibWptQqSafLIGPxF9eC/SyWt0QfbOFEbojfKu09BWw9psZRIrsqs7O2f9ca41EmIK5OxCm3vdONa7tcCA80mK/kMiErEjgtSv9cZ8YGCvqO77WXIbPadmfh+qgE+o2At802BZWPPvAzjkzIFA6Uvg/jM0dhnhx0r6nKICC6B0E3DJZwYfJJDpobJ+HGcjyxCKqgzHqmWr2MRXPegxxyZEfzt0HM77YKg8a1G7vFLI65rOWRk5PxI+C+E3R2IA/Ij2ZTVdKMWW/yKBU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(66946007)(4326008)(54906003)(6916009)(86362001)(2616005)(8936002)(316002)(6506007)(6666004)(53546011)(6512007)(52116002)(36916002)(26005)(66556008)(2906002)(38100700002)(38350700002)(508600001)(6486002)(31686004)(83380400001)(7416002)(186003)(49246003)(36756003)(5660300002)(8676002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STl1QTRGNWpOLzM1MW1uVGY2RjRMNHdaaGh4UlhHZmErSHhUeGpLMW1iNnRQ?=
 =?utf-8?B?a1hRRzRSNkROanZFUjZvaGV6SEdlTk9jWCs2Qzk2REZzcklnMEg5eWZDajZV?=
 =?utf-8?B?MWh6WkZudzc5czVHQnJyM0d4aUhkRWkwSjhtT3Q2VkU5c0w2NTlkZGxuR1ZH?=
 =?utf-8?B?d0hYRkt1U2t5L05BSXhoOWxEU2kwMmd6Y01nV1VndUl1Rm1SQkVPTnJNbm1o?=
 =?utf-8?B?U21lUTVLZXNKQ3VqSEEzNldWYXppd05UL2pRZjJVZEpwYzljSG1JYU9neUY0?=
 =?utf-8?B?bTYzaGpXZkpseTdTTDdiemRIbFdyZVlpN0tWNWJVNHhJV09YS1hZc2cySC9R?=
 =?utf-8?B?cXBwOCszWWhJVGp3YURFVnZtbW9JN04yeFhnd0hEbjl0S2dxYVAwMGVXVThy?=
 =?utf-8?B?RlY5Z1lCc0xQbGZ3bDNxVDlBemdaZy8zaVhBRHJicjBUb1ZmYWt4TW9rTDNp?=
 =?utf-8?B?bVZkRDEyQXhzRVN2OFBUa3pkanc4enh3YjFKWDhuZnJ0WjJETHQxRjl6TW14?=
 =?utf-8?B?VGdvQ0VFbjBvckdpREZQOGtGOFk4Q3lBcWgxdkIxUllxc1ljeHZ5ZUlnYkxt?=
 =?utf-8?B?RVR1RlhoV3IwcXZvMGVZZjNRRWhGcDE1RTJFQ3ZualZFekxuYVZrVHhzcFZG?=
 =?utf-8?B?c1RWNGlMTTk0VTF4YjE5bi9XMkpmWHNHZm5NMTVDT29NMmM0K3ZJaU83UzEr?=
 =?utf-8?B?Q2xCSW5GbXR5WWp5T0pvOTd2ejFJaitGTEhhUmFmSlJINjRtTmg4OFhHQlVK?=
 =?utf-8?B?SjYwdEE5b1ozaDZJaTJjMXBXYjN2Q1Yyb0JsWVJTbEcwdk95N01KMWtodjdv?=
 =?utf-8?B?eFZzTUtPVmQyK3RUSWJoNFoxTVk4Ukg2Tnc1U3l2cUVOQTZBbUxxeDIwbC9r?=
 =?utf-8?B?Z3pNWkxGM1YyZjJiTDhQSlFtVVpkcXZSTGcvTkpwMWdtMXNDdjNrcnRTNEpV?=
 =?utf-8?B?NlFUdUtzMlJFaUQzb2FxT21oaVQ5QlhKZFlpQkRpWGk0U1hteXNWY3ArSmhl?=
 =?utf-8?B?M2RsaWRScmdxRnl5R3ZocS9JcTB4YmVmdG15OElvalRHdjNRN0NtY0xKV2dC?=
 =?utf-8?B?NHhueGpNeXc2U2prcWZKNUFzdjdIZlRVeU4rQzJwcndSYlpmY3Erbkt3SmJM?=
 =?utf-8?B?L01jc1h5eExlcEZnSGd6ZHd0cStTRHY1TGlyZlFUemVWODltUlk2bTZmWFhJ?=
 =?utf-8?B?MGJUcXVEYnNLbUVMQm5vME5ORVpLS0E4cnB0SHg5M3A4ZTJPWlpXa3A1V1hD?=
 =?utf-8?B?WW5PUllKcHRZUWU0RTBsMmRzK2VRbFRmQStMZmdITHZ0elV0anltZCtuTTFt?=
 =?utf-8?B?TTFiMFlKOHIySFBwL2xOQk8xVkRNNzZBMUtjSlB5MUNCNmVtOHRUVk85ZVZv?=
 =?utf-8?B?MWtzdktLbmtETFpKUnBnSHpuSVkwbjQxU2s0MmJKU25UMTQ1WWMxTWdJNExv?=
 =?utf-8?B?TGYxNXVsY3dUSXF5dUwyTFkrRHM1cnI0YmZ4T2Joa2JCc3ZFSmlZcllHVVU4?=
 =?utf-8?B?VXFMQlU4bURkbDBZa3lLUDM3MXVHSmNubGtoZ21IeXI4dFFhZ3ZGc1BjYXpG?=
 =?utf-8?B?NUpwMTQ1d2llR1hWS2xFSm9ML0lubHRWajlRRno1NFpVWkwzanczZ1lLSFpj?=
 =?utf-8?B?cUx1NlBZYWFsaWphWXZoTmI2N3drdU4rekJubUpka3RxT3hnbm16aDZ0MnFQ?=
 =?utf-8?B?enB3a2pScy9QLyszeTRMaStoRVI5djBmeHZzVFFUem9nN3NZdmtlbW5wUkU5?=
 =?utf-8?B?S2JjRjhHSU9wbkgvQ3ZLVGhhZ0s1K3g2eEpFY0RhanY5cHdzN3pkV21qekZp?=
 =?utf-8?B?M09ZODFnUHpCaUJ2NXNQQThOcWZsS0NZUElMSGVMMHBhMWR5MGRkZFZPQ2Ny?=
 =?utf-8?B?VytiakNZYWY1ZWlmTlQxUFV2cjdNZHNJTzF0Q1JqNlFWeG8vMEpscTNONllt?=
 =?utf-8?B?VXdyWktxOVM2S3dqRkhJU2NUQUU3TVVNV3g3ZlAxTjk4NThDS2FiUjdEZS9n?=
 =?utf-8?B?YWpQZmdNa2Q3dVRveTRRTzZRL29zcmxGNFVqaSszR2N2dlV1cTNUeHczRkNv?=
 =?utf-8?B?MGVHNXV4SHFOTkxGWkdGQ3ZEOHZlMEVNcGlGK3RRRDZvaVhlTGRPaUtRa1Fq?=
 =?utf-8?B?d1hhMmNDMVprSFpKWDJCam9SQTViK0JPSldNMlAxUDlWdjMzRHVKYjRqWHVH?=
 =?utf-8?B?Y203ZFJscWhLeTN1dEVNU1VqWUJRT1FwYXNZb0dCTVAyK1lJRk9ZT2pxSGcr?=
 =?utf-8?B?U0lGK2hSaU93bDRFYVhXT1k4eUZhZ0ZEZDY2MENDeGlvRFp3dmNCaDBIYXZV?=
 =?utf-8?B?cUVrUXR0T2pJbm1seXR4RVBJcW14ci8vbVJkQTJmZjhtdk14MUEyUT09?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21773d30-f202-41a3-8dfd-08da32633ed8
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 08:58:26.7470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6eXNNeDZtFgSiiXMyDlZZHXg3g64qXhmNjUHeV9YRfth80gEfPUGmmfChOMJYd7LfmVUExIF3ubTE2hENTkfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB4601
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_015835_282441_054D6046 
X-CRM114-Status: GOOD (  11.94  )
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



On 2022/5/10 16:50, Viresh Kumar wrote:
> On 10-05-22, 16:26, Jiabing Wan wrote:
>> Hi, Viresh Kumar
>>
>> On 2022/5/10 16:12, Viresh Kumar wrote:
>>> On 10-05-22, 16:01, Wan Jiabing wrote:
>>>> Fix following coccichek error:
>>>> ./drivers/cpufreq/mediatek-cpufreq.c:199:2-8: preceding lock on line
>>>> ./drivers/cpufreq/mediatek-cpufreq.c:208:2-8: preceding lock on line
>>>>
>>>> mutex_lock is acquired but not released before return.
>>>> Use 'goto out' to help releasing the mutex_lock.
>>>>
>>>> Fixes: c210063b40ac ("cupful: mediatek: Add opp notification support")
>>> cupful ??
>> Sorry for the typo...
> Did you write this line by hand or generate it with Git ? There shouldn't be a
> typo here.

Yes, I write this line by hand.
There must be something wrong when copying the subject line.

Maybe I should find some tools in git to avoid it in the future.
>> By the way, is this patch correct?
>>
>> I am not sure whether it should return with the mutex_lock.
>> But IMO, it should release the lock before return.
> Yes, we need to release the lock.
OK, I'll fix it in v2.

Thanks,
Wan Jiabing


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
