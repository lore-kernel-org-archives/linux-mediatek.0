Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BF1CDB463
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Nov 2025 23:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Subject:From:To:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GxF+wHtcCF2fj3Rv4cRMaO6vQG0s8vpv+5nLd8BX//Y=; b=z7tFQmitwYyFIZ
	YrN9zRcyf1HztjUonGlxLBCzllAvzOxKUe+j5YoV1+RqrP907Ns0z7FfsWuL9zelUm0rAZwWPhU5X
	DzVOETW1jkW6tUTQ0Jwozdc/o9/D8lilTc6t8A9rL/Yj1+IyvzaTTCdhPBgAHu/mY1j69mSZbMEe4
	GHGExdAXK6Lb5Adb4Vv2oBJGEI2GBM9EdgEn64WsTPvKN1d86vaZMKB0NRttdpaWap9rPZ1bc7ZHW
	XRPhicEKjbNxS3bjmG46sZO36KhnkWxbHN/Ja8loUY0Ltra/FQ+h9nFIxq1NW2Fe2amhXzZXuYQhU
	c7bg/sfYoU/QpFTl+N6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJh69-0000000BJPK-3v0t;
	Thu, 13 Nov 2025 23:51:29 +0000
Received: from mail-francecentralazon11023103.outbound.protection.outlook.com ([40.107.162.103] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJh67-0000000BJOx-1QS3
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Nov 2025 23:51:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDeHG/W+Vp0omv/Cy6Oy1BmxjaXmgcSWoTBnEG2qyybDURUF2NtLUxxGTVF5Vdu7q7hazIUrLJN599Q0++l5Q8dI0HRIe92eypfKnh+vXJBs/skMDbh7uzyFAsS7V08jjR2SAVJ3LfyroH4zqmNR2QWYTk/lJ/NJZoDD3CktSG2TNTlruubox8ZQCEYzOjDXqXST/BXJoQA+tHhe23Ogtm4REJJRF8CTueKVFNCf69xQ8sWD3DZNPDrFYNH66cf3uhn3DT6WReJVP+eDW2mhh+r/26gmnzIMEL733Jd5T0qlzAH/mey6xg3nIQnfAp86QcDmfb0+e/4qETAsO9ixEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxF+wHtcCF2fj3Rv4cRMaO6vQG0s8vpv+5nLd8BX//Y=;
 b=okD9cFF59QfMHqkC/MxCCAKiK1rTyo9ZUqia8plAyaosHebCeSKcJCbnZl6yezaKGuM/ivVZvX9aF6iFD7tyzNwUEFiE9nY/ci0nh7B8J89mAmfsya/iFstZT/ZeyUbKlmN+/4WxgZXvafwhF/14vTajU+q/EolAsiL0Nn850TbK70t7apad5nNhfTE8EZQ6Bt6XWAsc2bR4copnUUcZTM5cm6RqcQagWkNkVPW77wVDDdyl4f6jX2xd/eg4TLfrpE7Fl1KLWM0r/WOo7bnWHKcg2AhBLvACw3uxUC4tMNjo21Y+/1XSNZimd1q9E3eM9oOuDtjj0Z3f7q9WNQoQew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxF+wHtcCF2fj3Rv4cRMaO6vQG0s8vpv+5nLd8BX//Y=;
 b=CYMx1+kCcHThP0+E10U6c5ovKBHjLOC7oxVy2Ek7ObFBpGpabO+YSSx5Wwuu0MDyuPl/4Q6Q/DKI0l5Xpwoy9rNnylQCnIoGcG36QB4LeTY3ldrJ2Qt0F0Gz6uNH0kfo8GWxxop+RB5JCSryvEetgJ3JPecFNRrunJVjDal204ZH7psQ0NPJKY3qOqTzOX3dLRNn9j8nvKgz4A1cnC6aZdsvj6hWoPLSRhhpx/KnYXGrKzZpcK/M0KWthNP7dPw3BMkt9d9P8GW2ddSlU3RrwqcutItKon6/PE1X9RVeo0g3SYMmwfGeIgMxpH8Nfpbsprj/TN7jHGSlzYbF5aX8Lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com (2603:10a6:10:576::21)
 by PA6PR08MB10548.eurprd08.prod.outlook.com (2603:10a6:102:3d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 23:51:22 +0000
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d]) by DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 23:51:22 +0000
Message-ID: <ac179fc2-4744-489d-8353-55caf95cc7bb@genexis.eu>
Date: Fri, 14 Nov 2025 00:51:21 +0100
User-Agent: Mozilla Thunderbird
To: linux-mediatek@lists.infradead.org
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
Subject: Pinctrl for EN7523
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF0000385C.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:c) To DU4PR08MB11149.eurprd08.prod.outlook.com
 (2603:10a6:10:576::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR08MB11149:EE_|PA6PR08MB10548:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fd6cfbe-0d28-4805-1861-08de230f8cb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUlBNWowWWc2Ly90TXZ1Y1NOOXg0N3RGRDRXY3BheEpibmVycnZVeUNyUmxY?=
 =?utf-8?B?cGFGZzZKc1pOcWJlajRpa1hBby8vZGdVTmNsZnZGbVUwalpTdmlFK1I0NDY4?=
 =?utf-8?B?Rjd5OUtucEFKcml4UFZXbTBOd0E3UXQvQk0zTGhGZitlYS9uOHlkbklQWUZQ?=
 =?utf-8?B?R21lcTN0SzUyN3FsZHdFenpDRU53Q2I4bGd4Ym1DKytrZDI0U2EzOXJkMTFh?=
 =?utf-8?B?RURDMTdDY3B1cFpsRVRjaG5mOVpHQjhqZTlJR0o4WnpDZmJ6OW5vQWMvTnlm?=
 =?utf-8?B?UWlWMmpVZ1ZUSE0zbkx3Skh1elZKSFdFTkEwZmlUVXFYNzZVVERTVU16YU1N?=
 =?utf-8?B?M3hsUWZhWWpGTUNVbVJ5Tjk0N21DRGZyRXdPSlV0enRxQjdwUTd2Vk1wSFhh?=
 =?utf-8?B?bWlxeU4zQlV6SEtzbU5ER2o2OWpudGhWUUh2cW5zUWFlekVNaWFqU0ZFcUxy?=
 =?utf-8?B?R3VMR1VKbGxvRkFsdUtsZmM4RWRzczZlK0xrdXZrcDMxZGErSjNVWVFuWVRp?=
 =?utf-8?B?bUhSaStKV3VlVk12azhHWlJGYmtmVm9ESWlhc2RaNnY4WDRFcDM1QjhxbVBE?=
 =?utf-8?B?em53b1JmQmlZZUFFemlzbVRqOEd3WG9vYVpLSlhKMXJmOGwyUWl6YTZHSDVz?=
 =?utf-8?B?L241UFg4eitKZ0l6UEN0RWxyaGlnNmdOd2pjKzBKampGdFRUOXRwSTBqa3Fu?=
 =?utf-8?B?bmhUR29tY1V1aHVhT2tQMUp5UEJ6d3NvYm12ci9hMHVHcVJpcVBEaDE3U0VR?=
 =?utf-8?B?MnJ4NEJ3eUt2N1RkaG5ES2Z1T2xkeC9YZVUvVTBaK3ltemhMdzJqU3h3eUpZ?=
 =?utf-8?B?VHBORVlCWUZMU0QrdGFnOTBpNVppMVhzblpDTEkvK0pBR1VENXptRUFHanlY?=
 =?utf-8?B?em9nYVRYQlUzRlgxTytQZVJYRU1CdHNEenIzUTV2bmJ6Zk5uaHU1WEZSbXI5?=
 =?utf-8?B?WUtaRm9nK0ZhUm84ZE9nbVZhYmxwcS9wQk1TTUZseGRYRjJzMVpreWFoc3JS?=
 =?utf-8?B?dU1DbU0zdm5USXZaTVZ6elNnc1hzMDJEMmJGUHNIazdUSkJtcWhLcGpNeVNt?=
 =?utf-8?B?L2picjRrODZveGRNVWJSeThlWWZFb2ZKalh5V0lmaHRWOHBvRmxCMmZ3YkNU?=
 =?utf-8?B?VlhhblVTM0dWMDVLNnBldWRleU1RR0lGekNnbC9sM3VuYkMvRWlQRWJmZTFU?=
 =?utf-8?B?ZXV3d2dVcnRkZXNlSG5jTTdyQ2lveXBOTzZiazBMUUhPRUpKUDlrd0VZUFEz?=
 =?utf-8?B?RzJCSzVmN1l2a0xqRFhvNW4zMlpkNHBMOVN1bEhtclJWRzIxajZxRk4vOVR3?=
 =?utf-8?B?R2JGcTFBTTRvYXdHejNyVXFSQkZVQ2tnMTVtMDRIS3ZuQ1RtM2hOdkEzNThs?=
 =?utf-8?B?TDJhbmEwdS9FUTA3bThQZ0VkWkhaZUk3Z3NjR3pRSDdvTDFSMEJxbFRIbW1S?=
 =?utf-8?B?L0NTS2xVWlRNZzZCZFBCaXNzYnd0WGZSelBoa2hPQmI2b25MckZUbUhOS0NY?=
 =?utf-8?B?NVQ3QWVlSG1nRGdwREZsUmJKaDFIbTlHR01SVUJ3Q2k3WUFONVExcHlVUFYr?=
 =?utf-8?B?TU1DYkliZ0xvdGVjdzBXeExxUi9uWWJrOC9uZ3NnSGlmN0tIeTJaV1BuMmFQ?=
 =?utf-8?B?c0NLNmt2YS8vZVNMTHFqcG9kemx4Q2p2a21CdlhXWUhwS1hralJRb0RBMFVp?=
 =?utf-8?B?akxOYWRqUndQZmxPV0FabDQ5TGhiUEw0RGRYQ3lPYVlxVEVCRTVWZXhteEw0?=
 =?utf-8?B?K1lwVWloZGsyYjZLbEhsZ1hLdnRIZURaNlRqcHBkeEhGUW56RWxpeTQ2YS9Q?=
 =?utf-8?B?UjVVaWJ0YTh3aXhxcC8yV1RweERXQXo2ZC9jQ1pZUS8xZEhvM0kvNVluei9I?=
 =?utf-8?B?cHd1TnMvMHREOVpCWXlnWTVXOFltWWk2S0o3T1hBNWV5YlFqZ2dlaXc3R0Fs?=
 =?utf-8?Q?a5/oBLq7PqG7iGBEjAYYxtZgs8MchLcu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11149.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXdiMVozaDFXYUFvUXRTZWtoeTVWTldKMlNTQkRNck9iSzdaazNwdTJLNWJx?=
 =?utf-8?B?K1FmaU04S0JQVExDclJQNUc3OFdpNTdLbk5HMzJ6VFJoRjJpd2dRM0diZmFL?=
 =?utf-8?B?TUVuYUxzNk1DcDltckdRNi9icTZFaVRlL3RPbWFsWVJKd2M0SmYxeFhTaU0y?=
 =?utf-8?B?K0NBNlo1SVNJWFVDUzJJSTd1b1RRT3MzUHdjdmVIWlZwWVkxZ0REUDNmVVZt?=
 =?utf-8?B?OHcrT1FDeW1qQkQ3VkI2NzVaQjJmMWlPTkwzVEdvRXpONndvWkQyaWRnNjRZ?=
 =?utf-8?B?anBrOEZreDFWd3Y0OEU0K0xDWUlaRm5mYkRIcml5eFFkUTNTV1FMOXZFbFor?=
 =?utf-8?B?MnRkaUpBNUlsaWl6K3I5bUpUT1h3Q2VyT0dmczF6dWZ4YVQwQVJQZXZ0MXU2?=
 =?utf-8?B?UHc0bXIwZXlXOTFJNnlRVzJrbGFhL2lHLzA1YlFDWDZlUEs1MGd5Y0d3VWxX?=
 =?utf-8?B?UzNlME1MSmpNdFoyZ05IWGVwdXgrcHFjT0FhUHovanUyRndWRENBeFJIZThs?=
 =?utf-8?B?M2l2QUdoSjNhNFQwcDRyMFM3dlFRSVRablhmcWtlc1NxZGJraHpFTlJrbW9v?=
 =?utf-8?B?MzR3TEpuQUNSNDN5L29PUG9CRXloajZ1b1IzWStQbFFNSEh3LzdzNzR6OTNM?=
 =?utf-8?B?Ykpnb0JyTCtzMk10MGE5QTFQaGMyb3E3UjNHbHZUdkNFSzVmMVBscXA3REJs?=
 =?utf-8?B?VUl6RlpFaE5XQUJQbVVlYXZtaEJJUVVyVkk2ejdOZDFPYjBjRlVQYmxrUk03?=
 =?utf-8?B?dnRPSGRWa3pmTlJJOE1xWEZwcjJIaGZTSzJPUWgxMzFqVzRpRGtrY0pjZ0lS?=
 =?utf-8?B?ZXFxeUkrQWxkZ3dGdjZMN2w2SnJqTjdCYVFmeVBsY3BMNVRsbER6ZWE2V3hL?=
 =?utf-8?B?a1BYL2hqcEFkMXZJZUI5dnRLT25oangxMy96UWI2QnA0RzJ2NjNKcEJYbG9q?=
 =?utf-8?B?bUdxemo0eWM4VGY0c1krWUdMb3cvUjJvbDNBWnFXVHFRVVNuSFdwMG50azRU?=
 =?utf-8?B?Zm9rbjZPZ211VWJkNTJIWGVZQjJlL0pKZThDbHhXa1dNSUZDWEJ4Y2c4TGt2?=
 =?utf-8?B?d0RxR0RoMndYYTNCOHVUc2tqNnBUVWZTZ1krQ2pHU01HNW1UT3RwMWFGV1Bu?=
 =?utf-8?B?US93UHc4UVBaNVZBdkZzL21BTXJTdmcrOGlYUE9idU9IQ1RGTVprM1E4bk1V?=
 =?utf-8?B?YW9CZWlyaGhqZkJrT3lMc1FOMktjMThJcndSTG1DRHlZNVNPTUFyRW8vUGN0?=
 =?utf-8?B?OEdhd0FiWUFLNHAvYko0VkZPL3VudmJFdXhVU09FM3d6R2FOR2Jycy85M3N1?=
 =?utf-8?B?Rmt0QlZmQXp5dXE2YWh1dnNFVkd5cDhFZVhNclhCcTlGQnBCdXJkMG0yeUFR?=
 =?utf-8?B?cVdwcFdhNmhFY3VEWTBDMkRPUW5JdWd4elVyRDFtK2JtTEhRMG9EeEhSMjlv?=
 =?utf-8?B?QVJrV09WTmNCc2QzUVh3YUgxckhxdUJsYndTUFNaWWRzM1ROSzNjemExK3Ra?=
 =?utf-8?B?WmVLQ2F4d1ZqUFZGaGQwd2c1My9UaEZkb2JxSnNlMFU5RTRiVUJCTEg2ekFB?=
 =?utf-8?B?OG1QdzYzSVlPVUN2eHBocllqbVA5ZFRVbnRLTDBRaDBRbDh3OWhnTXZNbCto?=
 =?utf-8?B?dzlNSk9SU2hMNG1nSGcxOUNVeXZ4TTNuUnR6SUJ4MkdBNDd2M2JCQVJReW5o?=
 =?utf-8?B?ck1nNUZiNTN4UEVUbzdXME40Z1NNSG5Wc3ZTS2o2QTh2dUE3UmlEcnd4NVpv?=
 =?utf-8?B?WWN6Mk92bklkVm9FYlNRMGZyZHQ1ckVhOWY0TVlMM2FGa2hkOWtmR0NmSUQ1?=
 =?utf-8?B?S09xYjRiS0ZNSnVMM0szOEo5eUtVMVp4V3V2S1lJVE9qLzIwSExWMjE2czBJ?=
 =?utf-8?B?akZYNy9mVlphcTNkbnE3bitSZjFrdGNvWDZCZWFuT2FELzUrYWtKb1ZhTnVX?=
 =?utf-8?B?eWZXOW1HRUdvb1c3b3Z1QzNSSEM1ck5vemZSY3pUNjhoNTBDQ1FhcERXMGxT?=
 =?utf-8?B?WEMrcUlDSkE1ejRTOGcwT29JRlhuaCt5VzhDdWpVY3l4Y2Y3bWNUT3B3TjBp?=
 =?utf-8?B?MlA1YXdKck5wMWR2T3M1MzlzMGl2eHhXYjR2dDFRWDVZY3R4TUZvWlg3SjVI?=
 =?utf-8?B?cno5clg1aGZNTXJJdVM2TjVQUU1MdGtYakRnQkVzZnZlcm14SU8rZ2xEeU0r?=
 =?utf-8?B?SkE9PQ==?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd6cfbe-0d28-4805-1861-08de230f8cb2
X-MS-Exchange-CrossTenant-AuthSource: DU4PR08MB11149.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 23:51:22.6627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZoE61F2xUNORVow7rY+msR+YWahYWGNAhUQfYE+FSu4u/TAW0U6DWqQVlT92qkhw3Btel3KZ+DMZddlVMyKpl2ex4UQGHzin4f49tJNwqyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10548
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_155127_389392_91901962 
X-CRM114-Status: UNSURE (   4.45  )
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

Hi, I am working on EN7523 pinctrl and it turns out to 900 lines of 
tables (25kb). Should I just sprinkle them in airoha-pinctrl.c like what 
was done with the AN7583 support?

MvH

Benjamin Larsson


