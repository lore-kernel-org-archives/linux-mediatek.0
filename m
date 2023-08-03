Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4907AC04A6A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 06:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NdzoQ4S0rnyG4unfohWfw2O2uTMdILAoopOfiS/iAhU=; b=1fhQtvb3Oebdm0C9JOrbNZRzZO
	2rdCklw78l79NpbhJsk3TDcB3MRGs0Q4XdnqxclXGEd6OpIFrkrMci28T59xquCJqClaSaTkv//GN
	hDcnH5XBepid2JRWjDgHxNhQlnVGxBLynrH6FsxCCG2GYkPiAebXQuhSXXzI1hfDMqv3PUppF30xG
	U9LoZWKDo+2F6+qOn+HC8K7bMJPEy62ntyt/eMWaMYAXpPudjASpyu3lKJ3K2piXbJJEh2beeykH0
	G66S48kv/n2agdYA6Rxjf00DeshH7iWU6VDBPf+Ivc9yOn1Ke2ng+K6tWFkei0P+j1dNtGcB+s5SW
	WS9vEdRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRRzX-006n0X-00;
	Thu, 03 Aug 2023 06:39:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRRzQ-006mzR-1P;
	Thu, 03 Aug 2023 06:39:21 +0000
X-UUID: 73b6429031c811ee912e1518a6540028-20230802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=NdzoQ4S0rnyG4unfohWfw2O2uTMdILAoopOfiS/iAhU=;
	b=KXL66sNuWoJonqsM3wx8JrKv6IIdwTChDJi2wv0THLyMUpliR2Kipu+cqPZu7O8Re2fR6HtNPZNkQ3fduhSHE/d/c1kNqVhrVGx89dc3/IA7/+RjFJcdL8/kv9IgDIcGx8jAlyWAH8E8Vo2wAkuSeZn7vjLOCAqmCpufZc15viU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:3531ded1-3abf-48aa-8bd1-4554d7a2c186,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:1fcc6f8,CLOUDID:ae8819b4-a467-4aa9-9e04-f584452e3794,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 73b6429031c811ee912e1518a6540028-20230802
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1676664031; Wed, 02 Aug 2023 23:39:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 3 Aug 2023 14:28:36 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 3 Aug 2023 14:28:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pl2/tFmTxSBy+oo2t6sEjqKlHvE6uRkd56t6fJAyI56xM8JFdGYb0an6jFCT2Jkyr4M1P2MmiPv69D35VpG2OL8ZDq0sqV6RMJeJBcNCxRJrcxez4j7/GVgILJz8mgBKNYFyB9OiWTjBFRKSUFHma6gIj9aX3P0j8AuJuQXzCgDe18bGHKYIiwsE7hnbYYcGvX6UVshSioVW4nHL4AwVuq+XUWBwZbc2Xc+nc0M6Qj8mVdIoS1vbq6uvS7cJYbSuw++mdmHb2gzYwx/B6QAJUPsYZx9/ceUgY3Yz0e03qP4KHLQ7Ua1u+bFdg3N6IgUgnupgWPEKn4QvMXqbwybLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdzoQ4S0rnyG4unfohWfw2O2uTMdILAoopOfiS/iAhU=;
 b=IZbwrOJ9rnNTgkt0DFnnfoKOvj1sVJbPzXIsQbf+WMCKt2Fx7P62RWSbYwVXP/5D2hiJms2jb0asVPigFa9VmPhWxyTSSkBI5csAoT6VuWdNo1HkdQHLqA5L3Hz45K4udaj+2RpMmraFvQ25r4DsyE8QyGM33VfNDUOKVuCN5Yixgy0iJ+Igpnv6SCUUTwa6DKWse443RrbBvXBD93lYh0LMNlmUc3hZclt3W1fCzZzJs6TS6/R59AirnsBFudm4r0ruRHT9RV92kPMYt8xvJVSC+cNYD68pmfL33YvzwG4F9CqdmhMBLFkF+Zahwo4cjIwiL9D7LkIiRE4du/aveA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdzoQ4S0rnyG4unfohWfw2O2uTMdILAoopOfiS/iAhU=;
 b=qDchQF9vKNyJiiu7cqrJJHflvOOCg7dGJ66Avp7QmjeCTHSix80Px/hCvUBjR9g8IW3kMrWwMMev2AX+w4WTomThFXNZ3xXKvcCa5MQU4CUm6YNs0E+XU3yWJMJN59GpKqwm0hkeZ62rVdGI17C1VtkRY283tAn86jW18iv5BWo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB6766.apcprd03.prod.outlook.com (2603:1096:400:202::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19; Thu, 3 Aug
 2023 06:28:34 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 06:28:33 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kernel@collabora.com"
	<kernel@collabora.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"wenst@chromium.org" <wenst@chromium.org>
Subject: Re: [PATCH 1/3] drm/mediatek: Dynamically allocate CMDQ and use
 helper functions
Thread-Topic: [PATCH 1/3] drm/mediatek: Dynamically allocate CMDQ and use
 helper functions
Thread-Index: AQHZpbghA43V0G2y6EGRogXrDPk526/WyH+AgABHuACAAUvMgA==
Date: Thu, 3 Aug 2023 06:28:33 +0000
Message-ID: <e8e60556e53ccf319358cbef203bc84c418a352b.camel@mediatek.com>
References: <20230623094931.117918-1-angelogioacchino.delregno@collabora.com>
	 <20230623094931.117918-2-angelogioacchino.delregno@collabora.com>
	 <bd19faf644fa80f8fa77ed0841a724aa3ca871f5.camel@mediatek.com>
	 <0acd286d-d4f4-97b2-c296-b2860a00def6@collabora.com>
In-Reply-To: <0acd286d-d4f4-97b2-c296-b2860a00def6@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB6766:EE_
x-ms-office365-filtering-correlation-id: 088f97c5-1430-4b1c-0315-08db93eadcc5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A5PWOt/oQEAusmrFrP0WB3vfek9Dt86eXU7Xqv7ZFxiwlwByJpefpFbCB3r92ecc3Kd0XXpjsq/s0nJcPP0Z8k3wYWTHVMBydsXgiFQijAYgVYPeG+KknAHFkjh4mWEfZ2UOSufD56ujhTPIW91tOqR5BtzQ2elZ8W1Tpm5PrRTnzmlRXb011L8FCpZeM1YQEYk7xpm8nheG78cO5ylTQD/I5FXJ6FtPCXz3RpILRCvn4LV1p9GLO6OUGaTPGk6CtKl2qA0NUFMl34hxwCY1yv/XEe5d2oRLrf7nqsy2pVhd/dRYAEOvGxrzizatKERbT2poWxyr0sWmFCHJqL3uZJCVKtC8dlINB8ndAstcT6c8seuHoiESf/S9n5psgt2A9x8dnA4afV9SMEt3E4ethHbjOnCCxOrM5Gkzw3tvhdJeSkYA5U8Ve7okf0DSc3bEdlh9Ez3LS19KV78vXssN4RD3+/F9tCbtC3Jg6Pe3WB6NVTiLW6FZmcwRTMgLonLy9lKigILsPXBI9fiO1MSPPLFqkIDTdG7TW2UK4W9SFh+oc5CXsskXD6y87mEYIPo/K842H4y+Lo0eQ0s3Yp2jld7YSNTj5w8ZqpAfl+tABAQm+QbfM9KuBb9IaztNMgqOyLaIf/zV6OxlhSRTpSk36LgN+mmTi87Pp+lhU+YteQA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199021)(66476007)(64756008)(66446008)(4326008)(316002)(41300700001)(66946007)(66556008)(76116006)(2906002)(86362001)(38070700005)(8676002)(8936002)(5660300002)(186003)(6506007)(26005)(122000001)(71200400001)(83380400001)(85182001)(36756003)(2616005)(54906003)(110136005)(38100700002)(478600001)(6512007)(6486002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnBpWkg4SG81VjRNUlJ0WWt1cTFWWGdUTlAvRjhVcDdMZ3VRand0TGtBRUdl?=
 =?utf-8?B?MUJUSzgwTSt1VUNWZU1TdmllOFlqWFczRG5MMndJS1h2aFFrYWtiN1pJMVVW?=
 =?utf-8?B?QVdwbDR0aDlUSDRkVmJJYXo1bE1JS051akUrU1UrOFhNM204cURCQXFKeDNu?=
 =?utf-8?B?QTZzT2dISXJKaDFKN2g0dXZLS0pjRWtlcmdmd21idzU3MXVGZjFENTJ0M0JR?=
 =?utf-8?B?ZUNlbnBEa09ESExYWUlqMXRwNXVZM2J1SjJId0NWdE92ck1aTm9qdlBJT2Rk?=
 =?utf-8?B?anhZTWlLLzU3dEtSRGxJdk5lSTJjaTJrek41dld1STlKTDZkay9tZERRQ1o4?=
 =?utf-8?B?SlFPajBvUWpKYVZIYjlIWithUFdkZXhZRk1MQ3dmRjN5U2IzV29hc0FTZ0V5?=
 =?utf-8?B?MFRKU3pOUnJyajRmY0E2bkhjUFU1MFpaYjR1RUdpc1VOeHZpa3RWZ3h0L2ZL?=
 =?utf-8?B?TGMyR3pNTWMzTzl4Y1F5SXQ0S0JHSzYyQWdxNkxZWm5ReEUvWUw2Yjhjc2xF?=
 =?utf-8?B?SHg2dHc2N3NlN3NGV0dWZGtRa3hqY3VCNEZhRVdSYjhKR2JoTjNma0lYaDMv?=
 =?utf-8?B?UXlqalNyL1oycEVXQU96Y0VFK0JoZ1NPRUgvTUQ5N2p5WDZxSUpFTEJPeTl6?=
 =?utf-8?B?dUtEeFl3N0dYL2t0Rll5WGxXcEw1ZXg4VTN3RWIxbEZqS1J3T1l3WUdPb0xs?=
 =?utf-8?B?bENSTW84bk56bGZpb245eGVuS3BNRUJFalcyZGY0WDRORWF2NUhiYS9xaU9t?=
 =?utf-8?B?b3B2ajFKV3h5NDVrb1RFQmVHcDhIK3BoRVlhU1o0bTRPSGF5UDFmcXFlV0hU?=
 =?utf-8?B?L1dqaklnY3JVNEVadmdIbDBhdmRhZWhaYUwvMTlLK0JXN0tULzFwdGNPY01V?=
 =?utf-8?B?K1Jna0JRWFdhT3ZJZ3h1SEtWOVlrL2JEK3BuU3dKZmRTU2lYWEtocTdFWG5M?=
 =?utf-8?B?ang5MkFMYkNUSksvR0I2UnJxMlZIb29tYTFzRURFQzlHa0ZGeWhVcXZMLzFP?=
 =?utf-8?B?UDRmNEUyMjVla2VEcUJHZHhpRCtwb1d2eTJnZ2lsYStsYnVHM1cyajg3cS8w?=
 =?utf-8?B?ZWhZZ0l6aDlCR3RrSlBhUVM2cGlrVEFsTkhpVHM3N01jclFMa1c1eTNzY2VS?=
 =?utf-8?B?MHErWUpObE13QlQwZCtFczhHNC9DT21jS3pCSFNGTnB2WXJidmtQOFVDMUNC?=
 =?utf-8?B?cFpQNlN2Q1I5WEwvaEtmVitXRHBvSll2UGFrMTByNzlxaDNMZmdHQjF6bmow?=
 =?utf-8?B?MDJnditCaDNIMVViclZnTkNGVkhmTmZ5MUs3RUJVS2ZEbzFrTElIL2ZnRzBh?=
 =?utf-8?B?KytXNElmMWRkbWIyTHp4VWZ5cGRUTlJXc0hkY0Q3eS9nTXdvamk2SU1MR3Nt?=
 =?utf-8?B?eWVnOExlZHdKWFJBYjZiLytEVFJTRGNpb2MwcklmRGFYUkNMQ1poWDQzQ2tK?=
 =?utf-8?B?aTF4TE5SN3JiNHQ0U0FTeERXRzdXaGJVU1dacFBxYjZXb2Q5ZmxyMTN2NGpE?=
 =?utf-8?B?N0FiVTllQ2hvdk9NdWhpK2xlWE9ST0UzZjBBc0Z5Tit4ZWw5dmtsS0hRTXVS?=
 =?utf-8?B?Z0N2UE9Vd245eUdVQVlHOTNKS0tZVnJiMno1WGZYNVgzMDRoaG9sTXU4Q0hv?=
 =?utf-8?B?ODFRS0Noa3RFRm5TSWF3Zi80bHZtVmJjam4wYWFsMlJlV0xIaVphUVB2bmFv?=
 =?utf-8?B?SjdiQllxb1UrUGdIMFlhL3h1MXE5dHl0Vm1iSTl1b0VtVWFJc1UvSXl4OE4w?=
 =?utf-8?B?eUdCL3hPN21KeXNveVFRaVdCVHZsUzN3U1F1NnlHcXJHekRpU0xkSnlwVGdE?=
 =?utf-8?B?VzUxczhLZ0duWEFSNEpTT0puWGNHNUF1NGltTmszelpzTGRobVNMZGNtLzRa?=
 =?utf-8?B?cEhLUURUV3Y4a2lxNDZkajd2Z0RjMmNuZHpZU2JBbEdjaCs1K3NNL0FPSWtj?=
 =?utf-8?B?YjBkSmxpQjh2V2MyMlNiZzNlOTZsaDFzNEpnTHhiamxxVUdWVWNwRXFLMk81?=
 =?utf-8?B?OHRDQzZsTEIxUFA3U2ptRlJiVXNraGRYa0E2YVV6VXJkZVAzbjduaDQvMTdK?=
 =?utf-8?B?Und0cVcyQUJDQ0dXTVdXaHNGcEJoSThMWUN2VndXZ0FBaXErZ1dPWk1NQ0Zz?=
 =?utf-8?Q?5dp8HtLygQo3VgLLoSy9VnxF3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <88995AE35116844DB8D145183F114FC4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 088f97c5-1430-4b1c-0315-08db93eadcc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 06:28:33.8511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FL8mtdOESEp3b+0uiQYqp7fWVFL1uIoaxukGBpJPgXMmZe2ckEuLYEYckC76ZSIhRuaNYyobeF92M28Kv9+v7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_233919_555890_978F49BB 
X-CRM114-Status: GOOD (  29.92  )
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

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDIzLTA4LTAyIGF0IDEyOjQxICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gSWwgMDIvMDgvMjMgMDg6MjQsIENLIEh1ICjo
g6Hkv4rlhYkpIGhhIHNjcml0dG86DQo+ID4gSGksIEFuZ2VsbzoNCj4gPiANCj4gPiBPbiBGcmks
IDIwMjMtMDYtMjMgYXQgMTE6NDkgKzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vDQo+
ID4gd3JvdGU6DQo+ID4gPiAgIAkNCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+ID4gPiB1bnRpbA0KPiA+ID4geW91
IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiA+ICAgSW5zdGVh
ZCBvZiBzdGFjayBhbGxvY2F0aW5nIHRoZSBjbWRxX2NsaWVudCBhbmQgY21kcV9oYW5kbGUNCj4g
PiA+IHN0cnVjdHVyZXMNCj4gPiA+IHN3aXRjaCB0aGVtIHRvIHBvaW50ZXJzLCBhbGxvd2luZyB1
cyB0byBtaWdyYXRlIHRoaXMgZHJpdmVyIHRvDQo+ID4gPiB1c2UNCj4gPiA+IHRoZQ0KPiA+ID4g
Y29tbW9uIGZ1bmN0aW9ucyBwcm92aWRlZCBieSBtdGstY21kcS1oZWxwZXIuDQo+ID4gPiBJbiBv
cmRlciB0byBkbyB0aGlzLCBpdCB3YXMgYWxzbyBuZWNlc3NhcnkgdG8gYWRkIGEgYHByaXZgDQo+
ID4gPiBwb2ludGVyIHRvDQo+ID4gPiBzdHJ1Y3QgY21kcV9jbGllbnQsIGFzIHRoYXQncyB1c2Vk
IHRvIHBhc3MgKGluIHRoaXMgY2FzZSkgYQ0KPiA+ID4gbXRrX2NydGMNCj4gPiA+IGhhbmRsZSB0
byB0aGUgZGRwX2NtZHFfY2IoKSBtYWlsYm94IFJYIGNhbGxiYWNrIGZ1bmN0aW9uLg0KPiA+ID4g
DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+ID4g
PiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+ID4gPiAtLS0NCj4g
PiA+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jIHwgMTA3ICsrKysr
KystLS0tLS0tLQ0KPiA+ID4gLS0tLS0tLQ0KPiA+ID4gLS0NCj4gPiA+ICAgaW5jbHVkZS9saW51
eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaCAgIHwgICAxICsNCj4gPiA+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAzMiBpbnNlcnRpb25zKCspLCA3NiBkZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KPiA+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCj4gPiA+IGluZGV4IDBk
ZjYyYjA3NmY0OS4uYjYzMjg5YWI2Nzg3IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCj4gPiA+IEBAIC01MCw4ICs1MCw4IEBAIHN0cnVjdCBt
dGtfZHJtX2NydGMgew0KPiA+ID4gICAJYm9vbAkJCQlwZW5kaW5nX2FzeW5jX3BsYW5lczsNCj4g
PiA+ICAgDQo+ID4gPiAgICNpZiBJU19SRUFDSEFCTEUoQ09ORklHX01US19DTURRKQ0KPiA+ID4g
LQlzdHJ1Y3QgY21kcV9jbGllbnQJCWNtZHFfY2xpZW50Ow0KPiA+ID4gLQlzdHJ1Y3QgY21kcV9w
a3QJCQljbWRxX2hhbmRsZTsNCj4gPiA+ICsJc3RydWN0IGNtZHFfY2xpZW50CQkqY21kcV9jbGll
bnQ7DQo+ID4gPiArCXN0cnVjdCBjbWRxX3BrdAkJCSpjbWRxX2hhbmRsZTsNCj4gPiA+ICAgCXUz
MgkJCQljbWRxX2V2ZW50Ow0KPiA+ID4gICAJdTMyCQkJCWNtZHFfdmJsYW5rX2NudDsNCj4gPiA+
ICAgCXdhaXRfcXVldWVfaGVhZF90CQljYl9ibG9ja2luZ19xdWV1ZTsNCj4gPiA+IEBAIC0xMDgs
NDcgKzEwOCw2IEBAIHN0YXRpYyB2b2lkIG10a19kcm1fZmluaXNoX3BhZ2VfZmxpcChzdHJ1Y3QN
Cj4gPiA+IG10a19kcm1fY3J0YyAqbXRrX2NydGMpDQo+ID4gPiAgIAl9DQo+ID4gPiAgIH0NCj4g
PiA+ICAgDQo+ID4gPiAtI2lmIElTX1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEpDQo+ID4gPiAt
c3RhdGljIGludCBtdGtfZHJtX2NtZHFfcGt0X2NyZWF0ZShzdHJ1Y3QgY21kcV9jbGllbnQgKmNs
aWVudCwNCj4gPiA+IHN0cnVjdCBjbWRxX3BrdCAqcGt0LA0KPiA+ID4gLQkJCQkgICBzaXplX3Qg
c2l6ZSkNCj4gPiA+IC17DQo+ID4gPiAtCXN0cnVjdCBkZXZpY2UgKmRldjsNCj4gPiA+IC0JZG1h
X2FkZHJfdCBkbWFfYWRkcjsNCj4gPiA+IC0NCj4gPiA+IC0JcGt0LT52YV9iYXNlID0ga3phbGxv
YyhzaXplLCBHRlBfS0VSTkVMKTsNCj4gPiA+IC0JaWYgKCFwa3QtPnZhX2Jhc2UpIHsNCj4gPiA+
IC0JCWtmcmVlKHBrdCk7DQo+ID4gPiAtCQlyZXR1cm4gLUVOT01FTTsNCj4gPiA+IC0JfQ0KPiA+
ID4gLQlwa3QtPmJ1Zl9zaXplID0gc2l6ZTsNCj4gPiA+IC0JcGt0LT5jbCA9ICh2b2lkICopY2xp
ZW50Ow0KPiA+IA0KPiA+IEkgaGF2ZSBhIHBsYW4gdG8gcmVtb3ZlIGNsIGluIHN0cnVjdCBjbWRx
X3BrdC4gQnV0IHRoaXMNCj4gPiBtb2RpZmljYXRpb24NCj4gPiB3b3VsZCBtYWtlIHRoaXMgcGxh
biBtb3JlIGRpZmZpY3VsdC4gU28gSSB3b3VsZCBwZW5kaW5nIHRoaXMgcGF0Y2gNCj4gPiB1bnRp
bCBjbCBpcyByZW1vdmVkIGZyb20gc3RydWN0IGNtZHFfcGt0Lg0KPiA+IA0KPiANCj4gSSB0aGlu
ayB0aGF0IHRoaXMgaWZkZWYgY2xlYW51cCBpcyBtb3JlIHVyZ2VudCB0aGFuIHRoZSByZW1vdmFs
IG9mDQo+IGBjbGAgZnJvbQ0KPiBzdHJ1Y3QgY21kcV9wa3QsIGFzIHRob3NlIGlmZGVmcyBzaG91
bGRuJ3QgaGF2ZSByZWFjaGVkIHVwc3RyZWFtIGluDQo+IHRoZSBmaXJzdA0KPiBwbGFjZSwgZG9u
J3QgeW91IGFncmVlPw0KDQpJIHRoaW5rIHJlbW92aW5nIGlmZGVmcyBhbmQgdXNpbmcgaGVscGVy
IGZ1bmN0aW9uIGFyZSBkaWZmZXJlbnQgdGhpbmdzLg0KWW91IGNvdWxkIHJlbW92ZSBpZmRlZnMg
YW5kIGtlZXAgbXRrX2RybV9jbWRxX3BrdF9jcmVhdGUoKS4NCg0KUmVnYXJkcywNCkNLDQoNCj4g
DQo+IFJlZ2FyZHMsDQo+IEFuZ2Vsbw0KPiANCg==

