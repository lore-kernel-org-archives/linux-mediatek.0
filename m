Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB55C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 09:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CjMrIu0ZYzUWMSaEQP7ukYTWB63yFY5SVwjp7zZTCI=; b=XtoMaifz51QAVqBxMh7wyXdxP9
	XDN9IfWCn1V6HAynlCfYtpP7JZ23IKu727+7ILpX7dXUH+qgSJUnfMl09rcaKVz1nsQqbXKoc2p+w
	+t86e5MrFgLcYFWXfe9SnakEJs7ExxwVsNLVQcwsAQHewI/CpbaJjPsZtbJU0d5oaRU9ZvjcVd2g8
	5BHT0ljZpcbDnNGVYYvllqSoNFlw8tf/8TuDGtjrdGSND2YLhdIFDgiCdsu+lo4O++zQe6K/7WoXj
	zIjitBriUK+Qey4SaqDghABeyaGPS+4WybyJoSkoGN2hqae35MWDw4VZPfyre4CY2Gso5fWEe+MIE
	Dx9F2AQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqss6-0034Ut-Jn; Fri, 04 Nov 2022 09:20:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqss3-0034U8-Jy; Fri, 04 Nov 2022 09:20:16 +0000
X-UUID: 6bb114e7618344baa80dbd0d6b56e03d-20221104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=8CjMrIu0ZYzUWMSaEQP7ukYTWB63yFY5SVwjp7zZTCI=;
	b=G1Xvx6eoU9CJuSHkeP9Oe/0i1f+50wI6RLw5iBT44nfec7CvloLk4zFTj3EeqoYktfT5glFjHZjdKl4YZG6S89jvnn+Dh9UQXWtF5zqUsaLeGpyiWfsfh1R5cn1mhu28jq85Bqkx2l12YXoB44L1vWIquL9OrQBc+E/Fnq1T8xM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:e3b309c3-4f7d-4d74-b7ed-e476ac63104b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:17d471eb-84ac-4628-a416-bc50d5503da6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6bb114e7618344baa80dbd0d6b56e03d-20221104
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1841566226; Fri, 04 Nov 2022 02:20:01 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 4 Nov 2022 17:19:25 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 4 Nov 2022 17:19:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTnFMo5GnAkF+OKZwFAEsMaIiseDTcivZHCz/kDZZwtS2uMJluMu3ROw6w05KPTrJYGj+/+e0vB+/AofkCTaJiMRlSoxa6cPYo6vcrWV6qdJetpledRcxsH0veAUjZAUYTivoiaBO8mHXhzVo8D6D2dMvW7pM6pPbQzNy+dbRsu36jKrn8dY1KdBBi+Ik6muIlnMuSHFxgYdMSe4zBpRnMflyPQFsIVoU8+DB9O7n3ZJZPEeXrSEs5CXdq6VHh9HFVGgBaBqp372aXMaxBYmc0NFHnzHWBR0s+f23CNYdKUSUAhq9wpO4KK55/Y04hMqTaB0kkAPhsJ94tw3sFtmGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CjMrIu0ZYzUWMSaEQP7ukYTWB63yFY5SVwjp7zZTCI=;
 b=Mo/Q/ePHtq3bWSai/O9LPC4ClwiA7qtugVaVuaAQu0aWXWKKztBNOieEo+Qe3NzEKFpBdAMgPz91yNz4no+Fx2JKV448dXRGJ/8ufwRjpVa+WjSPqNcf3Mm8MTar3ssUzWtviXbEM3zxqfkMg2E4YHnQ8rQx8ETC5BeMP4D2RhzTs2tIM9y1nVIcH1HZtCb++D/W6q2WnHxZtyzs4mpa2rMHYXCH+nHqFXXxziFa6HLdvD9lIUkup0CG98zdkeunKBkDE/59qSJRmbgJd9DG5eLR5z4VSyQxbgt4zkyULcPgOUH+jNHcz611UC+S3XaX3IIihwyxUkEi/R4OurrOUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CjMrIu0ZYzUWMSaEQP7ukYTWB63yFY5SVwjp7zZTCI=;
 b=kwrMm29CjtinxvKbbVBCpMf5audTeynwHnX/O+gFc7pGqMFFOBB3jJXZbmAoxFBM6dYzBSroCZwSCwr6EpEZRqEI2LtIlgvX7gONsBIMDOEeDRh4VvPRj5enIc7nd/UsaSqBIi/Gwj6HaSZmaQj8m0JE1gY2QtYTw1T2HOfL4HI=
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com (2603:1096:820:8::11)
 by TYZPR03MB5939.apcprd03.prod.outlook.com (2603:1096:400:126::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Fri, 4 Nov
 2022 09:19:22 +0000
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::8cda:5c09:3c2e:19]) by KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::8cda:5c09:3c2e:19%7]) with mapi id 15.20.5791.020; Fri, 4 Nov 2022
 09:19:22 +0000
From: =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>
To: "nfraprado@collabora.com" <nfraprado@collabora.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	=?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
	<yongqiang.niu@mediatek.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "daniel@ffwll.ch"
	<daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"airlied@linux.ie" <airlied@linux.ie>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "ndesaulniers@google.com"
	<ndesaulniers@google.com>
Subject: Re: [PATCH v27 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1
 compatible for MT8195
Thread-Topic: [PATCH v27 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1
 compatible for MT8195
Thread-Index: AQHY7zP66+4xe+EWwku1+3qhYuYj3K4tmY2AgADlFoA=
Date: Fri, 4 Nov 2022 09:19:22 +0000
Message-ID: <6808bfc53e12502e01c75fefd0842d840fe73bf3.camel@mediatek.com>
References: <20221103032512.9144-1-nancy.lin@mediatek.com>
	 <20221103032512.9144-2-nancy.lin@mediatek.com>
	 <20221103193925.ahdhhuz67mg4noqz@notapiano>
In-Reply-To: <20221103193925.ahdhhuz67mg4noqz@notapiano>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5175:EE_|TYZPR03MB5939:EE_
x-ms-office365-filtering-correlation-id: d1e0bc4e-cb36-4c10-935a-08dabe45a931
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wm1EZWW1uNDjKr37vlcX2EABnOzi8grd5AP/hVXH+IUBeU3Qem1uBG1kT0R0D+s+6F+1tAOC6RqO7y/jXNzEH/ZksIPTTVNv/dSbaqklyUgSBXG0fXac09YAba/dozj6uuTnVg6vlP0RgJPFGu0QY2VPUzWG6I+qaTGdmvL/jGV3Bi5o+y447VtVwvzfrlSIDeXgo/yGs4xL2W50SUH9eTyDxCPPFHOt4PS3nMiQTQkOIvJK/Z2Nrgiw7Q2xUtA04zjpszRquexfDwBRcjiE68Q03Y4ZEgEnxxo9+HyCqLQo+hzQMEijNfsF9FZc4buE9P0dvDr66KEmIZqyF1FSVZhOvNpUID9cTmRWv1ERxhoCEV0edhN4zuPhenqdo0d4VeI/VwdJXJ6bAqL9Oc9RTUY36KN4VCjZrk2SfS4XrAiTwK8WT38TCFdFk+AkTS4a4R9qQnbkkECk7wpXsVyiGS9robmxe18RVpfzj0GlJwCtJF7miHfoZrYAFxSV5OyoCu1Lia0Qazg5nX75hkUur+RXTOcE3q5XFAUk6yDWU98GozhQINiIzf3hj/UTA9iGDf2xvj0uVye91upvynlerRYUw8ohNmlbufx6S7gh9kv/kjZkUifq1NrcKd7/2+e635rWTb7pOiMvf1LEjo1bXHB7gf0ZfnQe979u/QqTj6Xdprhh2vbv1BL7xSg0YBGjvZzjCxiwJTE9JoktBF9WfTsA8FLDCiB1nxK2LGONIE52NjXf2ctwY+7nXqqf6jDXS+3d6xuMIGP5oVOxXse0hQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5175.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199015)(83380400001)(2906002)(66574015)(41300700001)(6512007)(76116006)(66946007)(8676002)(66556008)(66476007)(64756008)(4326008)(66446008)(36756003)(85182001)(38070700005)(86362001)(122000001)(6916009)(54906003)(316002)(38100700002)(7416002)(5660300002)(2616005)(8936002)(91956017)(4744005)(186003)(71200400001)(26005)(478600001)(6506007)(6486002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWJrcG1HaloyRjVLRXZmRFMzL1Q3eXplWXR5QldnUmk3RnhFNUs5QVplc09K?=
 =?utf-8?B?NG9KdDF3OVBsV0VCNUZ3NU1hN2lFNzYwUXgyYkEyczJuMTdUSTdMcnRVaWlk?=
 =?utf-8?B?WFJwanFKWUI5bTFuUkN0RENyR204c1BjZi9RWkNhUGtxc0xsUm5GT2U1M0o2?=
 =?utf-8?B?OXNhYTMxeTdNVnRFd0VJWGU0N2k1dUVQL2tXNWdVZVB2WkNmMCtpd0ZXcU01?=
 =?utf-8?B?REtlTyszaVN2SGkvTWtaNHZnQTUxblhOSCtuUUIvMEZoMzZ6OXZCWnNIMlhj?=
 =?utf-8?B?ZzRrR29IcnNENUM1ank2aEYwR0N2cjlYdFhUMDMvSWI4LzRoaXM0Ync5K2tK?=
 =?utf-8?B?UTNVemd1RGJMT1R1MXN4WVNOT2dFcTUvc0xZNDVHY0tkRUxNbEpxMXdjOWRE?=
 =?utf-8?B?RjlPczZLZTl4WXZ5Vm8yRWYvcS9oSkppUVM4SWxZUVZFUGtyWUtLUnY4UHF4?=
 =?utf-8?B?aUkyZzlLN3YwTTRkQ3pVRkg0bXZLTTNpQWF1SVlyTW1SL1ljRHBYcmtqZTNm?=
 =?utf-8?B?Z0djUzk2TFV6R1cwZ3lkejdWMThrTzlQSFNzKy9mbHh5cGxUMlE4L01ETnVR?=
 =?utf-8?B?NGszMEVIamh6Rm9yeWxGQUZUQUJOaXBLWWlKYzNxV3ZadEpYVU5sU2dJTmxz?=
 =?utf-8?B?Y05KMlUzc014azEyTVBFVnR1ZmpwNGt2U3lEeXBiZjZWQjVjcnZDR2orZWhQ?=
 =?utf-8?B?MTRuZFhqZnZ2Mk5UTGRiS1FZZWhhUnVzKzlZUEtxYW1BWHVBWVZaZGF2TDNK?=
 =?utf-8?B?U1pTOE5PRFY4bUVmYkRrRjBCVVEvWVdDaVBVWnpGRlBpdDlRUU8vMFh4TVBp?=
 =?utf-8?B?UmluUHVPbXBFZ1AxQmxHL3hWWTBEWmxseWt3aUQ4VWttMlNNMnMwcUNOSk43?=
 =?utf-8?B?NmFqT3lUOEJFckdhR3d3d3ZXazRFTEpXZnp4Qk5rSVgrRytkOE5kYWU0S0lT?=
 =?utf-8?B?SDRMQzlLOU9ocXlxby83M05tZWlaemxEeGhtWkxYQ0hGdVNvcU9taWRVZkgw?=
 =?utf-8?B?ckxuNEQ1cVpyVzUweGpGUWhXdk1ObCtMT0RzMHcycy9VaTdjZFUwODNWWXEr?=
 =?utf-8?B?bHV0RVFlMlJYcGc4b2lwdkJRWmVKVlJIMWhoeU9aeXVOUGhhaDczNUxnMGxk?=
 =?utf-8?B?RDNBRHdnWjNvR1JudHk1WmwvSnpCc1owbmNPVXdtUnFiTVcxUVJaU0R6STh1?=
 =?utf-8?B?VWJJUGRjcGdMR0UvTVRoakF3L3ZKZ2NSSTJYUi9uU1l6UHcxWGR6c2IxWGtT?=
 =?utf-8?B?MG5RUDJDc054Yi9zREM3dHUzenNvWm1ON1h4SkpsNzdLSHVHMVF4TXJVSmtH?=
 =?utf-8?B?L0NKMVBZVk9haFZuRlBteHhROTI2Z0pQL2l4bWI4RUxvMWhkdEoxR1JXQWUw?=
 =?utf-8?B?UGVqS1V2Z2lkVmtMSnc5VXRqVU40b3N5cndSWi9ROXMrakhTWGpHZmNrNVN2?=
 =?utf-8?B?VHFnTkNlZkUwWU9Kdk1aOTRLUlhBb3I1cVRpbll3a3lyZDVlUW55YTlNZXpn?=
 =?utf-8?B?cTNOUU0rcGNXVzNzTU5nSjBYZlQ0OW8wN3l3dGxTaW9CWEV0VUZjVG5Geklw?=
 =?utf-8?B?VHgyK3h0Y0pXUzVTU1gwTnh0dDZHQm42ODl0TEU5Y3F0RzRyTmxiRXJPbEFn?=
 =?utf-8?B?S2o4ZHo1SVQvYWZGcjYvWDcrYjFKc3RtSmdkdktUYW10Mi9NZ0xGTitlNXZ2?=
 =?utf-8?B?UHlRT0hjQnlLV1NweEh1enJNU0RhMlJFMkdBOGpML2NOeVJRUXB2Z1k5M012?=
 =?utf-8?B?SjlNTWx4dmEvOElXODdndEZTVFlCNHp4QVdvMEl0VnpNQ3Z5NFB3QS9tVDNV?=
 =?utf-8?B?SkE1S1NCeU9Nb1BhRkZJRHlzS01sR2s1SGQ2T2cxS1NVMFNGbStld1RMWlFu?=
 =?utf-8?B?ZkZzYkowbS90eTd6TndGTjkvS2t1ajhwVVQ4c2ViNTI2UUcySGVmQW5KK0Mx?=
 =?utf-8?B?NjB0YURHSldnZ09kaTUzVjZ0TE45bFRXeVh3V1IwNE1ZdEU5SjdJQTNadjZv?=
 =?utf-8?B?ZjJiU0pEOWhlWnRZc2xGV09kc1hra3pTMkJrQ256a0IvM2QxUE9JcVVKREtE?=
 =?utf-8?B?ZytLTEZuZzFvUVFYaXAzcWVoSHNQN1hPcVFFcHVwVWdtZFA4cDBuYjdsc0xh?=
 =?utf-8?B?WW9WYXNkYkRqcGF0UzNXUTBpOUxXaTdvZWVwdXdidDJRdDhablZvVmxyd1Jk?=
 =?utf-8?B?VVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBC01C0BB8282643A9A37EA8FF5425FC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5175.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e0bc4e-cb36-4c10-935a-08dabe45a931
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 09:19:22.6340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LU80YgDzO6rhJVoIPEwZYCf2pRlQlOB46haILuqexs2EqcnCPVk0BIv3U2r5VEkhzwIT3RKNBLGtnM1dPTr1gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5939
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_022015_679810_F5939812 
X-CRM114-Status: GOOD (  11.78  )
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

RGVhciBOaWNvbGFzLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCk9uIFRodSwgMjAyMi0x
MS0wMyBhdCAxNTozOSAtMDQwMCwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6DQo+IE9u
IFRodSwgTm92IDAzLCAyMDIyIGF0IDExOjI1OjAyQU0gKzA4MDAsIE5hbmN5LkxpbiB3cm90ZToN
Cj4gPiBBZGQgdmRvc3lzMSBtbXN5cyBjb21wYXRpYmxlIGZvciBNVDgxOTUgcGxhdGZvcm0uDQo+
ID4gDQo+ID4gRm9yIE1UODE5NSwgVkRPU1lTMCBhbmQgVkRPU1lTMSBhcmUgMiBkaXNwbGF5IEhX
IHBpcGVsaW5lcyBiaW5kaW5nDQo+ID4gdG8NCj4gPiAyIGRpZmZlcmVudCBwb3dlciBkb21haW5z
LCBkaWZmZXJlbnQgY2xvY2sgZHJpdmVycyBhbmQgZGlmZmVyZW50DQo+ID4gbWVkaWF0ZWstZHJt
IGRyaXZlcnMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTmFuY3kuTGluIDxuYW5jeS5saW5A
bWVkaWF0ZWsuY29tPg0KPiA+IENoYW5nZS1JZDogSTgwNjUyMDVjZTQ0YmFhNDE3ZjU4MTc2YWRh
YWU5ZTFlZWZhNmVhZGINCj4gDQo+IE5vIENoYW5nZS1JZCB0YWcsIHBsZWFzZS4gVGhlcmUgYXJl
IHNvbWUgb3RoZXIgY29tbWl0cyB3aXRoIGl0IGFzDQo+IHdlbGwuDQo+IA0KPiBPdGhlcndpc2Us
DQo+IA0KPiBSZXZpZXdlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bj
b2xsYWJvcmEuY29tPg0KPiANCj4gVGhhbmtzLA0KPiBOw61jb2xhcw0KDQpTb3JyeSBJIGZvcmdv
dCB0byByZW1vdmUgQ2hhbmdlLUlkLiBJIHdpbGwgY2hlY2sgYWxsIHRoZSBjb21taXRzIGluIHRo
ZQ0Kc2VyaWVzLg0KDQpUaGFua3MsDQpOYW5jeQ0K

