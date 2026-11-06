Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58D2606A326
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 08:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eyAjudoa;
	dkim=pass (2048-bit key, unprotected) header.d=sql-ag.de header.i=@sql-ag.de header.a=rsa-sha256 header.s=selector2 header.b=dX+Ndbc1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ju132GoRhEqaz5VJfU/BcOon/vUNXrnAheJ77I63aNQ=; b=eyAjudoaRmil8IHMKV83qaFOEQ
	mVRH9WVjBhItwPccVQp4LQ28b7tBj0k6l0V3a8ZrHtKspDYo1sHljebOqQPOt2pPHJugiDE9m1mXu
	BZLaO75V3MXFqvNYelyHGgWlewxObz6E+bbWqUjflYPLFFZERSQvbXqHrsO+gBEE4De7d26cArzcw
	MfjEcajjtYzgN8bSO0t1/8vzxPyh1KsA9FlwV986YJsp38vzpvf63SR7YiEEMazGx76ZIoNz530NP
	+OQ18XZfXFj/fAzXvbz5bm4jnP0onzWZmQPouG57C2ccm+rkcWdMfhnoSuByghnFe2dDKzJCJjxX9
	k4YvvqYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFAi-0000000BXM4-2DjE;
	Fri, 06 Nov 2026 08:19:40 +0000
Received: from mail-germanywestcentralazon11022075.outbound.protection.outlook.com ([40.107.149.75] helo=FR5P281CU006.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFAg-0000000BXL8-3TdK
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Nov 2026 08:19:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gaLxZpWvN9AOflFY4mu5xWD+qIZC0d2DP863/R2uTZFbZ5EYtBZ9LUPu8T2WDckFwYz6Tspz76hEurSKz+3whyH0KZ7Org0Z9b3BChLznd5xOgaOV9VQodeXCaav64SRdWMJ0/HET8IiR30gVApFiuE5acdrE0aNWITX8h52I59veiFbLTcdTlNTPAKlUofKr50drGlfpWcu83PyLAoIxi4pYtnvlUXkrsSz4vMKFezXTinIS6LM1Z8iEiAHAuJdFAJWvBvLfOwKfaEg9PRpHEqIJGpcbgloyccDnwwYUnU8UgrGS4Mi+FyTYm343aLvPmyOH1smNBHw3EQUXnfCLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ju132GoRhEqaz5VJfU/BcOon/vUNXrnAheJ77I63aNQ=;
 b=Yl9IphUjJ8THqz67+umu+MvOfWhAmIKtdpqUlna70/Ixfd5wXBqR6lpOJxmfTiEvH67qQjDPlskBXTJiEoJrDniW8iVhwZqokabh+9Ac8XXZ6Ye5MwsimN8jRmev4ZJbyGrSfbuZe5GyEu+vdCCSZSgTPvlSxoWOsEeDPPdoM9qWwyoptyVey2A4wvFqLUaSXr/KoKeBmmzwbW6VMUCc33XkU5gF20zKMjGFruVVsmGhd+pcwBzAEiQjp5CkD8/vvd/d9JAeJYt3gskEMLqVrwWV9mTfL/X6VMCh47/2g69oMv369wa798S+gDOaDVm27eAm/c+XmYnuP/Dnxn4Z7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sql-ag.de; dmarc=pass action=none header.from=sql-ag.de;
 dkim=pass header.d=sql-ag.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sql-ag.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ju132GoRhEqaz5VJfU/BcOon/vUNXrnAheJ77I63aNQ=;
 b=dX+Ndbc1BdBdpKeGsSaSHHb5dVnn9hoWhrwDA9BX5ynWBmA6BTqAak9/e/sjUcJIox9bT+Rclk0ROdzRrPDQPZ/d9id5UOJemvLUbGLEIaHppCjkJy5aNL5zb479fQdgr+aC7eK4f1vIv0wPw28UNpwXnpBLuS77k1Uvs4nNe6Jf849ItwZi8vWTi1ufjymi7UNWYYVOxGXJV6rNpYStJYSqvm7pYdE8QCyqJgNZdZtcqxH1kGIgLvptZZC6RCewKLJQ6TLNIhm//m/rF5xuuGviw+AQKWay6PqJo5ZkGxVk8H7zAkhraVmQsFnvhITLdyD9G6RBs8XPSLbPasEiNA==
Received: from FRVP281MB5672.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c3::15)
 by FR7P281MB760042.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:404::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 08:19:33 +0000
Received: from FRVP281MB5672.DEUP281.PROD.OUTLOOK.COM
 ([fe80::38d9:66ad:9bc5:5d6f]) by FRVP281MB5672.DEUP281.PROD.OUTLOOK.COM
 ([fe80::38d9:66ad:9bc5:5d6f%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 08:19:33 +0000
From: Sven Besser <sven.besser@sql-ag.de>
To: Devin Wittmayer <lucid_duck@justthetip.ca>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
CC: Deren Wu <deren.wu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: AW: [PATCH wireless] wifi: mt76: mt7925: add the common scan IEs back
 to probe requests
Thread-Topic: [PATCH wireless] wifi: mt76: mt7925: add the common scan IEs
 back to probe requests
Thread-Index: AQHdav2GVXOTIAgFwUeRfecjGiCMV7cguMti
Date: Fri, 6 Nov 2026 08:19:33 +0000
Message-ID: <FRVP281MB5672F901E7D26533F6DBCBCBA0762@FRVP281MB5672.DEUP281.PROD.OUTLOOK.COM>
References: <FRVP281MB5672AE5BBD61EF0802D42370A0942@FRVP281MB5672.DEUP281.PROD.OUTLOOK.COM>
 <20261102190811.7498-1-lucid_duck@justthetip.ca>
In-Reply-To: <20261102190811.7498-1-lucid_duck@justthetip.ca>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sql-ag.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRVP281MB5672:EE_|FR7P281MB760042:EE_
x-ms-office365-filtering-correlation-id: 639b58b7-ab69-4aa0-0622-08df3bdeb044
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|23010399003|18002099003|22082099003|10067099003|38070700021|4143699003|261026140227099003|261028144727099003|261021123027099003|261022105027099003|261022075727099003|56012099006|261009223027099003;
x-microsoft-antispam-message-info: 037HLiKlkE1OVaA3GQL6/fmmO7duQfdrJe6FxXYUvsGzxC0p5EHDn4jHhlKR42u7SGq5xqkW0+iKFzx6dER3uOFYcOfnobuxVE8LqiDDPHkivmpyB6JuolG7iEz54ZJ1ps5Unq89ncxnbWDF2XXVRV4fwvNj8f54XB/+OLKyd3oUfMWxNj2SwFN653eO+aO/F/HVRadrBhl/eyy8x+s9A4DfKPipV6T0bJljiME8d6UFDFtomtGER/NCFUKA0khnMgwJC+pOMw/o/QxDfzdu3CR/edrHss9FKz9zLvlwRCKT3QwcexWgpr7zdJ6mVfASPqvHVsCfSrF36vwnA0KIYk446azh6LqRu/avGwG9CZywhQWIkhdco4hXyapeX/KgVo7ThehlASgPt9ZJE+E+9c+d+BK0CEqHy28AJ7wZ2ecH8uZx03uadOVeF+9N/hFpKo68ZdEGWOBzTrUW2G1F2QcRlVkjoChwW8Ay/YP/YzxbXCTSm4lCjBM9xDMDEblKlcIM6KRVxoUQp1GcymUa6UArAGW+DByIqsFSdh29fw0JsN0Nnz+N33U6AGqxTsCggBXruimcKHxN5yeamxc69MyQgg3n9YUO4+gsrfjm64QOd0yT8HuRPSu8xBOffyAkkZYxgd/sX/lPdeiWSU0X0yNgjqxwdkJVXns5vQoE5wlaLfxQr4fs7GNY1UC8SIC9ocWppXwxS4jg9szPYAMEli1POv9r21G/lhqfuTt3Yho=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRVP281MB5672.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(38070700021)(4143699003)(261026140227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261022075727099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVl5WlNHczBaTGorN05KdmN5bTJjSDhrR2FKc0xpdkRwYU9BYnVHQlU5TXNu?=
 =?utf-8?B?MjBYbHpmVnhOK0ZJSWFCUmRheDlKbEFmT00vR0paZ092bnhJTWhONEZQOG5O?=
 =?utf-8?B?cHJKaExTc3RGZmdJSUtVRUl4bmIzNHFaNkFCS1ZWSDBSdXhEZ0EyYUNrT3Ra?=
 =?utf-8?B?Sld4bTlvWmtycVNIbmF1MEpyT0w3TW55TlZvNnZZTzhIdStHZm5FV0NJMnpB?=
 =?utf-8?B?RzE4UVRQZUVsbzhreXM5L1diZWpxTHkyS0NVaUJpWVFrUHprRGJaR3RFMnJz?=
 =?utf-8?B?ajlxd3N5dlU0ZmlVdmFjZzFSMHorZjBzQTgzc21NNU5keUdZcy9VRkFaVkwr?=
 =?utf-8?B?UEtkTHkxUitSa1dJRVdGKzVkOWhySU5obytnRThXelJ6NXdsOExsTExOZDlt?=
 =?utf-8?B?U24ybmtibGI0dmNmYXIxVVFVR0RvQjlCUnRrdDl4bmpibXFQSy9wYktwcGty?=
 =?utf-8?B?QmJKZXRwajVNQjg1MEc5cUliR1V3NkV3Q0ZSeVphd3NKbDhLQUJ6VnplMHRM?=
 =?utf-8?B?UGYrdXJ5V2pNNzR6c1N5R1lTVVFQQldXUUpNaVJ1cXJMRW9OMXdzVHFObXlE?=
 =?utf-8?B?RUpKb1hNY2ZiQk40QWJtWjJYZENpY1JSc25KMlVOTnVNdG9uYkhVQzkzVURr?=
 =?utf-8?B?K0FKVUhUQkVkZWRacWUrL0Q2bVlUeUdpbjBEa3krQ0s1ZmdMa05keitaOHJI?=
 =?utf-8?B?ZzF5YXF2bk9XbThuV3VJcm0vT1RhVnYvN2lOUUJ1NndaMW5lQUQxT2pqS2Vm?=
 =?utf-8?B?anZ6TkNhdklGTjBxdUhDVG5QUDY0RUVzWm5nZGN2QnNIbzJ4T1doS3ZLS0cy?=
 =?utf-8?B?UTJ4aGJ1akdVLzhuYk1DZEpNNU5pZCt0R0o0V1lBWHhyM3UvNk9TYXJTQmRm?=
 =?utf-8?B?SWhPN0ZJdXpYVE93L1BsZVRIbU9WeTJMdUQ5aUxyc3RvWFVZWng4dDZuTktn?=
 =?utf-8?B?MmhIVGJxZTlmYkdDdklGV3JNazBKL3F5MXpiUlRiS1ZIMm1DclA1RXFTUDNz?=
 =?utf-8?B?NUU1Wk9HSCt0T1VuOHRHeWZPV3B6SThlVlpaV3FucS9KMG81akhhZ1lncWdF?=
 =?utf-8?B?NFUvNDhINmNnbXU4djExUHFFeHhONWI0VTFVMmFsVmNuSHZoVU5PRFdLNWFW?=
 =?utf-8?B?QS9xc3BjaC91NlMrWHh3dHVwN0sxeHJlbTNFcE9hK2Q3eGxzU2RDcHZrdElt?=
 =?utf-8?B?MWVRN2wyeElFSzVnUVA5M1FGM1R4TGdYMG5YZ3o4SWpucjVoOWVxbWpRY2dV?=
 =?utf-8?B?Y3VFY3B4RjB4anc1eXB6dEl5S1FORFhGa3h5TFFFYWFJZkd1d2QyTkF1a3VG?=
 =?utf-8?B?VEcyNTBFMTZpMHRHMko1RTlaaFZNaHB6RENhU1RqMWk3OWE1WTAzZEMxdEU4?=
 =?utf-8?B?UEkxOGpNZ3NlMmt1L2F4VllZcDlXTHN2c25XQ0JQZ1FmQmkxNk5MckU1NE5t?=
 =?utf-8?B?a3pGYXJ0aU5xeTRINzR5SXhpUjY3U2s0ZGhrSGRzd1ArU2VHSVZTdU5kYUtI?=
 =?utf-8?B?VzBGNXAvNnR4VDhNcXh5dEUxSkd0QzlhcnBIemRSYzVCNDBoSE1objhiTWR1?=
 =?utf-8?B?cytVUmZTc0doTnZJc0NJY1lqYlpHOERST3VrdXMyeUtWbGRiQ2lsQ2FXWTg5?=
 =?utf-8?B?a3FvM1p4Vkw0aGREK2RRUHh1MzM1STFpU2VhN1pSa0c2YmZhbWZjRExKTlhW?=
 =?utf-8?B?czhnUVVYWUU0d1FhUDR3TytUYjdlYXYzR2NnR0dka1k0MmhHSDFCN21wT3F4?=
 =?utf-8?B?dXRtR2VGdHd5eVl5a1FwZVFsSDg4b2FxYXBZV0hKUFMwYkQraFlNSGZBV2gz?=
 =?utf-8?B?SzloNnhMaVhldS8rWjFXWEZYR2JkVE1IOFYzRFo1bnRnMUZsR1Y2Y0FBc0Jn?=
 =?utf-8?B?Q2N6OXNRcmQzQThhSVA3Z1pSRnczMVBKbk04MmtveTg4S2dVZmRyNzdCUk1l?=
 =?utf-8?B?TDROUU1zeGNWY0RpR0hRUVdWMGZxZWRnNHhsdFF5WlhCWGNmN2taWFdLbTJj?=
 =?utf-8?B?M3c0bWpzOUs4VjBKZm5YMUFmZ2tEalB1c2NWbFdFRHNjMVhEejZlYmYvdE9N?=
 =?utf-8?B?SVlyVWVJQ1Z5Z3RIbE9URVNXWmlrU3ZhaVlybW9XTldFUG9NV2h3cUc3cWFJ?=
 =?utf-8?B?b2xUdGhuUFcrdjhQRU1PSHhQVWtHUXhteVg3T1pkMVBQYllmVVQ1SFlvNjZu?=
 =?utf-8?B?V2tHK2ZCSDNsaW5NUkNURXoxaTBvU0E0SFRxUXM0ZHhqRWVubWhqbGc1N0JJ?=
 =?utf-8?B?cjRXYzZSWVNIN0RxbElzSmhKQWNaSTNyOFZsV1kvb2k0dVdVQ1RYRVNiME1L?=
 =?utf-8?B?MWRqOEFnUkhHV1lMejFlQU5LRU9henQxR012UnFhZmlhcWw4V1FUdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sql-ag.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRVP281MB5672.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 639b58b7-ab69-4aa0-0622-08df3bdeb044
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 08:19:33.5811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da8e29fc-49dc-4ba7-8111-a164e74e51bc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nT09dgGZRvHrJZirwqkEr5bnHWTQ6E6UWJWz3XGYDBYMed82DQd7hGhnG2wDKKTpzZMVczFBwEbOGq8Asl6ssw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR7P281MB760042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_001938_872647_8DE7C149 
X-CRM114-Status: GOOD (  11.41  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

UmVzZW5kaW5nIGFzIHBsYWluIHRleHQsIHRoZSBsaXN0cyByZWplY3RlZCB0aGUgSFRNTCB2ZXJz
aW9uLiBTb3JyeSBmb3IKdGhlIGR1cGxpY2F0ZS4KCk9uIE1vbiwgTm92IDIsIDIwMjYgYXQgMjA6
MDgsIERldmluIFdpdHRtYXllciB3cm90ZToKPiBXaS1GaSBEaXJlY3Qgc2VhcmNoIGNhbiBubyBs
b25nZXIgZmluZCBkZXZpY2VzIGluIExpc3RlbiBzdGF0ZSwgc3VjaCBhcwo+IE1pcmFjYXN0IHNp
bmtzLgoKVGVzdGVkIG9uIGEgVGhpbmtQYWQgVDE0IEdlbiA3IEFNRCB3aXRoIE1UNzkyNSBQQ0ll
ICgxNGMzOjc5MjUsIEFTSUMKcmV2aXNpb24gNzkyNTAwMDAsIFdNIGZpcm13YXJlIGJ1aWxkIDIw
MjYwNjA1MTg0ODA1KSBvbiB0aGUgVWJ1bnR1IGtlcm5lbAo3LjAuMC00MiAoNy4wLjE0KSwgd2l0
aCB0aGUgcGF0Y2ggYmFja3BvcnRlZCB0byA3LjAgKG9ubHkgdGhlIGNvbnRleHQKZGlmZmVycyB0
aGVyZSwgdGhlcmUgaXMgbm8gaXNfbXQ3OTI4KCkgeWV0KS4gVXNlciBzcGFjZTogTmV0d29ya01h
bmFnZXIsCndwYV9zdXBwbGljYW50IGFuZCBHTk9NRSBOZXR3b3JrIERpc3BsYXlzIDAuOTkuIFNp
bms6IE1pY3Jvc29mdCBXaXJlbGVzcwpEaXNwbGF5IEFkYXB0ZXIgKG1vZGVsIDE3MzMpLgoKV2l0
aG91dCB0aGUgcGF0Y2ggdGhlIGFkYXB0ZXIgaXMgbmV2ZXIgZm91bmQuIFdpdGggaXQsIGl0IHNo
b3dzIHVwIHdpdGhpbgpzZWNvbmRzLCBHTyBuZWdvdGlhdGlvbiwgV1BTIGFuZCBESENQIHN1Y2Nl
ZWQsIGFuZCBzY3JlZW4gbWlycm9yaW5nIHdvcmtzLgoKVGVzdGVkLWJ5OiBTdmVuIEJlc3NlciA8
c3Zlbi5iZXNzZXJAc3FsLWFnLmRlPgoKVW5yZWxhdGVkIHRvIHRoaXMgcGF0Y2gsIGluIGNhc2Ug
aXQgaXMgdXNlZnVsOiB3aGlsZSB0aGUgc3RhdGlvbiBpbnRlcmZhY2UKaXMgYXNzb2NpYXRlZCB0
byBhbiBBUCBvbiBhIGNoYW5uZWwgdGhlIEdPIGNhbid0IHVzZSAoNSBHSHogY2hhbm5lbCAxMDAs
CkRGUywgb3IgMi40IEdIeiBjaGFubmVsIDEzKSwgd2UgYmVjb21lIEdPIG9uIGFub3RoZXIgY2hh
bm5lbCAoNSBHSHoKMzYvNDAvNDQpIGFuZCBncm91cCBmb3JtYXRpb24gZmFpbHMuIFRoZSBzaW5r
IG5ldmVyIGNvbXBsZXRlcyBXUFMsIGFuZAp3cGFfc3VwcGxpY2FudCByZXBvcnRzIFAyUC1HUk9V
UC1GT1JNQVRJT04tRkFJTFVSRSBhZnRlciBhYm91dCAxNSBzLiBXaXRoCnRoZSBzdGF0aW9uIG9u
IDIuNCBHSHogY2hhbm5lbCA5LCB0aGUgR08gc3RhcnRzIG9uIHRoZSBzYW1lIGNoYW5uZWwgYW5k
CnRoZSBncm91cCBmb3JtcyB3aXRoIHRoZSBzdGF0aW9uIGNvbm5lY3RlZC4gV2l0aCB0aGUgc3Rh
dGlvbiBkaXNjb25uZWN0ZWQKdGhlIGdyb3VwIGFsc28gZm9ybXMsIGFuZCByZWNvbm5lY3Rpbmcg
dGhlIHN0YXRpb24gYWZ0ZXJ3YXJkcyBrZWVwcyB0aGUKc2Vzc2lvbiBydW5uaW5nLCB3aXRoIG1v
cmUgbGF0ZW5jeS4gSSBjYW4gY29sbGVjdCBsb2dzIGlmIHRoYXQgaGVscHMuCgpUaGFua3MgYWdh
aW4gZm9yIHRoZSBwYXRjaCwKCu+7vy0tIApLaW5kIHJlZ2FyZHMKClN2ZW4gQmVzc2VyCgo=

