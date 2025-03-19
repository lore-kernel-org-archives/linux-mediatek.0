Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A66BC35FF1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Mar 2025 05:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ragJdfaZYosjBvfacLKF3bctE7f51dxuNLa7CkH1tqg=; b=CmvAHcyxtbrbgZeIejX6nReH/3
	HoZeKUm62tX8g6XKkR+AN3u02gnw0SZY9pj6oYFWtoU7x1Q0AwY1KRc4WAtHndFye2yyW6JbsrZRB
	hPKZ034q9o6RRIjmbM6I9W06s7SWjJxfm5JirVZwR/hJjGFOJEw5Gj6HsO+Xw0LGSu1SNQEf5jFJ2
	Z6atnZOre19QVqVkugnrplYABoCB5KjK9JZEYoqrT5h25v8E0B3GT1U4fV7b1uxMr4BXrVvqmrhYz
	miPuCnMIKkfZXSmyVTVx8bC/EIPCcWB4Ql2MGMaokfapGeITlxinDxN05+veC4enCeaWtrsZO8/9I
	15h8wDwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tum7d-000000084Wz-0Y3e;
	Wed, 19 Mar 2025 05:37:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tum7b-000000084WY-0BuU
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Mar 2025 05:37:44 +0000
X-UUID: 434a0c1e048411f0a1e849db4cc18d44-20250318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ragJdfaZYosjBvfacLKF3bctE7f51dxuNLa7CkH1tqg=;
	b=X+keIEDXGwkTLOAAONPsAAvTDT5oLdHGvmQi3IFDBYFKIm/ZDhQDPBV9wXgQogR/3hczAV08MEeA+hNDrjLqUzvnFW+01mCA+ozk+5+VqVQ7KKNPeq7uz3It+TkqL0/bqMGgUPBMm7tt/XalwIxgHIbdkEIQZzFS4Y6wXHL+6mo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:18e7b214-bb76-44f3-af20-665e005c68b9,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:69154b4a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 434a0c1e048411f0a1e849db4cc18d44-20250318
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1294935080; Tue, 18 Mar 2025 22:37:35 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 19 Mar 2025 13:37:33 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 19 Mar 2025 13:37:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qSww2HpnMsR8jJzzRJU3WU1WSa2NJbPIIi2aZQrVbHg067FwR+Sic3Qs1oOBq7ioaoZV5AA55gnd38VrYiWR9JfS9ZrF24p5evcnccNbEA7UJnC+FSz0rvGwMuAlcj/IVGgRErzRxqpUImVXo+a6jXZvoSIe5z7uryo/48UObcufS4aISZcu70qzYuozY9MNWr2grn5ouLVNoHEAoV9Pnwqd7R6wWL/DpPJMrcXLN9FLy/0CxWxCkJrUMgMgScLk1jdYdLxsjW+tg6gem/lctxlmcJPYMCVIsDlsNk3TSAt0ZyIRdSx/KXqe3OzaKGri1N0nvjNSRr2DqvNGuBmGEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ragJdfaZYosjBvfacLKF3bctE7f51dxuNLa7CkH1tqg=;
 b=w+lzhnTrXLb0AOVSHdfU3wCfQ7Ckoz9fnA0L7ySwlHsbdgg/7HIaoc2batgEmN/KuvYd7P6DJAciiqEMh278xPe+iqdXqCfZidRdNhZIOep3YJ/41z53nHTaSV1WOJXOFmq4fojUQLT6cUDf3/Qx5dgCuR5Ay5m7/yiS+LwouO9rfR8uxY9qbhk4PUgmAvZXLz+v83WAYvzmBmSdErjBNCS0ptw4E3opMM7sPy4XAni5HukQ0oaL72/e6NIoFX3IzrE2gabB6FAq65Sdy4hsd/Kti/pNIjtjc3IgovyNrH4KQJQnHIlewiSGGrejq1JwCyk0zgaEaaLDXQuwKUhY+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ragJdfaZYosjBvfacLKF3bctE7f51dxuNLa7CkH1tqg=;
 b=hRfPmNkuilUc61EWeyq9qqTHVsEiY+sMdCZt1H9MtzqWye7givbHJAvjYqy7++jm4K3RvCwOJC7gGu5g7p4FnEQtlWc4QIvcrCe43rRETxCWZ8eltDKEch+am3olla7l9C0wfWjFJkJaq4/70xGsuudFu5YsQyaboWfYsZX+hEU=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by KL1PR03MB7622.apcprd03.prod.outlook.com (2603:1096:820:ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 05:37:31 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84%4]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 05:37:30 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "jwboyer@kernel.org" <jwboyer@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>, Nicolas Prado <nfraprado@collabora.com>
Subject: Re: pull request: linux-firmware: Create MediaTek MT8188 SCP firmware
Thread-Topic: pull request: linux-firmware: Create MediaTek MT8188 SCP
 firmware
Thread-Index: AQHbl/iOZCZqJJ8JZ0StLirnEyyWCrN58hCA
Date: Wed, 19 Mar 2025 05:37:30 +0000
Message-ID: <b08c417d9e14af82b92bcba915db7e0b448d426b.camel@mediatek.com>
References: <20250318094809.3540043-1-moudy.ho@mediatek.com>
	 <CA+5PVA5wS-sxRpp6eKXNd+UY_j0t2BSeX+cfMjCKAAZ7oxnMoA@mail.gmail.com>
In-Reply-To: <CA+5PVA5wS-sxRpp6eKXNd+UY_j0t2BSeX+cfMjCKAAZ7oxnMoA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|KL1PR03MB7622:EE_
x-ms-office365-filtering-correlation-id: 83510562-549b-453e-246a-08dd66a8247d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aXo3QlNvZy9jdVVCOURHcmg5OGFZT1NPMWxJVDhXR3ZMU0NVSUR3UFZTaGlj?=
 =?utf-8?B?WENiUmIwK3ovZVkwZ0xjRFF1V0MrakkyTGloMnlYc2tlQkZlODhpaDZnUXR2?=
 =?utf-8?B?N1BKVzFWSmRJMm5KQ05IeGx0WjhzQi9yUkRWVUtLenVuWXJyNHFWenRuMjc2?=
 =?utf-8?B?YUg1VjV5V0wvZG9aOFluRnRObTRHWS93eEZMVzZwLzhISUd2TE9vVDY3TUZx?=
 =?utf-8?B?eThJbjhZTCtqeUZRYkVvY0p5Z2YxRHM4RjZhVGVra3ZiMEF6NVNTL0pZRUd3?=
 =?utf-8?B?TG5XYU5uSFhxSVh4TlRNNy8wVVZpMXB6QUxWc3QyK1MxR2tMRFh6dHdXVTFr?=
 =?utf-8?B?OU45YVduZVRNMEVuUTlzY2k1eE1sa1RxWjV4VFFkVDY0QmF1eVdmUVdLTnB5?=
 =?utf-8?B?NTZGYk1idnJQTUtyWXBuSmhqUEJlUm9Nb1BMbmlWbHlYQU53bG1kekNrZmR4?=
 =?utf-8?B?U1RncU1KclRzRTlUR09TcDM1eDR6SWhPdFBtdHRhMEpEWk5hTW5WR3NRTFZW?=
 =?utf-8?B?Skh1RnRFWlVCNksxOElWbjZCeVp1TVNIMVlHRmhDb01lVE54K1d2bGNtME9J?=
 =?utf-8?B?cTNIQklJQVFtYXlldFgvbzlDK1BKc0RKVWh0WTlkNTBYU09aalhuOGo2dG9s?=
 =?utf-8?B?Z3FQZFl1V1J6bFZDTWQ0RHlJcDgvMHVuemFjMXNpL0VZLzVPd2VhckxTQTVX?=
 =?utf-8?B?R2JuUkt1bDVqa045bXk3QXRIWWYxYmE2SU9hZkN1a1ZQU1NHL09VN2dMdDlz?=
 =?utf-8?B?TlViVjZJMFF0eVVNc01ZeEc2NHVQVnJrZlVLb3Q2bDVCeE1abjJGSURHUWRK?=
 =?utf-8?B?Ump5WVhyT25iRDhUbk85M3lYaEpFNTRyVmJyVUhRU0tSNEhLRGtzeGprV3Ry?=
 =?utf-8?B?Z2I3OEcxd3h6Z2RRSkVSSER4Nmg2S1J0NTBxSStxb1VWS0MyalZiOXhzZ3Zt?=
 =?utf-8?B?WGdZQVpZdjJLZWdHd3RYdEloZ3NtSjZodXFUdTA0a2prT0lKcU9WYWY2UEVG?=
 =?utf-8?B?SEdJS2djSkswSWRGT09qVzhPWFVGQ1NMUnZ6NFZqeGVtV3BQaEJBbTY2alhY?=
 =?utf-8?B?cDNmS2FpNS80bjd3ZEhzWTEwZzB5aTBiZmkvTHZLdDUxVUZOUC9YZ0R1TGlY?=
 =?utf-8?B?QWpVMlNJZ29LMlIxNDgvY3RYSjJHMkwxSHd2Sy9Ib3BrZlZzTWt4R0ozWDMw?=
 =?utf-8?B?SXRNaFUzQ0MzU0tGMkMyL2hQYTVuMGZHT09WNTg5clBRdm9qM3k0eHpuS1Fq?=
 =?utf-8?B?bnB4VmovWUNWTHhVREtEQWtSRlpqNXlHR0VSaFhteEhVQUdXZ0xPQ2RpTk9M?=
 =?utf-8?B?Y1JOV2dJMXFzSU1SeGppaHB6QmJUdUZvZXZCWTJ3anYvbU10RTFERWcwSTZz?=
 =?utf-8?B?RzdrcVA1UW1pWS9uS0xYWmsxUVNXdmd5Vmx5SUx3YUw3LzdDVEpQOGhCRFlK?=
 =?utf-8?B?MW9NTUtDWTBKZERZWFhjeXVraC81MlpIN1dmYWg4SXpDM3JWTitmTmhrRzVW?=
 =?utf-8?B?b3FWME9NWnpzL0V2Uk1YT3FrM3RTR3FNUVY3SkJTT3pqRXV2Y3MyNnVHYU1t?=
 =?utf-8?B?bFoyTmNyQ2VTaWswWEtMZlFWRmhvYloza1lqTDFKZzhFczJjU2pUUWdJemR1?=
 =?utf-8?B?VGN4QlZOOFExNGIrR0ZvYUlwUHFuTW1EWFJ0V2NsZWNMTU9MbXp3S1paakk0?=
 =?utf-8?B?blJyeGRTSUNnMjA4Uy9KcG04QW5TcWluQ3JTY2NXeTdOS2N4QWZaT0NsRlBJ?=
 =?utf-8?B?aTJCV2RKbEYyeXJkTTFoWDliREdVaHVFbGpYU3Y1b1IwOFZIU3VFazdmODls?=
 =?utf-8?B?aktWMHR2eGRsVDZrWTVYbWxFWStxdDlHYUsvamZnOU5qam5UNUkzdDRNUXhW?=
 =?utf-8?B?Nk9XLytwSG14cGZ0L29oUDlRS1hQeFBJdGxYbU5rU3RSeVpYOXFsbTJxb2VF?=
 =?utf-8?Q?d7vXbk0ytHCUHFJFNMU/CDYLzUyyB4MI?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6356.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFJSZnc1RG1sV21DRHBmaFFYd0NBc2puRXc2ZE1qUUh2NkVnREJMaHN6dFcv?=
 =?utf-8?B?UmxLVVpMZERWZDdCUXQwNHNaSnpJaFVaNXpqWG9MODV2TXhCWHd6K3BYMUZC?=
 =?utf-8?B?TWlIemcwL1poOVRXdW1NQnpMWXlqNUtvQkFndG8rdVppdmVod1p6RFRQMXF3?=
 =?utf-8?B?cU9kYnZOYklKUklLRVJiemw1VkVsbWwvY2MzU1JaeHA3RGdNREFLemdtTTBv?=
 =?utf-8?B?NVlPVG96SGxPMHNaY1VjbTZ0SGR2WFJ4ZXFRck9xL3hDUDhwWTBMYmdxNWxn?=
 =?utf-8?B?dUU0Nzcxd0laSGkrZk9NWWRVbWN4S1BSQmYvWDZ2dFVzSFpFaFZvQTIvVDZE?=
 =?utf-8?B?TjBJOFhCY25pcjU2dzhPL00rbklLV1p2bFY2OFA1aVhrWS91cVBDYldPRTBY?=
 =?utf-8?B?YThpSmlZcGtNTzhpS0hLYzVrck5YZndTN3NRUlVsQXJ4Y1pRY2FoMXNmNlh2?=
 =?utf-8?B?VWw5LzBJQVlTVzJGTkxPb3RmeC9pWkpuaENyS09vNnZDWStQQkF0c0hIcWlR?=
 =?utf-8?B?L0QvbjVGYzgwY0l5Q0ozb2s5TGJFbGlDbzc3YTlmcmtRY29ib0hicXRnamxW?=
 =?utf-8?B?cVJnL1p0SWpkNDJFSmdldzA4aVZVb0k1TTd4MVpkL1dieTQ5YnlpS1NCWGJy?=
 =?utf-8?B?TUNqV1dUYmdvQXAxRU5rWWF4b0xFVmZTMlN1WUl3ZC9sa3FOdnFyWmQzNkRN?=
 =?utf-8?B?YzJYdHN6VjBURjdVR1krWTBneTE0eW9CN2RVOGh3ZlhMS2gzSmtKaFhqVTZa?=
 =?utf-8?B?M1ZYTmsyTkhDUkhkM2ttTTUrL1lhTjZaM0N3eU9XRmR6WTNHNGM0MlljekVW?=
 =?utf-8?B?YjlqSU5mN2xNbXh1V1ZpUHo1SzJ2UkVZdXZYTzlhUm93ZURjK2tVUkRKd1NW?=
 =?utf-8?B?aDRwMndyNGN6TUZYS3pSd3FUbVlTcjVPQjU3dXcya3dyU1l4S3JGcG5sekE4?=
 =?utf-8?B?OW5YdHB5blBhblJ2eW0vSmtvRXhxeDhHdDZ3WVlqNU1jNWRCaGt3UCtrQjI5?=
 =?utf-8?B?dXl4R0FIMjRzem1RUUE3V3NVOWpQcTNxdEZTRk5qS0ppVUlWVlVRQWt1QTBv?=
 =?utf-8?B?c0kwd1lDdUxjNzJMRFJiRStPQ0lqTnRLTnFRQXk2ZlZEa3RkeEhobXArUTFh?=
 =?utf-8?B?VGxsRUU3RWVZdHNZMlFyK3V6TVdIOFk5Z1lDWU1EdXVnUDRaaGVTOWFyT2RD?=
 =?utf-8?B?ekhBMTJ1UjN4N0N1eGpqYkI2amgwZU1PdFVrdm9wQzlsTDl6OGh0eDlNRmlP?=
 =?utf-8?B?WWpHaG41VS9ldVZRSjlMU1NIMEl0NUlBMnR1NFU1bERwckxjQnZYQXlibERq?=
 =?utf-8?B?RjBpNk1veW1WU1djZFdUMGR4bzN5Zkt2ejEyRzJvUEFTTFVoanFMaFZNbENW?=
 =?utf-8?B?TGh3ODFEWEFlRGpIbUxRUlZPbFptY1hxUDZtNFkwSVVDclk1M2tYVHZCS2Ri?=
 =?utf-8?B?RDVKMDdpRTNZZEp3K1VwQkhCMjVPeSs0Z0I2bkpKSGJ6d2ZtT05SWFFneW9W?=
 =?utf-8?B?NDhmRFQ3NDU3R2FuN1ArNThuMnBsWW03WjlDRktyVUV4aTlaTVI4V1c5aE1m?=
 =?utf-8?B?d1NrWXNiRTc1aXk0ZzFQdC9CMVVUbXd4cm4rQzhrb3E3VkNDeUpPTHRKSFFV?=
 =?utf-8?B?VmtUdTkrK0RkTHplOUw4cm9Ca1ZMUG5YSVlQRXFlU0lUK0F6ZE9mUDI5RU01?=
 =?utf-8?B?UHlNSWpYR0V4VUltZzlEcnJrSFlBeWhiSWU0YWw4b0ZPUi8zU3VXWHU1N250?=
 =?utf-8?B?UmdSNnh4RGJKWHJqMkl4R3dmUFg4YStZQ3Raa0FjUUxOT2Z1Mk1qbnVMTW1j?=
 =?utf-8?B?TkxrNTZ5TktBd3hhTFpQdkNwbjkvSlB3aTd1YXVsckM4azRZT1BRQjRaR3Fy?=
 =?utf-8?B?aFRlRFh1UGNuVFB0cDZ0ZkZkcW5YaDBtZGhLd014Nm5VWVZrcDlKWGUrTUxa?=
 =?utf-8?B?anorK1dBME1lRzlUYkw1ZGJMNzQ5SWdCelBXS1VJUFhSWnJsWWdOWTZYSHVX?=
 =?utf-8?B?eWZuZEo3N29ubGNFYXMzZHoxN01RVXFBdzUvRHdra2J3TU5NQVdmT1ovcm93?=
 =?utf-8?B?dGhnVlZTYmEveHVDY2c4dlhPTVJqTExDY2pKWDNRWG1UeWdOMkoyN3hrdXhK?=
 =?utf-8?B?YkZPS05BcVdmbUFvOGRjenRFZ0gzbEI5SUh1WUx4QWJqbW9NTTB3SHFkZzBZ?=
 =?utf-8?B?SkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A28F7F8850463F4B9DF4EDF99171C99B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83510562-549b-453e-246a-08dd66a8247d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 05:37:30.8845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j0ZVXxLzjm+I+pkCrIeJ9pmPJwuW1VJ0V53lb4Pznm8Jxaq5oBG1KzlevGIO8Hsvi0LRHtvZWscy2vrsVjLRog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_223743_108449_F597C96E 
X-CRM114-Status: GOOD (  15.01  )
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

T24gVHVlLCAyMDI1LTAzLTE4IGF0IDA3OjI1IC0wNDAwLCBKb3NoIEJveWVyIHdyb3RlOg0KPiAN
Cj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29u
dGVudC4NCj4gDQo+IA0KPiBPbiBUdWUsIE1hciAxOCwgMjAyNSBhdCA1OjQ44oCvQU0gTW91ZHkg
SG8gPG1vdWR5LmhvQG1lZGlhdGVrLmNvbT4NCj4gd3JvdGU6DQo+ID4gDQo+ID4gVGhlIGZvbGxv
d2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdA0KPiA+IDU4ODUwNTA2OGM0OGZlMDdiMWNmYTMyYzVm
M2FjZDQzOTVlYzk0ODI6DQo+ID4gDQo+ID4gwqAgTWVyZ2UgYnJhbmNoICdjb3B5LWZpcm13YXJl
JyBpbnRvICdtYWluJyAoMjAyNS0wMy0xOCAwMDo0NToyMQ0KPiA+ICswMDAwKQ0KPiA+IA0KPiA+
IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPiA+IA0KPiA+IMKgDQo+
ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS9Nb3VkeUhv
L2xpbnV4X2Z3X3NjcF9fOyEhQ1RSTktBOXdNZzBBUmJ3IWtEWU1xVXVkbE1WMVI1Tm9KUklURGw5
bHZoRENaUnNpVmRXSnVrR04yX1NaVUhOZjhWT2V3Tm9DbGdEcWQxX043WVpMZEx5cDd1ZjhlM19M
N1EkDQo+ID4gwqAgdjI3NzQ5DQo+IA0KPiBUaGlzIGZhaWxzIGNoZWNrX3doZW5jZS4NCj4gDQo+
IEU6IG1lZGlhdGVrL210ODE4OC9zY3AuaW1nIG5vdCBsaXN0ZWQgaW4gV0hFTkNFDQo+IA0KPiBQ
bGVhc2UgYWRkIGFuIGVudHJ5IGludG8gV0hFTkNFIHdpdGggdGhlIGFwcHJvcHJpYXRlIGxpY2Vu
c2Ugbm90ZWQuDQo+IA0KPiBqb3NoDQo+IA0KDQpIaSBKb3NoLA0KDQpUaGFua3MgZm9yIHRoZSBy
ZW1pbmRlci4gSSdsbCByZXN1Ym1pdCBhIHJlcXVlc3QgdG8gaW5jbHVkZSB0aGUgV0hFTkNFDQpz
ZXR0aW5ncy4NCg0KU2luY2VyZWx5LA0KTW91ZHkgSG8NCg0KPiA+IGZvciB5b3UgdG8gZmV0Y2gg
Y2hhbmdlcyB1cCB0bw0KPiA+IGEzOTcxMmYyYzhjOWE1MjBiODg5YTQ1Y2JiZGQyZmEzNmQyNDlj
YzM6DQo+ID4gDQo+ID4gwqAgbWVkaWF0ZWs6IEFkZCBNVDgxODggU0NQIGZpcm13YXJlICgzMDM1
LTAzLTE4IDE2OjQ5OjUzICswODAwKQ0KPiA+IA0KDQo=

