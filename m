Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC995C54E71
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 09:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNttkLrrNKOu2wQ5/rjQFTz17cxs+R4Kx0+EcL/j3wg=; b=F18lKmV0EYZvPROW8tFzOApHll
	Aful6IP6JMmn4EQbJS+Pprjbcy5TBr36vTWSrVlwj9/sHFM8nsdkw2kBGn58wuxhkM6WMa8UA6tIl
	OyuQVMYfkZe+e1jriVXP6nLYBMYFvWCJbT9ymjHjLyzi4e5Y5xcOM9VjHBPlGS8RgFG5AIOvkTJC2
	fgm1YdeDK40FZfgXNrDFisPLWEhb0SGLF76i3OXJZJ/nvI9kTnVNRKX1LNLOOG8j88hakR2Ttlotf
	RClWeughhYAdPOGhs4BKYE2knWF65xsVVCUWIQJ2RarX8O9okG0GS4sGu3Ff3FdQzZCqXG9Pik6y0
	unAhXiWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnbGj-00000006bCi-297R;
	Fri, 22 Mar 2024 09:32:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnbGV-00000006b4O-3ANu;
	Fri, 22 Mar 2024 09:32:47 +0000
X-UUID: 1ed9c314e82f11ee9aa9374d6d45775a-20240322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=gNttkLrrNKOu2wQ5/rjQFTz17cxs+R4Kx0+EcL/j3wg=;
	b=muJeLPICLpFuzwIgg+0CLGm8sbHCXmP/mItPOm/Ze8L8Hn9eXOzZ+KKyVgHYNvM4+LN8GilAduc70ayATAvAvzDTrSPULEJ+y9ZN+BTPxrYwpgmqjP1TKS6vXNdRsd1fH9CN6nuyApZ8rAYuaTqxnUkU7s+CmkhN3dpL/KvW0k4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:1d91ab63-95b2-4b04-9c33-92eb503c73a8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:6c82b690-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 1ed9c314e82f11ee9aa9374d6d45775a-20240322
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 751619785; Fri, 22 Mar 2024 02:32:37 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 17:32:16 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 17:32:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQHVT8FPi76i5UE/aVNcbHS8NwxWdCGgzyIQ1Bmx/dsHvmF5mPkLU9iCA7t3D9M9+hEQwdRwPtK5R7TcHRSJvwG96tRFcaCFb+8AVX8siiorTJYDGPsbuo6V/dyDvYSHub+6BzTmFdZd2XrzZlrNc6Js3/BCM2o+p5/5ztETgkfMOAOzGCVnDsevb+/BsvIuEoAHv8CjgGsxCMHqrbuDBXkNmBvMct/mupiLMtiqQhwmP8eAY5YcJeOVgYH+ZAIMNUaknmwuXP+5cc+PqLVcdDDWZw/WCYmXtRlwkuK+Y9VfY6agHTfIRvAYlp2O1PeEefCVY7s+p7/9Zje0aaEZwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNttkLrrNKOu2wQ5/rjQFTz17cxs+R4Kx0+EcL/j3wg=;
 b=kAJNBikbEr6Ef8YhPT1DOKxbEOxfXfjcQmD1kBpYRpT+aApwj+hqyYwMBoqgIzhkxD9bm4X0z13xiFEbhECXtQGbRzBNjJOGxuHosPbrz6r3DK4dJ7gieBxczoQVIjLOW8WRRyJsv52nptTlaVt+GmLmNx3EPrkA896IWVU5q8gWZP8LkXwJV/nf6mVL0IVJr8hf7ISEeoAbTzp8oBAEqx4oJg74Y7VpBN2qmXwGcPSvqMjtSqWNSTU9Fyh4nHmICN6f5Aj3XhNKHXD6cmV1UBiWYKpATc4nMJ81bwo7Vqd02UDWeuhFuhqMOQGnnTobHPcRtqZMT/gyE8y5744Lxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNttkLrrNKOu2wQ5/rjQFTz17cxs+R4Kx0+EcL/j3wg=;
 b=lU0/JNZKZ2WJufQ0e3bwUaX73tHw0sDNZ9ZftG7iHG+FeNz/qOFyOOm7L913R89YWiUsaefT0HSOKwDab4HkpsSNK3jsE7bsuISVCDmdDo5YyoDssgQoAFFYka+0q+l1DBHOSiIKUk2zoj5qihOakMSDCxJUD/7WdfCvLzEJHic=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB6916.apcprd03.prod.outlook.com (2603:1096:101:a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 09:32:12 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7386.031; Fri, 22 Mar 2024
 09:32:12 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 10/14] drm/mediatek: Support "None" alpha blending in
 OVL
Thread-Topic: [PATCH v6 10/14] drm/mediatek: Support "None" alpha blending in
 OVL
Thread-Index: AQHafBnwOC6lvDyCyEuD+Ookmhlan7FDf28A
Date: Fri, 22 Mar 2024 09:32:12 +0000
Message-ID: <306cc3a44aa94d9948e16216c337c5332b98fcb0.camel@mediatek.com>
References: <20240322052829.9893-1-shawn.sung@mediatek.com>
	 <20240322052829.9893-11-shawn.sung@mediatek.com>
In-Reply-To: <20240322052829.9893-11-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB6916:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cDImwK0VWAsrCL5YN5v8VpSL5Bs2S9Cc3WesBbqtDs7/1tmlSGA9QrNIRzssPXEEa2SgiPYXqDDVcX46Ebwfsnh4zWeW9u+Jj6wiPc5EzA7EDjsU+2LCEesTIcgOThL41XG1Z4lqVWgjcKjaHODtiPd1DO0CDmY+9YmHIhT21lXnHuMGJ+702LMNyWfbmRr0akM9ETjqDEdHUq9YnWa3h51QH4vZkH6xwpkPhX1Vfj1A6xdU52bbDmBu1LUz7KHEZ6SZNiQdg8OzJEfs1aFM65xcE5eN1S1cSn2zYdpbc+9Uh86iNqMpYtz1kdtBwYKIw8zp+daYf2kOqrDxgNnqGLgMqLuBZAO9zeCvR86/Wu5OHZ+9TfVNZbevycXHmHvyTm+QuUDy3z+RZhsSO/CCfLSR92sFHk/n+eFDYn6y63gJqzQlpg7SmU8L0/OQDp6zeSAjIhatIUmes5WBfxA7v+KsaRqvGXnpxf60R2mAKpfD0xjLgytOk2W/du8tL44JBmbhR4zhRKJMfSoKKbWtmCzfnErYLY+NQGisnZpa2bILrwcmMS0AcGge2bzkIbqw8fxTRgBT/zXu46XYHEHptXc2mXSlP/nMrgonGQoeF0F+rYMvNcl4/PMYyLXDluitkqiQ/Qz49e/gFojGW/zH/0vBF4VuU5diJaHqtf+5kBo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVBmRi9zRkV1MVpQMVpqczBOek80WklaSm1sVmtTQ0YxRzVIZWYzSzBBUUk4?=
 =?utf-8?B?YXNtcTFGTmMxaGZHQ2F3TFVBVDYvelNBRCtoN2dPMGF4WXhkVjd2cVBVK2tC?=
 =?utf-8?B?dnE4R3pKTFZKUjA2RDB2cWlwWXp6bE1yYVo3eFRyQ1VBS0ladW55bXBIekx3?=
 =?utf-8?B?ZC81OTZzTlJ4Z0g3NWN6bGQwVjJiNlVaMGVJMnl3MGFzcG9pbXhROGNKNEN3?=
 =?utf-8?B?b1FGVWNGd1VLUURXSU9STkwycFE4QjJRSjdQb0hmbDFQVFJyd1d5WGMxbGsx?=
 =?utf-8?B?ejhmKzN4K25jdEd1bnV1TlI3VDF4dTNzQnRRMit1cUlSNERHVm9wUTZOc245?=
 =?utf-8?B?aEx2K0lOZkliQzVYLzBoWmZQZlZqbVlNdXMwNzd0bVBZcmZkRG44VnQwSUhu?=
 =?utf-8?B?ck4vR1hiS0UyU2draW0wQU5DTFVmeFB1YmQzVzBrbXJRLzVoY2U5VnJMZzVl?=
 =?utf-8?B?QmYwb25YMTV1UURibi9KUi8xV2ZSN0Zob2hlVFZLcHNZRFRFZmhpNGZpb0M3?=
 =?utf-8?B?dll6Qm9DVzJkei8zTWNlOUpNeUhsS0VudmtZOHQ0TlJqOEVXYTVvK2djYm9u?=
 =?utf-8?B?bE9sZnp3Z0FHazJyemE1UnRGZHNPMU13Z2VKaVdOK0tIZ2NIRXdEeSt6dnRL?=
 =?utf-8?B?ZEc3ek1RVkMzWkVIN0diZUQ5VG1Ec0UrMXFzUnZWVXpBY1dWak0rbFlVUUR4?=
 =?utf-8?B?RjVUQVlHWEpEUEhxaXdOa0VwamVGZVIrRUxMU1BUdHA0S25SQW13bUJ4UTlU?=
 =?utf-8?B?Yy9TQitjVUFINnRlMkFOK1hNSGtiem9XNTBkNHpsM1Z6OHVUQWw2SURMSzZT?=
 =?utf-8?B?WUk3SnZ1WGpxUUQ0NTFFbG9WSXI4Umg0NlNsSnNyWGVGYnJ6NDZaK3pwK0pD?=
 =?utf-8?B?VU1iZ0JwU0VlbmtDNU04VmNrVkRFeHZUOVIyVHhxeE1OSkR0OXhUWTVMblQr?=
 =?utf-8?B?THFGSjJJWlJWeVJrN1FJdWRTako1QzNEaVVVM2RrOEcxVENGVkxMaEQrQ04w?=
 =?utf-8?B?Y0xYKzhYYmRQa1RKYXJWVWFEK09QNFdGSzFQelJFMnVCenFibFl5clhvQUJt?=
 =?utf-8?B?OWhzZTZkQ25XTTNZMm04bmxHeUhQMnMxeW1Hem53WUVnQnJWcHB0YmxvakFB?=
 =?utf-8?B?b0hmTVJUNFRTNWYxcld5LzFtdTM2WnAyRi95aHFGa3hyRWdXZmtIcEYvd0VV?=
 =?utf-8?B?YlRuTVdNSjYvaE5hdTBWbTBaTVB5cnlIb00wbHg5SUIyZEFsdEhPakcrTkNz?=
 =?utf-8?B?ZzBYa29HZHFuWmJJVWNBRy9NRmlROU9HUkNYdkIrWWh0K1orTkQzaEpGeXAz?=
 =?utf-8?B?dXdPNFVwbzR4VHZiUlFyMGY4Wnk5STF5MElodFhFMEdNMEp6L29vRWVKWXFJ?=
 =?utf-8?B?R0tqeEkvOWdYUXQ2N3U4VVFKQ1E3TlNSSXRtM3o2ZzhFSDV0V09SMkdDTW9j?=
 =?utf-8?B?U3plZVFDT2lIRFB5OHdyNmZ4L2pyM3VxVnR3L0YrT3RkdlJRcG44YnFMODlP?=
 =?utf-8?B?cVhQQXZHeldQWU9FakV1L01Vb2tPS0hwelBxQVVIZ3A0SFExWnNKZUdtcm9s?=
 =?utf-8?B?bFRod1k3Y1ZKZVlyVDNjcWxFdW55cENyUGtnVzM3Q3ExQzVTcWZ0WlB5L1hi?=
 =?utf-8?B?dXpmVThWQ1VqQzIzWGxCaHhKN3NUdDBST0QzWUdrTGR0MkRHTi9GVXVldXM4?=
 =?utf-8?B?cEJyRXdvdnVrN1ZCRkttR2wyTTVCWm9QaFhCakRuMGdheG1iaE5nK2lNeGN3?=
 =?utf-8?B?RS9TY1JWS0k3ZjROUjJ1UFdRT3hkclVISGZZenFsdXlidlVaNDBkWmNXWVg1?=
 =?utf-8?B?eFRmRkxZZmRLK2dPbWlpMXVYeWllZmgrS2Y0eEJETjZmQTA4TFVlL3BYTTBL?=
 =?utf-8?B?UG1kZVBkY2FjZzBXNHRBTWU2OWJkSWVrbmp0d2dhVzByb3VEY0hsaHBXSEtS?=
 =?utf-8?B?a1ZSeWpmSXAxM29pa3N3M09PR05XN2VUczhkZWF0T0dmR1l0MjJWU04zeElZ?=
 =?utf-8?B?em9waUxaMGlCc0pHaFRaYjE2SlkwZ1J4SXN4dmRmbXhSLyt4b2N4TmdjNFpE?=
 =?utf-8?B?RDgrd003VmZMcWdub0tBdEtuUWtpd3dSblhsdENqbG9tNmY1ZytXWkI2Ym9v?=
 =?utf-8?Q?gxspywriCcYpbiCqMYSjP/rb/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <96098E374A355749BC7123C211004531@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e21c9c-95bb-4705-25ba-08dc4a52f478
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 09:32:12.8435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BPKH19I8SHG4h1snKGwU4WmsU589xka71bMFaCvCJQ5yvRmwDCLuU6D3Tv5DcSNlOBw4Nwb1Qc8vB/PXDDsFEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6916
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.091800-8.000000
X-TMASE-MatchedRID: O/y65JfDwwsOwH4pD14DsPHkpkyUphL9X4GSJGyYc34J5zM3dzkaQbJn
	Ph8w+R5oxpWxmut0txol6rr8933abhAq4jU0QZlBY1bQMCMvmn6eEP0DdJrullxTR00Ss4P62ft
	v/5jXki/BEdhLue3lb8yG02AZrBdlPz62uxDLhUyeAiCmPx4NwMFrpUbb72MU1B0Hk1Q1KyLUZx
	EAlFPo846HM5rqDwqts3cWCfjxMjTqV5+A/rjswtBN0o0lAQ6Zz29lc3OpRAvsfUQoig0gFg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.091800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 60A243C6684DE132BD94048AAE052062549B2077BD83DFFF6F077E23B83C5B822000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_023244_055124_05F9514F 
X-CRM114-Status: GOOD (  16.80  )
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
Cc: =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>, "sean@poorly.run" <sean@poorly.run>, "jason-ch.chen@mediatek.corp-partner.google.com" <jason-ch.chen@mediatek.corp-partner.google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFNoYXduOg0KDQpPbiBGcmksIDIwMjQtMDMtMjIgYXQgMTM6MjggKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gU3VwcG9ydCAiTm9uZSIgYmxlbmQgbW9kZSBvbiBNZWRpYVRlaydzIGNoaXBz
Lg0KPiANCj4gUGxlYXNlIHJlZmVyIHRvIHRoZSBkZXNjcmlwdGlvbiBvZiB0aGUgY29tbWl0DQo+
ICJkcm0vbWVkaWF0ZWs6IFN1cHBvcnQgYWxwaGEgYmxlbmRpbmcgaW4gZGlzcGxheSBkcml2ZXIi
DQo+IGZvciBtb3JlIGluZm9ybWF0aW9uLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1l
ZGlhdGVrLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hh
d24uc3VuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kaXNwX292bC5jIHwgMyArKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3Bfb3ZsLmMNCj4gaW5kZXggYjFlNWQ0NTMzMTZjYy4uYTkzNmYzMzhhYjc5ZCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiBAQCAtNDg0LDcgKzQ4NCw4
IEBAIHZvaWQgbXRrX292bF9sYXllcl9jb25maWcoc3RydWN0IGRldmljZSAqZGV2LA0KPiB1bnNp
Z25lZCBpbnQgaWR4LA0KPiAgCQljb24gfD0gc3RhdGUtPmJhc2UuYWxwaGEgJiBPVkxfQ09OX0FM
UEhBOw0KPiAgCX0NCj4gIA0KPiAtCWlmIChzdGF0ZS0+YmFzZS5mYiAmJiAhc3RhdGUtPmJhc2Uu
ZmItPmZvcm1hdC0+aGFzX2FscGhhKQ0KPiArCWlmIChibGVuZF9tb2RlID09IERSTV9NT0RFX0JM
RU5EX1BJWEVMX05PTkUgfHwNCj4gKwkgICAgKHN0YXRlLT5iYXNlLmZiICYmICFzdGF0ZS0+YmFz
ZS5mYi0+Zm9ybWF0LT5oYXNfYWxwaGEpKQ0KPiAgCQlpZ25vcmVfcGl4ZWxfYWxwaGEgPSBPVkxf
Q09OU1RfQkxFTkQ7DQo+ICANCj4gIAlpZiAocGVuZGluZy0+cm90YXRpb24gJiBEUk1fTU9ERV9S
RUZMRUNUX1kpIHsNCg==

