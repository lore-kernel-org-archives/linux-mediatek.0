Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85638C77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 08:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vjyFzjP9TphCvKM0NGF2uUPsPops0yIbbZcd2ASLfXg=; b=gxXz8bkDE1k2GnejlQ11esKKzr
	SRktdRnajdbF3OpBbvYeSVrXcJKBgryIAcIB41DuliwRs9XEGilJdMs42WaKS64rjkzX+ZfyyBoO0
	t2Igw9Z2zI5ddyppQCpg11BRtVN44nl5fnx7FdlyPGsGFW1cAnCp7e+SbyDY1aDatZGGrNOVaHwsX
	mVUkJISda7tKK6STids6AY8fLTFr6MqpKZT53N9ugL43IX1fPjrfZnaGrDNb6ba0P6j+pLQcXS8uy
	ulNMB71bYXLtbEk5AcF3t1xx16sEKjIoFD/Ay+9qaMJPTn+KmFTuQMLKyfLCFrl0kfDEIFz96uQN0
	6EgJgpxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4do7-002auI-2w;
	Thu, 01 Jun 2023 08:37:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4do5-002arF-04
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jun 2023 08:37:18 +0000
X-UUID: 786cda58005711ee912e1518a6540028-20230601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:To:From; bh=vjyFzjP9TphCvKM0NGF2uUPsPops0yIbbZcd2ASLfXg=;
	b=nzdGsrI5lAqR8236I+7ofISpZuct1EBgLQqUYyO3z6hwA5avuqLdE5AWz3jUQ7ARLJ6RatmVAIJXrqjwVgjxM01X7r3YI6SnNPmfbZI3pniJXGZdS3nR0gfsBT6fPVbGSuBCB3oXUNZ8ajFUtkZGzGiMPrZbwawaJSis2OM74s4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:4ba23c32-dcc2-4cf9-b6af-de36a4269f05,IP:0,U
	RL:25,TC:0,Content:-5,EDM:0,RT:10,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-INFO: VERSION:1.1.25,REQID:4ba23c32-dcc2-4cf9-b6af-de36a4269f05,IP:0,URL
	:25,TC:0,Content:-5,EDM:0,RT:10,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:25
X-CID-META: VersionHash:d5b0ae3,CLOUDID:8cc23e3d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:230601142845JQ3C03T1,BulkQuantity:4,Recheck:0,SF:17|19|102,TC:nil,Co
	ntent:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 786cda58005711ee912e1518a6540028-20230601
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1804552970; Thu, 01 Jun 2023 01:36:57 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 16:36:55 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 16:36:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/kGqOE8NmfQDxbnL8phxqf+bl8sItk/MfVVnlEg0IQXBu3lBjxgBAmWS89eLHorES1fRFcUbt+MgG7NJFAqttdNyeQ/H90BXXTA2jwAjMqNwZXgAs/QgTgBJwLUtWqqjmEC2Iu0oVQboFXErlHPStwHBDSZwkwJAX+//aKpTzd5Jc82OVn+SruUXic/4+LcLw3LphH63Eb+qbyVluiunR/ZuyW7mMYuIjsY1f17ysjnpADHcjB1NYElNcRgo+hwGgCPSDgNWBOihZgmq0yiG5eH4RXvwuEvRlpS+hno5PthIjz4/Kg7GEvoiuggzm0zbqz/T07Yzk9aW6PKHBnSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjyFzjP9TphCvKM0NGF2uUPsPops0yIbbZcd2ASLfXg=;
 b=LYJ93VNNXjnBPrDdU0GK9+IcKDHx2SjPqkvSpwSXS0q97L8kUQP9x3klS2WJ0Nu3FenvdszpXDL9sJP8GJrILYWo08VPZcrRto4s61Ae6bxeut8uh+5SJF+PQcI0C527Cw74ncVzCQe6ihDiVaCLjXZ6JlqEuGB3qGcjByYyJxBOXHX+1005d4UNPtlzWk8jtfyxQq3u5BLxvxqn7F+q1BymZoNucDz1sIJM/0v+LQByPKAdhWBXylmeD47vfQFvivz816Jm10YGKbIhDNVz4Kp74yVXFP8lL85rQCuD3MQDcTwczoFqnH9XQtK2opphJVpxnULwl/DbTiR8W4nkkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjyFzjP9TphCvKM0NGF2uUPsPops0yIbbZcd2ASLfXg=;
 b=FmrBK9MVUoJig6FdmTVx2QiM77e4H3Vr+5/r1HCW+BSot5p9RTjvsZqtLlsgzZuTp4EQPdBl6XXhj5DV26arRgMbkQRGkL7nNK1Gyo6CPH8yDYEDRPpfn/X2nOaJSnuBM7/6VU2pEqRc/Vpa/g+WuZBLkrHpF8ixfnXsY05bdSw=
Received: from SL2PR03MB4153.apcprd03.prod.outlook.com (2603:1096:100:4e::10)
 by TYZPR03MB6672.apcprd03.prod.outlook.com (2603:1096:400:1f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 08:36:52 +0000
Received: from SL2PR03MB4153.apcprd03.prod.outlook.com
 ([fe80::8fce:558a:2511:c41b]) by SL2PR03MB4153.apcprd03.prod.outlook.com
 ([fe80::8fce:558a:2511:c41b%3]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 08:36:52 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: =?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
Subject: pull request: Update mt8195 SCP firmware to support hevc
Thread-Topic: pull request: Update mt8195 SCP firmware to support hevc
Thread-Index: AQHZlGQ2j/5t2d29tUqJnLEC0lJTeA==
Date: Thu, 1 Jun 2023 08:36:52 +0000
Message-ID: <e9f176279e56dba067ea00f45cf13e7d3ccc8f24.camel@mediatek.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR03MB4153:EE_|TYZPR03MB6672:EE_
x-ms-office365-filtering-correlation-id: 8905679e-677a-4370-7a8b-08db627b5946
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4vzGwkONP6B7CynyyNqfdSGUr4igsb84shfbO1hxMU0xMpiB6IupF56ck3HAVaTjf6pZDCIkVfaPsQ1zjcK2RxQ8tTBmuItIWZGfzD9dUfxdcl5RoHy4SErfxIYFm5QgRXNB4+8KKBkgkbuOshWv4jSL/NE0EnWyW1aAXMWUG8LVqZfMFBwL1bc+jYtxdiagk9YWWVWCcrdTccm48bfFbxVHYL1OLLv759zsgTJruugaoS0WGgpb0TrSjkmLWY7b7Kq+49qWEZ4IQ7oWKp1+U8RKyP4VCxjCsC66caHhDuRZpVqbf4rUGjhh0gXx2HLEzoYmBvXqKN01q6rFfhs86bxLU0Nti3NS9ifiEb/UIvtvLTN5W6+/DXen9V+8jOtNhJVUen8xPUO11vANEEiJ/JQIxFN+1exq2obVItiR7U/YpdA01Et50TaZcxELx5S09PaPgckSxFy/nfW02Q13BXeJ5q+CNdC2CpMa90DCXDw8AiaC2EUsLdt2FdKjgIfjoCjn3Iq3XgStfUa1Wtcs01HeQAZp0eb6zovFaIGEPorxYt9bZS9iLVRwfuuHp6NBs/C+si4IM+mbxSRYKefqd3tZLzwTPD1eW+o9T1yk7SxV7jbq2UhWt9EG190q3epj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR03MB4153.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199021)(966005)(316002)(6486002)(41300700001)(4744005)(2616005)(86362001)(6506007)(107886003)(83380400001)(6512007)(26005)(2906002)(15650500001)(186003)(38070700005)(122000001)(38100700002)(8936002)(36756003)(5660300002)(85182001)(6916009)(4326008)(478600001)(66946007)(66476007)(66446008)(76116006)(66556008)(64756008)(91956017)(71200400001)(8676002)(54906003)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVNQVkFVOGJrVGVYNkg4ZG5PUFp0TWwwbWRXeVFmcEUvN2svaEM2M2FrNmlm?=
 =?utf-8?B?aVFGUXNrdXRaT1ZCdmhaUVNCSGlKdHJqUGRTWnM0OUNlTjNnc3N2UzZSa01C?=
 =?utf-8?B?S2FsS2U1MThNOVc3YkNKaFE5OW0zSFU3WkdUZlA3TmtQb2VaN3V3NVQvTm9I?=
 =?utf-8?B?NnJ2RUNKbU4yTnhnek5TcUswdWd6YkVXdDlFd1NzaWxaUG5kdlZGeHJqaWM4?=
 =?utf-8?B?RXBsTU9FWXMwS1F4NXJkNGNJMzg1bDJXVlFZUlBLSUQ4RFZxamE3Nk9GeVgw?=
 =?utf-8?B?L2ZlZ0Yvemh3THVZZzdqdVZ4MGZkQy9uTzlDdTlEdjhib1hINWJpY1hpUnkz?=
 =?utf-8?B?NlB1NU5NdGd5bEgxQmFSZHBXMjlVWXRON3hNaU51VnNrakQ4ejJlblNxc25H?=
 =?utf-8?B?M2wrTFRBbHpmZUt4MEhPejV5RUFFWmVEbis4VGJrMEw5Q2szVXRSWWNWeUp3?=
 =?utf-8?B?UEpEN0VWaFBhdVcxdWFKMVpSVHNXU0pTaXR3SExqSk5SU1ZIdnpMa2d1SE1D?=
 =?utf-8?B?TEtQUVNPN3luYmQyWlVlaWlzYThlK1c4OEdMN1BTbm00bG1WZUVIVHpkRTZN?=
 =?utf-8?B?dlBuZSt4TmIyRkQzenpWbkY4SGlRWlY2OU9WS2MwSGRrZjJBTE1ITk1vTmhh?=
 =?utf-8?B?MHB1Z0J6SW53bjJISHNyQWVuUEFwRGJlNVZ2TjNKbGdHSEdOd3hZUGVkY1FP?=
 =?utf-8?B?RzNpS1NQR1RlUWZWMnBkK3NJTkh1RFNVT0xwbnFyUHNBaUg5M3NTZ0VQUmpv?=
 =?utf-8?B?UXlSTlJYdXVFZmp3bGxacXBCZmpjMmlucDIzcjh4VlVSZUNRZWtHNDVvL2VM?=
 =?utf-8?B?SVlWTEdwR0k4TmdERFJJaksxc2JtTjZ5TzM0T1NEL1VybzdlVnhkaWl2UHJh?=
 =?utf-8?B?ajU1OUM5bkUzZHVnZ2crYjhhaDJnZnlvZWk5ckdBdjdxVmhuR0puVjRCdlMz?=
 =?utf-8?B?dFVqR2VLRWdINmVqTG01c0d4dzZGU0F3RnJ4NEdtRklSQzhKaUk2YU83dEQ2?=
 =?utf-8?B?N25SNmpDckhkNTVYc21qWENoeXRIeHVTZDY4YWpQT3hrWTR1ZldkTE1KR1ZX?=
 =?utf-8?B?NUtrU2lBclN4OGxDNitMaFgrS3NOVUN5b2JVWWkrZzBkaGtkdjJyUW9lVnFy?=
 =?utf-8?B?TzhuQjFsd0NXVDhQQk5CcFFOVWZpU2cwYk5nUG85TDlyejNwNmEyUzZnMDB6?=
 =?utf-8?B?RDFpZUcyZVgyV3ZGeFlqWjBabkI5YjV0bzhHT0g1OUsyTTR4bXJwVnE4cWJR?=
 =?utf-8?B?bHF1dWxCYVByR2EveDlUcDUrWkRtWlZqeWNnVGk3OUpGWHlPRUNxWFNQcWVU?=
 =?utf-8?B?YzBwVklIVDVEbUFPcWZmWDYwT1Vyc1hZZW42dmx5Z2xoTmFMQmNjUnhWR29V?=
 =?utf-8?B?cjFsQUVXL2tjUkVqUEMvenYvM3liSnhnZGRvNnJiMG5Lb3BpOVoyWUtpU1FC?=
 =?utf-8?B?V0lZQmJlcW1meXIvckxzNndLSG41NFVpeTdacnF2SWJldkxCRDJ3TFFkTVRw?=
 =?utf-8?B?RWdEK3pqb1gwNWcxSnpKaVp2cjJhbDhqdDJqeFUzRVNrblp1bjN4NHpodDVN?=
 =?utf-8?B?REN1bC9ZS3VHYlRiTk9CTnpCZmx4YWRlMjJheWl1L0NNSGg1YS9abmFiSXJ4?=
 =?utf-8?B?bGlqMGtTS0pVTHJRdVZ4em9KajAxblZETTJuZmlOWnJOenBVMWdGUm5GWkZh?=
 =?utf-8?B?WGRLR2tlWjFKZE9NYnc2L2J0UHpkMDYwc29BM1RoaVRTTnRtcFYyM1Q3V2dE?=
 =?utf-8?B?VkNTSzFrYmJnWmZiWldQSi9zMGpnTUVEYU85c25PTW9VUjFRTEZnb3J0L1py?=
 =?utf-8?B?WVlkUTlxa0ZhT3Jrem9adDN3WmYxWUF5dVlCRUZ1ekdnYys3aXplTEhXYjZ4?=
 =?utf-8?B?VnZNWlJnSXVxWGJWRXpucjJic1pZV2twN1d4K0w1WEpWWTRRd1FNTnhEYUR6?=
 =?utf-8?B?c2s3MUt1L2VGN1ZzdHUzclJpUXhkV1VzTnRkRWFiUE96d1pyWjlyZW9USEk4?=
 =?utf-8?B?ZkNjR1RZUGxOVzdZcWh2NGlPdnNFd09OYS8xTVAyVW15bmtSZC83Q1c2Zzht?=
 =?utf-8?B?WUxIWUdtM24vZllOL2Rtd1plUXRNZjN0endtTjVFaDl6WHVnbU1pb1d2ZUkz?=
 =?utf-8?B?NGFqODJycnFlUTRKL3hSdEpFNEZpWXFHK09EUHBMcGwyZkptNjl1dnkzYXIx?=
 =?utf-8?B?YUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E2E235A6A7B124B8686393D47FB25BD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4153.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8905679e-677a-4370-7a8b-08db627b5946
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 08:36:52.1068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: te58jwh293MLs9G9wu9nVPEfx0bk9vN69dCE0pf31ZawJFe2iFTg3aS7CuG9cU+YZHk0uEtUEX1wZt1ySc8vmXe2vgpOMIULnDb4yXR86Rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6672
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_013717_069980_E0D0ED41 
X-CRM114-Status: UNSURE (   7.86  )
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

SGksDQoNClRoaXMgaXMgdXNlZCB0byBhZGp1c3QgaGV2YyBoYXJkd2FyZSBkZWNvZGVyLg0KDQpQ
bGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlcmUgaXMgYW55IGlzc3VlLCB0aGFuayB5b3UuDQoNCi0t
LQ0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQoxZjk2NjdlYmQ4ZTZhYWMy
M2JhYjhlOTViMGQ1NTUxODFkZDQzMmJhOg0KDQogIE1lcmdlIGJyYW5jaCAnZm9yLXVwc3RyZWFt
JyBvZiANCmh0dHA6Ly9naXQuY2hlbHNpby5uZXQvcHViL2dpdC9saW51eC1maXJtd2FyZSAoMjAy
My0wNS0zMCAwNzo0NjoyMA0KLTA0MDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS95dW5mZWktbXRrL2xpbnV4X2Z3X3Nj
cCB2Mi4wLjIxNDc4DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0bw0KODAwMDZkOGM3
Zjc5ZGUxNDkxY2ZkNGVhNWViYTI3ZTM3NDlmZTA2ODoNCg0KICBtZWRpYXRlazogVXBkYXRlIG10
ODE5NSBTQ1AgZmlybXdhcmUgdG8gc3VwcG9ydCBoZXZjICgyMDIzLTA2LTAxDQoxMzo1MjozNCAr
MDgwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KWXVuZmVpIERvbmcgKDEpOg0KICAgICAgbWVkaWF0ZWs6IFVwZGF0
ZSBtdDgxOTUgU0NQIGZpcm13YXJlIHRvIHN1cHBvcnQgaGV2Yw0KDQogV0hFTkNFICAgICAgICAg
ICAgICAgICAgfCAgIDIgKy0NCiBtZWRpYXRlay9tdDgxOTUvc2NwLmltZyB8IEJpbiA1ODc4Mjgg
LT4gNjM1NDEyIGJ5dGVzDQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KDQotLS0NCkJlc3QgUmVnYXJkcywNCll1bmZlaSBEb25nDQo=

