Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2667CC47DD9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 09:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JEwsIZ4FtzO7lBJKqWPP+qtMC6OufNSx3Qb+n3cDFlw=; b=kMeFonTgzCNN14nvkSI7RO7Z8O
	Q9KOZpqqWgA2FANPuxo1A9FGRI0ryg56xHExieTx0+VTkp9lTnK3UzMnGAiLCr5uedaUASLiWCr9F
	odqiptjBvB3WNp730capE0RnfH0ZIXtxDi2XrYkYY3MMT82ncupYzrHDpnEVy8ZQ26yGbYKYAiAZn
	a3/mIsfJ/lvCI2YprXMaTOZ3AMoPAzu4C1VC7dds1VdlKjw5D5N9HrfRMRIX+BEnJYpHmCtwXZHkN
	Y9hE5MF7Bu7r8bX7/5ds6hl4lrE3vHd57iz1pmQrzYhfS4EijqHAgNQq4QIaygUukDAgWCMj41BCq
	iIWWR72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnbH5-00000006bK2-3RhO;
	Fri, 22 Mar 2024 09:33:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnbH2-00000006bJ1-2x70
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Mar 2024 09:33:18 +0000
X-UUID: 33edf2cae82f11ee9aa9374d6d45775a-20240322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:To:From; bh=JEwsIZ4FtzO7lBJKqWPP+qtMC6OufNSx3Qb+n3cDFlw=;
	b=CkYLfWE/3ko8cV4QIPlhH+fE1j3OanR8SiCO9JR1vlW35+dGebDUjWYNn5EkiCqp3N6UsBuUu1L3xC+4zGnIBQJkKuUfLyH/YinZA32Q3GfBKiNmO33vb6Cmu0/GaJ4VCWYf2x0VuySq/ov72874umwZHyDHiJWpsg7GC2E9aQQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:49713978-c2a7-465d-80c3-635f97fab242,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:2,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-3
X-CID-META: VersionHash:6f543d0,CLOUDID:eeca4f85-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 33edf2cae82f11ee9aa9374d6d45775a-20240322
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <hailong.fan@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1019369617; Fri, 22 Mar 2024 02:33:12 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 17:32:40 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 17:32:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAnNRmeRtLXOVawB9JZ+flG6UhrFa5MViDWUp/Taye/RT/tIyA03ocpc+0UtYofijjz967bAYVd3lx+ASTKjSQ96dtzhDUoNu7RuvDmod3/2KWsT6h4gj7Tgi+6ShyRyS0ZDJBHjrDz359Cv/imv7Jm/o5adRowjwiCuchSbsVJiBzqxSt7GoFTANH2fnFPK2QT3yXYPDCyDS0kkwaVFGbLJcJ7/MbF1FtuEgZRhcPX1oIuJZrFVrd7L9nhFoSffm3LvrqkOQKJUCLoBOZriC76MtWBzQg0d2Kkx4SMqbG/yOmSNx+4WXTXqUCiyPn7fbSd+aV5UtxD3lr/SvK8xyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEwsIZ4FtzO7lBJKqWPP+qtMC6OufNSx3Qb+n3cDFlw=;
 b=eEYP4gIPsKlvcPJHQlEm1EgntfSVsYmzErYBlXBhz6JX4FbpqnWX8X9zj/UPHVQfh+Qt6zR0yv48CDIZ9Znjye5SzvBltV7MdpBwXnTHMqoNmyGaOOSU4J6Jn59UZ48+bOKiMs2NsyAdVsb64L4thcAoLJSgbtqJ3mSaHG89bEE89x6sZ/zWXO2t/bdNwPux8ogME/HMorDpqylbAH0/slG8O0QBcz8b33eHCA+bC+4SLBOxoEzgOfWh09d/KPE00CALQSku9Z6vvyxXFZ7jyi2C/OpNZJ5xomYgXdBHP+NhrTRUwPp+8vIdsDj9rrhQSC+tuWdu4Lm93idcqXqvLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEwsIZ4FtzO7lBJKqWPP+qtMC6OufNSx3Qb+n3cDFlw=;
 b=U+iAC8lEUxA6oWoPqY9u2u3QOEsBZJL03huJLXphDjzkt9UpzwCLSef+Y4rYugXYyiBaUDA7BReAthR+VHwymuvY+Um8KIoorhu+qxI7gHqUNaZvrIvI3D3O2U9x4I/usME+4zOH2ZsM9ZpNmpfWuvxgmJ0RJq39rrP2q89CKvU=
Received: from KL1PR03MB6002.apcprd03.prod.outlook.com (2603:1096:820:8f::5)
 by JH0PR03MB8693.apcprd03.prod.outlook.com (2603:1096:990:9d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Fri, 22 Mar
 2024 09:32:38 +0000
Received: from KL1PR03MB6002.apcprd03.prod.outlook.com
 ([fe80::aa3e:806f:ea70:5a19]) by KL1PR03MB6002.apcprd03.prod.outlook.com
 ([fe80::aa3e:806f:ea70:5a19%3]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 09:32:38 +0000
From: =?utf-8?B?SGFpbG9uZyBGYW4gKOiMg+a1t+m+mSk=?= <Hailong.Fan@mediatek.com>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: [PULL] mediatek: Update mt8186 SOF firmware to v2.0.1
Thread-Topic: [PULL] mediatek: Update mt8186 SOF firmware to v2.0.1
Thread-Index: AQHafDvhHITeIugkOU6RWTvbA6fbvA==
Date: Fri, 22 Mar 2024 09:32:38 +0000
Message-ID: <30f41011495fb0b11a11eef9c7a536268306edb2.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6002:EE_|JH0PR03MB8693:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2u1RLf6x4jlgvq6uAGAgP5TGSopaANl/s2Bl2Kn9C4o+4G+GNg2YLn5+Jcci0cCmyUOf2jH6Gcww+GvMSKf/FxOdn0gPgKoEDjRIYi22RQAzEqN+CogMbvTctYZ+0y4bivo5MCytEWDGCB9oG1XqXk4Y9Wl6hZagczHRWv6Gt+kyuYwm3BP22I1rNJl46y5vx0Hg/nlxO9QTc3CT0IGbrhzlgChetNXgcb4QvjWhvcZ7+KQSQs1C6SsMZv4gN/ZlxYNCQKCs5s9ZMe1iINmp+S0RuAFfEYCn6wNTuDEWv8Yu2m1nvqMwTgSVrFwoP1SkghEwjhkDEcmVAs/yG2pNpgmXUSQUE2ZXP9WgbifavXS8jr73gE8GzkQFMTk287JHAq5XRHoQqwMbtGMir3zt5QglBJAVwjy+DrS67c1zNHHDNnsJo/y7nXXwurAPUgUWaVSxD9DpaO1bxG9j3d+XII1uP5x3Y6uilXeSNdWcKnIiSoQnj0cbMx7Imx5kpvnNAHBOJELGB/PX7PKXoMzY85wSNgJjPOVIRGX91FJ//ZcgpDVJhtNwEVnKzlBiYX6lC+PWzyjHAmObxY86D1wisPQbOcqsq87fpd4uhT24DxY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6002.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXhuWVg5eW1NSURkRXdYRlFkek9jb21iNWMrL3lySm5lTUxzSGZud1FSclZy?=
 =?utf-8?B?SlQ3MzBRN0lDZjJodlc2L3lZNTF4TThnZUdpT3BsRWlVU0s4d0JQME5iVVAx?=
 =?utf-8?B?cEttalpFcnpoencybE9XK0V4M0krUktHWUZkWG5JckF4UTMzcjhiVEM4TTZY?=
 =?utf-8?B?WVNXYnFmc0srU2NaWWx2aUtveElLemFjUlVrYmdEMjdRVjZUVEp1RW9iMHVY?=
 =?utf-8?B?OEZHWmxsWS90K2VqOTdTSEo1Y3M3SisrN0ZJM2FRK3NpZngwbGY3Z0ZqWCtt?=
 =?utf-8?B?ZEdoNmNJZjI0eUt3SmYwaW1sQzZBdlJoUnB1Y0JkekJtZkl6L25lSTduQ2dD?=
 =?utf-8?B?Z1BCcmpZUUcvOHFRRXNZQ2VFY0U0bGRycmtGRlhCY3g0Ukc1OHE3WjFpNEdT?=
 =?utf-8?B?eGREMjN4Q3NhUnNHeFRSR1JaNyt4Q1Y0bFVPRkwwdEpUaDdPK0NoOWFXY0oz?=
 =?utf-8?B?OFkwN2wxTUJVV0JzZ3NGYW5YUzhodHhreU9HZ3l3TW5jd3R4OEV0OVhGSDFj?=
 =?utf-8?B?SCtVMDVYdU1sZGk0L3JTRkx6SW9nMTNDZDFEWExDTFNvak40eGkwUDRWeDY4?=
 =?utf-8?B?NExrdnNHM3JNVDFYOTZxREhCS3ZubG9ITlFMSEhUQTYxbzlhOXZjdnFvWTRB?=
 =?utf-8?B?NTBKOVVmem5vZGY1cXhtMGhFZDg5TFpIbGY4OEJvWTVyRWkwcjRCMm9zekhi?=
 =?utf-8?B?ZEJ1OUJ0NStiN3g4b2Q1TVVpUUpIVEdud1JXazdRMGJ5VjdEYWhkdDRiTEF3?=
 =?utf-8?B?ZWlBM08rNG5VS3dEbDc0YUtOTlIzbXhGalpvTVMzUzU2MzZvem5xMlZZc0V2?=
 =?utf-8?B?VXJpVHlBeUxwZ05pdDV4SE8zcXkwcVNSRVRhb2U2bWZSRHJpS0pHYjlXMFMx?=
 =?utf-8?B?czV2K0UydDl2VXFGR1M1THBhcWZvMmRoMnFONVpzUUJYMDZVc0h4Wkd2RFEz?=
 =?utf-8?B?WFlYRFBPM2s2VG5OMnM3aGg5MzBDdDUwOUVPWlVFenJ6SkRZbFdPK1dwUDJB?=
 =?utf-8?B?MmxkSmRMT3ZTVk9PQlJNeDhGYmRkU1RLL1NaMTcwS1liWFVDbmVLV3U0VmdN?=
 =?utf-8?B?UVI5d0dFdHU1b1ZPeFR4Z2VwZlhYT1VqRS9kQnZLQ2lOTjl6RnM2M2hsVHFh?=
 =?utf-8?B?VlMyLzBQOEVua0Y2M0MxSjlvOHFMVGdpZlBhNTdyNmFGUUtCUFNhSzJobXJp?=
 =?utf-8?B?ZnNIeXo0WE9rK2FsUng5U2xFYTlPd3cyUFF3L2ppYWkvYWkyeWpqYlFyWTlr?=
 =?utf-8?B?Y3ZQL1R6blVlYzVCWExXNElQRlZWbytYQWZERUxVQ1dnRkxPNXhVdmtudWg2?=
 =?utf-8?B?YnJpQnFKc3hlNEthZkVqZGdyVXppa0puZC9EUG9NVHF1WjVXUU1YMzZGeTcr?=
 =?utf-8?B?S0huWU9Rdm4yaENOSC93cFpWa2lQZGFBaTJZQUFLUzNIa3NSMEk4Vy8raXNP?=
 =?utf-8?B?bE91SWRoWFR5MWtqUzBwYVBwekUrRWRaMWlZd3pIY3M3dFV4QmlBVnhyZSs1?=
 =?utf-8?B?MnFNUlpsYkNWSmM1VUtETlorQVFLbTIyVjZhT1lNcmVnejBvdHpWZUlQa2p6?=
 =?utf-8?B?TUROdk1hdndQdlVyS2hOS1ZTcDFkd0o2U1lNWWtuUTM0Rk5jOWMwa0REeEI4?=
 =?utf-8?B?U0hJQWFaNUk5Y01GenlpWktHR2hyL0FUd1J2aTB1MUVzYkFPbit2T01BZmN0?=
 =?utf-8?B?S1M5bVV6MXlTRGdmeXlabmZnRnAyQkVRRlpxdjZHc1ljdmc2cEtmYzFGaTk1?=
 =?utf-8?B?MHdjY2NYbmFSU21LdXN4NmZ3QmxWdTY3WUpnckxIa0JSVnJQTVUyRnRxOTZw?=
 =?utf-8?B?a1Q3Y2tMMURwbmFPSlB5WkpsLy9WK1V5bGhKdHRUaGhjNDNITzE3clEzdkp5?=
 =?utf-8?B?eWwxN2U3Z2UwRkNoNkEzbU92VUFENEZZQ1dEejVNS1NWdzVPdDRSa3BiL2d6?=
 =?utf-8?B?ZzdsanVybTI0VVJuN2ZNOVFxZktKUzBTTDU3TUJBNWRSM253Yk9LUVpnY3FL?=
 =?utf-8?B?V3pOcVFSaTAycjNLc0hjNVFtTDZkZTcxclVkSjlITlVvRlRuVThJZytSMHhp?=
 =?utf-8?B?VXBSaFdzekdwUG81ZFdrQkQxRFlvZGlvaW9wcVVDNTcwZVpmbFRRZjJ6N0ZS?=
 =?utf-8?B?WjV6NUxhdlRyczhaMG1JTmdYN0x3RzcvdnBVclZUSTdtVXVtc1JPZm04MDVM?=
 =?utf-8?B?YXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <081B23388EE58448B55306AFB249A837@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6002.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6082015-b12b-44b1-1ac7-08dc4a5303db
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 09:32:38.6897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9A+y7AYPe1NrQqaWcQxinBvmDrjXD6mUJ1c0VCCWC0tyeLKuAbKFP3Qm0I3NbfLLP3pj7YBCOXs5W3dmyNFkCrI+UKRUck+vd1E4cSem5ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8693
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_023316_904087_F02F785A 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

SGkgbWFpbnRhaW5lcnMsDQoNClRoaXMgcHVsbCByZXF1ZXN0IHVwZGF0ZXMgTVQ4MTg2IFNPRiBm
aXJtd2FyZS4NCg0KSWYgdGhlcmUgaXMgYW55IHByb2JsZW0sIHBsZWFzZSBsZXQgbWUga25vdy4N
ClRoYW5rIHlvdS4NCg0KQmVzdCByZWdhcmRzLA0KSGFpbG9uZw0KDQotLQ0KDQpUaGUgZm9sbG93
aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQoyMmVlMWQ4Y2E2NjYzY2E3YzI4NDc3NTgxOTkzZDZl
ZDVjYzU0MzIzOg0KDQogIE1lcmdlIGJyYW5jaCAncm9ib3QvcHItMC0xNzEwODYxMTY0JyBpbnRv
ICdtYWluJyAoMjAyNC0wMy0xOSAxOTowNzoxNA0KKzAwMDApDQoNCmFyZSBhdmFpbGFibGUgaW4g
dGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS9oYWlsb25nZmFu
LW10ay9saW51eF9md19zb2YgdjIuMC4xDQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
bw0KOWE2YTBjYzE5NWMxMDhjNjc3MTY1MDc1YzU1Y2JjMGU0MTdhMWU2NDoNCg0KICBtZWtkaWF0
ZWs6IFVwZGF0ZSBtdDgxODYgU09GIGZpcm13YXJlIHRvIHYyLjAuMSAoMjAyNC0wMy0yMiAxNzow
NDoyNw0KKzA4MDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkhhaWxvbmcgRmFuICgxKToNCiAgICAgIG1la2RpYXRl
azogVXBkYXRlIG10ODE4NiBTT0YgZmlybXdhcmUgdG8gdjIuMC4xDQoNCiBtZWRpYXRlay9zb2Yt
dHBsZy9zb2YtbXQ4MTg2LnRwbGcgfCBCaW4gMTYxOTEgLT4gMTYxOTEgYnl0ZXMNCiBtZWRpYXRl
ay9zb2Yvc29mLW10ODE4Ni5sZGMgICAgICAgfCBCaW4gNDg0MzYgLT4gNDg1NjQgYnl0ZXMNCiBt
ZWRpYXRlay9zb2Yvc29mLW10ODE4Ni5yaSAgICAgICAgfCBCaW4gMTI4NzEyIC0+IDEyOTMwNCBi
eXRlcw0KIDMgZmlsZXMgY2hhbmdlZCwgMCBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQ0K

