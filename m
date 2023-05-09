Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E7AC7EE26
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 May 2023 14:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yB4LFzkYojqVIh/WG1vUoXh8jz4XXClWigOtDvxb2Tw=; b=369BCElR2xwop0MFkzj4rSDwFY
	DPv5A+CcqPJs96hCtBbJGWDEYSJ4poAk9xqH/4Okxl4OIvoZb9jfdZAFiYT/PDizu9Z858caV/Lqz
	jO19cAnym+kPoiliXxb+9baIMijKcMzCJ4/oyYg7+SBoVyMfhJaL/f4uIuEWYvJYvJdm8SkW6KwPK
	iq0F3CoMdjA064zUr9g10Yy7CjAaLKjWmzAIlrS0ccW0jKh+8PmqcvXJ0yUAc6epeVvwaUF2AmwsZ
	MKwlTabKL5RCeRb+j433xnJHB+f4X93xbp0KDYxV1PVmdqc/JJEigc3yJpJ17O8U45vuI93KYzDx5
	I4jJftNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwOWa-003aZ1-2X;
	Tue, 09 May 2023 14:41:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwOWX-003aUx-12;
	Tue, 09 May 2023 14:41:06 +0000
X-UUID: 81cb73f8ee7711ed83ed1395ce914268-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=yB4LFzkYojqVIh/WG1vUoXh8jz4XXClWigOtDvxb2Tw=;
	b=cawQKzm0qhM67kPgGf/JXfzVjg4CT/ZTFZysI+BRsJGlPO1aA5IVSRUZSU+CBCzL2FSkbs78Gsj2sDJTPWnQvBMBycPI9jP8BfSCJwIc45NkOMKGd7vBeQ2evz46auVTbJ53eyEPdxdZfKSQN9zPKbL5U8cEJknLFWFg/9F5CDk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:6012de44-5974-4efe-8a23-812b3f4fbe5d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:178d4d4,CLOUDID:31de9c3a-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 81cb73f8ee7711ed83ed1395ce914268-20230509
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 778727435; Tue, 09 May 2023 07:40:56 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 May 2023 22:40:54 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 May 2023 22:40:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixH/DWoICYV+WGRURwwE4y6J9/LTgMwS3sJ+Xs5Q4dYnyUZb09II7feF+dzQutathZU1ABjtLwmFf0fay21vw0CxUlHWfttAzxgWq4C6gHoBVNShP/4W3BFTVLlr3uLb36nqpt1ej5oaJrI7u+F9TRX48lfLuJUKtfwt33k2ZSwkWLAkb8EYEAlxQblnoSsGXkkX6E3UXYQNO3wZoSn6ER6zL4BJyDYh+KHfpNXZY0HGxb7d/BTK09Ykg8a7pGNQDV0+EnfJV+bJ5dFC/Z4tg+yzveOFRspsCDaE2GGS0wnFnvDR/lAwhfLGRtOkLZuRyqMy2ULbvRycBVORqtJlwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yB4LFzkYojqVIh/WG1vUoXh8jz4XXClWigOtDvxb2Tw=;
 b=JreewoVTO37ZEWVc+sJCxHYr+NIagRuof3WtGj+5rjjoh5jMEXiH4QPpphyOHVwlCq7nac8Cd5uR41t+nzABq8OzY8R78y3n2LOq7mRp/wCbWB93luYaj+JSB5CpqFBkPGGNn92y+58obr/Llu+tm89u4Ji66kAm9O1wkAB+Msue5H59I5qCJcCKeSi18fCnUp3n7VKCuiE0eayW3zS7k7pE3eTLNkhJgGBdAPl5D037L8JcT2SI2Dh5s2R3hrx5YxDK+CoQmcQ9MdDPXd8DUCjKVcwVzhsR8WDbEQ54IFW1pcZbft/OECoan+roZ9ddX6HMYQ2fVfbuPAQUjoR6IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yB4LFzkYojqVIh/WG1vUoXh8jz4XXClWigOtDvxb2Tw=;
 b=p0ZiQU0Mvqc12dsgCeUMfPvti6ZUTD3P9D2Wba8x476wEP5mXuMuaoqbcbnYtVS2oNsDydLPjktPkkkQa8SFb0Q8N83vy1MHOxEVJaivhSIez2yrjRixqELyKQjh2oHhwVudkD3/xHx3p8t7AfprEKNSjaLm3AI0toP4W9vLizY=
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com (2603:1096:803:3b::21)
 by TYZPR03MB5995.apcprd03.prod.outlook.com (2603:1096:400:12a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 14:40:52 +0000
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::66d9:2bd0:26ba:d9bb]) by PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::66d9:2bd0:26ba:d9bb%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 14:40:52 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"wenst@chromium.org" <wenst@chromium.org>, "kernel@collabora.com"
	<kernel@collabora.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 06/11] drm/mediatek: gamma: Use bitfield macros
Thread-Topic: [PATCH v3 06/11] drm/mediatek: gamma: Use bitfield macros
Thread-Index: AQHZgBdycBha5qWq9kGZQo4+7tMpFa9SCFGA
Date: Tue, 9 May 2023 14:40:52 +0000
Message-ID: <624a9c767af6fa079ba8d600815d4cba5dbae767.camel@mediatek.com>
References: <20230506123549.101727-1-angelogioacchino.delregno@collabora.com>
	 <20230506123549.101727-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230506123549.101727-7-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU1PR03MB3062:EE_|TYZPR03MB5995:EE_
x-ms-office365-filtering-correlation-id: 9e0bfc60-c4dd-4814-a932-08db509b6399
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: grG6CQ2VWFf6j11RrPET9akExR9No9d0/l064YALmDHVd31lZgh40KbzwU1YfVdtKlF4vU/WMXMFWMiqhXTrVGF6k5WBYvAISm+s4fStdV2yNVjOJzDH0fYjcSAGkWMX+v5rf9FwTSQIgJTETYFnBO13dLzOuLMDjdEYLjg+DApnCSOzxWtKzqyRQe0cho0K89oq8PPdP6jpr1eF5ob+1SyFCiFdinNuKFQ4GcN38ho/djRMZMvBcYS06IIPaeWO08kne5LIUndUXrCTrVJbVZoE34r8RwwyLAcmaaWcuJBKOjmQQumg84kjb2LbjJE0KhjXQj9QlgGV2fgeoRT6e/Tn/Ku9lp9zCQyqHVZkf40qKOITlcux4//GjHJK81eGokKhjCcMbnef+h0rEcQ2mO2rfUaAMXrynhPEaHC1LWtwwl15aYP3xp94gUVf3pYPFpa/JlyfIFDP68fHV0xz1ZLcBgx+pQCDUCPR8Lb+JroKKNkES3zBWHaMzHQ3fke1NdcSOxMYICbzYzPCogj+PgCfrH0xGioF5LRwwacoW25T5sARRCZzP5fTHSKf1vtpXVr3AMepaURwfJPk8A6axagd6BfTKoNmU5GEdblod9XwO4WyRKNkWyw60qKi6fVq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU1PR03MB3062.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199021)(66476007)(4744005)(7416002)(8676002)(8936002)(5660300002)(41300700001)(4326008)(316002)(64756008)(76116006)(91956017)(66556008)(66946007)(83380400001)(85182001)(71200400001)(26005)(186003)(6506007)(6512007)(478600001)(6486002)(2906002)(66446008)(38070700005)(86362001)(38100700002)(36756003)(2616005)(54906003)(110136005)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3B3L3FUN242NlV3RW5BamZNbWdXQy96bDhMNmVzVGlkb3NzOHhsWWNDNURj?=
 =?utf-8?B?ZGV2eE4vVlVidUc3b0VMRjBJR1NRQjlQek9yV0dtY3RYNE4yQ3Z1S2ZJZVZZ?=
 =?utf-8?B?SmUxNWFidy8xUUhQS1FMT0o0bU1Yc2Yxd0FpQlhheVlhZ3Y1aVFIcVdwbmkw?=
 =?utf-8?B?Sks2cTZZUzZsZkppSDRZSW9ENi8xb0g4Kzl0c0ZkSzhESE1hQlZJWCtvOEx1?=
 =?utf-8?B?WFJnd1RVeXpNT1RiQUJxSlp3clVSZlpzZkdpZXp3SCsvYzlNVjhvU2tQUUla?=
 =?utf-8?B?YWtJU0p2YXpkcUpwdHhoS0p1QkhEMDJObG5xekQ0bzMxaldjeE5zZ0xxYXM4?=
 =?utf-8?B?NjQ1MlVWNUZPM043YVhTTWs3TUZ4K2Y1YWRUY3JWMStKV1oxU0NJRjFBcTBL?=
 =?utf-8?B?OStOYkdZTDdlV3B3U0R5VHJ6aDJxTm5obU8zeS8xWDkvSzllcWVSM3lXVVpE?=
 =?utf-8?B?NUxPL2dGekFCMTdpeVcvaG11T0UwZjhmWkRCMWt2WDVNWkU1UDBITy9haXVm?=
 =?utf-8?B?V2FFTjZyY2l4a2NtTklTbFZ4RUozMjNuMzUyd0tnNzBMOGRHdVZzcGhHWmJC?=
 =?utf-8?B?aWNSZWU5a1BRamlQZ0Znam5TL3lLTG8vMW1haFdxM28vYllZeVpjSFczbk1J?=
 =?utf-8?B?L0lVUlVYUm1oWEJXbU15cS9mNXVoZkEzb0dMYVo0VmsvaUszUU00ZFlUeFpX?=
 =?utf-8?B?Y0FaRko3eDhpYXBpREF0UWVNQis1NXZTV3VTYWpJdEV5WWduN2xNenc3b3hX?=
 =?utf-8?B?TlJMWGp1bVE5emNFQmorM2c0T3ZVenVBYjBXbGhMOGY0SHEvKzBRSXYrRHBo?=
 =?utf-8?B?cGFrNHRiVzByVk4xazR2M05JNVh5OGNWR3lGR0Q1Yk83YUw5MWg3Uzc5bFFv?=
 =?utf-8?B?cDZDb1ZYVitIVUlVVEZlYVRJUTB2cDRQT3JUMHRycy9hSHoxQnFOanNWeEE5?=
 =?utf-8?B?Rlg5UUFEM1dUY0MzcEttNUZ1eUI5M1lzckxqOEpwZExHQ3pTVzJIQVhTelhU?=
 =?utf-8?B?UDNVYWxRZTJVZTdiYzF3bDZNUUtuOXdqd2g3VjUrWndhWVNraVpzOU5vclNo?=
 =?utf-8?B?aXE0Y3lVZHNnRlJjUXlYSzhZSCtDclBJbGhjQ2M2Q1VSV3BYQlZndG1yN3Ba?=
 =?utf-8?B?cklsYWR1LzQ3dU1FbGFXOFUyeDVJZVR2cy91UnFVbmhKQ1BDa0tEa3hRLzlF?=
 =?utf-8?B?NjhEcXRJS0VLdy9SWmx6NWxGM0lNUWgwek0zb2xyM3JvVEZjNkR2QVpLYkMy?=
 =?utf-8?B?eVJzTHYzdURBOGFiRTcwTFFiYWhNS0ZRVWlBVEFwZ2xDZUd1by82RDlpOW9p?=
 =?utf-8?B?b3IxMDFjTmhtV1FoejBwVmhJZmU2ZS9qWk5lVUtOTm1jd0VGanJnRWg4dkc3?=
 =?utf-8?B?UEd0bU5XaHdhOXgxY093aGc1allmeG5LaTBhSmwxU1RaMHl5L2IvVnAxd1Nx?=
 =?utf-8?B?SzJDcC9uNWEwak1VNmwwaHM3cXBTemlvV29MQXAvTHkxVGUrM2tKcVNYLzhv?=
 =?utf-8?B?Ri9BZEVseDlBaGxnaCtqSGhTTXA0eVJpeXJidm1LZHpyNkRNNHNBZy9oVm5O?=
 =?utf-8?B?TC8xNG56cjBTYWFYRVZmVmJUT1BhcVdvZHpwWGlWTXRIS1N6NWtWV1dWdWJh?=
 =?utf-8?B?elM4bnRnOE1lbkUxZ1lNY28zY25UZ25rWmtNbmdQcXhYMDVnaUdZTjJBQ25n?=
 =?utf-8?B?TGF2NEZSNnBXblNRUzNGN3RNa3NnZ1NaeWh1WEdmQVgyNnByWWtLQjFMN0gr?=
 =?utf-8?B?WVJFZmEvTzg5blZ1MVI3Rkk4YmtnTHo1SjE2cFBkYXkxSDlRaVg0QW1MLzVu?=
 =?utf-8?B?RGpZRjJQaytpNjZPcWxhbHFpVnZ0MVpxVnFuUzNVSlhBWXlsa1RtelJSZGtV?=
 =?utf-8?B?K2FGTTJWbUxlY0R3RHJ6eThtMVRVQXI0QTdvSU5mTmlxa2pwWkRnbUVWYUlv?=
 =?utf-8?B?Z3hpQWR3bXNoWjVSNVE0dWFmR0c5S2tsTm1mck0wZ09URWQxOTJrMzVZVDBo?=
 =?utf-8?B?NGJnc3J6YkxKZng3NSs0SGgrcmxVWHo1bVZ1WndQbVNlNTRuMXlBa1d1SnI3?=
 =?utf-8?B?V01lZjN0b2EvaUtYVGJhZHBMcVRlTGRKcCt0MTZzVHVlY2pRbVFtd244YkRt?=
 =?utf-8?B?MVdOeTh5L29vdVdKUUdka1pwTnpHSTZEemN5b0kxWHJhNFVyR0NlNkx1QzNn?=
 =?utf-8?B?SWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F68C461E5C38814C9C6F87C730F3FA57@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU1PR03MB3062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0bfc60-c4dd-4814-a932-08db509b6399
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 14:40:52.4114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GuaTniJuFL3JoHqNPScP/PoDPiNTO5DMx692eUbrYTCaceUiCRyjIAeJZwYl2XKNWNHKjSByCaJyBg8f/m4a2u94EYp9cyboNFmUwAB9ZxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5995
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_074105_367925_A42BC08F 
X-CRM114-Status: GOOD (  10.40  )
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

SGkgQW5nZWxvLA0KDQpPbiBTYXQsIDIwMjMtMDUtMDYgYXQgMTQ6MzUgKzAyMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJp
ZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IE1ha2UgdGhlIGNvZGUg
bW9yZSByb2J1c3QgYW5kIGltcHJvdmUgcmVhZGFiaWxpdHkgYnkgdXNpbmcgYml0ZmllbGQNCj4g
bWFjcm9zIGluc3RlYWQgb2Ygb3BlbiBjb2RpbmcgYml0IG9wZXJhdGlvbnMuDQo+IFdoaWxlIGF0
IGl0LCBhbHNvIGFkZCBhIGRlZmluaXRpb24gZm9yIExVVF9CSVRTX0RFRkFVTFQuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dpb2Fj
Y2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEphc29uLUpILkxp
biA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0K

