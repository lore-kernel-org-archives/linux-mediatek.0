Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9529C4167D
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 02:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H57zQTBpI+CmOu18rnatzWEkfYHvedIn4O57Ntpy600=; b=3Lto43QMT5dhdWTEZDwI36nKtB
	+ejJv2NGDEwQvTf96/hMPb83YGdHyPb6dD6sWczNv6g0D4kiElcks6GhwLVXrW3r314UN4EixA1C6
	Xrn7uqvYFAF//IuM52L5QtSrrNvMCXVr3SxzykFTK7atqErHn7raajL0d0vtyjoV2sTKqFhS+4rOy
	Y2Xk+9uYzadSrdvX/HI2+/20Ii1qiSzVtOUCxxwypf/L1ZlRIKZU4sQnHZ6l0wuy9ZFc1u0Uk9KeB
	KDLTyiVGINhJ1BLE0ict20vX8H5P3YEanMC11uaAXM/87PYz+pYkzFKvEPmtxtst1k7MB/6l5wkDb
	/Ms8R9NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDyFb-001qWB-1z;
	Fri, 15 Dec 2023 02:48:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDyFY-001qVT-0J;
	Fri, 15 Dec 2023 02:48:29 +0000
X-UUID: 696d09f09af411ee9b09ad09c76753c8-20231214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=H57zQTBpI+CmOu18rnatzWEkfYHvedIn4O57Ntpy600=;
	b=GcFeTLl4BZp2RlXZWJ764sPkqoQ9uXPR336GC5djXbkeycRZqDAimXdnoV5plQOw0BACKw92bRfSTYdCPqnHRimbWfTDtbK0EDCqTXroTXpmo+f5TCzbcM/AgCXzsO/C6wy35XEHlZaryER9EDBF8cJwmRJBXJ09AjuvE86kSkg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:902c5f34-7fb5-4bfa-95d8-19800aaa2433,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:48a43861-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 696d09f09af411ee9b09ad09c76753c8-20231214
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1940857184; Thu, 14 Dec 2023 19:48:22 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Dec 2023 10:47:45 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Dec 2023 10:47:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuhBbObqzXvt/tvqvviLjRnG9yBvvmiEUE1XXpwDnkbMRL1msP6PdzxMUKeLEbT5JcOYjR1QGQWLXpwxf9C7CBDMG4y0Hr4YUva644kByeAz5467HvfzyQIL8+zsUH0vmPZhfspAvK0kJsnQgDEuBbCbsNjr9c2BU0kYcjxBAeIVsK9Wn+s/2w3os0hNuRme/xzuVBhjK9YM2s7kOvSAYjEuaepEsLBuwHx75QPSoUQbR2GvYqn3plMtqgycB3KbUcgZ6aMCofAWQ1catUMlSZbJyPVzMjQxiA8Rg3v4MiefC/ekV1ePljygvMNVvUeoRAjackYDJ8m2QEoxo8MvBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H57zQTBpI+CmOu18rnatzWEkfYHvedIn4O57Ntpy600=;
 b=QBuW63sj96z0xT8myxvFXnDf6JSybmAyspZsAnr6zZvQfnCy+tVsz4l2ewsOAzIv6+So9eFMGK+bsmBz+Ewgyf1ZIdfnXqjhwiIKedJi1T83kO+AY3qMnyv+Ri5WGoXqJH3lbAIUOxKrNfth4UpE4aX5m57yP2aAjPItByQfBet79yXxHKbXRljp4LehBuOuSnYvWerWgySGDt5niKOy/PGtXLA5wBvmLjmMsDcaTI/NyhaIP8lHZgRyAxhXuzL88lJoTxhDB/O05+H6PYfOAnB4E3zLPGUawJI/+gimfSFZBAa2Gbo6ylvi6HKR3Q60xd/sKm/x5tP5Rw7JexamTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H57zQTBpI+CmOu18rnatzWEkfYHvedIn4O57Ntpy600=;
 b=IJg1ISD5vywoWBVDhZuviRfSktBDwa0NwPxImtW6NwuRKUWuncMWKzf2OOSJjP0F8GeWOAqaSPu+cAkJS1ZQ1+ht47U0z3w8UjVsx8gi19IMKLy7zfbLO6nUsZEYonjjQvj9YcuEsKZbTVIHCMUOvOyllmMgzxiGhEnIYOTAiiE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI6PR03MB8705.apcprd03.prod.outlook.com (2603:1096:4:24f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 02:47:26 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762%7]) with mapi id 15.20.7068.031; Fri, 15 Dec 2023
 02:47:25 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
	<Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, "jkardatzke@google.com" <jkardatzke@google.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH 2/2] mailbox: mtk-cmdq: Add CMDQ driver support for mt8188
Thread-Topic: [PATCH 2/2] mailbox: mtk-cmdq: Add CMDQ driver support for
 mt8188
Thread-Index: AQHaLv+J35VA9xSS80SU+XeYvP8M0LCppBEA
Date: Fri, 15 Dec 2023 02:47:25 +0000
Message-ID: <e2952f5296d57ded1a18a0313bd44412c8e5f6b6.camel@mediatek.com>
References: <20231215023546.6594-1-jason-jh.lin@mediatek.com>
	 <20231215023546.6594-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20231215023546.6594-3-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI6PR03MB8705:EE_
x-ms-office365-filtering-correlation-id: cea2f106-8d0d-42b3-ac41-08dbfd182ba8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1u9UMrUxC9vAVVEz5Zv78bq33ckzQG7myS/1bBN6GIT/vk+c3KYU3A6FeDI6gQQRUNhCCHlgo3kL1uxf9woMV7N7wfcWgmUOHSDbHx6JKNkeAYS8JUAIEdMeL1SoVjqZ0OY7KzKZJHzUaRdPhGZHoY2HwgNfcs+trqwzWC3C4S4tx49o2+kB/+tHHaazJCKIta0gViddvUxD3pc/JA3cHOuEWPdrE/QVfNxFs4Ogz9vaVb6beeWF4G62oKjhOXCeY6FrI5q3ZvJz5s7s0OCT8U4noPhLeXlM5pQKVXggN9AZOEqD9wLjK0dn+AHrlF8dE0vlRx8fp2h8LL/UE07VMRDf0DmPSWdj5UKOLTLIK11KCvvV4ENVhVQKVJzf9lrfYSaHW7I7p/L7obElHqBmOKUJhgBQ0R1h4FMB75wUMa2xGnh42GUI/msL8XOuS3GiLOZvuQ6W0Qjey3Evqbl/ArcZh2j8ZY7arJ4a1D4WoBuBPOxUsXjf0L/LGmIyis1SuP8SsZNkYom8SJSFw1qOAFp2r5WkGswN+2cODme3pzeTtL9wP8M58R7qJ2NJ+CecF45DK+H27LSB0fgUJzIEpfsLT2wdIPiO+jbAtIfAgBaU5R/rD/ky8Mi8CwXrLeu2jfTv4rHnBbWeS41a3TTZ3x5ZRECek9YTD4JMC0fB4DQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(39860400002)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(2616005)(38100700002)(6512007)(6506007)(71200400001)(83380400001)(26005)(36756003)(85182001)(478600001)(6486002)(41300700001)(64756008)(66446008)(76116006)(66556008)(66946007)(66476007)(110136005)(8676002)(8936002)(54906003)(316002)(4326008)(4001150100001)(38070700009)(86362001)(2906002)(122000001)(5660300002)(15650500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1J5UkliaFVpdWovdHFkdGFMbWx1WlpJeUh1UGdoMVpkWGlEeWo2NnNoWXQ0?=
 =?utf-8?B?eGpRZngvTjhBNm9HNVpOTENjWlkwaTlseU9uT0lCMUtqWGgwREpoNEVBMU1p?=
 =?utf-8?B?ZGtDbXB0Z3RwQ0FaclFISzJ4UlAydE1iMzZ6V0pFY2V0c0NtUFd5ek9MTjB0?=
 =?utf-8?B?MTkwMTYwSlFncUFCMU1kWGxEQ21kM3c5RHBPNTJuenJEMlNGazFzR3pIM2pH?=
 =?utf-8?B?bUNtR2gyWUh2eVlCbFZoQ2JjY3hraGk4U2NaRUpBYjVNeERoRFZqdFFBZEdH?=
 =?utf-8?B?NFJ3SUtDQkxYMzlkNEttZjZSVmZKVjh5MzhST2xxU2RBZ2pha1VmVnpNMktH?=
 =?utf-8?B?VWNHenFqQ0ZJc205R2VZcGlMU2RHbXBvTU5JM2ROaFNZb3ZBdnpSQXZJcDdq?=
 =?utf-8?B?emJ3eHFFL3pNUUtPNGRnR0VvV3RDbnZMNmlkSUZCVEtwc3ZlU1NJTmJHK3Zk?=
 =?utf-8?B?cnJjMUhMbjdyOXoxL3p1cFhhZUhWdDgxaFlwemVReGNUWTJYbStrb1R3cUF3?=
 =?utf-8?B?Z1VhektEcXp2RHdGS2UrYjk5N0kvd2UyZlhQQ0g1T1hodFhaZE1adjFHNWlI?=
 =?utf-8?B?RE0vemxmV0JKeENIQkgvUFJyTzhHb3NJWHZoUmoyeFZSUkhWbTdzenRpZDVO?=
 =?utf-8?B?VFNITjFvWWt4MzZVMkVTRE9EZmpOYXJIMnVwaURzeFo3R0JGaW5OMTE2djFa?=
 =?utf-8?B?eGZNTThXTDBwaWxON0gyeUhZSDJJaTFLSHVYSEhDOGg3OWlKTzJFMXZ2RG5s?=
 =?utf-8?B?R0llaVErQWdGRFJmOWZ6RGhEY1h3ODZDUFVMTEpSWnB6eDBycWdlS1Q3NWN3?=
 =?utf-8?B?VkVxMUUyR1dUN001VXlBdm1lOTE5OWFXcDVVUkNZK01QRjR1VFd1eTVBREJ3?=
 =?utf-8?B?ZHR5cXZHV09EMzc1alFYVTVsMy82amhVT2ozMjFJVkJMRnloakVvSHlocFFH?=
 =?utf-8?B?Vm14NEZLY1h4Y0hxYVZtS0d6VWJNdlNXdXRHUDY2bEszRkVsTmIxdys1Qisx?=
 =?utf-8?B?ekhNZ2NuOTR5VHAyNFpjdzBEYXBMTXhVOU91QmcrWFdCZXFCZElhbDFoRGpE?=
 =?utf-8?B?aXhLQXBiK3JyOXVmWEVGM0dFNnNRUUJKTEZadzBjRlZMYTJ4M1pSOUVhYUVL?=
 =?utf-8?B?eXZKN3JEMEIxVUo0TGhRK0wwaDJTaE5jRkF0MmtEdEw2YjF3MUo4RXFDU3N2?=
 =?utf-8?B?b1Y1cjlkejA1Mlg5bWlVYVdUdkdSWlpyL3VENHZPSEFlK2VVSFpEZEJ3TmZo?=
 =?utf-8?B?U09IdkcrMGdiT1YwNlZIMUh3SnVHaUh3R2NSQ3RQT0NJREorcTcvOUdhSU5G?=
 =?utf-8?B?T09TNHFlaStMdjhFY1ZKWUFiem9HMnd3QWJ4emFqc3JoK1hob0lwcWpuOTEy?=
 =?utf-8?B?M21hemhkaktxbzhyNFNkNWw0cmJTMDc1MjBVM0RCUnZSTTNrM2dVVGpyRFFM?=
 =?utf-8?B?cVFISTVDOHMzbnV0dmZ3azlRaFc3Wnl5MDI1R0RjWkVpTWZ0VVRNTUFYdzQ0?=
 =?utf-8?B?N1dyOFQ4U0grWDJyL2ZzeGphSEZVUDMwSERoVkc0bTFVSFp1YnJxOXdUOEEw?=
 =?utf-8?B?K09WWlVZWEFyTWtaa1NMcWN6SC8vaE1QSjA3M0tUQ2I3UnBmNXRzbkJiSzk1?=
 =?utf-8?B?VVg5QUhvSjFXTnI3WFIyM3FXaVoyVER5ZDV4d0Nhc3hWOWNoZk5rOWVLUmdm?=
 =?utf-8?B?Mis1YTR3YlFXWWIzSXZNNUZOalZ1d1UxSWdEeURNU2xyS2ViZHgwVW9NNTBE?=
 =?utf-8?B?RkhhNWRYZmtQZmFOaS9SMzBPMzlucVRaeEVWMlQ5Um1lWkpyL1B0cjRnMHRa?=
 =?utf-8?B?dElKaTAzelVQZjFLdFg3RUU2Y1VXd0R0MHhnUHIzT3VWdjJqdTljL3hKL1NG?=
 =?utf-8?B?UU1KSVJMRnZmNEw2T3VoNVpkbFBOMEdhblR6Tzl6clVNeUVkVENmdUNKTXF4?=
 =?utf-8?B?Rm9lNlJCOHhYSjcvYWJYWjRNNk0wbk9icDJObVNEQ0tkYXdZWlE4WFVZL1Fj?=
 =?utf-8?B?NS9jOFNFeWsrVTlNRytiSm9YKzRvSThpTkxMbFVaUXdQcGF4QWswVnRhTkFL?=
 =?utf-8?B?TlpnbXVNV3ZURkxnNW9tSHNiekw0UEo5QW1yY210aVgrbjhYeGpycnNwT1Fp?=
 =?utf-8?Q?YcGeWA47bvluWzmQG5g/kU0vR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7FBBDFD7505D845BF0B66C7566E81DC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea2f106-8d0d-42b3-ac41-08dbfd182ba8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 02:47:25.6453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ydsIMDF79m4SazLNnO/rigSHk+dP7I0sMMo0K8FQfdebEkyI+VEipzGnoMB9BlwX2ArvZzSqQTFzJdos2G8tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR03MB8705
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_184828_143980_C578BB3B 
X-CRM114-Status: GOOD (  15.71  )
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

SGksIEphc29uOg0KDQpPbiBGcmksIDIwMjMtMTItMTUgYXQgMTA6MzUgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gQWRkIENNRFEgZHJpdmVyIHN1cHBvcnQgZm9yIG10ODE4OCBieSBhZGRp
bmcgaXRzIGNvbXBhdGlibGUgYW5kDQo+IGRyaXZlciBkYXRhIGluIENNRFEgZHJpdmVyLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSmFzb24tSkguTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMgfCA4ICsrKysr
KysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0KPiBiL2RyaXZlcnMvbWFpbGJv
eC9tdGstY21kcS1tYWlsYm94LmMNCj4gaW5kZXggNzZlNWY3NjI2MjhjLi42MTJiOWZlYjI1OGEg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gKysr
IGIvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0KPiBAQCAtNzQ5LDExICs3NDks
MTkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBnY2VfcGxhdCBnY2VfcGxhdF92NyA9IHsNCj4gIAku
Z2NlX251bSA9IDENCj4gIH07DQo+ICANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZ2NlX3BsYXQg
Z2NlX3BsYXRfdjggPSB7DQo+ICsJLnRocmVhZF9uciA9IDMyLA0KPiArCS5zaGlmdCA9IDMsDQo+
ICsJLmNvbnRyb2xfYnlfc3cgPSB0cnVlLA0KPiArCS5nY2VfbnVtID0gMg0KPiArfTsNCj4gKw0K
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgY21kcV9vZl9pZHNbXSA9IHsNCj4g
IAl7LmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2Nzc5LWdjZSIsIC5kYXRhID0gKHZvaWQNCj4g
KikmZ2NlX3BsYXRfdjR9LA0KPiAgCXsuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZ2Nl
IiwgLmRhdGEgPSAodm9pZA0KPiAqKSZnY2VfcGxhdF92Mn0sDQo+ICAJey5jb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10ODE4My1nY2UiLCAuZGF0YSA9ICh2b2lkDQo+ICopJmdjZV9wbGF0X3YzfSwN
Cj4gIAl7LmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTg2LWdjZSIsIC5kYXRhID0gKHZvaWQN
Cj4gKikmZ2NlX3BsYXRfdjd9LA0KPiArCXsuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODgt
Z2NlIiwgLmRhdGEgPSAodm9pZA0KPiAqKSZnY2VfcGxhdF92OH0sDQoNCkkgdGhpbmsgJ3Y4JyBp
cyBub3QgdHJpdmlhbCBmb3IgYW55b25lLiBFdmVyeSBTb0MgaGFzIGVhY2ggc2V0dGluZywgc28N
Ckkgd291bGQgbGlrZSB0aGUgbmFtZSB0byBkaXJlY3RseSBzaG93IHRoZSBTb0MgbmFtZSwgc3Vj
aCBhcw0KJ2djZV9wbGF0X210ODE4OCcuIFNvIGRvZXMgb3RoZXIgU29DLg0KDQpSZWdhcmRzLA0K
Q0sNCg0KPiAgCXsuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItZ2NlIiwgLmRhdGEgPSAo
dm9pZA0KPiAqKSZnY2VfcGxhdF92NX0sDQo+ICAJey5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10
ODE5NS1nY2UiLCAuZGF0YSA9ICh2b2lkDQo+ICopJmdjZV9wbGF0X3Y2fSwNCj4gIAl7fQ0K

