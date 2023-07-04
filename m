Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB2FEB64DA
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 05:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koXWmXgo+NVtq/ziaboNgK5fw3hMxsfJJ/FBnm/4jOY=; b=AQoFIFuhuGTjNpq/64zLZsM6FT
	F4pQ40GgXSPxYTof6/5UJvHTAJvq62egv47dAhsJ9h/vw6dy4PbwSdtkwg9ACDreAUa5qNBdw/RTV
	esz3zOO/z5jkmZH9YiyEEt6sgciALX4cvYWZo/Mva0NSK5skJLiB6meKDdOcDBvq1Oi7NapGjcjCj
	g6yKE8qnuTucVZQ+aze5X1/ejQppbw5nxw9Q4RovidkeCDwFoGilAx2HbsefFixdZxlXUy57hVUYh
	AOZXqzSR+o2n9zpcgduBXVMJ8P18QYztdL8tgw+ES/sy15SNXJtlLpZHWM2cQhkdwYoMupj0V6ivP
	jIqesZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGYix-00CDLc-1X;
	Tue, 04 Jul 2023 05:37:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGYit-00CDKX-1F;
	Tue, 04 Jul 2023 05:37:12 +0000
X-UUID: cf3a969c1a2c11ee912e1518a6540028-20230703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=koXWmXgo+NVtq/ziaboNgK5fw3hMxsfJJ/FBnm/4jOY=;
	b=K6FrDPw1kIiwEf9LEIwnJfV4id2KQE5mQ/xecQEHXZo3Y8MZrUz/lWWWEfomU6UeAgxlhbkkono1d0OYUfzGqVY/2pQWYNmrJbwegapdSOL359JGqlI2p5O0PBRbImGfiZujmtwBzJ22yt/bGsiqNsd0n8ZER/o4zj5pF9AOeqw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:2430652c-036e-4134-a803-4a9c88bca633,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:01c9525,CLOUDID:3e70ab82-5a99-42ae-a2dd-e4afb731b474,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: cf3a969c1a2c11ee912e1518a6540028-20230703
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 676820938; Mon, 03 Jul 2023 22:37:05 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 4 Jul 2023 13:37:02 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 4 Jul 2023 13:37:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YguTqj0HyzTLz+lcTDqDzW5X7PlLUSYPzodPFtqu3p4ESSx3J9fMEPqnNYJ2eVQVmVSpw9wte2lgDt+qQzQ72f1svf+62J9Z45FkGZ4ag+jc5W+zYfX3MfrfrW6FI7TuNXE+gD3uE0FDA9+Na1UVAuCh8Sf6asrAXCyhX762wriOISsxwsGHh9FXAFQ3tWxgVlCsx3R2CSx4ioZhAAvNXOyd8byaNfzAn5qPo/32pfyeg/lwbZtx+H0RFmKbng1Bbc1GVUyMY+iejzmFGz8tO+8TUFd31a4rd3Vmz1zgKa/WzGduLFxDrnmChvzf34AHG4Q9Q+vBlMruOeu2Tc5NKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koXWmXgo+NVtq/ziaboNgK5fw3hMxsfJJ/FBnm/4jOY=;
 b=nCaQA8rIbASf3Fl7L+TiQwQqf2dljeV3h3Tj8fWMf7HvHNfJBMHFkKMD5dBIWRzr8Oa9ea99OFURcznSRafebSB28BGkAFbnbmrZ+usXIr7YxB3R8E08Kvrk0uxzddUFoUepIrOCRnqm9BgQHKS5Dzopjf8ldSbf/ktBWQh8bfhT47o/F3lUJi6gsHeA/pHy908BSpzw9lSU7XSibzlgYZw+3NkavZ9slwTe9Lyq0cRrOwJiKwWRRXri28XTRfx9eFuYH5FJDW/lP8MXIi22qVAlClTIKl4K4EKvSDN1c8zIK64SIXDcZPdWHrUa+gzChdXMTiZCHpGRtFVaPKq+2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koXWmXgo+NVtq/ziaboNgK5fw3hMxsfJJ/FBnm/4jOY=;
 b=RiP67khjs/tMmAQ33GrppyOCTc77f21tnOzlYPHrQh1PEo1zGmXncdpsWHdvuNsq+zMZ15KMS7isVGybnVFyRxLyvIcw6E5NuC20/0iEosS4jRFkVQyeRnbZydeOKGAe48TRFm8dxKrBlRr2Ov4hmc+JEtwBS+gAhhSxXTD0mK0=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7367.apcprd03.prod.outlook.com (2603:1096:820:eb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 05:37:00 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 05:36:59 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "amergnat@baylibre.com" <amergnat@baylibre.com>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
	<Shawn.Sung@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?TmF0aGFuIEx1ICjlkYLmnbHpnJYp?= <Nathan.Lu@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?=
	<Rex-BC.Chen@mediatek.com>
Subject: Re: [PATCH v4 1/2] drm/mediatek: Add ability to support dynamic
 connector selection
Thread-Topic: [PATCH v4 1/2] drm/mediatek: Add ability to support dynamic
 connector selection
Thread-Index: AQHZlKyyIUGSa+wX8kCf6E1w+XAq16+pSb8A
Date: Tue, 4 Jul 2023 05:36:59 +0000
Message-ID: <8486b59895cc12817db1b21dffea925c13b4a006.camel@mediatek.com>
References: <20230601171513.8533-1-jason-jh.lin@mediatek.com>
	 <20230601171513.8533-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20230601171513.8533-2-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7367:EE_
x-ms-office365-filtering-correlation-id: c4482826-0b4f-43e1-895d-08db7c50aff2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rkyo8jsqRbrBFE0vOKY/qB0a8gUKYyOh/kyjDY20TSun1UgNrBU0dO1pg4SbV7vsG+uB+Ykl1lGlb0blo/4Ag9vNNgAmYYQ49OBEWhPzs6pkVxScJuiaduC8rsawnh0DVA03bxOqtyrmv8R4PsJYI0vv81v/YNHU2t9EX7BH5N5OiUl0mCAKyHyfVrcwr2sTwg6ShkBYMR/5bTi/qcpQhDhtkkOTko1rPMgSYinh5P+lZoMpPFICBRnnUo5Li8vr9luMqZ6w6KvgHTjjRxttifBn6Cxgspus9jHWvVe9XbKoaJE5sne4Ml4oB/ggl9LbR9vvL3fRFE8yDdWdvYu0wTtDyyNAFZmiRf6iGq0a6ZLyoQNE7Ubxsqt6wI0hNMNwIg2PDji8H+Hq6Uc6MNOe6xw8JhfN2DHxHodg+hGXpP9AHJvCE6T/RcwwX+R8Yw7Rvb38bjEE1p/cBNXEWKjvefsluYXdrNq8VBhxcwxfbFy4ZOGesKkUXa7LkhN5YmxcriKJa1bWQp+452F0XYB9DFrTI3nA691tymqnGuHYjEDHZ8S4r4hFfMbY5grU9Iwe6XYHTb9x5uPToGtpukkYq8WzoWNwR93tIL7dZzPjOevrrXe3XI9E4HxNaEWocsYZW/SEerV5f/T/P2fOuYxi8zZxG5FAPacjcTvg0JASHok=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199021)(41300700001)(38100700002)(6486002)(71200400001)(122000001)(2616005)(107886003)(6506007)(186003)(26005)(6512007)(110136005)(86362001)(38070700005)(54906003)(316002)(478600001)(85182001)(36756003)(66476007)(66556008)(66946007)(64756008)(66446008)(4326008)(76116006)(8676002)(8936002)(5660300002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OE9send1TUxERjBlZkFYQStwZ1VyNmZCcVNBQWswUDRqMFlZejZqekdlOWVa?=
 =?utf-8?B?amtyOVoreDN0YXBXQjFvVEFpR3EzL3BWa2lhbWhqdjA2SjhJUDlQM1lXVEpm?=
 =?utf-8?B?SE41TkNlVWFIRmc2N0ZML3ZPU0tvK0pTbWd6YndZNVc1TmlFK0t0OVFtRE5P?=
 =?utf-8?B?b0czb3FrQTI0azNaQ0d3Mm1jR1h4Z2dmUmlwRVlncmNxcyttbDB4eGE4UUt0?=
 =?utf-8?B?WFRMZlZsbnpNanh2bHY1RUxzU0xodXJKU0FtN0lzN1NHRzZyT3h5WHpna0Z4?=
 =?utf-8?B?Uzg5SVFzZTk5bkRIRTZaSDNiNUVXVmJOQnMvVmdhMFNRc1EyVGhCTVBxZEov?=
 =?utf-8?B?cnI1SEFtRzQvQnlYTHJLN0VZUWoxc3h1MHFhV1YwMVJxQzI5RVFJOVE0aW5C?=
 =?utf-8?B?amFyQUthV2tGbXFRTGQzQ3lyNzRxQ0dKek9wTjQ5U1pKb1cyRklqa1ZIcGtF?=
 =?utf-8?B?OFUyekpBV0M3QUJmdndFcDRvdU9lclhidWRveDB5SHN6ZjBTRHNVbDBHMlhP?=
 =?utf-8?B?a1pIaXRSUHNrd3l5Tnhaa1diWHIzaUFhb1VkT0E4Sk9YK3l0Q2ZrUmx2bnNP?=
 =?utf-8?B?TzJlWmtNWTNOZWhxbllId3NTcUtWS1RtZHZDMkhsM3NqdEJIRUlvMEczdThE?=
 =?utf-8?B?cU43b2QyMGZQL1kvcWpIK3oyMzZQak9tazFTdVVXMDc0K3Zld0tBNEdFVWQy?=
 =?utf-8?B?cDFsMlovdGxQSkl6RWFBQlhBa01IeEE0c0lsQ012V1BnN2h2ckVqd2F3SVZv?=
 =?utf-8?B?VHNDM2J4aVJETWNlQzV3dnFWT3g3cVBJYlU1WU5WbnUrWXd5YStKYkJPNi83?=
 =?utf-8?B?OHJEQzBhSGVYNk03NVo2NVJjRld6TTZvWXJsSW9sQ1ozaHA1T20vbUJkdVVL?=
 =?utf-8?B?ZDI0eEgyYkQvVWlvTDdZKzdLS0hsTXVWeWI3T0xwbUlTTzB4RmdwSzdKdFFY?=
 =?utf-8?B?MnZRWk1lbFdWVE1xeXMwK0NpYnZvOHhqL1JsemJKWTgwUnNMeVZTSGZ3MkJt?=
 =?utf-8?B?Y3pmZGFkcXdxbW9ZSjdZZTVhVUZkS0lZRHUzbEF4OGUrT3d1VjlIUExyUVg5?=
 =?utf-8?B?dUNrS2JCdldDV1lPVGs4NG5DTS8vZzhuZEZwcFVZOE4vdnpOVm1KZWEzcXds?=
 =?utf-8?B?aDZQYjYyejNPWTMxRjArNUppS2ZXZE1yNXhqZU56TTNIVHhDeEFFc0tYTk44?=
 =?utf-8?B?WDgxUHVQc1A5cFNDUzM5bHcybEkrWmZPWm92MDc4cExYcWczYlpnZVpWWUdL?=
 =?utf-8?B?TnhGaTBlQ0phVEEyS3VsRlRJWDZoRXh4Y3pBN0RJVHU4SWN4VjRmZklRRGhG?=
 =?utf-8?B?b3NoaHBrNTZwYUtvcTBGdjY4SmkrN1BubUZBSTgrMFJ4R3hwYm9JVG42M2dh?=
 =?utf-8?B?RG9EVFNDQVMyekZjWmFzRVdpcU5kbjh4OWc0S1BubTZCRmZ3bXBMajRYeTlV?=
 =?utf-8?B?MDluZ2VjbkhWb2oyZWdhRUlXa1JXVXhjZGZYMkNpeVBkOWw2RTVubHplbE1i?=
 =?utf-8?B?WHRVczJSZXNyWm9QazJRUEJMMWZEbU5lK3VFZUdINjBCK0pKQ0M2RWVrdldM?=
 =?utf-8?B?aGNucUZjbkZRTnVGakxXTnE5VFVkMHg1NFRueHJYRnMxSG9SbFVxTVZiYTQ1?=
 =?utf-8?B?aGRrZnZkSnJGRmk4aFB2aXhPMVB2VUt3VnJVaUV6ZnJkbEE0VDBqLzhIWXFJ?=
 =?utf-8?B?Vzg5eVZuSVN3MGxpTCtqK1pSSVVxaUM0Y1hlbHNpS3AybUVidDBYVjZRRnVW?=
 =?utf-8?B?bDhURjV0NUcrNGpSMVNDRTRISEZMTi94MUlkQ2NHR1FwalRCejhjSTVhZzZ6?=
 =?utf-8?B?d0hNWC90WE1pS1dmVzRyQzI5QVRVK3hvU0ZxUEVaNDB6d3Y0Z0FPYVFSc2xF?=
 =?utf-8?B?d1daeGFzczQrSzl1L1pFZGpwaGtxd0tuY2Q1T3pXczhRQ1RjMWdSUExRNFl6?=
 =?utf-8?B?SC9aVmYyVHVhaUw2VGlhRUhPTlpEWWJ5dWNCalA4cVZrN3dIQUYzd29mYzBu?=
 =?utf-8?B?S3JaSVlRYithVC9vbGFPVXBkeVBmbFIwekwxd2xCZWhCS0NYMnBOWjJycGRV?=
 =?utf-8?B?MzFJR3lGa08wOWMvR3RiT2JSVlZRRlNXd1Y4WEVMdll4RFppTWVSZFN5ODZL?=
 =?utf-8?Q?IVu3d1hT/0bvCQ3hs10ZI14OH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F59FBDA4212344BAF25D425581F2CC5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4482826-0b4f-43e1-895d-08db7c50aff2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 05:36:59.3720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4dgh4rAiJlIWlc5qtp3HdcoDynWACZO2zEljmdv6bU0Wfiv2+5eynDKb8JjPLiMYplmtjpOS7JWATMmUpUcFTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7367
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_223711_496179_3745CB71 
X-CRM114-Status: GOOD (  14.37  )
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

SGksIEphc29uOg0KDQpPbiBGcmksIDIwMjMtMDYtMDIgYXQgMDE6MTUgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gMS4gTW92ZSBvdXRwdXQgZHJtIGNvbm5lY3RvciBmcm9tIGVhY2ggZGRw
X3BhdGggYXJyYXkgdG8gY29ubmVjdG9yDQo+IGFycmF5Lg0KPiAyLiBBZGQgZHluYW1pYyBzZWxl
Y3QgYXZhaWxhYmxlIGNvbm5lY3RvciBmbG93IGluIGNydGMgY3JlYXRlIGFuZA0KPiBlbmFibGUu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOYW5jeSBMaW4gPG5hbmN5LmxpbkBtZWRpYXRlay5jb20+
DQo+IFNpZ25lZC1vZmYtYnk6IE5hdGhhbiBMdSA8bmF0aGFuLmx1QG1lZGlhdGVrLmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogSmFzb24tSkguTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0K
PiAtLS0NCj4gDQoNCltzbmlwXQ0KDQo+IA0KPiArDQo+ICBpbnQgbXRrX2RkcF9jb21wX2dldF9p
ZChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsDQo+ICAJCQllbnVtIG10a19kZHBfY29tcF90eXBl
IGNvbXBfdHlwZSk7DQo+ICB1bnNpZ25lZCBpbnQgbXRrX2RybV9maW5kX3Bvc3NpYmxlX2NydGNf
YnlfY29tcChzdHJ1Y3QgZHJtX2RldmljZQ0KPiAqZHJtLA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBpbmRleCA2ZGNiNGJhMjQ2NmMuLjA0MTJhODJjMWVkMCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gQEAgLTE4NSw3
ICsxODUsMTQgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBtdDgxODhfbXRrX2RkcF9tYWlu
W10NCj4gPSB7DQo+ICAJRERQX0NPTVBPTkVOVF9HQU1NQSwNCj4gIAlERFBfQ09NUE9ORU5UX1BP
U1RNQVNLMCwNCj4gIAlERFBfQ09NUE9ORU5UX0RJVEhFUjAsDQo+IC0JRERQX0NPTVBPTkVOVF9E
UF9JTlRGMCwNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgbXQ4MTg4
X210a19kZHBfbWFpbl9yb3V0ZXNfMFtdID0gew0KDQpPbmx5IG9uZSBjb21wb25lbnQgaW4gcm91
dGUsIHNvIGl0J3Mgbm90IG5lY2Vzc2FyeSB0byB1c2UgYXJyYXkgdG8NCnN0b3JlIHJvdXRlLg0K
DQpSZWdhcmRzLA0KQ0sNCg0KPiArCUREUF9DT01QT05FTlRfRFBfSU5URjANCj4gK307DQo+ICsN
Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RybV9yb3V0ZSBtdDgxODhfbXRrX2RkcF9tYWlu
X3JvdXRlc1tdID0gew0KPiArCXswLCBBUlJBWV9TSVpFKG10ODE4OF9tdGtfZGRwX21haW5fcm91
dGVzXzApLA0KPiBtdDgxODhfbXRrX2RkcF9tYWluX3JvdXRlc18wfSwNCj4gIH07DQo+ICANCg==

