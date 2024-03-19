Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713B3C54E5D
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 07:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwwpCBLiklPRqN8WARPIXVqPX0hPK9o3ZacfVMIInjU=; b=HQbnfWHpZMs3sZgZJqMLCB4/01
	ZIXfhIG4Md+BfQ52nk/811DUazGp91MOo7pfl8YIl/v1IRmVp37Tu+zCTD67PgMK6nGeliH/LEuDy
	0KPMf5CtXl2R6tyi1jJ8xHhpqnJbkfBhO9fFSg6sdONpgW4v0yONRR6TXBthwydsow8xx4vz3AD3I
	U9YlX+vmcOKbBOdN+lwUvjTqcb5kEwkDqH+1Sxp5MWZyWD3GjTf9VZsRiFwA/jVezA0flle28aSb0
	dgMhj5dxDUTbpUaJHc2gLCjTdOpur0gGEyBQqR25nQIbCK9DBu16GDmd0DSb7Ms4MvM11IXpUzkOO
	9NS81wiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmU0X-0000000Biyz-49l7;
	Tue, 19 Mar 2024 07:35:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmU0U-0000000BiyF-0c7n;
	Tue, 19 Mar 2024 07:35:36 +0000
X-UUID: 42cb3adce5c311eeacdb61a41848c7d2-20240319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=uwwpCBLiklPRqN8WARPIXVqPX0hPK9o3ZacfVMIInjU=;
	b=mAjPjy3y0uz4t7/87+eaG46ShRP+emYnSAIaEXGpXrW4ENBrBWgnfdnjrRuzn74/WPD+ll7C1+uwkh7Oxdlvphr74ZKqRJkJ3XWJVXgF1SPHaghP5iIHdB6FHenery7ZAvWjaXPdkOOAKOBW7YZ5Pwghr1R7+sWoSGW1jAeY3Qk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:0b5e5208-e3d6-4544-b8ae-c2fdac6aa621,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:c3219290-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 42cb3adce5c311eeacdb61a41848c7d2-20240319
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 184226367; Tue, 19 Mar 2024 00:35:29 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Mar 2024 15:34:54 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Mar 2024 15:34:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uz5bbJJmoABVjHMFuFKhhSPYtpeu0mPZMtkUs3d2mhT9fNl63Tzy2druWdxYlT/tISdks+bwDWCEFxhOtrFVqO9imXUkpXjnczMXMYLUCUh5UeIF0HzMiJIRaWDdXh05KjTLzsvugniwO14SnxGHLHdP9MlMhOn98kYek/AF45f/bDiM8JfyhABDMxZ4v93xHk3cjMmqvZKP+zVH4lYvzyZUAiAzToUIds+ueHsO9N8Tkbb1BRJ07Rw7kYVlKieUIpCvGbKV0iw4wGq+pTaDNJ4FRzfuXq0JQj0/rmlzViGk+sE3irhZh3TCiwy0XhDuhhUtGc4pVZJ6xEx2Te5vbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwwpCBLiklPRqN8WARPIXVqPX0hPK9o3ZacfVMIInjU=;
 b=BW/2evd/nqNmeDNr3nxHvDuy0BCiqAlqZ5Xfpa5HGDnWJrgClFTgIDo6MsZyNfJf8t4pgkjaw854hVJGrFy3C7kiWdeU2d7EMkkGBtjbycf1NjCBV8yppDRrYAGFRwoB1w9CCN78GXSW5Ez586TP2OS3ZNUkawTtEjRdcQeh1X9tiJdaP0LHZCxEFDP1mJ87P3bUR5E2PlIEO6md0D1WScDqsSbHDJmMcU8/A7bbYSpxMto6VYND/8GtcBzDhUqX+GQtcds5ohjZQmttkeui21vKv19S87gjle76ITbqomoPnVtEuIlCVci+yEtJ+f90lh0HDWSTSuC6We/9e9TLiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwwpCBLiklPRqN8WARPIXVqPX0hPK9o3ZacfVMIInjU=;
 b=Q8OtFMqsr2TPuB8lIQII+CeDympi6wyz+axS1xAtM3r6Pc7tTHNK8ec73Ln3H0baCqb+UHBrPFKBY1lYn5rZWyUlxBEtO1mpbQ2unccQZ895sOFysyACQWelhuU0VppNLoV+bdlICtpQsfJLrqD8YpBcW5ZQNkMrMbMkPIl8aQk=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by SEZPR03MB7629.apcprd03.prod.outlook.com (2603:1096:101:12e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28; Tue, 19 Mar
 2024 07:34:52 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::be:5466:6e74:793f]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::be:5466:6e74:793f%6]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 07:34:51 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>
Subject: Re: [PATCH v5 06/13] drm/mediatek: Turn off the layers with zero
 width or height
Thread-Topic: [PATCH v5 06/13] drm/mediatek: Turn off the layers with zero
 width or height
Thread-Index: AQHaX/dYW45fOOHcWkO709TYkvlombEimoWAgBxFZ4A=
Date: Tue, 19 Mar 2024 07:34:51 +0000
Message-ID: <7a0774c7851e525b1f245cff747d0034b35edc79.camel@mediatek.com>
References: <20240215101119.12629-1-shawn.sung@mediatek.com>
	 <20240215101119.12629-7-shawn.sung@mediatek.com>
	 <dc7569baf040a0cf2ba9d176ea69e250dddfabdd.camel@mediatek.com>
In-Reply-To: <dc7569baf040a0cf2ba9d176ea69e250dddfabdd.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|SEZPR03MB7629:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RL/HX3QXHbrABIAaemTfsge7yT3ABoPlfintIQX6o/DZ2IXnjURs7HVtbFJfVVb0oS/rUNgLhC19QHx2Z6kADJj4FpMNOIdCKCCR/DCiB06MgAUBdZwvNUy5JXDRUQkto6t0mo+aXjhvagQIzGsa2Y7bwilInIz/aI+/mYSlHxY1ts9X98BaC4w/t6PUBYfosdLbQBciuSK7fV30u2UwjeTlNsskKHgC0FLfeGNE6VvpsPJ0LFuEfxdkCcO+O1xpKuk+EFjP5SxlG4gNTOQ9JAChhHFI0JTvUtirCpy1bXmOMNU70458nwow9Xk2GynalanYoGllIbv5E/AneoiYTM0gys78EXwLGmzHevqFx6HnfvpCeEXxYh0zvAigNQvWK7S5t37vKPbvk7tp0sCbEJdC9Gma7H0yA+MstyPSttxoMiBNf5C6TM88sAs+e88DQRXOBVERx0wUkj7kxjL0SeoygNQaQqHrtDYbCvpKLSDk2UsUFOtC5zhAkF++KuPEeb+sgwHiLfZhDepbGcAki/62kl6Fu7NT46u6BSIs0K2VekQHRqAD+FZfNkJxsqi01dwn4BNv9UQ788nhYPQvBoa/mP1k3hoJ6eopa3H22xwSZYe5mzk7XymaxkS7+F5GhfvOEWFt3XEsxr+pBgAmb9DYqOhg8W5rU5dzmlRI3WI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6623.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(366007)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UC9wR1RqbUMrK1JYTVlLQSswVEk1MjBpaVJ2QWxLbzdoYWtFdG01WGc4MHp0?=
 =?utf-8?B?WFEvd3JzS3k3RVY0MlQxMisxK3F5MGVMeVNPZ1ZocXJoR0RyNmxyUnRhOVZZ?=
 =?utf-8?B?ZWhPaERTYnZhY0hCMEpZTGQ2Sy9wS096aGxKT1RiakdJaGhwdG5DUjdiV0lo?=
 =?utf-8?B?Q3lMZkRvOUcwK2RDc2ZEN29XUzZLM3BxSXJhSExFTGFyT2Nua2hXd0R5R2Z3?=
 =?utf-8?B?T1duUmRoYm5hSndQQWMrRmJ0VFI5Vjc1Zmx4R1Nsdkc1ZDcvOU9oaGtkWURx?=
 =?utf-8?B?dmNoRndBZE14QjNkSXNZT2lqV0Zwa2hSY0FZNjF4UG1EMFcxU0JrTE1hN3dm?=
 =?utf-8?B?VjQzVmgyRzd6ZVgwQ201OWhPeVpuS2UyYjFRUE5LNEVqWXlEWDRXcXhRRER1?=
 =?utf-8?B?WWxzSkxKQm1UU3lOSGZ0R1BPYVdwK3J1cXVCTzNta0ZITlV4QjF2OWJnc0xL?=
 =?utf-8?B?VVAxNC9jMTJTbjV3ZExzbVVwTEQwbVJmeXJyNXhOemIyNWY1TzVBT01sYnR3?=
 =?utf-8?B?dEwwSVZXemR0d2hVakJPMnA2Qy9XRTVQZElxZUlZRHdEN0F2d1J6cTROMk1h?=
 =?utf-8?B?RkxhZ1RaaFgzWWdBWFJsVWozeU1QckpKbTZZT1dGbk5hV3hnZHJBdHR1OFZl?=
 =?utf-8?B?dGNHL3UyMWZsYk1zTXNjQVd2d3NDSzRjQmRjUDYvRUZiSlNrZithMXh0V3ZU?=
 =?utf-8?B?R1NnN3VIL2VsZzhDTXJjaUkrTWZZTDZ2QWlGa0Y0ZEt4eXVEQnVKRkczQkc0?=
 =?utf-8?B?aEZobk05MTVvd3ppdDJ5WlpLb1lFUDFxenZSeG9yU2RlK3VaY1JHYmhETW52?=
 =?utf-8?B?Qk9vNFl0akpCWUlqVGdYdHBRbldjSXY3MkZOelA2K01JcVdsQmM5ZnVRampD?=
 =?utf-8?B?clZudkVEVkswb1Npem1scEQrQk1DZ0xGSDBmVHlkQ0kyYkVHZ1pTelVsSE8w?=
 =?utf-8?B?VTJaeUdMSVNhdEY2OXljMUpaKzlIM0VyTUNMUmxzdTZUOG5OUGpHcmpsWENN?=
 =?utf-8?B?RmMzeEd0amhKT29TeVJtbUNaUThjTXQxSis0UC8yRTZyUDZWYytmNE15N2VH?=
 =?utf-8?B?Vm9sT0lTUXJ6c0lLSDcwbFc1emtIUXFBY1BXdkxlTGs3WE50WVZkQk1ZWnR3?=
 =?utf-8?B?eTk0WXNNN2NGMklpOXdBam0vSTNYeDF5blRReGpCa05lN3hwR3lwSG9mYUpQ?=
 =?utf-8?B?RlVYL25ITVpzVXVJU2NSaTFJNDRFUmRXYlNVZWRVaTJOV29kZXFZRFBNcmQx?=
 =?utf-8?B?TWthQzFSWHVPeXVXVlhUOHhiS21vS1QwaGF6WlVHdnJEbktCcVpYRjNHS2xT?=
 =?utf-8?B?UnI1aCszVG9mN0hlMng4dzZYaWllblBiNXlTZUwrSzRCbzdsMFllakhid2Ru?=
 =?utf-8?B?V1BIMWtEQ01rZGZrdXd5SmRjQ0Zya2lOLzdET3crdUtqV2xqdjIvVUM3RXRC?=
 =?utf-8?B?ZkhmMGFHL2xBZDZFek4yVldCQmFvWGlWMGFQLy91N3RrNks3K1VreGd5VWdC?=
 =?utf-8?B?TENVaE4zNXRGWkJmUnhTRmFkSlJBTVVNcGZMNzJQazhUNUhYRWJneUlsVlhW?=
 =?utf-8?B?cW9Tb2ZTRzBzRTY3NHdZcHFjZHZsSDR4MGRxcTRGZWVYdTVxb1NLVjlGOTZ0?=
 =?utf-8?B?M1JYTTl0UTJNTU51VzY4dlFFT2s2eG9OTG9OalF0OXhaNEFnSmlJSU1qUnp1?=
 =?utf-8?B?L2xkblg2MWIvMWVUSG1FdGYwWW1QSEFvVldXSUxRRjdkQWhzaWlWOGtUNEM1?=
 =?utf-8?B?RktyQjZhLysrYWhtRWFiWUg3NGZ3amN2cnVjZEhldFQ2WlBYMFc5K1RseGs0?=
 =?utf-8?B?T2Flc3Ryd0lJYTRRTWNlQkFqOWZ6TlhBdTQ2M1k4bTZXUGtIVE5nNWpXYlg1?=
 =?utf-8?B?SlBxUFdmNVZ6VTVaRDRhQm4vZTdqRkJ4dnJTbm93a2x0VzhwemZydVZWRE4y?=
 =?utf-8?B?ZndGbDgwMC9FYWk5czB1UmtIdnFidi9mR204V2NEMDRQMmlMZXFpaUI1QTJ3?=
 =?utf-8?B?OTVUNUtJeEVvVkJoU0llWkVYSzJ2eXpoQ0lYN1draklFc1czTEZLMitoUHpD?=
 =?utf-8?B?d0ZSMk1JU2l0eFllZ1RQRDZBeG9LaGNjZXNycW9iRFlQbFpBMXVyRitYZnpC?=
 =?utf-8?B?YzNMMFhURnRVSmFLM3ZSRnd3UHBiampVTmxFTXdIQTdVVTJ2WHlvcjV0MU9I?=
 =?utf-8?B?c1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08E6D75FA0C1BE4DBF40B122BE174E50@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd9e4699-3194-471b-ca57-08dc47e7107d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 07:34:51.9311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5G/3a39dDp4TPi2+OTJmPazMJzOwEQoVfOr70cEQqdeqYQprR+bPRH+6uJdNpCgpX9eU8URuUr7AdfPZV010xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_003534_329141_A3F2ABB8 
X-CRM114-Status: GOOD (  15.18  )
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
Cc: "seanpaul@chromium.org" <seanpaul@chromium.org>, =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>, "jason-ch.chen@mediatek.corp-partner.google.com" <jason-ch.chen@mediatek.corp-partner.google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ0ssDQoNCk9uIEZyaSwgMjAyNC0wMy0wMSBhdCAwNzo1MSArMDAwMCwgQ0sgSHUgKOiDoeS/
iuWFiSkgd3JvdGU6DQo+IEhpLCBIc2lhby1jaGllbjoNCj4gDQo+IE9uIFRodSwgMjAyNC0wMi0x
NSBhdCAxODoxMSArMDgwMCwgSHNpYW8gQ2hpZW4gU3VuZyB3cm90ZToNCj4gPiBXZSBmb3VuZCB0
aGF0IElHVCAoSW50ZWwgR1BVIFRvb2wpIHdpbGwgdHJ5IHRvIGNvbW1pdCBsYXllcnMgd2l0aA0K
PiA+IHplcm8gd2lkdGggb3IgaGVpZ2h0IGFuZCBsZWFkIHRvIHVuZGVmaW5lZCBiZWhhdmlvcnMg
aW4gaGFyZHdhcmUuDQo+ID4gRGlzYWJsZSB0aGUgbGF5ZXJzIGluIHN1Y2ggYSBzaXR1YXRpb24u
DQo+IA0KPiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCj4gDQo+IEkg
aGF2ZSByZXZpZXdlZCBvdmwgZHJpdmVyLCBvdmwgZG9lcyBub3QgaGF2ZSB0aGlzIGxpbWl0YXRp
b24sIHNvDQo+IGl0J3MNCj4gYmV0dGVyIHRvIHBvaW50IG91dCB3aGljaCBoYXJkd2FyZSBoYXMg
dGhpcyBsaW1pdGF0aW9uLiBUaGF0J3MgT0sgaWYNCj4geW91IGhhdmUgbm8gaW5mb3JtYXRpb24u
DQo+IA0KVGhhbmsgeW91IGZvciB0aGUgY29uZmlybWF0aW9uLiBBZnRlciBjaGVja2luZyB3aXRo
IHRoZSBkZXNpZ25lciwgZm9yDQpNVDgxOTUvTVQ4MTg4LCB0aGUgaGVpZ2h0IHNldHRpbmcgaW4g
T1ZMIGNhbiBiZSAwIGJ1dCB3aWR0aCBjYW5ub3QsDQpvdGhlcndpc2UgdGhlIGhhcmR3YXJlIGNv
dWxkIGhhbmcuIEFsdGhvdWdoIHdlIGFyZSBub3Qgc3VyZSBpZiBvdGhlcg0Kb2xkIHBsYXRmb3Jt
cyBoYXZlIHRoZSBzYW1lIGJlaGF2aW9yLg0KDQpSZWdhcmRzLA0KU2hhd24NCg==

