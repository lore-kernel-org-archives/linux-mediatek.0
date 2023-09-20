Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B735CE79A9
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 03:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bw9ms/k0Y6k/cDoPALgWV4/Cg/OyMJgAqIQn4uFU/G4=; b=RiBmsEjWCi4KsdydOzzmJN+nMI
	S+jiv9G9QL8yi+gNDLopa1DJsL1DHcTMA8jTTtlsurzNEYT/W8weTOHikURmEcEcsR1IqPGqdW2FJ
	zIMEQ7vJsXK8qsI4q1FkmszvJBz6QjJc5ndbuIXK7CB1edslmfDXJCflpITNDQA2p0MTZmiIjj64e
	o2EQqMtA3VrWg0eLAab7Dtfze+v4TEy+zArKb0U1OfQKhBAspksjs6l+U3yZylGBNf0ju10lUKlis
	0Dmm8JSVm5J04LiDwMQbie8tswa2j21LpKMAJzviadk1bZBNMYGn02bhIsbm1oEao5AjLK6obUdSl
	sAf+xIAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qinaE-001h6B-1V;
	Wed, 20 Sep 2023 03:08:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qina9-001h3r-2a;
	Wed, 20 Sep 2023 03:08:55 +0000
X-UUID: 029a3e0c576311ee9b7791016c24628a-20230919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Bw9ms/k0Y6k/cDoPALgWV4/Cg/OyMJgAqIQn4uFU/G4=;
	b=V7VksMLlsbExwciEHOhfbsd2TXJyFiMTDI3fCzn28Q7QeT8wYpXtf6Gw0sWOTk/czWX+3r2vc/6kIsiPiayeCwZ8KPrc0YtTCBCRuMQdCab/4FYpColTuYBckfG7ZHplfCEi/XJiAm4ErW9YrOgLY8KUJO3IpJwKpMf50YQ9iao=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:57ffd83b-193c-4918-8367-476d93d5f7ad,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:542f3bc3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 029a3e0c576311ee9b7791016c24628a-20230919
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 843656861; Tue, 19 Sep 2023 20:08:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Sep 2023 11:08:09 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Sep 2023 11:08:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lp41ATM7IEcLLHH6NMoQ9F47optLjrwPYAHZKcP1FjG+eSQQIGtWaKVuXzmN8siZFATIS0H7dsHL7x/Zbr2FOWkNKBU9ZoFObr8F2xnAdUlCB13tiOIQ61cTN+0eatw3xfd3OSaJ0WBBKEW2tuNLCdvfcGxwo4sDZQb1gYvhf750v8UlJYFK5DbITVIuTdcexr75OaF6UYbYMhjInbdHsJyoZtp3IiOjuMfY9KU8wWZ2MohqEujfniFbp4cFlXLn6dE2aLgZiNnPo3C+O4mPKICUNZbYQ24SyE9qpcSPq01RjsD032DvNh2GHEssWQMpMUqZaNdtjf4F4wulrfVFxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bw9ms/k0Y6k/cDoPALgWV4/Cg/OyMJgAqIQn4uFU/G4=;
 b=ncaFIN6lh3vI/4pTil1Ddyk60bkB/YXdOR7UI9+4gVRuJtH7Ceavz8nS31USGgKrfeoLHNPqOG2zUZ3RPMIAmLjFKbL9Yk3Dx3gQa2LvlsfD3/HXwpBl6n0kIa1v6FzqPFizIAKLptJNh2emgsCWBX6ryKQ3Owe+HIttUKYcW+9p44k7tlp1Ik8+qKwt7N+AnHIKGhjvWcqxqeSI91AL7LiuEud4o/ucy7kyZc4cYNJ1/Q17PGq5q7NjRhE/Mt1YR8XKXANIpLnEWR1t2MuDXcO5g9cochR2s2BJDwVBtf0YnFHy0rrs645PMdpGAYb+ED93fHSAQfV94UtWQgfZiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bw9ms/k0Y6k/cDoPALgWV4/Cg/OyMJgAqIQn4uFU/G4=;
 b=kSXsktGBXfiuBYcwjBLM1jqJXQbDC58i3xEHK3+dE8bkhSZeGHIjtkSIxiV6uk7NJ4RBLQZ3MwBKYTEfANPlW/x/l50bjdh8Jf2g8T0siQwzVIitt2/pdYimZmKTKNaNGRQ9ov2OKbX3Xg7moy5LsyAOYrrS8LbSMQ0u5RtgY38=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8095.apcprd03.prod.outlook.com (2603:1096:101:17a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Wed, 20 Sep
 2023 03:08:06 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%6]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 03:08:05 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
	<Shawn.Sung@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?RWx2aXMgV2FuZyAo546L5YabKQ==?= <Elvis.Wang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH 00/15] Add CMDQ secure driver for SVP
Thread-Topic: [PATCH 00/15] Add CMDQ secure driver for SVP
Thread-Index: AQHZ6mWT8NiYsJ8ye0OMhpU+LiyOo7AjCowA
Date: Wed, 20 Sep 2023 03:08:05 +0000
Message-ID: <45125e763bbc4b68e328aaab9f5310a65b26def7.camel@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8095:EE_
x-ms-office365-filtering-correlation-id: 3a9ad672-698b-44e8-14b7-08dbb986cf40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M8qWsqjJvP2ipvOCTwh7C0ueQkuOirom9+kxUXJOUiR3a18MH/7OxhmQzCMpjpjcv3ao8XtI19MoZdD/bL7+iLPA5PfU4dk7SuTo4Y+m8cXZUEK97UKPwNXQKJv4vM+WXiXMhiref14FfVnhj+AvOE/Z8ium6Bjio4hSXvwFhWPEI4ho1OQTnpU+Sa6y8dIwVNEmFt30G5WdoocM1kd/pfew0e/Awup8cBGF/0GTpaI1Skx4FxdbMX814eWnF/sdIGrG8V0kNyOqH/tWe2VDFX0QgBVl0hRU8dd0K/VpsXA0bGTx9Fk0t9bblvw8JIGqI/nxPiHO6Gm0ucK5T+nTJK0zQ3rSe1PaJLac+1SVOHG5BlMqeCsKWsYmjwZZQvm3L0bnFbCXtf7G3TYCeLCa6kjip6wDtfntOqkJNqnztb3obFOA7CXNuCpDYVLePuSPfi5Z6Jvbk5V88h2J1A6OesArmpy/YQyT40gohCIitukmbN4cWA+yeSqbgYB8Ilxgki2UZSkpPuCotzVxUBKzaMo4sQSkgO9BSp/jUPMwLzoGu3xSr/LkvM4okZvdnt/OdIZv4mv5bwV3nGiKjtwfcVhf7L5H9r0aGEFMqaZTkgLf0FtNk9s2bbCt2XHH2Xj2Ai3a7fgyfljLOoeEDUg2kg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(1800799009)(186009)(451199024)(2906002)(5660300002)(83380400001)(6512007)(107886003)(26005)(2616005)(71200400001)(7416002)(316002)(41300700001)(110136005)(66476007)(76116006)(66446008)(54906003)(8936002)(8676002)(66556008)(4326008)(6486002)(66946007)(478600001)(6506007)(64756008)(86362001)(38070700005)(36756003)(38100700002)(85182001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjVGbjBabk10QTJBbDdLd1hhNEdBZGdyR1VLOElLcFpTYzVLUlh3ejgzc2cy?=
 =?utf-8?B?YWtQTy9BbTZSOUVEZWxuVTcxMENBaUF0SUFHeTRKRVY3Yzd5aThTZTNFY3Jo?=
 =?utf-8?B?K2NQZjQ5bGc1U0VKd1JGb3dwN0FNWkNpdVdvUUpNa0RFTGpOWkUxU1JnT2xL?=
 =?utf-8?B?YllxRmR1R05rWXBucmh3cmRiZjh4L2JVNUlwaUR5Nml6WjhTWVVIYjFjY1VC?=
 =?utf-8?B?djMvT1JyajAzbkJSWmNxT2hTcHh3UW5OcVpxR2VOQldYcWEvNFp0SS91bHlP?=
 =?utf-8?B?QVFCQUM3NWZUOExhaHQyRUhTcU9MNUczb2p2WXVONk9BR05keHZld0xVdFh6?=
 =?utf-8?B?SUxLQmZXZDhmTkd0RGh5M2IxcXZYRnJtYzBDQkpQOFFvZWJlNlJMVFRIYng2?=
 =?utf-8?B?OWFMRmxiT1NhWWMyUHpaYTY2L1pMV3NJWUdpUE54VWtmM0xNRlcyeHNNam42?=
 =?utf-8?B?bzhxV2tMS2x2NWFrdzJWT2NPK3c0RGxkT1pjVitwU0dYZTRVeHRLd1c4cWlN?=
 =?utf-8?B?V3lLMHJXdDBmWUF1alh2Y2VUWHl1VjhWSDZ2K0hiaVZDMGNLVTlGVldCTnIr?=
 =?utf-8?B?K0VhVFhvUndpaW1lN0xWV3QyaVBYN1BUOXlZNHF5djlKalp3eE9Pa25scUZB?=
 =?utf-8?B?T2UyVXdRYS9pZ0dpUWZ2dDdRczBKK0pueDliS2txVytVcThLejFKdlYvLy95?=
 =?utf-8?B?bThRNkVQRVFST0laN0tFMjlzQmNnci9QYUFDaTFmZmV3RnFXUkIvOHdwZDB0?=
 =?utf-8?B?bTJwMmJOYnAwaGo2WXNpM01sVmRUb0dnNTlwTmxHVjlVazhJaG5VVVFWclZx?=
 =?utf-8?B?eDQzcGNJa0JZV3JsQ2hGQ21yUVEzbVYzeHhJRzJ6T0NPdlF3TUhTTDE5YmFv?=
 =?utf-8?B?eno3enh1NWlTVGs1bmtQUlpPS0U2YjNnSTRocFh6Mm42Z2lDYW5jYmhiZEtk?=
 =?utf-8?B?ZHV1WHpObFN3YU1ybWhwNi9VOGgrcjRLL0d3b0pUb0R3MHhBWEpNYXk5TGV0?=
 =?utf-8?B?dXpuN3k1clQ2U1ZJWWU1czdoRUlEeTlwa0ZuMGhrdmN3OVZKMjFhaDUvQllB?=
 =?utf-8?B?SG45TjVwL0xSV3BiM2U5UENjZVFkUkpiaWs4OWRlWUxnaVQ4c2lWMnN6QTEy?=
 =?utf-8?B?ZXgwUEtJTzU3YU9yUGx5cnR1U3V1SGVETk5HaFR4UUtuNS8yTm5mTUpud1BM?=
 =?utf-8?B?RkdpbGE0L1BxVHBMbnZXQTFnSHh6YXBNNmxoeXM3WDYrRkVOaU5TMWtLR3J0?=
 =?utf-8?B?eGZvQ2dyQllvUG5JeThxN3NTK2t4cTVJWnNYaEs3RC9kRW95eG9IdmhwNDN4?=
 =?utf-8?B?R2xaVnFEOExRTU1hWlp5d202cFpzVmphdDFiZVJVY09hbTFFOWl1WTBCcnBK?=
 =?utf-8?B?dEM3aGM4bmdtbytyanNsSFU4QjRKQWJGSjM4cUQwQlZuRkhwWncxb0JpWjBZ?=
 =?utf-8?B?UTFlVjFBUytvbi9TVU9lT250MDlsY3NqMVM1NTE2aStLaHFOeXJWOU1nY3Bj?=
 =?utf-8?B?dVA3ZkREZUhDa2VjVmk1aXJvb0x3dDJsRlhpZ1RVVE5TbWZ4N1ZxYjhKRnpv?=
 =?utf-8?B?b0hkTGlLMmNySmZ4Wjl3VFU1UW5ydkNLMURnS1N3SVdFME9uVmlOaUF1OTFX?=
 =?utf-8?B?RjdiRUZMVGxWY1lxaUduMFVyK043OVVRaElSVUc5aWxEV3VrRnB6bFlDVGQr?=
 =?utf-8?B?NGpUanl4Sm5KZHp0bUxZM2Y5ZnJnbmFzU3dRTzA1WWpZU2JvQTRnL2YrOXl0?=
 =?utf-8?B?MkpFM2x2c0JFaUwyWjR2NzNMMEMrSHorUldhQlUyWXVscjNidVRiY2dXdUVT?=
 =?utf-8?B?RXhHNWZCSEpKMzN2WG1uVGtsazFZTkhOTmdJQTBoM2hjOHpCOG9NSWt6MWdU?=
 =?utf-8?B?K2NOejBsZ3F4WVpyN0UyS2xUbFhUbDN6c2t3d0ViSmZ0ZlBlRUtWZkdzUy8r?=
 =?utf-8?B?ZVNkWnNNV0l3SVk5dDMzenFzSkZORDQ5Y1ljUUFJZExuM1FHRHI4eC9VNFY4?=
 =?utf-8?B?SE1yQ0c3NDMrVjZuQjM4NWJmMERmekFIYkFodVJlRE4xckd1SFFGZTZ4Q1k1?=
 =?utf-8?B?U0crazVCOUxEWStaK0JUTG5FQjQxdExFck4vUUtnT3pwOWtUQlVwU3kxM21a?=
 =?utf-8?Q?zwI71bfhXW6vmNesY16nTf7sJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <801CD9069FBB4F4E8571FBF45E4673EA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9ad672-698b-44e8-14b7-08dbb986cf40
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 03:08:05.6600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CUZv2G0+1ddnfBVClrz1/YtyROP3ZcVx0csHmWw5fvKcmIeWx3mC62rNO3ZF+8AmwJSuk2QP1lndVEJyL6ErJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_200853_852226_D084CEAE 
X-CRM114-Status: GOOD (  18.27  )
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

SGksIEphc29uOg0KDQpPbiBUdWUsIDIwMjMtMDktMTkgYXQgMDM6MjEgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gRm9yIHRoZSBTZWN1cmUgVmlkZW8gUGF0aCAoU1ZQKSBmZWF0dXJlLCBp
bmN1bGRpbmcgdGhlIG1lbW9yeSBzdG9yZWQNCj4gc2VjdXJlIHZpZGVvIGNvbnRlbnQsIHRoZSBy
ZWdpc3RlcnMgb2YgZGlzcGxheSBIVyBwaXBlbGluZSBhbmQgdGhlDQo+IEhXIGNvbmZpZ3VyZSBv
cGVyYXRpb25zIGFyZSByZXF1aXJlZCB0byBleGVjdXRlIGluIHRoZSBzZWN1cmUgd29ybGQuDQo+
IA0KPiBTbyB1c2luZyBhIENNRFEgc2VjdXJlIGRyaXZlciB0byBtYWtlIGFsbCBkaXNwbGF5IEhX
IHJlZ2lzdGVycw0KPiBjb25maWd1cmF0aW9uIHNlY3VyZSBEUkFNIGFjY2VzcyBwZXJtaXNpb24g
c2V0dGluZ3MgZXhlY3V0ZSBieSBHQ0UNCj4gc2VjdXJlIHRocmVhZCBpbiB0aGUgc2VjdXJlIHdv
cmxkLg0KPiANCj4gV2UgYXJlIGxhbmRpbmcgdGhpcyBmZWF0dXJlIG9uIG10ODE4OCBhbmQgbXQ4
MTk1IGN1cnJlbnRseS4NCg0KSSdtIGRvdWJ0IHRoYXQgR0NFIGNvdWxkIGJlIHNlY3VyZSBlbm91
Z2guIEhhY2tlciB3b3VsZCB0cnkgYW55IHdheSB0bw0KaGFjayBURUUuIElmIHRoZSBpbnRlcmZh
Y2UgaXMgc2ltcGxlLCBpdCdzIGVhc3kgdG8gY2hlY2sgaW4gdGhlDQppbnRlcmZhY2UgZW50cnku
IEJ1dCBHQ0UgY29tbWFuZCBoYXMgZW5vcm1vdXMgY29tYmluYXRpb24sIGhvdyB0byBjaGVjaw0K
aXQncyBub3QgaGFja2VkPyBPbmUgZXhhbXBsZSBpcyB0aGF0IGhhY2tlciBjb3VsZCB1c2UgY21k
cV9wa3RfcmVhZF9zKCkNCmFuZCBjbWRxX3BrdF93cml0ZV9zKCkgdG8gZG8gbWVtb3J5IGNvcHkg
YW5kIHNlbmQgdGhpcyBwYWNrZXQgdG8gc2VjdXJlDQpHQ0UuIENvdWxkIHRoaXMgbWVtb3J5IGNv
cHkgdG91Y2ggc2VjdXJlIG1lbW9yeT8gT3IgZG9uJ3Qgd29ycnkgYWJvdXQgDQp0aGlzLCBvbmNl
IGhhY2tlciBmaW5kIGEgd2F5IHRvIGJyZWFrIHRoaXMsIGp1c3QgZmluZCBhIHdheSB0byBmaXgg
aXQ/DQoNCj4gDQo+IEphc29uLUpILkxpbiAoMTUpOg0KPiAgIGR0LWJpbmRpbmdzOiBtYWlsYm94
OiBBZGQgcHJvcGVydHkgZm9yIENNRFEgc2VjdXJlIGRyaXZlcg0KPiAgIGR0LWJpbmRpbmdzOiBn
Y2U6IG10ODE5NTogQWRkIENNRFFfU1lOQ19UT0tFTl9TRUNVUkVfVEhSX0VPRiBldmVudA0KPiBp
ZA0KPiAgIHNvYzogbWFpbGJveDogQWRkIFNQUiBkZWZpbml0aW9uIGZvciBHQ0UNCj4gICBzb2M6
IG1haWxib3g6IEFkZCBjbWRxX3BrdF9sb2dpY19jb21tYW5kIHRvIHN1cHBvcnQgbWF0aCBvcGVy
YXRpb24NCj4gICBtYWlsYm94OiBtZWRpYXRlazogQWRkIGNtZHFfcGt0X3dyaXRlX3NfcmVnX3Zh
bHVlIHRvIENNRFEgZHJpdmVyDQo+ICAgbWFpbGJveDogbWVkaWF0ZWs6IEFkZCBjbWRxX21ib3hf
c3RvcCB0byBkaXNhYmxlIEdDRSB0aHJlYWQNCj4gICBtYWlsYm94OiBtZWRpYXRlazogQWRkIGxv
b3AgcGt0IGZsYWcgYW5kIGlycSBoYW5kbGluZyBmb3IgbG9vcA0KPiBjb21tYW5kDQo+ICAgc29j
OiBtZWRpYXRlazogQWRkIGNtZHFfcGt0X2ZpbmFsaXplX2xvb3AgdG8gQ01EUSBkcml2ZXINCj4g
ICBtYWlsYm94OiBtZWRpYXRlazogQWRkIHNlY3VyZSBDTURRIGRyaXZlciBzdXBwb3J0IGZvciBD
TURRIGRyaXZlcg0KPiAgIG1haWxib3g6IG1lZGlhdGVrOiBBZGQgQ01EUSBzZWN1cmUgbWFpbGJv
eCBkcml2ZXINCj4gICBzb2M6IG1lZGlhdGVrOiBBZGQgY21kcV9pbnNlcnRfYmFja3VwX2Nvb2tp
ZSBiZWZvcmUgRU9DIGZvciBzZWN1cmUNCj4gcGt0DQo+ICAgbWFpbGJveDogbWVkaWF0ZWs6IEFk
ZCBDTURRIGRyaXZlciBzdXBwb3J0IGZvciBtdDgxODgNCj4gICBtYWlsYm94OiBtZWRpYXRlazog
QWRkIG10ODE4OCBzdXBwb3J0IGZvciBDTURRIHNlY3VyZSBkcml2ZXINCj4gICBtYWlsYm94OiBt
ZWRpYXRlazogQWRkIG10ODE5NSBzdXBwb3J0IGZvciBDTURRIHNlY3VyZSBkcml2ZXINCj4gICBh
cm02NDogZHRzOiBtZWRpYXRlazogbXQ4MTk1OiBBZGQgQ01EUSBzZWN1cmUgZHJpdmVyIHN1cHBv
cnQgZm9yDQo+IGdjZTANCj4gDQo+ICAuLi4vbWFpbGJveC9tZWRpYXRlayxnY2UtbWFpbGJveC55
YW1sICAgICAgICAgfCAgIDMwICstDQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
ODE5NS5kdHNpICAgICAgfCAgICAyICsNCj4gIGRyaXZlcnMvbWFpbGJveC9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICAgICB8ICAgIDIgKy0NCj4gIGRyaXZlcnMvbWFpbGJveC9tdGstY21kcS1t
YWlsYm94LmMgICAgICAgICAgICB8ICAgNjcgKy0NCj4gIGRyaXZlcnMvbWFpbGJveC9tdGstY21k
cS1zZWMtbWFpbGJveC5jICAgICAgICB8IDExMDMNCj4gKysrKysrKysrKysrKysrKysNCj4gIGRy
aXZlcnMvbWFpbGJveC9tdGstY21kcS1zZWMtdGVlLmMgICAgICAgICAgICB8ICAyMDIgKysrDQo+
ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYyAgICAgICAgfCAgIDgxICsr
DQo+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL2djZS9tdDgxOTUtZ2NlLmggICAgICAgICAgfCAgICA2
ICsNCj4gIGluY2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmggICAgICB8ICAg
MTUgKw0KPiAgLi4uL2xpbnV4L21haWxib3gvbXRrLWNtZHEtc2VjLWl3Yy1jb21tb24uaCAgIHwg
IDI5MyArKysrKw0KPiAgaW5jbHVkZS9saW51eC9tYWlsYm94L210ay1jbWRxLXNlYy1tYWlsYm94
LmggIHwgICA4MyArKw0KPiAgaW5jbHVkZS9saW51eC9tYWlsYm94L210ay1jbWRxLXNlYy10ZWUu
aCAgICAgIHwgICAzMSArDQo+ICBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5o
ICAgICAgICAgfCAgIDY1ICsNCj4gIDEzIGZpbGVzIGNoYW5nZWQsIDE5NzEgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21haWxib3gv
bXRrLWNtZHEtc2VjLW1haWxib3guYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWFp
bGJveC9tdGstY21kcS1zZWMtdGVlLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xp
bnV4L21haWxib3gvbXRrLWNtZHEtc2VjLWl3Yy1jb21tb24uaA0KPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGluY2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1zZWMtbWFpbGJveC5oDQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tYWlsYm94L210ay1jbWRxLXNlYy10ZWUuaA0K
PiANCg==

