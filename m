Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22329C77B7C
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 May 2023 14:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfEZUsBd8PhHOwH7wVI5boERlBIs90PqKjWeSm8Pz2k=; b=OWbbgZmX6XG6BlhPYH5pFYhXMW
	SsSiLx5ZkHGum8qCX6cTjJETypzoLeTAad+QSsBPEEiYjNNvswtlNDocTBJLObOozo0JYpwGj1w3v
	EUFLBzYZmkezu0IuaSCbH3K7pWb2xoLK08zPNCRLUl/2pahZHW8pS7KgV/0UndGIYY3QJAE8GNgT4
	7sZ8hLtOzvh9Tq4vKVHVqDBbi6jj4RBTF+e4ozxSJTnfbmwMK/jUMKmGDOCkri17lawjU4DySuy6h
	RE351EBaIAGOG3KUWmXRCXBIwEh6wNOjdsDV1YHzBLgfgUAwEG7U0K+79o28MhjCBbmaWz298lZmg
	MALfF84Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwOeV-003cmb-35;
	Tue, 09 May 2023 14:49:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwOeS-003cl3-0J;
	Tue, 09 May 2023 14:49:17 +0000
X-UUID: a908d6bcee7811ed912e1518a6540028-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=FfEZUsBd8PhHOwH7wVI5boERlBIs90PqKjWeSm8Pz2k=;
	b=jHEAG042TGb6SK0aWH+6lzrmhTu5U9jibxchgxileAzfXFT5pyW/GfobyfGBlmMcbpQbYoHv45sHJH3VH646JnY/nx21NqVBJi+Lk/2cT1to0H1jNhPMSJDLglG3n25KNVnlw+SWYJuIniZJwRZIrSJ0y2rera5bKhtJeSgKfd8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:5d828614-ff5f-4273-8f36-b6027dcc5f41,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:178d4d4,CLOUDID:f43a49c0-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: a908d6bcee7811ed912e1518a6540028-20230509
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 63002935; Tue, 09 May 2023 07:49:11 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 May 2023 22:38:34 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 May 2023 22:38:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6wZBEYr3Ymm1bG5py2qqv6PYpbz3MnGOQMz5f0SmO+heg2AvEREn+42yIz7Zh1P43xOtlI95sjyG9c0M4k4tkL/ok22kjm0IgWWUa8+3/PfdcbO8qPuVSJJwiFIYP0spLVlQFqJcibewWVp6xpP9TK+LJBmHMFIVFmIf6WpHGybgvj8sOMRrkmXE3qjg2GwY61/isqQA9i+Py/ezuiFD5nMMJb77X04ZWvctgt4QZjLyXQ+yg5xcqWdSDxw+PBOyVnXeZXQB/vRIkyHTM9dnjWtU92pZQLd7Yt8orUqllxG8yg4O68lIHhpLoHH3b/OiKNQ01YDcCnke7+KSQ+cRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfEZUsBd8PhHOwH7wVI5boERlBIs90PqKjWeSm8Pz2k=;
 b=LrPiVc+Evi3CjL6QkOKfPUyOALB2UDrFpP3popyLISFLaidHul2BKwuYZxizRDHl9k6H6wfc4zWDzpwkgTzl/qFDF5Rot2fyauixCmjIrz5Vw1DZcT43Q2JowzvZYoC/Ab9jTZpbLrlZnP5KnxYxeBsNSrsJUqxS8pvStOi6PagRvNnJ3RFfgWRigIpK80/UrYikdrr14mKpWb51adBSpJKJUg1e4rlXZKl1oAAcjbfXsb9r2kSEGTqvh7Y8vepL2C/z5B1MaZga2VN2MjEliCoTIwyp9vqxu9uurcjGD5jB9duGF5RwRyHLozaDyvc4mqBZIkHAWTCr2fzJK9sB5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfEZUsBd8PhHOwH7wVI5boERlBIs90PqKjWeSm8Pz2k=;
 b=JsHn90HtjanjXcn+Mkv3VUrJl0sDzKuZH+LWHc2+xZVfVVsMxvpCRwM6Q/Hyr/ZKM65bkOKwYnRbgKSfFDd/KV4WMYlsvxIq7GMAtz9gamk8FzTaega86UF5OGkYCDj4Y9InO/vkeCQ7D9ZI4IrYuyWgqSwTqskDzt4LY7/NhMg=
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com (2603:1096:803:3b::21)
 by TYZPR03MB5995.apcprd03.prod.outlook.com (2603:1096:400:12a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 14:38:32 +0000
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::66d9:2bd0:26ba:d9bb]) by PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::66d9:2bd0:26ba:d9bb%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 14:38:32 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"wenst@chromium.org" <wenst@chromium.org>, "kernel@collabora.com"
	<kernel@collabora.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 02/11] drm/mediatek: gamma: Reduce indentation in
 mtk_gamma_set_common()
Thread-Topic: [PATCH v3 02/11] drm/mediatek: gamma: Reduce indentation in
 mtk_gamma_set_common()
Thread-Index: AQHZgBdtFS8SkzXmdkuSXvCpFnLrMa9SB6qA
Date: Tue, 9 May 2023 14:38:32 +0000
Message-ID: <a6ef1a063de33e337003abc4738820cfe53cb0dd.camel@mediatek.com>
References: <20230506123549.101727-1-angelogioacchino.delregno@collabora.com>
	 <20230506123549.101727-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230506123549.101727-3-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU1PR03MB3062:EE_|TYZPR03MB5995:EE_
x-ms-office365-filtering-correlation-id: 2a4b9bae-6a12-4711-b9f4-08db509b101c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0RTVH9uaY6nVd6IeaMIENOlDRQuRF81bLqUcgZbL1NR5lC8s2wQlSL3JwqZiFjlboo+tP4+p6xNva2h7Dim3r1T77K+Q83rFV6dtlEt+tigC/gzwMSf8k4/Z6lHUrZ04TdD7r5nEIfFIu6IDEivG9J2ifSXlD1RqA2lsUEqKjJcilmMHW3TzqiQ98iCJpCgw+6NiZvoza/dBN7Y6yu3fvBdCTm1EwLECn4jETp3yuXUM1Eva4E1PUvDrQgxRPXS+JGGBUD8FmC3RPly6ZF1dB2yotBKw6F+MAJnswNAdV1n73PQbUmkujhieFZNUrEEbejkLIpLQmao3ir4tl4Jg9ShMrvg+KluBVO/xoZzOkgNzrJSvlXyDaxKTGeW7ieEwTYh48PJA7nVSkg5pDpR1KxleOi4U9TAwJAzU78bIq3UCeXfv2UJA1c+LbGUF+3zAZ0fhcCeU1tK2knXsuy2yW+yHS2qx2uwtR7iteWJXmf+KCIE3i+pGag2wE71uXFg8qEtzJYhfjOIGNAfcidzPZCRbrQnongr7DyB29LVHZlJfOoD3EZ+8PsBNx6aAf8+TaCcBnOx+bmPLAOImVBT+jNI4R0I/dyTkWCY152pT8sYdSj6/AUcYLZDwG1owE2T1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU1PR03MB3062.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199021)(66476007)(4744005)(7416002)(8676002)(8936002)(5660300002)(41300700001)(4326008)(316002)(64756008)(76116006)(91956017)(66556008)(66946007)(83380400001)(85182001)(71200400001)(26005)(186003)(6506007)(6512007)(478600001)(6486002)(2906002)(66446008)(38070700005)(86362001)(38100700002)(36756003)(2616005)(54906003)(110136005)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Uk04L1R1TjRYNVp4ZnpRNzE3L05HcmlVRjNzRW1wSGwrZFJpcmhBa29WdFRm?=
 =?utf-8?B?WEdFSEhIYy9PV2ZJOWdRRjF6R29wVXFqTVg0TFhmL293a2tPbVVaeHpqdVlq?=
 =?utf-8?B?a0FmR2lnUGViRW5abFV0aFpVditkSHk4YlV6WEdBdElwM2txc0hPN21tSiti?=
 =?utf-8?B?ejd6VUVUemdBTmkzMTRNdWRGeHBHeHpxT2Z3REhhVXBXcGErYllwU2g1Uzcv?=
 =?utf-8?B?RDRUdE5oZXlqak4vRkZMbk1vSnFYeUpGcjhjYUc3SGdwNU9jSjR1WDZXUDBS?=
 =?utf-8?B?MStqSGhVdXlaQWdLQmlESjNQbDZjUjNVUW05dHBRKzA4Y1FSWXZvNzV2WmRa?=
 =?utf-8?B?eWp2QkVoSnVIMHFsNzgzajVGRlVYNGsydkU2bGEzV0xSVy9GUkFjRHl3cHlx?=
 =?utf-8?B?dHZMQzlrK3k2VGN5WXlXY09iL1pOZEYrYUplMlpRazlHeVkyTzNDYnI2ZFNv?=
 =?utf-8?B?eHBmVy9jTWU0M29OcGlSVzRYeG9MLzVOTUtHZ1ViZzJ6RkJXZU80bUdYSW9W?=
 =?utf-8?B?MDRjQW9Bdys4NGtXSXY0ajA1cGZ3NnFTeFhIcTRubzAvVDQrY042VnluRExx?=
 =?utf-8?B?aE5XYlh6TmJsVFdHK0JzbUxzTjJPMThzS2Q4OUNmR1hZa3h1N0o3LytRNlk3?=
 =?utf-8?B?U1BDK21YTU5jdS9NLy9HSjZ6N2habi9zdTY5bHB6SFozMjF0V1hrWWFRaGFx?=
 =?utf-8?B?REQvdU8yUXdZUFJ3RkdTMUQ0WW11UGRqQVlFMkdsSlYzM2haMzJEcnJNWElJ?=
 =?utf-8?B?aGZZeGxLdTM1SjkvTTdQY3Zjdkc3Y2V0OEhobU5RR24wZXQ3NzM0K2JvMHRt?=
 =?utf-8?B?SjFHcThMc1BVVWo4TlhEQnd3bWk2LzliSCtTaUJzYVpRL2REN0lvcVMxRWs3?=
 =?utf-8?B?UllHZFk5VFJ0N1hDNGE2TEsrR1FKdnlDNzh0SkRRdTZHYVhKZzJ5bElzWjVu?=
 =?utf-8?B?UU5GTWI5TW80cm5aOWQ0MThvdy9Cd0xINWJVMkNEUng0dVJ6OTZJRy8wc1Nt?=
 =?utf-8?B?Q0tOT0NRUm1QSVVoUm9EMlc0N1VsSit5RlNFS1Y0WUhzZDhUSFVaTzlzZGxh?=
 =?utf-8?B?aGxFVDB2RmVaS0gvQ2F0SnZUbEwzRCt0bHJqOTRYTGwrWk9JWXlOa25paVFq?=
 =?utf-8?B?WlBQUEZvRHRWRFlSZjVGOEFWWEMrbUdCMjRsUk0vTVQwdjQ0OGdoZUF4V053?=
 =?utf-8?B?aWFiYWhVaC96bDhieDlhVHZjc0lQWlhyM3pOYkp5eE0vaER3Y1V5TmRIVUp3?=
 =?utf-8?B?RHhFcHc5c2RQa1RKTVl5dHlPdkNFc2ViVEk3QmFnUTZ3eDVsRUh3YkY1bG9M?=
 =?utf-8?B?K3VzWW9HalRzSHBjYVN5MmZXcmkvUVRMVEVMOW43MVFXamJGYWI1LzEvdEdt?=
 =?utf-8?B?OW5ZRm9iTDdCMnUxVXJZQXBQd3FNTnFXMmhoRGJyWTlkQlBzT1ZWM0UvQWNi?=
 =?utf-8?B?YVVrYk1uYkNFempKd2lScHF0ck1HNS8xNXpuYWgrMUhuU3VsUUlvbUJVcVk2?=
 =?utf-8?B?eE1qSEtEVWVIRzBVLzhrVWpqcGNyM2xJUnA5all2TE1ReFFWY1U0SjZxbk5Q?=
 =?utf-8?B?VVpSbTd3b1FzVWJEWmk0QWl5SnlsSm44VXBLUCs5a09FUUZmSFdJYnRwT2J5?=
 =?utf-8?B?NUQ4OEVLYXd6d3I0cVVtWWpTUCsxWUM4K01hSjVCbnpsWURUL3BIdnlwdmhI?=
 =?utf-8?B?MzVCWmZNQW5VODgzRmY2cERBQ1h3b0ZqWU5ZZEJNbHV6U3hvQVNnNmFjcDI5?=
 =?utf-8?B?SkNBRkFxNHRwT2dYaWNsL1NuZHdVK0Jqd2FKTXM3cExGQlEwUFJxK2dySjk2?=
 =?utf-8?B?S3F1K2orbEhZcjN4bWJmVjFYaXhaaTZXa1J4cWt2Q0k4Ly9heVZlclk0YTRU?=
 =?utf-8?B?K3RNOUhFaTFzME9VRnJZRjhUY2EyTXo0ZVR6WTRkK2hLY3RpanN3bFZnTDgy?=
 =?utf-8?B?My9oQ1BTNnlTMjFiaGJjOGVSd0hCNU1TN0kvMGZUYmN0YjRmT0ZKMXBwVjVy?=
 =?utf-8?B?ZUpyTTFiOVV0SHdMa3R4MjNtZ3lIZ1V3L2JwR0dFeDFnZDdQSng5NzJoRTJX?=
 =?utf-8?B?T3Q5WlZtSnBxTUZBYWdXSzlWUzZUYWF0N1A1b01QdjVEendqbk5VWEVET1A0?=
 =?utf-8?B?L1ZTTkZVTzRYZ08rcklnRzFPRGxaTHkzLy90bUhvcVVSNHN3UkhVWi9PM0hN?=
 =?utf-8?B?c1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <586FA48E54D72843A93442FBEEB101FC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU1PR03MB3062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a4b9bae-6a12-4711-b9f4-08db509b101c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 14:38:32.3108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cF+GxZ8BGozIv0P+VtoTdjKzXqT+xL/5VGU3AXpgpK1rjkrY5OB4sSnI1r4aCYf2uY1rTN+ML5KwMXmJUnkn8vtejZKSa8m3DvYuPQtnZpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5995
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_074916_146354_9F7AFE1D 
X-CRM114-Status: GOOD (  10.69  )
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

SGkgQW5nZWxvLA0KDQpPbiBTYXQsIDIwMjMtMDUtMDYgYXQgMTQ6MzUgKzAyMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJp
ZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IEludmVydCB0aGUgY2hl
Y2sgZm9yIHN0YXRlLT5nYW1tYV9sdXQgYW5kIG1vdmUgaXQgYXQgdGhlIGJlZ2lubmluZw0KPiBv
ZiB0aGUgZnVuY3Rpb24gdG8gcmVkdWNlIGluZGVudGF0aW9uOiB0aGlzIHByZXBhcmVzIHRoZSBj
b2RlIGZvcg0KPiBrZWVwaW5nIHJlYWRhYmlsaXR5IG9uIGxhdGVyIGFkZGl0aW9ucy4NCj4gDQo+
IFRoaXMgY29tbWl0IGJyaW5ncyBubyBmdW5jdGlvbmFsIGNoYW5nZXMuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dpb2FjY2hpbm8u
ZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEphc29uLUpILkxpbiA8amFz
b24tamgubGluQG1lZGlhdGVrLmNvbT4NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0K

