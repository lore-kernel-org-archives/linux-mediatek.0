Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF1FC54EBD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 12:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIPRNC1rMY9OF+TrM6cl30UAaphUwUe+a6lEu/t+/60=; b=Biq5fS4WmbKgZfJLn5jenTgeks
	skCWg+CPXxFlN67d+b6iQAhmT+5x278OMA18BmSXVOnbOk69C+/yQwJUmFQ7gy44oVvLruAL8C++1
	rSVU5AjlzQNH4qOBPdneSajyRFFocXAVIVCNqNIbcLBqbAGJsKXgI/2FyrZAJrg5zWWLhuR/OtiQc
	NpSmBkwV3HN5wXmXdyQ3loGQ5oug+aSCmMaxPO2TiTLSEAywKmQc4n1sFTEA8NY2d1muKsYmdWFYP
	XY16FZyFLnYeQ6AQPNg1RPEttaeFOYlNJzS6CyL5bMXbg1zKZ1g0qPTzImD5qgL7GR055E2Uf0GI/
	vXO8k1+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEr3f-001AtL-FQ; Mon, 09 Jan 2023 12:15:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEr3Q-001Aqc-Ky; Mon, 09 Jan 2023 12:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=NIPRNC1rMY9OF+TrM6cl30UAaphUwUe+a6lEu/t+/60=; b=Gygj0Tt+a3DWGVLJoQBrAq9X4x
	+gkqeprpbdQAE0g4vN+RhoC0o9qYgvjDBWUsAocVl9nHYwpQj3rzrGmqPp/KVokKtI6phP9uTP96Y
	VF5I+phzLU34kejGDWZrY4SQULQoKStEmNhhNgvVHm6mzXTXE2Mskz0RKwaprGiUWY7UVtZdXqRnc
	F50s8B0UDv98yQbf8zJIi4+2o6/cY/Ije4Gu0tzrhBwCcaRBNSA/K2h4wJevkwlBxLIrKhvE339yM
	//JaIhlk4zJAzEnwa25tVkF4WoiCYTuGbyu5EaVbWYDrsEJOVL3mrQIGGfmlgejwQ0Zex+mKXHs+x
	VXzVHEqg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pEr3D-002iMc-2t;
	Mon, 09 Jan 2023 12:14:55 +0000
X-UUID: 4668696b7a21431cb4977fff98d72423-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=NIPRNC1rMY9OF+TrM6cl30UAaphUwUe+a6lEu/t+/60=;
	b=cBXnQFTE4bcTWDAEQe0ob6SGgVmIEs7QhrQmZXnIiUZrtB6WA2TNGOXocxfKs5O+1r//OZS2M09cVHYlqvy9mI0aFEvir6BmfDFQMdvCYafdsAHxC+8kQgEn96WAMAOpblrK8+4drDR3AzPR/x6KJxc86ZrRp5myDayoACz4btw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:275c3b25-d960-45b9-9178-86f5b030ab77,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:bbb746f5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 4668696b7a21431cb4977fff98d72423-20230109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 92536880; Mon, 09 Jan 2023 05:14:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 9 Jan 2023 19:54:28 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 9 Jan 2023 19:54:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7Zn9825AYKilRlKEdm5lEX+InNVqfqYhtQSjjjUAwyEmIqQ5LNhsfLMhwo2qJFRlvr4kanrvlGuD5K73hRdU5ND3U1JXePDAn3S63D2WAzk8Bd4liu29cXCiNTi1CAsb9EVO2rbP4yQfYzOcZib6EtH9CiiJ1YSwe0X6PJuV02XzumHRvfxMKGGc6ktjI2CkhwxWjaDXv8K80jhdZmhpZkJl7zpfwR3ATJLxV58N35S6jVIeuO+FNfE0KqpYdsdOcWsZw/rJl3g8kqbuCjgJJZyz/88hPr4O+3q8GBeZ0jpeutQyODB6bak/2MeYvCC78XGOeNx49NC/ZFxhA4blA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIPRNC1rMY9OF+TrM6cl30UAaphUwUe+a6lEu/t+/60=;
 b=Rdn1aj7XRFdqEwQAJbJhuLaMXx28lUa6nyYOWq+4Cf6ltbLN4z2+HQyrN8tXkRVXTmrtB8dcaQ6jkektNUsAJQbBny1bbeelwm0KLdW8Bo1Vab0ekTp0xT5pmvnpixj8bKBh7c4lW8GBXw25IV0mvKinsxSpo8w6VioSXXBSCCOO85X0fZjjOcu8ktk/HW5PIdPVjIDbLlhOqTEMKXdUNVehnHyJGiw7d+v2Sd9sZSNxCRq4tEO+Sg3fs5QkaH1ewKicwXpavegdERweXBqF+8xcekgKtVM7MsucCC6uUrCQcBcj9T9Ao5MqMStBoSHEcbeYQ0tYViwNEjVtsZizaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIPRNC1rMY9OF+TrM6cl30UAaphUwUe+a6lEu/t+/60=;
 b=JGesT0lp6MQADTP2rbGBcYb3yF95DywJw2kM/bOYM0cQOokn2A37WOHZ8hLL+svH9M3aWIZDt0/kIlHPngVjL4uCUFVmwpum4ylpCJujO1m9plP84e4IlBGeUXH25cn/bXJ+Z+DURCHL3NNWz4rJ/Ho2RN+P7GGwa7p4NDFEwSc=
Received: from SI2PR03MB5339.apcprd03.prod.outlook.com (2603:1096:4:105::9) by
 KL1PR03MB5587.apcprd03.prod.outlook.com (2603:1096:820:39::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Mon, 9 Jan 2023 11:54:25 +0000
Received: from SI2PR03MB5339.apcprd03.prod.outlook.com
 ([fe80::dae4:f894:f81f:7a2b]) by SI2PR03MB5339.apcprd03.prod.outlook.com
 ([fe80::dae4:f894:f81f:7a2b%8]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 11:54:25 +0000
From: =?utf-8?B?WGlubGVpIExlZSAo5p2O5piV56OKKQ==?= <Xinlei.Lee@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "sam@ravnborg.org"
	<sam@ravnborg.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "airlied@linux.ie" <airlied@linux.ie>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH 2/2] drm/panel: boe-tv101wum-nl6: Reduce lcm_reset to send
 initial code time
Thread-Topic: [PATCH 2/2] drm/panel: boe-tv101wum-nl6: Reduce lcm_reset to
 send initial code time
Thread-Index: AQHZIXvy5e1lbNR4AkKSRYdDZpV3aq6V90KAgAAICoA=
Date: Mon, 9 Jan 2023 11:54:24 +0000
Message-ID: <cf95d399cbfcf847a85d848c99f1bc0694636247.camel@mediatek.com>
References: <1672974321-18947-1-git-send-email-xinlei.lee@mediatek.com>
	 <1672974321-18947-3-git-send-email-xinlei.lee@mediatek.com>
	 <778af306-ae24-4c49-5e93-7810fad7f8bb@collabora.com>
In-Reply-To: <778af306-ae24-4c49-5e93-7810fad7f8bb@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5339:EE_|KL1PR03MB5587:EE_
x-ms-office365-filtering-correlation-id: b754780f-e5b3-48f4-84ed-08daf2384112
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PdQMLoy7v1PG9BmzeCO22h4pS5JlUOFEwMizW4O9Vay5RyAMhZYQ7cW2v68r3kFMYA8+dtbPkGuH5IvDZDCUt2x3sBhDYy36PKYnU4YIv6R1706q4f5T5wTMe3yif0T/DfKBxYfxi2rj2HWUoG8Fa5pAJam5OpEUcPsXQoUM/EEmzggsTJb9aZLut/akGd6pPuuP5jTA/ISdrV/FWPjoGVq8u+8IkkQ/3zO/WWmOP7wszfMGuUVbKEr2CUNFamoYW7w2lrLILU+8rlQ+pY3A0XvHbIkfS6CKzSG9wP0dszi8nww1qbKfvD/weUZvcWm06XDvJgqccs90gyRcKwBi0PCiIB+4JHD0Pg4thbm6IVjzlB9hduaX/TFy1DBE2G4oeMwJ+U5oJLJXzqCaFLkXxBocZtKWua7wVGZXYrY5LWTOcuWgruoorTr3H+MJYmzMpQBbOOEyPQmeIOcD/t0l6n4CHeKyuRk1oCUQpMbbF9TsvS0+YZjD/BiiTTF74L2riNWgtUxGrQpLT+Zx3CFZ1dvKd1frJlvhIcjawX5CD/N+3VdFmyapU0NoPos+1ydfA6LszYiZSbrFJjwgwYGVwj9xaPQOLIqVyUk1LgCq0uQgc7/9LzsqZRwwZHFddJJBXgcD8wEIk9FPwlV11LFzO4R09tdiGcROFR2zZOjvjswApRLs0z7J87cZJyu5NuB9tIngQ7KZ3DxwgbacJazz1a1pIRDsIZlhtfGFzdn+ABt9VPwF5J9xiCxo1wT86A0E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5339.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(451199015)(36756003)(186003)(85182001)(8936002)(122000001)(107886003)(26005)(6506007)(6512007)(2616005)(110136005)(54906003)(5660300002)(66946007)(7416002)(66446008)(66476007)(64756008)(66556008)(4326008)(91956017)(316002)(38070700005)(86362001)(71200400001)(6486002)(38100700002)(76116006)(478600001)(41300700001)(8676002)(2906002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHNqTlN2ekdVVVJwMS9jRysya3RiSmJQUys3MXVxc3EzNDZnZmpZc2VySXhh?=
 =?utf-8?B?R1pVb0s3anQveEVUK25lVDIya3NZbldmYUc1eUNFcDBtVjlhbUhROUppcUkz?=
 =?utf-8?B?RWZVZ1BQUDNpcEN4RGNMalVOdytGS0NicThMZXAzOXpEMVY3MitMWndjUHps?=
 =?utf-8?B?K0c3TjRwODMyRFBhZ29DZFBJbWI1M3dNMDBPM0wrZzI1SEhLbDEvZUZrcWFS?=
 =?utf-8?B?NEhEc1F2L1Yvb1RtTFAxT2trbXJkTFZ4bnVkZmZFcCtqTFdTWDQvTHBxOUlp?=
 =?utf-8?B?Y3JPbGJ6bWh2WWxyd3pqbDl2WjJ2cXNJMkRibUY2ZU1zUW95OEpzWFZid0x5?=
 =?utf-8?B?OVdUTVlhbDR5NW81Vmh0YjVOK0t6dUJIY0E0WFYxd2hqM0wwSTRzRi9reHJI?=
 =?utf-8?B?WEpqTEEzRFJwVDhaeHFpZEVZeHRURm1XVGZOZzkrcU8vYVVUenNCbnZqWVlz?=
 =?utf-8?B?OFBsZG9jWHNFczMyV2FleFJwNm5EUEJHd1grTG8rMk1oRWhpUzVJRU1EVmpo?=
 =?utf-8?B?V3dOMTZ0ckZFbndEeThCMUJyUW0rWmxUaVZjWis1VUxJUUdwV2V6a3NRbUkr?=
 =?utf-8?B?bGNFWGIxemhSVjdOTnNxMjVXcWxOV05wNmtSRW00cDFFRFQ1OElaSDA0emNi?=
 =?utf-8?B?T0FqSVNVOVlhcUlHSlMyM1RUSHIwL1dPRDd4WGUvNWVhZ01JcEFzTEdCdUNL?=
 =?utf-8?B?UHlFS0RHM2RYMFFlQVpXbzMyOHF5TUhEajVoV2NDZ2lmV1EvVWtad2t6ODZL?=
 =?utf-8?B?ODR2a2FEUERwbmpFNitLT1FKRFZhcXFWTXZlYWJFejluUFRyUGRvSW9zQWEy?=
 =?utf-8?B?M1RjelRENjZINzJTRzFvRDY0QkpMVG4vWGpFZERmQlV5YXZCcVlWOE5sK2gy?=
 =?utf-8?B?cDNIV2xEUWRkUU9meUUzVnRITVV3dlRsSlFwTEhUN2Mzd2Z2ejQ1RDF2TnlW?=
 =?utf-8?B?VFE2UlNhOUt1R0c2YWxFUXQwU0EzYnJjRCtxaVRmOGIvUHNzMkhUSHJ4d0hO?=
 =?utf-8?B?bDR6UjlXVUtvWHExVEl0M1ZTKzFvcEt6eEJ1NDNIMFdNdFowSUxsT0pNdGJR?=
 =?utf-8?B?emxNOHcxUVBRcXE0Z3lDUFVzNFhvazBnek5QSVp3Tmh6OHFxdnE2cTdNYnBL?=
 =?utf-8?B?S0VudURGL1I4cWxUU040WkxFNjMrTGV4MWFJZG1tQnhkRnAzMzEwaVhZR3JY?=
 =?utf-8?B?V0RNSEgraVRqd1BhL3E2anoxTG9vbzJkZUU4WEIrejJFa1BzZ0VyOXlXdGhz?=
 =?utf-8?B?elNBYVVLT2lORGVuejNqSnh5STBsU3lta0JsMHJCTXcvUm8xMUxZcDZneHFm?=
 =?utf-8?B?TkMzbTFRZnBhZjN5VWhLZnBDdE13WllzQ05uV21Ta0d5SVk3UXJTYUR2V0dU?=
 =?utf-8?B?Si8xY3lwK0o5SWNzYnNadTVLWEZURjNnTlNXeGRyMDdBaUxzNTcvd01tWHAz?=
 =?utf-8?B?QkFkQjIzRDFta1ZDUHNBVUtOcjdreGpMaE9QR0p0bysxQm82TFRGYXBoblM2?=
 =?utf-8?B?MStUaFlVTjcyZDJ0OC8zTFQ4dXROT0t5UFFmUFN6aWgxNkIzTEI1RjJONStN?=
 =?utf-8?B?OGRNOW9JUG9hZGlEMUxCK0pWWm8zdkFiMzBTMUFiVWZPTmN1ZDZOUUNUa2tR?=
 =?utf-8?B?VWxJUHhETk9xZVNFcGVRTzdpaUE2aFVZaFQwaFAzcm51QUxvWlMwdnpBSTFP?=
 =?utf-8?B?MEptdlBTUm5vTWRTSVJMUS9TQm5zYWE1amVsM2tQQWt0YzZUMi9QV2FCek0r?=
 =?utf-8?B?Vm5BVDlrUWJXb2pwVWYyY1V2SGlNY015TzVkWGg4RnNZTWk1aUJ2ekQ0OWk2?=
 =?utf-8?B?UW9mdEYxTW5UaXhvT1VTU3BzZHBuMGJLdldsM25XWlp4M3MyOHRJaWgrVW4v?=
 =?utf-8?B?NkpJMUF1UnB2TXdKL29xVncxREpuWUZqd3Y2KzNYUXBxWWZWakppVjNpRWdY?=
 =?utf-8?B?RkRPR0xwS0Q0ejZNN1hHZFZZTlN0anY4dlRLT3hsbFRrcDJuYU03WmdIWGNI?=
 =?utf-8?B?NjFneHF0M1EvMDUvNlNweTlVSEZSNEUyNVp3OVQ5TXZjRjhpVUo5VmEyUFQ3?=
 =?utf-8?B?K0lOZmVWSUhrYkdTdldDR0ZCT2R1QzgzekdsK3E3eXpFWmkvc0UwMEtLajd0?=
 =?utf-8?B?Zmo5SSs0SDhQY2FFcU5tMFR5Y1Bid3FCK1J1NmlTY0I0U1duMHJjcUtLdCsw?=
 =?utf-8?B?R1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5E008CC87438D43AF548A240C697444@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5339.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b754780f-e5b3-48f4-84ed-08daf2384112
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 11:54:24.9700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VnUfjE7bBp7dqqad5NrUEd3EWfRRB0IA1Lvu3gjKeWVcoEi59YrFSzrI0KByWYsZUD18boaAYHqCqe12/AcZrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5587
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_121452_944774_1C5FB531 
X-CRM114-Status: GOOD (  22.37  )
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

T24gTW9uLCAyMDIzLTAxLTA5IGF0IDEyOjI1ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMDYvMDEvMjMgMDQ6MDUsIHhpbmxlaS5sZWVAbWVkaWF0ZWsuY29t
IGhhIHNjcml0dG86DQo+ID4gRnJvbTogWGlubGVpIExlZSA8eGlubGVpLmxlZUBtZWRpYXRlay5j
b20+DQo+ID4gDQo+ID4gU2luY2UgdGhlIHBhbmVsIHNwZWMgc3RpcHVsYXRlcyB0aGF0IHRoZSB0
aW1lIGZyb20gbGNtX3Jlc2V0IHRvIERTSQ0KPiA+IHRvDQo+ID4gc2VuZCB0aGUgaW5pdGlhbCBj
b2RlIHNob3VsZCBiZSBncmVhdGVyIHRoYW4gNm1zIGFuZCBsZXNzIHRoYW4NCj4gPiA0MG1zLA0K
PiA+IHNvIHJlZHVjZSB0aGUgZGVsYXkgYmVmb3JlIHNlbmRpbmcgdGhlIGluaXRpYWwgY29kZSBh
bmQgYXZvaWQgcGFuZWwNCj4gPiBleGNlcHRpb25zLg0KPiA+IA0KPiA+IEZpeGVzOiBhODY5Yjlk
YjdhZGYgKCJkcm0vcGFuZWw6IHN1cHBvcnQgZm9yIGJvZSB0djEwMXd1bS1ubDYgd3V4Z2ENCj4g
PiBkc2kgdmlkZW8gbW9kZSBwYW5lbCIpDQo+ID4gU2lnbmVkLW9mZi1ieTogWGlubGVpIExlZSA8
eGlubGVpLmxlZUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jIHwgMSAtDQo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jDQo+ID4gaW5kZXggODU3YTJmMDQyMGQ3Li5mMDA5
MzAzNWYxZmYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJv
ZS10djEwMXd1bS1ubDYuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1i
b2UtdHYxMDF3dW0tbmw2LmMNCj4gPiBAQCAtNzgwLDcgKzc4MCw2IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgcGFuZWxfaW5pdF9jbWQNCj4gPiBpbnhfaGoxMTBpel9pbml0X2NtZFtdID0gew0KPiA+
ICAgfTsNCj4gPiAgIA0KPiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9pbml0X2NtZCBi
b2VfaW5pdF9jbWRbXSA9IHsNCj4gPiAtCV9JTklUX0RFTEFZX0NNRCgyNCksDQo+IA0KPiBZb3Ug
c2FpZCB0aGF0IHNob3VsZCBiZSBncmVhdGVyIHRoYW4gNiBhbmQgbGVzcyB0aGFuIDQwOiBwZXJo
YXBzIG9uDQo+IE1lZGlhVGVrDQo+IHBsYXRmb3JtcyByZW1vdmluZyB0aGlzIGRlbGF5IGlzIGZp
bmUgYnV0IHdlIGRvbid0IGtub3cgYWJvdXQgb3RoZXJzDQo+IC0gYW5kIHRoaXMNCj4gZHJpdmVy
IGlzIGZvciBhbGwgcGxhdGZvcm1zLg0KPiANCj4gVG8gc3RheSBvbiB0aGUgc2FmZSBzaWRlIHlv
dSBzaG91bGQsIGF0IHRoaXMgcG9pbnQsIHJlcGxhY2UgdGhpcw0KPiBkZWxheSB3aXRoDQo+IA0K
PiAJX0lOSVRfREVMQVlfQ01EKDcpOw0KPiANCj4gUmVnYXJkcywNCj4gQW5nZWxvDQo+IA0KDQpI
aSBBbmdlbG86DQoNClRoYW5rcyBmb3IgeW91ciByZXBseSENCg0KUGxlYXNlIGFsbG93IG1lIHRv
IGV4cGxhaW4sIGluIGFub3RoZXIgZHNpIG1vZGlmaWNhdGlvbiBvZiB0aGlzIA0Kc2VyaWVzLCBJ
IHJlZHVjZWQgdGhlIGRlbGF5IG9mIGRzaSdzIExQMDAtPkxQMTEgc3RhZ2UgZnJvbSAyMG1zIHRv
IDFtcyANCih0byBjb21wbHkgd2l0aCBkc2kgc3BlYyksIGluIGZhY3QsIGluIHRoaXMgZmlsZSwg
dGhlDQpib2VfcGFuZWxfcHJlcGFyZSBmdW5jdGlvbiBUaGUgNm1zIGRlbGF5IGFmdGVyIHB1bGxp
bmcgdXAgbGNtX3Jlc2V0DQppcyBiZWZvcmUgdGhlIDFtcyBtZW50aW9uZWQganVzdCBub3csIHdo
aWNoIGVuc3VyZXMgdGhhdCB0aGUgZGVsYXkgaXMgDQp3aXRoaW4gdGhlIHNwZWNpZmllZCByYW5n
ZSAoN21zKS4NCg0KRG8geW91IHN0aWxsIGhhdmUgZG91YnRzIGFib3V0IG15IGV4cGxhbmF0aW9u
Pw0KDQpCZXN0IFJlZ2FyZHMhDQp4aW5sZWkNCg==

