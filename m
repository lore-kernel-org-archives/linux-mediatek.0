Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62822EEB57D
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 10:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDZ3KcHd8Q53YVyZ/jyNRwteZIflMi3sTI/hINwjcjk=; b=OpYG/dTD4SVZyEdYlJYgLFVhzG
	M4ub6icWNAL9YbtMsAyTIceyaOHFftgI4CiWeqtuRnZMCyRSRVmFnpaUV6O1KRYzaNOGYplcQqvp6
	9k2hBH0EpLORhgY1x/ajcLBDaV+HmvNyHIYICbExW2J46ezGnZtJyUjqx2pZwvA5a3nUwFGt3eoME
	nCgabl7kXJES0WLLgzgXoWucOIAWp/zDaDvqRjugwXWWaNZHSgvjq6j39+u4Thmo8y5nbBtnfpmFF
	+1TKL2zwn8DfrvDcO83UOA2JFed4lG1Ge7iZnulLRjdc9jMrNOuuIQuSOAoJlExGxfCieQQNbkiU8
	d/ubY+5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sogcX-0000000CclE-1E3P;
	Thu, 12 Sep 2024 10:00:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sogcU-0000000CckM-2qTt
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Sep 2024 10:00:12 +0000
X-UUID: c7b5fc8670ed11efb3adad29d29602c1-20240912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=RDZ3KcHd8Q53YVyZ/jyNRwteZIflMi3sTI/hINwjcjk=;
	b=o9p4uIA4pJswgNDW2htYO7EgahQaI+HImJQJCcxzkGID3ijgwyEPL9sUxy37/x8+fF/6upCI/W7mgEBSF4O0eQT7qFMUqwq3Mnkqf5/OgEvc9gDMlUixGUVbYM8MX1ZquIpv61wK//rvBSkI5RSy4p50DRFKenltt2XQSYt2Z+g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:44c671bb-f467-415c-8a16-306c4833e064,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:9a0edbbf-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c7b5fc8670ed11efb3adad29d29602c1-20240912
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 720298225; Thu, 12 Sep 2024 03:00:03 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Sep 2024 17:59:26 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Sep 2024 17:59:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZcSewECY8YwzqsJHiBJxUdMtoE4MF4WtLaGnaEl9+cKv4E9koAbH/r4ck2MgY9V1V2QF8rMPmarSiQYC5vV/ZmQid2XyJWs72HpaZt7wxsa80yq9DFpmONk/C2z1LIXPw76hXI2fJ0BDiaCiZO1IUiWUjv5KnfD/KH56yyHbSScrftTUfiOztqvJDp7IG9WM18kcEkvRoWBrCM8V588GXnzGCTPp6igU58xgZeh7rGbewGRnXyRIkAWMyLFo1Gxiz1zD/h+SW5oNiwY6dNaXqXRCmkQJN7cufLbetFQaM2H5xl7Z2sZFvBBjjkx3fuUe9nrr/NNjZP+hnIpf02W7CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDZ3KcHd8Q53YVyZ/jyNRwteZIflMi3sTI/hINwjcjk=;
 b=lBFpERDzyJU1dK63OTX68oVtrCItrhqyDK9wyW8A6oGrP3u8bH/PixOEwQh3oxg2EW9cYHnqrqM974DCLiDCPTxDew8oX+O3fgUCxer9oVsYG+GEcZIsK/payuX/u+LTkRUTOhmv3Bo0FrzOyY03sihEZrY8znW44RzZ0XX3ysT4ekjVxaCjiyuBUXNzCwTFQ0lfqm02Iorb1ipmKaD8lQ4P5IyvcAx6w+S7Y4b+ZlPiT/pUTVmuZEQFMiXLLBpRBXbnRB9KaeojE6XexL+6P3J2/V2rcg5cTtdoxPYArH2nqENpTXJUarIJpLIWJEht4aKJBNhKHlK6wQCmaNAvkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDZ3KcHd8Q53YVyZ/jyNRwteZIflMi3sTI/hINwjcjk=;
 b=CqCvD6JqWNg9nqSbhHtdjiQ/fEsIxodgBop8ykq46D9b+y0XbGfhYGd19e4ZTNpMDIwAlSYED/WGAfjCpEHjDIBVS+Hdg3eD0C6yRCz9xko67hlEY3MZyqcP8gEJK9sT4gxfUYnOgxpEBymPC53J4X28mKmgQuHDhxE5Z5s4n+k=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB8530.apcprd03.prod.outlook.com (2603:1096:101:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 12 Sep
 2024 09:59:24 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 09:59:24 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [bug report] drm/mediatek: Add mbox_free_channel in
 mtk_drm_crtc_destroy
Thread-Topic: [bug report] drm/mediatek: Add mbox_free_channel in
 mtk_drm_crtc_destroy
Thread-Index: AQHbBDo2mGVV8TfBlEyeXNjISmhpNrJTyhQAgAANMYCAABUqAA==
Date: Thu, 12 Sep 2024 09:59:24 +0000
Message-ID: <eb8fe5555779fc5b23cb95636bf6befa75a67581.camel@mediatek.com>
References: <77b85cdc-ecfe-42c7-a3f3-a757566b6f5f@stanley.mountain>
	 <fd3890987a56a01be8954f3d10d6e744918c62d7.camel@mediatek.com>
	 <b5c51c93-633f-4f6e-84f6-e409e729c7cf@stanley.mountain>
In-Reply-To: <b5c51c93-633f-4f6e-84f6-e409e729c7cf@stanley.mountain>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB8530:EE_
x-ms-office365-filtering-correlation-id: 26167d9f-6196-41aa-fa3f-08dcd311950c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Zlh3V2pOVXJMdlcwMysxRDJ3bE16V3pEUCtKL0t5QVlqMzlmQXJqbWFkc0F2?=
 =?utf-8?B?anQ5MVI3NW52RFVSUGVRWnZGamwveDFoUUtoMGxpcmp6aC9vL3VvTXFUU3Yx?=
 =?utf-8?B?Y0dESTYyU1pLdWF5eWpRTWo0NXZHeDE4WEJEUnkycXpkQWFydzRDMGl5MWtq?=
 =?utf-8?B?VXhISWsrblFUelV4Y1ZkNTMyTlhhL3pxN0tTcitGNlRjZDlSazBHdTVFR1Aw?=
 =?utf-8?B?dWtZRjZ0eWNCeEkxWFdWdFpHcU1SUWc1TG9zWWIyVFpKY1hGV1YzZnluZWN4?=
 =?utf-8?B?ZkZqMzFFdG0vRG10OTMzdi94SWw5Z2tKZE40MFdydmIxMy8yV1RjYjA4bER5?=
 =?utf-8?B?MXJFbkllNjg5L1BmUGw1MklWdE1hbzJrWDJveVNlTTFuR0tNTmtIb2t6WHpn?=
 =?utf-8?B?NEZIbGhpQ09DeTlIa2QyWGZTbzdFYm5xK3JMcDZRc09IOVp6ZU5HbFRVRkwz?=
 =?utf-8?B?QjRvcnRMZ2I4K2xEZ1VMQVZidjN5OFByQk1sckpCM2NEUVVnNmlRUnFOVFJI?=
 =?utf-8?B?YUFsOXBxeEhqeE0zSDBGd0o1OTN3OFcrSlM4NlpuZkl4clQzVk9iTzZZS1FW?=
 =?utf-8?B?c2QrRlJ1cHIwUmlodmdFb29Ld01YL08rS1EzamJyOCtNUVpGRTZLTGI3eTZO?=
 =?utf-8?B?SUtlWWMwZlUvR0k1azhKODFlWUVQWVh0T2IyOEdsZlRFYzdCSjBsdmVQT013?=
 =?utf-8?B?UThEeFdBNXcwYkcxWVNhbjVKNHA2Y0lWcHVTeGZvR0UwZFowYWFhbjNuWE5o?=
 =?utf-8?B?dVRmU1lScWlnQTFiUkVtUTNrNGRyT3hEbkFLZm5SOXd5ZE9UcVh1QisvaWtt?=
 =?utf-8?B?YnArMUpVdTJiaFMybW5qejFHcVN3MjNwZkRBaUlQWFJ3YXhHVk40TUJ6L1hT?=
 =?utf-8?B?N1RsMUtFREswdXBXL2NaeklBWTEyYWZ6NTZBTC9kNGxXM1phSGI3eFNVb0tW?=
 =?utf-8?B?WHlWbzN4RkZ2QWFXNzRNNmxGd2tTOHlqUG1YWm5tMlNpVXJZdkl2MlZXd1lK?=
 =?utf-8?B?Y1VBNUNOODhiTGF2SFh6N0hTRXdNSlNZOXRZRTh0WjRMdXFjaUpCa1hWYm5y?=
 =?utf-8?B?ZmxlellMcW1XR2FsUVp1aXhrR3IySWdUdWxOamd3QVBtcDRyUXQ4ZTNBb3RY?=
 =?utf-8?B?YlVZbXdaaWNnOHNOWi9uSFZieThuMk5xTFgvQ2FZNVRZVnhZNUxhQ3ZRVzFF?=
 =?utf-8?B?QjMvd1hxQkJ6dDlrbjd6NUtDM1R6VVFyTHFwZmpqSWMwT1ZuVUZkcERETWJ1?=
 =?utf-8?B?OWhxK2ZkN3E5ZG1LZXN2anVvUWp1RGJYUG8yYWk2RXM4UEdRK3k1enBFekEz?=
 =?utf-8?B?cWlJRG9WUGVLaUJvU1ZUOFZ0M0t3cTNkSHc2Y1pSUDBuc0krMkRZSUpOTFdN?=
 =?utf-8?B?ZDVhTk0zWDJRM1JtUjhLeVVzeVI3MzZEOFR2dk1jMXY1eGZzNjdYMUtNblVK?=
 =?utf-8?B?RllJT2M3c2Q2N1pUKzVjTGduUURCWWFUTGprd1BXL1N4VkwrZXEzSE1vbTZG?=
 =?utf-8?B?eDhYSXNLS1RTQ3QzUnA2K2pZeXhRREpnbnBOV3JCSzVocUtiZHNXK1RyVTh3?=
 =?utf-8?B?SUhLZ25JMmlIemFiVE9QTXpzeWtHRlNFU2tSNTY2YU5ZQ28weE1MeWoraW1r?=
 =?utf-8?B?M3FmTWE5bUpVdGhyckhER1ZJblZPZ1R5SWl0RWhjdXJwNXVxcVByUGNJUEpN?=
 =?utf-8?B?ck1qYmdNQ1VOeDB2bnViems3TzlqWnIvMklrZldUMGlSdzZMV2xSRU9OK0pX?=
 =?utf-8?B?Tk8yRTRIWGtWa2xFOXgzNkRVLzBrM3BadCtOOVNMaEk5UkVmcnovaFhEWWdI?=
 =?utf-8?B?TGhHOUNpTFVZMzk1eC9ma3RjV1J3R1dIRy9XY0hrMWQvN3ByV3U3NS9KQmd3?=
 =?utf-8?B?MURoUWJMSkMwN1MreUZwb0U5bDVLN1lWWlIwZEl1ZExtbEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THEwVm5aTkNFd05ZL0FVaS9xWE5Ldy9ma2l1TTRibTNqSXptbzdDRHJMb1Rl?=
 =?utf-8?B?bmZ1MnRlODY0WDhXMkNpWktBQU9HeVpJeVVid2NRVVdBOW54ZHlRSmhpeG85?=
 =?utf-8?B?b1RQVUNJUUpNcnJSVmxYYkQ3UHZDRExEQzc0aGFBRUxnTDJyWnNoVnNwRS9G?=
 =?utf-8?B?SGZ0a1ZTZXgyK1o2SGVYTmFOWUNIUlZhU3V5Zys5N2ZDbDZCK0lYK3lXdjRH?=
 =?utf-8?B?eU40akhrRzZycFQwL2NNK1h3TzVrSW1LdVBqNEEzMUFxYnRPWnRCc0MyVnhB?=
 =?utf-8?B?R2JnSTJJKzVYWDRjMkNSRGZRM01SSzdJcEFzOHhXd2dhTTlMZENkUzcvUEN2?=
 =?utf-8?B?cXdXdlJKUzR1TWNVNUYxbXdOYXMwa0ZDRGNoUVpkVjFMZjNWbUJ2OFpUblRv?=
 =?utf-8?B?MXlnOElBZExDdURvWmo3dGdQZDBpMUdxMTY5OHZQaHN5dFgzVjViMVd0STNi?=
 =?utf-8?B?Yjlxa3A2ZzhGSUpKZkIxRzRENnoxM1luV0QwaXZNbG1ud0FHbDJ5TnhxWGF4?=
 =?utf-8?B?WTBQVmFwRGtOZUgwQVV0eEVDQTI2N2g3QVNGVGFBV3o0Rm1XTUdZY055eEtS?=
 =?utf-8?B?cFNDQnhPNDU1MlowdVM5b1dGRHVHOHZ5bmxRZlU5T2l3TERjQmU4NStoRzFw?=
 =?utf-8?B?ZmJnQUZ4cUhkME9mTUxMN3RtaGJUMzZpdkwwRzRZWjJxbmMwbGVlVGsyV2p6?=
 =?utf-8?B?MjcwUGhEanRtNEwvdWNpdlN4ZCtpTURCU21XdmVoeHQrbnBUN2RXZGxTeEF6?=
 =?utf-8?B?bGpOQ0Uyc0Z6aG5NUDNlVzcyMGlBOExBN3JwNnRGMUcyZTFVZVd2Vkt3VCtE?=
 =?utf-8?B?TmR2Znh0bWhvT2dWTlJ0eW0wQ20zMWZYdW4yVGJLWnlrU2JIeWJqbVZQT01G?=
 =?utf-8?B?YTBsV2RCc094VjBydWZyWWJwc2dCeFo1UnlRV2hWNlQ5M3pYZHBRSSszWTN5?=
 =?utf-8?B?ZjFZRmY5U2N5RnBhTmR0dGpybjJYUXlMU0N6eE9TdTZUOXJrZzh1YWJ5eXNh?=
 =?utf-8?B?ZUV6LzI4SjFtQlV0VUZxZ3VtVXlRM1VxNWlNYmg3Qk5hRENDbUxOL1JGSVVj?=
 =?utf-8?B?V1BUL2N3bFJqM3BFN3dkbTJLK0FYZ2VVNGI0RS9qazNUbW5za2psWmdjc1ZE?=
 =?utf-8?B?dTFrcDRoVy94VlN6a1NwVHk2dzUxTTBGMDR6K1orMzVTc3RTMDl5R2ZHZXFh?=
 =?utf-8?B?QUVHVHZwQXhuMUVLL1VKb2NBUXhtUmhpNDBtVVJ5aTJackRoVHIxOUJlYWlW?=
 =?utf-8?B?SlJpbGV5UmdGdUUyaU56RmphZWpNUjhIOWRvNmVESVJ3M2NaTmJob0d2Uitm?=
 =?utf-8?B?VmRGSkw3SVlSbEJBL3l5NEkwVEtuRUlycVNrOEp5cTd3Q242b0RHYU5jVnM5?=
 =?utf-8?B?ZVFMM0hzb3JTQndBb3llQUxnV29ocCtyaG9oMHF5TkhMQVJFRTJGSHlGVlNI?=
 =?utf-8?B?N1JhSk4yUnQ2akRlRGdSZStJM2RWLzJwbW03VGVuY0ZsUU15VmZLVlNqN3h3?=
 =?utf-8?B?NnBYMFFmVFdBckNET1pUZXZtN215QWJoN0tGK0hUOHdqM1lQU2J5cjdCRWhN?=
 =?utf-8?B?SHNPdG1hVWlTUWVuTFZRZnpiK2VNTlR6ZzNmVHREbGhyWjdwdVd1bGs1UFRx?=
 =?utf-8?B?amlreTJ1cjRvNEJnK2l4TDJMYWhLaGFUcC84Z2UvN2VqUzZoT0Jna0pjdE03?=
 =?utf-8?B?M1UyRVJyVks2aDlZalpObUw1Y3d2M2NHRmVlTzVweVpCYXk2MmpaUE1UMjY1?=
 =?utf-8?B?M1dxZytHcDRuRzVoVnVxQkRocG5vWDB1RkRlZjBJcTI2Rm1GbmJZSDJETVVU?=
 =?utf-8?B?dW83Qk1CVDgzUWtBbjcxaXVrcy9rUXZTeFFLL08wYXpxaUVTUHpXNUFjRjNy?=
 =?utf-8?B?T1VDVmc5QTVVcEVDOU83VXBXSXZlN1ZpaW9BRnJaV0lvSVE0TnZ4dFFkNitP?=
 =?utf-8?B?dEJFQnR1Q3hsV1FIWm9FVnYyUTZDTlQ0ZWZOa3B2K0t2YmM4Q1oxaXorTWVU?=
 =?utf-8?B?Y0RPR2llR1R2M01TSWx1SkJpM3BqZmQwRnptSENueUYyVDRoUVJTUmV1ajNv?=
 =?utf-8?B?L3liRDRPWnlmc3daQ0kzbVhEL05OMGN5cXlCejAyZ1Z3TnFHbFMvKyt4Szk3?=
 =?utf-8?B?N0I3aHVaclB6VXhMMEVPbE8xK3hqenB2SFRIY0hrNEZ2dWloQ2ZleTNKcG5E?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8288455CEBE1E84F9903DE558829DBF8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26167d9f-6196-41aa-fa3f-08dcd311950c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 09:59:24.8186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taCw+JXva7dcoia1fp3KJaG/I6KCiqMEEEGRmCmYHe5QMM1UYOTI3VqUoUl8y96A7415ij1Zrb//BM98/u8+7CF+jzbGo002dOzDGsESF6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8530
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_030010_764536_7A570D70 
X-CRM114-Status: GOOD (  20.63  )
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

T24gVGh1LCAyMDI0LTA5LTEyIGF0IDExOjQzICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gIE9uIFRodSwgU2VwIDEyLCAyMDI0IGF0IDA3OjU2OjI3QU0gKzAwMDAs
IEphc29uLUpIIExpbiAo5p6X552/56WlKSB3cm90ZToNCj4gPiBIaSBEYW4sDQo+ID4gDQo+ID4g
VGhhbmtzIGZvciB0aGUgYnVnIHJlcG9ydC4NCj4gPiANCj4gPiBPbiBXZWQsIDIwMjQtMDktMTEg
YXQgMTQ6MDIgKzAzMDAsIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+ID4gPiAgIA0KPiA+ID4gRXh0
ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVu
dHMNCj4gdW50aWwNCj4gPiA+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNv
bnRlbnQuDQo+ID4gPiAgSGVsbG8gamFzb24tamgubGluLA0KPiA+ID4gDQo+ID4gPiBDb21taXQg
NTkzYjY1NWYwNTIzICgiZHJtL21lZGlhdGVrOiBBZGQgbWJveF9mcmVlX2NoYW5uZWwgaW4NCj4g
PiA+IG10a19kcm1fY3J0Y19kZXN0cm95IikgZnJvbSBPY3QgMjgsIDIwMjEgKGxpbnV4LW5leHQp
LCBsZWFkcyB0bw0KPiB0aGUNCj4gPiA+IGZvbGxvd2luZyBTbWF0Y2ggc3RhdGljIGNoZWNrZXIg
d2FybmluZzoNCj4gPiA+IA0KPiA+IA0KPiA+IEl0J3MgYWN0YXVsbHkgY2F1c2VkIGJ5IHRoaXMg
Q29tbWl0IGQ3YzY2YjVmYmM3MCAoImRybS9tZWRpYXRlazoNCj4gVXNlDQo+ID4gY21kcV9wa3Rf
Y3JlYXRlKCkgYW5kIGNtZHFfcGt0X2Rlc3Ryb3koKSIpLg0KPiA+IA0KPiA+ID4gZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19jcnRjLmM6MTMyIG10a19jcnRjX2Rlc3Ryb3koKQ0KPiA+ID4g
d2FybjogdmFyaWFibGUgZGVyZWZlcmVuY2VkIGJlZm9yZSBjaGVjayAnbXRrX2NydGMtDQo+ID5j
bWRxX2NsaWVudC5jaGFuJyANCj4gPiA+IChzZWUgbGluZSAxMzApDQo+ID4gPiANCj4gPiA+IGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5jDQo+ID4gPiAgICAgMTIzIHN0YXRpYyB2
b2lkIG10a19jcnRjX2Rlc3Ryb3koc3RydWN0IGRybV9jcnRjICpjcnRjKQ0KPiA+ID4gICAgIDEy
NCB7DQo+ID4gPiAgICAgMTI1ICAgICAgICAgc3RydWN0IG10a19jcnRjICptdGtfY3J0YyA9IHRv
X210a19jcnRjKGNydGMpOw0KPiA+ID4gICAgIDEyNiAgICAgICAgIGludCBpOw0KPiA+ID4gICAg
IDEyNyANCj4gPiA+ICAgICAxMjggICAgICAgICBtdGtfbXV0ZXhfcHV0KG10a19jcnRjLT5tdXRl
eCk7DQo+ID4gPiAgICAgMTI5ICNpZiBJU19SRUFDSEFCTEUoQ09ORklHX01US19DTURRKQ0KPiA+
ID4gICAgIDEzMCAgICAgICAgIGNtZHFfcGt0X2Rlc3Ryb3koJm10a19jcnRjLT5jbWRxX2NsaWVu
dCwNCj4gJm10a19jcnRjLQ0KPiA+ID4gPmNtZHFfaGFuZGxlKTsNCj4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl5eXl4NCj4gPiA+IERlcmVm
ZXJlbmNlZCB3aXRob3V0IGNoZWNraW5nLiAgV2UgcmVjZW50bHkgcmVmYWN0b3JlZCB0aGVzZSBz
bw0KPiB0aGUNCj4gPiA+IGRlcmVmZXJlbmNlDQo+ID4gPiBpcyBkZXRlY3RhYmxlIGJ5IHN0YXRp
YyBhbmFseXNpcy4NCj4gPiANCj4gPiBjbWRxX2NsaWVudCBpcyBhIHN0YXRpYyB2YXJpYWJsZSBp
biBzdHJ1Y3QgbXRrX2NydGMsIGl0J3Mgbm90IGENCj4gPiBwb2ludGVyLiBEbyB3ZSByZWFsbHkg
bmVlZCB0byBjaGVjayB0aGlzPw0KPiA+IA0KPiANCj4gU29ycnksIHRoZSBidWcgcmVwb3J0IHdh
cyBhIGJpdCB1bmNsZWFyLiAgVGhlIGlzc3VlIGlzDQo+ICJtdGtfY3J0Yy0+Y21kcV9jbGllbnQu
Y2hhbiIsIG5vdCAiY21kcV9jbGllbnQiLiAgSSd2ZSBkb25lIHRoaXMNCj4gYW5hbHlzaXMgbm93
LA0KPiBhbmQgd2UgZG8gbmVlZCB0byBjaGVjayBmb3IgTlVMTC4gIEknbGwgc2VuZCBhIHBhdGNo
Lg0KPiANCg0KR290IGl0LiBUaGFua3MgYSBsb3QhDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4N
Cg0KPiByZWdhcmRzLA0KPiBkYW4gY2FycGVudGVyDQo+IA0K

