Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323FFC7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 03:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=am3/5dOKAWMXZl8WWt5gOJvnNcKR36v1fcqz/1ZeeJQ=; b=VrtkYQuTiXm2ALk34OMeJlvqmK
	EMBYhavroWoN6XowtFYyw2IgOT/odcV563I/EAumBzmWi98cBzQ2a9g0DCVoZuy53myTRlF1wREKB
	txaMv3XlGCFTm8OfVEdkswl/RcWiZR9TXus/vAYE1jT5nrGkvdyI3mnjSXdoorSnUePCFZs3l2PfD
	vQoZhrlMo+Lz9n08RMeQjHMl+MoDMk1XpuruTUsbq43qZqKyefvBfzUYNG4fMeQC919aYWHA9ZS5w
	Cv5vZZ/B0yzF14pTjerPMIDkptzChkjIgd1PGv0Xl7ykFnPn38KQ5rwe9kGciuh2nqtNFLKtc/2pE
	ftw//2jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXDJ6-00F27F-P3; Wed, 01 Mar 2023 03:39:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXDIt-00F26W-KL; Wed, 01 Mar 2023 03:38:57 +0000
X-UUID: 94f2fd5ab7e211edbbe3f76fe852e059-20230228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=am3/5dOKAWMXZl8WWt5gOJvnNcKR36v1fcqz/1ZeeJQ=;
	b=QrveKJkCPso4tKU8jRGUt/MbDXLDr2DOhr88OfVI0HTcPjUpBpZ3OrrMkv/vPH8wbfXa1h+pgqs3inn8lTEIIippgtElazFk2biaqhfN2Y0ZkaWeJzpe/DSJPWiKf+k//tli8htUhjXqgvpWEozmh8WBKHFkPwF0vIo3gindYxs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:cbac0b15-3be8-47b3-9302-23454465b79e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:40
X-CID-INFO: VERSION:1.1.20,REQID:cbac0b15-3be8-47b3-9302-23454465b79e,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:40
X-CID-META: VersionHash:25b5999,CLOUDID:16f45cf4-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:2303011138510SA0SPFX,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48|1
	02,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,C
	OL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 94f2fd5ab7e211edbbe3f76fe852e059-20230228
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <powen.kao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1017613052; Tue, 28 Feb 2023 20:38:50 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 1 Mar 2023 11:38:48 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 1 Mar 2023 11:38:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSgrUnduW0NynfUexB4a625WuNR99azQqrSeTGp3uDHOD/88RSM/ZeG9MJcvwweIBZzLAilnli0vQMKUh1OpiRiT05cuEos0VhMq1boPQqNeb0Htc1VfWGydewKGTTY0wvNSUk/8fKF5Y+ZZjP2uW9SGk/iSnK0WuYoUFUwVFYiQRl5TMSPDQ3prE1soNQhMG3GKWjNPh4IPJjLfj08kNeP5V4BcQ94XBlz/RpTvz8O5t/fM52eksaVyD1zgpGg1gpOBc/xQdR1m4v2zIEz5gnoV0/JmVm8Nj8KZqgChOqfl+1CuEmRh7DTE7j7GzZqioyaKJ9rQhEQOH8Nbm37FtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=am3/5dOKAWMXZl8WWt5gOJvnNcKR36v1fcqz/1ZeeJQ=;
 b=VkjlKA/gNvlHDJIJ0+DX0SCkRSbAyNK9cTXS80V1Y1ONICajMmP8Behm922lUs9D537xtFJSjfG4aXnD3MgLnguNfHSJa9WIhGg606307wAi4GOk4YDdCiS/QOojjmDbZmDYb3Z/B76RhGouXq1PtFEhKYplPZ4uxAdhq87CzGwPg4ovBwCH4iIv4lH1dJNIqqKLX87vLbnYPrbq8ZTK1yt/4Ug/lXjWJoHoyV6gDI3derAIL4WgxjEEUyz7gMZaQsG9Vm0Mjtv2T440r9NrU2BRFmAz9QPuXoRKDTiHqJGcarWTKPvsRVWbXXeKRph5DG6HJCgFzbuIp3y4mf6PSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
Received: from TYZPR03MB5825.apcprd03.prod.outlook.com (2603:1096:400:120::13)
 by TYZPR03MB5743.apcprd03.prod.outlook.com (2603:1096:400:74::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Wed, 1 Mar
 2023 03:38:45 +0000
Received: from TYZPR03MB5825.apcprd03.prod.outlook.com
 ([fe80::c85b:1180:16d0:a852]) by TYZPR03MB5825.apcprd03.prod.outlook.com
 ([fe80::c85b:1180:16d0:a852%4]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 03:38:45 +0000
From: =?utf-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?= <Powen.Kao@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>, "avri.altman@wdc.com"
	<avri.altman@wdc.com>, "bvanassche@acm.org" <bvanassche@acm.org>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "huobean@gmail.com"
	<huobean@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
CC: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
	=?utf-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
	=?utf-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
	=?utf-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
	=?utf-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	=?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
	=?utf-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
	<Chaotian.Jing@mediatek.com>, =?utf-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
	<Naomi.Chu@mediatek.com>, =?utf-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?=
	<stanley.chu@mediatek.com>, =?utf-8?B?TWFzb24gWmhhbmcgKOeroOi+iSk=?=
	<Mason.Zhang@mediatek.com>
Subject: Re: [PATCH v3 4/6] scsi: ufs: core: Remove redundant check
Thread-Topic: [PATCH v3 4/6] scsi: ufs: core: Remove redundant check
Thread-Index: AQHZR5t7MFABBWIqb0OrlciBV2TY7a7hbfmAgAPhdQA=
Date: Wed, 1 Mar 2023 03:38:45 +0000
Message-ID: <e1f2b4da3f706d670c0f739d0da8597135d107e7.camel@mediatek.com>
References: <20230223152757.13606-1-powen.kao@mediatek.com>
	 <20230223152757.13606-5-powen.kao@mediatek.com>
	 <eda65f0b-bbd1-5e3d-5d85-a5686a06ba5a@gmail.com>
In-Reply-To: <eda65f0b-bbd1-5e3d-5d85-a5686a06ba5a@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5825:EE_|TYZPR03MB5743:EE_
x-ms-office365-filtering-correlation-id: 89943c37-e2fa-468f-50c0-08db1a067601
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cle4Hd+WXy3l2CsQZcvhseSClxv8fU0Ws1NQiQuacchFA9ZYwGdf20jPhGNkwKa0Obkaqv+SIw7LxAv+5PQZIM1sv0OH6SkCpGxbstPRJsul71TpSLL7XN1GNTelNe5jKOZgQNFpoi5b8M5NmLl5HK8a3pkaJcNPcaCBzVjwC9tjjlHvcTD2QgnHrGz18sBTSZOdETvqD/QKcBcdM9yM2nQsjzLh4S6Z3FVxMsPuvo/stMjY6Ie5XLmsCVilp7x1LZY5zqokxMwnwQ6uHAuvxfZvICTbZDBwFS1I+h10o0xdknLXN3w1eKK1UI37sOZYOGaIggJizOfdW8Be25esfdBRdHIcjWEKR4XIaQrJsGgThpNecdjnmTvPa7uehd3bKJA2MvhjI1Y9z5NLCA6C/dHjmuHGj+ofDGeFH1bnsTTLQhFFEQFkuUe2CWguF2LV8c1nJgxUmrn9QcLbWfYRHJNVxFBUm7IbhR8iUJsB8Yo5sCrGpqtwKVxW9LVNK604V6W2cQ7AJ+DVKDZ29uU0gMU26aq/EzWK2d+4XJre9ijCnuV7519vkrJdM6DiXQZvPDFc8FMXLfKbUpL7aWm3Alb+QqKqkHlR9rfhyz6WAhp5cvDdBO4fLCRHjb31hoGk5Fj4BOrTzcPjU8Jcc++1+Dk6ji2GO9yxJRcBjjHZVY0CO1F3di2ePf/yT8Suf2DDoTDe0hpobmgAFkTEuOdWYcKcPmJd3YhkmxUPnkSjWClThGvOARJZejXvB23JAXNoxfS71xMTmWQz6jEU4Lvc8g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5825.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199018)(2906002)(7416002)(26005)(5660300002)(85182001)(66556008)(36756003)(8936002)(66476007)(66446008)(64756008)(76116006)(86362001)(66946007)(54906003)(110136005)(316002)(8676002)(6486002)(38070700005)(966005)(71200400001)(4326008)(478600001)(921005)(122000001)(107886003)(38100700002)(6512007)(41300700001)(53546011)(6506007)(186003)(2616005)(83380400001)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHFkWHR2UGpLYWw4Njh0bU9pSHNETkNWakxKN21QbGVEUUoyR0xnbDREU3NW?=
 =?utf-8?B?ZFlIUStLZUFMMDRYMUpwdjYzQzNCZHFoR21uMSszWkZkdjJoVGs3WVlWeHNy?=
 =?utf-8?B?MFdhVWZPcEdwc281SnhMaEdxRWlIVFdrQUxld3ZNSTJ5NktNMGx2SUdrTjFD?=
 =?utf-8?B?Vy80QVVNN2NMbU1YK2RkOUpZKzREL2lCNVNRT21IZmsycGxNWGpVM1RueTl4?=
 =?utf-8?B?SVdiUkh2UG1GeVdlaGJuUlZKUTlPWjZtTkx0VDZ4RG9McnhpRytQelZ4MzYz?=
 =?utf-8?B?OHdDV3JyWWQ3RTVQc21LZi9nbmw0UzVNNVNwZjB1d2hPZlYyYzJidzI2SHZ1?=
 =?utf-8?B?czh6dkJGcUZvV2tNUUFsQmFaNEJ5NUFvdGJLOUVwTWFsRXRlMjdRYWdaSEo0?=
 =?utf-8?B?ZlRJanNCd3VKUHV3SE1PUi9oWklTOWhpYkNIblNZNUExKzlqb1FXYU9jVmNt?=
 =?utf-8?B?Zm5ITEhtV0l2QnZ4WlBrTnlxL1N5Mm9XWU0wOWNxaVRLNERaTVBFelVZeGtQ?=
 =?utf-8?B?eWlhT1FKQmV0SzBQVkhtd0FvNHVqZWQzL2IvZnJsaDA1bVJPL3ExMWdrQUcy?=
 =?utf-8?B?Vk5xZzVaMDFSSUVvaG8rZlJvSHYxSHNKaFplRkRlWlh3UUVlZTNsOFJEelha?=
 =?utf-8?B?dG5kbHdKTVJUVW56aE1uczlkMmtNMnBOWWFMUm1ReGdoSnJzNUlabUpQdlpK?=
 =?utf-8?B?U1NwOTg4dmdQK2VabUltVTBqc3BIY2V6b1R3ZG5CQmdpdHJGM2F5cEZJeGNr?=
 =?utf-8?B?ODVMWVFiZWRqQ0NtRjhMWW1qSmxSdjFYVVErUlNma1RPWlhUcXAxekgwVisy?=
 =?utf-8?B?MVUxVlVjQ1pJN3U5a0RYQnJOVWRtYWlrTHdhejdwN0l1VmhlUUVFZFQrLzg5?=
 =?utf-8?B?SW9yMzd3VGJpNDVoTk8wOVppdHFqMzJIWk1Ca3o3Rmc5R3hKZ3lobGgvbDdk?=
 =?utf-8?B?UTR6bXU1YVVja0Z6RTJqWUhIYU1lTVQzVG45Tmx0WWpHS2d3b0xsSUF2Y2Ez?=
 =?utf-8?B?REVKUW1VSmRuekxGNnphMVhKN0d0MlRYMGZBbjVmTk45ZVVxS0dEWFlvQ1RZ?=
 =?utf-8?B?UHpyOVNpODFFUVBuRUdqUzZQRUlDRHlIVkdyUXVjckxsTkN5QTlwU3dVOWcw?=
 =?utf-8?B?eEZ0S0VFQlFkem1zcWFOU1JZU3EwMllzTG1jTDBqdlRUcmNkMWZyK0JVNThy?=
 =?utf-8?B?TzRFOG5PeHlLbXoxNjVPa29FZXl5U25FVDRpMzByRWpqelRrWGxndm4xc2Vr?=
 =?utf-8?B?UXFmMU9vQ1FLUitsVS9BdTZjM1NLUk5OOWtTUHRNOWJsNGtGQVV4V1FFbFlx?=
 =?utf-8?B?KzNMbnJZL1YrVFVqdnF0KzZHQ21xaEZ3TTZ1YXAyeWxrUFpwM2xnUUFXYWNF?=
 =?utf-8?B?VmdnTzBLNm9EUUx0a1JsZzh6QVEzN3BYYVpTUXRxZzloYjdNSkJZQ0Jqd2E4?=
 =?utf-8?B?bnZWTlFDVDIxOXEyTGl3eGRHeGhReTZsWGNvTnJzNC9wK0I1VFI0d21Rc1ZE?=
 =?utf-8?B?cGZ6MFR4b0RmMXkzblBkeER6TS9zSEJmZEJGNTNyM2lKcjF0TTVMOFVPYlBw?=
 =?utf-8?B?U3ZmRFFWSzgydjZsd2R1YUVvbitLeWhqSUltL3FLY25jcWxWNTRPTU5WbFE2?=
 =?utf-8?B?c29pa3FJSnJSOFI0VjJoYjQzNjVONDZScHF3VEZDb2E1TGdtaENuVEhsOFlw?=
 =?utf-8?B?dHF0a0J6NTVKTmZmRENIRTlMZzBSd1J6cEY3bFFEaFRTNzc3RnZNTnd5bmh0?=
 =?utf-8?B?RmpyWmNYQjBVNC94WndHblNpbFBhSzJ1WTAwTUdkdGpRNlFpdm56SXR5bXlH?=
 =?utf-8?B?Y1VzQ1FtaHJSMVNGeXRldVBuOFl6elVYQjZuZ3c2Q05hMEkxbUxwNlVYR2JD?=
 =?utf-8?B?VkwwREwvZmRTWDB3YmNuUmZ6MmZ1N2NVR0c1NVo3VzlHbnlPb2g1dERVa0Y5?=
 =?utf-8?B?c0ZwS2R5c3NaUkZWQTlBWEltZWpUajFKM0d3VkpMd3NmY0NKYVVFSWgwZnhN?=
 =?utf-8?B?cjJlZWMvWGV0RnlaYy9LZ3lEWi92U1lQd0JtVk0yNXhTdmttNUZqU1d3UzRX?=
 =?utf-8?B?UExXckQyVDkxY1FLLzFHOXlLc0FTVmJvMGJsSytqd0Q4M2hUczY4V1FhRFhH?=
 =?utf-8?B?WldjOVlhb1NlQnpOYnpMUWhlbEdjUi9yenVwRjdVc01iZjhEMFVMMmNjOUJ4?=
 =?utf-8?B?eVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63587436A3B230458E5136166B724179@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5825.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89943c37-e2fa-468f-50c0-08db1a067601
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2023 03:38:45.4824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /HkBxWgIguihatdgxKq3N8u+8dZRG00xrv/lNjQQ8H5RaRo4E+2c6JCs50tln6Nwfr7SYh0hfOpY9d/2882Ptg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5743
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_193855_699981_3AA62281 
X-CRM114-Status: GOOD (  19.11  )
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

SGkgQmVhbiwNCg0KWWVzLCBsb29rcyBsaWtlIGl0J3MgZml4ZWQgYnkgdGhhdCBwYXRjaC4NCg0K
UGxlYXNlIGRyb3AgdGhpcyBvbmUgdGhlbi4NCg0KT24gU3VuLCAyMDIzLTAyLTI2IGF0IDE3OjIz
ICswMTAwLCBCZWFuIEh1byB3cm90ZToNCj4gT24gMjMuMDIuMjMgNDoyNyBQTSwgUG8tV2VuIEth
byB3cm90ZToNCj4gPiBpc19tY3Ffc3VwcG9ydGVkKCkgYWxyZWFkeSBjaGVjayBvbiB1c2VfbWNx
X21vZGUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogUG8tV2VuIEthbyA8cG93ZW4ua2FvQG1l
ZGlhdGVrLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogU3RhbmxleSBDaHUgPHN0YW5sZXkuY2h1QG1l
ZGlhdGVrLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogWmlxaSBDaGVuIDxxdWljX3ppcWljaGVuQHF1
aWNpbmMuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy91ZnMvY29yZS91ZnNoY2QuYyB8IDIg
Ky0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
PiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vmcy9jb3JlL3Vmc2hjZC5jIGIvZHJpdmVy
cy91ZnMvY29yZS91ZnNoY2QuYw0KPiA+IGluZGV4IDgxYzlmMDdlYmZjOC4uMzM1N2NmYTIzNjE2
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdWZzL2NvcmUvdWZzaGNkLmMNCj4gPiArKysgYi9k
cml2ZXJzL3Vmcy9jb3JlL3Vmc2hjZC5jDQo+ID4gQEAgLTg1NDQsNyArODU0NCw3IEBAIHN0YXRp
YyBpbnQgdWZzaGNkX2RldmljZV9pbml0KHN0cnVjdCB1ZnNfaGJhDQo+ID4gKmhiYSwgYm9vbCBp
bml0X2Rldl9wYXJhbXMpDQo+ID4gICAJCQloYmEtPnNjc2lfaG9zdF9hZGRlZCA9IHRydWU7DQo+
ID4gICAJCX0NCj4gPiAgIAkJLyogTUNRIG1heSBiZSBkaXNhYmxlZCBpZiB1ZnNoY2RfYWxsb2Nf
bWNxKCkgZmFpbHMgKi8NCj4gPiAtCQlpZiAoaXNfbWNxX3N1cHBvcnRlZChoYmEpICYmIHVzZV9t
Y3FfbW9kZSkNCj4gDQo+IFRoaXMgaGFzIGJlZW4gcmVtb3ZlZC9vcHRpbWl6ZWQgIGJ5IGNvbW1p
dDoNCj4gDQo+IA0KaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vcGF0Y2hlcy5s
aW5hcm8ub3JnL3Byb2plY3QvbGludXgtc2NzaS9wYXRjaC84ODQwY2VhNGE1N2I0NmRhYmNlMThh
Y2MzOWFmYzUwYWI4MjYzMzBmLjE2NzY1Njc1OTMuZ2l0LnF1aWNfYXN1dG9zaGRAcXVpY2luYy5j
b20vX187ISFDVFJOS0E5d01nMEFSYnchbGVnTjBsT21CNHZHM2RGRTRNMFdtMWtMcXVWckpvOWRi
N1dEREhtNllNYzJWTTJRQWhHRktZbzlxWm1yR25rTE0tVU5wZ01Pbmk1YW9yOXN3USTCoA0KPiAg
DQo+IA0KPiBzbyB0aGlzIHBhdGNoIGlzIG5vdCBuZWNlc3NhcnkgYW55bW9yZT8/Pw0KPiANCj4g
DQo+ID4gKwkJaWYgKGlzX21jcV9zdXBwb3J0ZWQoaGJhKSkNCj4gPiAgIAkJCXVmc2hjZF9jb25m
aWdfbWNxKGhiYSk7DQo+ID4gICAJfQ0KPiA+ICAgDQo=

