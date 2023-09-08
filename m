Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9AFEE57E1
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 07:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FInNzdWnIpk+q8+lO4NOGv1g80Kud0iR384CJkiOb3I=; b=urHDSytnyVZBEqsOlmuqcBZxTF
	okNZUG/+7Ap6vjeW8RCIhfkd/m/tDV65nksJZrM41b+7dJ0Jb7Ccg35uSPFLfhQtNVQRaNN5H+2EP
	nqLrMkuFihiCGaiEWtFW6szWT1NrHywkUmGxhvScEs4EennEH040VP3kcq2kxi1E2xsRBIL92a9e9
	TaUsXEc2F+Tx79Cjta29szSTP6L8IWPxCx6ApVCJD/om4lr7XxMKhgMyMAzrfh2SYaHucZkkRd75L
	zePM4ROXr+HPbIWH6L4UX1GU0zBSiHHKA3gZ2Jf7Hef2Kz+GwL81MnQ2ZY4H71VNPllH85wjAhKYU
	ICnY6ZpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeWIA-00DGjW-0H;
	Fri, 08 Sep 2023 07:52:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeWI6-00DGid-2p
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Sep 2023 07:52:36 +0000
X-UUID: a809b1604e1c11ee86758d4a7c00f3a0-20230908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=FInNzdWnIpk+q8+lO4NOGv1g80Kud0iR384CJkiOb3I=;
	b=cHXv9bt1+nmWZo1c32L9+8rYNE06TAiJvRGZQ9yMFJ1/TyxV7IlXH7hzTSmJozsX2V/IaN+v5RAW7dEzTnwMS00vb0lZE8MhMzu1WFBMMoYljhqUMLaOiquGmOnH3ehh2mK3hub+D2CXDPCUgmdSjTWNKy8q/6UebdOXfodycyg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:a3fb8836-2095-4494-bf88-d57cbb627c1f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:9ab6b413-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a809b1604e1c11ee86758d4a7c00f3a0-20230908
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <tze-nan.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 993950138; Fri, 08 Sep 2023 00:52:28 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Sep 2023 15:52:25 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Sep 2023 15:52:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYSmHlkaQNW179q9CwMRhKwIu65W7PSxU1fgx654L5PXKNzmGPkMhEsCHsv748y56g7F+QLJAKDN+FjpwiOychPTpkdmhwMKitrzNtToUjKTlUZiaG73LNpQbZDXp7mLZvhUB+XbtW3m5c71cCxLHYu5pgH1UMHD7ZK5FjHqn8vEEf4ukSVInTxMZMwBveDR4etVz+N52cazxMqXdkvw0LvBM6njTAFuYwuEL+XOEWfI4Nwl9STDjf6kqoNDU6/2cOfrH1MqwFwbWcWbgvyT7T//ypTfsrUK4dHKDPKURhYwylDBpENHpGjOMxjmtlblTtC7UcEaxcycnV695+ivyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FInNzdWnIpk+q8+lO4NOGv1g80Kud0iR384CJkiOb3I=;
 b=OwoKn/4cllv8EEldyLicU/Yn3FjvsFAxtE33yAVCyvgVAMhDVkgBtCoHZH7amx5s6wAf4aH6Iupqq3RtMZ6YzmgvzaCtu95sH+TOascy8NBCwWdCZVJrUxxh9M14HqKtIou3eFRPlv7StLci9j53zrF8w6pU3AqK5AfEzB58TufNxY/VBl1MeSvrne0gTeHFVa27HsPUBxtDhOK+U0rppIlaE8pi2avb6oQp+0AEFfnYXXlLWILlGQJLvI+sOpTR/sSLo8Xp9JXXnkSp6oOvw2c70j8q4ve0SnABNYGz6ZjVtklAaWYblD7JXkFBndvi7Yq0+3n8Fpkdpee30rBcTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FInNzdWnIpk+q8+lO4NOGv1g80Kud0iR384CJkiOb3I=;
 b=hsoukmH7Hmkt7QE3Q6EfTWj9UGnwdexBG+sUBZxQ+3pqPFCYdq2WwkvQYnx2763RfxRlQO9d5R+CdWRgmXBaTmzcH+pm6JQhiGk56Y0SqH4ZyYVYD2cCiIzEbQXfscKS9q3r+6qFLhIrkOUzY72K7mOX+goBc13o4rP8q2qsUNE=
Received: from TYZPR03MB7183.apcprd03.prod.outlook.com (2603:1096:400:33a::11)
 by KL1PR03MB8120.apcprd03.prod.outlook.com (2603:1096:820:100::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 07:51:36 +0000
Received: from TYZPR03MB7183.apcprd03.prod.outlook.com
 ([fe80::f225:e6ee:8a9:ee06]) by TYZPR03MB7183.apcprd03.prod.outlook.com
 ([fe80::f225:e6ee:8a9:ee06%6]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 07:51:36 +0000
From: =?utf-8?B?VHplLW5hbiBXdSAo5ZCz5r6k5Y2XKQ==?= <Tze-nan.Wu@mediatek.com>
To: "rostedt@goodmis.org" <rostedt@goodmis.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?Q2hlbmctSnVpIFdhbmcgKOeOi+ato+edvyk=?=
	<Cheng-Jui.Wang@mediatek.com>, wsd_upstream <wsd_upstream@mediatek.com>,
	=?utf-8?B?Qm9idWxlIENoYW5nICjlvLXlvJjnvqkp?= <bobule.chang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "mhiramat@kernel.org"
	<mhiramat@kernel.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [SPAM]Re: [PATCH] ring-buffer: Do not read at &event->array[0] if
 it across the page
Thread-Topic: [SPAM]Re: [PATCH] ring-buffer: Do not read at &event->array[0]
 if it across the page
Thread-Index: AQHZ4AMSZ8i3KRUX2kOyE7jyhtvSj7AMbyqAgAKwGACAAAfmAIAAImwAgAFI+oA=
Date: Fri, 8 Sep 2023 07:51:36 +0000
Message-ID: <8bb1bf371ffe52f944b9a3e9ca02a587f7f6afe5.camel@mediatek.com>
References: <20230905141245.26470-1-Tze-nan.Wu@mediatek.com>
	 <20230905123953.3c0b3d7a@gandalf.local.home>
	 <3a89d49ae0da6378de83bc68690cf6664d97cb24.camel@mediatek.com>
	 <0944a5f3e10c0eba8b32e51fb941e0dd98ec086d.camel@mediatek.com>
	 <20230907081408.6156b6f0@gandalf.local.home>
In-Reply-To: <20230907081408.6156b6f0@gandalf.local.home>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB7183:EE_|KL1PR03MB8120:EE_
x-ms-office365-filtering-correlation-id: e40217b3-637e-41f2-cb02-08dbb0406d83
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6TRvNj0PpXmAUY2rcpHqjDixRaOPqT+wQt+zw8v8BDxsH+VnEn7q0xRws9GhHqdd6EJKNGNXGfnDiR7HjShMtn2GBhq54OZ50qoNAarJdjzUZiL75UEnJ6CfQZJrLxRthdC8e8o3DhyjLwa6YRZx+EFCZm66AmVX3aQwuZqzzNU+8jzc2O44u4PoMBPvzK1LT+baKK3WHhpP24ewT4S+wBXnrYzvavqh0KMNwzX0V1r6rWdRlGPkWkYryCSCPFxOZC7LOpquggo6A05gI0JTqEXwsmWphH3shoTRz6uojxWKpxI9fQ93uiRttpFT0Jbf3NeM9mWdk/3bN4zn+DSQUq3xdeWmnT5mBsbA1lmb5cubt6F4JBvShyXh99nh+gvJ9fQVCwcaCNttt+GUC++ZxYhSYA6sVjYROOA80EQf6lEQU4fyItJ9qC028Lot2HOk4W5l/PQbcnNXH5OFaeXiUE4XeDlHsOSvhw0majtMqe3c53QVY9GzDWjtdxt1/F+lcOuddD4BFp7+21ntiif4OI5HmLggDG7420Pi+nC5Gb6aOepOCYYWf+MmzrDGimpsPA2EjBT95+YEEV2jkFiXeO+y3ul4wJ7mfTZw4VKxmajpHdCHRv5/R7mtPmQn5EFwhadQ1XcJtdk4ujQsD1ZclxmAxzEm2jtQhwhpxNUhqj8AwwaQOirLoSt+TDL4aIBG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7183.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(376002)(346002)(366004)(186009)(1800799009)(451199024)(2616005)(26005)(6506007)(6486002)(6512007)(122000001)(86362001)(85182001)(38100700002)(38070700005)(36756003)(83380400001)(6916009)(66446008)(64756008)(54906003)(76116006)(66476007)(66556008)(66946007)(478600001)(5660300002)(316002)(91956017)(71200400001)(41300700001)(8936002)(8676002)(2906002)(4326008)(217643003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGczOHhMVVFqWkN5b0lVamUzK2hYM2hCVFMyNEd4KzZ3dE52NllXaTA0WUV5?=
 =?utf-8?B?djdLWW51c2lDelVRYUFoVEFMNWRleDFwRjJJOUF5Vkx4bWZtZ3dMTmNPRmk1?=
 =?utf-8?B?M0FlTmdJNDFRSmZIMlV2UlRIbTVSdVduSDdHbmRmYzNEZXJiUUpRdklGQ1JS?=
 =?utf-8?B?MnU1ZGdoaXpsbUJrMGtWUStaWHR1L1FxTnhqb3o5cFZBaFM3MlYwR25jTnBk?=
 =?utf-8?B?bTVxSk1UaEVLTlRjQnVFY0szZ0FJclZaWHU5cXc5bWRxS1oxeHJtMDJtQklm?=
 =?utf-8?B?RTM5Z0R6bzZUeXlJZ21YNW5uYXJDSkR5OTB4OE1iMm1PbVgwU3ArRi9rZzJv?=
 =?utf-8?B?Y3VlQ0d6WGpUUENCN2FNZzc1R3AwWXFNbDRxU3N4cmxyekhGcUxtVDRKWHd6?=
 =?utf-8?B?Zk5ESHpWb1ZBTVExdkFXUS9RVzFBV1VsMzQxbm5jMXpjM0s1S2Z0bVJ5eHY4?=
 =?utf-8?B?VDR3Q0o3ZE9xRTJMeEdab2NsakZWdDQ4S2daeHhGdzF0V2E4WHJiS0VrZDJR?=
 =?utf-8?B?RFppcFBWdjAvWGp3L2ZoKzU4Wmx4MElnbzN1SkludzcraExiUUJHcXZzaThx?=
 =?utf-8?B?a1hNZk5Cc0c4RXArdmtvRm5mR0RXV0hpNVZpVDl5emtWaEFUUDQ3MHN2MHFS?=
 =?utf-8?B?eEV3RnZVQmR6Zlk5N3VneVJhNXBwWFRsOHNkeXc5MDBMOXJSc1lwdkhVVnN5?=
 =?utf-8?B?bXdEaGNFbFNnU1U5VVFXVzJkSmlDelNkaE9QR0RkTWJSaUx5cnNxc2NudnNX?=
 =?utf-8?B?am1TOXI0Q3lnN05DRmorcGFOdUh5cFFtdEhOVHFIZ1ZPNm51NXYvV3hlKytO?=
 =?utf-8?B?WUhOMTQxR0gvdVlwbUd3TGRjM3F3bkdiMUxuc1hhQUpUV2R0bi9FZFVsR3dh?=
 =?utf-8?B?dGNaZThkUVJLd0JGK2lkZ0JYdjVpUi9iOTlOSFBJbm9wcmhxQVlidTdYY1c0?=
 =?utf-8?B?MDFsNitUeUZ2Lzh1aXVUTGtDcWR3VVBlRmh6Smp5ZmRVNjBzK0RXQ0tnT202?=
 =?utf-8?B?dXpWOW80VWE4bUV2bktHeFMzaW5SWVVnNEdSZFdBeG9jMWpOTzl2V0dyZGZ5?=
 =?utf-8?B?RUhSRStMYXFPR243TFJhWlFUWURNRzkvbkRyZ051MTVBV2F5Zm5kWTBJeDdG?=
 =?utf-8?B?OXdKZ1AzYndzMGJDYndmSEVzcTZMOC9GRE1ITGt6OWFEN0xvVlRreUU0R2RO?=
 =?utf-8?B?ZkVpamZmMWRrTDByeUJIU1UyTlZPTEd2REhSUE5IZnlxSnVlaWU3ZWZCdGxt?=
 =?utf-8?B?aEFHZElwbzZ0VG5MQ3FlMkp2OTBiRU1SREt6THlkU25PZ3FHNkxsK2o1NmVG?=
 =?utf-8?B?YTlyOUpPcFg2QmY3SVQ4YlJEdU5yUjVHZUdqaDNTTDZ3Zk93aEx0VWpDR3dm?=
 =?utf-8?B?M1ZmUzRnRjRCN1grVk4wYlNQc2JEb2VER1FqbmYyeUNmbm1zQWp1SVlSc1lk?=
 =?utf-8?B?dnlLUEtUL2RRVlZLNFk2amhVQ0lPZzNBUy9taGZUQnJ5NEZuT0ZBcUdSN0pF?=
 =?utf-8?B?V1VucnRUS0grb2F5RGxZY3BZRkdYY2xKdGlyZ1Fkc0JOUENxS3BPczNMeTlX?=
 =?utf-8?B?N1o4eUl3MzdvbGUzYWwyVnp6Mk1yVW5aazBzVDlDNUNOK3QvalBVbitJWW9Z?=
 =?utf-8?B?KzJpRmt2ZkZXRWJLQ2luK0tibk9JUmVCSE1IYjFyVXBhSm9VNTh1ZFMrbkRq?=
 =?utf-8?B?aVNudTgzdXIxTkdIMjZtL2wxY1UxaTA4V0s0eFpkbTRnK1l1M3VUdlY1NTFM?=
 =?utf-8?B?QWVCZ2pydDg1SnpMS3NtYlFya0xuSmRnMllwdjg1eUdRVGF5Y3I5RlZGUGsw?=
 =?utf-8?B?Rk8yY0haZDFMSVVEcTludEMyRjZ6QzZ3eExvdDFWc0thWTNBOTRKNWRiSEMy?=
 =?utf-8?B?dU1FZFlhZnlGMHYyeFhwZmpUaW5OaXljamRCRndaOVpQSEJ4TWlCZ1RZZ0I4?=
 =?utf-8?B?ZHU0UmtGWkUrY2w4ckluaG1Jait4R3RqYjk4VTExQzNUaHJoYXVWcHRNS3o4?=
 =?utf-8?B?aHN1VjV1ZnB5ckFIeUh1Z3hGckhyYUdndDZyaGpqenFoclJqZlI2alJ1ZzYw?=
 =?utf-8?B?T3RPQ3hvRC9Mc0o5SlZJUVRvUVJ0aTg0akZVTzJaT0t0T25KbG42ZVpzdmM5?=
 =?utf-8?B?R0lpL1pyN1Foblk0Z0lqRjc0NStZQXVoZXdBcjlwS2lRd01IcDhtVjdLLzlO?=
 =?utf-8?B?cXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BA69213FE009A44AAA495224BACAEFD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7183.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e40217b3-637e-41f2-cb02-08dbb0406d83
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2023 07:51:36.4653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jlc8P0VwfMz252F5jpsi/wvCD0LRNUCyKFmC+uzRGmPUQzT5b9b8yJ6R9X7E8Eqfr+keH5J3ZHbtz+FwDc5Nlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_005234_971366_F87E9DC0 
X-CRM114-Status: GOOD (  22.48  )
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

T24gVGh1LCAyMDIzLTA5LTA3IGF0IDA4OjE0IC0wNDAwLCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToN
Cj4gT24gVGh1LCA3IFNlcCAyMDIzIDEwOjEwOjU3ICswMDAwDQo+IFR6ZS1uYW4gV3UgKOWQs+a+
pOWNlykgPFR6ZS1uYW4uV3VAbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gDQo+ID4gPiBTYW1lIGFz
IG15IHRob3VnaHQsDQo+ID4gPiBzaW5jZSBldmVyeSB0aW1lIHRoZSByZWFkZXIgdHJ5IHRvIGFj
Y2VzcyB0aGUgYWRkcmVzcyBpbiBuZXh0DQo+ID4gPiBwYWdlLA0KPiA+ID4gdGhlIGJlbG93IGNv
bmRpdGlvbiBob2xkIGluIHJiX2l0ZXJfaGVhZF9ldmVudCBmdW5jdGlvbjoNCj4gPiA+IA0KPiA+
ID4gICAgICAgICBpZiAoaXRlci0+cGFnZV9zdGFtcCAhPSBpdGVyX2hlYWRfcGFnZS0+cGFnZS0+
dGltZV9zdGFtcA0KPiA+ID4gfHwNCj4gPiA+ICAgICAgICAgICAgICAgICBjb21taXQgPiByYl9w
YWdlX2NvbW1pdChpdGVyX2hlYWRfcGFnZSkpDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICBnb3RvIHJlc2V0Ow0KPiA+ID4gDQo+ID4gPiBJIG9ic2VydmUgdGhlIHJlc3VsdCBieSB0aGUg
ZGVidWcgcGF0Y2ggcHJvdmlkZWQgYmVsb3c6DQo+ID4gPiANCj4gPiA+ICAgICAgICAgQEAgLTIz
NzgsNiArMjM3OCwxOSBAQCByYl9pdGVyX2hlYWRfZXZlbnQoc3RydWN0DQo+ID4gPiByaW5nX2J1
ZmZlcl9pdGVyICppdGVyKQ0KPiA+ID4gICAgICAgICAgICAgICAgIGNvbW1pdCA9IHJiX3BhZ2Vf
Y29tbWl0KGl0ZXJfaGVhZF9wYWdlKTsNCj4gPiA+ICAgICAgICAgICAgICAgICBzbXBfcm1iKCk7
DQo+ID4gPiAgICAgICAgICsgICAgICAgaWYgKChpdGVyLT5oZWFkID49IDB4RkVDVUwpICYmIGNv
bW1pdCA9PSAweEZGMFVMKQ0KPiA+ID4gew0KPiA+ID4gICAgICAgICArICAgICAgICAgICAgICAg
cHJfaW5mbygicmJkYmc6IGNwdSA9ICVkLCBldmVudCA9IDB4JWx4LA0KPiA+ID4gaXRlci0gIA0K
PiA+ID4gPiBoZWFkID0gMHglbHgsXCAgDQo+ID4gPiANCj4gPiA+ICAgICAgICAgKyAgICAgICAg
ICAgICAgICAgICAgICAgY29tbWl0ID0gMHhGRjAsIHR5cGUgPSAweCV4LCB0cyA9DQo+ID4gPiAw
eCV4LA0KPiA+ID4gYXJyYXkgYWRkciA9IDB4JWx4XG4iLFwNCj4gPiA+ICAgICAgICAgKyAgICAg
ICAgICAgICAgICAgICAgICAgaXRlci0+Y3B1X2J1ZmZlci0+Y3B1LCAodW5zaWduZWQNCj4gPiA+
IGxvbmcpZXZlbnQsIGl0ZXItPmhlYWQsXA0KPiA+ID4gICAgICAgICArICAgICAgICAgICAgICAg
ICAgICAgICBldmVudC0+dHlwZV9sZW4sIGV2ZW50LQ0KPiA+ID4gPnRpbWVfZGVsdGEsDQo+ID4g
PiAodW5zaWduZWQgbG9uZykoJihldmVudC0+YXJyYXlbMF0pKSk7DQo+ID4gPiAgICAgICAgICsg
ICAgICAgICAgICAgICBtZGVsYXkoNTAwKTsNCj4gPiA+ICAgICAgICAgKyAgICAgICAgICAgICAg
IHByX2luZm8oInJiZGJnMjogY3B1ID0gJWQsIGV2ZW50ID0gMHglbHgsDQo+ID4gPiBpdGVyLSAg
DQo+ID4gPiA+IGhlYWQgPSAweCVseCxcICANCj4gPiA+IA0KPiA+ID4gICAgICAgICArICAgICAg
ICAgICAgICAgICAgICAgICBjb21taXQgPSAweEZGMCwgdHlwZSA9IDB4JXgsIHRzID0NCj4gPiA+
IDB4JXgsDQo+ID4gPiBhcnJheSBhZGRyID0gMHglbHhcbiIsXA0KPiA+ID4gICAgICAgICArICAg
ICAgICAgICAgICAgICAgICAgICBpdGVyLT5jcHVfYnVmZmVyLT5jcHUsICh1bnNpZ25lZA0KPiA+
ID4gbG9uZylldmVudCwgaXRlci0+aGVhZCxcDQo+ID4gPiAgICAgICAgICsgICAgICAgICAgICAg
ICAgICAgICAgIGV2ZW50LT50eXBlX2xlbiwgZXZlbnQtDQo+ID4gPiA+dGltZV9kZWx0YSwNCj4g
PiA+ICh1bnNpZ25lZCBsb25nKSgmKGV2ZW50LT5hcnJheVswXSkpKTsNCj4gPiA+ICAgICAgICAg
KyAgICAgICAgICAgICAgIGlmIChpdGVyLT5wYWdlX3N0YW1wICE9IGl0ZXJfaGVhZF9wYWdlLQ0K
PiA+ID4gPnBhZ2UtICANCj4gPiA+ID4gdGltZV9zdGFtcCB8fCBjb21taXQgPiByYl9wYWdlX2Nv
bW1pdChpdGVyX2hlYWRfcGFnZSkpICANCj4gPiA+IA0KPiA+ID4gICAgICAgICArICAgICAgICAg
ICAgICAgICAgICAgICBwcl9pbmZvKCJyYmRiZzogd3JpdGVyIGNvcnJ1cHQNCj4gPiA+IHJlYWRl
clxuIik7DQo+ID4gPiAgICAgICAgICsgICAgICAgfQ0KPiA+ID4gICAgICAgICAgICAgICAgIGV2
ZW50ID0gX19yYl9wYWdlX2luZGV4KGl0ZXJfaGVhZF9wYWdlLCBpdGVyLQ0KPiA+ID4gPmhlYWQp
Ow0KPiA+ID4gICAgICAgICAgICAgICAgIGxlbmd0aCA9IHJiX2V2ZW50X2xlbmd0aChldmVudCk7
DQo+ID4gPiANCj4gPiA+IE5vdGUgdGhhdCB0aGUgbWRlbGF5KDUwMCkgaW4gdGhlIGRlYnVnIHBh
dGNoIGNhbiByZXByb2R1Y2UgdGhlDQo+ID4gPiBpc3N1ZQ0KPiA+ID4gZWFzaWVyIHdpdGggc2Ft
ZSB0ZXN0IGluIG15IGVudmlyb25tbmV0LA0KPiA+ID4gSSBhbSBub3cgYWJsZSB0byByZXByb2R1
Y2UgdGhlIGlzc3VlIHdpdGhpbiAxNSBtaW51dGVzIGlmIHRoZQ0KPiA+ID4gZGVidWcNCj4gPiA+
IHBhdGNoIG9uLg0KPiA+ID4gICANCj4gPiANCj4gPiBUaGUgZGVidWcgcGF0Y2ggbWF5IGdpdmUg
c29tZXRoaW5nIHNpbWlsYXIgdG8gdGhlIGJlbG93IGxvZyBqdXN0DQo+ID4gYmVmb3JlDQo+ID4g
dGhlIGludmFsaWQgYWNjZXNzIGhhcHBlbmVkLCBmb3IgbWUgaXQgbG9va3MgbGlrZSB0aGUgcGFk
ZGluZyBldmVudA0KPiA+IGhhZA0KPiA+IGp1c3QgY29ycnVwdGVkIGJ5IHRoZSB3cml0ZXIgYmVm
b3JlIHRoZSByZWFkZXIgaW52b2tlDQo+ID4gcmJfZXZlbnRfbGVuZ3RoDQo+ID4gZnVuY3Rpb24g
b24gaXQuDQo+ID4gDQo+ID4gWyAgMzM4LjE1Njc3Ml0gY2F0OiBbbmFtZTpyaW5nX2J1ZmZlciZd
cmJkYmc6IGNwdSA9IDAsIGV2ZW50ID0NCj4gPiAweD8/Pz8/Pz8/Pz8/P2RmZmMsIGl0ZXItPmhl
YWQgPSAweGZlYywgY29tbWl0ID0gMHhGRjAsIHR5cGUgPQ0KPiA+IDB4MWQsIHRzDQo+ID4gPSAw
eDAsIGFycmF5IGFkZHIgPSAweD8/Pz8/Pz8/Pz8/P2UwMDANCj4gPiBbICAzMzguNjU2Nzk2XSBj
YXQ6IFtuYW1lOnJpbmdfYnVmZmVyJl1yYmRiZzI6IGNwdSA9IDAsIGV2ZW50ID0NCj4gPiAweD8/
Pz8/Pz8/Pz8/P2RmZmMsIGl0ZXItPmhlYWQgPSAweGZlYywgY29tbWl0ID0gMHhGRjAsIHR5cGUg
PSAweDAsDQo+ID4gdHMNCj4gPiA9IDB4MCwgYXJyYXkgYWRkciA9IDB4Pz8/Pz8/Pz8/Pz8/ZTAw
MA0KPiA+IFsgIDMzOC42NTY4MDNdIGNhdDogW25hbWU6cmluZ19idWZmZXImXXJiZGJnOiB3cml0
ZXIgY29ycnVwdCByZWFkZXINCj4gPiBbICAzMzguNjU2ODEwXSBjYXQ6DQo+ID4gW25hbWU6cmVw
b3J0Jl09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQ0KPiA+ID09PT0NCj4gPiA9PT09PT09PT0NCj4gPiBbICAzMzguNjU2ODE5XSBjYXQ6IFtuYW1l
OnJlcG9ydCZdQlVHOiBLQVNBTjogaW52YWxpZC1hY2Nlc3MgaW4NCj4gPiByYl9ldmVudF9sZW5n
dGgNCj4gPiANCj4gPiANCj4gPiA+ID4gPiBTaW5jZSB0aGUgY29udGVudCBkYXRhIHN0YXJ0IGF0
IGFkZHJlc3MgMHg3MUZGRkY4MTExQTE3RkZDDQo+ID4gPiA+ID4gYXJlICANCj4gPiA+ID4gDQo+
ID4gPiA+IDB4RkZGRkZGQzAuICANCj4gPiA+ID4gPiBldmVudC0+dHlwZSB3aWxsIGJlIGludGVy
cHJldCBhcyAweDAsIHRoYW4gdGhlIHJlYWRlciB3aWxsDQo+ID4gPiA+ID4gdHJ5IHRvICANCj4g
PiA+ID4gDQo+ID4gPiA+IGdldCB0aGUgIA0KPiA+ID4gPiA+IGxlbmd0aCBieSBhY2Nlc3Npbmcg
ZXZlbnQtPmFycmF5WzBdLCB3aGljaCBpcyBhbiBpbnZhbGlkDQo+ID4gPiA+ID4gYWRkcmVzczoN
Cj4gPiA+ID4gPiAgICAgJmV2ZW50LT5hcnJheVswXSA9IDB4NzFGRkZGODExMUExODAwMA0KPiA+
ID4gPiA+IA0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFR6ZS1uYW4gV3UgPFR6ZS1uYW4uV3VA
bWVkaWF0ZWsuY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+IEZvbGxvd2luZyBwYXRjaCBt
YXkgbm90IGJlY29tZSBhIHNvbHV0aW9uLCBpdCBtZXJlbHkgY2hlY2tzDQo+ID4gPiA+ID4gaWYN
Cj4gPiA+ID4gPiB0aGUgIA0KPiA+ID4gPiANCj4gPiA+ID4gYWRkcmVzcyAgDQo+ID4gPiA+ID4g
dG8gYmUgYWNjZXNzZWQgaXMgdmFsaWQgb3Igbm90IHdpdGhpbiB0aGUgcmJfZXZlbnRfbGVuZ3Ro
DQo+ID4gPiA+ID4gYmVmb3JlICANCj4gPiA+ID4gDQo+ID4gPiA+IGFjY2Vzcy4gIA0KPiA+ID4g
PiA+IEFuZCBub3Qgc3VyZSBpZiB0aGVyZSBpcyBhbnkgc2lkZS1lZmZlY3QgaXQgY2FuIGxlYWQg
dG8uDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gSSBhbSBjdXJpb3VzIGFib3V0IHdoYXQgYSBiZXR0
ZXIgc29sdXRpb24gZm9yIHRoaXMgaXNzdWUNCj4gPiA+ID4gPiB3b3VsZA0KPiA+ID4gPiA+IGxv
b2sgIA0KPiA+ID4gPiANCj4gPiA+ID4gbGlrZS4gIA0KPiA+ID4gPiA+IFNob3VsZCB3ZSBhZGRy
ZXNzIHRoZSBwcm9ibGVtIGZyb20gdGhlIHdyaXRlciBvciB0aGUgcmVhZGVyPw0KPiA+ID4gPiA+
IA0KPiA+ID4gPiA+IEFsc28gSSB3b25kZXIgaWYgdGhlIGNhdXNlIG9mIHRoZSBpc3N1ZSBpcyBl
eGFjdGx5IGFzIEkNCj4gPiA+ID4gPiBzdXNwZWN0ZWQuDQo+ID4gPiA+ID4gQW55IFN1Z2dlc3Rp
b24gd2lsbCBiZSBhcHByZWNpYXRlZC4gIA0KPiA+ID4gPiANCj4gPiA+ID4gSSBndWVzcyB0aGlz
IGRlcGVuZHMgb24gaWYgeW91IGhhdmUgdGhlIGZpeGVzIG9yIG5vdD8NCj4gPiA+ID4gICANCj4g
PiA+IA0KPiA+ID4geWVzLCBJIGNvdWxkIHRyeSB0byBwaWNrIHRoZSBwYXRjaGVzIHRoYXQgb25s
eSBpbmNsdWRlZCBpbg0KPiA+ID4gbWFpbmxpbmUNCj4gPiA+IGJ1dA0KPiA+ID4gbm90IGluIGtl
cm5lbC02LjEuNTIgZm9yIHJpbmdfYnVmZmVyLmMgZmlsZSwNCj4gPiA+IGFuZCBkbyB0aGUgc2Ft
ZSB0ZXN0IHRvIHNlZSBpZiB0aGUgaXNzdWUgaXMgc3RpbGwgcmVwcm9kdWNpYmxlLg0KPiA+ID4g
ICANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBUZXN0IGJlbG93IGNhbiByZXByb2R1Y2UgdGhlIGlz
c3VlIGluIDIgaG91cnMgb24ga2VybmVsLQ0KPiA+ID4gPiA+IDYuMS4yNDoNCj4gPiA+ID4gPiAg
ICAgJGNkIC9zeXMva2VybmVsL3RyYWNpbmcvDQo+ID4gPiA+ID4gICAgICMgbWFrZSB0aGUgcmVh
ZGVyIGFuZCB3cml0ZXIgcmFjZSBtb3JlIHRocm91Z2ggcmVzaXplDQo+ID4gPiA+ID4gdGhlICAN
Cj4gPiA+ID4gDQo+ID4gPiA+IGJ1ZmZlciB0byA4a2IgIA0KPiA+ID4gPiA+ICAgICAkZWNobyA4
ID4gYnVmZmVyX3NpemVfa24NCj4gPiA+ID4gPiAgICAgIyBlbmFibGUgYWxsIGV2ZW50cw0KPiA+
ID4gPiA+ICAgICAkZWNobyAxID4gZXZlbnQvZW5hYmxlDQo+ID4gPiA+ID4gICAgICMgZW5hYmxl
IHRyYWNlDQo+ID4gPiA+ID4gICAgICRlY2hvIDEgPiB0cmFjaW5nX29uDQo+ID4gPiA+ID4gIA0K
PiA+ID4gPiA+ICAgICAjIHdyaXRlIGFuZCBydW4gYSBzY3JpcHQgdGhhdCBrZWVwIHJlYWRpbmcg
dHJhY2UNCj4gPiA+ID4gPiAgICAgJC4vcmVhZF90cmFjZS5zaA0KPiA+ID4gPiA+IA0KPiA+ID4g
PiA+ICAgICBgYGAgcmVhZF90cmFjZS5zaA0KPiA+ID4gPiA+ICAgICAgICB3aGlsZSA6DQo+ID4g
PiA+ID4gICAgICAgIGRvDQo+ID4gPiA+ID4gICAgICAgICAgICBjYXQgL3N5cy9rZXJuZWwvdHJh
Y2luZy90cmFjZSA+IC9kZXYvbnVsbA0KPiA+ID4gPiA+ICAgICAgICBkb25lDQo+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gICAgIGBgYCAgDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGFua3MsIEknbGwgbG9v
ayBhdCB0aGF0IHdoZW4gSSBmaW5pc2ggZGVidWdnaW5nIHRoZSBldmVudGZzDQo+ID4gPiA+IGJ1
Zy4NCj4gPiA+ID4gDQo+ID4gPiA+IC0tIFN0ZXZlICANCj4gPiA+IA0KPiA+ID4gQWxzbyB0aGFu
ayBmb3IgeW91ciByZXBseSwNCj4gPiA+ICAgDQo+ID4gDQo+ID4gQW5kIHRoZSB0ZW1wb3Jhcnkg
Zml4IHBhdGNoIGluIG15IGZpcnN0IG1haWwgc2hvdWxkIGhhdmUgc29tZQ0KPiA+IG1vZGlmaWVk
DQo+ID4gYXMgc2hvd24gYmVsb3cuDQo+ID4gKyAgICAgICAgICAgICAgIGlmICgoKHVuc2lnbmVk
IGxvbmcpZXZlbnQgJiAweGZmZlVMKSA+PSBQQUdFX1NJWkUgLQ0KPiA+IDQpDQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eDQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQUdFX1NJWkUtMQ0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtMTsNCj4gDQo+IA0KPiBZb3VyIGVtYWlsIGlz
IGdldHRpbmcgcmVhbGx5IGhhcmQgdG8gcmVhZCBkdWUgdG8gdGhlIGxpbmUgd3JhcA0KPiBmb3Jt
YXR0aW5nLg0KPiANCj4gQW55d2F5LCBjYW4geW91IHRyeSB0aGlzIHBhdGNoPw0KPiANCj4gLS0g
U3RldmUNCj4gDQoNClNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZSwgd2lsbCBiZSBjYXJlZnVs
bCBuZXh0IHRpbWUuDQoNClRoZSBwYXRjaCBoYXMgcGFzc2VkIG15IHRlc3QgaW4gbXkgZW52aXJv
bm1lbnQsIG5vIG1vcmUgS0FTQU4gcmVwb3J0DQpkdXJpbmcgdGhlIHNhbWUgdGVzdC4NClRoYW5r
cywgYW5kIEkndmUgbGVhcm5lZCBhIGxvdC4NCg0KLS0gVHplLW5hbg0KDQo+IGRpZmYgLS1naXQg
YS9rZXJuZWwvdHJhY2UvcmluZ19idWZmZXIuYyBiL2tlcm5lbC90cmFjZS9yaW5nX2J1ZmZlci5j
DQo+IGluZGV4IDcyY2NmNzVkZWZkMC4uNWIwNjUzMzc4MDg5IDEwMDY0NA0KPiAtLS0gYS9rZXJu
ZWwvdHJhY2UvcmluZ19idWZmZXIuYw0KPiArKysgYi9rZXJuZWwvdHJhY2UvcmluZ19idWZmZXIu
Yw0KPiBAQCAtMjM5MCw2ICsyMzkwLDEwIEBAIHJiX2l0ZXJfaGVhZF9ldmVudChzdHJ1Y3Qgcmlu
Z19idWZmZXJfaXRlcg0KPiAqaXRlcikNCj4gIAkgKi8NCj4gIAljb21taXQgPSByYl9wYWdlX2Nv
bW1pdChpdGVyX2hlYWRfcGFnZSk7DQo+ICAJc21wX3JtYigpOw0KPiArCS8qIEFuIGV2ZW50IG5l
ZWRzIHRvIGJlIGF0IGxlYXN0IDggYnl0ZXMgaW4gc2l6ZSAqLw0KPiArCWlmIChpdGVyLT5oZWFk
ID4gY29tbWl0IC0gOCkNCj4gKwkJZ290byByZXNldDsNCj4gKw0KPiAgCWV2ZW50ID0gX19yYl9w
YWdlX2luZGV4KGl0ZXJfaGVhZF9wYWdlLCBpdGVyLT5oZWFkKTsNCj4gIAlsZW5ndGggPSByYl9l
dmVudF9sZW5ndGgoZXZlbnQpOw0KPiAgDQo=

