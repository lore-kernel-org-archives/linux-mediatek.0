Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA00CDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KVNRfx9ddhsyo2j9KTJTqgDJH0hrUXvdHrlyxA9LQo=; b=MmIeJS5TLMCBNHDDSE9vbdeirp
	jpkYbhpwWK7Pv5QKGlJZj1XDSuRnG2Qiro3cpdSKkVMY5wPNx0hiXhJq8pHkCyMTCUWiTZm4wnu9l
	gPg4JQ6J6deG1PmB+HaMAN8/gC0gKsYesnMC6MVnCcYyw7aEuY/7EDOtbDuDUbxJ2dgiZgltq4iWu
	/L6j4zC7clY6x1FPZMssEBv9NTXFGU4FpjBXbL8aKx3Nut/zV5VYJN04xxdqzbGIJNo9GaLE7SwQc
	XTZGsWb5C/iQDDUT8lo4xjpjZEq7pAOSODJ0PQxykRC4/BRT1zbHeTPFTORXKRtUBcz7hqkOf3Luj
	AQzMOXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsi5T-00CC3y-2O;
	Tue, 17 Oct 2023 11:18:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsi5Q-00CC3U-1S;
	Tue, 17 Oct 2023 11:18:09 +0000
X-UUID: d65eb4f86cde11ee9b7791016c24628a-20231017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=1KVNRfx9ddhsyo2j9KTJTqgDJH0hrUXvdHrlyxA9LQo=;
	b=ucGMEiZJOCs8kkuj0Bx6OASP8YzvlwPSKQSTDypW1XzOdoVxRVoVC/AtgBVsQTOfTP1jg1sPEexFbNGqD78g6R1+Ffw7Muy+q8dZJZqMnM7dQYDe465eQwSVxe9keoKHqSNZWv/Zn3V9GHBwFEbwbc23xsX3DBS6W/RhrxFt3ls=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:d00a0026-887d-488c-96f3-9cac50fe72b1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:10152315-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d65eb4f86cde11ee9b7791016c24628a-20231017
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 26852536; Tue, 17 Oct 2023 04:18:03 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 17 Oct 2023 19:17:36 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 17 Oct 2023 19:17:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1lokohng1wp02jRXAqtpln7aB+Gpkq8tw2Zt/YIv/snqaln3QepX93570AAS87E4HCp+VSnXT/KlusR2W0XS0T0L6rpdrzCf6RC3pw3OAifz1AkNMpZfOkLvEl+DSHLkmgDsKQmTfgXb/Pv+8Dk3Dx3HIht8wytwV1nYcTaWVz74zXzk8ecpD9abqGn/E5Fx5rgUoV+efs1OROJmjORWp/9da7Zlm0anqc0SNdFj8W4JK3sDVANhIYEtTeEYHEqhh8yv0FO7V38pQ5L13s+2ELtTiFkYUne4PrXyIPKEMHyGf1QY6++59vXkWynyq73tkDJOK4dUCumJFvT3YhvkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KVNRfx9ddhsyo2j9KTJTqgDJH0hrUXvdHrlyxA9LQo=;
 b=UDnA8+W+9S+KJ0AdIjyhBZUWtOGhuZBe7Q/HZOga7A+PwVEzdqhE2D8q8nXlbIZrXSH6yFkXd6IkzdtaUIYIQ1KjDeLDofncoMW2Quk5nV9iiI04t7plcxkBBJ24S43X4nAvtrTPulzvaih3XV+IwyOjah3ruBAvsk0BzH3Jg2Tb81HCh+djzx9+SPW0BevPIZeYVQ8rDO+DCHeI1T9gWxaJt+nJYZBSePmUlft+5K3co+dkcDqQOXJwzgMNR593ueatu1pWkQgQl9SGhJvFWlTdAgq3TQxv/8O4ZG5aEglfnpPbaPpbMVV0ofaoCQ48Jo3BYqgjyHzzbi/wB/137Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KVNRfx9ddhsyo2j9KTJTqgDJH0hrUXvdHrlyxA9LQo=;
 b=BA0toJIcDNY7woHAt3UVZeGoLK1erN/EoLgAAAWNenQ7KEyqIYmdLsmxRLzawPwWSM5ltE6Ibpdz/3atR3oeWPhY3ucwPB9Fn/aGKFjxKX9Glqe1rQl4x0dlFRR+d70u0ueO0douytO8gdc2Tah1wZQYmDtHx3KeeFVcLZ072Gk=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by KL1PR03MB7335.apcprd03.prod.outlook.com (2603:1096:820:ea::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 11:17:33 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::faa3:6316:28ab:206b]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::faa3:6316:28ab:206b%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 11:17:33 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v8 17/23] drm/mediatek: Support MT8188 Padding in display
 driver
Thread-Topic: [PATCH v8 17/23] drm/mediatek: Support MT8188 Padding in display
 driver
Thread-Index: AQHaAB1Fxy7iG4GZm0mhmqrM/5nsVrBNvOwAgAAZ5YA=
Date: Tue, 17 Oct 2023 11:17:33 +0000
Message-ID: <7ab72bd07081d5626aae270cc01ff1ebcd3036b5.camel@mediatek.com>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
	 <20231016104010.3270-18-shawn.sung@mediatek.com>
	 <dfa95116-d430-48f4-8f36-0c0461d3b7ac@collabora.com>
In-Reply-To: <dfa95116-d430-48f4-8f36-0c0461d3b7ac@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|KL1PR03MB7335:EE_
x-ms-office365-filtering-correlation-id: 0374f8bd-b748-45a4-5b22-08dbcf02a928
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FMmEaU/nf/cDYjmUcG3MnedkC6Q8OWTDXHjMvhhy14ap3pEvYwp6jb2nw5xTVCxr6kYDhRhFLJsprii86VbYLNRJH+2BGmqp90Gg6j/N0+kpvK1kq3BHXwnK3PtiRgi2yrFC8x2rHwOt9uZaVrCoTBgYFhYAi+H4YRN0kumb4mXcnjnXSlZN+yuZVcC2vQETNAh46O2CDfAQDYBaMjizEocEDUj5RGjWDusBm9VqUYrXdYMyT104kcqL58Davd7/V2KzGvKidH/hfTzkJbcH3J8SlV3Y2h9oyubhGvwOxuLSaNA4A4z/fLcZk3T0bGrfA+JYo5ITmghMRgiz4hxZOtV2HA8OrHCJrSQsIxIdIkMCd5iQlidnZ3Tumtox/ibOJAZ96vIwLbt3W17tD0um1FkVsvAtxsWZBXFmGJeuH8JBWnS+SZmY/Vf4urxR7NWxqpwDg1Ickg6Y35G3EOb+yf0u4EsiJFFj0ZDAESn4tyEqtkHba76NyVvFjQ6c9ZJJM+MoWEDcVs8bFnfeKKSAOyhVUCtL/Zd4OWRr+Aeh8rc6O3iR62cH1khjaIEGrToXsm4+FOV+bdVHu+DdjmJNTTLObc93wPOUHljGhurvC/hI4Q6nHczF4CTIwGTa0Ky3urhgRC+629vvPv05zpobWHDHyHZwhnD/ocTj3kYHnVc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6623.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(39860400002)(366004)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6512007)(6506007)(71200400001)(4744005)(41300700001)(4326008)(2906002)(38070700005)(478600001)(6486002)(2616005)(26005)(86362001)(4001150100001)(110136005)(64756008)(85182001)(54906003)(66476007)(66946007)(36756003)(76116006)(66446008)(66556008)(316002)(8936002)(8676002)(122000001)(38100700002)(7416002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmVveW5kSFRQMEg3WloxYU5ORitmTDNWbFZCNDdnOWpOMnYwRUFESGhESmls?=
 =?utf-8?B?bm1RSzQrVFdjdHlyaEUwSEw5Y1h5WW1CQjZ6bmpWS1oxVzlZN0JtS2RjRG5l?=
 =?utf-8?B?YWlyOVRPbW9mNjMwZEZnMVlqbXk2a2VJNVN6dE1qcC9BeHltVDU5bTZUNzkx?=
 =?utf-8?B?bi9DeEtnS3k5MEJRVUV4MjlmWHNCUDh1c0NJSXpHbFkxcXpZaHZma3pwRU03?=
 =?utf-8?B?QWFZQUJkMkVHRzRMZG1rblNPNzF2RmxHYXBDRHFFU0dVRlV5bjdiVmVzUGd6?=
 =?utf-8?B?alBJZGtxM0syNVcvOXNRYm11MzhISjdZOTlrTHhuVERWelVXRzgwNTN4RzhO?=
 =?utf-8?B?V1hCUWtYcWcyQzdmOS9xaFE2dUx3VnZXYmd4aDlQWTA2aUhTeUlISWtNdGdl?=
 =?utf-8?B?clFMZXZBTXZhYUF6N3hqdFpnZkROWS84RkIwb01RQmRwNEc1ZmRhUnY5RzRk?=
 =?utf-8?B?UURmRjg3VVZtMXdnUzNTUzNYTFVib3ZXOEU2SnF0T0ZVZjhXcTNvc2NqM2FN?=
 =?utf-8?B?M2ZwcWlpSzVsM0JDVVhUK08wOEJhSkdLR2NFTTZ2T2E3SWtSMGlzdDhQMURS?=
 =?utf-8?B?ZzcwbzE4WFZjRlNtSHV1aHh2WkM0aU5laFRHbTZXNEcrblUvZDJRTFlSYUt4?=
 =?utf-8?B?UndFdDZwUmxXc21xQWlmbnVheGp0eTJwWjlSalJZSjVZK05mbWJma3JNakx2?=
 =?utf-8?B?YXhQRzRQRVhPMFZQTHM5QWJkYmt0cHZvSC9PV05VUHk1cjJRZndkaVlsTU1I?=
 =?utf-8?B?K3BlYXRoMGhuT0kxRURlQ1JzNUJGOWJadVdjNCszb3JkRCszL0tDQ3E1WG1m?=
 =?utf-8?B?d0Y1aXVINDloZXY1RXdTM2hBZlI5U21vNVkvdlJwcGZXdHNQTk1pYm1mbEZZ?=
 =?utf-8?B?TUcrUWcwRWdpNlAzWFMvRmFiWUtRaGE1NEM0MUdVSEpvYWJvZVJHWU9Gc0l6?=
 =?utf-8?B?aXVEYW5OdWhXaTVYd0dFYnFaWkdzWjFOeEdBaFk0VEZLUmVqM05jeGcwdUp0?=
 =?utf-8?B?T2M3S1ptNjkrNnRMcWZmQ3FmWXdiczlmMXhQdUlHU2xPQUJHWnBlYmU5bG9t?=
 =?utf-8?B?aDdLaUd6Sys5UjZKTm5yY2ZRYmh1SmhaOG13eitKbXlpYWxNdjdNNmdxVi9Y?=
 =?utf-8?B?YUxaaEZiUEpBaVNkVnM5ZXZ0Y2xFdi92RkZzRnY2OWdjT25Vbk1tV0RONk1y?=
 =?utf-8?B?S2FYN29VUW40STZqR2VBVTAzdEd3dlY2OCs3Uy9KcVUvUDNUY1E4Q0JCT3Nj?=
 =?utf-8?B?clRiNkJJQnB5Q0o1WUlYV1p4eFFtVCtZNm5zM0JwaHJVM2JZWUlTcEZVZm5V?=
 =?utf-8?B?eGdheTlpUGduS1lOUGVsOGFGbnNUYUNHZkkwajFoK3lRWldxN056Y3gvSVJV?=
 =?utf-8?B?dDBkcVZDczk5aXU5ZUg0dU9ITCt5ZFRDeERTM3Z0Y3JxZzVxdUtYVmJCUStQ?=
 =?utf-8?B?dkZvdFRPUUNvYWZmbUY3ZVFlK0M1c0hDUkZFZzZ6dHJSSEZJNGpBUWsrZHhL?=
 =?utf-8?B?L1M3UnUzWnVZQ2t4clFVZzl6cmxwRi9vNk4wZlRHTWlObUtHOUd0eDJYcjFq?=
 =?utf-8?B?SG9hcHFHVWsvaTZwQXhLVDdKb2VsTk5ySG5sZlBTcmtOL1k5NTkzTTArT2hp?=
 =?utf-8?B?dEJqeGtHd2tVNDM4RzVsa2ovUU1WdVUyVjBCdGluLzZvV0QzSWxoY3F1Z2Rw?=
 =?utf-8?B?ZHNkNSs0bk9WaU4xa0U2YWZ4NDIvWjhKQ1UrUldZZzV1UFNsamg0cWRXNGJY?=
 =?utf-8?B?OTBQcFdHY0VGbE43elpNUEZRbmVFQUZvWlh5RXVZd043ZnRBaXdtVW9tdFh3?=
 =?utf-8?B?OHRuSzdwUnFGa29CbnFWRjBzWmpmZ3YxazNhMWVrbmpLcUxxT1lZS2ZHMUE4?=
 =?utf-8?B?VHlkTjdna2RzTDVic1hOOFl3S1JXdjlqVm5uMnkyM1FjbmNRTHVZTWdsOUFm?=
 =?utf-8?B?RElhZzVydkFPZmVQKzF3VDJXcmVac1pvc2NtL1dEUENQMzRaZC9TNHhkMWtk?=
 =?utf-8?B?WUw2REtlUmZ5VnlCY2xyYTdmUVZPTDF0T0tPOWVuZGpnZHBTRWJoNnh4WFVG?=
 =?utf-8?B?VmkrL2NYZU1pd21BY0lPMGM4TmtCTkEyOE9UYlczM1NmcnJDcFdhUEp5c0lD?=
 =?utf-8?B?K0Z6WXJIYi9maFRRZ1RMTE5xM2hucHpqWW1mb1JTdm1mZlh2eHVKQ1VIMGs1?=
 =?utf-8?B?Wnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3BD0E79CC763547B42E4D7D8230BEA2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0374f8bd-b748-45a4-5b22-08dbcf02a928
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 11:17:33.7741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KLkslQryCKIbwdD630sNrN8jKfAAHZpxP1sWbrbCCvL+5iJ7r23irehOgFTtCtkyu95Yl5UAf89uAyjsVi4laQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7335
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_041808_499285_082B0175 
X-CRM114-Status: GOOD (  11.25  )
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
Cc: =?utf-8?B?TmF0aGFuIEx1ICjlkYLmnbHpnJYp?= <Nathan.Lu@mediatek.com>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "sean@poorly.run" <sean@poorly.run>, "johnson.wang@mediatek.corp-partner.google.com" <johnson.wang@mediatek.corp-partner.google.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, =?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?= <yongqiang.niu@mediatek.com>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "mchehab@kernel.org" <mchehab@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQW5nZWxvLA0KDQpPbiBUdWUsIDIwMjMtMTAtMTcgYXQgMTE6NDQgKzAyMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgbXRrX3BhZGRpbmdfZHJpdmVyX2R0X21hdGNoW10gPSB7DQo+ID4gKwl7IC5jb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10ODE4OC1wYWRkaW5nIiB9LA0KPiA+ICsJeyAvKiBzZW50aW5lbCAq
LyB9DQo+ID4gK307DQo+ID4gK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG10a19wYWRkaW5nX2Ry
aXZlcl9kdF9tYXRjaCk7DQo+ID4gKw0KPiA+ICtzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG10a19w
YWRkaW5nX2RyaXZlciA9IHsNCj4gPiArCS5wcm9iZQkJPSBtdGtfcGFkZGluZ19wcm9iZSwNCj4g
PiArCS5yZW1vdmUJCT0gbXRrX3BhZGRpbmdfcmVtb3ZlLA0KPiA+ICsJLmRyaXZlcgkJPSB7DQo+
ID4gKwkJLm5hbWUJPSAibWVkaWF0ZWstcGFkZGluZyIsDQo+IA0KPiBQbGVhc2UgbGV0J3MgYmUg
Y29uc2lzdGVudCB3aXRoIHRoZSBkcml2ZXIgbmFtZXMsIHRoaXMgc2hvdWxkIGJlDQo+ICJtZWRp
YXRlay1kaXNwLXBhZGRpbmciLg0KPiANCj4gQWZ0ZXIgY2hhbmdpbmcgdGhhdCwNCj4gDQo+IFJl
dmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dpb2FjY2hp
bm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gDQoNCldpbGwgY2hhbmdlIGluIHRoZSBuZXh0
IHZlcnNpb24uDQoNClRoYW5rcywNClNoYXduDQo=

