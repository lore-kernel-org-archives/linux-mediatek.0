Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84D8C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 09:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74p0Kl9KcTELpmL84IpX2NO2rxHAzVFLKrLpeH1oVPw=; b=T10NYTn6YSbEuAZiiCNtLnvJ9R
	LBF+FjyccEl7ij+9dI/F5KKirr0RZ3O5v087cg2VVv6m8tYK42QaYJZys4ZidN6OwINIcJXVhdmgW
	OnS9nlarLhnXCHZlDn5l2pSHmn2vBYOJJttY56tg68JsU+HqimvCFP+R0n5nixt99WRvSjGJcCkmg
	KZkqSqUQrXuqLr3WDHOwARPj3OLC1zVwXJi+l95gKgX+MDVwsrGk4yAKVIjzr89u7kDF9UtaaqC5o
	VcC0hev7hmZ4pOwo46+ZQC2p0hjbbJrlnQlQ16wAhzCy06t01K4efL6V+Tx5pJDDbPe2Ekv+QyJvx
	24yKIvaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQ9t-002lV8-5s; Mon, 30 Jan 2023 09:09:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQ90-002lQN-6V; Mon, 30 Jan 2023 09:08:07 +0000
X-UUID: 976339dca07d11eda08d4d6090ec5a5c-20230130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=74p0Kl9KcTELpmL84IpX2NO2rxHAzVFLKrLpeH1oVPw=;
	b=n3oxHWoPl3qa8VXy2ts4McokYjlOu2rneyjDIjLP3ai2GE+hm6iUc64qGSe6bm1wcoKyov9/OBgEuOhFlhPPJ7SmRtPD53oJYjSdjRaazvUc/Wb45UqsjOzt4XYkZgvuGfSpIHCATd5DJ8q8jpxeIyYX/Ha883t8SeUikIDKkzE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:42161a40-1fd3-4c40-973a-0d61d34ee434,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:bcc5578d-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 976339dca07d11eda08d4d6090ec5a5c-20230130
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1267147378; Mon, 30 Jan 2023 02:07:58 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 30 Jan 2023 16:47:22 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 30 Jan 2023 16:47:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/eYzUY7xU6ShcJi/0JNs+yTMOCkFCME2BU2Hhbm1wsuBtzZqRYZ7tcNnRDeFfsLZSi2yzSaapkqjnj7/HNCSO6g08xWg4umiPLMKafSSvEFI41urWj/hlYyeH63luSiObMjEkD/X+rB7XIsI8Mw06gxmNMA+MKRVLFv+1WcHIrZiXyjzEUGbg2Q8oYxn3m71bl/VnY3RTi079x9UBhg0MwUFmD2k7cGwKyH/hvgWcW0qtkXRlfaSsExiN2/+PElnsmPgtmH+afXmdcVQPlfM35bgFIzm0XoayQhpNEsWcTCGPGQ1YXMnCNwtrDtCvLwtt/CCKynyMNbRQbyMKrDIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74p0Kl9KcTELpmL84IpX2NO2rxHAzVFLKrLpeH1oVPw=;
 b=MB7oPVYZgdacpA+aKJhStFbPjshVz8rzNXolIPv7ViOM68cegfBDEQlGXgOX/eTjoLR5EGiXIRe/543XCeZrslr/uq3SaK4h4wmJdpftiKoF0RT9T1ClE81MIogZslUXd4FEVzziHZ8cwathYPWEr3aRADKR4I3xTaYfkNybRWO4G8gn8Akb3i/m6ZNTZP7jqjJMXbY8/T7WqCeyRZwWXDVhpEcoH6VlUyGtFrVrj3x+zz/PnFGg2iHCjR1ENg4c3isSnKU3QXeT0zzqrpUpX8JtKdOZBsjzk3NUKUuOwUnTHMuyF9UtFrKsbhP0bsWtVM2RHmPt0n5kD6Hu6pMKhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74p0Kl9KcTELpmL84IpX2NO2rxHAzVFLKrLpeH1oVPw=;
 b=us8fi3XAmmKW04gWo5xDP5JJ4HaF0NInhvGXNZmaoZPYEVJRbi7tF3+p5EuWXa0njv3YGo0laKSIlrTvEoEHusfUljFwfUonOnn528wQi/eyUO1Yi3wFLo4dD6X8F1vM/oQNiFiYA9I6aiuO4BQR7EBvg/OOHCmfLIW56KrA2nI=
Received: from SG2PR03MB3434.apcprd03.prod.outlook.com (2603:1096:4:26::14) by
 PSAPR03MB5301.apcprd03.prod.outlook.com (2603:1096:301:41::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.33; Mon, 30 Jan 2023 08:47:20 +0000
Received: from SG2PR03MB3434.apcprd03.prod.outlook.com
 ([fe80::42eb:28a2:4d2e:d051]) by SG2PR03MB3434.apcprd03.prod.outlook.com
 ([fe80::42eb:28a2:4d2e:d051%5]) with mapi id 15.20.6043.033; Mon, 30 Jan 2023
 08:47:14 +0000
From: =?utf-8?B?Um9nZXIgTHUgKOmZuOeRnuWCkSk=?= <Roger.Lu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "ribalda@chromium.org"
	<ribalda@chromium.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2] soc: mediatek: mtk-svs: Enable the IRQ later
Thread-Topic: [PATCH v2] soc: mediatek: mtk-svs: Enable the IRQ later
Thread-Index: AQHZFLsZXfCtJaObQ02sRB4sn6EX+K54CuGAgDetMACABy1dgA==
Date: Mon, 30 Jan 2023 08:47:14 +0000
Message-ID: <2dc3962eaec214514565302fd8940c03fa8d0243.camel@mediatek.com>
References: <20221127-mtk-svs-v2-0-145b07663ea8@chromium.org>
	 <12f4d25e-fb2e-8f4d-1874-46f7404b05b6@gmail.com>
	 <36e7ab30-8e59-5fb1-adc8-1a9f0e213b52@gmail.com>
In-Reply-To: <36e7ab30-8e59-5fb1-adc8-1a9f0e213b52@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB3434:EE_|PSAPR03MB5301:EE_
x-ms-office365-filtering-correlation-id: 8053129d-9ce1-45db-a878-08db029e95f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 92NSFKQCxq4tCL8NCHxcO0XtQKJo9ebAHgBS2cRBqqdjnyTZzXqGozQSX5HFlSezf7Uzy1I4IROB/KXu0gJP33XylH694aHmmPQuTJS/UaFB5KAVfQXyyLl7rJi64/aUdB3GyXTR2g8P/ksSZoVo2IhgodZUXiD+ym+4qvGeVk8tfqsgVNb1ZGbMXVP5C/PLI1gCWmzWfT1V99kuvAd/pT1xQLyFTtRxwLc5/8xbMo1oBsVo6nQtrt/DXIMHU0lRlixvICjmvxG5RYPgHHV1izhZ2K2e+xTOR009mc6vU5DkWJeyfx0QtH7PNwI6zB73gTy7ytPAWOGmSwXkjtjxzgLZVZCp7HyzWc/EKiHsyWi5UFzif88EppGecDU47l+V3Z9RT6TiZuqi6nnOh6QVuO8U0CFGG1ARNnr6QTG43OSpHaupqaHAXy6gpeizlT5xVG85p9ba5SMNfg8Ulk82kceq+lBy9YFvC3xFRwPZDmTk8j9s1mc3VGf6W4Hvh9K1BxRAN19WuP4OJ+hq7mMMyQYyAD/W4NOXR3Lf49p0RXzx1KJ6zhkxO+jxqhDIFDnWEom4oqcKecnJYGs7YBKDPHJS5NzVwz4krwhgPoxl3PmpDevURVFXNrLxf8m9YwBx+LGtAW+nA81ZaNrJYrSO5eFPraY1t38d9n+8EyAZDhE0ijnWo1DmOv/uSHoPu71yhmXN0FKJN/7jGkczn4yA/A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB3434.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199018)(66476007)(66446008)(64756008)(4326008)(66556008)(66946007)(8936002)(8676002)(316002)(110136005)(54906003)(4744005)(5660300002)(41300700001)(76116006)(6506007)(2906002)(186003)(71200400001)(85182001)(6486002)(478600001)(53546011)(6512007)(2616005)(26005)(36756003)(38100700002)(122000001)(38070700005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUJLdHVwdHEzcUdRSDN3ZWF6bTJZN0NCKzNCSHBqWTFMeWxTRlRYcG55Qnpm?=
 =?utf-8?B?VWVyVk4rQjVacjA3L3l6dzB0WFNxTHFLQ2ljU2dPRFJ2WnFjdWphVjFCVjZZ?=
 =?utf-8?B?WjUxSlFYZFNyZG1LalJ1VlgzaWZSYzRjcVBDL050aEZkUndMeUtUV254UDhi?=
 =?utf-8?B?b0ZMY0t4WmpRekFUZFUzZFA3ZEU4SDczbzZzbHhieUNPQVFBZlhMOUI2K3lZ?=
 =?utf-8?B?eUFOc1orTGh1d0JxNnN0bFJwaWpNUVFYamtGWlpoWnY2TGtGNEs5bjZ3KzNZ?=
 =?utf-8?B?RnlsdGpqWDM3UGkxYk1DN0F5YTgrL1RNY1F4NjlHblE3TExvMVEzSW5ScEhV?=
 =?utf-8?B?OHMreFBwdnVGT0dsaW85OU1Bd1pUVnpDNDN5SmNJcTRGaS8xUU5sRlFyRU9z?=
 =?utf-8?B?Y1hIVFRlU3daelZPbWsrNXNaRTJMTW5abFJpYlhZay9WZmFrL05zejZ4bHY1?=
 =?utf-8?B?WFBjNnNoRy96dlRMYjA1UHBKVUJocGtpQ05XeXcxREJCWDZiSE9QU2p2Tm9i?=
 =?utf-8?B?ckdId2tIcnd5QXRPSFkzeUNwV1NZVnZadC83QnkxZWMrQUZOUmdXWlpzTDZx?=
 =?utf-8?B?eVQzZFQxVUZ2Z2hhd2VjaXJWS21oSy9LY1Q3TnhmVVpqc1RYTzdZQ0dTUjEz?=
 =?utf-8?B?d2ozMFpURjRPamJsdy9sZTUzYXdtMzkzTFJ3V1YrY3kvNU0yNFQ4U09VaTQ5?=
 =?utf-8?B?ZnpHd3pleUtWeUhicWg4Mk5JMTdkbjhnai9WNE9LbmlGYWRQVDltdUhuTWFD?=
 =?utf-8?B?bUIwdElIQ3NDcGsvcDZRYmp3Z3JoamU4ZVp0ekJiOVE4dG1MM1M3RUFDT3FS?=
 =?utf-8?B?MUZHMlA0UHF0RGV5SW5wV0YwK1lKaUI1cjM0MDZFYWdPOWxvMjJZYmp3bVph?=
 =?utf-8?B?Szcxby9lenhvWTY2ZzVNM01jb2VpdXAyb0dMSWZkbEdPR284Qkloa0o3Z2Rx?=
 =?utf-8?B?am5nWVlFZ0d2M3ZkWFZEUEFLQ0tHUEk3dkFrWkZDT3YzWlVqUW9iZ2RkR3ow?=
 =?utf-8?B?SWtBOWYrMzg4R0kvZFI0NE91ck4zMTM3TndFMHExUHIrK2pxSkY1OTRMeGlZ?=
 =?utf-8?B?eTgwZnVNd29vd2c2WWxUaW5mbys3ckJ4ZThXRVdQeXZwS0h6bWw1dnV1WGx3?=
 =?utf-8?B?MWpwWThJYkRvQmsxVEdWZU1nMGtaR2pEcEVQOUt3SDZINCtuQXFEZ2F1OXBs?=
 =?utf-8?B?blBwRWZqcWtON1dXSlAvQndWTXoyRi84ZUtpdVZXWHZ0Y0xrNHluYnhwZVAv?=
 =?utf-8?B?azRNalNGWHhQY3NXWGhRRHJLRm5kWTk0OVdsc2hkVjZoVUJUYkgwbEVZd2FY?=
 =?utf-8?B?MlUrNnYra09BbEs1b1VaRVdGM0t3RFhoZXl5S243aDZUdWxnTXBLY096dkN1?=
 =?utf-8?B?QStsVzhlNGd6WkpxZmFpdm9XenlNdlpkVnlEV3IwNWNGYzljTEoxZGhjODhx?=
 =?utf-8?B?TzUrbENoTE1Nb1BwVVhReUM1cVJaUzI2a1dMV2RPRHFKQVJoaEtLYmg2QzZx?=
 =?utf-8?B?UFRvV2ZlQW9JRGNudk5vSFhoUmtDWE5Pa1grWjRlRFk5SWtrRnV1dUVkUE85?=
 =?utf-8?B?M3IyWGVoaFpmOTVsazlLK3hsaHBzYnB4d3gvY21GRXEybko1bjlpSzhpdXBU?=
 =?utf-8?B?dnpuYVg2Y2w0cUpGNm1xKzNUNVNBbGxOYXljQVhXdTlDRnR3OHZXUko2VDZ3?=
 =?utf-8?B?RndrTk1qcUlWempRM3VreHRBMEh3NXBBOVlvZjdGV0FlTnF3Y2I4cnpUbzli?=
 =?utf-8?B?dHlhZDdNQ2xrNEJ0M1VDcmdWcVhBeHMzaUxIdWZibVFtN0VyZDVzZFZQajZM?=
 =?utf-8?B?Nmpab0tTTVhLamx4a2JvQ2NsT1N1VTNCNTl0MndhM1hmcTY1cExDd3ZBUFpB?=
 =?utf-8?B?cjBUR0Y4OU00c0RhbDNscHNWZkVmSjE3NUVwczE0bVJGWHIzNGZkL2FMd2Nh?=
 =?utf-8?B?MGVNSituNTZnaGJ0aFBrUDR2b0tWUUhlc1JPVHB2VFk4ZXJQU0dJanYvRmhr?=
 =?utf-8?B?TjBpV092OGRjdkxjc2lZZUlZVHNQY3h2S1o3a095QVQ3U0xaVEdHMGZ6T3A1?=
 =?utf-8?B?TTNJLytoYXQzNUZDUVl6UWRldXplR2w2cWhjcE1FRXJIc2F1NVhTa053bjht?=
 =?utf-8?B?dHpZNE12dEZ1N29LRU9YeG16a0FZbFVpOFJocUMzVUd2Uk9CbUp2cFNObE5L?=
 =?utf-8?B?YUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D15BB6B04BFB748915EE3AD14CDC025@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB3434.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8053129d-9ce1-45db-a878-08db029e95f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2023 08:47:14.6515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KGcd9lGpnyBitQjqV6HhbZqWbjAdp6SV7WPvD5EJSzFimsRz1gaqbyW2WrOLfjasOMQxrWd1ynBmRMTmX3lfzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5301
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_010806_271854_D73B1744 
X-CRM114-Status: GOOD (  15.65  )
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

SGkgTWF0dGhpYXMgU2lyLA0KDQpFeGN1c2UgbWUgZm9yIG1pc3NpbmcgdGhpcyB0aHJlYWQuIEFk
ZCBUZXN0ZWQtYnkgdGFnLg0KDQpPbiBXZWQsIDIwMjMtMDEtMjUgYXQgMjA6MTEgKzAxMDAsIE1h
dHRoaWFzIEJydWdnZXIgd3JvdGU6DQo+IA0KPiBPbiAyMS8xMi8yMDIyIDA5OjU2LCBNYXR0aGlh
cyBCcnVnZ2VyIHdyb3RlOg0KPiA+IA0KPiA+IA0KPiA+IE9uIDIwLzEyLzIwMjIgMjI6MzUsIFJp
Y2FyZG8gUmliYWxkYSB3cm90ZToNCj4gPiA+IElmIHRoZSBzeXN0ZW0gZG9lcyBub3QgY29tZSBm
cm9tIHJlc2V0IChsaWtlIHdoZW4gaXMgYm9vdGVkIHZpYQ0KPiA+ID4ga2V4ZWMoKSksIHRoZSBw
ZXJpcGhlcmFsIG1pZ2h0IHRyaWdlciBhbiBJUlEgYmVmb3JlIHRoZSBkYXRhIHN0cnVjdHVyZXMN
Cj4gPiA+IGFyZSBpbml0aWFsaXNlZC4NCj4gPiA+IA0KPiA+ID4gRml4ZXM6DQo+ID4gPiANCj4g
PiA+IFsgICAgMC4yMjc3MTBdIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBk
ZXJlZmVyZW5jZSBhdA0KPiA+ID4gdmlydHVhbCANCj4gPiA+IGFkZHJlc3MgMDAwMDAwMDAwMDAw
MGYwOA0KPiA+ID4gWyAgICAwLjIyNzkxM10gQ2FsbCB0cmFjZToNCj4gPiA+IFsgICAgMC4yMjc5
MThdICBzdnNfaXNyKzB4OGMvMHg1MzgNCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUmlj
YXJkbyBSaWJhbGRhIDxyaWJhbGRhQGNocm9taXVtLm9yZz4NCj4gPiANCj4gPiBUaGFua3MgUmlj
YXJkby4gUm9nZXIgSSdsbCB3YWl0IGZvciBhIFRlc3RlZC1ieSB0YWcgZnJvbSB5b3UgdG8gbWFr
ZSBzdXJlDQo+ID4gdGhpcyANCj4gPiB0aW1lIGV2ZXJ5dGhpbmcgaXMgZmluZS4NCj4gPiANCj4g
DQo+IEdpdmVuIHRoZSBjaGluZXNlIG5ldyB5ZWFyIGhvbGlkYXlzIEkgZG9uJ3QgZXhwZWN0IGEg
VGVzdGVkLWJ5IHRhZyBmcm9tIFJvZ2VyDQo+IGluIA0KPiB0aW1lLiBTbyBJIGp1c3QgdG9vayB0
aGlzIG9uZSB3aXRob3V0IGl0Lg0KDQpUZXN0ZWQtYnk6IFJvZ2VyIEx1IDxyb2dlci5sdUBtZWRp
YXRlay5jb20+DQoNCj4gDQo+IFRoYW5rcyENCj4gTWF0dGhpYXMNCg==

