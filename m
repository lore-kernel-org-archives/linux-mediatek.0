Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B69EB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 08:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBFrJeaVuOlZJ5x60FP6yVcCWdT4J5D5DM/RntOP7yo=; b=nvAIZQ8sjDM1rCsXJJD7jXJCdq
	659Jr/oh0ClaZ19oqP4U4sDfMv4TbxNYDxVtqulZBa9bvlAq2Jnb5h6DbLjZjrpTuRH/aUMNre0fP
	91V/q1oJyg3IxOPpvA9Wwm1EH/x+CwlmNsrS7IEJgm8MxTF3w56LgO6f/VwOk5iKHDnn6c1mz7XFC
	rt73DljejMgDim7ndLW7dXUyheUcYr8GT7CjWkTnwa51QRyfcVuiDcSJGSHXvm7jcOXtnilrglsBN
	IpYyB240yqUtRN3VLQdCJ440Mux9LdS0Zcat5tBqNmmzNO4TA3ZuSzG1m3R5k0GDXH3JITKLCKU4d
	Bz7ufBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrGP-002MHo-1Q;
	Thu, 13 Jul 2023 08:01:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrGM-002MFx-0g;
	Thu, 13 Jul 2023 08:01:23 +0000
X-UUID: 71094c52215311ee83ed1395ce914268-20230713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=zBFrJeaVuOlZJ5x60FP6yVcCWdT4J5D5DM/RntOP7yo=;
	b=b5nu5evhHPXhxOJs8qFAv4nwcwqLcfYVH1Z/N55nD749VleqfFrOd3gumfQavV1EemsjMak2UNC7/2t+yHEjf2hxhGYVC72eJ/ozM+2jS5JpEaYC736saz2pm/8Ud6pU6VRA8dkLQKoFH87SGB7Jr5AfwwDrc+2js/eK4xmGwUA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:c1dbf973-c844-4008-a4fe-54f1082085c3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.28,REQID:c1dbf973-c844-4008-a4fe-54f1082085c3,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:176cd25,CLOUDID:31eb2f0e-c22b-45ab-8a43-3004e9216b56,B
	ulkID:230713033818QXHTBWCC,BulkQuantity:7,Recheck:0,SF:29|28|17|19|48|102,
	TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 71094c52215311ee83ed1395ce914268-20230713
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 965313258; Thu, 13 Jul 2023 01:01:15 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Jul 2023 16:01:13 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 13 Jul 2023 16:01:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FT3huqZRi7WfuATAdfR7n+GqKM5Spx053FuILabfAQz/g9/4fxpO4s7N4ZcJts+4dAYyw1npwQiotAsWR+DfwieKCvl8FfP/UXMJL1qz1OYP27Uj7vIJ9hDykTEconPj/k9BNCeKZ//F93khGe4lviAEvfuR72N1eC56fTarwnPrlUuphCPPnH9fjMSPXUoWXPp/bDkSMNxZsxnH4/QfJFVmW43IpkecKpgxcdnDNAnyC0sDLK3PT/uuG2TRHlMm3B/GqTnZuRykF5xp6FE/Odgj95/bEQauxfhvhVe0cdsxjQEzcLtfwafvOVFtlOhJNpKmXSP21kPiPgkV94kE/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBFrJeaVuOlZJ5x60FP6yVcCWdT4J5D5DM/RntOP7yo=;
 b=Xk+pYMUFKLj2QhdZ0nbrMCwZJTLRFSuwUNNCzs0VynvkpSN2axCupwmluABg+sFNjCmVHCZRzhrKlZnBKur4MZXzxLUbibhmwYN6iWjLOniFji0xG+XjgBGmMIO4ON4T5xM4EXhRF+sYD1zJbaI4pb3RA0oyMqUf5sbo4aq0vp2J4Re/VFnho+4WpHOenTVPiph756A7XwMLC4TnxeGCyC14AkEDC8u/JPW98Mr+U5aFo9XkrNm9/SVZyuOTXB28da8+LhPN/gG/yiWP2Ri4JYplSuIQq4bobMC4+oip3qNHYyN+Eo9f5XG8uOx+LSapuZO9Oaq6I+ahgXr6lo+BTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBFrJeaVuOlZJ5x60FP6yVcCWdT4J5D5DM/RntOP7yo=;
 b=R33tz+6Cp6Te9dF/DdeoANV2tMwPyIwOv1XXKuEkHN7TQw1nvVHTpDmdh+xTgeCZeyKnHHCsnToBNPXlfJ+OjjNI8fQI+s3RRL0dKcnKYRmlkPOyewSXRrinpUQPMHmPKPg3uLMaeIGLlS77Lpdu4q8JqC2+DDL/AZJX1ztG0uQ=
Received: from SL2PR03MB4204.apcprd03.prod.outlook.com (2603:1096:100:53::15)
 by SEZPR03MB6596.apcprd03.prod.outlook.com (2603:1096:101:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Thu, 13 Jul
 2023 08:01:11 +0000
Received: from SL2PR03MB4204.apcprd03.prod.outlook.com
 ([fe80::308:e3ed:1ec8:f918]) by SL2PR03MB4204.apcprd03.prod.outlook.com
 ([fe80::308:e3ed:1ec8:f918%3]) with mapi id 15.20.6588.022; Thu, 13 Jul 2023
 08:01:10 +0000
From: =?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>
To: "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "andersson@kernel.org" <andersson@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v14 10/12] remoteproc: mediatek: Report watchdog crash to
 all cores
Thread-Topic: [PATCH v14 10/12] remoteproc: mediatek: Report watchdog crash to
 all cores
Thread-Index: AQHZsJO6wBJMBqxuAUKCjzqp4WPqrq+2j6IAgADPlIA=
Date: Thu, 13 Jul 2023 08:01:10 +0000
Message-ID: <315df6fe5006cab529f776500e0474bd1d5bc7ff.camel@mediatek.com>
References: <20230707052612.27521-1-tinghan.shen@mediatek.com>
	 <20230707052612.27521-11-tinghan.shen@mediatek.com> <ZK8BJOXcBjjLXUlu@p14s>
In-Reply-To: <ZK8BJOXcBjjLXUlu@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR03MB4204:EE_|SEZPR03MB6596:EE_
x-ms-office365-filtering-correlation-id: 4a01e294-600d-46b5-006f-08db8377525e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /dNav+sKQA5kJrZff0zRkRsCDZvf/ATCo+fML42kpd2Mm4CFSPOKj1FZeR3UoFbjDiLhMIX4Ajb0LPIfkgoChWHfqQilI1NLbMuVyG5qIf8bpoSKC0qT1fFbV/lpXL2BombGeWWO/DT04giRna3EHvzXf5tpc0mK/7D6vi+XMU1jFyjU+fdTUUgh3SiIAP9WL4OH9KtiPacLE9ysK/93QIQUS25nsY3cY7FiY3JbzLGpcVSbhpA88wWjnvj2dpsomVKZPDDnx54ANR6nqA1FB3J/6ZnsrUkl2dGGhtaI0+V8VDbddbcOWshFVPDgx61sTxDOPe08HkE1EL0rGiyIFCyYaS20dWJMZAmXLupndCP4GIQBdacZNamqvTX6qZ1agSCyJYVHDR73UAIHuXvGrIzOQsV5yZlVJOEJTDxUAaC0yrrpsOotTl7Sv2/oG8E1Pi9rwtX3IcsQNc4WDmsgmBBivPwGbSa9MCGrgzI+dlOQQO66WYUxPQRKTy/W1gJ/Z9Sxt/GHbBE1E4/KuXRdyc+3QqzCtT1zJKjCCZ0sIS5pTZEXMPzpf38b3HWKsuw6wVwBTLcNWyg7zwKQswZksQgNvCG6Fzxx1hqLjeJ+PAocAxKrnlmKO/YAL9ia+Q1QJ+KFnTpGuq/GRO//hYKmnxpPxJK4VedCqhjkkPElNYw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR03MB4204.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199021)(186003)(26005)(6512007)(6506007)(2616005)(83380400001)(316002)(66446008)(41300700001)(2906002)(7416002)(66556008)(6916009)(8676002)(64756008)(4326008)(8936002)(5660300002)(478600001)(66476007)(6486002)(66946007)(71200400001)(54906003)(91956017)(76116006)(85182001)(36756003)(122000001)(38070700005)(86362001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXZCV0tvbndOOVltWGwvVDNudmZYQktsOE5mWXBpYkRzYlFseFA1Ui9iSTJp?=
 =?utf-8?B?YlJwa3ZSNTk2alVmeXRXbjl4bjI3Q3RDYTBIY0s0dFBlRTdXOUhWT2RzTTFX?=
 =?utf-8?B?bEFlc2g0N0JVbzJ6MlFCamxEY0YrbStPaFJNakpFYUp4WlQrT25UekQycDFp?=
 =?utf-8?B?bGxBcStrRzhhYTY4VjJSRnRkM2EwcU9VVTBHVkZMZkpoUWRuSFhLR2VFa1pP?=
 =?utf-8?B?SVJEOVM1aWc2RkovZWVlY3lsallLQ203TkZ6RXF1WjNQOWs5ODFDaXlXeTNp?=
 =?utf-8?B?UlM5TytqbzJhWnRmVzRqVDE3QzVGNmQ1ZVNpcE82a2tPQnNiZS9QTklGYjlU?=
 =?utf-8?B?U2MxT2R2bzN1NjZMUEgwUEFzOGZsVkUyQnYvTGdkclgzbEVDS20vc0xpSHpi?=
 =?utf-8?B?U0VZMFIyV0hSTmhkL0FTVkFzZ2hvU2tNcHF1ZWpBTGlkdjJVN1FUazBvaHIz?=
 =?utf-8?B?MlJtbCtYNm5ZVmZ0WGxlcUZmaEg5bnhYNXdadkczT1JDYTlqWmV1VUJhbW1t?=
 =?utf-8?B?a0t2aENrVkQyYitQRXhQVlZmRnNyNzcvMXI4WXh3aTgyMWdUV1hFWHZGbkFV?=
 =?utf-8?B?cWoyRXNHQ3hMZ21SMnZEVGI3RTdiby9kU1U2bEVJWU9mTWw5UUw1cVM4dnBT?=
 =?utf-8?B?THQ4VWZ0NmlLQVA5bzBKMEQ1QTV4amc4RmtMUzVidld0UHpWUXJUY2x3ZzhJ?=
 =?utf-8?B?TTRnOTFYTW9yUmdzTFo5TGU3QUZhcE9TM2tQa1FmYXF4cHF6eDhDYThBYmdM?=
 =?utf-8?B?c2JwK3kwckttS0VORExwNXdPOWt1UWs0aFJKL1F3UHgrZXJLQ2o1RGFiVy96?=
 =?utf-8?B?dnVWK2ZwOW8vYXVaVHZMSmFDZlBMZ2RtVEtIS3hYUldYakpNZmFza29FWEIy?=
 =?utf-8?B?L1VXbEI0dHJqT1pRL2QybFdzZEFVV2EwdnYrbGJOVDF4SEMrNTR6eE1XdFoz?=
 =?utf-8?B?cWJwYTNXY2JFYVNUcFo5V3NabzFjSDdKNUlkaVBxeFBzdTBxaXgvbUx0U1g1?=
 =?utf-8?B?UDFOUmx3V3orZ1ltM0E5YWZuTmtxZGlEK1RVTWpWSkV0dS9jVWdzTzd6TkdQ?=
 =?utf-8?B?Z2lQa1l2aitCV0txbUtlUFJhZU13bkNFU21kSEpOakFERGZyMXZjS1RMVjRQ?=
 =?utf-8?B?MTFFQzRXN0k2b1dDU1o4S1ZQTG9USUEram94cnY5dmdiVE5ETVlrQUhGclFU?=
 =?utf-8?B?S0c4UVorUUpVbUE4VmswQkxwb2QxTUJkUzZSZUZUYVJSSGpoVy8zTHpvL1JN?=
 =?utf-8?B?cW85UmVKcS9qa3dzVmdJdnZ5VHMvbmgrRGFEMTI2NnVMeVE0Vm1tNnkxQUJq?=
 =?utf-8?B?TDZSc2tQbVMyUFE2aDk2bFlYMm8xNzBLcGZRUlVLUWpxK09LV080RjI3dENz?=
 =?utf-8?B?bnFLRlNpR1N3UUtveWFhVFhid211WXNUQ1BHV1Z4NVZUeDhRbE1EYVY3dTBQ?=
 =?utf-8?B?bnJTc2wxWXNYN3RlN3VoZHBianJud3BoQS9PeElobGhDZnZaOTBNWG53MERX?=
 =?utf-8?B?Y0tkVzVEUkFKTVpWeFdNU3dhaHEyQ3lPZFplbkkxZTNoT2ZxbW4vQ2pwZU5T?=
 =?utf-8?B?WkJFbEdCZTJMYk1VQTM3Q25tUUJ2amNNNEJVZE45bDVWSmtGakxEdjlBTDJT?=
 =?utf-8?B?MzJhQ3c1NTJzWEhQNzkrb2UwZHpMZmF3cG94bE45S2VsbU9NcFdlNW9rVnk0?=
 =?utf-8?B?akdHR1I5YXpjUnlGb0tXYUUxZk1EWUtaeW1QdThGUjRKZHJQT1JEa1pubHpu?=
 =?utf-8?B?dVl0MVAwMWppNkNLMXIycmZ6eTZ2QVdHTGhsTTRnOEx5ZHFoLzZrY1dVTVhv?=
 =?utf-8?B?U0VkNXU3cncxbkV0RGhNUGFXQ3BCN3hpc3UvdE5EbXU0L1RFaWdBTE8zR0pS?=
 =?utf-8?B?c0JCRE9YUkYzNis3MDhiQlVzdW5JT3lxRUdGS2NKUFBOUnhHcmhOTTBRd3FS?=
 =?utf-8?B?MXR5OTg0WlBRMWNkU2FldUxzaXduaGtmVk9RdkNVeXdUTlZVMS9CakpBNGdy?=
 =?utf-8?B?ZmFjOE85cUxEZE1NSmdhMm5Xc3NBckhFd0lOZzlidlZNYUZYZExxbHJLWjhX?=
 =?utf-8?B?aEhHQy9BZWZLYmx5WnF3bGhsK3VHOU1mNlNEcGFVbFhhTmRLN2dOQklVcEdQ?=
 =?utf-8?B?aGxaZk53Si9KVVd6bGFRbFc4Lyt2aEhFNzVvNG5vMXArb2JrWXp3aTkzVkxZ?=
 =?utf-8?B?MVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA1F7F334F78F74FAA0C0C74186862A0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4204.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a01e294-600d-46b5-006f-08db8377525e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2023 08:01:10.9104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kjk2A/SmjD9qSOmMpDYn/kmZnAUhsYlaK7oCaj53vFgsQRltgq39HoS8Oj/NfTH8SDDivh9m9u4errn4NYJii/fBVaU98mPLo6ueyXi0Kac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6596
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_010122_262540_08140B99 
X-CRM114-Status: GOOD (  20.73  )
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

SGkgTWF0aGlldSwNCg0KT24gV2VkLCAyMDIzLTA3LTEyIGF0IDEzOjM4IC0wNjAwLCBNYXRoaWV1
IFBvaXJpZXIgd3JvdGU6DQo+IE9uIEZyaSwgSnVsIDA3LCAyMDIzIGF0IDAxOjI2OjEwUE0gKzA4
MDAsIFRpbmdoYW4gU2hlbiB3cm90ZToNCj4gPiBPbmNlIHRoZSBTQ1Agd2F0Y2hkb2cgdGltZW91
dCBoYXBwZW5lZCwgdHJpZ2dlciB0aGUgcnByb2MgcmVjb3ZlcnkgZmxvdyBvbg0KPiA+IGFsbCBj
b3Jlcy4NCj4gPiANCj4gDQo+IFlvdSBhcmUgbWlzc2luZyB0aGUgbW9zdCBpbXBvcnRhbnQgcGFy
dC4uLiAiV2h5IiBpcyB0aGlzIG5lZWRlZD8gIFdpdGhvdXQgaXQgSQ0KPiBkb24ndCBrbm93IHdo
YXQgaXMgZ29pbmcgb24gYW5kIGNhbid0IHJldmlldyB5b3VyIHdvcmsuDQoNClNvcnJ5LCBJJ2xs
IGltcHJvdmUgdGhlIGNvbW1pdCBtZXNzYWdlLg0KDQpJIHRoaW5rIHRoYXQgdGhlIFNDUCBzaG91
bGQgaGF2ZSB0aGUgc2FtZSBiZWhhdmlvciBhcyBhbiBTTVAgc3lzdGVtLiBJbiB0aGUgZXZlbnQN
Cm9mIGEgd2F0Y2hkb2cgdGltZW91dCBvY2N1cmluZyBvbiBhbnkgb2YgdGhlIGNvcmVzLCB0aGUg
ZW50aXJlIFNDUCBzaG91bGQgYmUgcmVjb3ZlcmVkLg0KDQoNCj4gDQo+ID4gU2lnbmVkLW9mZi1i
eTogVGluZ2hhbiBTaGVuIDx0aW5naGFuLnNoZW5AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+
ICBkcml2ZXJzL3JlbW90ZXByb2MvbXRrX3NjcC5jIHwgOCArKysrKysrLQ0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcmVtb3RlcHJvYy9tdGtfc2NwLmMgYi9kcml2ZXJzL3JlbW90ZXByb2Mv
bXRrX3NjcC5jDQo+ID4gaW5kZXggOWZlZDUxNjFmMDk0Li43ZTc4NmFhZjA0ZTEgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9yZW1vdGVwcm9jL210a19zY3AuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
cmVtb3RlcHJvYy9tdGtfc2NwLmMNCj4gPiBAQCAtODAsOCArODAsMTQgQEAgRVhQT1JUX1NZTUJP
TF9HUEwoc2NwX3B1dCk7DQo+ID4gIA0KPiA+ICBzdGF0aWMgdm9pZCBzY3Bfd2R0X2hhbmRsZXIo
c3RydWN0IG10a19zY3AgKnNjcCwgdTMyIHNjcF90b19ob3N0KQ0KPiA+ICB7DQo+ID4gKwlzdHJ1
Y3QgbXRrX3NjcF9vZl9jbHVzdGVyICpzY3BfY2x1c3RlciA9IHBsYXRmb3JtX2dldF9kcnZkYXRh
KHNjcC0+Y2x1c3Rlcl9wZGV2KTsNCj4gPiArCXN0cnVjdCBtdGtfc2NwICpzY3Bfbm9kZTsNCj4g
PiArDQo+ID4gIAlkZXZfZXJyKHNjcC0+ZGV2LCAiU0NQIHdhdGNoZG9nIHRpbWVvdXQhIDB4JXgi
LCBzY3BfdG9faG9zdCk7DQo+ID4gLQlycHJvY19yZXBvcnRfY3Jhc2goc2NwLT5ycHJvYywgUlBS
T0NfV0FUQ0hET0cpOw0KPiA+ICsNCj4gPiArCS8qIHJlcG9ydCB3YXRjaGRvZyB0aW1lb3V0IHRv
IGFsbCBjb3JlcyAqLw0KPiA+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeShzY3Bfbm9kZSwgJnNjcF9j
bHVzdGVyLT5tdGtfc2NwX2xpc3QsIGVsZW0pDQo+ID4gKwkJcnByb2NfcmVwb3J0X2NyYXNoKHNj
cF9ub2RlLT5ycHJvYywgUlBST0NfV0FUQ0hET0cpOw0KPiA+ICB9DQo+ID4gIA0KPiA+ICBzdGF0
aWMgdm9pZCBzY3BfaW5pdF9pcGlfaGFuZGxlcih2b2lkICpkYXRhLCB1bnNpZ25lZCBpbnQgbGVu
LCB2b2lkICpwcml2KQ0KPiA+IC0tIA0KPiA+IDIuMTguMA0KDQotLSANCkJlc3QgcmVnYXJkcywN
ClRpbmdIYW4NCg==

