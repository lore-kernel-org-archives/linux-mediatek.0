Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C794C6FA82
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 07:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBp8hV6E3wPStQAXBQDgtN1pq6e4gy/fzDFZK2KlSyQ=; b=AbWbKLdq/ElSwGeo/U0euQSRwm
	oH2TaTPNkjAt4G0yyfHbQREpCTub6TNvp09Ptu39NdoBjuIvlVFMeI+uWA1tnHHKogZG3SKnVYoTt
	X/2OxHZwYVbRx1I+XKnzA60AVHTHdNmQL3V4ef91clqVKJsFwNRWdCznpO+oYN7EIHg4X04iza/gx
	dHm+/uAQ+e2yq1YWh/N1oHH/tX6oc9bj2Hj4HO7qR9iTIRhHvi1bDlWzR80tflTVMKFqNeobSelJD
	cb5PHLjJMxjwslMWFt1yNMnr5kW7zmw3QR5832265A7B4M/RO18/kw6VOownIbUnl2I3Ca+U9OmUZ
	BN8WMsvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ociJG-002fZY-W5; Mon, 26 Sep 2022 07:13:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ociJD-002fXj-UF; Mon, 26 Sep 2022 07:13:45 +0000
X-UUID: 260042b6405f48e8b0a3e03e362fca85-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=mBp8hV6E3wPStQAXBQDgtN1pq6e4gy/fzDFZK2KlSyQ=;
	b=QBq7+Uz1vQgtJdnHx8nJqVdjBQ9G992APLDy+CGlAyt9OIyNBAqL95HwkiW5gYVlq62qxRfsfudlCAsIok9E9NLJX8VrF6AaVodU0dUNY8ohOLPCU2Z66Nyp0Ene8LPLGRX6gifYHIjy83fOQtrUcdrtH+x3Ig3W8Z3fHEhF9rs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:6476c655-9da8-4093-bb2a-d58cc8018109,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:161d37e4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 260042b6405f48e8b0a3e03e362fca85-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 792690742; Mon, 26 Sep 2022 00:13:37 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 26 Sep 2022 14:33:02 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 26 Sep 2022 14:33:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAuIlUhDJYoXOE1G9FOycSCizwnSwejt3WTIqayYKsI48DGmeaqq1mKbeXQRl2PXmDr4MLrl0Yt5TZxYNMRl20ooJ79TJHBcHmvHXhFRAwYnNOsSajxVp4z3ts8U2SwAu/789ny2JCNbDsysiyNjTjhUM8WOMQlen4fkWNMBojhCdVRctGEsW8IGr38EDBd1yC7JodTqORz1H224JSnRFgY5buqSANxjGHX18TCRpYHwb58hOfgJl4EM00NPjcy6YH58pRGzXL0qlftxXYRcAocb2IVygjglmqOU7TwWKzzKRwyhSIH/ioKOHu7CnOn3aFSw2//sDwz5SoJ5GT9Jyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBp8hV6E3wPStQAXBQDgtN1pq6e4gy/fzDFZK2KlSyQ=;
 b=mkuTMM62JMZFg8dcEWeHaYvuukXakuVykb+D+CPiZgCgW0ht1nXUWTiGHgBiuxURJm4nCdwWcxDx/zoRveHN7N+NWUhkUVrAFXjesal9CYwQQQMJJ028Dv2k9IiNtX7niRp/pHSoDMK7tHM6FBfbVRI0PxIQOCL4pGdsP1cpfoDdgyVsX/rfPDCUPB9gLkSpJHlUg6k020Y3HPB12yj9v/V3Zp8JJkpP1z7QAYdOeYVRmzSExjTR8iMPw1OvccJlbl0H7nAY3FY3FG2RBQwvlmPwqg/Cp1Rzv3xXJO52r9BxoJjc2CHUeUBXjO4s2wJ8Ker4uY4NNNAdm1RjJuVJDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBp8hV6E3wPStQAXBQDgtN1pq6e4gy/fzDFZK2KlSyQ=;
 b=clfJ9ipMzZr5x1i6MpVWi12YRzfRUIFg/xvmkUaT6dHIlW5j//q74avOAYPpLIVKVDNzEOiidp9Nap+FbtXEmfLRJRD14pPNCUsAGKGfvuTu8Exhgnc4BQj7uEiNC/H4tk0+tDOkm00zbifW5yh8hrovttgQznDFcjwO1LZi2Y4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by HK0PR03MB4212.apcprd03.prod.outlook.com (2603:1096:203:9a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.14; Mon, 26 Sep
 2022 06:33:00 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::b958:c9e0:9f6d:9ed]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::b958:c9e0:9f6d:9ed%7]) with mapi id 15.20.5676.011; Mon, 26 Sep 2022
 06:32:59 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	=?utf-8?B?WGlubGVpIExlZSAo5p2O5piV56OKKQ==?= <Xinlei.Lee@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "daniel@ffwll.ch"
	<daniel@ffwll.ch>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"airlied@linux.ie" <airlied@linux.ie>,
	=?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>
Subject: Re: [PATCH v10,1/3] soc: mediatek: Add all settings to
 mtk_mmsys_ddp_dpi_fmt_config func
Thread-Topic: [PATCH v10,1/3] soc: mediatek: Add all settings to
 mtk_mmsys_ddp_dpi_fmt_config func
Thread-Index: AQHYzzMzBt7u+kVO/kyfiEfCmq+f/K3xRT2A
Date: Mon, 26 Sep 2022 06:32:59 +0000
Message-ID: <a2a56cad95a44c587b29b80e7364d02bd94821c2.camel@mediatek.com>
References: <1663927104-15506-1-git-send-email-xinlei.lee@mediatek.com>
	 <1663927104-15506-2-git-send-email-xinlei.lee@mediatek.com>
In-Reply-To: <1663927104-15506-2-git-send-email-xinlei.lee@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|HK0PR03MB4212:EE_
x-ms-office365-filtering-correlation-id: 3c9cf658-c0fc-41ef-08f4-08da9f88f4e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oNNE6HDraRmQuwHFdQjJU4cVMNn0dQYnFdCBNLSeGnPGVj04As0qEDcPwJWu31yQo3ZZ1+R+P7oNiANOz+pgqlUkTRI/YYg/sBm2w9/zS5mh9ACBRWKVM7M9P8LzsVqLtHP2j8J50rCHGCfw2tE1xsmuuD9S6SEIXn+NOJFizyl7AmhdYXq0vvNuCo5R3reJjuUGB/b7cJ8BBdsBhJNyWrsaUrkazeRSti74fVWqfD46jAT1Rl5lfBV/W+EUU4Sfs0Y5dAYx2m/nLPWzirCIJ23zRLtCO0Zjk+MqmZp0Ga+zNbiyL7jOiZ8AfMQmSC0SgvQxTMFJrIR1/O+6q0gO8S9nVfKQpGacX44xSBjyZpdeebEhxmjuRoU+56G4xzAv2t/eO2GeoYnsULLOhH+zF1Ep+f462Hiyn31Ok6rmm5r8P/qCOoaPN83ox925YN/nczbPfpcU/0cipLuEWULUbdHFBB0IeHIOjZ3lT5VEkXZZeYJgpwFc4KWhuRZnn/FplReVYqeGBbnmqHRLgpDvIUCUWTwKLLuEWR9d7KDnavpN2XAIcSp7c3iFbIHA/ZxaWmeWzdTmtzfg5YKOFZG1hkPTWdh6fD0UJo4Vpp4kFvVkVclkxamEGrme+KzMxjN1aTQuM8zhpv723ISQ07mqEXVtyIIksosouBf0btf31HyQIyCihLF75lZWpWuNpBEoCUEKWJXAHofTk6woKnqkfVTDgOCyZB/xMyyjOlajpAXNpXsSpa19EvIv2nrYnqDT91VOTGIei8poKk4P5uwCT1PnCt/QaOzwcVROFp/7ewGWFtCfFhL/iCGfj1sLTMKh
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199015)(86362001)(91956017)(54906003)(316002)(110136005)(2906002)(85182001)(36756003)(66556008)(41300700001)(66476007)(76116006)(66946007)(64756008)(66446008)(4326008)(8936002)(8676002)(5660300002)(38070700005)(122000001)(38100700002)(26005)(6506007)(6512007)(71200400001)(107886003)(478600001)(6486002)(83380400001)(2616005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlFqd3NpSkhvdEpjSWtDNTg3c0x5ZjFsY09nL1FSZWlUSEpONE1ha1BDMTNv?=
 =?utf-8?B?elh3dEN5YWk3RW1hd0RJN212N3NmRDUxZzlJam13aFI3QWVvNXZQQVpuNEJl?=
 =?utf-8?B?N0I0eTFFTjFQcTVVVWtQdjM0bmZLSGtTTFlITVA1NVF2VC9SRWdpbFo3L2xj?=
 =?utf-8?B?N3VFZElpYzUxZnEyYTVSNUFKblVjODNvOTZzRng4Ny9PUy9xSG5qMnU1L3FD?=
 =?utf-8?B?ZDZrQ1hYN3p0L2R6WXBGaGEzL0F6QTdsbjJUR2tPUmltb2ZhU0pITDQzOTZp?=
 =?utf-8?B?NzJJUkhtbmFnbWxrWUpNTjh0TTZpSXFpNnFQS0JvYXNuQnllQmM3TkxXaCtl?=
 =?utf-8?B?MXVnT1pLbkdGREtWUSs4VkRBdkJueXNEZW5sSDBOdGg5ZnVCQmN6K21vejZ3?=
 =?utf-8?B?c0xvZU9wc1AxNGplUVNiQlhyek96RGxuaDQwenR4N0grOFUxRmFpeXo1cm5B?=
 =?utf-8?B?RGJmQ0Q1VnA0STdSV3NlZ080U0xoZTdUb3dBUUdzbkZmU0R6REZxOUVTc1dJ?=
 =?utf-8?B?KzYyaEVkSXVMeW5ZMVZGNFdWNGJ3S1RtT1JBRXpTbGgvTHdnUUdGU3Y5M28z?=
 =?utf-8?B?WnJ3RFp3ckVQdERqTDVpYVJqSkdGc21SNFJxdmdXNjJrcUZITHlFdmhIR3Bi?=
 =?utf-8?B?L3NTT1o1eHduTFBaVjRSVXlrVHUxRjJxYU1XN1dac1Q3NWVOME5qRlNtRHFL?=
 =?utf-8?B?M3F5QTVNZ24xb3FJUjR5eVNlREorWlk4TG9mMEFmV0t3aWdzNE5tbU9DRlIv?=
 =?utf-8?B?WDNDY0E1VDgxbUpwTm41YWZUeEdNYzVqTHMvUzcrQnZDQjd5ejJUSllRakNp?=
 =?utf-8?B?MExWNjNyb0NhOUlzcThBc3QvcGNLQk1TRVZvNTc2bTAvcEtsUmxNZnlxZlg1?=
 =?utf-8?B?alFsdzlONFZOZXA3MkVwUE1LUGdnbUNVTDl1dWRKYXF5RThpcXE5cUdxVjZV?=
 =?utf-8?B?c0tPR1RXeU90a0kzNHRpcG9lU1RrYmZMUTNpd3pFNStWUXZqV2FtMExZQXV5?=
 =?utf-8?B?bjN3QzBxYnBSTERDL1pWUTZBY00wZkkweC9VOGhmSGtyMHloM1MrMTY0VWJV?=
 =?utf-8?B?QmFVWHUvSW1kM1dFU0lRZmtQL0lFRTRBd2tORVZMcU1XTG1oV1VKVUdIeWNW?=
 =?utf-8?B?TmpMdFliQm1hTXFtUi9tb3MxeTZsY3RkUVc0cGVnZFJ3YnVIdG4yZ24vQll2?=
 =?utf-8?B?TFJDYzhacnB0UXQ4a0I4SVhldUJRdU93aENuVC8rS3M0eWh0Y1JyaG4ycWhM?=
 =?utf-8?B?bFNwV1lMaVh4YjFwQ2R6dDRnRXIzRW5saHBOejNTa2IrMlZ2WTN3ZUdTNGUr?=
 =?utf-8?B?QnRlbFc5bEFFOVZtckRaVWMrYVFyV0Z1QXV5bFlieno5RStoTHNEQmFRTXV0?=
 =?utf-8?B?RjZESU1VS1FUUWhWVXdTVldpelp2S2I1azBpRmR4aXRBOG1iSVBrQ2pLZU1z?=
 =?utf-8?B?WXBGNTd3NktXK2psZ3B6aUZ5Q1RwK3ozU1kyNjNkM1NkUGZuc0FtakV6SE1q?=
 =?utf-8?B?TFhyOTQ5d1lORC8xN2dCakN2ZlN5Ri9wQ2ZZL2VvMURLWkRvemhQRG1JY0hj?=
 =?utf-8?B?OGpoQjNUeU96VDlybE52N1RQYU9jWlFTSHYxTVRwdXlzeENvUmUyTTBwcGxH?=
 =?utf-8?B?NEZXTlhCZkM2bnJINUlUWlFIUkJPTXRsRDI4VXdzdkUrN0tkK1M4MlA4MU5T?=
 =?utf-8?B?TUtCSWpvOXFOUERydFQyb0NjQ2l0QStFVW9ienc0VThtc3hKUXJETnU2OWVu?=
 =?utf-8?B?SHJYTEc5VGYzdHdHWGQ3WUhXNDVTMkJVSHdOWjB5ZDh4ckdqblJjNzhPTHND?=
 =?utf-8?B?RjYzY3Nqc3RUL25IWWg2Z2RpWDMzNHg4eFNVeG4rR1JSUEd6TnV2dlBtTkxN?=
 =?utf-8?B?U3VyQS9OT2pmZ1RxQU1MbmVWSmVsbzl2VFQzaTFKc2YxOVZ2UnNRRUdaejFp?=
 =?utf-8?B?NVd5OXJjZXR4T2dwcmFYT3JLV2pFVUE5eWNYdnBVbVdMS2NWb3ZGUUZ6WmIr?=
 =?utf-8?B?cUk2cnk1NUpJMytHd0pVZjFUNEpsd2w1MXRRUHhjRFRTcHFhZ0ZrcTNtTGti?=
 =?utf-8?B?ZldZcWxmQWhMS1paQ0xjeXNMTHJueTJvQkpxdmUreUZ3V2JkTWYzVTR1SEFt?=
 =?utf-8?Q?Nj8yAEwfErr/XWrGaM+5Uwf6e?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFE2D05D8979E14084FB968502966E19@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9cf658-c0fc-41ef-08f4-08da9f88f4e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 06:32:59.8832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fs/L1k1m7fsfhzP/QmcmGuw9T5bHyjruInSV1TXSl/O7t4Dce+64yTN6yPzyrCiHGHopWQUurkK4GrFNfYyTgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB4212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_001344_133542_E4AC20E4 
X-CRM114-Status: GOOD (  20.13  )
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

SGksIFhpbmxlaToNCg0KT24gRnJpLCAyMDIyLTA5LTIzIGF0IDE3OjU4ICswODAwLCB4aW5sZWku
bGVlQG1lZGlhdGVrLmNvbSB3cm90ZToNCj4gRnJvbTogWGlubGVpIExlZSA8eGlubGVpLmxlZUBt
ZWRpYXRlay5jb20+DQo+IA0KPiBUaGUgZGlmZmVyZW5jZSBiZXR3ZWVuIE1UODE4NiBhbmQgb3Ro
ZXIgSUNzIGlzIHRoYXQgd2hlbiBtb2RpZnlpbmcNCj4gdGhlDQo+IG91dHB1dCBmb3JtYXQsIHdl
IG5lZWQgdG8gbW9kaWZ5IHRoZSBtbXN5c19iYXNlKzB4NDAwIHJlZ2lzdGVyIHRvDQo+IHRha2UN
Cj4gZWZmZWN0Lg0KPiBTbyB3aGVuIHNldHRpbmcgdGhlIGRwaSBvdXRwdXQgZm9ybWF0LCB3ZSBu
ZWVkIHRvIGNhbGwgbW1zeXNfZnVuYyB0bw0KPiBzZXQNCj4gaXQgdG8gTVQ4MTg2IHN5bmNocm9u
b3VzbHkuDQo+IEFkZGluZyBtbXN5cyBhbGwgdGhlIHNldHRpbmdzIHRoYXQgbmVlZCB0byBiZSBt
b2RpZmllZCB3aXRoIGRwaSBhcmUNCj4gZm9yIG10ODE4Ni4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1
IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IEZpeGVzOiBhMDcxZTUyZjc1ZDEgKCJzb2M6
IG1lZGlhdGVrOiBBZGQgbW1zeXMgZnVuYyB0byBhZGFwdCB0byBkcGkNCj4gb3V0cHV0IGZvciBN
VDgxODYiKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogWGlubGVpIExlZSA8eGlubGVpLmxlZUBtZWRp
YXRlay5jb20+DQo+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+
IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL3NvYy9tZWRpYXRlay9tdDgxODYtbW1zeXMuaCAgICB8ICA4ICsrKysrLS0tDQo+ICBkcml2
ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYyAgICAgICB8IDI3ICsrKysrKysrKysrKysrKysr
KysrLS0NCj4gLS0tLQ0KPiAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgg
fCAgNyArKysrKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXQ4MTg2
LW1tc3lzLmgNCj4gYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdDgxODYtbW1zeXMuaA0KPiBpbmRl
eCAwOWIxY2NiYzAwOTMuLjAzNWFlYzFlYjYxNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9zb2Mv
bWVkaWF0ZWsvbXQ4MTg2LW1tc3lzLmgNCj4gKysrIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXQ4
MTg2LW1tc3lzLmgNCj4gQEAgLTUsOSArNSwxMSBAQA0KPiAgDQo+ICAvKiBWYWx1ZXMgZm9yIERQ
SSBjb25maWd1cmF0aW9uIGluIE1NU1lTIGFkZHJlc3Mgc3BhY2UgKi8NCj4gICNkZWZpbmUgTVQ4
MTg2X01NU1lTX0RQSV9PVVRQVVRfRk9STUFUCQkweDQwMA0KPiAtI2RlZmluZSBEUElfRk9STUFU
X01BU0sJCQkJCTB4MQ0KPiAtI2RlZmluZSBEUElfUkdCODg4X0REUl9DT04JCQkJQklUKDApDQo+
IC0jZGVmaW5lIERQSV9SR0I1NjVfU0RSX0NPTgkJCQlCSVQoMSkNCj4gKyNkZWZpbmUgRFBJX0ZP
Uk1BVF9NQVNLCQkJCQlHRU5NQVNLDQo+ICgxLCAwKQ0KPiArI2RlZmluZSBEUElfUkdCODg4X1NE
Ul9DT04JCQkJMA0KPiArI2RlZmluZSBEUElfUkdCODg4X0REUl9DT04JCQkJMQ0KPiArI2RlZmlu
ZSBEUElfUkdCNTY1X1NEUl9DT04JCQkJMg0KPiArI2RlZmluZSBEUElfUkdCNTY1X0REUl9DT04J
CQkJMw0KPiAgDQo+ICAjZGVmaW5lIE1UODE4Nl9NTVNZU19PVkxfQ09OCQkJMHhGMDQNCj4gICNk
ZWZpbmUgTVQ4MTg2X01NU1lTX09WTDBfQ09OX01BU0sJCQkweDMNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jDQo+IGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsv
bXRrLW1tc3lzLmMNCj4gaW5kZXggMmUyMGIyNGRhMzYzLi45NWZiYWM1YmQzNzggMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jDQo+ICsrKyBiL2RyaXZlcnMv
c29jL21lZGlhdGVrL210ay1tbXN5cy5jDQo+IEBAIC0yMzgsMTIgKzIzOCwyNyBAQCBzdGF0aWMg
dm9pZCBtdGtfbW1zeXNfdXBkYXRlX2JpdHMoc3RydWN0DQo+IG10a19tbXN5cyAqbW1zeXMsIHUz
MiBvZmZzZXQsIHUzMiBtYXNrLA0KPiAgDQo+ICB2b2lkIG10a19tbXN5c19kZHBfZHBpX2ZtdF9j
b25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1MzIgdmFsKQ0KPiAgew0KPiAtCWlmICh2YWwpDQo+
IC0JCW10a19tbXN5c191cGRhdGVfYml0cyhkZXZfZ2V0X2RydmRhdGEoZGV2KSwNCj4gTVQ4MTg2
X01NU1lTX0RQSV9PVVRQVVRfRk9STUFULA0KPiAtCQkJCSAgICAgIERQSV9SR0I4ODhfRERSX0NP
TiwNCj4gRFBJX0ZPUk1BVF9NQVNLKTsNCj4gLQllbHNlDQo+IC0JCW10a19tbXN5c191cGRhdGVf
Yml0cyhkZXZfZ2V0X2RydmRhdGEoZGV2KSwNCj4gTVQ4MTg2X01NU1lTX0RQSV9PVVRQVVRfRk9S
TUFULA0KPiAtCQkJCSAgICAgIERQSV9SR0I1NjVfU0RSX0NPTiwNCj4gRFBJX0ZPUk1BVF9NQVNL
KTsNCj4gKwlzdHJ1Y3QgbXRrX21tc3lzICptbXN5cyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0K
PiArDQo+ICsJc3dpdGNoICh2YWwpIHsNCj4gKwljYXNlIE1US19EUElfUkdCODg4X1NEUl9DT046
DQo+ICsJCW10a19tbXN5c191cGRhdGVfYml0cyhtbXN5cywNCj4gTVQ4MTg2X01NU1lTX0RQSV9P
VVRQVVRfRk9STUFULA0KPiArCQkJCSAgICAgIERQSV9GT1JNQVRfTUFTSywNCj4gRFBJX1JHQjg4
OF9TRFJfQ09OKTsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBNVEtfRFBJX1JHQjU2NV9TRFJfQ09O
Og0KPiArCQltdGtfbW1zeXNfdXBkYXRlX2JpdHMobW1zeXMsDQo+IE1UODE4Nl9NTVNZU19EUElf
T1VUUFVUX0ZPUk1BVCwNCj4gKwkJCQkgICAgICBEUElfRk9STUFUX01BU0ssDQo+IERQSV9SR0I1
NjVfU0RSX0NPTik7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgTVRLX0RQSV9SR0I1NjVfRERSX0NP
TjoNCj4gKwkJbXRrX21tc3lzX3VwZGF0ZV9iaXRzKG1tc3lzLA0KPiBNVDgxODZfTU1TWVNfRFBJ
X09VVFBVVF9GT1JNQVQsDQo+ICsJCQkJICAgICAgRFBJX0ZPUk1BVF9NQVNLLA0KPiBEUElfUkdC
NTY1X0REUl9DT04pOw0KPiArCQlicmVhazsNCj4gKwljYXNlIE1US19EUElfUkdCODg4X0REUl9D
T046DQo+ICsJZGVmYXVsdDoNCj4gKwkJbXRrX21tc3lzX3VwZGF0ZV9iaXRzKG1tc3lzLA0KPiBN
VDgxODZfTU1TWVNfRFBJX09VVFBVVF9GT1JNQVQsDQo+ICsJCQkJICAgICAgRFBJX0ZPUk1BVF9N
QVNLLA0KPiBEUElfUkdCODg4X0REUl9DT04pOw0KPiArCQlicmVhazsNCj4gKwl9DQo+ICB9DQo+
ICBFWFBPUlRfU1lNQk9MX0dQTChtdGtfbW1zeXNfZGRwX2RwaV9mbXRfY29uZmlnKTsNCj4gIA0K
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgNCj4g
Yi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaA0KPiBpbmRleCBkMmIwMmJi
NDM3NjguLmI4NWY2NmRiMzNlMSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9zb2MvbWVk
aWF0ZWsvbXRrLW1tc3lzLmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRr
LW1tc3lzLmgNCj4gQEAgLTksNiArOSwxMyBAQA0KPiAgZW51bSBtdGtfZGRwX2NvbXBfaWQ7DQo+
ICBzdHJ1Y3QgZGV2aWNlOw0KPiAgDQo+ICtlbnVtIG10a19kcGlfb3V0X2Zvcm1hdF9jb24gew0K
PiArCU1US19EUElfUkdCODg4X1NEUl9DT04sDQo+ICsJTVRLX0RQSV9SR0I4ODhfRERSX0NPTiwN
Cj4gKwlNVEtfRFBJX1JHQjU2NV9TRFJfQ09OLA0KPiArCU1US19EUElfUkdCNTY1X0REUl9DT04N
Cj4gK307DQo+ICsNCj4gIGVudW0gbXRrX2RkcF9jb21wX2lkIHsNCj4gIAlERFBfQ09NUE9ORU5U
X0FBTDAsDQo+ICAJRERQX0NPTVBPTkVOVF9BQUwxLA0K

