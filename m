Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3DFCDD0F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 21:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IiMeHrjYw9G2nOHISyuExcwiZR5f0dz45CAYDFobhw=; b=yvTnHFPVaNnAsk8ws6JMqO0hjN
	P4u251cIysSxEsxeZNEHFkctfEGiK05XJc0+H4eL6xs41BsSJXznC7F1pFQse8gf0vjBxinviFc7G
	m/v9rpYdE456K3XzYZtl1iVp9ulUqkDGFZU4kwKsSHiWSwIKNeVM1+IQircK7pSUNi5LtQsjOW/xw
	lmDu+RIkBkuCmJ6KB4eTN7wV8+8ICfqdC/dJxjonPcVmqEozXnWyXeghjXKCngQPPD1pkoaxGD3lS
	1MHXAaNTMqX/PTdYsdpXHgTa1SnjmSu+CAQYCYXusEvDUNX53mtLslGrpFeeEA/QocX8+NMFhUln9
	KIfk9gwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3MLO-0000000CCqF-3F1J;
	Tue, 22 Oct 2024 21:23:10 +0000
Received: from mail-dbaeur03on20730.outbound.protection.outlook.com ([2a01:111:f403:260d::730] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3MJq-0000000CCig-1ANo;
	Tue, 22 Oct 2024 21:21:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fP4q5MLbtlNF5IRNHBNNI4RoiXAZ8cBQ2ACWtmbEYN7G0gnsIbgZLrVW7uwzWu8sNS1fJVj/ifwqBDVAedvmmMvI2D9nQdi87lukS9MLhHb2WInYK9XgOa0X68dvdS6cpGQ+a6xLo4qcPER2SqFcx1MFb+dbS2+kz4FM1dvDDw+tuhHd4Fl85Z2zONTTcDWbBzHE8a0PlVW6wrdR/STqXEavoUc1FfKVHe+W1l9XUPXWwgN7VW0+8+WFtgdILHCZvpAiYxWC8WJCFomztZ9A+CuuWYyFqsMsPI0rvIgBUy0rXftTgiNcpP8UhWKWHA3XBryeePfaIm8u11H7T+7APQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IiMeHrjYw9G2nOHISyuExcwiZR5f0dz45CAYDFobhw=;
 b=fKsiuahOntqIqh6cKWLYFk9gYkJ/SySBAuGcbwktlcHPvPudd1Brm0xvo2uCFaREhNIUFNDBreI+VAbByMkyVIpPiT/Y35sA9x/VqKyQGCU7E+ybP2EpuV7/F2sU2Por0nHJOVuaOMPg22rNN7SvhT+O7RARJ0QSn7Ot2noU/7ySYWOkcPdnHnflrYrJuUWFUjkcz2xWPMsDj5/SMYcgRm6YDxFBNK2YnSn6EQy6YDFTtsLzjXdWGiewHBtb2ODUCVxqUYhW+xPmOCJEcO4IEvL4b5wWRpzIYgNx0EzaaiQkGsELfxEb7DZry8VnYQrrdVWlAeZTVWUTHGntKxfwTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IiMeHrjYw9G2nOHISyuExcwiZR5f0dz45CAYDFobhw=;
 b=KwWoFx+r4yMBh85/ynIC2MbpjPdzpEGUVZXTzo40O/N3U0JFFz9xedVhQuktyy8Bj6/W3cwEQF+QOHyw1tf+BjQnf8LIiIm/sgCghOLk/oGYup+lUzweZtIzYnd9yUO83xSHtD5iXLiOmCA8/c9oYryKGHCF+R0/QJc3ziNXsxE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com (2603:10a6:20b:2db::18)
 by DB9PR08MB6667.eurprd08.prod.outlook.com (2603:10a6:10:2af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Tue, 22 Oct
 2024 21:21:24 +0000
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35]) by AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35%6]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 21:21:24 +0000
Message-ID: <a7743abb-b9b2-4a3b-a181-8e210bc00973@genexis.eu>
Date: Tue, 22 Oct 2024 23:21:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] dt-bindings: pwm: airoha: Add EN7581 pwm
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
 ansuelsmth@gmail.com, linux-pwm@vger.kernel.org
References: <20241018-en7581-pinctrl-v8-0-b676b966a1d1@kernel.org>
 <20241018-en7581-pinctrl-v8-3-b676b966a1d1@kernel.org>
 <20241021190053.GA948525-robh@kernel.org>
 <2da79425-0cfc-4c73-8fb9-bd3c92aa28d7@genexis.eu>
 <20241022210858.GA1565063-robh@kernel.org>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <20241022210858.GA1565063-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF00006633.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3d5) To AM9PR08MB6034.eurprd08.prod.outlook.com
 (2603:10a6:20b:2db::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR08MB6034:EE_|DB9PR08MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d55c064-f47b-40cc-22a6-08dcf2df7bb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkJoZUdvYWJvVEw1cE1iei9yM0Qzb2dsclFDMTQ3cnYzdXI0WkQrRFZneWV0?=
 =?utf-8?B?L2RXSDdGRU9OdmFBblhob0M4OGJrN2JuMkRXYVFuRXhTWWYvNzIzMjcwMERv?=
 =?utf-8?B?c3F0bUhTdG01akVXTU15NUs0S3BPSEwxazRXb2FGamt1amwrL2xLZW5QTlV1?=
 =?utf-8?B?dTBOUE50UnJRM2NyQWJIa1BSRnAybXlDQVVvSmhiUUc3aEJ5Kzl3TklLUXdh?=
 =?utf-8?B?am1iSURXUWE1YjlYTy9UVFYzaVE3SmlsVFhBZFFyN0pUc2IweWFvT3piTjl3?=
 =?utf-8?B?UFBkT2pLdWZOUGc4Z0dqVXRJNk9KaW91THYzNkFydmpKU1NFampkRFl0bllN?=
 =?utf-8?B?VHhvekQvcCtaOTJ5NmlhNC8yWVd2ZTZUUmZSREdoWHdIa2FNRnh5Ym15aXJi?=
 =?utf-8?B?OEgwMkNzZjYybEpzQitad3FHallEaFhTaFRaRG5RdHJOdEpNand6VTNqYjdC?=
 =?utf-8?B?cmtNanV3Q2o3Y3JwMEZ3UHNSbG1aTkxhM0VRUEpWY3JwbXI4cklXS25ZNDJk?=
 =?utf-8?B?WVRqS0kyNkREaDFuQlFsTzFiS2NKZ0J0di81Uk05KzdDaHJYVVpZcG11TXIz?=
 =?utf-8?B?UUI1dGtJTWVEV3ZML1J4bE81Qmx3c09qRlpaL0hTOHZ0b3laRGFjRUhRMUFK?=
 =?utf-8?B?bS9HOU40Q2dtWFk0Y2YrRFdZanBpa0FWRXlrMWZBWXBZc0lvTXFNSElGaERi?=
 =?utf-8?B?bXFoeHpvaEE3QXY0R0hXdnhRRnVlN3VxakpZOFUvcWZYeWQyRS9ZZGplck44?=
 =?utf-8?B?WTJSY29iMVY4MlAxUE1sQnhHOHl5b01WeWtjN3hObTNlcWNVcDdKWHBDNWJ2?=
 =?utf-8?B?QXdMVGczNnhrajZFajlHRk9WalVrcGpOc1lVdjdTNlIzTGZRbFB0MENuWTVr?=
 =?utf-8?B?WTNOS2o4OFgvOTNXUmZNTUhkNjVkZGJDekxPaFdXQnhlenJiNDFWRWV3cnFY?=
 =?utf-8?B?TEw3ZlVmNjMvU01zbFlMUnUxMG9yTlZmNU5wRnVBNFFrQU4vNGxlOHA1MlVV?=
 =?utf-8?B?YUkvUytFME1Pajl0MlcyVmRhK004YkwvN3Y5UjlGYlMrMFM1S0xudFRXSjdj?=
 =?utf-8?B?SU9wVXgvMHdWdVRqWW9MT1FyVzd0SmJta3NVZmJTTDdNSzh2dzdGRDJXOE02?=
 =?utf-8?B?Z2JERjZOTFBXb09HQy80K3FvRjJHRUV6TnJWNlN4VDVnakxWaWhnbWYwSDNR?=
 =?utf-8?B?NEh2cjYwb0dJK3ZjYXJITzdhSkhkM0tVVFBFMjJkMDN0dWFxaUh0a0ZZMjJs?=
 =?utf-8?B?SU1LS0EvRVJQNzZYdUZHZWE1SDdCbFljWkcxays0RjN6QUNnNHpIelVBeWlQ?=
 =?utf-8?B?K1RJb2duNUdRTkZPVjJjSEh3b2pIcFRFU2FXZHhUOGZqRUtqK2xpMUhiNnJF?=
 =?utf-8?B?bGVSVmFmUzEwSVpiemQxb0I1M1pkVEdMenN4N1VjUkZzV0VFb1lXMFhkZlB4?=
 =?utf-8?B?NXI1VGxZT2Erb1dDMGhYUGFXYS85a3pHamF1TDhhZ2t4bkFTSjlyeHJuV2g5?=
 =?utf-8?B?MVEzQWRzR1Bsc3lGOVhmaFkrdFhGbDNWRGdGRTNCZ3F2TWF2d3hKbDZpUkZN?=
 =?utf-8?B?R0ovQlJ3emh2dC9QNVdaWXlHZDM0bVFSdXpqcUNHR0gvTzBZZDNrU3RUV0ht?=
 =?utf-8?B?RlZEOHFVY2lXNHV6K1d6bkFsT2ZWeGxoQjNrRXl5aTlqMmE4OVNYUlRSN3dz?=
 =?utf-8?B?SytESWhkOHp0RnZuMzk0RjhqUVhvMEdGaTdBSDUrU0VMaDVCRTZtL1E1Q1Bj?=
 =?utf-8?Q?XXWu4uNd07KTah9olmyqzIdWN+bm3e2UMdHIBE5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6034.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWhqMHU1eWZkZGxiNXovdzdLajF0YXQ1NER5eEhWQ3pUWm9YZGVJL1lyMDZ1?=
 =?utf-8?B?K0ZrekVtdEVDNzJYYm80R0hUazlFaXJ2OXBpb3ZqdFdIaE5rdHR0MGIzYWVE?=
 =?utf-8?B?WVpFZ3kySmY4TUJzYXdNNDdzRmxWdmZ4b01tREgwenF6dU05aGpLNzFYYkEy?=
 =?utf-8?B?RHRWWG8wZ2R4Zit0ODdBMS9pcGVUS1FzY0EyS21NMGkxcWhneVRTTW1WL0Nz?=
 =?utf-8?B?ZXZnOXV3cXJGMjRmeDZ3Sm55Rlk3THdvUXVhcmZnZm1MUzgxMnJVQUlPb2x6?=
 =?utf-8?B?QS9MY1pEaHpUb2Uzbyt2MVhhOUx2UEpIZmgraWQrWnNPeXhxTTNiM3EwR01S?=
 =?utf-8?B?cUNUREE1Nldxclc0M3NOdjVjcHM1ZUs0VFpnYjBhTVhVbHJQaytmRWRVYm1D?=
 =?utf-8?B?ZGxWNXpkUSs4cHY2U1NPZTNialMwckI4MzNaUExNdENkeFRQcC9zVEFNdGli?=
 =?utf-8?B?bzVDKy9XWlRoNXNVMExkclpWUVphN2hlTml0WStUek1GZXhGb1ZQYm5YYlBF?=
 =?utf-8?B?aEloYi93QXFMeFVUVlNDcTMzOC9DN1Zha3VyYkswZEI4WW1xbmtTQnZyZk1i?=
 =?utf-8?B?b1lLMzkrQjRvQzZVbVhhdDlPNDhKaENNTDMzcmMxQ0I2MWlqWUhIdFJFZnlw?=
 =?utf-8?B?T1BYSWhpNnZmcmQzMUZIelRGZ1htMkhMdXJtMTZVc0lCMkU4eEFRWjc1UHdC?=
 =?utf-8?B?TGJxMll3T21KR1dMZnNIQjVqQTdFRDYyRzVXTGNDYWVpd3BPVmNGNjljczF3?=
 =?utf-8?B?c1VXb1lwdEcxYWlZUlZJM0xvSU9rak5mWGR5VEk5MDNMVXlCRWIxcENLSXhz?=
 =?utf-8?B?TlkvZmtNVmU1bVNBeHQ5VXpvMit6OTdzMlRwaEJnK3FOVDhKa3ZmYlBUdjJY?=
 =?utf-8?B?OFQxdkdCTm1nZFJrR3B0YUVDd04yL1pJM1RKYUNsYlFMZmtZa0lFUHZLTzZr?=
 =?utf-8?B?VnlKV2Iyenc4STFRTGgvS3VNQ3dBNVRHYUZEaldsOEdXWVNrTFRFT3NqTmk5?=
 =?utf-8?B?MFdGVkhWemY5OVVoUDNPY3ZQcVBQRUxGQnM5Q2JiNVFCODZPNUlIMmVZLzh2?=
 =?utf-8?B?OElEM2lSUnpoYTlYZFNsOTlGWGxjNTV5U2FlN1FQRzl1VGlwU0hWWS82OENI?=
 =?utf-8?B?TXo4S1NGaURrdDZ0ZHZhRnF4T2Y0RGFpajcrdW1zQjJpRVdaWGpHbmxBV0cx?=
 =?utf-8?B?eEEyTjdQb09FT3pNZHBaWnBUZm4zb0I0NXNiM2VKSUt2MHVUdit0NzVYVThF?=
 =?utf-8?B?WHpUUENBbk5GUEpIL3Eya1RSa0FPallJYW1XdmIrMURucWk4NWxrWU9TSllk?=
 =?utf-8?B?WG54ZGQ5TWdvRzYwdld5VzltYmdXZWpVWTczRzRRWDNHaFp2TUFveWZlYmxa?=
 =?utf-8?B?YUpic3pWYVBmTzZ6dThKb3E1aXB6aWhpd3dCWFJDMUVZcTFsY1Nack5mdHRp?=
 =?utf-8?B?WWp3SHVVcXltNW43dENnMnh0VWFGWnhrTVY5clJmTjZubE9pWng5SjZ2OUNv?=
 =?utf-8?B?V0J1a2s3SEJ3SUYvaWVGa3lnK2E0b251MWcyQXBGSWhqM0R6UktkQmxxZktq?=
 =?utf-8?B?NTVRUnUyR2dTY2dtY2tpYWNMdXpBb3JFTit5ZHV0NGRKWERjU1ZFL3FTZmJD?=
 =?utf-8?B?WTdja3ZRV2cweHVkSkYybEI2TGkrN0tNb0l1V3pOS2IwSEZyZjlxUmM2K3Ju?=
 =?utf-8?B?RlZzemFnUVNsOW04R0FaV0ZSL0lOdXBneDd2MkplVlpMSDJmN3hhcnQrY2dP?=
 =?utf-8?B?U016RXl6bkJxemVaMmNHKzkyK3NKYm5GY2FIemtodHp6cHhXTHBVOGFPVDVQ?=
 =?utf-8?B?amZ5SkFwRy9XZHNhTnVYaHlMR0ZlN3gyVWNadkFJYWd4MDQwQ0JaZU10VkNI?=
 =?utf-8?B?c1F1d1BEN3RCcTJEQkdFSTZ6b09YRk8xdVBHY3FNdWlUNWt6M0NDbDJLV2JS?=
 =?utf-8?B?Mmgrczlvc3dVYTdsdzBFL3dscVlLMDc2QkZYak5zLzJ6bW5XZFMyaWwzajdJ?=
 =?utf-8?B?UThkaUxyQ2ZHc05OUGR1T2Qra3phTXNlUE1yY0tFQUJ5WWh3K3djVG5kbnNh?=
 =?utf-8?B?ZEMrWnZnVDllV3N0aVNlYjN1UVZpVFRBU3N6VDJLK3dkTk96WUdydG9tYTQz?=
 =?utf-8?B?N0ErM09UeUxjckFMdVQxTHZRNGswZ1ZHaHR1SDVLUFN3bVh4UUYxM1VOQzhy?=
 =?utf-8?B?NUE9PQ==?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d55c064-f47b-40cc-22a6-08dcf2df7bb1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6034.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 21:21:24.7813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwLVUjuWhQH7FtpaCVe8IL+FxpcJGJedT3eqd2+a54jY8J7HPcGgTM/1b+LVfCe/wE0Lqb35eUrV+Dnw18G6w+vM0hVT4ZIjITDkWpJFInI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_142134_669387_5AC74F36 
X-CRM114-Status: GOOD (  12.80  )
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

On 22/10/2024 23:08, Rob Herring wrote:
> On Tue, Oct 22, 2024 at 10:02:05PM +0200, Benjamin Larsson wrote:
>> On 21/10/2024 21:00, Rob Herring wrote:
>>>> +  airoha,sipo-clock-divisor:
>>>> +    description: Declare Shift Register chip clock divisor (clock source is
>>>> +      from SoC APB Clock)
>>> Where is the clock source defined?
>>>
>> By measurement the clock was found to be 125MHz.
> What I mean is the clock input should be a 'clocks' property. Assuming
> this is a clock input to the PWM which I'm not so sure about given the
> other replies.
>
> Rob

Hi, the SoC has 8 pwm generators. The pwm signals from the generators 
can be muxed out almost everywhere. One place is on the pins of a shift 
register chip. This setting configures the clock signal this shift 
register chip is fed by the SoC.

The main scenario for the shift register is to drive leds. For that the 
default value is perfectly fine and the property can be dropped.

MvH

Benjamin Larsson


