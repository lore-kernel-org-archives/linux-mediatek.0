Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E381C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 03:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hg3mVyxu17rHl5P3iW5l0wkLX2y3L3pqn1C37UuzeRI=; b=dTfEXRXu8SS/uP2xJF7jhFQ9M+
	rmbEVPk92oIqbvikoZorDSHUIcbthQQcmQm5TbHj/H9UTSRcrQdV+njay0jM+BUFQbSxAQOiUu3SB
	vk0bN4x/PCDTEhTtcYPCqZTy7qrZ8AK44AXjwL4YlbZFrXMkoNfSL7WjgByBemEfJ+bgfGgpobCb6
	/sCHqBrj2SAYw3cRTMq88BLMjuk3uShEx5yQqXCABxwkhauTGsKm9NHmpcfzeXbdUrVxs5x9v4fzM
	/J0k9ZKDKfW+ldLI/UgdBUD0ZdxJr7zWN9P12olJbhbt4+l4F0AZ9f2E9s9BMySgfotgVHI89ZePz
	bfTmKZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN2Qx-006l4f-0e;
	Tue, 09 Jan 2024 03:05:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN2Qu-006l3f-1w
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jan 2024 03:05:41 +0000
X-UUID: f601b842ae9b11ee9a662f17bb45267e-20240108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Hg3mVyxu17rHl5P3iW5l0wkLX2y3L3pqn1C37UuzeRI=;
	b=pKNbHxDNEPBtS9RNGbDcS3zuER1eNZ9iiAobPnKz6uu4wmiTIBrHUmhKSd/c8M5qhJO42zk4oV6NaWIiaDOHg+i0XsOgmbGkETn4z6ulzIobsI9r2/GWrc4mBzWJmtm08op4FM5/g9oxTvzjgY9s7IRIMEhZIHMfLS4Fr9OaxGQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:bea7ac67-984a-4bfc-a96e-73fdd80c5a5c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:37e5f32e-1ab8-4133-9780-81938111c800,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f601b842ae9b11ee9a662f17bb45267e-20240108
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1026624094; Mon, 08 Jan 2024 20:05:36 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 Jan 2024 11:04:59 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 Jan 2024 11:04:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hO+Yn8TYb8fqw+i0xYvOeQyc+U4tvSN4le11wj989LPZRGMKMQVdoISv3G4SPCqcsOvdqWaSCfI67fwZxSe0FwxwXU/VgM37CEmL98rZSXlB6JX0XG/NFvvHknfZ9wJg3zUBRvIaOB9Pkgic4TIcBadJq9fhPthiz3WIB8K21sGt5Abdr5xfweYiElhWsvGjs5+m+MvctnIkNiWc63ffWzeqTNqJRURWShsEEl75nDu/LcJc42M8/Un0o7t88ea+mQ87HEm3YUb87v7j2ybixmEu0B9e+oIpFe5w7kVYTuAcrQqZuHK/980KyDXQ+6Sfc+ThVNMTKsXGlYpsmp/ChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hg3mVyxu17rHl5P3iW5l0wkLX2y3L3pqn1C37UuzeRI=;
 b=coj830hKBbdCwI8BT7l+MEAPDJzdiVb1ah2Nmo2kA3vV8JBzvmL4KrvGjTNL1Jp9RF7V9woO6CvI1G+FNSZ1nSrRa5uZpDnNHi78JpstNwBSuG88ejXMpQRlWg2HZw2EtPezozonPG28zhQyLY5/ihNGz+u0sgtidJtpfgB3xnZPG2Oul5K+zpWTh6aSbOtph7+xtevDEZmsH9WED7gWZayYmGRk7EOzsNn7GP3sQTZAeSp1LIjHXQ8meqcTxwNpgMBeecJzgPrW2Kgl0zZVeYbii8CNmEci4i3DvU+QcMZaphH6FrPpjPq3VqD9NGFrJ5dukZZeNmir6RdE2b31Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hg3mVyxu17rHl5P3iW5l0wkLX2y3L3pqn1C37UuzeRI=;
 b=uTFZ0B08RD81kJpS7KaB6NxHywWRvY1fx1SBWmEdqjK8lk3LQTM63FSBhCUc9usYx5GV1NAwx/JYEMKZrjjWA9yeAlSVYrJzOUF9RrwlqS+zhVN/RGsHfHpdZ+KRCBoFVyF1noRiABe5wyrf0n2AG863WTzvYjwcq2DFNOIMoAM=
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com (2603:1096:820:8c::14)
 by TYZPR03MB5232.apcprd03.prod.outlook.com (2603:1096:400:32::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 03:02:56 +0000
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::92a:e9e1:cff0:d64a]) by KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::92a:e9e1:cff0:d64a%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 03:02:56 +0000
From: =?utf-8?B?U2t5TGFrZSBIdWFuZyAo6buD5ZWf5r6kKQ==?=
	<SkyLake.Huang@mediatek.com>
To: "daniel@makrotopia.org" <daniel@makrotopia.org>
CC: =?utf-8?B?U3RldmVuIExpdSAo5YqJ5Lq66LGqKQ==?= <steven.liu@mediatek.com>,
	"john@phrozen.org" <john@phrozen.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "jwboyer@kernel.org"
	<jwboyer@kernel.org>, "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: Re: [PATCH] linux-firmware: add firmware for mt7988 internal 2.5G
 ethernet phy
Thread-Topic: [PATCH] linux-firmware: add firmware for mt7988 internal 2.5G
 ethernet phy
Thread-Index: AQHaFgctDfFuP+Q2f0eBrbv3bmGhOLDQwOmAgABjsQA=
Date: Tue, 9 Jan 2024 03:02:56 +0000
Message-ID: <30e83fbc4ca647b14a9daa7f4970bbc824f39ed0.camel@mediatek.com>
References: <20231113075818.23391-1-SkyLake.Huang@mediatek.com>
	 <ZZxjuf32ks-L9DdC@makrotopia.org>
In-Reply-To: <ZZxjuf32ks-L9DdC@makrotopia.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6226:EE_|TYZPR03MB5232:EE_
x-ms-office365-filtering-correlation-id: 3c18b916-98ad-4992-4bc8-08dc10bf7a97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VJYyMhDRjSYkzrzRQggXbcfqP3xC3vwevesAPr0eyuFA85KQjlwrIWcLJYn+kOWVAreIqPBDiGYarHqV2g1QnJS6CSD6IVwk1W8AxyrBGu4lW6+TZLogGfwyB4xYQgLQsEDeEnrPbGqYJySkrgVSFIm3oPTfNMb66MwNwujls/FawKQkMZ4IOTrzOAiLJouHC/weeK6dB4eYZfqPQRHIRDw8TskMFc8hXERnTcUxOHPa+U32U5T53JIavIX5BAJcD5EHzmIPuMOKjPmPrPIchDJGQ5JDJsnonG5VctZLy7fqFonXKzr2W93CvOW6D5c8tD7ETaNNU58xinLewjiL+X62StL85pWN8BXdFa9cPW3wUHpG4UiZJ0nKwVy/5jnSCcP7zJz5cTyYGQQQr2j7up/Hj6+Hg3JMuN7mwLcQPLIqOuCpJfN4fBOWynAAYkdIFbjODt3n4YcqXaSKdBphfJRLxK0ELw8XRIkmdyKqJ1B29OJ7q0jf2exIIPjBirbBF2j5NbZmYXSm69Mh3TlAfFtt6Ha8WihPh687HQRx3JLxjRkG5U1IzluexSKc8KSa/XqZBznlIkRGXck8Pt5TRj2xKeEar8gRIcIx1oM0FQ0jmp9QwFzegj4THW4dy6+vZdbgIPt4JJGOE7ddxyAOdC7hkHKlOrVKLTvfnpumbR2Xz3wyExMpub3oZHsDPOnGo34+ltnK4nkBY4zCCSTdCg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(39860400002)(366004)(396003)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(1800799012)(451199024)(71200400001)(6512007)(6506007)(2616005)(478600001)(26005)(122000001)(38070700009)(38100700002)(36756003)(85182001)(2906002)(41300700001)(91956017)(76116006)(4744005)(83380400001)(86362001)(5660300002)(316002)(66946007)(8676002)(8936002)(4326008)(6486002)(6916009)(54906003)(66446008)(66476007)(64756008)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjllVHFGVkxvSHB4UndmcW90cWJoWEZoYk9QN1dhQVN4TFdhK3NjQm5ITWF5?=
 =?utf-8?B?SkxyZnZkVU9ndGs1NE5iSDBSME9CQWVJMXhQbmFFckZvMGpEL0FIZk1oTHE3?=
 =?utf-8?B?T3NFeWpzNGdnT1NaUVhCMjVRNlI1SXBZeVRJMzQxUUV4RHNkaHNZQ0wxMEg0?=
 =?utf-8?B?OXQ5bVVmMDNlam1ZQ3dkK2t0QnZjeGtvNW0xRXJZMStuU0RUaWZubWpPMjd4?=
 =?utf-8?B?b1hvais4S05rZm1MaTdxUnJ1TUx6TDk5WVhobnRqNWEvNHVQcTlCYmdtTk5o?=
 =?utf-8?B?dVNzODZJa1o5SW5GOHVWQVhDU1FGWlJ0REtlZ2d0ek5yV2VSWFVKY3AwWmJU?=
 =?utf-8?B?NjQzc2grNlphZ2tVQ3NTWkFCQzZWbTBMeEZQTFlHUS8vWmtkL2hrYll5c3I2?=
 =?utf-8?B?dlRnOEZIQUxHSDZKWUpMdnBpbmN6NUJRc04wT2Z2ZFloRSt3aG9VZ2poME9C?=
 =?utf-8?B?OXBVRE9PZVpxdWx5UUxvMHRqVC9rS2xCRWJxOHdickZzNjB5YzJyRGdiY01O?=
 =?utf-8?B?Zm0zQ2lMaVFQVTNHS3RIWi9PakhCeVQ0S1VFSzhYYnZHdFYwQlFLRk5CeHZE?=
 =?utf-8?B?WU1Eb2ZxY1JhZnRZUkhNYlpIL3lCT2V6SnpWaGZDclViMXhoT3lxV3VDNDNT?=
 =?utf-8?B?Tk1LdVBmektzWUg0V0g4L1E5R3NiT0VWWEpJMzJqcU95NTQxa0lIZmdyK1d4?=
 =?utf-8?B?OVdFT1dMSjltWm1KM2JyQ0dySG5LTDFsSm9VdjhZRkZNSEUxMm9oalVvMXFT?=
 =?utf-8?B?U09ZZy85bjVtWnJ4QzlLZ3psdHpFc1IxMzhka21pSDBuU3VNT09xdW1ScXJW?=
 =?utf-8?B?Q0RDdWYzKzJyWmd3dkhVeW5iVWt3YTBONktHTmNVdTVIdURzOFBKUkIxQ29v?=
 =?utf-8?B?NitYOUxvV2JjMmpSTjV6R2xlMHhndktaZlJSTjVLdGkzVHIxbkFTNDFIVUN5?=
 =?utf-8?B?MDVrVEszRlVERmVIdnRqQmduNXFIVHUwQTJ6am8vL2dVWVhqQk40bGdjMW54?=
 =?utf-8?B?bEhMZDI1Z29EQVpTMk1lTnQ3QjhaSG9HVlhqdFhxT09PbHFVY2cwdGd4aDJ6?=
 =?utf-8?B?bWRNenFEbENKMVA3WTN1azZuSHJBTWw1RDNsTzhkbGMwdGRPU0g0anNJdFpM?=
 =?utf-8?B?MzNsZ21JMS9ERWxJYVIwWHh3am9MVS9tc3hlWVBlSTBBcnlIZmdHSjZZOWZV?=
 =?utf-8?B?NlVOQXluUWJOaUkyS1lLV3B0d0JHL0xITFMzUlorSFZXYmhZT2FSbTFrQW1k?=
 =?utf-8?B?aDlJYzVPMlA1a2NqK0p4Q1A5b2h2QnNvR2tqMW8zMW8zN2NRTVF2akZXUllD?=
 =?utf-8?B?ZDZHZXltWERrOWNRRVhFcWQxM0k2OW9pa1IxZkl6WGlTaUgyS2d3Y2JqZWty?=
 =?utf-8?B?M2JMdUNKR0xNV1FUZmhGZmlSVzZEcWZQOGUrVk5JMmNOa2tDRnU3WDFaaGlo?=
 =?utf-8?B?UjVSNnhiY3d5TkgvZyt6dEhrOXpPV0ZRUjJPa0RQNUxwcVV3cmY2ZW1jNmVY?=
 =?utf-8?B?UDNLRThraUVQT2dDbmdvV3hpWjFkc3NtN1p0Z1VqNnBxTjNuQ3F1ZzQrUFhq?=
 =?utf-8?B?ZzhrdkFFTWp5VFB1NFhFMDQyNWMyajN6VnJ2WVEwaWI1VnNMaVF2L3dFRWJZ?=
 =?utf-8?B?eEtxOVJRc3RhdElDb3Q5WmtmR3RNa1R0eHZtcHpLZTJrOW5BZG41S3liOWln?=
 =?utf-8?B?ZEszQkRmMWZFMDhWbWVtY2lJZWNrS3J1Sit4a1YyMCttVmhSZFNjNU9tY1F1?=
 =?utf-8?B?b0lxMjc2L1RHc1czemNWeVVXYzNVenlTNmRlRDREUnhVNWIvclJFbTU0MWIr?=
 =?utf-8?B?Um1kaDE3MnN3bU4yeExJRE9ZVTBQSnN0QlVMOThFemhFaldQRlVjM21aaTc2?=
 =?utf-8?B?OE84a0wwSlIyRExpVytSTlhCeFJYRXJvL3g1ZEVwZFVhTFkxS2NCZnVDYkZR?=
 =?utf-8?B?NlZGVGU0QWhrYW5zTDg3WEVYQ29EYUJpYm0xVXhja3duTEJTak1LdHZWRVQz?=
 =?utf-8?B?cUpSeXVVcXRJV1FzODRmNmkrUTQwM1BiZ3JvVTVxVU81cmljVjNFb3c1eUdj?=
 =?utf-8?B?RS95aWRFTGFxRHpqWThYaUZtUU1TRDdoTnY4NFVhblRkU2FrblU1Q3lyTFBG?=
 =?utf-8?B?bFVPcGhVSGFzWEcxZk5Wcy9Ma1FSbCtaYkJHQmM5ZXFlRkV1clhjZG1wak5v?=
 =?utf-8?B?UXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3E5D825C879B040AC9C1D5E5686F8DE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c18b916-98ad-4992-4bc8-08dc10bf7a97
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2024 03:02:56.0835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nr4LwFX53Uzs0uCDtk8fKU92v2CgUbLGmhWf5I4uq+0wZY9t8Uhk27omcVnt0sBPQ9u8J95q0iGkGQXnSOb7tNpvXyQvVdC2G3CYWFjz0LI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5232
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--23.208100-8.000000
X-TMASE-MatchedRID: F7tLedRt7ifUL3YCMmnG4t7SWiiWSV/1jLOy13Cgb4/n0eNPmPPe5KWz
	WoIRiV9DM/Se/q/gEyf5MiS7M8c1eGmXMi7Ntyo2GPjYszIlSDwjRLEQhrITC5722hDqHosT6zt
	RI6LdIconvAyBxGjppwtCLAmpOEt7tYRaL8L80attzb3s8Aa1ZofGLZ++QpQzemueYw17HqEdsc
	tPcFdCIyDQCfzNn1b9lxnSJwunsOpC/bXMk2XQLIMbH85DUZXy3QfwsVk0UbuAUC1moT5enH7cG
	d19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--23.208100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B06ED887748DEA5A2398CAC7605BDCD118AE606DF79FF408B6CB6DA086DDC5BF2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_190540_667761_25563723 
X-CRM114-Status: GOOD (  17.15  )
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

T24gTW9uLCAyMDI0LTAxLTA4IGF0IDIxOjA2ICswMDAwLCBEYW5pZWwgR29sbGUgd3JvdGU6DQo+
ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiAgDQo+IEhpIFNreUxha2UsDQo+IA0KPiBPbiBNb24sIE5vdiAxMywgMjAy
MyBhdCAwMzo1ODoxOFBNICswODAwLCBTa3kgSHVhbmcgd3JvdGU6DQo+ID4gRnJvbTogIlNreUxh
a2UuSHVhbmciIDxza3lsYWtlLmh1YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiANCj4gPiBUaGlzIHBh
dGNoIGFkZHMgZmlybXdhcmUgZmlsZSBvZiB2ZXJzaW9uIDIwMjMvMDcvMjggZm9yIG10Nzk4OA0K
PiBpbnRlcm5hbCAyLjVHDQo+ID4gZXRoZXJuZXQgcGh5Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFNreUxha2UuSHVhbmcgPHNreWxha2UuaHVhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0K
PiA+ICBXSEVOQ0UgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA5ICsrKysrKysrKw0K
PiA+ICBtZWRpYXRlay9tdDc5ODgvaTJwNWdlLXBoeS1wbWIuYmluIHwgQmluIDAgLT4gMTMxMDcy
IGJ5dGVzDQo+IA0KPiBXaWxsIHlvdSBhbHNvIHN1Ym1pdCAycDVnZS1waHktZG1iLmJpbiA/DQo+
IFRoZSBoYXJkd2FyZSBzZWVtcyB0byByZXF1aXJlIGJvdGggZmlsZXMgKCpwYm0uYmluIGFuZCAq
ZG1iLmJpbikuDQo+IA0KPiBDaGVlcnMNCj4gDQo+IERhbmllbA0KSGkgRGFuaWVsLA0KICAgIFdl
IGRvbid0IG5lZWQgdG8gbG9hZCBETWIuYmluIGFueW1vcmUgaW4gbGF0ZXIgdmVyc2lvbiAycDVn
ZQ0KZHJpdmVyLiBJJ3ZlIGJlZW4gd29ya2luZyBvbiByZWZhY3RvcmluZyAycDVnZSBkcml2ZXIg
cmVjZW50bHksIHdoaWNoDQp3aWxsIGZpeCBmaXJtd2FyZSBsb2FkaW5nIGlzc3VlLiBJJ2xsIHN1
Ym1pdCBwYXRjaCBsYXRlci4NCg0KQlJzLA0KU2t5DQo=

