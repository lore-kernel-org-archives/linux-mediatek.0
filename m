Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A55C6FA83
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 11:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=850KbgFBd+/zT/Gd3HLOhHPVrEVmYKRse3zecf7OcAc=; b=NBDN/wiU4RgW2AA3kG6O3cb8p4
	bs/6lLb9sqXFsDWWVdrZJrS2C2+ycyYGbQFbO1+YOXBAQqBJfJOWZchFa6IMOvY6wIZ2XFOPO4FC6
	YWpM7Jwugs85dfGeOzIdhXltRBX63BDVLWl8o6MMbzk2iGWRmyGADDGbmGQWABq5GT/Kan0oIyNqz
	cIH3iYXK2eJEQKpemA/1ge1Qtk3X2tVM3jG6/wcXXlfLvye3kRUmMzS/pueQ7JZIMHV0AA35jTfO1
	P5Mz++gqPHegQ8S1BFzmyBDvM0JMGnRyiuNOG0HXpT73pFz6fKLzkTe3Tp38IHl7BiEUdiDCIgSJI
	2zarHZtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocmGl-004XEe-49; Mon, 26 Sep 2022 11:27:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocmGV-004X9C-Mo; Mon, 26 Sep 2022 11:27:13 +0000
X-UUID: 846b1aa72a1b4c508de5c3e3be3c2ffb-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=850KbgFBd+/zT/Gd3HLOhHPVrEVmYKRse3zecf7OcAc=;
	b=tAnEAbSUWxtHDRlNs7GfEGtge2MOFwliGq7jP3ljfQ37ZjJwPtpZGo4n0HhrQlpARwpbgHpZbJHYwDmaPAR11ysOUhoPfcfGio/aFi03mOPbPJAgEelGSCGu2QWJSocGpaKsG4eKHrASsDN8kRTucvh469rFOfc/dTv7C8ckFys=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:f8024050-2cf5-47b0-b84b-824dda5b8976,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:1c1d40e4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 846b1aa72a1b4c508de5c3e3be3c2ffb-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1103584759; Mon, 26 Sep 2022 04:27:03 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 26 Sep 2022 18:56:26 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 26 Sep 2022 18:56:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+m2A9wFGpo4/1RLxT4zrGrAOy4XjX1X6lsKz8Eeqgwj+HBS26h+hqha/a2Of/Me68BxgbnmKsfAMxzC6xywGywGVqEvvMQ/ug4c90tssdY8yn3VNIc60gR8LU2nYoLDGIgKTZRpsuYov/dJ/Ku+EVQcZgOFnd6jOqbEjRs7Yv2T19QMrpv74ONhMYofbuOLgF0G+vOzS6iviWAzlOM1C8lk91vhptMrCfrAn7zolNKH09P/6mkego5SPeECf4sbCuW95XqWt1GCwYl7GEFiS1toXNdy8GXWZH4BCbi8dt7Kg5Cdn5IJynbQ+vhGg5MO4LBC0zqvzsAXqzm51kB/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=850KbgFBd+/zT/Gd3HLOhHPVrEVmYKRse3zecf7OcAc=;
 b=PI8jRDOtxIQzJ6WfsV961DIsVeBQ1sxGMOGcxEz0x+NjWPEIvvr6CVSmqXvVptthP5Y2/Dw5jgxqmeHZlMuNWw80Wut0ZfQoJCqyAJ5DDYVxkQ+nAcbY9H2PNZZUMvev18EyThrFu4mpke3MLb4YP/LbxGAZ4aoybAxHKLvOF8AjEUo8LNmwPMI4XSDOE7MKIWWnbN2ad+y42AXvQMam4UfVw4bW+mIVnkbynBgDnl4xq1qBdE0zEoYgHd56z7dKnVQqa3vNHLdPuGz8Lt9aKlG9oN9ecAnYRYuzvq9YyowfbHKOtc1/NnQK8tfb8FYo4LzvmFSo0CXyntQNBi+sqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=850KbgFBd+/zT/Gd3HLOhHPVrEVmYKRse3zecf7OcAc=;
 b=syMr475kuXeSUZWtvZYWXKeJNYI6ErHlFXrQ6WHQ5s3e9jsPEBV2bpdT08Ox2XKsSD5azfycyjmCksgln3vGSWPyp+waY5zO8Bg1ZS1pfg/ZFS7P6vKCb0iezjUSbEgt+GD9Cwyo19f0G0bwCfB0t9efQAgCJ6abnzjdFuMxcv0=
Received: from KL1PR03MB7128.apcprd03.prod.outlook.com (2603:1096:820:db::10)
 by PS1PR03MB3304.apcprd03.prod.outlook.com (2603:1096:803:3e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.13; Mon, 26 Sep
 2022 10:56:24 +0000
Received: from KL1PR03MB7128.apcprd03.prod.outlook.com
 ([fe80::3d7:f878:45dc:a6c0]) by KL1PR03MB7128.apcprd03.prod.outlook.com
 ([fe80::3d7:f878:45dc:a6c0%5]) with mapi id 15.20.5676.013; Mon, 26 Sep 2022
 10:56:24 +0000
From: =?utf-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
	<Allen-KH.Cheng@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?WUMgSHVuZyAo5rSq5aCv5L+KKQ==?= <yc.hung@mediatek.com>,
	"tzungbi@google.com" <tzungbi@google.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "yuancan@huawei.com"
	<yuancan@huawei.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] firmware: mediatek: Use dev_err_probe() to simplify code
Thread-Topic: [PATCH] firmware: mediatek: Use dev_err_probe() to simplify code
Thread-Index: AQHYz8ALu79f2n4fBEC4vlyPnY4t363xjbuA
Date: Mon, 26 Sep 2022 10:56:24 +0000
Message-ID: <fd2d0a697cb0530e8b58f57da0a2661967153849.camel@mediatek.com>
References: <20220924024359.26949-1-yuancan@huawei.com>
In-Reply-To: <20220924024359.26949-1-yuancan@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB7128:EE_|PS1PR03MB3304:EE_
x-ms-office365-filtering-correlation-id: 4e82669d-722a-4baa-4b75-08da9fadc0fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ii+DmHO7JQXrzsvZV1+32hc9o+4OtLOsRBHCXIvA32Ji6JWInR9PTd6WgPynnrCs3GXcQfjn7nRlNax/LaCXlHK7olFcRwTV/OFQxCV+xXyiUfrrWl4d3ohT2hy6tHssFErLD+w/M7vuJSekAxFIDR/LvblUdDmn3KlbtoEQ+UX4AZ/dL46uUX5eZVojenKg6EwLnkoFzpWaw/AcXpGp+wdPlzvtGrssv2tz9l3cKLNNYq7srJEiml0MYZ71lnM/s9U1bNqlsgwo20w5YRQFGgmIYHPEWAPjMQVv9TA0j7KsP7vif39LQqstwmrf0gdIWW44jES1GBzAxsSkhZL001Q9uaJy8f2TTv5Glx7I2g00JsHnq7TqpVtU0UcsxEM8HZb7YfWyBSOgwx+K76sBXvcJE8dW8DKx4204mOz33v/LFSDiZW6SloZX9lPGFmGFKGdq4b9OBXz+rdKU+GTcv2S0ofoQi157ivpc2hzwc0x5AYNXB58Wd2JQDUo9Sxodo27Vj4t6RrRwrXmvQdi3Y5Syqz43ctjUHAZ5CN99fEtGAW9UfVuJ73JfQBfAcNovbTU1/WIA3zmS56uPYE/CiY5hJrNioy6tGbi3v61aDmV6yKYwrZVce6QlmSCgXZXvVhFdHqOG5fcRxoj/IoZf7Yql/kkI1KMszENhRJPfCYK4X/oDUb9c3l8ey3NZ+cDvx3w9ALNhcGZJZV0w09ELJpPBU4lwzLr34SwxW2XQc7JulVN4giRbfFjqMlf3M5vzvDpn5112U56Uidn2+w//Qw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7128.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199015)(186003)(2616005)(36756003)(26005)(6506007)(83380400001)(6512007)(2906002)(71200400001)(478600001)(85182001)(38070700005)(64756008)(66476007)(66556008)(76116006)(41300700001)(8676002)(66446008)(91956017)(66946007)(6486002)(8936002)(110136005)(86362001)(38100700002)(316002)(5660300002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1Yxb2o5eW5ZSzMzbWQwbCt2VzQ0TzlBSXh3MTluaG1mZmo5cWtjYlp6empG?=
 =?utf-8?B?UC93cjVMWlJ2RHBVYXdYSUFONEIyS2NpbWQ5S0Y2d094eXQzT2lCYXBLdWxN?=
 =?utf-8?B?bjJPRS84WWdTK0lFa2d0RW05RkdFVDliZVhYM2g2Z0JKellEVVBsc3JQMllQ?=
 =?utf-8?B?T09NWXhmbmk3UElVc2drcmhrMERGSmlENXJUbytUb05HSjNxZE04aG9qeXpH?=
 =?utf-8?B?OTF0QVdTZ2dVTE9vazV6NS8xdVg4TnE1RjhDTVE3ZC9VeEZEeFdpYlRnaE83?=
 =?utf-8?B?WlZaSmNKUExWd2ZRL0cwZlluTGk2ZWlQbW1qMXBpRjdCK3NTVHEwWkVuNE83?=
 =?utf-8?B?VXR6clhQb2U0OUtNSk9aejlWQndXN205eUN0bklKamljUDBqQVJKL3liYUI2?=
 =?utf-8?B?TlBqQWhnUkZOeFVDQTVkaktpN21iVCtteEFUTzlCWWcycUxsQnZyOVQrbnBt?=
 =?utf-8?B?S1dXYkFVbTdNUXJ0SjNTWkx4R1kzSXZYQmNibGpVTXorWE9ycW9aNnVaN3hL?=
 =?utf-8?B?elFYWm5hUGdwb3BtUm1RenUxWVhjMjFMYmVHSXZ0a1VsUFlQalhPUVpvZURG?=
 =?utf-8?B?T0VKb2pFait2UzhMVXdaRnkwS3h0dktWbkJQa1lLanpmTkxyWlkwSGlzOHNT?=
 =?utf-8?B?SHJENVRDOXhDejcxSld4SW1hUVpnc0FqTFZVcWI4SjJoeUVzbGU5a2dWQXFy?=
 =?utf-8?B?WVdCYWhDb1NSY3NsTjV3WkZxdHhWSmVlVkxDSnU3QitiSXBTOWUrYzB4QzhD?=
 =?utf-8?B?Q0xZWXVVRHRkR3FhY3dsYWhxZVFTKzhlb3VlaU9lWG5tNHJmZnF4WS8rR3gx?=
 =?utf-8?B?TTNjcFp0aFNNMVZxTE9QbEZ2Sm03YjNvUjI3U1hUN1pwY3IzNzRYQVFneExD?=
 =?utf-8?B?YndSL2lERnU4dXBPV0thd00zdjcwOHlwaDJVcDF4Yjh5Qm9VUzVIR1lSaDBE?=
 =?utf-8?B?MEhQV0l4U0FrREtPOVJDK3dyenJ1azgxN3pzM2FWbDk3Q1NITWtnUnBDYTdy?=
 =?utf-8?B?RC9JV1J1OGFRZE1PbGVBZFJNV09PUmhYY0hNcnlZcGJYeXlJR2JYek9KVXho?=
 =?utf-8?B?RWJhb0ovcXlFY0Z0TGh5OXBxYWN2YkVzNyt4ZUcyUDl2c1B6MjdGTEwyYmpk?=
 =?utf-8?B?Y2xLMU5NaEFDcHZGZ2s3QlkxajBFN2hJMW1jZEFIYUpieWpFbnhMVjZPcEY3?=
 =?utf-8?B?ZVdKU1ZLQ0dsWUhyemwvRytMVTVEK0xVb1RjNGZKZnpTdzRBd3VKeWpiSUVS?=
 =?utf-8?B?MWQrWFJJSVUrT0MvdVVIcm81dXltUWsxZWUramtGQ1FNRlVHaFVBQlpoZjIz?=
 =?utf-8?B?TW5Ya3Y4WnpGdlJVeWRacitJb1hGSG52YWovYW9Xd25pVWZLWk11NVd3REly?=
 =?utf-8?B?OG9uM2VTSGc1SUlGcHEzaEkxUTR0d2pEcjhzK2ZEeXZMR2FwL2JScHlwSmdM?=
 =?utf-8?B?TzNmZTBjTWZ3cmNqM3hWYUkyYjF6bldUSm5td3FLR1lnK1pJUFRESlFrL2lR?=
 =?utf-8?B?OWJQb1p6ZE1WTTQvY3VHYnVIUzNFbkxXczBQaTN5YXFpbnFtU1dESDFiU2h6?=
 =?utf-8?B?S0FGYjFWdjJHN0hWQmhBMWhQbklkS2w2S1RCM0NVRkw0NjlXODF0ckxHOFZU?=
 =?utf-8?B?RmJoMGwxMkN5enJ5bXRWNWtiVXdWWG9kWUMwZHcvM1J5VXpoalpjNEYzOTVt?=
 =?utf-8?B?bzBlL1lLNlVsOVRxWnFQR0FYcjdTTGhIVDJtQ1VXM3FxUkJOV2ZQWUlJUnY4?=
 =?utf-8?B?T3cxNFdFemxxSnpzSk03YkZ4YXpHU25kV0h6MThabi9hMHBPWEhuMUFvTVRY?=
 =?utf-8?B?b29XaGhuR25iRDJzNmZxTmdVRUtkMG9LZVNiQ2VUY2I4L1lTcmtiUzRhc09B?=
 =?utf-8?B?WGIvOWdTOERuN1FaTFRpLzNtcnA3ZlQ4bkNVQnJMa1VObXBRZDBSclVUTVBC?=
 =?utf-8?B?S0NiRTc2K0lkenYrajFPanh4Q2NVNnRCOC9ZRkxOUFdwR2pseHNmR0Fub1pi?=
 =?utf-8?B?UjdVYkw4VG1LVUF0amtYcTBUQzFEbWZ2SDhLQ09QVy9hOUVhL2czdENBdnJS?=
 =?utf-8?B?WElPMHhZMWRnVXN3RFhJbEdFbmw4WUkycEJIMkFBb0xwNFFFK29KYUlsTWh4?=
 =?utf-8?B?RGtWU1U3UFVmVmdLMUM3SkNIMWcvbi9kNnJiNmN4TElUV090TlZsYWlyUnd6?=
 =?utf-8?Q?xDxrbdz+SimqtDZAVfEh5/Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B694D751BC543041A7467D2912A9553C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7128.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e82669d-722a-4baa-4b75-08da9fadc0fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 10:56:24.1977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aLXm4r87ImDBdMCPhKvj0hLbonqMiMUKmJf2skECArFD4JJ87E5Y7udYQiiySIcg8iqMUYAQ5FCXRIQr6UQ+y2lCeTYqyuCcmIezWBLvogM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR03MB3304
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_042711_979483_1B721268 
X-CRM114-Status: GOOD (  16.90  )
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

SGkgWXVhbiwNCg0KVGhlIHBhdGNoZXMgTEdUTToNCkFja2VkLWJ5OiBBbGxlbi1LSCBDaGVuZyA8
YWxsZW4ta2guY2hlbmdAbWVkaWF0ZWsuY29tPg0KDQpUaGFua3MsDQpBbGxlbg0KDQpPbiBTYXQs
IDIwMjItMDktMjQgYXQgMDI6NDMgKzAwMDAsIFl1YW4gQ2FuIHdyb3RlOg0KPiBJbiB0aGUgcHJv
YmUgcGF0aCwgZGV2X2VycigpIGNhbiBiZSByZXBsYWNlZCB3aXRoIGRldl9lcnJfcHJvYmUoKQ0K
PiB3aGljaCB3aWxsIGNoZWNrIGlmIGVycm9yIGNvZGUgaXMgLUVQUk9CRV9ERUZFUiBhbmQgcHJp
bnRzIHRoZQ0KPiBlcnJvciBuYW1lLiBJdCBhbHNvIHNldHMgdGhlIGRlZmVyIHByb2JlIHJlYXNv
biB3aGljaCBjYW4gYmUNCj4gY2hlY2tlZCBsYXRlciB0aHJvdWdoIGRlYnVnZnMuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBZdWFuIENhbiA8eXVhbmNhbkBodWF3ZWkuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZmlybXdhcmUvbXRrLWFkc3AtaXBjLmMgfCA3ICsrKy0tLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9maXJtd2FyZS9tdGstYWRzcC1pcGMuYyBiL2RyaXZlcnMvZmlybXdhcmUvbXRrLQ0K
PiBhZHNwLWlwYy5jDQo+IGluZGV4IDNjMDcxZjgxNDQ1NS4uYzU3ODgwOTQ5NTIxIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2Zpcm13YXJlL210ay1hZHNwLWlwYy5jDQo+ICsrKyBiL2RyaXZlcnMv
ZmlybXdhcmUvbXRrLWFkc3AtaXBjLmMNCj4gQEAgLTk2LDEwICs5Niw5IEBAIHN0YXRpYyBpbnQg
bXRrX2Fkc3BfaXBjX3Byb2JlKHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJ
CWFkc3BfY2hhbi0+aWR4ID0gaTsNCj4gIAkJYWRzcF9jaGFuLT5jaCA9IG1ib3hfcmVxdWVzdF9j
aGFubmVsX2J5bmFtZShjbCwNCj4gYWRzcF9tYm94X2NoX25hbWVzW2ldKTsNCj4gIAkJaWYgKElT
X0VSUihhZHNwX2NoYW4tPmNoKSkgew0KPiAtCQkJcmV0ID0gUFRSX0VSUihhZHNwX2NoYW4tPmNo
KTsNCj4gLQkJCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikNCj4gLQkJCQlkZXZfZXJyKGRldiwg
IkZhaWxlZCB0byByZXF1ZXN0IG1ib3gNCj4gY2hhbiAlcyByZXQgJWRcbiIsDQo+IC0JCQkJCWFk
c3BfbWJveF9jaF9uYW1lc1tpXSwgcmV0KTsNCj4gKwkJCXJldCA9IGRldl9lcnJfcHJvYmUoZGV2
LCBQVFJfRVJSKGFkc3BfY2hhbi0NCj4gPmNoKSwNCj4gKwkJCQkJICAgICJGYWlsZWQgdG8gcmVx
dWVzdCBtYm94DQo+IGNoYW4gJXNcbiIsDQo+ICsJCQkJCSAgICBhZHNwX21ib3hfY2hfbmFtZXNb
aV0pOw0KPiAgDQo+ICAJCQlmb3IgKGogPSAwOyBqIDwgaTsgaisrKSB7DQo+ICAJCQkJYWRzcF9j
aGFuID0gJmFkc3BfaXBjLT5jaGFuc1tqXTsNCg==

