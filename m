Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2E8CFD364
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Nov 2025 09:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Yy/8WSGbmFtimS3nl8814qWbblUoY45cWtN4wYoC70=; b=dgAdJiwoj3MwnakM0MeSksJOzI
	BK0Q8t8I/FinpVsRqkHdlZ0mCGK28hGfwh3WHFserrK0lPGu3GJPZwqF+1w+hwyigrY6Lr9Xao1V9
	Gv6fFIN4LPAvPUFzzUtRDiUyXAGiiLCxlUmAnudUDnVFI9IAQDpxRSL/az/7H0iEXXbzhElRE3SsC
	KC8myyB1lvxznbhJP9sNIfDiyR37PxtmUkU6oBItYvoaAE2tdpqbT7ETVW/PYQLnWb4hCzqunklEc
	LrhxiDtMgrCfs7TT31qUFmd/1AHGBHNgqobmvkWLwNpuCHCJRFHSQ+4wp1LAj1mcudouUaQl/zVvP
	61JgIg3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNp2D-0000000D0Tp-11vS;
	Tue, 25 Nov 2025 09:08:29 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNp2A-0000000D0TA-1yZL
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Nov 2025 09:08:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1EmalZWEKm5L/lZfm4Y6hH1eJF11Y5csg8TQiI9VEh0DN9640BGgk0T1dlMzqgwTcnhIz/5Q2ndcptFozwaurkf/il5sIZC9FEK1EAhSseIwjO2e7ode2z+t9DqDeqgvcKKOkA1NAjEWHQ+WV7Lha04YDK4KXOMf5z5m+Ll0kJdaijyXhIi5i3OuuS9bZYRF9WerIGJ7+KbDj5xqI2L6ak4FPH+d6Na4JMhv5XEdADy2kLySk/NhR0CThFEIqLulyO9x2XKeYj+y/qijfvbUqv8MzwC1KHAU5EDJQFdYpm1J2FNIt6NlOx7TOaO3lYGYzYIAuaPA1Tf8G4Gz8tKNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Yy/8WSGbmFtimS3nl8814qWbblUoY45cWtN4wYoC70=;
 b=nLCDizp5xZ+nvBdvTS+VJoJv5ix731hUOy+80RHZ43Z0ZWwnu1LSyv3PChLjbgl2QPVzB/NyNM5KM79uTEvhDf9LjeY/NN7QXGBQXYBvtsIg0y6JCf5SBQatksM0yk73hgwuQcultM8SlYsSuek/685tR8Xho7FVw5x8+9MCGitU7Z0ExYGdstFSBD6ejEAZHYH1B2O/vLds2xirPGhlmIIz6W1Ijei19ApLk7qlT67i1/F1gNDYIUY2aewDONlShIRyvR+g4cXvEj0K8Ra3Uj2ftv33ebpUA+42Fcd04bVBgZ7fznnw8pzJjv4v/qEEYHM26W99S19mqnKbTTv9lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Yy/8WSGbmFtimS3nl8814qWbblUoY45cWtN4wYoC70=;
 b=YPu+1BNS45q9IPtXYlVGeLN/Fux4gyfceqIS6ORHTx4NCwLQlAP9kZf7v2cyoAiVFaq20bs4wH2DN5xmOgmeQ9qYcRSze/yMafTdhRCOyldAaVdSyWI0wBqihxIGmonWrKat7ZByhMNvNhrn7D+6qZPMGfZ3XWVVzo6HrRt4wCDlGj2i1GIvX0dcWb08hRsrzGutoPFbewA3Vq/b6JWocfwK8PNHIK92+qfEM5hC1RroxViIs9CGMr3v+PrObZje66TeImGGpdF84uslLr/9S9/T2F7balaLn1g2X67fqD+xbxZPc6+oae2YdlLpzSfs4xylYGXjUCPovcvaoRkGew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com (2603:10a6:10:576::21)
 by AM8PR08MB6402.eurprd08.prod.outlook.com (2603:10a6:20b:363::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 09:08:10 +0000
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d]) by DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d%3]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 09:08:10 +0000
Message-ID: <44a765dc-5943-421a-a56c-ae46b20fdbb0@genexis.eu>
Date: Tue, 25 Nov 2025 10:08:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] spi: airoha-snfi: en7523: workaround flash
 damaging if UART_TXD was short to GND
To: linux-mediatek@lists.infradead.org
References: <20251125021051.857159-1-mikhail.kshevetskiy@iopsys.eu>
 <20251125021051.857159-2-mikhail.kshevetskiy@iopsys.eu>
 <aSVYShXLirW--bYe@smile.fi.intel.com>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <aSVYShXLirW--bYe@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV3P280CA0027.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::16) To DU4PR08MB11149.eurprd08.prod.outlook.com
 (2603:10a6:10:576::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR08MB11149:EE_|AM8PR08MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee7ba0d-bcb0-4166-99bf-08de2c022788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2xnb1lMYUluWHlUWUtqdlpBQWhWNnVnWThtN0phK2JlaHkwUTQ0VEhUcUg1?=
 =?utf-8?B?TmMwYlg0K2VYNUdmaGlwY3ZQcDBNL3d6Yk96TlR5dXBvZDVYT20xTUswaDZE?=
 =?utf-8?B?M0pjcjBHYlpGTzJmbXh5TUtiNnd6M1F2cVozQm14amtaUURHVm8vemlzdkVw?=
 =?utf-8?B?Zkgwc3k1WC9nRVl4UE1CRGdTT0FOVFlMRFI2WmhlY3ovUFk0cktNajdOcVNl?=
 =?utf-8?B?Q2RYTjZyR0xzQkZnbDRuVllhV0Z4Rk1KcE92cGF2ZVlvdENXamFHYllxSjNl?=
 =?utf-8?B?QmlPTWxWakhzRnIrYWxWR0JVdjJQdFhndHA1RnN1SVozK255U2EwRTlnOS9J?=
 =?utf-8?B?RDNSYnB2ZFIxQUZwRFRhM01KWXBjbXpVVFFkbEVCcGg1M3FGczNqT2ptREx2?=
 =?utf-8?B?WHNvcVZCcWVhNW9HMmwzNHJDMVRzTTF1NGZ4NTlzT0VjTjgrbnhQMHo0Q1g1?=
 =?utf-8?B?NStHS2FJelNQemdSa3owelpLUkwxMWhqRjRvaWkzQTYrOGk0Rk1rbG1zSXMy?=
 =?utf-8?B?cFFZdENKTi9BZ0pGY3dRcXAzSmhXeWZqbHk0K1pqb2tpVTlwdGNIZFREVXRV?=
 =?utf-8?B?UHBld2dJMWJYTmJ5TVZmOHRsSVg1MHdjdXN1R01BQzFLRVZpcGVMUi9JZ1R4?=
 =?utf-8?B?MVdzZmdpa3owMEJzdVRrcGh1MDYwQWlNRGNBc3NBUGVMZVkwbUE2ZFpnWXM4?=
 =?utf-8?B?MXQzY29kcjQvOUhmaEtXSytCZEFGWmRROWxHTlhMQVFsL2dCM1p2ckdKWVVU?=
 =?utf-8?B?V20zMEptUGpRSzFKbTJvamwxRWMyYlpOcWZEUUlpM2RxQ3ljTEVERDQ4OWVp?=
 =?utf-8?B?aVFpY3dZQkx1cmF2ZUI2OE85b2Z0bSsxa0JtK2R5SmFTMTkwUFdkaW1UclZQ?=
 =?utf-8?B?TGYvYjNMamtmdlNSMmtDSUcvUFQ5ZzQwbWNsLzVGOWg0M0k4ZVBCa2hHZER0?=
 =?utf-8?B?Ulk2R2xSKzRZNHFJZTRCWXo4ZEpqdHpNOEpmWGF5RDUxazFhdDN4ajhGWGF4?=
 =?utf-8?B?TDJRQTVFZGpEM0k2YnE3bXNVK2QzQnFKTkFRZUZOKzkyL0l1Vkk4emhqdXlz?=
 =?utf-8?B?R2QvZ3NRZXlSYUFJcWFibXZKb1RMUno2TDYzc0M4VU9iNDZBUGNyZy9DVWtI?=
 =?utf-8?B?UE56UjQyMFBCdjBjbWZmbXFNZERhTTRyUmlwSFoyNWlma2s2WndNK1hBcUt4?=
 =?utf-8?B?d1FJdjByVWttWFpiZmZRS05sT2RDdy8vTnpVZk42R1N4TURUNGdIWXYvQnZs?=
 =?utf-8?B?VllWTWFsYjVWMEJTU2tTTnp4U1FWZ2RaVzRJNWVDUkRhRlhxVXVvdkUrcnRN?=
 =?utf-8?B?YUJGbjU1blhJWk1peThneCtiVWhwSVU5aTVYNHNOdERoS2YzelhWaC9aMjdL?=
 =?utf-8?B?Zm55SXlHS0F3ckViMVRqNWpKbkFFNWo1RVNtNmhORnJsNk1pT0NsRmR6bEpL?=
 =?utf-8?B?RmJzeUg1RmZVb0dIbEd1RVkwSFRRdjUwc2paY1lrZmZtWTlCZVpTWUhjQ2Nw?=
 =?utf-8?B?RVlKTUZ6Ymx4V3lIZUJZZlZNVjAva1lxTzRFQ1VvS1FxU1VUQUZRUEczUzhO?=
 =?utf-8?B?aXE2RDM2YVU0S2h0RkZ3b0tiN2FqS1hmUWhkNVJOazRldG5oVGNOYXBteUhk?=
 =?utf-8?B?UHFFR25Kb0xucWxnMmtnSXZPY0FEaURIUTIzalRhUnNzdU8yYWFiZ2VibzF5?=
 =?utf-8?B?K1ZRa0ZBTTk3TXlDYjBRQnY0SzVsdEdrRklGejI4akhscTM3N090M1RKVUZS?=
 =?utf-8?B?ckhFL2gzdjZHeDZnQm9PdFpzWjRYT3ZkNmh2aStFamQvOGJNU1NWKzB5VTdY?=
 =?utf-8?B?cUFKeEZyeGdnOUxLcnBPTVBoeXZiS2pvdzlKT05wd3FVU0NaK2tNbHgyQU5V?=
 =?utf-8?B?NGNjN1M1bk1DQ0UvZVd6TW9weHB4cno1S1JveVo4RUVrQjJ5UVdlK0k5TEdy?=
 =?utf-8?Q?vJKOs+CdZrJjmbKu2DIx87gVshqWupPF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11149.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjBlUFY3OVBaSHUyWk9oL3V3QzJ3SE1YRk5NbFlvM0VCVTdvOXEzbVkzRUdp?=
 =?utf-8?B?VVFmcTNBaUFpYmxGZy82U2dDMjUzdWRORjUxZ1pIR2RTVVFMWlBmSlZ5Yk9B?=
 =?utf-8?B?SGpxUDJ6YW5GQXVZblp0Y05xanFTbGJGVENZZk5mdFg1dXByRUY5ZlNKb1JX?=
 =?utf-8?B?T1VkRkY4b2l6RXpPRE9DSHJJaTI0Snpia2oyamE1aEFnZStTcEoyUEdqT1Ju?=
 =?utf-8?B?YlM5aEk1dGN5QldseW5KRkVacE1HZ1ZxNEo1RjFLNHh2MGtaSitIUHh3OGpk?=
 =?utf-8?B?Z3dab1Jvd1NKNnpoMjlJRUt2M2M4OWhqZWJFYlZhWURIU0dUUEN0MGFCMW9S?=
 =?utf-8?B?VGdiR3l0K0VRKzBodis4NW5ZWk5zTWtDRXN6VEZjVlg4UGhDYUlHbmF1eWN6?=
 =?utf-8?B?RkdiRVFvTXRuNktORDhRMmI3WjVDanBpRGJrT2ZvbVFWV0tSU0ZVOEQ1MlU4?=
 =?utf-8?B?L1lRMXhKY250Z0RtYm9XN0lOYzlycTdWZnpQejVRcHpuVTc5L3Ixb3dKWXZL?=
 =?utf-8?B?L2NaNThWWWlVa2ZDT3FVQmxGY3oyZUNJNUpQNzdBQ0trZjJnaXlCMkZtbk8z?=
 =?utf-8?B?VDJRUnpETGdtRTdSTjhqZDJxRzdKa3FlKytOYnpRYkVaR2VDckRQZkpPNDBp?=
 =?utf-8?B?NXozUlhBVjNMa1NyQ0hmcEN1aHBIOGUyVzRoc0Ezb0UwOTB5aEVMUUFNcHR5?=
 =?utf-8?B?TU5BYk52L1hqa2N3WVZJb3RjaWtjRHQxYkhNTVJMaTFLeTIxUEtaM2xRV2Jt?=
 =?utf-8?B?d2w1eE93OFFGTEpIcEMrQzhoVUFSWC9nc0lrSEYydnZIdEZ6MmhsUnpxSjlS?=
 =?utf-8?B?aXpyVTJKaEJZMzFOdWwyK2hBb3lFNGx4eFZ6NHNpN0hneE5TZFFLYlhwSk5M?=
 =?utf-8?B?aEJ2QUxjVTAzSmRmY05YVE5BMU5KSEs2MVc3cC9yWCtJK1FmTXNmdFV6TlZB?=
 =?utf-8?B?RjNpWk9SVkFsbFZYYWJBM2plZnFBdkw0SUxqdnhrM0pqaEhqcG9YLy93Y29k?=
 =?utf-8?B?eEk2UmJGSFdRclRjdDFNMlRlcm1xa1RvYkxwOEJmbFNleXRIQnlNc0FmRDM5?=
 =?utf-8?B?OVhrVjQyTnhvVUx3YVF5VWJaelorY2R6VVI4dmR3U1kzVmxVaVArd01jTHNu?=
 =?utf-8?B?NWdWUUJwODh6OXRyZFFpWmlURU5idEMzc2xSTnVBTFROWE1wWXJBUy82NkxV?=
 =?utf-8?B?dFF5eHREbU5nK2t1Z1pTSXJkaUpISkpFd3Q2U05LdGlQMXZOQ25SNXA1TDA4?=
 =?utf-8?B?ZWViajUvZEU5SUNWampYZUlHUjA0dG9HZ0svUDMwak1IdGd1b1FVTkVBV1B5?=
 =?utf-8?B?T1NvYU5ra3hCcklvdHN5OVd6QXVTY3JZTGlsY3U4bUxyN2JNTWx6dWZ3clJ5?=
 =?utf-8?B?M2swWS82MjdPVzVNQ29vdnN6UkZ2a0pjaWllbkZqYS9CK1Zxa01VZjI2Nk4v?=
 =?utf-8?B?Sjk1WEw2aHVwbUJjK3hWeVV0azRIVW5yT2VLTGRQUUwzWmRPc1F1K3ZTMytn?=
 =?utf-8?B?MHc4Y0dFVm5vQm9jQk9HTUFLcHBuU0xNdlo1bzc2WS94eUpZM3BMNmVEMWth?=
 =?utf-8?B?cGpnMGR6b09aUy9OUzA0Y0owNHJRRURmVHZMMzRXOGNoL1Q2b05HK0lHaXM0?=
 =?utf-8?B?Q3plZlRCZ2ltalMzUWJnT3ZITzRvbVEvUjlySEhOZGtDRWxicUdoNzJReWRN?=
 =?utf-8?B?NVE4SGZ3bStNemV3eXNZYW1tRmJrUzNBNDZNenoxemFBQzM1Q1F2SGhhb3Uv?=
 =?utf-8?B?dVVKeG05L2FFK2ZDY0orenk5NGhPemk2d0xWdEVWY2g0Y3JGWGNTRnRPUm0z?=
 =?utf-8?B?QWlmYkV5a2lhYmZpOTFsNmhVcitacHpBR3hHVXpJeDJ0RGJ2blQ0aUdlMFhn?=
 =?utf-8?B?d3EzQjN4OVgzMFdpZkpnWFpDZGRlNjJodHZJaTZVeGFtcGQ5V21hTVo2SkdG?=
 =?utf-8?B?ckNhdmV5Qjc3dG4zUkRlRUlZNUNBdEduZG5uaDVaY3hnUTdVTm13L1Y2Vlli?=
 =?utf-8?B?d1d0RVZhOEI2RXhSMGdveVNVaEpQbVBHTEg0L21LL0JBdzVtYi9abGMvSWhQ?=
 =?utf-8?B?MHhkdURNOS9zUUZ1bmYwZytWaTM3Wk1NU2swcUgvNUFFZzYreFlSUDRPRE5p?=
 =?utf-8?B?R2tpY2ZMV0xxeG1YMmQzMDg5cU16SC9uTW9maFkwVnA0dGZqVVZiSGZsTlE3?=
 =?utf-8?B?bDNNVXphRG5iNGY4MGl1Rm51eWxlUVQ4Yk5JUC9VTFBCdXB6cTNYSENEUjNq?=
 =?utf-8?B?UHRiSnlXazdqVmpUZjdyNFIyZ3pnPT0=?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee7ba0d-bcb0-4166-99bf-08de2c022788
X-MS-Exchange-CrossTenant-AuthSource: DU4PR08MB11149.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 09:08:09.9381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5844UZd/g2eth/rhKhLyHn1z+4qahWd5TS7gktM8bZMdntRP+s2HraGKVBgpw4xJCIszPukX5IHpPexNhgyXGeXVCaOrEl4vM0s5djGQZWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6402
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_010826_540899_10224F0E 
X-CRM114-Status: GOOD (  12.22  )
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

Hi.

On 11/25/25 08:18, Andy Shevchenko wrote:
> [You don't often get email from andriy.shevchenko@intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On Tue, Nov 25, 2025 at 05:10:49AM +0300, Mikhail Kshevetskiy wrote:
>> Airoha EN7523 specific bug
>> --------------------------
>> We found that some serial console may pull TX line to GROUND during board
>> boot time. Airoha uses TX line as one of it's BOOT pins.
> I know the term bootstrap, what does BOOT mean?
>
>> On the EN7523 SoC this may lead to booting in RESERVED boot mode.
>>
>> It was found that some flashes operates incorrectly in RESERVED mode.
>> Micron and Skyhigh flashes are definitely affected by the issue,
>> Winbond flashes are NOT affected.
> NOT --> not

The following pdf:

https://e2e.ti.com/cfs-file/__key/communityserver-discussions-components-files/196/BQ25792QMR_5F00_Schematic-Review-2.pdf

lists the SoC strapping pins for configuring the boot options (EN7529 is 
in the same SoC family as EN7523).

In page 1, the "EN7529DT Hardware Trap" one can see that b010 maps 
to "SPI NAND dummy prepend". In other (later?) version of the schematics 
and datasheets this is changed to "Reserved".

It is assumed that this errata was handled by just updating the 
documentation to not use this mode on designs with incompatible spi-nand 
flashes.

MvH

Benjamin Larsson


