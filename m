Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEA8C10F1B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 07:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Yhcg1kOn2Y/Fp2EHR0ylqr6v+r7nxb2ijmVSj1H+AA=; b=cLE5+YvwSK0Arm0eMy2CkmImyw
	o1fbmaL5fv4NefA33WjB8h9iae8ujVtl9H5BBxV234Z+zP3z5ngqyIXzax3W1fcSsXTbuwFE0rre8
	Qaj+nIqPNNHByJK0b1Hd129NMmh1XjM+Wy2gmccDhpgMcy0yhWK8toRiTryMrZBs9CXWFj6MAeX7F
	DC0fcMbts4BGWFdlR9R3aNzGWoJkfaNTWV62Cui2Lq6xet0ZTWKA/2uHC36ZqvPW7uXgmwoljW7GZ
	jvxsiKvG1U3SghRRWnAdOKbZWuXvn2Z2LtFpxTaAUOdInmnSixzFWAg4oZqPsTjHFCJQjiFBQkCvQ
	MlEF4yrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA4np-00B7Rj-Ff; Tue, 27 Dec 2022 07:55:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA4nk-00B7KX-P9; Tue, 27 Dec 2022 07:55:10 +0000
X-UUID: 856161a3a66546c6b1e801604df04b7c-20221227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=5Yhcg1kOn2Y/Fp2EHR0ylqr6v+r7nxb2ijmVSj1H+AA=;
	b=N362pa8i1+g1vjz+5nAv4uc7EFFKG5bvSJvxit2DkcjL0MM9RnqUkqQ9+kBSP9RcXTSrKqMqrFtQV7Qi8zwGfKvRHGLFPBxVjJgMbyWR8vUvwN68y9TSaYFuQ42ypbjKktOKAzVIxMfuSeCNBTcjOaQSHBxkYab7Au0KafT3waU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:d0426379-946b-4d6c-82a9-44340ed40d04,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:83fa11f4-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 856161a3a66546c6b1e801604df04b7c-20221227
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2038243455; Tue, 27 Dec 2022 00:54:51 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Dec 2022 15:54:18 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 27 Dec 2022 15:54:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GebJvumGxTurOlezoZZYoYXRXPs4e3q2g8wo7lK3ajT+D70oxPZRf2a6YonB78pICLnLNnBb8/qwZU5CevRbkZLqwRgwoJq77k0q2J1lcczSrVk+wbLCWGYxDbbjM/6tzewgBOMCnJCfcKy99vyz4D74eRVKjCA2omZWfwG7S1x/a6CLi3o/hWHsRts5IM275L7/CpDB7wKbw8fNP9GQHatYYAfLIb7XeMVrYFl81ykE66Ex2b7ks/4W6mZcoUFc+vV6PQTD9v51NARFVlqJV4TrBXPOomFzTJg7p1GumBlPfZFkDZmjAgBIHB9fl3S9eh1M+aJYvEd1VbDD+P7yUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Yhcg1kOn2Y/Fp2EHR0ylqr6v+r7nxb2ijmVSj1H+AA=;
 b=lrtv/aeqyGFWmxFkUjR+k6XVuT9b0aKW9jQfCVQ0ts4pVcqp7rl5DXiezdUnrsiqKGpFomPwoqroMQKiViKftzAs13+ngEsE6zH8IzUlRI5dUQ5MhW9qBXeuQFCkym+u1A6vTcuIxDIltwbc0oLY572CUkJxrwkTzMUYgR4IbtxS73TNUb6GmK9ZSP/a2aIK/1/8UH7gx1fXr78xC8UEtRFBISHEIBH7TQ9ya6iezoZGfTF979dmAQPkGncUb+Ed8C6zWgvYE7vApcAmy/ZTQrlVj1jbAnciMhkHcIhMKN97EaalScX6/WEKT+/Aaujf08yJ136a6PEkudex+9Ia0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Yhcg1kOn2Y/Fp2EHR0ylqr6v+r7nxb2ijmVSj1H+AA=;
 b=iD5TIgLo9UWFAo/S9ZjThXHrEqKhp3Jxykak6M/pSZJNGJlNu6kQwcUP+fH1EFwar87E7ECB9RBtslks/BAWpRaGpVO45UoATIpQOdD0ho/BAfZ00OxPPocoCOWYgDsrWE3H2J94w2uVX30K2WGfDyeooFBCg3SW+WEzCd+2Y9M=
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com (2603:1096:820:8::11)
 by PSAPR03MB5510.apcprd03.prod.outlook.com (2603:1096:301:65::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Tue, 27 Dec
 2022 07:54:17 +0000
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::9386:8c80:d06e:1c5b]) by KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::9386:8c80:d06e:1c5b%5]) with mapi id 15.20.5944.017; Tue, 27 Dec 2022
 07:54:16 +0000
From: =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>
To: "wenst@chromium.org" <wenst@chromium.org>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	=?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
	<yongqiang.niu@mediatek.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"nathan@kernel.org" <nathan@kernel.org>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"airlied@linux.ie" <airlied@linux.ie>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "nfraprado@collabora.com"
	<nfraprado@collabora.com>, "ndesaulniers@google.com"
	<ndesaulniers@google.com>
Subject: Re: [PATCH v28 05/11] soc: mediatek: refine code to use
 mtk_mmsys_update_bits API
Thread-Topic: [PATCH v28 05/11] soc: mediatek: refine code to use
 mtk_mmsys_update_bits API
Thread-Index: AQHY8nnThJFnySWTO0qldYSJ6lapG65ZD7WAgCicIoA=
Date: Tue, 27 Dec 2022 07:54:15 +0000
Message-ID: <2c88e8f6327475539a1c6a8d9d8679c08efc2a85.camel@mediatek.com>
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
	 <20221107072243.15748-6-nancy.lin@mediatek.com>
	 <CAGXv+5Hj-H6Q3N+j2tEntd9M=9p0o7TxWYn_4aawhqFUbX7+PQ@mail.gmail.com>
In-Reply-To: <CAGXv+5Hj-H6Q3N+j2tEntd9M=9p0o7TxWYn_4aawhqFUbX7+PQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5175:EE_|PSAPR03MB5510:EE_
x-ms-office365-filtering-correlation-id: 08ff4877-1e5a-4fcf-7708-08dae7df8d4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UBviZXJfUd3NULlBhpavHDUPn0dfN1kSVOKPNj1oM9TDg/BKNPPQzHTXQxuWtBRKpVNI0CgwylLb4OvUIQ+Zt0VmBGf0SDP9cQGaYNl1CcAOJFcszSmVnsUC0T9RX2PM/PsNFTcJEocyXq0pcT3hblgXQAAH0rfHtTRP1Ven9uxRDlYune17URQz1Ccl8/txonBEuE/mmuvejNpfvbLhmrVY2V1VESdvBoGzFGQEq8exeIslD8g7960P2dkH7Z5IB6Px5hSYJgCFg28qCORCZjYYFBQcFcZ1wBLOmYQAiGmZXVRaswz3aiYvPBm4UQ1XgY2xvy/RRSIu856oHnsKuxrYTYzKYIsYlgwqKOp0absKSUAV5myOM8ts6vD1rEvSt+9npQhheX4m8KSjwjzkPYxfdtgONAhNDnNnxEt2ejRatiZumuaer8LQutkZETxwSNROhgy29GAljP+zoaJb+9SKUFvTqPZEiTyRTVAok3ncakvAg4V8a3StAERkWcURRjdIYoQG7cPz95KZkt5+oSCobKPlt3ABICOYoZ4Fvku42ull1nSBqKsP1HCPOA9ZvKw4z+K95dLGhAQaBtTFIaJgNUzcRM4420QadJSyn8tozwRXyoa/fo2yzTZUeUMG7GuXlg/JA0eU+/2qgAlWVK7AvNLGHG9VIPPT51esr5DrO9wkWhyafnK5P5C5yw+cU9d5DH0pi38+KRu6G3w+9Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5175.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199015)(54906003)(6916009)(83380400001)(2906002)(7416002)(316002)(36756003)(85182001)(38070700005)(38100700002)(6486002)(2616005)(478600001)(122000001)(26005)(6512007)(6506007)(53546011)(186003)(66574015)(71200400001)(86362001)(64756008)(66446008)(4326008)(66476007)(8676002)(41300700001)(8936002)(66556008)(76116006)(66946007)(91956017)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clUwMGFxUW10SlRNZTdzeXBDNFN0QjNMSWdsdy8vbzM5ekc5UW1vdC9ZaWNa?=
 =?utf-8?B?UjMybldIcEhhYnZMNk5YOUF4cXJiUzdNR2tmeDB2dXcwVmhFSjZYUzZSS0Iz?=
 =?utf-8?B?L0sxMGROdEJrMHIwM0M0aW1TaEttaWk4ZnVIRThBV3p2SUpJOFZZelhJOWx4?=
 =?utf-8?B?N0VTbUFJSGk2QjVEYi9YbC9KZ0RneTZneVRhZ213RGo3Mkw3NStTSU5WbmpY?=
 =?utf-8?B?N2tQY0c0UVphZlpKVTRvbisrSm9Nd2owakI3UDJrVTIzdkJhSFQzYTkwc2Qr?=
 =?utf-8?B?QjEvZWx0U2h5Y0JtSTNIVXF3WDNxOExYaEZ3SlBnTnNVRWxmRmRtOENDSEx1?=
 =?utf-8?B?dW5vYTlZMGJ6aENRSGNwR3RRWmF1bml2cU9rZ1RuL3NEMm9JMjFOeVNub3NQ?=
 =?utf-8?B?QUZ6cTFVRGs0VnY4SUNFQytRWjNFNFhCOGU5eVZFT3BQeUhjUmpjRmNtQnJm?=
 =?utf-8?B?THROdUtMMWd2WG1sOVJpbWVBSnBLMjFrV3dJbGtnNGgrVytFTCtOVGE1Mk04?=
 =?utf-8?B?YmNkZlFjZ3kzZjY3VENUQ2xBMmFGa0JwOWhzSitET3Vsa3ByOXRyZ1BnYlV4?=
 =?utf-8?B?bmhqSEpDZUJhRlVvay9odHNnQkpYTURibnA0OWJUVDFkS3dneXdGN2FFd3lt?=
 =?utf-8?B?OC83LzBaNG1DdzRRS0tTeHoxaFZGaHNTYzAwV3BXa0RPWGR5SGExTHpoc1VG?=
 =?utf-8?B?Yy9SRDd0dTdVWktBdGozU1RPQkdoTHdZVTZBQ0p3QSs1Z1Yva0dIOGl4d3Ri?=
 =?utf-8?B?TFI2VVRtMDBibklBdnJBUkRkT0IxckdTNVVjUmdOMllOMElWbU84U2dEanZI?=
 =?utf-8?B?TFAzWUpqK083NHJiQ1pKdERQdE5oNFlCQ2N1cGVTd2YvR01kRXNwMUN6Vitj?=
 =?utf-8?B?d3FXODMva1NvazJ2NzVXTDhCTTVTZEFGZW9DNFc0TVNkQmI5ZGt3VDM2NWJo?=
 =?utf-8?B?L3U2ODk3UnhrOGhaZ2pFZUlLNFBuMUZmTzNINXJ2TDVWbzZWTEdaQUJtcGFL?=
 =?utf-8?B?Z2FadUZNNUFWSktidmlJamZrekIxUzVVcEtnbmZMUUswRG5LUlZGMGU2cE5t?=
 =?utf-8?B?MlBvdnVIQTg5SW9tekcydnVkSTRvblZ2Mm9DV09YdWFTeEN1UHFHYjVqSnF1?=
 =?utf-8?B?ZWM1alpvQ2h6cldlY3BOWEZRWlkvRkJqMzhJRVA3QkI5VnJUdEoyMDZGMEtu?=
 =?utf-8?B?QXJoRktHRXkxdkkwekNHZURQakRhUm01NGxGQU50L1ZSTVc5T0NzMW1VNzFZ?=
 =?utf-8?B?a1g3ZjlVd3RyU2R5MVY0dUlkK0JvY28wZEtmNGhNWUZmZWM2VHZraWNHTm8w?=
 =?utf-8?B?TURpZDFHdTE3eUE4L0w5S0dUN3dBaVV4cVhuR2xUMGlERS9WSFNUazhucFc2?=
 =?utf-8?B?alg0VEJpL1FJcFZjTUhvSTFiVE1YcWo2UzFiOGJ5RnQzNXpkMlJkcmxUMC85?=
 =?utf-8?B?MVorZzlJUHRKY2ZmSXNNTWlnNGRnSXkyV213YXZVKzNRYXd1UHhiakpuUXkv?=
 =?utf-8?B?Z3VLNmQ2UFhhYk03QXJsbTVOKysxKzdlS2VuZG1POG92d2tJUUQ3cU5NUzlH?=
 =?utf-8?B?eEhwc09XdGZSTFV4WjNSL1UvR3B6RnNDOVdhd1VmMzhKczV5MHJGWXI4dWU1?=
 =?utf-8?B?R1RvRytZTzlqbnVMM0ZaSzdVQitGZUt4ZDdqREdXVVQ4dVVxMW90eGFXemtp?=
 =?utf-8?B?bmkxVmRkT2dWZWlvemYzZWhjVWREc2gwSFJOSkF5OU5QNDhwUzBFKzZzSi9H?=
 =?utf-8?B?NUtjRW1pSGpSRDRaMGpXdnQrREswYXVSVnpueCtQbllhOFJteDBTZmY2MWhT?=
 =?utf-8?B?RnVydWJPN3pBNUEwVTBvWmxsUzdUQTlLV1JmaUFSNjMxNnhsMFV1SzZBNjB3?=
 =?utf-8?B?SWgxNG4xK1NDOVhXNC94bXAvUDZkakt6RUdoYm5GSHVjUEpkclk3aU90bHk0?=
 =?utf-8?B?enBsYkFQMnBPVk5YcUl3MWwzWHp4L2FVRzh2T1pRcGdqUGJsOUtzTEEyMHUx?=
 =?utf-8?B?RHMvcFdscEk3ZEhSc05USFNOdDBLRHM0ajZaY3B6Z0ZMekJzcE5ZNk1JVFho?=
 =?utf-8?B?eHV2cm5rdHBkNmJ3TkJTZi96WDlZZUtMeWVxVHlXclNSd3FjU1U2NFdzZ1Jm?=
 =?utf-8?B?OFBkS1grNHgrSFk2b1lrcFdLQ1lZWHdlYi9RZHB3WXFTRENDZU1qV2V6d2NN?=
 =?utf-8?B?c1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B710263C3169C04580D3F54E460D53CF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5175.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ff4877-1e5a-4fcf-7708-08dae7df8d4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2022 07:54:16.0396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p0WqFq6uEHLYJ4r4637hAnNjpToJmrBlQ+/fMfd6ZA71SBmcLInLMZx7Yz12VgCDRQaBVNzQzyCaW3I9QbiVng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5510
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_235508_872003_1FF7B2F8 
X-CRM114-Status: GOOD (  19.97  )
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

RGVhciBDaGVuLVl1LA0KDQpTb3JyeSBmb3IgbGF0ZSByZXNwb25zZSBhbmQgdGhhbmtzIGZvciB0
aGUgcmV2aWV3Lg0KDQpPbiBUaHUsIDIwMjItMTItMDEgYXQgMTk6NDQgKzA4MDAsIENoZW4tWXUg
VHNhaSB3cm90ZToNCj4gT24gTW9uLCBOb3YgNywgMjAyMiBhdCAzOjIzIFBNIE5hbmN5LkxpbiA8
bmFuY3kubGluQG1lZGlhdGVrLmNvbT4NCj4gd3JvdGU6DQo+ID4gDQo+ID4gU2ltcGxpZnkgY29k
ZSBmb3IgdXBkYXRlICBtbXN5cyByZWcuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTmFuY3ku
TGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9h
Y2NoaW5vIERlbCBSZWdubyA8DQo+ID4gYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KPiA+
IFRlc3RlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiA+IGFuZ2Vsb2dpb2Fj
Y2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gPiBUZXN0ZWQtYnk6IEJvLUNoZW4gQ2hl
biA8cmV4LWJjLmNoZW5AbWVkaWF0ZWsuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBOw61jb2xhcyBG
LiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+DQo+ID4gLS0tDQo+ID4gIGRy
aXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jIHwgNDUgKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0NCj4gPiAtLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDI5IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRp
YXRlay9tdGstbW1zeXMuYw0KPiA+IGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMN
Cj4gPiBpbmRleCA5YTMyN2ViNWQ5ZDcuLjczYzhiZDI3ZTZhZSAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvc29jL21l
ZGlhdGVrL210ay1tbXN5cy5jDQo+IA0KPiBbLi4uXQ0KPiANCj4gPiBAQCAtMTI0LDI3ICsxMjks
MTQgQEAgdm9pZCBtdGtfbW1zeXNfZGRwX2Rpc2Nvbm5lY3Qoc3RydWN0IGRldmljZQ0KPiA+ICpk
ZXYsDQo+ID4gIHsNCj4gPiAgICAgICAgIHN0cnVjdCBtdGtfbW1zeXMgKm1tc3lzID0gZGV2X2dl
dF9kcnZkYXRhKGRldik7DQo+ID4gICAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX3JvdXRl
cyAqcm91dGVzID0gbW1zeXMtPmRhdGEtDQo+ID4gPnJvdXRlczsNCj4gPiAtICAgICAgIHUzMiBy
ZWc7DQo+ID4gICAgICAgICBpbnQgaTsNCj4gPiANCj4gPiAgICAgICAgIGZvciAoaSA9IDA7IGkg
PCBtbXN5cy0+ZGF0YS0+bnVtX3JvdXRlczsgaSsrKQ0KPiA+IC0gICAgICAgICAgICAgICBpZiAo
Y3VyID09IHJvdXRlc1tpXS5mcm9tX2NvbXAgJiYgbmV4dCA9PQ0KPiA+IHJvdXRlc1tpXS50b19j
b21wKSB7DQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gcmVhZGxfcmVsYXhlZCht
bXN5cy0+cmVncyArDQo+ID4gcm91dGVzW2ldLmFkZHIpOw0KPiA+IC0gICAgICAgICAgICAgICAg
ICAgICAgIHJlZyAmPSB+cm91dGVzW2ldLm1hc2s7DQo+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgd3JpdGVsX3JlbGF4ZWQocmVnLCBtbXN5cy0+cmVncyArDQo+ID4gcm91dGVzW2ldLmFkZHIp
Ow0KPiA+IC0gICAgICAgICAgICAgICB9DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChjdXIgPT0g
cm91dGVzW2ldLmZyb21fY29tcCAmJiBuZXh0ID09DQo+ID4gcm91dGVzW2ldLnRvX2NvbXApDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgbXRrX21tc3lzX3VwZGF0ZV9iaXRzKG1tc3lzLA0K
PiA+IHJvdXRlc1tpXS5hZGRyLCByb3V0ZXNbaV0ubWFzaywgMCk7DQo+ID4gIH0NCj4gPiAgRVhQ
T1JUX1NZTUJPTF9HUEwobXRrX21tc3lzX2RkcF9kaXNjb25uZWN0KTsNCj4gPiANCj4gPiAtc3Rh
dGljIHZvaWQgbXRrX21tc3lzX3VwZGF0ZV9iaXRzKHN0cnVjdCBtdGtfbW1zeXMgKm1tc3lzLCB1
MzINCj4gPiBvZmZzZXQsIHUzMiBtYXNrLCB1MzIgdmFsKQ0KPiA+IC17DQo+ID4gLSAgICAgICB1
MzIgdG1wOw0KPiA+IC0NCj4gPiAtICAgICAgIHRtcCA9IHJlYWRsX3JlbGF4ZWQobW1zeXMtPnJl
Z3MgKyBvZmZzZXQpOw0KPiA+IC0gICAgICAgdG1wID0gKHRtcCAmIH5tYXNrKSB8IHZhbDsNCj4g
PiAtICAgICAgIHdyaXRlbF9yZWxheGVkKHRtcCwgbW1zeXMtPnJlZ3MgKyBvZmZzZXQpOw0KPiA+
IC19DQo+ID4gLQ0KPiA+ICB2b2lkIG10a19tbXN5c19kZHBfZHBpX2ZtdF9jb25maWcoc3RydWN0
IGRldmljZSAqZGV2LCB1MzIgdmFsKQ0KPiA+ICB7DQo+ID4gICAgICAgICBpZiAodmFsKQ0KPiAN
Cj4gVGhpcyBodW5rIG5vdyBkb2Vzbid0IGFwcGx5IGR1ZSB0bw0KPiANCj4gICAgIHNvYzogbWVk
aWF0ZWs6IEFkZCBhbGwgc2V0dGluZ3MgdG8gbXRrX21tc3lzX2RkcF9kcGlfZm10X2NvbmZpZw0K
PiBmdW5jDQo+IA0KPiB0b3VjaGluZyBtdGtfbW1zeXNfZGRwX2RwaV9mbXRfY29uZmlnKCkgYXMg
d2VsbC4gSXQncyB0cml2aWFsIHRvDQo+IHJlc29sdmUNCj4gdGhvdWdoLg0KPiANCj4gQ2hlbll1
DQoNCkkgd2lsbCB1cGRhdGUgbmV4dCByZXZpc2lvbiBiYXNlIG9uIG5leHQtMjAyMjEyMjYgd2hp
Y2ggaW5jbHVkZSB0aGUNCnBhdGNoIHlvdSBtZW50aW9uZWQuDQoNClJlZ2FyZHMsDQpOYW5jeQ0K

