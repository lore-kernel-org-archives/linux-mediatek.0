Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A51E81810
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 03:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPwPBRwV+l7YmyF4Vzfh2HeRWe3oWGZRSWh7wVroh9U=; b=T2nIfW2eqBloL1kjTeS7KOiHuz
	Mq7QfpjYfoX4kHk4j+LK1AuluruNRy2wcGRp6kRW3ori1NI4GCCfGnyfhVRZo+s3oaYx3cxKIn9j7
	yhBlZHCHZI6lmvQZmhRUYthe3xPNyehZ8akFro6HTkbAVbSmz/R+eJS0mzKBSRuenzA+wOnnRNyE7
	6lj0WT2Ge29jWghuy0ZLr0jzp9r8bNn3QCs8ginIZH13Cd/s7QhYBgNqsAVZ+OQOWbwngZbPDGdwm
	o3S54gVLMVNh8ck4km3L8f2nP0FaueXB4PJ6UbbbMil/fhn+MKOxI3OATBaqNYIzk8EYZbqaF2N/B
	wHFPCCpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkydF-00FSxu-2P;
	Tue, 26 Sep 2023 03:21:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkydB-00FSx9-0T;
	Tue, 26 Sep 2023 03:21:02 +0000
X-UUID: b59505c05c1b11ee9b7791016c24628a-20230925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=qPwPBRwV+l7YmyF4Vzfh2HeRWe3oWGZRSWh7wVroh9U=;
	b=upxvAITiHPoeaZTumAUi+rvU6EvOsVDJ0A04LgKbmarLgNurRniMiqFPn/DIRTS6xVZ2rVE4yjJlMJEAlMoUz+feeS6mXoQwHrqqeFYqWjAxqKcZgVTyt8kfBvgJ7jnxkl20vRuw57+Xs+Vo2xTVBXx/WrbqZVQJ828jMf0v5dc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:5b2d2599-26a2-4578-8bcd-1ba74ddaea01,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:7f5e76c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: b59505c05c1b11ee9b7791016c24628a-20230925
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1307810973; Mon, 25 Sep 2023 20:20:57 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 26 Sep 2023 11:20:22 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 26 Sep 2023 11:20:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/nwTGOtKqBjisUcCNhJYzmfkmcKRJauQk7n4G2MYga5ML1U1DZf02mkV21BAZxj3+vjZ7lIxzNaA6ZBMUlh1easwLZuNSeYnJNzL7nD4ICaukhk5jUhmLnHI+fdg/ElHXKCGXdi7Nl+R5uz+a+mDmbutwZ71MS38zuSIq69TLNn/oxNB/LR+BCsiVeVhoQGSAbIxOs4qkyeOfwRlvUbHYFMb5IwQ5P98ZI0kJnPbGAD/SWGxtDoUHRQRrntPXRuoUjOCGnowNvG8dVQg9YryIajDItatw20+3ByNt5OsSd7SShvja78JmH42oMi/6G+LJizT7ELYL0wG5+o3RqYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPwPBRwV+l7YmyF4Vzfh2HeRWe3oWGZRSWh7wVroh9U=;
 b=oOlqiBZHY5KzQlhUvnjGqLH/4/mMikCLzjjQSBeZL+6+U/t0WmOgJni2AG7v8R6WGyCA6/ORlYfd5xBN9Cwym+4o8MOAxFi6JLerNGv7P4G5LYOHwx5oIhOQ2aZK4P1YC1Vnv0Jb3vpoeb0Ws0wco2WZt69uKkpExVAayGOVLMEb5LlMKu+nQ2pso1WGXsmFYRfyHUq10oDImIimJ9BS1zN+OyxgZB75T/Uif6c6HfF4gCfXhToyCjO/SRUG459ZA0Jk4NG9xSnpYw8QyozP3cbnUf5YA1yKv1IxuDaBkOI+2Z9a4ar5Y5Rv2YZQJJOKLpT9vaBTVssN3GOHMqwe/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPwPBRwV+l7YmyF4Vzfh2HeRWe3oWGZRSWh7wVroh9U=;
 b=BJVwInUaDX3yrVbCCC8+3wxe7NgdmLb2lV3N4D4HJL6dVRlHfpNr+bT4+fXXzZ+ZqiqDPJcTUg0C0CjjHPgnN1arLvoXvBqTFrxiUQerethdaORoI3EmJsl0bpQwxwXFwobLcDwH2rt3mE4arqGsCjS5GVXpRI7wqyg9cORFuFI=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYSPR03MB8081.apcprd03.prod.outlook.com (2603:1096:400:470::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 03:20:19 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 03:20:19 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
	<Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?RWx2aXMgV2FuZyAo546L5YabKQ==?= <Elvis.Wang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH 07/15] mailbox: mediatek: Add loop pkt flag and irq
 handling for loop command
Thread-Topic: [PATCH 07/15] mailbox: mediatek: Add loop pkt flag and irq
 handling for loop command
Thread-Index: AQHZ6mWD5oVOGVt6VEG40kMSI9VJYbAou8iAgAJPyICAABcMAIABWVgA
Date: Tue, 26 Sep 2023 03:20:19 +0000
Message-ID: <0ff1b980f649f20801d0254a189adcae6a449518.camel@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
	 <20230918192204.32263-8-jason-jh.lin@mediatek.com>
	 <5d528036-e506-7b95-69bb-7748b26d2aa8@linaro.org>
	 <00f0bae9940be7b397c587c651e23c6c1e19a174.camel@mediatek.com>
	 <c08630a2-3e3d-4975-a863-a9e58c6d78f5@linaro.org>
In-Reply-To: <c08630a2-3e3d-4975-a863-a9e58c6d78f5@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYSPR03MB8081:EE_
x-ms-office365-filtering-correlation-id: 5da58c6b-d6e5-45e4-9542-08dbbe3f82ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wzz/mRtNZKI7hLiFYe0JYP4ENBbE2SgK9lS7u9qR6jrv+CvstqP+kwazW1Y9lnL279Hb25YpNAqlm83lJV27oKexYP6ijRYXXyiRPk4cEwol40YktrvfilfjepX7PcNW4TtKlIwvpKPpJF2qDj/KKMi8REbH4ZOeN0oiP2A+d0J8RP1vqT1vS7UMg8vRyMF6t9jGJLZhMxa/V1JviC36/xHaIRYiw7a76qolnuMpNIzMJ+heBKqPQwnHr1pWhMwIE4bInJmal6hCmDvWBu42Jm7/gd30AN1fi9dy1XUVVS4gLSeEkW1+pEDorITXg5FavIKWrhpU9f5eiKhDlqxNCOhccwn4aTxowRr3y2yuzZIIKA3lXCaUY+4+dzKQLBk+GVt9ByKbXciAWVbMkCHEuZc45fp/zfVBzxkdmD1DNezMFTHW9PP7/uTDTcMxLdpjHF33szuXCarupEFOw2kd7ozgFq4YacLvsj27SPgrSByQTLwLXReaFxzOpmTAZNHzuEnhpBeERL3GZaaqVKkNxx0ZuHM5nhWCWISFPTOgR6Nc8TyqJhpf2tEWirflEbZhxXyTiJiZrrtUATrdw3TTnFIBfpMg/bSd6o4gCCzQM04TfMbpO64krsq1h+CA01LoNZ4jH0FAEqxATseDLbm20Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(451199024)(186009)(1800799009)(7416002)(5660300002)(54906003)(83380400001)(2906002)(316002)(15650500001)(41300700001)(8936002)(8676002)(36756003)(85182001)(4326008)(2616005)(64756008)(76116006)(66476007)(66556008)(66946007)(66446008)(53546011)(6486002)(91956017)(110136005)(966005)(6512007)(6506007)(107886003)(86362001)(26005)(71200400001)(38070700005)(122000001)(38100700002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mlk4STJjUW9qbVMxb29BeC9kZ2c2VlR1YVZtVVp0ZmZlRUZzc25pRS8wM2hJ?=
 =?utf-8?B?YUhuZndDb1BWazgzSzRQbVFTSVJDSFQ3NzY3UlR4RWw0Y1U0ZjFOdHFDcWc3?=
 =?utf-8?B?dVN4SWVZZVBvZ2RiZVd6c2drMi9jazFCMlZrQldKRFZHTC9Ddm1qdjU5WU1m?=
 =?utf-8?B?ZGRuN1RML0JCTG5XNC9VM1QrN2NpMkxJVDZZNzV6OUkwY2VhSkdUTVdHdU41?=
 =?utf-8?B?QUlCU3JxRTRUdExYVzVDeHdMK3ZkdDJzRmZoRENudDNXbHRzOUpRSWRaTjZE?=
 =?utf-8?B?Z21YdU1MMnN1VVdoMUZSZkJhNURzeW5YWGhNYjJyU3VIdUQyZE1MS0tPMm92?=
 =?utf-8?B?Ym1QbXROeHZBcDdiR0M4K2FxdlV2WFVFaUhDdTVDSWNpMlNZeUhJOVREa1NV?=
 =?utf-8?B?UHhJTzRYLysyZzhGL3R0b1FhZHUrdDhqMnZiYjlnTElneGJTcjdUT3o0WWpS?=
 =?utf-8?B?M1hSdVBLbnUycW1BeENJME9lSVpzYzMxTEFRY3ZlRjRXL3NGZDhuQzFLL1Fw?=
 =?utf-8?B?cHBoTlpGT1FFVTJrcnRobS9IYjM1N0pJRDZjM2RiOGpoUXRRM1RRWFN2cVpR?=
 =?utf-8?B?Zm9jSmxEckFROUhrTTZaUTEvRVp5cGgrZ2ljMzViQS8zV1ZLMmtWVjl5ZHNu?=
 =?utf-8?B?elJzSW4ydTdibFRnQmcxb0ZOMUdGS1JhRnlJT2txZVk5U3FpWk0remZwc2h4?=
 =?utf-8?B?M2ZEUzBUNlJtWGRBWW43U3BsZ29Kc2JrU3gxZlQvOG0zMCtuRU1FRzBZd3Fh?=
 =?utf-8?B?WDNScmNQL1dGQlI4WFFWRUIzczAzdFAzNkRYT3FjR1Bmb2s5VW5PaUhaVFFy?=
 =?utf-8?B?alJURzl3N1ZwbVRKNUFPZ0VXU2VMMDFKdGgzbjExTGd5eDNmR240VHNUZHpx?=
 =?utf-8?B?NTBHQ085aGJRVFIwOFVvTkk0QU4xdWFJVXU3L28wWis2WnFSWUxqNDN6OVBx?=
 =?utf-8?B?ekxWbkM3NW0xWUpUVmk5eEJVMHBZeGNOU3BzRGNIeEFjdHEwWkRDS1UxbkNQ?=
 =?utf-8?B?ZDFTbm9NampvRUZnZk5WSmVPWXdyNTJoekw2VytkaGdKcEx0V2NJVjBVbERZ?=
 =?utf-8?B?OWpYNXhZM2ROMCtqNlkyNDFGdCtkd3VzU2RvUVhXN1NQSTdSWXZhaWlOOFBy?=
 =?utf-8?B?MHBPYVlBdHpyM21ncFAwaFhnM05UUlRlZmpwT0cvK0lyYUl4R1cyRmZGZmxo?=
 =?utf-8?B?MDZadDVxb3Mzb2xZM2tXRnhVSmNjTFVSR24yQlNyQzJadjVPU24wcnlBeS9l?=
 =?utf-8?B?aE1FTDZWOW5sUEplQkxkZUp6RnZqNlJrUXo5cnBabDFzMmQwUTFGZUg4ZFd4?=
 =?utf-8?B?LzdZbE00bVVwc0d6ZFZ3VVZOUFNmZTBGTzNycERuVlVUak82ck8valVOSzc5?=
 =?utf-8?B?c0VZVUZRYWYwd3pTMlJxN2hGRy8xZ0VOckpFL1ZyellwQm9VKzh5aUJMRTUv?=
 =?utf-8?B?QnhtalJPTHRVSTZTNGhGaU11WWVXYW9oOGRDVkpkTHQzdVRibGZLU05XaHdI?=
 =?utf-8?B?bHZYTW51akhQMSszQTZNMGpvbjNMUzVIb3BQTjNkbC9OaVM2UXlKWDBHaUg4?=
 =?utf-8?B?MjZqc2o4NG1yU20zNDV5MUl2OGplZjFyampxU1NVaVY5SmVzTGc2UGg2Tnd4?=
 =?utf-8?B?ekNpSnVyYUVXQnNuY1dleU8rSEJVeGVOcjVCTWdXNlJyZ09aZlhUS3g2djNF?=
 =?utf-8?B?RDNPc1U2aFQ0QkpQeEw2cHF5TENXbDhNTmswLy9SRVFGMUFzdU14MmJnajdn?=
 =?utf-8?B?VWd5a0Q1dnBNSUErdDg5b2pKVDlHenBvbjFkL1U5VjlIdU1Rb1NacWo5OGtN?=
 =?utf-8?B?Tk5xSDFNSFhhSExNelRya2VOM0VrN2xvcm1RM3J3YkhjKzBteHFpVVp2NjdF?=
 =?utf-8?B?OTNPL1JBcmQzL0FVUzVic2JnUXI5amNlUjA0cXBZdDg5SElPbHVpT2pwVmFl?=
 =?utf-8?B?T0RFeUNGcDZlZUZKenhISUdyQnZKUEx5YmZZYWJNWmIyLzRXU3FmSitERnpw?=
 =?utf-8?B?QUVZQUp5T1d4SktwSHpsdWE1ek9nMS9kZUZRU25FNG5xbmhsTVhuQUlnbnBa?=
 =?utf-8?B?QkF1eEQwS3lYVGFXK1BvZWpwNGUzVVVYS1dLWnZBbUk5OEpwbDRNRlY4QzFk?=
 =?utf-8?B?M3ljYjlFVGt6QUF6ajhlTFlxN1YvZGVQZlRlKzJSM2phSzd5UFhoUUQ1T3FW?=
 =?utf-8?B?L3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC7F40CBDA7A0C44861286EE011E4EB0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da58c6b-d6e5-45e4-9542-08dbbe3f82ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 03:20:19.1799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BpVPDdoCXEsVZ5cMTWqiRm/mM04dGyf0gb9Fn+7CvlGIQAZe24MBZVTrulgdtSHm4JvjGuFVS7JtGpP6+8StE4UOMmc/n9k4JHDgmflUPyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_202101_195289_ED36F984 
X-CRM114-Status: GOOD (  26.18  )
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

T24gTW9uLCAyMDIzLTA5LTI1IGF0IDA4OjQ0ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDI1LzA5LzIwMjMgMDc6MjEsIEphc29uLUpIIExpbiAo
5p6X552/56WlKSB3cm90ZToNCj4gPiBIaSBLcnp5c3p0b2YsDQo+ID4gDQo+ID4gVGhhbmtzIGZv
ciB0aGUgcmV2aWV3cy4NCj4gPiANCj4gPiBPbiBTYXQsIDIwMjMtMDktMjMgYXQgMjA6MDMgKzAy
MDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4+ICAgDQo+ID4+IEV4dGVybmFsIGVt
YWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+IHVu
dGlsDQo+ID4+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+
ID4+ICBPbiAxOC8wOS8yMDIzIDIxOjIxLCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+ID4+PiBDTURR
IGNsaWVudCBjYW4gdXNlIGEgbG9vcCBmbGFnIGZvciB0aGUgQ01EUSBwYWNrZXQgdG8gbWFrZQ0K
PiBjdXJyZW50DQo+ID4+PiBjb21tYW5kIGJ1ZmZlciBqdW1wcyB0byB0aGUgYmVnaW5uaW5nIHdo
ZW4gR0NFIGV4ZWN1dGVzIHRvIHRoZQ0KPiBlbmQNCj4gPj4+IG9mIGNvbW1hbmRzIGJ1ZmZlci4N
Cj4gPj4+DQo+ID4+PiBHQ0UgaXJxIG9jY3VycyB3aGVuIEdDRSBleGVjdXRlcyB0byB0aGUgZW5k
IG9mIGNvbW1hbmQNCj4gaW5zdHJ1Y3Rpb24uDQo+ID4+PiBJZiB0aGUgQ01EUSBwYWNrZXQgaXMg
YSBsb29wcGluZyBjb21tYW5kLCBHQ0UgaXJxIGhhbmRsZXIgY2FuIG5vdA0KPiA+Pj4gZGVsZXRl
IHRoZSBDTURRIHRhc2sgYW5kIGRpc2FibGUgdGhlIEdDRSB0aHJlYWQuDQo+ID4+Pg0KPiA+Pj4g
QWRkIGNtZHFfbWJveF9zdG9wIHRvIHN1cHBvcnQgdGhyZWFkIGRpc2FibGUNCj4gPj4NCj4gPj4g
SG93IG9yIHdoZXJlIGRvIHlvdSBhZGQgaXQ/IEkgZG8gbm90IHNlZSBpdCBpbiB0aGlzIHBhdGNo
LiBZb3VyDQo+ID4+IHBhdGNoc2V0DQo+ID4+IGxvb2tzIHJhbmRvbWx5IG9yZ2FuaXplZC4NCj4g
PiANCj4gPiBUaGlzIHdpbGwgYmUgdXNlZCBpbiBjbWRxX3BrdF9maW5pYWxpemVfbG9vcCgpIGF0
IFtQQVRDSCA4LzE1XS4NCj4gPiANCj4gPiBtdGstY21kcS1oZWxwZXIuYyBhbmQgbXRrLWNtZHEt
bWFpbGJveC5jIGFyZSBub3QgaW4gdGhlDQo+ID4gc2FtZSBtYWludGFpbmVyJ3MgdHJlZSwgc28g
SSBzZXBhcmF0ZSB0aGlzIHRvIGFub3RoZXIgcGF0Y2ggZnJvbQ0KPiBbUEFUQ0gNCj4gPiA4LzE1
XS4NCj4gDQo+IFdoeT8gQW55d2F5IGl0IGhhcyB0byBnbyB0aHJvdWdoIHNhbWUgdHJlZS4gWW91
IGhhdmUgZGVwZW5kZW5jaWVzLg0KPiBTdWNoDQo+IGFydGlmaWNpYWwgc3BsaXQgbWFrZXMgaXQg
b25seSBkaWZmaWN1bHQgdG8gcmV2aWV3IGFuZCB1bmRlcnN0YW5kLg0KPiBSZS1vcmdhbml6ZSB5
b3VyIHBhdGNoc2V0IHRvIGJlIGNvcnJlY3RseSBzcGxpdCBwZXIgZWFjaCBsb2dpY2FsDQo+IGZl
YXR1cmUvY2hhbmdlLiBTcGxpdCBwZXIgc3Vic3lzdGVtcyBpcyBub3QgdGhlIHNhbWUuDQo+IA0K
DQpZZXMsIHRoZXNlIHJlbGF0ZWQgZmlsZXMgYXJlIGluIHRoZSBkaWZmZXJlbnQgbWFpbnRhaW5l
cidzIHRyZWUuDQpSZWZlciB0byBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9saW51eC9NQUlO
VEFJTkVSUw0KDQpNQUlMQk9YIEFQSQ0KTTogSmFzc2kgQnJhcg0KRjogZHJpdmVycy9tYWlsYm94
Lw0KLSBkcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQotIGRyaXZlcnMvbWFpbGJv
eC9tdGstY21kcS1zZWMtDQptYWlsYm94LmMNCg0KQVJNL01lZGlhdGVrIFNvQyBzdXBwb3J0DQpN
OiBNYXR0aGlhcyBCcnVnZ2VyDQpGOiBkcml2ZXJzL3NvYy9tZWRpYXRlay8NCks6IG1lZGlhdGVr
DQotIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jDQotDQppbmNsdWRlL2xp
bnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oDQoNCkkgdGhpbmsgd2Ugc2hvdWxkIGFkZCBhIG5l
dyBNQUlOVEFJTkVSIGxhYmVsIGZvciBtZWRpYXRlayBDTURRIG1haWxib3gNCmFuZCBwdXQgdGhl
c2UgZmlsZXMgdG9nZXRoZXIsIHN1Y2ggYXMgIk1BSUxCT1ggQVJNIE1IVXYyIiBhbmQgIlFVQUxD
T00NCklQQ0MgTUFJTEJPWCBEUklWRVIiLg0KQnV0IEkgZG9uJ3Qga25vdyBob3cgdG8gbWFrZSBh
IHJlcXVlc3QgZm9yIHRoYXQuDQoNCkFueXdheSwgSSdsbCBzcXVhc2ggdGhpcyBsb2dpY2FsIGZl
YXR1cmUgdG8gdGhlIHNhbWUgcGF0Y2gsIG5vIG1hdHRlcg0KdGhlc2UgZmlsZXMgYXJlIG5vdCBp
biB0aGUgc2FtZSB0cmVlLg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCj4gQmVzdCByZWdh
cmRzLA0KPiBLcnp5c3p0b2YNCj4gDQo=

