Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBD4C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 02:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvHgeOwSj+S+rkc74+hxJVwhS1oGA5bYXD0eeAV0q9c=; b=bQZlBO/JNBuSIcd4gfQtx25aAc
	L3V01LQjzkYnAaQTpAF1KUEQaxFz208q8bG/JN2V8gEnvwSfSSt4T3FfbRjYr1v6wP9tSnM8jTy/G
	mfRsoieHnvlAKTvgnsJV/Gnv1qySjQ/PO1s4nwx1jb9r1By1sNPfHBX3RrP9J/zKhUOHBUWwW6oZ6
	16c+DRD0LuqfbJsf9Ozy5IDFc/mj9fXxN0oI+jmt77T8TgzQxt/AaViSb/WpGXR1zFRaKwknMM053
	sT/CSspSnfMBD8BpoIIN5avPrnBlC/4KpDI3/cQVe4vCp3OBSx2R8Znr/Rkmc00jZp/gM8jN89QpY
	B7duVoDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owwBJ-008OUk-Ot; Mon, 21 Nov 2022 02:05:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owwBD-008OPN-Kw
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 02:05:05 +0000
X-UUID: f459422473074909bc1ee40a7073654a-20221120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=qvHgeOwSj+S+rkc74+hxJVwhS1oGA5bYXD0eeAV0q9c=;
	b=rDwtNIbB/PJJdRyIfdtPjitcYQZG+v1UJMbUR1DupX2eBuunJ5ie02ahhMfL2shFZdiOuxdjz71wFfGhqP4FMMYlhG+eVBpgoZHVjRgCcr+nAAk8xF0umkOv/v0xJ2ymP0Q2T1S2XKWwaSnl2AOfJ0qjTWw4kcqBxGecDxaSNS4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:245f9044-b2b9-4d99-a519-0f0911c3b123,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:b5bc4f2f-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f459422473074909bc1ee40a7073654a-20221120
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 74434788; Sun, 20 Nov 2022 19:04:58 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 21 Nov 2022 09:14:24 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 21 Nov 2022 09:14:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/2BhpqakLjhlsLIh+4jm3YU7qdAXXrI50IQipeOWEMS/VDZJLJtWqxwj2WJel5o6jrjNBMm6P3xbURYiMuPZFTSDslqhQnB1QCJlZeTnrqn4FhQOTj1BO/DYD/EmUFz1K8CyBCa+OJaJ5FzO8XFkHR+FwSoxUTWCzvHLgBwUpAvnakrlQ7bOSVr/Dq7qJfF7UIlI7rfdK16EQh4WlnZflJZ7n7tDS6+vJXe+L0Ok90sLp1AmmiHi6GQ9W5wboBBQEU+8wQzTfb5oW+WW5xcKqWWCxJ+H5LX0vlmD2ptqPgFtC7aTChiL30qwluehJp9SNT6/r6W0ACjEyC6RfJRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvHgeOwSj+S+rkc74+hxJVwhS1oGA5bYXD0eeAV0q9c=;
 b=ZbdT5m2j7PjBfQtXFJsuiB07Zh7gP0F0PGmh+A0y5ArtGDK1ads33lboddFXUaa9N4dxYxtmOMXmfMfvZ62djn888q9OqSGwZsr4mxR9Hf5PIgfcrw9HgurgOMllahVrVCZDjkJpyWmy10iHodJZGLYUMSopiv4T3Oh5My8DNOsfpb7XQRarbNF89A8lwHeQhlbBGN0qSsf5Xt6uMZ82s0nKMJqfouSuu+P/t9okXFCOfeuHEiwpsBgd/OXhziROUhPdwQbxKTBz8EW2FuCm8HDJQKHcwsT10CSo7rNljF/o790wyoHTo7tHlExHlNSUJK/T6bkMpisCMJARy6612Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvHgeOwSj+S+rkc74+hxJVwhS1oGA5bYXD0eeAV0q9c=;
 b=o+FUqZU61+ibN2EzERSiDvturrsxfus1Oby0YaAwBK3D4+6vQsxzE7yVg5T4zkrXmqOw/MusCvx5pcgDnjSw1F3IDuDK8l0zy+RCwA/lL+KFsE4HJPUih1LINEWB3X6o6qfTgZ4AyMJpnnVfy9D+tvEQR9C3iwzsVKhLYBBvNLo=
Received: from TY0PR03MB6354.apcprd03.prod.outlook.com (2603:1096:400:14a::9)
 by TYZPR03MB7204.apcprd03.prod.outlook.com (2603:1096:400:33a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 01:14:22 +0000
Received: from TY0PR03MB6354.apcprd03.prod.outlook.com
 ([fe80::3c4f:5697:636e:56e6]) by TY0PR03MB6354.apcprd03.prod.outlook.com
 ([fe80::3c4f:5697:636e:56e6%4]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 01:14:22 +0000
From: Ryder Lee <Ryder.Lee@mediatek.com>
To: "lorenzo.bianconi@redhat.com" <lorenzo.bianconi@redhat.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	=?utf-8?B?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>,
	"nbd@nbd.name" <nbd@nbd.name>, =?utf-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?=
	<Evelyn.Tsai@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 2/3] wifi: mt76: mt7915: enable .sta_set_txpwr support
Thread-Topic: [PATCH 2/3] wifi: mt76: mt7915: enable .sta_set_txpwr support
Thread-Index: AQHY/Rl/DkiubeyhWU2ULuPBdZ8x8q5IUfuAgABA/YA=
Date: Mon, 21 Nov 2022 01:14:22 +0000
Message-ID: <e523c250ca77e839506dc1026892feb2ee636b1b.camel@mediatek.com>
References: <c73db8d9bb03efe8cb403434aeedad25d958e258.1668973479.git.ryder.lee@mediatek.com>
	 <c843e72587751adf0438f6e85de9e9c5b8323bf4.1668973479.git.ryder.lee@mediatek.com>
	 <Y3qaafXBuVgjxXR2@lore-desk>
In-Reply-To: <Y3qaafXBuVgjxXR2@lore-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6354:EE_|TYZPR03MB7204:EE_
x-ms-office365-filtering-correlation-id: 96c6757d-703d-4cf6-4ba9-08dacb5db90f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: neiiGE3kxPFG2K92Fz8AHQI0DjxdOILidOEwp+zQQ6T25bNwpAqo2ytQ7Gf8PDbBhJIaO/t3bpbSJeu+bzatDrlZzD6dAz+J98rUHsMGzTzmxBFy+W3VM9aNdfbVPcs2Rlu1hI/lG7HO2vloHHBOXn37OPIX3qKEuaYqdjLXuMG7XyNpKY07kRVyEuuqhrrvV+UcAgpGMjDi6IxIy6T3AjdGE1EGvBzW7hciEK3cYmxooRZTew+JJFmgz4I8EvNJkosbSf8muLEAhKHxnvajYFZ3hgJwbUL135Se6RCD1iJkxf/aikpHdvvz+eU+0bzEWKXtUFEoSj7Ky4zzXcpXAQ+q8LnYA2O9sjcuvhZyfQ1tfzAXG6KRVWigHoFIm0fIr1Cn3UcxlETn+2ilT0QYlb5/qeGPLacnOzJJdbZf7zepZg8ozGwkomSg3E+L328QaUv9sdOcJJc35eKQhB+P2dHfTYTuwiC2cz9WBvc3maAohUS1yO48erTjl6dF6gZspoh1cemvkItZDYdFYMuxsp5JlT/UTJApvrmCcztZYO0XoSvDfo31OjguTzmuWMBoh5DuT1yJDsxmmNRFhSnxgNFr05c4W2NBg/knnIxPe34IKh0rJAcuhbr6b+r2+FXCdwOJoH+88XfztBg6i866IDx1dJVv/HvwA4POSEFld06xfhlLvm9dP5q8PtU3i1T0yW/8xiuJpV3JireLsc1lFyU/1FZlLXgG2aEtUZZjuM4jLPLYd7s+HIMGbnr/6hMbMAqRbZ8CzNN76crl8WI6RA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6354.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(366004)(39850400004)(346002)(451199015)(36756003)(8676002)(86362001)(38070700005)(2906002)(4326008)(8936002)(4001150100001)(4744005)(38100700002)(122000001)(66556008)(6916009)(316002)(54906003)(91956017)(2616005)(186003)(66946007)(76116006)(6486002)(478600001)(5660300002)(66476007)(66446008)(64756008)(41300700001)(26005)(6506007)(6512007)(71200400001)(142923001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bklvSXR4ekYxMElvMnh0OEtkOG5oSHhOazFRRHJscUw4RUFXYzh2b1laNWtP?=
 =?utf-8?B?OVQwTmNzc2lvNkJSK1YwYzNleW1zMnprazR1QUdzNGE5Nkd4N0tlMVNRTzRo?=
 =?utf-8?B?QlpVc2FjQWtHdGdBRUZZeTJSaW5KeVU3OVBjOXZ3dUNHNnpScjdVYTdFU0lN?=
 =?utf-8?B?R0xmeEd5VEZEREVFTEJKSmpnL3EyanF5dkJyeXFGaCtKSElkVGVyMTVDL3RC?=
 =?utf-8?B?RXF2Y2Y0SXVOcktDeWcyRXp0NkduOVhLL2V5Vm90ZXRwbHhIL0Qxc0V0L0pH?=
 =?utf-8?B?NUtLWkt4R0ZLa1hIM29yNGx5U2NET21NWGVWOWVhVnVWOFdicVh4N2F3aExm?=
 =?utf-8?B?NU8yUTJaRG9CMG43WVE4cWg1UVhSQVhRdEJzZ255MXE2T05VSXRhUzVBc1RJ?=
 =?utf-8?B?LzBvaDRaYUFGV1kxL045VkF0SXhUM05MSHBNZHBsbDN3V1I0RWZuU1hSbmNz?=
 =?utf-8?B?UWJucmlialJPdzVTQThnSEMzUDlCa05lQ2pibDNFZGIxSjArV3p5YUlPK0k1?=
 =?utf-8?B?NmMwWlVPeVgvSWUrVG9PR0g4aVdBSU1QZzA0Wjd1ODIxc3pCanpuNTI0MFk1?=
 =?utf-8?B?a29XSzBxMThnZ1d2OTJlQjJBL0JISHNQbmRTM3BWQlUxa3FZRGVsQzJNcmpw?=
 =?utf-8?B?NThUUFpFTlA1VjZPK3R4ck1LQmlEd3NSVmNnc1U0UkRDeDRDaUdSaENPeEM5?=
 =?utf-8?B?OSsvOGNrY092WkdMSEFGTHNEeWJxVm9FaVZnSEE1WDYvTloxa3lFWmNuOVMv?=
 =?utf-8?B?TXFFZm9HTlN6dDhLN1dsNGw2VVFXSUtUM1hnUmxFMURoeVZmaTlIWEpvdFZL?=
 =?utf-8?B?Q0R1cmFUb3hBZFBzMENjTVE2MFo4MFVpUEE5Uyt1cnJJbUlyM3RJckJiUEs3?=
 =?utf-8?B?RlN2RU5QUEdIVDlmZmlwLzNmQ3dHN0hyY0lnYTdXWU9OUHZ4eWJLamhRVFdQ?=
 =?utf-8?B?OEdDeXhpbGpCNkFtTnFwYUJLMjlOWFJLM0lFdWJ5Q3RHTGpNUXRTNm9qMTlQ?=
 =?utf-8?B?NUE4VFJnaXhEZlhTYm0xdnZsRFI5VDJmUnN3SHhtSnVvQW9nSkJNRWdpclN5?=
 =?utf-8?B?V1FKQ0tpM01KUC9UYzQxR2xSdDN2SzBkN1QwZlVLbHBqSFJQNkh2UCtRWE9j?=
 =?utf-8?B?V0dUK2dkQm56NCtjcWN0eFVJL2p2TnY2YThWZldsSlJRWU5IWm1lSEI2ZHdN?=
 =?utf-8?B?MnpsajNMYTBMRXgrb3VhZys3Sy9nbWh6VmJKU09JU21EZm1uSXhLL2xFQ20y?=
 =?utf-8?B?NTN4OU5nMzFzTWd5MmhsRC9xcDBhTE0vbTJaM2MySjJJbHg4SS9WZ2QxYnYz?=
 =?utf-8?B?MHJXQkh6MWN0TldSbFh5SnlVcmZ5dGo2Z1ZLZ1lvUkZhbmZyMEU3VDFpOXZa?=
 =?utf-8?B?ZERHNm1FazUxcElZUnJCY29hd3dTTkVmU0tHK3dEMmJsM21xMkZ1aHBPa25v?=
 =?utf-8?B?bmNubEs1UHhEVGtaZTg3aHRDamMyaEloeWVGS1dkYS8remRVUXE1Z0gxTG5K?=
 =?utf-8?B?QnJTOWdnV2ltdU5pQm1vQlpHallzakFzcWZvallCN2tlY3RTd3FIbTluL2Nj?=
 =?utf-8?B?ZVp5Wk1uMnFFMkdkTzk3UHpkcUpialRzdEtYeGl5andraUl1OG9CTUtIa1F0?=
 =?utf-8?B?OGxXRFM4RHdjcUIzUklyTjZWTHVJbkRLOXdZSTNIZ0pURkpCSUNQSVNrZWRm?=
 =?utf-8?B?MUFpOEtabEJjQXIxSGUzVllOZXFnNWM1VGRnNGh2dkg5U1QwaVhsTTMxOWFw?=
 =?utf-8?B?bW9vL05aNXFaMHRsY0V6Rzc1a2ZwamMxbFVrYlNEbDU0a1dPci96Z0ZQTEMx?=
 =?utf-8?B?Snl2cGUycHY4K2NuNmF5ZHBQejNmTVdPc3NvMjlHVmJiMW8rc1F6dDhXVjZD?=
 =?utf-8?B?RnAyWDhuZzAwMDVxMk90UTJFazdzRzRvOU1ZekZrcndFeitBNG0vekFaNHdK?=
 =?utf-8?B?SXRWLzdwQWt4aHZSMlBPc1BhOFdkSXp5Qnl4WVpvN1NLUHRBK3ptNWUzRWlv?=
 =?utf-8?B?UUdyZ2o3Q3VNTGxEV1RrUlpOUS9qK1U4SFlHdEJGYy9hcnQvMkZXNEY4Sytj?=
 =?utf-8?B?c1BWN3UyYWhvam5ReGZlSlhQWHY5NzU4YVp1Ukg2RTNJbnVuWklLZHNPQVJC?=
 =?utf-8?B?TllJL3hkaTI5WXVpbDRQZGM3WUN3YnNwNFdSaXNaYWJXeGh6dElRTUJPbEFR?=
 =?utf-8?B?Z1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34B75C7B3305AA40A784684B86C6FB54@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6354.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c6757d-703d-4cf6-4ba9-08dacb5db90f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 01:14:22.3062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6s8FjDirMQgZB8QdQj+pDq5yIM8srxikbpfoORudes5HNYKPmoYJ+5R0mi5DnKVUiudD9dk4uvqYtRw/290GQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_180503_992583_58582884 
X-CRM114-Status: UNSURE (   9.82  )
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

T24gU3VuLCAyMDIyLTExLTIwIGF0IDIyOjIxICswMTAwLCBMb3JlbnpvIEJpYW5jb25pIHdyb3Rl
Og0KPiA+IFRoaXMgYWRkcyBzdXBwb3J0IGZvciBhZGp1c3RpbmcgdGhlIFR4cG93ZXIgbGV2ZWwg
d2hpbGUgcHVzaGluZw0KPiA+IHRyYWZmaWMgdG8gYW4gYXNzb2NpYXRlZCBzdGF0aW9uLiBUaGUg
YWxsb3dlZCByYW5nZSBpcyBmcm9tIDAgdG8NCj4gPiB0aGUgbWF4aW11bSBwb3dlciBvZiBjaGFu
bmVsLg0KPiANCj4gVmVyeSBjb29sLCBpaXVjIHRoZSBody9mdyBpcyBjYXBhYmxlIG9mIGFkanVz
dGluZyB0eCBwb3dlciBhY2NvcmRpbmcNCj4gdG8gdGhlIHRyYXNtaXR0ZWQNCj4gZnJhbWUsIHJp
Z2h0PyBJcyBpdCBwb3NzaWJsZSB0byBzcGVjaWZ5IGl0IG9uIHBlci1wYWNrZXQgYmFzaXMgb3IN
Cj4ganVzdA0KPiBwZXItc3RhdGlvbj8NCg0KT25seSBmb3IgdGhvc2UgZml4ZWQgcmF0ZSBwYWNr
ZXRzIHdlIGNhbiBhcHB5IHRoZSBvZmZzZXQgdGhyb3VnaCBUeEQsDQp3aGVyZWFzIG90aGVyIGRh
dGEgZnJhbWVzIGFyZSBoYXJkIHRvIHNjYWxlIHRvIHBlci1wYWNrZXQgYmFzaXMgYnV0IHlvdQ0K
Y2FuIGNvbnRpbnVzbHkgYXBwbHkgb2Zmc2V0cyBmb3IgYmF0Y2ggYWRqdXN0bWVudC4NCg0KUnlk
ZXINCg==

