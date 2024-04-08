Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C952BCD128A
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 10:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwBWMVdOmbivKq+TpJpiqomZTBhMYRsNWxrtvAJKMRw=; b=IKvxKyT8AbhMSgCSfLkaFRK9aW
	dtRY3Ky05qPn2/SR2R7laWBjdnQN8pTFfsP3Ojhq7h4abF9EK7H/jDIT0aykFOivMnmOoOmFyMZpC
	T9fhydTl0+einLa0DzrvkF4Png4dP8hdYstFCJ56Eo8iTbkSblRR2oycOdydUTdFL7qnTnsHULUln
	JyH/njmablzeE2Mmal+SCRwitpyWZWgzi1vEWk04seml+v6xCQ7DJI2zTLn0Tc8xuvWsOfbqniFLe
	p7hKEdEFU0jY8wJZ4JpP/C7pr5CBL+Bm82rJuiQutnFQ4/eWpOlvLFwI5lq7CGd8ulV0N/0HYteHG
	D0threyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtlnO-0000000FBWT-1PfP;
	Mon, 08 Apr 2024 10:00:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtlnK-0000000FBVQ-3QM1;
	Mon, 08 Apr 2024 10:00:08 +0000
X-UUID: c2260bb0f58e11ee96d5dfc950b7243d-20240408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=AwBWMVdOmbivKq+TpJpiqomZTBhMYRsNWxrtvAJKMRw=;
	b=uSm64j3DsAON+wdHmcxl1fN0jztHWbXRggk+IiC2cYJdXZstVSyY6jSCOujdzDlskBmOT4mvCLeeXHEA5GQtEhBUQphpBKztwPh+lPBnuMC1+Nz5FFvY54+v1A6uTNq0HnJj//+ywZJdCYBRNDOX13RBRBnD2iIhLb0eDFZFThI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:27ad1a11-9325-41be-bec9-14cf1e61b2c7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:b8e56a82-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: c2260bb0f58e11ee96d5dfc950b7243d-20240408
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 790907109; Mon, 08 Apr 2024 02:59:58 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 8 Apr 2024 17:49:21 +0800
Received: from SINPR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 8 Apr 2024 17:49:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVaIPOixcQ9Y/GhRv0t5vSaHjPtlf2sVqX3f74JOSH+gazd2SLYde8jv5YX/+Tdw/UJasyE6gmJBTLdpfDwEzi0Hf9HSLuGAb2R+DMABLI2bRBeheVfW40XBZTF2cZ1SmUZJ6E0uurSWw/SOoErdRqpcAsV/LKy+SXLhn4eLA5lUhGWpTyi3ayu71Icsp7djE6GpY8kDSE6cGq6xqbbMFddb4jND2vdoz2Mk0o+m1rtFoGAhzlXcnwxKqLbiIl8+6ha80xZsZPC/Ownm6J5UasD3VRJexoB+p+sB/EiRjCYLcRtbshZfqP4lvoUkgtB5RTWXXckBySrT1pN+vw4HqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwBWMVdOmbivKq+TpJpiqomZTBhMYRsNWxrtvAJKMRw=;
 b=NoOvLeLji9jNuMFA9BlrcqDe57CkfvFfl7Nqs2V6qgQ0BxBC63zJtK7GnMseTLa5Dq/i2ltQHvwaHo4MHvkoaFLmrt9BtRt5h70iKCWkfAkqppGfsRRvH0tyEgxIL80rBg3AtwTJf0hWQE9m1BYBaBnwVLpe/5Lw8R1LO+gXJXiNtb5wNOyxu4OeZkfTYjOUpymki5iemFa7iy6WZf7BrFEKSB8c4DflB1yI8y6KjWgzQfnBT4Z8nZ3GLs1u/PJL+U2NdZQ8W1WbVt3nA16VsAGXXjMT47sV+6s9pnKx1ip8FGlX+cC0BBGUOWPATIZ9cfvyjSlc6Rr7MCHr9HZW8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwBWMVdOmbivKq+TpJpiqomZTBhMYRsNWxrtvAJKMRw=;
 b=Z+JgZTi37ud90OEz0wdHhNhhNQQ4MQ9UX2o4VxbLBDPHGDNlKN07SEk+QEP1X7BKSdQouBXbGmxbX3cMBv8968vk0DY/35P2GMfAtesj81FfrxKCWg5sufKqoJEM7zM+NDVh4EMj+exwGtiy1oWmQmCEIP8DUiZiePubOFZ8+38=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7010.apcprd03.prod.outlook.com (2603:1096:101:b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 09:49:18 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7409.042; Mon, 8 Apr 2024
 09:49:18 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "wmacek@chromium.org" <wmacek@chromium.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "daniel@ffwll.ch"
	<daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek: Add RENDER capability to DRM device
Thread-Topic: [PATCH] drm/mediatek: Add RENDER capability to DRM device
Thread-Index: AQHahNMKiD//QF7OJEuho/dn90M+ALFeKmUA
Date: Mon, 8 Apr 2024 09:49:18 +0000
Message-ID: <d4b15c6cdec777f8e930473983914ba52457a30d.camel@mediatek.com>
References: <20240402075352.3147747-1-wmacek@chromium.org>
In-Reply-To: <20240402075352.3147747-1-wmacek@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7010:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 20BPkdS3wlRrKByyO3xiGVmBW8X9H0b9Hu8IN6bijgYvmvEuu4CQU8RAuscVIrUewfftcNEEesQuSIZFJZyohXiAXpm11FTjsbyu6rNjlyAAxPYs4ZndkzL/XgVS4pS3c4zuQDWrU9JdU3zHibhKQ00JmAx1fff3WdvhoFVXh2qpkPs3bJWmIraPmSZeyjgDjsaT+vC3CXOHsKfHrverZ5mDVRNfDrWxpvZTE0mmu9As6btdq/dfFQ424mrliQXZol+3ROSuqC3QBunY3dVPLmCQkXhgu5G6Q1PUOVVd5WdZAKcycoPQHi2WbXBbxWOiU3oBCPCvQ7QIh6u0LGevpmzGosl8kBbZrEuJZyE94lK9VdCWqrSuKq2F4SbPyhXIKAU4io5EJofefLhZUCo7ndNPiv96XAnzehCqM/gO0tzhvRw5YQCN8w716cVVVUNTjuEmQxqw9TcUSSpvzwoZBIe0rxy/qigqHmtvJx/OK+7jX0LwluASyhO6oLI5vFsXu/wJ/tl9tRRgAWGhyYs+DQbaQArilMIFATGDmqVmUla4T/Va3gZZYmbZvd1Rc6t/n3fP1YITbjeNAopG/iJYQhMan1PPyOvKWhxw17rsJZbG0u/qCHZrlAiU/+1zK9ekrCD2/8pA7VATjeYAzojl5A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007)(921011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0dGcnZhWDM3VkFnQ3p1ZmFPa2hPZ3lBZDhqKzdCQVpkeWNxVm9rYXlmbXFy?=
 =?utf-8?B?T2t2bnJhMnZGN1hBcXpyYkNGTUVaQ05hZmd4S052cm5ISDBXVk5ncE03UGRK?=
 =?utf-8?B?dS95TTZFb0J3STM3N2FyMXg1dHd5WVZiV3h5OWNBSHF4QlN0SUNaZGNkbVhy?=
 =?utf-8?B?ekV1UEpITHJjeDFnaHcxVitVbWxjeHIvdDFJcGQzN1NCMHYyTmh3S0lGZDZW?=
 =?utf-8?B?bHRXOHkxYmR0dVpBakZld3Z2b2hRQ1dsTk9ZUHVrb2wvQnZScHo1UGNLY3NW?=
 =?utf-8?B?dUlrY1p4TlkvekxKTzdjVVNDKzNHTkM2QmxxWHBEamUyZ3l5RVlSSndSemIr?=
 =?utf-8?B?d0MrcGl3Y244c1NlUTdZY1NJbGVEdzc5MFJTTEEvOXJSb1RHdStUZFl1L0o2?=
 =?utf-8?B?Y2VYWUxXZUJoZHVWa3NhbGZkeUxpMHBMTzN4UDJ4b096b2NYSldreEZYcG00?=
 =?utf-8?B?cG55bHo5MUc3TlZpWnpyYVM3Y1lkUXlRRTVtMnJyRTVtUlpXVzhJYVB6RS9x?=
 =?utf-8?B?b1VIL3RtOFJZQ1p4eG5RQXVxMll3a2x1SFhCcmpCMURuMElNVURWaXpPYTVF?=
 =?utf-8?B?WTBRdWR3aEtyWWZManBIVG44MGJrNExQMENKSXc3R2loengvNTZMRC9Pekhr?=
 =?utf-8?B?cFdYdFhDRllYVmgzMW5acUpwMTdmcXdEaVF0VitzYmhKQklxZG5WcUl0a2lm?=
 =?utf-8?B?Ym9hTCtRTjFMdmpLWDZaU1c5Zm5wQkVnbm81Z3J3SlRYcFZFbkJsN05qdU1j?=
 =?utf-8?B?Ums2SnZzQmo4SnBrK2w1RkFCVUhJRjcrRDF1bzRjMXliNGFKZG5ON2FwYTdC?=
 =?utf-8?B?cjlyV2lXWnV2OGt0WXFQT05mNVVzVGJBVi9kTUJ1UU5ncjVsWi85VmI2VUhh?=
 =?utf-8?B?UTh4R2JTZmpsZHhwKzJNSUNWUWljRmN1VFIweEpvWnhBSC9OY09NUGRvb2k1?=
 =?utf-8?B?Q3Q2UllJenV2WlZGdVd0ZTdHODlLRzZsRnpMMjBqOTR0ZjRSQ1JZcEUxd0pH?=
 =?utf-8?B?WU4yWWNMZVQwWFhVdmRZajZJSzA4eDI5Z1RMY1VRMnpsN21vQTZVb2lGaXo4?=
 =?utf-8?B?QytCbVc4d1lSS2Y1LzNxSi9yOElZRzgveWEzMFB5MCs1UldpTkpEM2VGWEJt?=
 =?utf-8?B?QkJGU3BQWTBiVHpxNWptZ3Zrbjg3YnBxUDNLVlFDV1hSR1MvZW5zbzYzWGVQ?=
 =?utf-8?B?WjVacjJibkl5ZGFRMzFyZFN4cjVhdWVTOC9zZmtrRG5Ec3hvWmN3UkdlU3FR?=
 =?utf-8?B?RHZ1d0NsaU1lSzhBZFZhQVlFaFpzRVNQeUxZbmx5d0xyZWljaVA0K3YxWE9W?=
 =?utf-8?B?Rzg4RUIvQlVKMFhBN1VIUVlyQkxOVlZTTTNid1UvalAzSjhGM3FwTHFhMDEv?=
 =?utf-8?B?SE9sbTRMZTlXaituYkY4REhXcTIwU3FWYU4wV1RjVGk1R1ZQc1hKNEtQSWtC?=
 =?utf-8?B?QUxxNHRXQTRwNDYrWFZxMDZVUXFHTXAvUHp1R21HNTFvRHcwcjg3OHk4aWZY?=
 =?utf-8?B?R09US0hNVnU2R0JiT3J2ZVpJLytnRmtJdEJPRC9FL0xNYWJLWnBKK3N0VDJK?=
 =?utf-8?B?Y1gzaDhDWnY0SGJKK283NlpXbDNTWnJuZ0ZpUXFlVXA1VmxBRk45OGJIaXFk?=
 =?utf-8?B?M3NpVTR3RUI3ZjNOUXBFREtEa3NzSlN4WGgrL2lVZjNzMlFFelBERCsyTWxY?=
 =?utf-8?B?OFdjNnRiczBRNTFxa2NQQXljV1gvbWdNaXZBWEVlV0x0SFgzaFpGbDdiclZq?=
 =?utf-8?B?ZXlFamNpd0ROc1dieFBZOXovMU1oQjBUUmtUc29PdkswbGhMUEN5cG14b01F?=
 =?utf-8?B?Nmw3dlZzZTFNVUxDRW5hTjlleFh4cXJCUzFXUlpMdlZoR1RuUG5HRWsrQjBM?=
 =?utf-8?B?U0JBb1M2ME1kNW9NdUFtc3VwWmorQ3RqNUlkSHFSZ2JpNVBka3BxTlNmUE84?=
 =?utf-8?B?clhaSUZBMVA3R01BRmZ2cmFKWVcvNGtFZE1TaExMczJUM1lOczlrdG9LSGVC?=
 =?utf-8?B?TEYxVE93bzJtRzZmVVRWNVlPZXV5eDMxL3F0aHN3VEpyVUxPQjdtMVVNQ1Nn?=
 =?utf-8?B?dXZ4WDhRME85a3NxYnMrbUZxYXJiU0RTcUlteXUrU1ZRWE9TeE10a0RHeGsz?=
 =?utf-8?Q?H0bgl1qGDQui/ftb9mV3ghET2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8610B01B57A394B8568D85D836BDD44@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd84400-c3ba-4a73-01c6-08dc57b128eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2024 09:49:18.6643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hNptbwWsp5ejyD7GJU0noyJCYv/8ZUFu1odWaBP/1Ssh90/9fRg9Qk1HJyAKxe9ZhPrMg0JPrFN2hKF4sxlo0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_030006_885955_C25BD41A 
X-CRM114-Status: GOOD (  17.70  )
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

SGksIFdvamNpZWNoOg0KDQpPbiBUdWUsIDIwMjQtMDQtMDIgYXQgMDc6NTMgKzAwMDAsIFdvamNp
ZWNoIE1hY2VrIHdyb3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90
IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gIERSTSBkZXZpY2Ugc2hhbGwgY3JlYXRl
IC9kZXYvZHJpL3JlbmRlclhYWCBlbnRyeQ0KPiB0byBhbGxvdyBDaHJvbWVPUyBWTXMgdG8gYWNj
ZXNzIHRoZSBPcGVuR0wgcmVuZGVyaW5nDQo+IG9mZmxvYWQuDQoNCkkgdGhpbmsgdGhpcyBpcyB0
aGUgY2FzZSBEYW5pZWwgbWVudGlvbiBpbiBbMV0uIElmIHNvLCB0aGlzIHNob3VsZCBub3QNCnVw
c3RyZWFtLiANCg0KWzFdIA0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2Ry
aS1kZXZlbC9wYXRjaC8xNDUyNjExNzUwLTE2MjgzLTE1LWdpdC1zZW5kLWVtYWlsLXAuemFiZWxA
cGVuZ3V0cm9uaXguZGUvDQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBX
b2pjaWVjaCBNYWNlayA8d21hY2VrQGNocm9taXVtLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8IDMgKystDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBpbmRleCA3NDgzMmMyMTMwOTIuLmFmYTRkNjM5MWIwOCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gQEAgLTU4NSw3
ICs1ODUsOCBAQCBzdGF0aWMgc3RydWN0IGRybV9nZW1fb2JqZWN0DQo+ICptdGtfZHJtX2dlbV9w
cmltZV9pbXBvcnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gIH0NCj4gIA0KPiAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fZHJpdmVyIG10a19kcm1fZHJpdmVyID0gew0KPiAtCS5kcml2ZXJf
ZmVhdHVyZXMgPSBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9HRU0gfCBEUklWRVJfQVRPTUlDLA0K
PiArCS5kcml2ZXJfZmVhdHVyZXMgPSBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9HRU0gfCBEUklW
RVJfQVRPTUlDDQo+IHwNCj4gKwkJCSAgIERSSVZFUl9SRU5ERVIsDQo+ICANCj4gIAkuZHVtYl9j
cmVhdGUgPSBtdGtfZHJtX2dlbV9kdW1iX2NyZWF0ZSwNCj4gIA0KPiAtLSANCj4gMi40NC4wLjQ3
OC5nZDkyNjM5OWVmOS1nb29nDQo+IA0K

