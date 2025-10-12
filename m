Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87BDCCD184
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Oct 2025 16:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Cc:Subject:From:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MIrJzaTY1m4QygFEU2NHAmaSJBPpPCWfUcTHLtzTdyw=; b=TBel+EJ9vKq0Wn2DzzfEn11pNY
	FjvQoMx8G4b+AnUSKXiEQenYCR/oQIVMy1zgMohtwXrQXFgpdoXVg6BbdKB4zMW7KeTGEfFr85Ggm
	ZaBeZJbU9CsyB7kgz6QGo8WP4TUUxa/JmKYYf/Zbq/WEurCyNyV4XBMo3m6AhAqLtVDwDZVHDHw5s
	tZ/R6mMQNPQQK1BnaQniV3AgVVdN8Eom4AF988zmKcZF3aePDVj9OS5uGFHqp8DHiV/1jmYHRMw6C
	oQqY0sLnxI3YkbvCMbN2jU/Wx9ZEPi1HJ1rwQIwl/K2EFc14q6zmEKRfKix0qCPy98tGVvDr2WOEl
	Nt7Qp8Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7yzx-0000000BYOC-0zgu;
	Sun, 12 Oct 2025 16:32:41 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7yzs-0000000BYNs-2Ozk
	for linux-mediatek@lists.infradead.org;
	Sun, 12 Oct 2025 16:32:39 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CFEkcc024064;
	Sun, 12 Oct 2025 16:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=MIrJzaTY1m4QygFE
	U2NHAmaSJBPpPCWfUcTHLtzTdyw=; b=sAwnKr35NzsGUoo/pxIzP3FyZEPs+XKB
	fm6v+L1Ax6CntiUgFiNJd8jgcFFtzbbt4tUQPfh9jML7sMoaTCYl41KmQto0iL8+
	So6kl2e2d/XoLFvwlbRJMLj8lc/zcP6Vm3iCRxuaE68hDX3TMKyOqAd6JphrXDAD
	0KczmekWczUQw8NlRLfFoEzkLnCZt49V71glN2kfM3/bKg640WJHL9ODcMsPu0zI
	ORobAsHskHiaaq5tX2ccIXiQjfVDfKbZRNp/4IVgpM1cGrsWInniu/i/y4JxLZYJ
	WlcY0A9gY2i8ffSf0rkMEG/jrxzeLnx2W8vlICqEq/fk6Mm96exnSw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qfsrs28v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 12 Oct 2025 16:32:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59CDd1I2038211;
	Sun, 12 Oct 2025 16:32:34 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012032.outbound.protection.outlook.com [40.93.195.32])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpcrc01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 12 Oct 2025 16:32:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlYs6y1iWNW/GcsCa8uTR3s4C2eE3C34ph1kZnoeK0FKtIMKbdiLRUvEjMnXRURWPYVqAA0P6CmTCas2BN0r4n9Bl/Op4vdItmJ8aUIwh5DIr0QkDywMKtcqcEkqPk+KtxNJLc1/0eKqYCcHovCxF0zelQgog5Z/pcedbQjd8OYq2nzdXtjinNTtmT2qzlf2mZZ51R8sWAspXlm+ZIr+ZDlYK25FFZcF+3hSVdM3EoXJpU1RLABophGxay3VDRFnOgP88dq3bziGcwastpbvSdOzAz5uzs1SvFdPsBLHRt6L0JGhy5NOyYstxWMyV+IxOdNcrYZqsi3Xl9X8U2CG4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIrJzaTY1m4QygFEU2NHAmaSJBPpPCWfUcTHLtzTdyw=;
 b=VhS7ivJxQ51IV3ZkyR1hNZZ7HI/Yt6Ni/Q2/bDYxCBlcCBK2rgb86eMh7EX0IB7X5LAXK6CmT8M+AoLYv7T/+ctW6dch6hrj/d/INyoLPBzej5mx2vy0hEem5+p8pr4f4H3W0ba5fTcffUY7LmmPdIeQoxHISdXndWJB5TFVes+Kk/4q6pFFHRv7flr0vcUJjUIaXUT7YqGNgLYEDhE7VWmNXEjn9QfJboYs5KRKzw8547R/AUYFRvehclQVLFRjGcS3Fk/0NbNPfTshY+MAmxiXGcB6rtskY0mOfERziJ2vpU062CK0Ayi77UbBn6b6Q1PSVupWHmVU0k3+Zonc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIrJzaTY1m4QygFEU2NHAmaSJBPpPCWfUcTHLtzTdyw=;
 b=wIk3wNrtyLBmPoOhYswLTY1vek6uNyRoexM8iRBuP7i8zsqu9g3lAV2cB2Fo2pnlkJJkEWlHg2w62Sx2NtaE/SyBrE61gGu666fgjvlVAdKU6gFXRy2K+YuA1LpKx0n3/ehllDjk8pUIWn97fi6ZM8ah4RmG3w5PTMucleF/loo=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by SA1PR10MB6589.namprd10.prod.outlook.com (2603:10b6:806:2bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Sun, 12 Oct
 2025 16:32:31 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%6]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 16:32:31 +0000
Message-ID: <ba082ece-a6a6-4287-9cb9-b216b865b8f4@oracle.com>
Date: Sun, 12 Oct 2025 22:02:24 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: chui-hao.chiu@mediatek.com, Bo.Jiao@mediatek.com,
        howard-yh.hsu@mediatek.com, meichia.chiu@mediatek.com,
        Money.Wang@mediatek.com, StanleyYP.Wang@mediatek.com,
        ryder.lee@mediatek.com, shayne.chen@mediatek.com,
        linux-mediatek@lists.infradead.org
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
Subject: [report] wifi: mt76: mt7996: fix FCS error flag check in RX
 descriptor
Cc: alok.a.tiwari@oracle.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::20) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|SA1PR10MB6589:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ddb6b19-2140-49e0-b954-08de09acf0b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHNwNWVkR2YxRkJpMHVLakRUZnNCVHNRaGMwUXpwazl1ek1tZ3k2VkFSSzNq?=
 =?utf-8?B?ZHpaOUU3VitTS3BTYlVlV245di9JUGc3b0J0aGJLU2dEZWx2VWRaMXZSY2kr?=
 =?utf-8?B?dURmOVZRbDVveTdSWEk1NE1tYnpON29uTGs5NW94bFdkSlc3Y05aMmtrNHp1?=
 =?utf-8?B?Nm1IZzVXTU1mOU5UWDlJbm93TmtHdXlkM2Uxb3J0YnArM2pER0U2Z0pjYURW?=
 =?utf-8?B?dWhrWkZjR3YzemVFYU5uRkJ5ZHhuNWtocWtUelNYdUZiL3BqWEhOVmNaeTZx?=
 =?utf-8?B?RXNxajAwaE8wOStBVUZBNVU0b1lleDg5UEgrckY5OFFaUHBkSU9JbWpEL1Rk?=
 =?utf-8?B?bEI2b3VHdXpSWHdZcSsybi9PVUtiaDc5R1ZtZWdVQTlnb0lpWkFjZ0FHTDcx?=
 =?utf-8?B?dndXSTM0QVIzeVY2MjlMV2YvR0FhVGIvajdjQmxjSkdmcEhhOWJabnRnWGFS?=
 =?utf-8?B?Mm1GaWlHWVFNWHF0SFVBN0FCckRmZ1Z6c2dzeUxwUWZ2QVp6WXluTkFHWVUr?=
 =?utf-8?B?dlgrQU5xa3BzZXcwNW5MQmkvVlNVTnB2TlZ2cTViTC9NbFFIMmF4cjJVeHlp?=
 =?utf-8?B?RkN2RXBuclZ4THB3VGkzOUZVTnFham1vZ1RSMk9LU2VFdWpwTDZnSHJKT0tr?=
 =?utf-8?B?QWE0T3d0R3h5NTFYUTR6M2o5NVlxb00xMWMzZk1tM01VWEl4ZDZST0tmYzJI?=
 =?utf-8?B?Y1RIQ0wxbnFGa3VnSUEvWkF3MnppeENqUFEvN1paVUdkSVRoTDYxNzBrNE9R?=
 =?utf-8?B?dWFmbWg1R0pOQndwVmFoSGFGQ1NYZ2NVanAyNHNCSHFCVGw3S0l5bGhYQmhF?=
 =?utf-8?B?RityUmhjRTR1MnpneXdMeGltczhzOWtraWFJcWFpMk9qemFYMDZrMUptTHlN?=
 =?utf-8?B?eXlNaDYxVWo3ajk4bm1qeno3YlJ1WWRSUmxJYTB0OGZ2eVF3TE1jb3E4enlh?=
 =?utf-8?B?WUQ5NFhuYStVRTgwbmhqL1JKVFoyeEVuMGd6TkVEY2VVWEtiU0NzYndNZjVx?=
 =?utf-8?B?QzUralE5d2hUb3p3L01FVS9PdURLdW5SM3NFS0UrZGlOYlBtbHFZWmFObm1k?=
 =?utf-8?B?Z3VFUWkrMzRYWlUzZHkrYnR1endCeG9wL3F4azk2N0MzYWFiQVlWcTQ4Rkh3?=
 =?utf-8?B?ZXFySUZybUdZV0ZjeEl5TUljMmU4bGkzSHNhNHI1Q0VKcEY3bGhNb3pQS0NY?=
 =?utf-8?B?UkNNY1pnSXFYaysxdGsvcHdwTFAyZkIwZ1EyOEIzSVFQVVVUMGFoWlNoSUp5?=
 =?utf-8?B?eEdUSHVoOHA5R1A5Z2lvSk9XSXJPNWtPRmVXYlNjZEVrTTZLSHlmVXZKZTk4?=
 =?utf-8?B?dzN4c3dLckk2cEQxQWRtWDlHMkdiS2FYaTlVM2kyODNQeWZ4NTJlVC85a3pM?=
 =?utf-8?B?UUloUUZ5Sjk2TzRrQkpiUktFd2N6UVV0WTV6cDlVTG1QeHlyT05rQ28zUDJ0?=
 =?utf-8?B?NXhNd1hyK05kWFFvcm1UalNQenJxdlEzVndUY1JVRzRMMnpXY1A3eFkzY29y?=
 =?utf-8?B?eG94R0ttRWl2L0ttalJDeW8vREN4bVNjYzZpMDM0SEZsVG83ZEUycXZjWUhG?=
 =?utf-8?B?MzVJRVRNb2twcEFXbTBqVFJtdDlWTS9ZQU1nYXg4aVlXSWs4bkYvL1ZPY3cw?=
 =?utf-8?B?MlNERnlRWDFuVXhBdG1qVi9HeXR6cVVFRnY3MVQ2RzVacVRPKzBaSnRjQ3Vl?=
 =?utf-8?B?UDBFbGlKNis2cGtFQSt2ZUZxRzlzRUViSXFQd01QaGFFZllOVzR4QXBrdlp4?=
 =?utf-8?B?Qk92ZTJJaEFlcWJ2Sk9lSDFjZGU0NURPakhKM0QxNHUzQmswYTJrYmZlRlR0?=
 =?utf-8?B?WnlCOXZvWXRWMkxGdjg4MFZoV2FsUnUxVzhHc3FjdHRneVd3dWJGa2pnNE5S?=
 =?utf-8?B?anNoYklvdER2WmVVMlUwaFFhaEh0NC9DYUFNUDF4S2xxTnM5dVNZcmlsMWJw?=
 =?utf-8?Q?Huj6SSVdN9rZmmtrfttxN66MGnpFr4iM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG5DeVVMZVk0S0dLOWwzZmNQR05Hc3VYTWtLWDkyQldLaER3aCtDK3JWaTVl?=
 =?utf-8?B?SzlHc3VrYXhPeWtGOGU2b0c2cWl4UGRRNG5IVW5QamN1eEVkRnJjT3dRYzJu?=
 =?utf-8?B?c0U2Q25ka09peFdZaUVqQkwxWnFycGUybEVZMmpoNEVJNHBteWwyaTFicWlp?=
 =?utf-8?B?R1JoYmxnY0o3UXE3UUtGbzZvd2ROVE9jZEtZVnZUTWtwU3ZEU29DOGk2OTV1?=
 =?utf-8?B?bVo1VFBHRndERTNiUFRYaE0xMkRuc1RtdDIwYWtoV1BkQ3lETXowS1pTbldr?=
 =?utf-8?B?bDhJL1VMcWxlaW9uL1M3VGJjOW5RckJ0V25vZi9lS1Nlc3dlTE50YnBhbkdR?=
 =?utf-8?B?NEpVSDFGRmUvNytkTFVqeE5tZGhCQllSc0xNS0F6QWtNVUw2cER3d3ptYXdI?=
 =?utf-8?B?Mk1wVkZUVWJublBUa0tvYVhBWndpS2JUVThnODBkc28wQU45NTl1S2U5OFVo?=
 =?utf-8?B?WHhyODd5dC8vQzF6d2tONklJUllWbEVWT0dNdjVEdG1vdmhQZzh1YkhqYm9w?=
 =?utf-8?B?SUdwb0NxQXJPZ05ORVNoMkxoSjVGYkRuSnJYd1lwWHJhakkweW1tUjFGalRE?=
 =?utf-8?B?S1FXbGViMDVSVmliYWJaQzFGbmx0M0RNRGNCRGQzclM3ZVBiNk9wTVlORVVP?=
 =?utf-8?B?Q3ZiVWVCdzFPUXhFcVdsSjJtaWNaeE8yTDlxMzFib3lhQTUvd0dHbXhDU2RB?=
 =?utf-8?B?TWg2dCtBbytxSG14UmdHWGJEU2ZIWmNtcUt5Si9LRUUwSVVvelhqQ21SVnhS?=
 =?utf-8?B?TFM1Rmx2c2lsa3lyeXZSN0V2anhraHhzOUVIYkhnYUxoZDRaTTg1QUZTWDdx?=
 =?utf-8?B?YW9pVDVJQUUrZzdEaFg4NUI1TjJiMFZCNmpObmU4YWZHbWpXRVg4NnZOZkhh?=
 =?utf-8?B?T0E2SUVsd1YyNVVFd1JiMEVGUlpCZDg4dlpvUzFaZHRITTFPRlhmUDBMWE5a?=
 =?utf-8?B?ckU3VkZEMEdxZFhPU3pNUDFvN2hOQ3lRSlhzai9YNzdyUnJCZDYvSlp0OW9U?=
 =?utf-8?B?RHB5MFFWOGlYZFh2dnJHL3Azejd1aTUwc3Z5eFBXTmQ0SVcvczAzUGN2U1hK?=
 =?utf-8?B?U1ZLaVJ5ekxlNWVETFhReWNuNlh2YXVTUUJVby93YU1TemZXV0xGWnVib3hB?=
 =?utf-8?B?b1BnYTFIMnlIMlkvU2NxcVNxc3NKazBDdlBtbStkTktIZXVJWmhRR3VtSEkx?=
 =?utf-8?B?SC9HazBnZWRXb1hiR2J6MmNZSDJUWm1oVGlzNzFOZGZpYWQ1cTg4T3IxNkg0?=
 =?utf-8?B?OFZ0anNaNUhweE9vK0RNdlZiakdwcDI3Rm8wM2Nwb1Y4KzgwYStqdkQ3dUlr?=
 =?utf-8?B?eUZ1dWY0N21HWmI0ZUZxWXc4NUM1dHlyZzNGNkxDeUhiN0c3WGFzL2c4QWJL?=
 =?utf-8?B?TnhDMm1FY2oxbUoxd1lCbFJwQkllZElBZmJwVThvd0FZOCtiTlFtOFE5UGxN?=
 =?utf-8?B?YUtmTUMrUDlmQVpEM3BRZVkvQUxpUm5xeExsMGM1RnBydy8wbWkwTEl0QTN1?=
 =?utf-8?B?UmVEeWFpQVpEY0RXemo2bUJJNllCVW1iK0RPUVZOV1pvY2oraStEUzI4Rzdl?=
 =?utf-8?B?MDZoaTRxOXZCRnBzaGdwL0ZCNWdGU01TTHlWVk1kTHJ0SXlMcWlRSjlmUUw1?=
 =?utf-8?B?UXVZeVU1cGNYZklDZUlpY1ZVV1BBQ3pDbE5kKzZMWG12UCtDb0NleVl3cElB?=
 =?utf-8?B?SkpZOVdzdVdrK24vRitDVG4vcWpmcVJDZmFBTGZWR3FrSnNUTEh0Mmt6NWxv?=
 =?utf-8?B?eHhhaEVqQkZ5elNUWjZpekRocWcxRUVMYVMrWlFWbFpPaXlkdFRMV1J6M2pv?=
 =?utf-8?B?UlZHZk9HSmRVcERBem5PeG5HNXprOXVESzAvKzFRUFBWaXVKM1pUcDdoOU4z?=
 =?utf-8?B?UGtOUnVORUs4MExOTVJiSW1pc0J6V29sOTM1UnFtVHFjZ3JvMkgrQ3lJQXBp?=
 =?utf-8?B?OHZZZVhnQUtaSExnbFppVjBYVXp5dGJBeWYxSGRtaFdGZzhMWXJURlczM2Qv?=
 =?utf-8?B?T1Z3eVdmZzYzRzMrdnNkV1lVaG1TZlV5bWlUcnpxV1hCSlNITURBMEhMRXp1?=
 =?utf-8?B?NTJ5T0d0TnQ3am1xOWE0cUFwclFBMzNWc0tMZk9KcXV5Nit1bjdRM2xFNW90?=
 =?utf-8?B?eEx3K2hmZHhSdER0SlZ2aTA1aVg5eG9XbmtjKzBocW9aaytCWU1zaTNneFdK?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: BTvtXvVOQnn/y6motRCTSa1AzQlF40W1QOIKIVST2Ht71DIEioygqKZbKUvz+jIDNnLDUV4hxvEDmIS/j9cV7MFPFjZosgKmfuat/HI5XAto3dzaOPyF8zfIpCvkWSPb7vFfozH2x9VqN35VuLd+gTdP29VcwZM2hW5Nu71ELBkfrt2rj7ikjodJ//1EW53K9+yKzt8IpA9SIciW8BlsmZ43TrYL0/YCHYY+LvN/k4dowhgKRYJ7NAp2poGo8D53oz2DTd7+Yt1u2eBLDosOyWPkIY2WIJQSHdWtwQoVGz8V/24kp4OvZ5bR+06erACjVdw74t8tQuL9wR+eNSck8l4G/f1DMzTi05GW+dwSHxjozDu4Y19Lwyh0KnI9Yifzhl+Ca4cQAnjcdvqbEItcE2HVmjitwz9l4XZrE/jf4jPT4VcoGXy+ydU387rXxM5E1PdPLo3Z0f9tBePyHXXOMEym+vvSdeTVHqJiETpy/NQU9oSYZlNhEvRi6t+vJKeEFs5xCv1IiiuLQI3hPXIswLMMXkjk3DHotwTcx3Ab2Pp4tEgx86GbSGCcHAXyqqICuIkNXd8XBmjP9dFDwXeUlFIzNE2xNM/XBmYBPZtekVg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ddb6b19-2140-49e0-b954-08de09acf0b8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 16:32:31.3760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xv16FmVx0YvGg6j3KUXR/l3HKxUkC0CVPmRRONnAgsOBuSeQ+KTbQj54hQ3n9rrRGIrXJlcArMkwE0Bb4x5XvUFTc7tHzkn4/GKonhGAe6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6589
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=671
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510120087
X-Proofpoint-GUID: HLveuf9XgtcE-t5YTkzpr8cnocmGB7Th
X-Authority-Analysis: v=2.4 cv=APfYzRIR c=1 sm=1 tr=0 ts=68ebd823 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=jKqzEdCAnPT78caQdSkA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12091
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMSBTYWx0ZWRfXzr6TYfWmd/Cr
 wEBwYQRUdfQNRVlBfsc9y+Ro7+NKHZ6kuJPUAiYZeGzradpIU9g2A5AGRUSE/4xVLMuIdIteAcv
 0UKPEcRKEX/4Ocl+ZDw4Wcli56oZAY3vIKLbsdDpBmeNznhQg4qiSD/JInQW/C58bWzwr8je8HF
 ujac0sJ4ubVghr7E7i7XHg4LdCA87JuRDmJyWuwrHx8d/QzkeF/igiDy3ScN4eLQSfI5QfWY0SZ
 tztcnBQXAA1D6LepCY+hbdho8xtLnqwKhPMpfAnGQfibpcPOagvY1Z+6CKwN2ZWbfflaZdhqx8P
 Z0Ab9FqAtb5amhDmvYydqDvySiXI34gDzGiD2jhF9tJGgpaY5WdpW3CU0XSk6TvW8pRdWolN9fg
 XxJHFqbQryzNatIqn9hBTk4hMac5dBS43hIpdVvfZsBoHGBHZhE=
X-Proofpoint-ORIG-GUID: HLveuf9XgtcE-t5YTkzpr8cnocmGB7Th
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_093237_080830_91E11ACD 
X-CRM114-Status: GOOD (  13.33  )
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

Hi,

While looking through the FCS error handling in the mt76 drivers,
I noticed that mt7996 uses rxd1 to check the MT_RXD3_NORMAL_FCS_ERR bit,
whereas other Connac3-based drivers (such as mt7925) use rxd3.

According to the definitions, MT_RXD3_NORMAL_FCS_ERR is located in the 
fourth
RX descriptor word (rxd3), so I prepared a small patch to switch the 
check from
rxd1 to rxd3 for consistency and correctness.

Before sending it formally, I wanted to confirm whether this 
understanding is correct.
is mt7996 indeed supposed to use rxd3 for this flag, like mt7925?

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 
7 (802.11be) devices")

Thanks,
Alok

---
  drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c 
b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 9501def3e0e3..59744e5593b6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -527,7 +527,7 @@ mt7996_mac_fill_rx(struct mt7996_dev *dev, enum 
mt76_rxq_id q,
             !(csum_status & (BIT(0) | BIT(2) | BIT(3))))
                 skb->ip_summed = CHECKSUM_UNNECESSARY;

-       if (rxd1 & MT_RXD3_NORMAL_FCS_ERR)
+       if (rxd3 & MT_RXD3_NORMAL_FCS_ERR)
                 status->flag |= RX_FLAG_FAILED_FCS_CRC;

         if (rxd1 & MT_RXD1_NORMAL_TKIP_MIC_ERR)
--
2.50.1

