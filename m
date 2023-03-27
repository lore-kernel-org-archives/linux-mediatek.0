Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3429C7619A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 04:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOA2VIjNnWqYJB89G4V65kNrO/ipur2JcmURJLMtHiA=; b=E5Y/Mk4QrTBghY5Pau0fPMoRKy
	JXsyvJ2fP1WXgsQWZ5S8n1ie/Aw64KJneQliK4JHGxVwsHfBWpjXoFcprIrPuvgWJtgT7O/R36rPX
	99PO6goGHiAiEm4xW/rfAhOMz+zqVgnzQ1H5CBuXPlkqtZ1V07vHU19ZGk+uRLVxC2TjVmY84Bkl5
	fF0gA8zLFMUlB5iZXb88+MQlmarsThhUIY0ci673zuCmU8GWn0jJ1N7VmxhJQZJMxknTsGz8KppZJ
	XFow94W/Zezx+V/cdc4t3nuIUsHgz2U9rypJEUTGw1f37IViiIK/GA8AZ06Oc7cb4ohtup2TW/kHy
	0onr8BrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgeQW-009iZ9-2c;
	Mon, 27 Mar 2023 04:25:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgeQS-009iYA-0T;
	Mon, 27 Mar 2023 04:25:47 +0000
X-UUID: 6c34ad62cc5711edb7d8d11f642b8e78-20230326
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=MOA2VIjNnWqYJB89G4V65kNrO/ipur2JcmURJLMtHiA=;
	b=uavxgM/tPoe3XEMOHrhkiFUM/WsSjHE8996z8BxsiegJslP1AO8VnUYdTigFm5QbHoLqszO6HljXoN2rXyq3CjoNjWE1elFHYNgnV7Hi8z91tCowNU7xvYWwBjMI9tsBwOp1icintzedPBKYF04MsIM18QCYBYxE7OiiI0cBLpw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:b50072dd-4cb9-4bb3-add4-08a0d6642008,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:bb0201f7-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 6c34ad62cc5711edb7d8d11f642b8e78-20230326
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryan.xiao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 138863657; Sun, 26 Mar 2023 21:25:36 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 27 Mar 2023 12:05:33 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 27 Mar 2023 12:05:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoY4qEf64vdyxs99ECPRdo5x7GE6DPlGca6+wfWNPDfpNXHvxUZOaAOalRbPQk/YMoOXiSu7KsGQRWC0cNoFhtY3mbov6uq1TpIzqJyDoNqEWmCW7i/4MrTxYCTqC/EHhZlCBr0pvQdHYF5kYWYd7sx7b7DCgQ987rlktRIOt5bS47KpfZonudZYAsVfo8GBnIfmdQnrTpsmDl/FwuHsDIJQwwA9ro+Ia74ureG5UcSl8tHsA/rPJnGvy0poOThyyJOFFKwVTbI5oKUOiwfGIkrPaRm9ADzB6DeCsK6Wa3CwtPKVnHOTgJGRZyRpLJcLm6SSZi1hlY39F8T8DEtakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOA2VIjNnWqYJB89G4V65kNrO/ipur2JcmURJLMtHiA=;
 b=m60IVIOMvz/1wGIKdpElAbqB5ctVwQ5g8f425xR3GlHTktDIta8N0/zNN1MmzkHY9lMW7k0y2xvzOZZocsvG0C4JrzqxGM+U9eVTTFyXImraNjk1IB0x5xUGYbvYBUoFIAH+qjxMG4dD2AsehHRuauzLyG70v3hp3ALEvl4uL7EMP/9xmam3YcfB4DHSE1OlulhSw8nNsEqf1kS7gFR0PD52ixrkDpiUbzNcEN8i7EZlcH16qEtqGZRI4VMAtvOsqqT+Hlcy7/Ngg+lidd0QiNe8VnyXSHya/E+6u94utL/3OQvLKVLPEvfzKoV1kQuL5xHUe3NsbIqmpfIamgATOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOA2VIjNnWqYJB89G4V65kNrO/ipur2JcmURJLMtHiA=;
 b=T2EObhXSZSJnLHzXutOWYPrXpuliw1mzwoHfXDYccunFm2h5X9TDhHYzpElOmvDPZRy1ay46CZgFlYmigwUlM3EBE3F3wQQX4Iba0K/EwDiD4nGNlh5Uw1sZuUeYD/7qpiSUhFJhpuQJTiYI5UyTLc1dwMsMZ1VZ+ufIliG62Ps=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by TY0PR03MB6797.apcprd03.prod.outlook.com (2603:1096:400:217::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 04:05:31 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::325a:c321:6e2f:e43b]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::325a:c321:6e2f:e43b%5]) with mapi id 15.20.6222.028; Mon, 27 Mar 2023
 04:05:31 +0000
From: =?utf-8?B?UnlhbiBYaWFvICjogpbmsLTmnpcp?= <Ryan.Xiao@mediatek.com>
To: "tj@kernel.org" <tj@kernel.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "vschneid@redhat.com" <vschneid@redhat.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, wsd_upstream
	<wsd_upstream@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?WW9uZ2p1biBMdW8gKOe9l+WLh+WGmyk=?= <Yongjun.Luo@mediatek.com>
Subject: Re: BUG: HANG_DETECT waiting for migration_cpu_stop() complete
Thread-Topic: BUG: HANG_DETECT waiting for migration_cpu_stop() complete
Thread-Index: AQHZXKHaCEisPEX/hka7ctaBtar8Ua8OCXkA
Date: Mon, 27 Mar 2023 04:05:31 +0000
Message-ID: <efdff1c19d9cc18fc041d1ccf0fefc684e6d18d8.camel@mediatek.com>
References: <a578623ecbae88433876381d3b28ec494f479ab3.camel@mediatek.com>
In-Reply-To: <a578623ecbae88433876381d3b28ec494f479ab3.camel@mediatek.com>
Accept-Language: zh-HK, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|TY0PR03MB6797:EE_
x-ms-office365-filtering-correlation-id: aa4f3dff-a8b6-420a-525f-08db2e788219
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tt6OP7bCYhzONU9QzMuMTAWGj20lyJDpLhUjzPVPblwuvkn92+dS6+OaQez9C4DBNvFwPJwQnwssvxn2LnUYWUwH5VodLRjYfqWnDo8Xew/HuFnUdnCsdjY64rN6GOi/QDqTOcxlELIpVGIggClTZZehNM+XiVtkuHNizz2aLhg/BB89/VvJOKw39YS7fTSCAzCIeiAuktOCSUzls2H7EdIX70zClVJISvUIPjQodSRxtr8JZIRlo3meWRB4swnQ+RV6IDUCTfSkqkpsBQmpZYIkNwn6YMOByuYRimZyTnifEhqLfk4uPkgSK6cFr8CjG/0Ho1JaEc+KE4oCsYQWwtVe2j9sAH+ZGe5Tg433Q0oqX7tL5iSmRznztt/Ri70zIj/1usAZaVM38W5/Zv/W1FyIYV46IPDgekQ826u58W83JijEubVeSmNNqsZyCxIga8ob4M48+j6CnUxkdVwpYj/qsG1JVrFfuH0kPShyaNUzc0L+8nDnk/bPIYZenqVfZn0+lBkVPrs6E7lcnT7i9odN2LM1Eux7gJxeQYwRgYZmCUVSFKNiAUR16Y63XZZWfXjk6Z8mcRJRtL4CNHEaEiCa1LUjWaS238Fic9SeukhzVuwta7DRQgYifM9kVT5l
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6626.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199021)(91956017)(41300700001)(2616005)(38070700005)(71200400001)(38100700002)(66946007)(85182001)(86362001)(558084003)(6506007)(26005)(122000001)(6486002)(186003)(6512007)(4326008)(83380400001)(107886003)(2906002)(76116006)(64756008)(478600001)(66476007)(66556008)(36756003)(316002)(66446008)(8936002)(54906003)(5660300002)(8676002)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXI2WHIvRkZldjN0R2RPb2NXZFlmTEZ3TUpyZ2g3QS9qQ2dRWUxCcW5qUGY0?=
 =?utf-8?B?Y08rcktZallVWWZ4NnNyZEtOVUw5dXpsVktjUTFFKzFkTm11a2tXcUVSMkNI?=
 =?utf-8?B?ZXFLTWY1OFJ4V0h1dmowWHlocExZaXEycC9kWjAzU1RteVUwUXlZREt6WDA3?=
 =?utf-8?B?TUxCVjVKNXVhZHdreGtFMkNhMmk3eE1OcDdIdG9LZUk3WFJmamovcWpqelJK?=
 =?utf-8?B?RzViS2RMbWhBN2lINGdndkJiK0xZN2hPeEVBNDVLZzdiWW8wYm1OK3pBNWZt?=
 =?utf-8?B?QzRHbVpFTG12alk2N3pkWmhyYzdIc21BL24xZWVQNEx4RUxNVW1jL0FWQWdh?=
 =?utf-8?B?QVhuUUtENWtoT0NiNnVNY2JGZDAyY3hrT1VZQkcyVmlDcklheGU2b01nQ1NJ?=
 =?utf-8?B?cVBoTGF5NFZOVVNHVWlVdmdHZ2UzQzMvb1czWTVWQkVQOUFGcERRbnpYRk1y?=
 =?utf-8?B?TjlUNUVoSGxCbElpMGpVamZLUlYwdGFUc29OQnBzZEJpYUpWTHovempSTXph?=
 =?utf-8?B?c3NjWVlVRDlRRDVxN25YM25BK2daWDVGV0FRQ3RqeXlLVE16ai90V3IvSTM4?=
 =?utf-8?B?K1oxOGdVUm1KbFF1a1MwNGtYeWg1aWNScm00aXRaV0J1KzdndGJKSFFzbEhz?=
 =?utf-8?B?bk8zVVdHa0wyTTh1UGhudUcwSGRPTFQ0MDIwRGl6WU5sOHUyRGdseDhhZWVB?=
 =?utf-8?B?ellUQ1pHSTI1akJuaVZvakQyajdScHRiTkNHbDBjYjRCMlpka2FaS1JidEJx?=
 =?utf-8?B?QjRlZzkrR1g1Q2xPaVFjNThSTUUxYkltakFGRTdPRmhWL3V6YmRtZmxMYmhT?=
 =?utf-8?B?dlMrNGp1K0k3eGpaYUN6bndxekM1R21HcHBpU3NSQXcxY3ZqM1NocDM2ZGM0?=
 =?utf-8?B?Z2t6YWc2aSt2NlBXbFhsb0VPaXlVM0pmMyt5QzRTMTY3WE93ZlNHY3J3N1V6?=
 =?utf-8?B?d1BqMTdxRTJrRXAyeEJwa09JWVVLU0F6TGNtYmllVThxckV6bzZOdVZBazRJ?=
 =?utf-8?B?UDJONDdUOWwwUDVuVXlXWlhpQTZVYkIzRThlQ082UDBLVm5HTVA5RkI1Wmwx?=
 =?utf-8?B?UmJQd1ZpalpuMnBWR0JJa3YyY3ErUlRCS0hoek5ob1d3U3lTalE5TTcxOThY?=
 =?utf-8?B?eFNiajczZ1dVWkpBcUtWVEQ4VFBsM1ZJWFRnejZNeHY2ekRxVCtqVUlyS3NR?=
 =?utf-8?B?MmZpeHM5OXVESzBnbUpESGNycUxKM2cxV25NTndESnRhN0pESFRVSm5vbU56?=
 =?utf-8?B?U09ReTdhdkVQR28yZm1TeUpRMHVQdzEvQmU2UDBEdWdoZDRETWhtYXRxUmtz?=
 =?utf-8?B?RU9CanpISmxGeUZxM0V4TnNubUF2c0Q1N3ZEdjhOcFhIUzdNejBlalZ5aCtQ?=
 =?utf-8?B?aVVIbHNEbm0zYW9Ebk5EbkxjRW9lalVkL29QUllrQ3NiZXNYZ3FxY1FwaXBt?=
 =?utf-8?B?R1B1TmNhSnExSm5Wc0g5VmVuYmF1dm5nSUJnaDRURmt0Y0paMGR6ZXlqSWZV?=
 =?utf-8?B?bFdpMi8wTlBJL3IwdlJOSWdVVWZwSGswWFRkVFFtZGE3dTM0L3I1NG92NDFB?=
 =?utf-8?B?Z3B1eXRlMVdjQW5pM3dKTy82Ykk4UjlLd0U1aUUwNjFUaHNHTWZOb2s2dkJx?=
 =?utf-8?B?RkMzT3QvcHorSXNlYkQ3RzI2STNtSEhINDBiOEc0cXlDdWtaQ1FtVmdTRkdU?=
 =?utf-8?B?em1MNm9VZFZUVEFTMFhiSy9iRWpLK2lMam1NUFhlcVdmZnBUQVpwdXZ6aXFL?=
 =?utf-8?B?RnBjZlhPVEE0azdXT1d1M0NuTUpmcmwvOU1CNkdjb1VYTVpUTkFnTE5JblNK?=
 =?utf-8?B?SkZkVkJCNy9jSXgxWEdnWVhMbnh4bHlSTHE4ZWNsdHAyNWR4NVJBZWlvY3ph?=
 =?utf-8?B?dDEyekFUd0VVZmRlOUtXZEc3YW5nTDdIZ1VDRnp4YUJjM0VMRVFQaFdNWWlj?=
 =?utf-8?B?Tm1LdkZORFpsY1I3WFdFOUMvRlFUYWVRQWVaZTJwMTRkTEREbnk0YU5hK0l3?=
 =?utf-8?B?bVdXd2ExejVQQjE3NWh3UmduVUZIdnNjUVF0SnNPckkzYnBJQjQ0Z1pFQis0?=
 =?utf-8?B?MUk5WC9WZVE5Z1NSUzRyQkR5WDh2dFMxWG9qc2dEamZ5T0c0b240Tk51ck83?=
 =?utf-8?B?NDBlbklJdVUvUnJqL1dJakhkMzhKLzBjTjRIMXFNcDR5OUVwUnNxZDE1L2hz?=
 =?utf-8?B?anc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C476D87EE1DD9242A839A336012B09C0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4f3dff-a8b6-420a-525f-08db2e788219
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 04:05:31.6185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wZPSNExWhgWn8fRwPdSE2O4u0AgfHo8mc3NZdZNTE0+zNEJ1/1/MvnneE4C8Idy08FUAwI81C2VzvbPUbHpl0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6797
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_212545_004439_64BD5CA0 
X-CRM114-Status: UNSURE (   5.39  )
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

T24gV2VkLCAyMDIzLTAzLTIyIGF0IDE3OjM3ICswODAwLCByeWFuIHhpYW8gd3JvdGU6DQpIaSBT
aXI6DQogICAgRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb24gZm9yIHRoaXMgaXNzdWU/DQpUaGFu
ayB5b3UNCg==

