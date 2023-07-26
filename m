Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3ABC0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 05:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhmNFHqKITvxLqbPzdZ+t3LGV4zfwGsd57n+2L3rMps=; b=SE4j/zMKjBxdFy60GmRkBsoYKP
	MS5bMlgCs1KRzB2vFHYkqs6N3xpOjFl2LoZxj9VA5ny4P7h5LojG3xoBIeg9U6AMUhCmk8/qbDZUQ
	C/CVCTDsWJKodv2d89IPSxez+9T/369r0laKKR/zoT6wdLrHoaFn3R17+YLxKqGJUr+cDWazB8hoq
	A1Phb87iw1HRWP957DN5L05rWfEiR1DLxWACtP/YxgV44TJupse1mrNwoxMmMHk+T5icubY/0G9ld
	J9fAtglo0ssW0lMbts5X483IpQme6X+AEtWOrJxWJLabD55F/VMZ2T+ySd+q6TElpz0ftqQW0rhIH
	l0iVCj/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOX3Y-009CX3-1N;
	Wed, 26 Jul 2023 05:27:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOX3U-009CWP-21;
	Wed, 26 Jul 2023 05:27:26 +0000
X-UUID: 173096aa2b7511ee912e1518a6540028-20230725
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=LhmNFHqKITvxLqbPzdZ+t3LGV4zfwGsd57n+2L3rMps=;
	b=i/KC1GE5FKZYOVkBpKNVjlVYb/HjSTiV34E0dX5GiJ9dqyG3qSsqY/bAPgrVvBAms6H8f07NYFCTBvQ1RzKxewWY63LPmJzHncA/eCw0vVib+wcqDDE/XTOGrYc3pGaInITx9c9xP/c0vKYC7wxcmEbQWdJb6rA/FrN9IQlhas4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29,REQID:fab72090-e80a-4c7f-8ebc-b79efd3684dc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.29,REQID:fab72090-e80a-4c7f-8ebc-b79efd3684dc,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:e7562a7,CLOUDID:db48ccb3-a467-4aa9-9e04-f584452e3794,B
	ulkID:230726132646JAK5REKZ,BulkQuantity:3,Recheck:0,SF:38|29|28|17|19|48|1
	02,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SDM,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_ULN,
	TF_CID_SPAM_SNR
X-UUID: 173096aa2b7511ee912e1518a6540028-20230725
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1689873832; Tue, 25 Jul 2023 22:27:19 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Jul 2023 13:26:44 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 26 Jul 2023 13:26:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2TbFH3bo8wkHGjI1VlEmeG3qa5NjDbhzYQsO+5Jzv/k2Pk11Smdu0AfjhrrOdDqDFB5Oad+IATwpguXPQJkE1j1yB5UM3ErpiacW5KF285escPrIpnKCRO/VZdxzjmHDAa2S9rQ3Rki41eXQ+mV6dwaL3fEtIgbRmnDtpiYFAG9jzwe7SO+i4cQVl1FnUdyMgklomMEPDhPaWVD+kzixAncONoToXLDD9S7xWkG2mjwdXSa8zcsZjv4R+b9t+2Oa2rcuM3nzdbxtoV4ugp4iUQciPzKy4ezsQhwdahA7tWKKwQCHbsoT+49pG4sVnttOR4QsXlHGjMGCgcdyvZP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhmNFHqKITvxLqbPzdZ+t3LGV4zfwGsd57n+2L3rMps=;
 b=f9wacemF4xewp/uLMzNxSwDwQWq4vJHKPLCpyyWZYbmNfc6gYD6gA37g0J+zkoQHe34BO+J+2wKPfOms342SH3fH7wtj4PJhbJLAAtaFUQ7zut5X7ExBOVoOm4wdgPohdAGq/N7LhMabY8WzGcKSDC5iMrDlL34rRJ3A/F3K1F2Vc9XsI6JJAxY0H1lpL6zN8ZTlSp5nJCawurBg6VbCdX/gg9l6E1oEEDs4y4ZcLR7xRGRoUMaO+ou4E/I4SkRoNex3dSsCQxfwPurka1CVgQUT0UBddLDUtCC4RaYYWyQzX4iEK/6imfA+RIhey5hGl0xg45b91AVqyURHnSYqOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhmNFHqKITvxLqbPzdZ+t3LGV4zfwGsd57n+2L3rMps=;
 b=AcXZyG3MHhjLhIzOLMqc6mQkyMVOnIGJxr6DPvXQGFAvs286J9/cTe/RogNeJ3hBMiv/Va2cueBZrkbQoCjC4bGMbtWXMlOvDoar9ndNY/gqunJ8uO2eQesunDPaqyEx6eka8a8AzNybI+dPoN3CWaQMle9WCmVLoaVPOS9Mz7M=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7933.apcprd03.prod.outlook.com (2603:1096:990:32::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 05:26:41 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6609.026; Wed, 26 Jul 2023
 05:26:40 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 2/6] drm/mediatek: mtk_dpi: Simplify with
 dev_err_probe()
Thread-Topic: [PATCH v2 2/6] drm/mediatek: mtk_dpi: Simplify with
 dev_err_probe()
Thread-Index: AQHZuhYLkCeM7L6Zz0arVZQxVj+UZq/Lj1YA
Date: Wed, 26 Jul 2023 05:26:40 +0000
Message-ID: <5c9207a73bcca44457ae0ef30192c7ca2525da91.camel@mediatek.com>
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
	 <20230719075056.72178-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230719075056.72178-3-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7933:EE_
x-ms-office365-filtering-correlation-id: 19c5c98c-db99-47f7-8d36-08db8d98e44b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DQBmGYP0lpMFMRW7kcKpB22AQ1CGtsrc6qqBlLnutXctiUA+0jsGrWZcH7DjDlcx8ByLKK95HW0JKISe3pykJ5M/RCW0ux3w4TD4PM60T0ZGkbEnwyHih+0CWb33oF00fek2fAlxozAEQFsXEWEgLXewGtNuqIJg8sTHzpJ3HaeW+yjuUD6kAMDHzdlZQ1LaGRRu3cSQfQT8t1B8sbtDIDVKC1w/Tsu8MayfhBAHjaXblb74xZsmDRxTHHqJl05fE+TE1yLatBvg7DzuHm3NEmiGeA8W/+MqHQnCmGIqfXHahhEJppm9Xh35ELs823ITHZkjOa14A9KqQmU4e6aw55ybssttR3ItpEwCBpQoxXf6z4v5ZSWH+KSEvhnnQsoTCbuipY/6RGaBIpvTOi5D07T/bTGqLLIdgVugY2rZCbrKmgV/XYWM3qSbKScS+894kLEEMWX+SYFJkaZIM7sYv0Qddk2Iguoz2X+6Vz65gxYbNMhCukilmCGmRlJ4lIIhIbV1eI6NpW9F3ta/jl0mfYgHqt65iqxc0bNFxIqK8xhUCs9iGXXGh6HSzXm2EBUxo5UQh7R6+ioAFPGHsoyW2cxNDIP4UoO6mAY6l8tI0S9EZ+oULZH+lVfQ8Uz6LYeDBNxqdxRL94f/k1ghGqlHOWdf1VI2kFhFdVdw/VoOUxY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199021)(71200400001)(6486002)(83380400001)(478600001)(26005)(6512007)(6506007)(4326008)(110136005)(66556008)(66476007)(76116006)(64756008)(66946007)(66446008)(122000001)(186003)(38100700002)(54906003)(2616005)(38070700005)(5660300002)(8936002)(8676002)(2906002)(316002)(41300700001)(86362001)(85182001)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzJBWXlJRlNTRWhwUHdnbHFpUytOK1k5YWtKYW8xbEtWaWNRbWsyU0J6S2E0?=
 =?utf-8?B?cDdYYlUxN3FHL2FEU2ZyeHBhWFhJRUkrNG1YbFAwN2xHR0ZubEwweXB1KzM1?=
 =?utf-8?B?cGE3a1hZRytYL3RLMUFpUUV3RHZ4WDErL1V1SjBxSDFOTGN3aUZRR2pjNVAy?=
 =?utf-8?B?UVA3bW1BWno0N2lLVVRLWlpWNGlFeWdqMmFSNnp2UnAwNmhRc09lbTkvN3Ny?=
 =?utf-8?B?Q25Pekc4aE9zSGJxbHpmYkU4VE1wYUJlc0hWMkdmbC9jQmlrZ1BTS1lPeVgx?=
 =?utf-8?B?cEdwbFdxOVJHdTVLdHN1WTBIZnptY1Y2NDdlRGs5SkMxV0FVNnk5cGFRc2dl?=
 =?utf-8?B?YVY2Ryt5Y2FTeVo1SXA0N3FzeTVzYU5kb3VFUzAyNFp3TGtJMFNNdjQwYnp2?=
 =?utf-8?B?VFZsUHUrUVBsOFppTmhNVEJjeTlzd1hzQkZ3SUlPNUNwellwRUlJaHNkSTFJ?=
 =?utf-8?B?THBqcUhnNGpEUkVLUHprcTNiK3VhcjFmcjc0cjQ3SElLdWRKQUQ5eFEwRVdZ?=
 =?utf-8?B?QTJiS0JtaEwvM05FYnVNWitkOExLSkYwSVVqSEZVU2xxYTgyRlFJZkdxcVJ3?=
 =?utf-8?B?ZkpDdS9LMWk2c3F6bTVHZFdPcENWTEMwUVNrSkN1REwwWXZPMDJ1SHRzdFFG?=
 =?utf-8?B?WWZGSFl1MnlOM3pXdThaWjQwK2R2VWFXQlhhWmROdU84NGNrd1M4bmx0R2Jz?=
 =?utf-8?B?NEh5Zy8rOS9ydkdNbzUxVU1Sc2FSdEpycFYxZmVWRm9Pamd1RDBnSnUxRmdz?=
 =?utf-8?B?S2sreGxITGFtaDZPbGV2K1lma1JPOEYzdVBYKzBHMVZzUG5JRXNvQ1NTandI?=
 =?utf-8?B?bjZ0MGN4UENNcUM0VXpZbk16YytzUTRnOVVDVzd4WUwwQVgrOFZyaE1ST09S?=
 =?utf-8?B?SFkvQWpXRFFDeXRVVFBpd0NxTnFpRmt4MWxFa0FtdE1EUmJOUnI3cGIyL3Z3?=
 =?utf-8?B?RXdaY0xNVXhXTWdBeThtd2sxYlpUM253by9kQjYxMmhRSjZCbHJHbmdsQzdh?=
 =?utf-8?B?RVg2ZTJlV3FFKzZESUt2MUYvaGlCRWVtdkNZK3hrc3hQUlorbWtSOHFreUV4?=
 =?utf-8?B?Y2trNWxUelZwZm9IZWdsTWFOR2kvUjBLUFdPbWN6RVR1VFdLUUxtMGpDWWNa?=
 =?utf-8?B?VkhRS1c3NGxUbEJXTzRPU3YxOTl2akR1ejJhMnVrUDhXbHNOQnJNQ1lMSVhE?=
 =?utf-8?B?aU5yZXFtaWlGNFZxY2Q5OUFUUUFOK3dEU3N1SEZsaitTTE91WHQ1TkZMSmdL?=
 =?utf-8?B?Ym9RS3BIV2pWN01TUWlaOXBCaW9XTThwdzdmTWVUM3pnUGJzMU5aTnJ0UmN1?=
 =?utf-8?B?TUJpMzhlRkpsZ3o1U0FBUERRRlBjUmNjbmtlVSt6ZzZzcDl6V1liRXd3REha?=
 =?utf-8?B?MXJGQjNpbDZGblJWaUJIenpJRDUvbnpENVYzSnlJcEdmaWlmSllsSWZYZEd5?=
 =?utf-8?B?eHhpcWJkUDB5WkpSYUdGcGFBOWN4YnlPMCtVN1Vsa0dVbDZSdzR6UnZMSzhR?=
 =?utf-8?B?UjVZZER0bzR5Vko1QVFLTnE0c202QXlIbWZMN2h0Z0pqVzZGbnZjc1JrYTdR?=
 =?utf-8?B?VVpKTlRSeEJCMjlLeGNFSi9CUXc1KzN1L1ZyWkM1S0lhY3hFVENVbGNTcjN2?=
 =?utf-8?B?TVVDK3p5RjlOQW56bEw0YkRyK3FzUktwYllOQ0FueXpCdEJkbGVhTnhtMHZI?=
 =?utf-8?B?ZmlRQjRaV2J4OEtaRzhKRCswZkR4V2ZUWjJjZ0N4YzEvWTVrU0RvKzc5L1VO?=
 =?utf-8?B?UUcyYjViLzYrN0pzUFlwTVZvTXJUY2dFTUEwaUI4KzVKNkFsenZCNENLenZV?=
 =?utf-8?B?WEI2WlpxMDl4TDR6a3lLTXoydHZnZVBRbC94cTdmaFVnd1VHKzZuZ0QycFYv?=
 =?utf-8?B?c29FQ2xaMFR1b2VrM1lSaXBhTmpaMHhhdkFmNFp1dGh5dks5c0ZlUGZKUWtC?=
 =?utf-8?B?N1Z2eURabVZ4c05yd0tad2k3NGNjd3VOMngvZkVLQXNVeStXN2xVMWVMdGpY?=
 =?utf-8?B?Yy9VNDE5aVJHTktETmZ5RUp1MkJZekQvTDVENERMSG84OFZtQWJwVFkyUitO?=
 =?utf-8?B?NnoxZVhDYmJTUVd5WXRzbzdOdWEzd3pXaTFpaFdKd1JyMms1SVFZbVZhVGdY?=
 =?utf-8?Q?J3vvNGlcMz6MK/RFfGJGT75cf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8C5EAA4859A2740BC96608BDAE6A8BD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c5c98c-db99-47f7-8d36-08db8d98e44b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 05:26:40.7438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 77yevQFS8Tr7k2Bmet0wK49TmkC7J0zinorJVKle4u672wWNrZdH0jjD+XBoFwhgoOjPlH8jFAAwk9WLpRYRtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7933
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_222724_692393_6742E46C 
X-CRM114-Status: GOOD (  16.94  )
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "kernel@collabora.com" <kernel@collabora.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDIzLTA3LTE5IGF0IDA5OjUwICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gVXNlIGRldl9lcnJfcHJvYmUoKSBhY3Jvc3Mg
dGhlIGVudGlyZSBwcm9iZSBmdW5jdGlvbiBvZiB0aGlzIGRyaXZlcg0KPiB0byBzaHJpbmsgdGhl
IHNpemUuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dp
b2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEZlaSBTaGFv
IDxmc2hhb0BjaHJvbWl1bS5vcmc+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcGkuYyB8IDQ0ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tDQo+IC0tLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KPiBpbmRleCA3NDA2OGFhNzBlMGMuLjAzYTJi
OTAwYmI1MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGku
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+IEBAIC0xMDQw
LDM4ICsxMDQwLDI0IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9wcm9iZShzdHJ1Y3QNCj4gcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KPiAgCX0NCj4gIAltZW0gPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2Uo
cGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOw0KPiAgCWRwaS0+cmVncyA9IGRldm1faW9yZW1hcF9y
ZXNvdXJjZShkZXYsIG1lbSk7DQo+IC0JaWYgKElTX0VSUihkcGktPnJlZ3MpKSB7DQo+IC0JCXJl
dCA9IFBUUl9FUlIoZHBpLT5yZWdzKTsNCj4gLQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gaW9y
ZW1hcCBtZW0gcmVzb3VyY2U6ICVkXG4iLA0KPiByZXQpOw0KPiAtCQlyZXR1cm4gcmV0Ow0KPiAt
CX0NCj4gKwlpZiAoSVNfRVJSKGRwaS0+cmVncykpDQo+ICsJCXJldHVybiBkZXZfZXJyX3Byb2Jl
KGRldiwgUFRSX0VSUihkcGktPnJlZ3MpLA0KPiArCQkJCSAgICAgIkZhaWxlZCB0byBpb3JlbWFw
IG1lbQ0KPiByZXNvdXJjZVxuIik7DQo+ICANCj4gIAlkcGktPmVuZ2luZV9jbGsgPSBkZXZtX2Ns
a19nZXQoZGV2LCAiZW5naW5lIik7DQo+IC0JaWYgKElTX0VSUihkcGktPmVuZ2luZV9jbGspKSB7
DQo+IC0JCXJldCA9IFBUUl9FUlIoZHBpLT5lbmdpbmVfY2xrKTsNCj4gLQkJaWYgKHJldCAhPSAt
RVBST0JFX0RFRkVSKQ0KPiAtCQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IGVuZ2luZSBj
bG9jazoNCj4gJWRcbiIsIHJldCk7DQo+IC0NCj4gLQkJcmV0dXJuIHJldDsNCj4gLQl9DQo+ICsJ
aWYgKElTX0VSUihkcGktPmVuZ2luZV9jbGspKQ0KPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShk
ZXYsIFBUUl9FUlIoZHBpLT5lbmdpbmVfY2xrKSwNCj4gKwkJCQkgICAgICJGYWlsZWQgdG8gZ2V0
IGVuZ2luZSBjbG9ja1xuIik7DQo+ICANCj4gIAlkcGktPnBpeGVsX2NsayA9IGRldm1fY2xrX2dl
dChkZXYsICJwaXhlbCIpOw0KPiAtCWlmIChJU19FUlIoZHBpLT5waXhlbF9jbGspKSB7DQo+IC0J
CXJldCA9IFBUUl9FUlIoZHBpLT5waXhlbF9jbGspOw0KPiAtCQlpZiAocmV0ICE9IC1FUFJPQkVf
REVGRVIpDQo+IC0JCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgcGl4ZWwgY2xvY2s6ICVk
XG4iLA0KPiByZXQpOw0KPiAtDQo+IC0JCXJldHVybiByZXQ7DQo+IC0JfQ0KPiArCWlmIChJU19F
UlIoZHBpLT5waXhlbF9jbGspKQ0KPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9F
UlIoZHBpLT5waXhlbF9jbGspLA0KPiArCQkJCSAgICAgIkZhaWxlZCB0byBnZXQgcGl4ZWwgY2xv
Y2tcbiIpOw0KPiAgDQo+ICAJZHBpLT50dmRfY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgInBsbCIp
Ow0KPiAtCWlmIChJU19FUlIoZHBpLT50dmRfY2xrKSkgew0KPiAtCQlyZXQgPSBQVFJfRVJSKGRw
aS0+dHZkX2Nsayk7DQo+IC0JCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikNCj4gLQkJCWRldl9l
cnIoZGV2LCAiRmFpbGVkIHRvIGdldCB0dmRwbGwgY2xvY2s6DQo+ICVkXG4iLCByZXQpOw0KPiAt
DQo+IC0JCXJldHVybiByZXQ7DQo+IC0JfQ0KPiArCWlmIChJU19FUlIoZHBpLT50dmRfY2xrKSkN
Cj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGRwaS0+dHZkX2NsayksDQo+
ICsJCQkJICAgICAiRmFpbGVkIHRvIGdldCB0dmRwbGwgY2xvY2tcbiIpOw0KPiAgDQo+ICAJZHBp
LT5pcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOw0KPiAgCWlmIChkcGktPmlycSA8PSAw
KQ0KPiBAQCAtMTA5NSwxMCArMTA4MSw4IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9wcm9iZShzdHJ1
Y3QNCj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCQlyZXR1cm4gcmV0Ow0KPiAgDQo+ICAJ
cmV0ID0gY29tcG9uZW50X2FkZChkZXYsICZtdGtfZHBpX2NvbXBvbmVudF9vcHMpOw0KPiAtCWlm
IChyZXQpIHsNCj4gLQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gYWRkIGNvbXBvbmVudDogJWRc
biIsIHJldCk7DQo+IC0JCXJldHVybiByZXQ7DQo+IC0JfQ0KPiArCWlmIChyZXQpDQo+ICsJCXJl
dHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiRmFpbGVkIHRvIGFkZA0KPiBjb21wb25lbnQu
XG4iKTsNCj4gIA0KPiAgCXJldHVybiAwOw0KPiAgfQ0K

