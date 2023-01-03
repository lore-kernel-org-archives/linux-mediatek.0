Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E52C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 02:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99g4eLgpL4CXEB/tixaI61IF3J+SEcQXLepGPRBeaZs=; b=vdl0Atk4TgIliTU1/JGrOFYV6Q
	hxsN68/gldHB2Eo6zp180mIcluNW7NLvWdSRF4immYjM/FCKSRshk3U/1knZaSFeMIQV0YQvvVpEJ
	okKez6w/3YiFzsHR5VT1VttBHmNy0DZkViZ9VRXgoAu7rf05tgZdY8+DqoAdDDVj8fSot8PFAioWr
	SaYEF6S2dpII56JpmTCsbmF38Q6JtJbvG2nBM5SL4xZujy1Yg+oMcX11BlRvaHWfpS/d3Q9poQYyw
	XphQP9iBWJkwu4W4NMH3OXw5lQ61H0YF3fxEOWSNws7bQPBjGOY3dmdCiSO2vO1mMJvSKCcSyWxFw
	bBbrk2VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCWxP-00FqZJ-4e; Tue, 03 Jan 2023 02:23:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCWwJ-00FqPi-OT
	for linux-mediatek@bombadil.infradead.org; Tue, 03 Jan 2023 02:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=99g4eLgpL4CXEB/tixaI61IF3J+SEcQXLepGPRBeaZs=; b=fhMfyT4PYRdiBfqeEEG9CiklNa
	8+JqDTSgXZ19IygzoRNaM/8ZSHrn742X2j1CuoDFwJXwjXi0018EsHBshhFGO91bPdhx10u/2ZKVS
	KcKtt/sw2WBpFBT/5Xcxb3p2dj47LNJzU/4qsVH6Gna9vWds18uwVUjsgOYIi2Cb096p+4sdzr9f2
	Cj3RjPgF3N0F9HX7mpJM3tNjZ/KXAYCK0KnKmqPZYgDFrh2SdiT1fXsBuK1tAbP7mAzN2whGV7hlk
	VWKZO+Si5TjEb2SCOUJPY0TVxM0vdxLJcVCIWVaavIjBqyP1ZpT8MwU6jTHdgP8cKQk2pMnzL5nZg
	6xIVFN1A==;
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pCWw5-000RYr-15
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Jan 2023 02:21:59 +0000
X-UUID: 2cf5b65adda54cd28513905ba7da7446-20230102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=99g4eLgpL4CXEB/tixaI61IF3J+SEcQXLepGPRBeaZs=;
	b=lWhQHksBoImDWnQEOBO+bK7cn+pefprtYcFabW+czkcixF/3MtpHmCmlZPEVYmnN5tWC4q3aBZVmmaln6wFyoygCnO2BZlEo9g0xuvgILI9BfaY6VCcBNYQajydIoJdZZyKZFggDgOvsQsGuHAOnvZAh5T55+cuUJ5d6XrchWn0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:8dc09f15-28ec-4a2e-8908-6fc614b51375,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:09771b1,CLOUDID:40e198f4-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 2cf5b65adda54cd28513905ba7da7446-20230102
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sujuan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 188550774; Mon, 02 Jan 2023 19:06:16 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 3 Jan 2023 09:55:38 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 3 Jan 2023 09:55:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkHTrTiI3qY5Op+U8RDNHNzKtTll5UskVQF5zrYLVSEuy/X8qvjPkc7S/h2h3X7ZjREqS7TxKxeval+hRLZNwjarEyVVYAEpUOHyp9qvCaSkj/iJgA5Ibb+DkHhWySxaHlaqIxJSH9TcaUGniM//82YPXxO5aCa4C9XEHTdLQpp7BCOC0zcHMsEvXkQmYC59XRcyDlPRHtqL1N/CnMiW8Q/v0j+g6ZgvkGrH+H/Cfof48ZDOejZaIBJU46bq/voOvl4QvY9hTEOHseq28me/DC6JcbGSDOd8/q5BK6hJTyozJHJMYjF70JKU/92XZUb4GgAskuE7Pq46SLHA7jhYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99g4eLgpL4CXEB/tixaI61IF3J+SEcQXLepGPRBeaZs=;
 b=aLU4Fgp3ytX4S5fli4SM0yYkv9XDaaKp86e6gLT5ZdYFVOSaAcfTkBQYDtYFIbZxHSSECZkbnjrgUw45k97icWC9264LQkRNLGbat1sWGEuzTQu9ZfyUV6VWBdWSyP9gvF5qEjKSCqEoH8c583OT0i/vs+z+ukzo8skUdBKNa33IyEy4F+VjyYANlUa6lnwnxSj8Qb2VkUl/ULGIwFdGGNukfYOD7EIne0biCk7yU4VnQiPLgdB4ZTCAs+siclErShZvb3CRnRSdT9fxJLdSAjgeAvF8LZ8GsVoMu3pYt4KCbQ0ROB5D77FTdr+DnGond4n/DfCAyagDHtXhP2sJJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99g4eLgpL4CXEB/tixaI61IF3J+SEcQXLepGPRBeaZs=;
 b=kbtegLHM8FQqV+4ch3GunHiMDTfPFiTdhn+pZ5hCLI3I/dQn495QeNRhvmxCBh9tSUb+6ZPhYg4aIja0zDlGFIwpwaUnUD+LKp6sZ5Sbta1mMPv2jWLzdtD7z5Dn4KTvjjt50796N7rQvmAQecPGFs0f93mTQSJOyuMq10jC/RQ=
Received: from PS1PR03MB3461.apcprd03.prod.outlook.com (2603:1096:803:42::12)
 by TYZPR03MB6135.apcprd03.prod.outlook.com (2603:1096:400:12e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 01:55:36 +0000
Received: from PS1PR03MB3461.apcprd03.prod.outlook.com
 ([fe80::ea45:323a:2086:43ec]) by PS1PR03MB3461.apcprd03.prod.outlook.com
 ([fe80::ea45:323a:2086:43ec%7]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 01:55:36 +0000
From: =?utf-8?B?U3VqdWFuIENoZW4gKOmZiOe0oOWonyk=?= <Sujuan.Chen@mediatek.com>
To: "nbd@nbd.name" <nbd@nbd.name>, "lorenzo@kernel.org" <lorenzo@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	=?utf-8?B?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>,
	=?utf-8?B?Qm8gSmlhbyAo54Sm5rOiKQ==?= <Bo.Jiao@mediatek.com>,
	=?utf-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?= <Evelyn.Tsai@mediatek.com>,
	Ryder Lee <Ryder.Lee@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2] wifi: mt76: fix potential memory leakage
Thread-Topic: [PATCH v2] wifi: mt76: fix potential memory leakage
Thread-Index: AQHZE2UYm26GeWDuU0a5b6k/XQDcva50+UQAgAE64oCAAfJmgIAASTAAgAAGzwCAAC9VgIAA+EaA
Date: Tue, 3 Jan 2023 01:55:36 +0000
Message-ID: <f16101f5a9937da22d9c51f3b3aa24ca66f64a6d.camel@mediatek.com>
References: <3940cc5ccb4b17d51b5176e722daef0d1af66d6a.camel@mediatek.com>
	 <B2689D6F-E04E-4E9B-9244-4E5069DC464D@nbd.name>
	 <Y6NKHY7euhifm0kI@lore-desk>
In-Reply-To: <Y6NKHY7euhifm0kI@lore-desk>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS1PR03MB3461:EE_|TYZPR03MB6135:EE_
x-ms-office365-filtering-correlation-id: d6d224fb-b3e3-4365-8570-08daed2d9b94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ntUpSgvgNW8+QUKk/kSo8gFOHxdUsZAgcszI6+yWDLxh9we8mgXEvH8wDdYqH4YTk4G7AlsvE1o24ScKEZNrNys07q0ir6CRDP+VKzsdaFhlV5Hz+D7dUsX43Otnaom3PK7bPmyCHMCkB1FTivxPgbMn1AsJXm6jtIqa5pgsViyMN68DsKHjAY65aQje/1krIwWE70WtaQoRw9lAQzub2rBStsZa+e+6YCaLeKot9zIU7ofESYMZXBOCnAhPEDThmmXlJ6/FEqbMwsKpmroLuyLY1yn2mOmWaDUFeq4J+6Wz21u6kw+Akx/VcYAncG9V2kviezKh1YUzH+bLAiQ7ipzGREmI7VjrxRaeuLO5KEXgV8shtP7l+pYYm4OkvbQCi2BuGIu020fwS/YugS4F3zVaYXvAqrf8kpEtOsuWFNKXcK7cK+NLZHFU/BmIgy9g3vjjUO77/yUMH1aqJ+xcg5rX1G0k8/qAm1n+kb4vdZZ7lr++42AsZQQC5Xvt0nTH6jJGueOy2BsQ+YB99cS2mH/LjYMxPin533TQkDc3HArqqSO2fNCfsjIAkuZT97JY8jOfDPAki/AW44Y1XhZ/PPeM+eIf6jd8I8hhaWAFBuA/XqOqpHzlavcOYvd7Lr7NRvHsZRBTLS1TtArRkvD3+YbezcFKTYchuPzQinweEHcM2uP+/Z59a7j9A8b0mgpuVDf0mSJjfJG4hUcBIWgDOQxN4mL6lqIxgCrQbIYd3NA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PR03MB3461.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(396003)(136003)(376002)(346002)(451199015)(76116006)(66946007)(8676002)(66446008)(85182001)(4326008)(66556008)(64756008)(36756003)(2616005)(66476007)(38070700005)(41300700001)(91956017)(316002)(54906003)(110136005)(4001150100001)(2906002)(86362001)(38100700002)(122000001)(5660300002)(71200400001)(83380400001)(8936002)(6506007)(478600001)(6486002)(186003)(6512007)(26005)(22166006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzRHWTRhWG5HY2tMN1BVQ0o4Q056RjZDU2pFbVhwTFQ0dGZ5MGEzdlVOeFh4?=
 =?utf-8?B?ZmpYcWpOem40UEpRaWp0dDFtaGVUUW1jVXB1aGx1UXlpeitQSVpjeFdzaXF5?=
 =?utf-8?B?VlZOdXE3Z2N5ZnJ4ejQrb05UclY0ZGc5b0FuTEJmSmVIc0dXaTIwL2d1OUhE?=
 =?utf-8?B?b1J4eFNiY2NObTQ3U1d3L2IxRW9sMUd3WGd1a3BDK2Q4TFlnVnpkeWFtYmd0?=
 =?utf-8?B?aUNTMHdRT09Sbkp4VFpYMThMWTh3YzQ0N3NSeWI4K29sblV1WnZGaTNGWGxm?=
 =?utf-8?B?Y0lPczZqeFpEMzJtWFVqamMyVUs2OFB6MG1PaENjVVBjSVhlRG1iQ1Uxcm0z?=
 =?utf-8?B?dk5naDR5OEVBQmZPbnVLdnc5QWIvOFdrTFBNaDBsL3dKWHBPbnpWM1JjNUZ6?=
 =?utf-8?B?MXV2Y1ZvVUhMUmlINTE2MndqREZ0b04xK2lROFZPMXRNRS9FZDNXRFRWRlBi?=
 =?utf-8?B?YUh4emgzQTUvZmtxWnF5MmdDYzk0RmVCQWhxNHIxc0lxampiNnR5MmgyWlBa?=
 =?utf-8?B?bm0vS2NmOWZnMCtCTkRmTmttZzJpaHlHbVpHeXNWNGpnRXJxajQ1Y29qclBw?=
 =?utf-8?B?Q29GQUV1VmN3OUUzQndOTjVSVkVNVjFDeXZGK0x1eG42NUNCaXVqQ1gwNE5v?=
 =?utf-8?B?aW9jQlZkdnJVQk80YzZaWlFVcXAxcDlzYkZYQ1lxNDhEN2d4Q1h3VCtVRm4z?=
 =?utf-8?B?aGYvdytpZkRvOVpGYXNBVmQ4eUpMMTlUQUdZU0kyQWJySVovUHhOOTZOV1FL?=
 =?utf-8?B?bHJpbkl3TFBzc1d5N3hJaDlJU0VIcjhJLzZRM2o1RDJlYTVNR0JXR0dUclV5?=
 =?utf-8?B?cmZpaVNMTnRseSsrL1F2MVRvdWwzWnlVVjRTMWUvK2ZEbmtKekQ1enRjZzNJ?=
 =?utf-8?B?NENwaUpLcFRKNFVjcHF1cUYvSzBxckhndEtMNnhmRTI1OFNpczRrY1h2N3k3?=
 =?utf-8?B?OFBjRXZqR2RqQ0duamxwZG5ZT1RKbHZzMGl1WENJZUIvcU5IMTZZSllRZngr?=
 =?utf-8?B?SkdzUmFSUUN4UFkwZUxPMWNLajBIZlVNK0NsUWtGelhGaFhXNm56QXp0Z2NT?=
 =?utf-8?B?VnJMelpZM2gzMGNnQ2o2TUZOdGg3NDYzNHFZUGdlNXU5ZE95ZWlzWnVzU252?=
 =?utf-8?B?bzZocURXMnNxNUlHRExuNXFCSmJjaTQ2dzhZMW5IeHROMmhGTTNuakdNcEdp?=
 =?utf-8?B?eU11MVdRS1Vvci96Z1VVYkxISDg5WjdkVUxQWnJFNjRtUnJGb3FXQjBVT1VW?=
 =?utf-8?B?dkVic2NTY09VTGl5aHFJL25YSmZtMXI4cWUzUlorT2RkYzgwQXJ3bUZtREto?=
 =?utf-8?B?WmowRjNNMHJQOHpvakxzcWdob0gxK3c5TjlRbjhIZTB3RGZNQ2RkOUdCZzIz?=
 =?utf-8?B?ak5FSFNSVTJtbkNhQXBNSzkxcFY2VVhTZXpNTlk4N2t4dlVYNENWWlhZZEtM?=
 =?utf-8?B?WDRtbTI1VHlZK0ZsREhJUnRERzlpa2hZRVhTamF5R2R5RWdIc3AxMHBORTdp?=
 =?utf-8?B?ZlpFbTkvNE9mUGkwNXNqcDlDRG5VVFBKbmoxdXFsOHZ2Ym0zZGJhZFhleTla?=
 =?utf-8?B?N1RzNEthVkhYdU1lSmsvZXlNRWlZTWtuWktBY2JuLzI5aUVVVXJnTTdiSnEw?=
 =?utf-8?B?KzRFSDZnSjJZajBTUGFNQXJ6VHJ1Skk0MDIvSmgxbGhJdTdaL09XV0dZM3FU?=
 =?utf-8?B?a2dWYlM1RHdLZ21hcFpvTTJ4K0FMaFB5SDJKa1d0dkJBenkzV0hKY05sSEI2?=
 =?utf-8?B?WnhrZTg1cDN1eUZ4UmwxUFJ1VzFkR2xWeDVLazlHTm5TU2NOU1J3TE5TLzZU?=
 =?utf-8?B?bUtIazB4Qkwwb0JQRGpaRXRtQXR2akhJeVNtUGFsWU1ndUd6ODRldXk3NmV6?=
 =?utf-8?B?VHVqcVlSRStSZzBPR1QzTDJaUkZsM0tJcFNYSDVJbm9ZRnE0cUVpY3gwdHQy?=
 =?utf-8?B?Q0FZNnp3WVJkZHZJSUoxMXF0ZVUvU3c2SFRYekFZdUdBYis4MjNOVTdidGxh?=
 =?utf-8?B?MytqNkVaTFord3hBMFJuaGEvYnEwelcxeU9Ea3ZqZnhnQUQzUjNhNm9ZUmtM?=
 =?utf-8?B?Tll4elpwK1ZKekcxaGN0dEZacDNsRE5YMHMvbkJxQ1dnZTY3dzg2THJ6ZGpJ?=
 =?utf-8?B?Wjl3eUJzaGUxajcvc3ArT1JWNUQxQjluZSt4djJORnlJTmlYMWVkc2cvZjZV?=
 =?utf-8?B?ZFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9EC1B0D8477B634CA503E33EB6CCF094@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PR03MB3461.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d224fb-b3e3-4365-8570-08daed2d9b94
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2023 01:55:36.5234
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iPNGqPK0NzGjZt/WXNy/WQNS4H4Tt5hyasQD8QWhzCyHdQcu4hypF9AX9fRBN97aEhlEyEUNL+162I8tzCv8pHAUIkEupYpjlnrocpBqSYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_022154_731055_43B684D9 
X-CRM114-Status: GOOD (  34.42  )
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

T24gV2VkLCAyMDIyLTEyLTIxIGF0IDE5OjAyICswMTAwLCBMb3JlbnpvIEJpYW5jb25pIHdyb3Rl
Og0KPiBPbiBEZWMgMjEsIEZlbGl4IEZpZXRrYXUgd3JvdGU6DQo+ID4gSGkgU3VqdWFuLA0KPiA+
IA0KPiA+ID4gWWVzLCBpdCBpcyBzbyBleHBlbnNpdmUsIGJ1dCBpZiBubyBtZW1jb3B5LCBpdCB3
aWxsIGNhc3VlIG1lbW9yeQ0KPiA+ID4gZnJhZ21lbnRhdGlvbiAod2UgaGl0IHRoaXMgaXNzdWUg
aW4gaW50ZXJuYWwgU1FDKS4NCj4gPiA+IA0KPiA+ID4gYXMgd2Uga25vdywgd2VkIG5lZWRzIHRv
IGV4Y2hhbmdlIHJ4IHBrdChiZWxvbmdzIHRvIHdlZCByeCBidWZmZXINCj4gPiA+IG1hbmFnZXIp
IHdpdGggd2lmaSBkcml2ZXIoZG1hIHJ4IGRhdGEgcXVldWUpIGJ5IGV4Y2hhbmdpbmcgd2ZkbWEN
Cj4gPiA+IGRtYWQNCj4gPiA+IHRvIGVuc3VyZSB0aGUgZnJlZSB3ZWQgcnggYnVmZmVyLg0KPiA+
ID4gDQo+ID4gPiBpdCBpcyBwb3NzaWFibGUgdGhhdCBhIGxhcmdlIG51bWJlciBvZiBidWZmZXIg
aGFzIGJlZW4gZXhjaGFuZ2VkDQo+ID4gPiB0byB3ZWQNCj4gPiA+IGFuZCBjYW4gbm90IGNvbWUg
YmFjayB0byB3bGFuIGRyaXZlci4gU28sIHRoZSBtZW1vcnkgZnJvbSB0aGUNCj4gPiA+IHNhbWUg
MzJLDQo+ID4gPiBwYWdlIGNhY2hlIGlzIHVuYWJsZSB0byBiZSByZWxlYXNlZCwgYW5kIGl0IHdp
bGwgYmUgZmFpbGVkIGF0DQo+ID4gPiBwYWdlX2ZyYWdfYWxsb2MgaW4gbXQ3Nl9kbWFfcnhfZmls
bC4NCj4gPiA+IA0KPiA+ID4gQW55IGlkZWFzIGJ1dCBtZW1jb3B5Pw0KPiA+IA0KPiA+IEEgc2lt
cGxlIHNvbHV0aW9uIHdvdWxkIGJlIHRvIHNpbXBseSBhbGxvY2F0ZSBzaW5nbGUgcGFnZXMsIG9y
DQo+ID4gaGFsZi1wYWdlIGZyYWdtZW50cy4NCj4gPiANCj4gPiAtIEZlbGl4DQo+ID4gDQo+IA0K
PiBBIHNpbXBsZSBhcHByb2FjaCB3b3VsZCBiZSBhbGxvY2F0aW5nIGEgc2luZ2xlIHBhZ2UgZm9y
IGVhY2ggcngNCj4gYnVmZmVyLg0KPiANCj4gQFN1anVhbjogY2FuIHlvdSBwbGVhc2UgZG91Ymxl
IGNoZWNrIGlmIGl0IGlzIG9rIGZyb20gcGVyZm9ybWFuY2UgYW5kDQo+IG1lbW9yeQ0KPiAJIGZy
YWdtZW50YXRpb24gcG9pbnQgb2Ygdmlldz8gSWYgbm90IEkgZ3Vlc3Mgd2UgY2FuIHRyeSB0bw0K
PiBvcHRpbWl6ZSBpdA0KPiAJIGFuZCBhbGxvY2F0ZSBtdWx0aXBsZSBidWZmZXJzIGluIHRoZSBz
YW1lIHBhZ2UgdHdlZWtpbmcgcGFnZQ0KPiByZWZjb3VudC4NCj4gDQo+ICh0aGlzIHBhdGNoIG11
c3QgYmUgYXBwbGllZCBvbiB0b3Agb2YgRmVsaXgncyBkbWEgZml4KS4NCj4gDQoNCkFsbG9jYXRp
bmcgc2luZ2xlIHBhZ2UgZm9yIGVhY2ggcnggYnVmZmVyIGF2b2lkcyBtZW1vcnkgZnJhZ21lbnRh
dGlvbiwNCmJ1dCBpdCBhbHdheXMgdXNlcyA0SyBmb3Igb25lIHJ4IHBrdCB3aGljaCBvbmx5IG5l
ZWRzIDJLLCByaWdodD8NCg0KSSBndWVzcyBwZXJmb3JtYW5jZSB3b3VsZCBiZSB3b3JzZSB3aXRo
b3V0IHBhZ2UgY2FjaGUuDQpXZSBoYXZlIHRlc3RlZCBvbiB0aGUgbXRrIHByaXZhdGUgZHJpdmVy
LCA3JSBkcm9wIGluIHRocm91Z2hwdXQgd2hlbg0Kc2V0dGluZyB0aGUgNEsgcGFnZSBjYWNoZSBj
b21wYXJlZCB0byB0aGUgMzJLIHBhZ2UgY2FjaGUuDQphbmQgMTAlIGRyb3Agd2hlbiB1c2Ugc2xh
YiB0byBhbGxvY2F0ZSBidWZmZXIuDQoNCkEgc2luZ2xlIHBhZ2UgcGVyIHJ4IGJ1ZmZlciBtYXkg
Y2F1c2UgYSB0aHJvdWdocHV0IGRyb3Agb2Ygb3ZlciA3JSBhbmQNCndhc3RlIG1lbW9yeSwgd2hh
dCBkbyB5b3UgdGhpbms/DQoNClJlZ2FyZHMsDQpTdWp1YW4NCg0KPiBSZWdhcmRzLA0KPiBMb3Jl
bnpvDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3
Ni9kbWEuYw0KPiBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvZG1hLmMNCj4g
aW5kZXggMjhhN2ZlMDY0MzEzLi4xZDllNTgwOTc3ZmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
bmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvZG1hLmMNCj4gKysrIGIvZHJpdmVycy9uZXQvd2ly
ZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9kbWEuYw0KPiBAQCAtNTgwLDYgKzU4MCwyMCBAQCBtdDc2X2Rt
YV90eF9xdWV1ZV9za2Ioc3RydWN0IG10NzZfZGV2ICpkZXYsDQo+IHN0cnVjdCBtdDc2X3F1ZXVl
ICpxLA0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyB2b2lkICoNCj4gK210
NzZfZG1hX2dldF9yeF9idWYoc3RydWN0IG10NzZfcXVldWUgKnEpDQo+ICt7DQo+ICsJaWYgKChx
LT5mbGFncyAmIE1UX1FGTEFHX1dFRCkgJiYNCj4gKwkgICAgRklFTERfR0VUKE1UX1FGTEFHX1dF
RF9UWVBFLCBxLT5mbGFncykgPT0gTVQ3Nl9XRURfUV9SWCkgew0KPiArCQkvKiBXRUQgUlggcXVl
dWUgKi8NCj4gKwkJc3RydWN0IHBhZ2UgKnBhZ2UgPSBkZXZfYWxsb2NfcGFnZSgpOw0KPiArDQo+
ICsJCXJldHVybiBwYWdlID8gcGFnZV9hZGRyZXNzKHBhZ2UpIDogTlVMTDsNCj4gKwl9DQo+ICsN
Cj4gKwlyZXR1cm4gcGFnZV9mcmFnX2FsbG9jKCZxLT5yeF9wYWdlLCBxLT5idWZfc2l6ZSwgR0ZQ
X0FUT01JQyk7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyBpbnQNCj4gIG10NzZfZG1hX3J4X2ZpbGwo
c3RydWN0IG10NzZfZGV2ICpkZXYsIHN0cnVjdCBtdDc2X3F1ZXVlICpxKQ0KPiAgew0KPiBAQCAt
NTk2LDcgKzYxMCw3IEBAIG10NzZfZG1hX3J4X2ZpbGwoc3RydWN0IG10NzZfZGV2ICpkZXYsIHN0
cnVjdA0KPiBtdDc2X3F1ZXVlICpxKQ0KPiAgCQlzdHJ1Y3QgbXQ3Nl9xdWV1ZV9idWYgcWJ1ZjsN
Cj4gIAkJdm9pZCAqYnVmID0gTlVMTDsNCj4gIA0KPiAtCQlidWYgPSBwYWdlX2ZyYWdfYWxsb2Mo
JnEtPnJ4X3BhZ2UsIHEtPmJ1Zl9zaXplLA0KPiBHRlBfQVRPTUlDKTsNCj4gKwkJYnVmID0gbXQ3
Nl9kbWFfZ2V0X3J4X2J1ZihxKTsNCj4gIAkJaWYgKCFidWYpDQo+ICAJCQlicmVhazsNCj4gIA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUv
bW1pby5jDQo+IGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvbW1p
by5jDQo+IGluZGV4IDFhMmU0ZGY4ZDFiNS4uMjkyNGU3MWU0ZmJlIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzkxNS9tbWlvLmMNCj4gKysrIGIv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvbW1pby5jDQo+IEBAIC01
OTQsMTMgKzU5NCw5IEBAIHN0YXRpYyB2b2lkDQo+IG10NzkxNV9tbWlvX3dlZF9vZmZsb2FkX2Rp
c2FibGUoc3RydWN0IG10a193ZWRfZGV2aWNlICp3ZWQpDQo+ICBzdGF0aWMgdm9pZCBtdDc5MTVf
bW1pb193ZWRfcmVsZWFzZV9yeF9idWYoc3RydWN0IG10a193ZWRfZGV2aWNlDQo+ICp3ZWQpDQo+
ICB7DQo+ICAJc3RydWN0IG10NzkxNV9kZXYgKmRldjsNCj4gLQl1MzIgbGVuZ3RoOw0KPiAgCWlu
dCBpOw0KPiAgDQo+ICAJZGV2ID0gY29udGFpbmVyX29mKHdlZCwgc3RydWN0IG10NzkxNV9kZXYs
IG10NzYubW1pby53ZWQpOw0KPiAtCWxlbmd0aCA9IFNLQl9EQVRBX0FMSUdOKE5FVF9TS0JfUEFE
ICsgd2VkLT53bGFuLnJ4X3NpemUgKw0KPiAtCQkJCXNpemVvZihzdHJ1Y3Qgc2tiX3NoYXJlZF9p
bmZvKSk7DQo+IC0NCj4gIAlmb3IgKGkgPSAwOyBpIDwgZGV2LT5tdDc2LnJ4X3Rva2VuX3NpemU7
IGkrKykgew0KPiAgCQlzdHJ1Y3QgbXQ3Nl90eHdpX2NhY2hlICp0Ow0KPiAgDQo+IEBAIC02MTAs
NyArNjA2LDcgQEAgc3RhdGljIHZvaWQgbXQ3OTE1X21taW9fd2VkX3JlbGVhc2VfcnhfYnVmKHN0
cnVjdA0KPiBtdGtfd2VkX2RldmljZSAqd2VkKQ0KPiAgDQo+ICAJCWRtYV91bm1hcF9zaW5nbGUo
ZGV2LT5tdDc2LmRtYV9kZXYsIHQtPmRtYV9hZGRyLA0KPiAgCQkJCSB3ZWQtPndsYW4ucnhfc2l6
ZSwgRE1BX0ZST01fREVWSUNFKTsNCj4gLQkJX19mcmVlX3BhZ2VzKHZpcnRfdG9fcGFnZSh0LT5w
dHIpLCBnZXRfb3JkZXIobGVuZ3RoKSk7DQo+ICsJCWZyZWVfcGFnZSh2aXJ0X3RvX3BhZ2UodC0+
cHRyKSk7DQo+ICAJCXQtPnB0ciA9IE5VTEw7DQo+ICANCj4gIAkJbXQ3Nl9wdXRfcnh3aSgmZGV2
LT5tdDc2LCB0KTsNCj4gQEAgLTYyMSwxMyArNjE3LDkgQEAgc3RhdGljIHUzMiBtdDc5MTVfbW1p
b193ZWRfaW5pdF9yeF9idWYoc3RydWN0DQo+IG10a193ZWRfZGV2aWNlICp3ZWQsIGludCBzaXpl
KQ0KPiAgew0KPiAgCXN0cnVjdCBtdGtfcnhibV9kZXNjICpkZXNjID0gd2VkLT5yeF9idWZfcmlu
Zy5kZXNjOw0KPiAgCXN0cnVjdCBtdDc5MTVfZGV2ICpkZXY7DQo+IC0JdTMyIGxlbmd0aDsNCj4g
IAlpbnQgaTsNCj4gIA0KPiAgCWRldiA9IGNvbnRhaW5lcl9vZih3ZWQsIHN0cnVjdCBtdDc5MTVf
ZGV2LCBtdDc2Lm1taW8ud2VkKTsNCj4gLQlsZW5ndGggPSBTS0JfREFUQV9BTElHTihORVRfU0tC
X1BBRCArIHdlZC0+d2xhbi5yeF9zaXplICsNCj4gLQkJCQlzaXplb2Yoc3RydWN0IHNrYl9zaGFy
ZWRfaW5mbykpOw0KPiAtDQo+ICAJZm9yIChpID0gMDsgaSA8IHNpemU7IGkrKykgew0KPiAgCQlz
dHJ1Y3QgbXQ3Nl90eHdpX2NhY2hlICp0ID0gbXQ3Nl9nZXRfcnh3aSgmZGV2LT5tdDc2KTsNCj4g
IAkJZG1hX2FkZHJfdCBwaHlfYWRkcjsNCj4gQEAgLTYzNSw3ICs2MjcsNyBAQCBzdGF0aWMgdTMy
IG10NzkxNV9tbWlvX3dlZF9pbml0X3J4X2J1ZihzdHJ1Y3QNCj4gbXRrX3dlZF9kZXZpY2UgKndl
ZCwgaW50IHNpemUpDQo+ICAJCWludCB0b2tlbjsNCj4gIAkJdm9pZCAqcHRyOw0KPiAgDQo+IC0J
CXBhZ2UgPSBfX2Rldl9hbGxvY19wYWdlcyhHRlBfS0VSTkVMLA0KPiBnZXRfb3JkZXIobGVuZ3Ro
KSk7DQo+ICsJCXBhZ2UgPSBfX2Rldl9hbGxvY19wYWdlKEdGUF9LRVJORUwpOw0KPiAgCQlpZiAo
IXBhZ2UpDQo+ICAJCQlnb3RvIHVubWFwOw0KPiAgDQo+IEBAIC02NDQsNyArNjM2LDcgQEAgc3Rh
dGljIHUzMiBtdDc5MTVfbW1pb193ZWRfaW5pdF9yeF9idWYoc3RydWN0DQo+IG10a193ZWRfZGV2
aWNlICp3ZWQsIGludCBzaXplKQ0KPiAgCQkJCQkgIHdlZC0+d2xhbi5yeF9zaXplLA0KPiAgCQkJ
CQkgIERNQV9UT19ERVZJQ0UpOw0KPiAgCQlpZiAodW5saWtlbHkoZG1hX21hcHBpbmdfZXJyb3Io
ZGV2LT5tdDc2LmRldiwNCj4gcGh5X2FkZHIpKSkgew0KPiAtCQkJX19mcmVlX3BhZ2VzKHBhZ2Us
IGdldF9vcmRlcihsZW5ndGgpKTsNCj4gKwkJCWZyZWVfcGFnZShwYWdlKTsNCj4gIAkJCWdvdG8g
dW5tYXA7DQo+ICAJCX0NCj4gIA0KPiBAQCAtNjUzLDcgKzY0NSw3IEBAIHN0YXRpYyB1MzIgbXQ3
OTE1X21taW9fd2VkX2luaXRfcnhfYnVmKHN0cnVjdA0KPiBtdGtfd2VkX2RldmljZSAqd2VkLCBp
bnQgc2l6ZSkNCj4gIAkJaWYgKHRva2VuIDwgMCkgew0KPiAgCQkJZG1hX3VubWFwX3NpbmdsZShk
ZXYtPm10NzYuZG1hX2RldiwgcGh5X2FkZHIsDQo+ICAJCQkJCSB3ZWQtPndsYW4ucnhfc2l6ZSwN
Cj4gRE1BX1RPX0RFVklDRSk7DQo+IC0JCQlfX2ZyZWVfcGFnZXMocGFnZSwgZ2V0X29yZGVyKGxl
bmd0aCkpOw0KPiArCQkJZnJlZV9wYWdlKHBhZ2UpOw0KPiAgCQkJZ290byB1bm1hcDsNCj4gIAkJ
fQ0KPiAgDQo=

