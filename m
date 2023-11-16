Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C00FC197A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 14:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fy3sMBbS3IuesefC+AyVCYxIYQ11/vxjxokV5n7VO0o=; b=il3BBafGQ9T+goDF1kI4UJ3kUU
	E2wtEUsKfbRIUXqgL8lvbuV5xYPQS0cbDoEDXn7EBSc7u9RakZfQrAhQ+NWx6qZdLkAj0478eokn5
	3ca9Qrzdp0dsdnqx3fcSXtVpfSy4CvqBko2LItEhJV9hOXbeWMrCs+b8C19ywyJfmGrpgo/kfeZrh
	elSgp358tQZ7+hF8z3Ht3zXkz1PI4GaHrzBobcZhlZQhI9+AxVwgPtVbqmU+GMO9MoItt28jW+CL0
	fY3NrmAkCL5E/BPCF1As4NufPQX6G+589BYiD4aEeOQGmi4LIMuK76/n+X1kKzSUjhnLmjnv53H3I
	G3pGkHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3djG-003k21-02;
	Thu, 16 Nov 2023 14:52:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3djC-003k0t-1b;
	Thu, 16 Nov 2023 14:52:23 +0000
X-UUID: ba938136848f11ee9b7791016c24628a-20231116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=fy3sMBbS3IuesefC+AyVCYxIYQ11/vxjxokV5n7VO0o=;
	b=khtahZYDSSyq7zj+DHjOi3z+CpqUVqQMOL+tnXkYYFr0h8fU9XdLakmYNrBUn+gzETSlOEbzoKXniqzVnAFvHnIs8WJsSKK/iue6qo74M6e7feDNLuRS3c5FCHu3Iq68PY6z4Ref03AYneuglYTmAfcbdeuKPAsQUQKeTpSxUrc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:92caf8df-ca79-4469-a864-9c0cf0e19481,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:e086bb72-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ba938136848f11ee9b7791016c24628a-20231116
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <bo.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 261375836; Thu, 16 Nov 2023 07:52:14 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 16 Nov 2023 22:52:11 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 16 Nov 2023 22:52:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3HS33TsKIRBnHMFwes6SA8w8jbIkP8egBGuWP8H+47Yl19BCAChTVHzSSk2d3wIbSshGFdq5hXqsr6ayQmS0Qb03zy0Yt+TyVlvu6LyHAR0tSt4bxz1BLB56z9MiKrNjf/PtUa53yoBwKVJxqLyeAkS2AStrfstRYPZmbS0y1Sumr5y20zDRgPS7Yc8roFIM0rZI5hm+byj0KQ2fAbFQ7yIFHJGXpYXQRWGknK0Ejna3CZm3WmaAMtUXhT9QJ8sFz5NoYGot1C3vi5pW8YztOq3yR3i+O3PHS1VQodw9ZMDUlkg3YuRi7XpInIk5ipb9KKqFBpmRhgkmN8FfceRmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fy3sMBbS3IuesefC+AyVCYxIYQ11/vxjxokV5n7VO0o=;
 b=gR2O5y9RKVcG4AL3UmxaiRpeb+KRDjnOdl6l0Ar2LoPQhkAG3JS23tMzguA8L9KHiSuMTEnXBQr42B47Uk9oQQbMpa2gIOiMp0bRdOeiObZBFp2JmTO97Qk79FLu7Y2s4RdGk/xxWQ8gd4dsNfhfkXdMpB30QMajwEwCEJ8QrwbQc1zZXufngkSEt4EhaDGGEhPJbT77P/yuBOxJ0HEilJGKwgi8eIVbQCj6m0TpexcpjR3k0+msydC1nsv34vRcQTNPHImdFUCRChGawqcpPL9uLUFBQApeVCdqYm0+f7sVl+gs7BCRduEs++SvZQjgBw7MKKRu6e4nUNaRUxfzSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fy3sMBbS3IuesefC+AyVCYxIYQ11/vxjxokV5n7VO0o=;
 b=kEMGv7q/e8DQpL75oONBs4OYrJIm+iU+84kHHpzfL+/btOe6Hl2FrEwCZ6lNYLHwg5aPOTqGyx/6+B0crbubnZ6EI78ZIJaf4gEKBpr0ASIIJkiyPiWmJBgyu3u2+hpw7tJAB4luONp3BlL7o4nRTRW3fyn2Z7+iJjcpBWRIu3I=
Received: from TYZPR03MB5199.apcprd03.prod.outlook.com (2603:1096:400:32::11)
 by SEYPR03MB7698.apcprd03.prod.outlook.com (2603:1096:101:144::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Thu, 16 Nov
 2023 14:52:09 +0000
Received: from TYZPR03MB5199.apcprd03.prod.outlook.com
 ([fe80::3439:9de9:ec9d:4e68]) by TYZPR03MB5199.apcprd03.prod.outlook.com
 ([fe80::3439:9de9:ec9d:4e68%4]) with mapi id 15.20.6977.029; Thu, 16 Nov 2023
 14:52:08 +0000
From: =?utf-8?B?Qm8gWWUgKOWPtuazoik=?= <Bo.Ye@mediatek.com>
To: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "rafael@kernel.org"
	<rafael@kernel.org>
CC: =?utf-8?B?WW9uZ2RvbmcgWmhhbmcgKOW8oOawuOS4nCk=?=
	<Yongdong.Zhang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>, =?utf-8?B?QyBDaGVuZyAo6ZmI56iLKQ==?=
	<C.Cheng@mediatek.com>
Subject: Re: [PATCH] cpuidle: idle exit_latency overflow
Thread-Topic: [PATCH] cpuidle: idle exit_latency overflow
Thread-Index: AQHaGJCCLDgIIUP/ZUupWyhllqqXwbB8/u0AgAAI4wA=
Date: Thu, 16 Nov 2023 14:52:08 +0000
Message-ID: <81ad0d7dcb82c6f1f49e6d0882249231682c1b6c.camel@mediatek.com>
References: <20231116132619.69500-1-bo.ye@mediatek.com>
	 <4118d15a-a70c-457d-8f62-d4f61f1157de@collabora.com>
In-Reply-To: <4118d15a-a70c-457d-8f62-d4f61f1157de@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5199:EE_|SEYPR03MB7698:EE_
x-ms-office365-filtering-correlation-id: 954ee131-195b-4d92-57c2-08dbe6b39ba9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ciNvZBvN1/E9oTOlhNRU2nQXBDlqNc3WMCkaqZXY55h/lIky6LZP8zROwccsNQucCHkFNsAI3yt8Udw5JonxwtdzfXQ3hJQE6FLn2hCxAxotpiTXLqZk9ZLdvKfMX6IoDRB0mV3Sbpv93WkWRn9u4yZZKt9iilDCU1EiD12BOA/bICiyM9CwD5dvQ58fV/qQYFNi4ys8xGc+hWgm5kdhzMPQIP8OH1gLaC0MTOcXRsh3fjnnDnsMCN8WWJZamiLTqEdfVAvnqFBi+nbz0akPnPG/tTVCHXZ9guu649tPPYzxUqfDylvlykfX6OGbzgQiJKQVpMpMkaCvzFfvQAQXb77pEchURvhBhiePV14uzgYoiQjHakrkAL1Y5AplfppnMiiiKRmHUCuEFwQK6dBVccy/cLRTy+6W8hexrfooMH8NAmbLAxd5Y61F235mkVacRMZHXAgfFBzM2IpnTV+hU8nP3CZpol7yEhLZ2GaonMb+9GwbAjj4byhTImalqBDxdlJQxAO7aiH3ab3/2ulp5llnoI1s+yi/fii4oWzzEnYTBPzsm0z6do+K1Xif/sa1FL8qdpq9StgYYARtJATOuwfIlquLX1bzqXNx42JvX6A9N9tUXCLGKKJM7nzW4MzMGIIYY1th+HyqPvzVqyzFTb6zVTDcxSE72KErWsCCIwo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5199.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(136003)(396003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(2906002)(38070700009)(4001150100001)(2616005)(107886003)(66446008)(54906003)(64756008)(38100700002)(85182001)(86362001)(478600001)(5660300002)(41300700001)(6486002)(83380400001)(8936002)(76116006)(71200400001)(110136005)(6506007)(91956017)(66946007)(4326008)(26005)(8676002)(122000001)(66556008)(6512007)(36756003)(316002)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1ZDdU9RdXNTdmpIUFg1NHkxSlFUdHpJeG1tMnRLVUxLUFoydURmNjBsd3dt?=
 =?utf-8?B?aHVTN1ZoQUZaQ1hwaVNYL1JSK2pmYkVqRjR2eGR2V0xWdlNZQmNlT2xMVWR3?=
 =?utf-8?B?UkVtYTdtMG5WOGZCM042TXBMWXd1Rm9CODZ2RzRqUVZJOG1PUEdOQVJXWFBm?=
 =?utf-8?B?MlE1Ly8xeFlzaXJGTXc0N2dLWHM4emMzZXNjTWw1LzlFVjZsMUpMRU85YkU5?=
 =?utf-8?B?Wk1kMm4wQUtYNFlCZFhLUTYxYUZ1cjl2NG04QVNGelRUN1dCZC9HdGJ2bmky?=
 =?utf-8?B?TS9HQTdSYU9ydlhibS9qdTJqak4rMGlpVlNET2VXb1pXSFhZdExEYmdPME1H?=
 =?utf-8?B?QWhISEdaRVY5bTJJTkZ1eTlpWHExQUJhbDB0em1rdjhtKzJkaVNTSmlaZWFG?=
 =?utf-8?B?WFNZS3o4ZkJFa2xuTVlOMjZQVnVPNEsxQ2RXWEFMY3N4UEdVdnNXMVdWdGtC?=
 =?utf-8?B?TER0MWhsaldYM1lpb2ppdmRicWdycDVPdXh1VmZyUThDUGJvaDljQnZaVHlr?=
 =?utf-8?B?L2RkS2RnZ1BLdmVjVm1yTEFWb0taOWtPMm55MEIyUVRWQnFtdnN2MXQ5Vllw?=
 =?utf-8?B?YXA1azYyTjRYRm5sK1RWTTJJWFBoTDFIWTQ1bFFzMytlckpnOWxPcFd1cm9P?=
 =?utf-8?B?RW0wV25JcitSU0ZVNHNTRDA2cERaczZuVExhOENqVTZoaElPbVF1enRoMXJr?=
 =?utf-8?B?Tmo4VDE2UGFSSkNNMURlVHJMYW1FVFVENXFVWkgvbXlwRmoxMUdSOGlOTWM4?=
 =?utf-8?B?SzNFMTUvK09zelRac3I5eVVrdElxaTZUWi9SeHhUVkRXT2ZOeEYrZVhRcStB?=
 =?utf-8?B?b0dBY0ZoV0FiQlpxTjJxZ3JDazlycVdtdWdiaFRDOUxIRGxDaXViMjZkalpT?=
 =?utf-8?B?RGp4V1ZOdUhVaWJ5K3R5M3lPSEp6RUJicVN3clBUSlNqTzFhbmdCL1drZ1Ux?=
 =?utf-8?B?bWhEYUtxdHArSm5WajdwVkhMd2YxRHg3aldDeXF4ajhuaFdjMWxUczFRdGli?=
 =?utf-8?B?d3VFMk9yUkZhdXhaaVJ3c05wU3Y0T3E4aEgxYThmbnJrVGthcFB3MXRLWWxw?=
 =?utf-8?B?dGJ3UmtuT0xpUXdmeE9NUXd4RTJoRHVoMjlaMGZPdUs1bGhDZ1ByVzk5bVQ4?=
 =?utf-8?B?V1Uxcm1TU1dFd3h5Mk5jSVYvLy9vUmN0NWlGU0l5T0h0VXJXVS8reU9BZE5E?=
 =?utf-8?B?TFgvcTI3WllMbHd3YjF2VFRJUlp4S1N5QzEyb05KOTR3ZitqVmRyV0xZb2p3?=
 =?utf-8?B?d041U3NTcXR0NkFtRVl3Y3RRSFhvNGpQZlU3b2VKSU9pTXhwUGVqTDFoTkg1?=
 =?utf-8?B?SGpLUzNBZ1JxZnBhamhQNnQ2NjA1clA2bFlUYXgxVVg3NmRXR2pybDhKaGxB?=
 =?utf-8?B?ZGNMRUtEZUdYQ2pUWXFnNFNqWlY3dTQrNUI4aGNNbU5LNmtlUTNXQXBJM2Jn?=
 =?utf-8?B?QkFNV0VCNHNVckRaek4vOWZjOXF2VkJOQ2dDRzBDZlo3WHJjWmdOWmdHa045?=
 =?utf-8?B?S1FTZ0l3V1F4RU9hSkJmejR6NzAvQlVGend1aHZkQnpFbDJZcnNxZTh0cUdl?=
 =?utf-8?B?WlM3VXFLRm1SSkEyeVRLRllOdUE4OTV2ZXB4MHNWOTVTSklzRnRVMEpMaVYv?=
 =?utf-8?B?OXR0Rnl4T1JnUUpHT2M2VTJRMjNUUXpTaXRxYno1Yzc4ekRiclMvSUtLMjBR?=
 =?utf-8?B?TFhLWVZCUmlYR2JEUXBRUnJvdXRJYnp2WHIvNkU1N2REN3JiazZwcUx0N0F3?=
 =?utf-8?B?RkhtT2pKcHpKUzZsRGJjV2RqVXdXajBoaFJsTmlnb0pJSUJyeStkTlpXbUM0?=
 =?utf-8?B?eDRvN0pDQml0VTRLQTIvSHd0TTJvSjhlTFZPRzBMWnhSUkVSQ1pRdjNlUkpH?=
 =?utf-8?B?bVZiNFo5MzFQaHROUXlhZDlUeTJJVFNablY1eTlxTThnT1ZtWVNEb2RPK2hO?=
 =?utf-8?B?eGJsVExYdFNHbTFrVDkxQ0V6OXN0SnNUY0l3MEZrdmZVaXNBWUwyOHJXYWNl?=
 =?utf-8?B?VFlLSk1ad3hwSEJsYlNKZnBhaXR2Zk1ZVEZHTy9ndEhTbSs4aldJTWtGWEJy?=
 =?utf-8?B?blV6OVVzK2xKeTdCL0pEeCtWNGI0SmpwbG9SNXh6Q01wK29OSEtUeldHVTlS?=
 =?utf-8?Q?pbV7+++UMA9QfHQ2q7uevzPPI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B8ACFA694A82D419EB2F27EEC84C169@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5199.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 954ee131-195b-4d92-57c2-08dbe6b39ba9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 14:52:08.7971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZhnESDI0hGtjRG158objXmPKMMNt0oNGxDkK4KwtJcMs/eXDiTt7ThsWEOZeW2QWYAGSVndJccV7li8GdqNbwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7698
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_065222_580161_0D1AD1A4 
X-CRM114-Status: GOOD (  23.73  )
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

T24gVGh1LCAyMDIzLTExLTE2IGF0IDE1OjIwICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMTYvMTEvMjMgMTQ6MjYsIEJvIFllIGhhIHNjcml0dG86DQo+ID4g
RnJvbTogQyBDaGVuZyA8Qy5DaGVuZ0BtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gSW4gZGV0YWls
Og0KPiA+IEluIGtlcm5lbC02LjEsIGluIHRoZSBfX2NwdWlkbGVfZHJpdmVyX2luaXQgZnVuY3Rp
b24gaW4NCj4gPiBkcml2ZXIvY3B1aWRsZS9kcml2ZXIuYywgdGhlcmUgaXMgYSBsaW5lIG9mIGNv
ZGUgdGhhdCBjYXVzZXMNCj4gPiBhbiBvdmVyZmxvdy4gVGhlIGxpbmUgaXMgcy0+ZXhpdF9sYXRl
bmN5X25zID0gcy0+ZXhpdF9sYXRlbmN5DQo+ID4gKiBOU0VDX1BFUl9VU0VDLiBUaGUgb3ZlcmZs
b3cgb2NjdXJzIGJlY2F1c2UgdGhlIHByb2R1Y3Qgb2YgYW4NCj4gPiBpbnQgdHlwZSBhbmQgYSBj
b25zdGFudCBleGNlZWRzIHRoZSByYW5nZSBvZiB0aGUgaW50IHR5cGUuDQo+ID4gDQo+ID4gSW4g
QyBsYW5ndWFnZSwgd2hlbiB5b3UgcGVyZm9ybSBhIG11bHRpcGxpY2F0aW9uIG9wZXJhdGlvbiwg
aWYNCj4gPiBib3RoIG9wZXJhbmRzIGFyZSBvZiBpbnQgdHlwZSwgdGhlIG11bHRpcGxpY2F0aW9u
IG9wZXJhdGlvbiBpcw0KPiA+IHBlcmZvcm1lZCBvbiB0aGUgaW50IHR5cGUsIGFuZCB0aGVuIHRo
ZSByZXN1bHQgaXMgY29udmVydGVkIHRvDQo+ID4gdGhlIHRhcmdldCB0eXBlLiBUaGlzIG1lYW5z
IHRoYXQgaWYgdGhlIHByb2R1Y3Qgb2YgaW50IHR5cGUNCj4gPiBtdWx0aXBsaWNhdGlvbiBleGNl
ZWRzIHRoZSByYW5nZSB0aGF0IGludCB0eXBlIGNhbiByZXByZXNlbnQsDQo+ID4gYW4gb3ZlcmZs
b3cgd2lsbCBvY2N1ciBldmVuIGlmIHlvdSBzdG9yZSB0aGUgcmVzdWx0IGluIGENCj4gPiB2YXJp
YWJsZSBvZiBpbnQ2NF90IHR5cGUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQyBDaGVuZyA8
Qy5DaGVuZ0BtZWRpYXRlay5jb20+DQo+IA0KPiBJdCBhbGwgbWFrZXMgc2Vuc2UsIGJ1dCAibXRr
MjQ2NzYiIGlzIG5vdCB0aGUgbmFtZSBvZiBhIHBlcnNvbiwNCj4gd2hhdCdzIGdvaW5nIG9uPw0K
ICBDb3JyZWN0ZWQsIGFwb2xvZ2llcyBmb3IgYW55IGluY29udmVuaWVuY2UgY2F1c2VkLg0KPiAN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCbyBZZSA8Ym8ueWVAbWVkaWF0ZWsuY29tPg0KPiANCj4gVGhh
dCdzIHRoZSBzYW1lLCB5b3UgcGVyaGFwcyB3YW50ZWQgdG8gd3JpdGUgIkJvIFllIiwgbm90ICJi
by55ZSIuDQogIENvcnJlY3RlZCwgYXBvbG9naWVzIGZvciBhbnkgaW5jb252ZW5pZW5jZSBjYXVz
ZWQuIEkgd291bGQgZ3JlYXRseQ0KYXBwcmVjaWF0ZSBpdCBpZiB5b3UgY291bGQgcmVjb21tZW5k
IGEgZm9ybWF0dGluZyBjaGVja2luZyB0b29sLg0KICBJZiB0aGVyZSBpcyBubyBhdXRvIGNoZWNr
aW5nIHRvb2wsIEkgd2lsbCBwYXkgYXR0ZW50aW9uIHRvIHRoZXNlDQpmb3JtYXR0aW5nIGNoZWNr
cyBuZXh0IHRpbWUuDQoNCkJlc3QgUmVnYXJkcywNCkJvc3Nlcg0KPiANCj4gUmVnYXJkcywNCj4g
QW5nZWxvDQo+IA0KPiA+IC0tLQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NwdWlk
bGUvZHJpdmVyLmMgYi9kcml2ZXJzL2NwdWlkbGUvZHJpdmVyLmMNCj4gPiBpbmRleCBkOWNkYTdm
Li42MzFjYTE2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvY3B1aWRsZS9kcml2ZXIuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvY3B1aWRsZS9kcml2ZXIuYw0KPiA+IEBAIC0xODcsNyArMTg3LDcgQEAN
Cj4gPiAgIAkJCXMtPnRhcmdldF9yZXNpZGVuY3kgPSBkaXZfdTY0KHMtDQo+ID4gPnRhcmdldF9y
ZXNpZGVuY3lfbnMsIE5TRUNfUEVSX1VTRUMpOw0KPiA+ICAgDQo+ID4gICAJCWlmIChzLT5leGl0
X2xhdGVuY3kgPiAwKQ0KPiA+IC0JCQlzLT5leGl0X2xhdGVuY3lfbnMgPSBzLT5leGl0X2xhdGVu
Y3kgKg0KPiA+IE5TRUNfUEVSX1VTRUM7DQo+ID4gKwkJCXMtPmV4aXRfbGF0ZW5jeV9ucyA9ICh1
NjQpcy0+ZXhpdF9sYXRlbmN5ICoNCj4gPiBOU0VDX1BFUl9VU0VDOw0KPiA+ICAgCQllbHNlIGlm
IChzLT5leGl0X2xhdGVuY3lfbnMgPCAwKQ0KPiA+ICAgCQkJcy0+ZXhpdF9sYXRlbmN5X25zID0g
IDA7DQo+ID4gICAJCWVsc2UNCj4gDQo+IA0K

