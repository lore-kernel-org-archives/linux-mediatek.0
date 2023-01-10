Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A631C46467
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 05:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnL0vAUTgiBSrNjZ4UC5REsOS9zclxUtJdYJd8SobiU=; b=tBW+6BkcMjtze0ZeCzysiVKb8L
	5z71n/ANjHh8YltBkqNgEqqppDPc+H9zaK323VuFpBbMSrG7WSqFYSwxHzItT29EFqOlGdtbY5/n+
	8dt+j8Y9EajXNPAG4YUTcDuqXIk8qwpNiw9l9+56MzlfFw6jgC8tO/qku324B0Sifi0+azDEQxf4J
	wWNEr4oxMif7ayEdZBWtV6PSKTAxQF6BGY8QVc2+ZJv63ZRGKjZTypwYHzcsLjGN/4cexih8v0i9i
	g6gtQc1lblksmo70zV3sK++4EwBJvf/EuGYWsbsJNMyYKGXqS+FZUzdcgL0nmpolmZyuG9CMXv3CQ
	jsu22pMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF7EG-005LTx-4W; Tue, 10 Jan 2023 05:31:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF7E5-005LSu-Ia; Tue, 10 Jan 2023 05:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=QnL0vAUTgiBSrNjZ4UC5REsOS9zclxUtJdYJd8SobiU=; b=EaVmx6BfNEg8GKWMjasTYcfDnj
	z79/3Dd9ZjTGzHAlQjZakxSpPjlpr8FroH/pLCy3Jwyq8iEkJoVs6LMmt04lWUS4iht5VEuXVDxSt
	7jLWZDKDoTeHLUI20aobJC/AGMyFITbrYZh1EAWWm4yN6o33meZrTxCPSjPQQSKASKBLXn7Ce05qh
	CpaiAbOkYeDBA+1n2JTZPQqFXns1QEPA1kwb96ZBkUqozycWzAbMtVU+WuEcjOLO2aHpO3fgUgHKa
	X0zHK4EF2KuNIbDcveOfW/6SBXA5l8x75tlImQHEi1++ueLeurD6VFqpJrZ5DiBlgQrMhSxkjees+
	eVNZGTJQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pF7Do-0030wA-2W;
	Tue, 10 Jan 2023 05:30:58 +0000
X-UUID: 7a482b668789488797891be79d786144-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=QnL0vAUTgiBSrNjZ4UC5REsOS9zclxUtJdYJd8SobiU=;
	b=aGMM1BPSRBwJSGU4bREBHXJSjjL09h9jNUxg0HZhvGFCzbe16guH1hppcuNIS1K1qmnJBieU3QxvsX1fdShViHJ9PHUTUso/or45qrRbZUYcUQJ1O9m9tUziXXGLcFfKLGCJqbe+oKsA1ErFGl0iW4eP2mcCJqJgWMHI9p6B6Gk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:34aac236-ebb3-4812-b9a3-8a44ac57a695,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:543e81c,CLOUDID:9b563054-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 7a482b668789488797891be79d786144-20230109
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2140852984; Mon, 09 Jan 2023 22:30:24 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 13:30:21 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 13:30:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDuJRZMQf1K+5gwbqmYC2DinEuRBf2JGnWT0K4xnXUH4z6oyY8Ky7AbJuVTjm0p8ZrfK9owXaZtRbBiyKXyGnxseKGYRoHWm+H/WCerGT4cq7bRG5MwGCsZKlO3mz26u6RObCZbbUZxBPNxVCQkULkADXLr0klcbgtLpYaMMU0eudOtBqC/nK9nSXULkbpi89Y9qvcOPP1X/oSCBQpB/z8HLfb5xAY7u66xVaKyUiI4YjToJsU441lzo2noydfAqtY470vGOHXmPo/++tcSVkHvOPrZ1jW9RrAHr0nNYdx8HgeSA0MiGzHCkDO3NgtMr004Mh4ide48K+3qHlXyKAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnL0vAUTgiBSrNjZ4UC5REsOS9zclxUtJdYJd8SobiU=;
 b=bhwwFwgzItmppATFfk+AICHoRFL0jXoiYdSXRHTVykkG/1zWfKLqgZB14hu0ecgRQRchJu6XqXFSXyL+mqU6x+znhLbbI120DG/IWDE149swyB8Sh4/bMu2G75e7reAPxDE/+ARW5ATnZTL/SSEuN7gh7MUaYDyTHhjr0B3rwhcjIQbBKLQSpjGkitxd9adGXVPfM1Wel2Qi3UhcjP/6cBkl0H0l+G4n1hqsDCfEQW7qFTPGBflQsjACzTDookFVTV3z7hPpCwvkrAzh7ZGiV7nU4xImFsWW9iOH0edBaDbw+aWmfFtHrD3XaSa1aEihAHHTI+fx1PBc91kbjevm8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnL0vAUTgiBSrNjZ4UC5REsOS9zclxUtJdYJd8SobiU=;
 b=a1skw2mbokEnXDQBILV6TdaaXoAEl8iWPEjj6YcyuKasf/BlahFwpKUS1lnGYPMqooGwKFzKC/sCNbJ/fzsYa43RMAnFfU3Fp7Djq0r4IJ1Ig2MXGNeeP5oRu/4m7OwtiN12X7c6x2K5UguqsfRtZH14+/ZwtsxQAh3Mjng4Iu4=
Received: from SG2PR03MB3434.apcprd03.prod.outlook.com (2603:1096:4:26::14) by
 TYZPR03MB5693.apcprd03.prod.outlook.com (2603:1096:400:8b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Tue, 10 Jan 2023 05:30:19 +0000
Received: from SG2PR03MB3434.apcprd03.prod.outlook.com
 ([fe80::58b9:b6cb:6595:bbbf]) by SG2PR03MB3434.apcprd03.prod.outlook.com
 ([fe80::58b9:b6cb:6595:bbbf%5]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 05:30:18 +0000
From: =?utf-8?B?Um9nZXIgTHUgKOmZuOeRnuWCkSk=?= <Roger.Lu@mediatek.com>
To: "eballetbo@gmail.com" <eballetbo@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "khilman@kernel.org" <khilman@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "drinkcat@google.com"
	<drinkcat@google.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?SmlhLXdlaSBDaGFuZyAo5by15L2z5YGJKQ==?=
	<Jia-wei.Chang@mediatek.com>, =?utf-8?B?RmFuIENoZW4gKOmZs+WHoSk=?=
	<fan.chen@mediatek.com>
Subject: Re: [PATCH v1 10/13] soc: mediatek: mtk-svs: restore default voltages
 when svs init02 fail
Thread-Topic: [PATCH v1 10/13] soc: mediatek: mtk-svs: restore default
 voltages when svs init02 fail
Thread-Index: AQHZGQ57ABy6jdrF5U+ORMZln5rm466MsZwAgAqFhYA=
Date: Tue, 10 Jan 2023 05:30:18 +0000
Message-ID: <d0c0bdfd025c72f8e69eab2e699fc8d8a6d97199.camel@mediatek.com>
References: <20221226094248.4506-1-roger.lu@mediatek.com>
	 <20221226094248.4506-11-roger.lu@mediatek.com>
	 <ce7698f3-8b40-1394-342e-e6b099f9f77e@collabora.com>
In-Reply-To: <ce7698f3-8b40-1394-342e-e6b099f9f77e@collabora.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB3434:EE_|TYZPR03MB5693:EE_
x-ms-office365-filtering-correlation-id: 61c182db-dc77-49b8-5008-08daf2cbc2df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h8O/L1v29ZpmNT60vFqtJURiulNoset9WG0HfmONDMEEqg63TuGoFim1DONCCqi4mNsesQ38TPCHTkADEO4wBbnSXyA7pnazjp2tChCxVChDXqHTV9NbmJbYwXBcQ7/HrcTrOcUWT6BDKL1JE3vwmQWId5CI7IJWVDQYkMOYVSHMKtZ+sjXn4E8g+zROWS0nRtKoWC5oLpUWwvy7vHkKAezIFDvvz7vYL5M0JNm3zxJoNbX8mm4zyfUsXYHrgjZ7PM16KP3bH2EPWdy5GwWu/nGoNw0uj+KtWsaViVrNbm36/+hXDuf/AzwOZ5pIbaPItB1lI71U2YaOgJjuiEetO+V5kOOsvHFm0ulvLeybnuPnuRiA/Sz026biqIbkGJmGfDDheP5Jb5UW5Zh2GsAzWqiHcCHAcEWI+Rf0h1jciLeyFwzIfSE+sPQE6GvI8lHg32Zfri1oF5Pmf/C81sMgo8M/2skk6hLfN0W+ChALBbu+tbhWwRZzC/NxuKUyeI39d+8Ro1F7u0Ix5edTu9SdrwElhSVOnTC4lWkOUAjiYB2+WJzwnRm/ZX5KCLyxCdNdQao+VopV++ya2AtdKU4VTeNRC1MzOPLP7F2YqE/rdYCwccTOmbOxlILhyRGoHzqWIyReY00SwAMsAPe73WbAd7Lh+dnoS0xpj7O9OvHx+M0Jr+/ikuCo96OaSEOIV+ZSkZRyrf3fUT8MTDaFZFabCQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB3434.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199015)(8936002)(2906002)(5660300002)(41300700001)(7416002)(71200400001)(38070700005)(66446008)(4326008)(76116006)(8676002)(64756008)(66556008)(316002)(66946007)(66476007)(4744005)(85182001)(54906003)(110136005)(26005)(6512007)(122000001)(2616005)(38100700002)(86362001)(186003)(83380400001)(36756003)(107886003)(478600001)(6506007)(6486002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVdBT1RyUWVVS21qdFB5QVg4OXlNMWtjRU5la2NCcDJ0ekFPQktVNXVzUWRL?=
 =?utf-8?B?M3ZuY28vSXBZTWQ1Wk5BMlBPV1A1YWhkcGtHRzBvSkZJSDJHVjZ6bmV4cTJz?=
 =?utf-8?B?ZjkrbEVjVzIwYmtKaDJRYm1FeFl3ZTZHS1gzamhKeU5GNzI4S0loTS93TFpR?=
 =?utf-8?B?RysvQ1VKc25MOUdCbVhrS2ZGNTl3cTgxM3NRdVFHZG45QmptSzFYZ2czOWcv?=
 =?utf-8?B?RXowc2l3ZnRJR3U4aW9JWDdVbjFWWEROTGJCL3pqa3JrYVNqeXZFNllMTjYv?=
 =?utf-8?B?eHFhQzlTTE1hTUgxOG1nVk5JdXQwTXVXeFk1QVJROEI1SjZKcGtrVWxKSWNZ?=
 =?utf-8?B?bDdnSDZ5TlJLOHBvNEdiL29wMXB2NVJGNHZyS0w0Mi9DTEdDSklCZ2NOQ1Bs?=
 =?utf-8?B?WjhQQWgzV3k0QXRMUDNjSjVaait2Vm84YzQwV0lHdlRnZjhrSkZpaThhZktu?=
 =?utf-8?B?aEpEaXFRVExhcldnVFVqalFQYW84Ly9ObncwTmJuSitrbVFaazk2bUFRY1dM?=
 =?utf-8?B?bFBlNDlNdktaU1hINjFUYjlvLzFPYUNBMWYyaURWV0dwU3dIeXFZcDY3YzUr?=
 =?utf-8?B?aHdWY0lMaXEvM1lVK1RVQnB1L0FEM3hkdmVQV1NHaFQrNnlvOGlWOVdLeDJi?=
 =?utf-8?B?Q0xpbTB6aVpqRzFpUm8xaXo5L1c2MnZyT2xiek1LV1drTjl3R2NhS2Y1ZEVk?=
 =?utf-8?B?WWVMYVI4VzA2L01udlFTVTYybUdVY3ZYMkJINHRDZW1oNHA4clVuYjU0OXhh?=
 =?utf-8?B?aHYvY3VQeG5XTTBjTHBqRkZ1UWxtNG10ZG5MMFFRUm5wSlg5VHRsK1FXbHRS?=
 =?utf-8?B?Tm42Qk1jcGRob21kT3RNSHNUdUkxeVB0S01BS1ZBdjBjNkNDaDNaeDdpbVlE?=
 =?utf-8?B?L2phV1U5bnBkMExHMW9qbmoxcXF6RjRTZ3dzQnBPMHVMSk5KVGEyVTBBOWY3?=
 =?utf-8?B?RXEyYWhjTHVJK1lsRGdtL21rUXo1Z1F3VGJ1Yk9aVUQ1aXBGZnRPTzY2NjVk?=
 =?utf-8?B?Sks3NTNHMVliUllyVGJWYlNHY3cxeWtRQjJnaXowY3pCSDBDcXkzNkF3OEgr?=
 =?utf-8?B?WlAyV29uRi9KTCtUdjNBTlQ3d05GZStCTnZvNEJOVnB2VkdaZ1hwczk2TzVu?=
 =?utf-8?B?dWk4aVpoaDZXb2R2Y0FNSTFpbUxadnBZVEkrSkp0WE9HMEZmZ2xZd29FNWZ6?=
 =?utf-8?B?dTYydGs5RmRCYWpHUEdlVXoxYldDRU9OQmZsK1VnWEFKd3A4bjU5NFNib0JU?=
 =?utf-8?B?cnJTQUdUQ2pDUitVV3dHekE5OW9DYnI3QjFoVFUxUU1SaDZZTStiODVNMW92?=
 =?utf-8?B?QWJJaVJ4N2t0alVZd0U2UTRyaFludExuSjRxZlVtVGwrMk94azN0TGx1VE4y?=
 =?utf-8?B?cG9QRUdLOWQ3eTUvWHlNbWhpVkxCMEZPU1pYUTlRZEFFQWxBenMxNktKMGdC?=
 =?utf-8?B?VDBsTDRRczAvT3BlM3czRHQwTlJWR3R0QWRiaG9vcXlzdmdwUUNEQ0pXN3p5?=
 =?utf-8?B?dGo1ZGx2YUZBd0Y3UmNzazFVSCsyY28zZXJWb2tJZDBKK3lMUXJXdUdhc2to?=
 =?utf-8?B?ck5SZEg0U0VmV2lNMGNWeG53blQ4em52eTBCbE5UMHhFK0g4djRsU2FaZ3Zj?=
 =?utf-8?B?aWZ0NHY5MVVCaGU0U1Z2UUs0ZEZFTk5DM1gwR0RLdys2aHU5Y25XanllKzZI?=
 =?utf-8?B?cGZkVmdqWU5DRjQycmRlUkNXQklSZ0s5bzE5R050Zi9pS2t3NFNtZW9oQUF5?=
 =?utf-8?B?OXdVUDl4dU43eEVEMlcvUFFwbnB5a3BaY1pReUlRUlNyQTdnUHVNUGxuUHAy?=
 =?utf-8?B?dTZ4RzdGSysyQitHbnFvOG81NldiVnZGdTBFSVVIekRqWkhEWVEzS3FSVDRE?=
 =?utf-8?B?VGdFbkpuQzhJUTNtcmJrNmZha3B3SVhXQnF1ZUFXSEh5UlU3L096TXVxQ2ZN?=
 =?utf-8?B?citaVzNHdzJhRU5NS0lHdFZtdVhOdkFrNFNHYmhGWFdGNGhvWTd2LzdTaTdU?=
 =?utf-8?B?SWFXRVdYV2JidmlOa1BiVXhVRFE0cHJjZWdNKzVnb0Q0NTVaRXRYSzlMclJm?=
 =?utf-8?B?TjNKUmllNjZPeW1lb05odm5URkt6Q000dEUxMk1GV2hNWU1VWXdyQms2cm9t?=
 =?utf-8?B?V0xiYm5jZVM2eEtiK044WTRtdHMxSWtjSjc3RVlORmR1NmlpNER2cjBPNFlT?=
 =?utf-8?B?VVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1D922B7B0EEC540B942BBEED98A0A00@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB3434.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c182db-dc77-49b8-5008-08daf2cbc2df
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 05:30:18.7575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s/u3CTs5/sLhqi0kKFIGoZvvmB8rr1M3qIQppJwjD3QJjFX560vrICygyjC30YJWgJNhmEl8DZiaTPr1mN8+tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5693
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_053053_807552_E6375609 
X-CRM114-Status: GOOD (  14.89  )
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

SGkgQW5nZWxvR2lvYWNjaGlubywNCg0KU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5IGFuZCB0aGFu
a3MgZm9yIHRoZSBhZHZpY2VzIGFsd2F5cy4NCg0KT24gVHVlLCAyMDIzLTAxLTAzIGF0IDEzOjQ5
ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gSWwgMjYvMTIvMjIg
MTA6NDIsIFJvZ2VyIEx1IGhhIHNjcml0dG86DQo+ID4gSWYgc3ZzIGluaXQwMiBmYWlsLCBpdCBt
ZWFucyB3ZSBjYW5ub3QgcmVseSBvbiBzdnMgYmFuayB2b2x0YWdlcyBhbnltb3JlLg0KPiA+IFdl
IG5lZWQgdG8gZGlzYWJsZSBzdnMgZnVuY3Rpb24gYW5kIHJlc3RvcmUgRFZGUyBvcHAgdm9sdGFn
ZXMgYmFjayB0byB0aGUNCj4gPiBkZWZhdWx0IHZvbHRhZ2VzIGZvciBtYWtpbmcgc3VyZSB3ZSBo
YXZlIGVub3VnaCBEVkZTIHZvbHRhZ2VzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IEx1IDxyb2dlci5sdUBtZWRpYXRlay5jb20+DQo+IA0KPiBUaGlzIG5lZWRzIGEgRml4ZXMgdGFn
Li4uIGFuZCBpdCBhbHNvIG5lZWRzIHRvIGFwcGx5IHRvIG9sZGVyIGtlcm5lbHMsIGFzDQo+IE1U
ODE4MyBkb2VzIHVzZSBTVlMgaW4gcHJldmlvdXMgdmVyc2lvbnMuDQoNCk5vIHByb2JsZW0uIEkn
bGwgYWRkIGEgRml4ZXMgdGFnLg0KDQo+IA0KPiBQZXJoYXBzIHlvdSBjYW4gc2VuZCBhIGRpZmZl
cmVudCBwYXRjaCwgd2l0aG91dCB0aGUgY2xlYW51cHMsIG9ubHkgZm9yIHRoZQ0KPiBiYWNrcG9y
dD8NCj4gT3RoZXJ3aXNlIHlvdSdsbCBoYXZlIHRvIGR1cGxpY2F0ZQ0KPiBzdnNfYmFua19kaXNh
YmxlX2FuZF9yZXN0b3JlX2RlZmF1bHRfdm9sdHMoKQ0KPiBhZ2FpbiBiZWZvcmUgY2xlYW5pbmcg
dXAuLi4NCj4gDQo+IEknbGwgbGVhdmUgdGhlIGNob2ljZSB0byB5b3UuDQoNCg0KSSdsbCByZW9y
ZGVyIHRoZSBwYXRjaCB0byBwdXQgY2xlYW51cCBwYXRjaGVzIGZpcnN0IGFuZCBmaXggcGF0Y2hl
cyBuZXh0IGluIHRoZQ0KcGF0Y2hzZXQuIFRoYW5rcyBmb3IgdGhlIGFkdmljZSBhZ2Fpbi4NCg0K
PiANCj4gUmVnYXJkcywNCj4gQW5nZWxvDQo=

