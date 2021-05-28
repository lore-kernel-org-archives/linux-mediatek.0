Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96483C47087
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 07:31:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DD24611CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 07:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DD24611CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IChA0eSuXxYW7ll20DHI6ZwIfz/9igzV59jgBW2Z4tg=; b=4u6q6AW0Y4Q0aI
	En99QPZ6xSom/oC+NNiYfXJZ3qAqglFqfZDcMCFVf2YhlvxGEvR8LPpbVj7DCUzHiDvXRK35GMEad
	hqQX2CEt5cGwvKlKiB5CuHdU1jFJOhLSX9rhGULiqtZuBDdFp0eiqxtL6104XMPV5eopaDrwl6vlj
	aJicbgwP963xD5f3aZtVsbRSXTFGIHvNRgLbFxkR/KvT4fn2PzKgTn7ls012UaNNTYoBqsoeAGuYS
	Kw/4+6LMqNFm9iW72/afhtCDl6gu48clB/oLTtokey4T+7QpQYiNEaKhFCpyHR55UE/u1/oTqELyY
	4DmZJxS3dYRm8LMofEqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmWxT-00D1fs-Kt; Fri, 28 May 2021 07:31:03 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmWx5-00D1Qy-F7; Fri, 28 May 2021 07:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622187039; x=1653723039;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XC4OCbdPT/OgR8xq5cUX1oiAdTgZflA/RbTm6sJCNOM=;
 b=pkPUV5J19cKTMiHjCV1+xJxVv4MFo06whd8XvGQwqNONaU1gPWZXB/KW
 fOACAtXUpDgxOolJx+MMjdA/OPmatSugVJbLY/LFv2sh21VHmh05NpN2X
 OZEvkvZfhxIX2BdVCngobBHBeiDeISUBvYwvFMUmRI709nO0ixAgzXh0H
 1m2Vg+7reXXai6JI1AY6/sDccMH7NqrrP3o/OZHZ9pHjeC1yFZ5kBbVC3
 goeVxIcTPNDhT97LhkyGYD+N5RA84ddW+ocrCQrsf8iV8zqfif6KqhHqB
 HJJ4jHcPUghf1cA3020r6EvotSJfnEvOyT0Tr+9gXp8/O1O7YtuSFsRqb A==;
IronPort-SDR: 5+QNhbE5zmXP//EUXrEjci0AJ57OgxNoafyZWB1OD3HncNeRZAXt9r0IqUzf2Zz0LZr9rZLnUN
 YR4MhkDNxjPL5Cl7rgdDMtL+bTfA1YuGEQU7pl+us6pRgIRgAB5oF+iln/hElO0BXQncWeTsa7
 m17Be0mH3SPuymU95twrBBRHz6oJesd7yruRyiL+izmLLhlxiASO+y2qM3cuBlHDFj9iZzM4I2
 2oAnfO/JtWCOjftadqvXQnYIxP8I6dpAk0lK9y+whvGlMjntAA0S18hPX4Nt0nMvjpZtJJT6gB
 2So=
X-IronPort-AV: E=Sophos;i="5.83,229,1616428800"; d="scan'208";a="281126130"
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hgst.iphmx.com with ESMTP; 28 May 2021 15:30:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afe0oCL0eEGJbs5sQEFIa98/4rcjRMVjLr6/3LN4YJtjQmj21IhFIVKOV30d3X3dAfvfwIHouYMfDftq4NaxGG/4ryagBsZ8XF5aL7ryGyNB+zJqpgNBH3/0Q+m4bXV1lPix4hqhmtrWVhzCLuKnf+wIYEncfiBFv0NKD9+zuNt2HpyCmMDBFUiue9B5amD+/RQA2649DPqIDRwd9RgwOMiEA0RLJ9+EPBKvmoMkV1IQTEAo4WulU1XQJ7FQXxm7WgCg/zo/SHsr7HWXUgZtsr84fld4K26eZYkOQobTaTpd496g/VxmxyBKb+ab3QUg0gpofrc5T3/zq3E27/F6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XC4OCbdPT/OgR8xq5cUX1oiAdTgZflA/RbTm6sJCNOM=;
 b=LIt+rS1TTwvSPJjgwNAz9l9VMrOFeUGsP4cmev4Cw6q/qrRm0bdd8jsdLSWynfrq7AMuCBtdh0fFdY6wGwAL3jLEiTm+UAXL4EEXmROcE//hS9jguZ0JTVxnNpKeRb6F4luhI11PtXyIybu4NcbHmXz6jX4W3gt1D33lQ6ulGRHRlPeu1zxCTQTXmx2wyw/3bZiez6EPMcAtXk7jUt2Bi9fNKkbq/vlLrtZ7afgsaDdlM2VOU0qKzK6SjZvXNk6wa9roY0tg+lh98Z8c2tESDhaF3uh9NmgGX6YtZlX85lJ94PB7SgreSNSz1vhPuT7OJE1mifY+Tv1D7OMmmLuMXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XC4OCbdPT/OgR8xq5cUX1oiAdTgZflA/RbTm6sJCNOM=;
 b=RxWW0XypVXmFoSWyQ+8NZDw2VLOTn2NQgGE/dmNoyyXGYrWQvjTfRAtUqQE8h68mMY9freg5HCUfnLcZppJFWTsJG5R9kFBcyC04UMZXjqeUYLbLkgsCDSU0ZXrzworlSqqWc/l9kCV/q7iyDKangTQ0RX8UcH5ub/oeHzlBBmc=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM5PR0401MB3654.namprd04.prod.outlook.com (2603:10b6:4:79::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.24; Fri, 28 May 2021 07:30:32 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::ed2d:4ccc:f42b:9966]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::ed2d:4ccc:f42b:9966%6]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 07:30:32 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: "Asutosh Das (asd)" <asutoshd@codeaurora.org>, Bart Van Assche
 <bvanassche@acm.org>, Can Guo <cang@codeaurora.org>, "nguyenb@codeaurora.org"
 <nguyenb@codeaurora.org>, "hongwus@codeaurora.org" <hongwus@codeaurora.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "kernel-team@android.com" <kernel-team@android.com>
CC: Stanley Chu <stanley.chu@mediatek.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Kiwoong Kim
 <kwmad.kim@samsung.com>, Satya Tangirala <satyat@google.com>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: RE: [PATCH v1 2/3] scsi: ufs: Optimize host lock on transfer requests
 send/compl paths
Thread-Topic: [PATCH v1 2/3] scsi: ufs: Optimize host lock on transfer
 requests send/compl paths
Thread-Index: AQHXUHgHUX4+5y22lkmg8exJdO90rKrzENmAgABaTgCAAHAxUIAEqb/w
Date: Fri, 28 May 2021 07:30:32 +0000
Message-ID: <DM6PR04MB657525D67B70FF3418511694FC229@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <1621845419-14194-1-git-send-email-cang@codeaurora.org>
 <1621845419-14194-3-git-send-email-cang@codeaurora.org>
 <41a08b3e-122d-4f1a-abbd-4b5730f880b2@acm.org>
 <d4ff8e1a-f368-6720-798a-a2a31a4d41fb@codeaurora.org>
 <DM6PR04MB65752DD2F442C178B2D0233AFC259@DM6PR04MB6575.namprd04.prod.outlook.com>
In-Reply-To: <DM6PR04MB65752DD2F442C178B2D0233AFC259@DM6PR04MB6575.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [77.138.4.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aade9801-e71c-4c21-3c3e-08d921aa7a0f
x-ms-traffictypediagnostic: DM5PR0401MB3654:
x-microsoft-antispam-prvs: <DM5PR0401MB3654CA2BCD99998F24F70841FC229@DM5PR0401MB3654.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fXHFAEjhMPTaFbNoJ2uVKeDRzePC97T7wRVzpmx6m3QW19lk7BK8W+GsySuMcCQivPk8QTeA4GyC6IRDQfIaT9LnrvlLOrGjgrAYNNFpx2q6O1QUlwPWb87rtl1/ntRTyKAMQUJRzkPWWxm5LSGeFM0q5/LTrHuPf5OkYLlIxf1EMbngz4Wc0Wg/fIhSrbbdz3dUlTL0U/GywEktrX8kz2U5JClYF9CGcT8WM2vAMaX6Qug9ewiEm71bd5YcQrFqN5Us029T+z9IVRRQ1uyWdZRno4LVpwtAv/0q8hG4A/BDNWIcwVFnqKBDgBnlM1Ezt3n9lMJ18WjOPio5gUj/odIOKKW48GEy6LZjvY+ClO3hq8HcyNQ3AHXH77tYegKXHXpoJuTD+oZ+HxJnzVXB5Tu0dnckSAAeJSdiwmD0ADF9R6mYt+t/1cyEX7ZGHlN6D4dllhjLyeL6r3QIrregRp8RN99bOWlskHoOSdAJtNuNBZW0VKE2L2Wk0pHojHSJoI8wNa9f6o/KbEee0x7HDCCMbQfVujrT+AUvYzAepq2OGKdlTjtWjhSvi58mIvdzA8ZFEW/rs80CGRODUiooKWTXpdIVyExM83ZXT3MeBTQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6575.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(7416002)(53546011)(7696005)(26005)(6506007)(54906003)(110136005)(478600001)(83380400001)(316002)(55016002)(71200400001)(66946007)(76116006)(8676002)(64756008)(66556008)(66476007)(4326008)(5660300002)(8936002)(52536014)(122000001)(2906002)(86362001)(66446008)(38100700002)(9686003)(186003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TFJZcnhHRXo5VTg2c29nanNnQXdDQi80bjRyVkQ1Z2kyVU50RE5IWEd3S09O?=
 =?utf-8?B?N0wxVm5ZOE9NbHBab2Q1VFZ1cDc5d0FhVGFQdE9oek5KcE9YeW04b0ZOOWl2?=
 =?utf-8?B?eFF4WXlZZ0dlTit0NExmOGR1cmFFVXMwSTE2MDJEWVFzaUw1d3k2U3dlS0Nr?=
 =?utf-8?B?ZkV5OWlIWkNFS1FzUUZkQS9USzJBNldxOStJeU1jRURyOWR2aWk4VGNHNW9S?=
 =?utf-8?B?dEtYRmpPRStlK0VKbnN6bmZYRENvOFJtRys4eFprVzJyQUgwa2d0bnJ6YW9u?=
 =?utf-8?B?d2FMS1YvM1FsWWVIVS9YRE51L0dVUnJFRGxsMFk1MENkTVoxa3EyUlFQNUlB?=
 =?utf-8?B?ZlRtM1RCa21vd3phUTZ4T1pBaVBIWktjeDkwa25CMFMwUCtiZ1dYSi9va2dD?=
 =?utf-8?B?SE5EMzlUNUpubjNZUXd4SXdyR1VqUWVSVjg4NlFkdUl4Sk0xaUNicHl3bzdw?=
 =?utf-8?B?amZSeDl6N3pWNjJtMmlGc2Fma3NueWUwSjNMeG14UEZWajd2R2ZURmp1ZmY0?=
 =?utf-8?B?cEp4MzlHUUo3bTlKS0xnaksrek1oZTdJMWZDK3RRbDNlUGZKMGdGeE4xb204?=
 =?utf-8?B?UFEyOVEvdFFaRHhHcU1rWmxyd2tqMFJ0LzVlb3ZKd2tuZEpmN05La1paUGEz?=
 =?utf-8?B?QXo5OHN3Zlh4bHFGR05HdlA0Vkx2ZVVkTk5qU1BWbW1Lb0FiYW1NVnpqUmJG?=
 =?utf-8?B?VjNXazkvTDBRUmc5QlZmemhZcjVuaU1EMmJOVHJTU2lrSEx3OXV2YnRPdHNq?=
 =?utf-8?B?ZUZMTkIvZnB6cS9sbUVJM282bHRYL2NvK2wyMEhJdGtZODdzNE9SbFdYYTdp?=
 =?utf-8?B?OXdoL1JOcnlHL1NPR0ZEYjEwOTREaTRJMWgwUDlPQUp1V1hncGVsMWhqeU1D?=
 =?utf-8?B?VGNqUjdOM212YkRNTUgvanJlcG05cXk0eFBKc0p6U2I4Nit1M2NNZ3pucytJ?=
 =?utf-8?B?ZmZlakIzMGJYdm45cllycXJOYUNOdTliQXBoa3Mxc0g0VXM4bytaTTNicENY?=
 =?utf-8?B?L0NwT3J2bTNYY3BWamVOUjdRL3JHRVZ5Sk1lbzVPQ0k1ZDRSOUFhcU0zRFBk?=
 =?utf-8?B?bUZybExJWkVZRFZGalVENS9QL3VGNGtyeU1TbVhVbVNEci9XTTNPcVhxZDVC?=
 =?utf-8?B?MitPT3BTMXJEZkNTWXZoOWFLYnM2anhyZkNhY2QraFdvaFZkNm9KTk1YeGlN?=
 =?utf-8?B?RXFKZjdINnRZQUxRMEpHRjNKMFNlR01BVnR5QURzRVlZNG1XTmlQNEs2blRv?=
 =?utf-8?B?Ri9aWFdJZURKMXAzYzZsWldiVmlPMFIxOTlBS3hQclJsVFZ6RmtPczFnRFls?=
 =?utf-8?B?N0xxTUZ6c3VYOUVQV2lOYnJsNXFpRy9HR2MyZXM0TGNlVkVTRExtSk16OWtQ?=
 =?utf-8?B?VEh6dkhBbXRYdWdkcTIwNkg1emowMzJwQUpQTFdhM243WXhkZnhERzNPem1U?=
 =?utf-8?B?bzA4bzMyNW13by9hdmlYdWlsWTFkY2Mzb2lvcGJNRGd4eVBxaThTOTd0blZZ?=
 =?utf-8?B?anlHM1hKVFJra3NuU2llcVRHWW54QzNaRGdsdlA4ek9LMVgrUzZwVzYzalNW?=
 =?utf-8?B?K2kyditCbkQ1VHEwREVJL3J5ZXVDR1hFZ3c0OGRiMXduYzUyK0xCMk5xSElB?=
 =?utf-8?B?RUZwYk9NQWV2cXhHVjdldTRLU01nOWY1c0ZzU0V4SXQ5Tnl3cDhpTndEejMz?=
 =?utf-8?B?Y1MxRmcwTXV0WGt5Z0E4T1dRMWJzQzh4UllPZmx0VlQ5TEZKMFQ2N3dBOUlH?=
 =?utf-8?Q?NlZJwSYsVKqJX1+52M=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aade9801-e71c-4c21-3c3e-08d921aa7a0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2021 07:30:32.4705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z3lTjVv5IXDpvbInHVBiCPLiMwcbBBQbM7QXHOZIPXkSKVlEs7atBrBf+PnGTGU7kNlz5hjMv6F7aTRMbYFXew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0401MB3654
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_003039_558571_A3D2B6A9 
X-CRM114-Status: GOOD (  31.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> > On 5/24/2021 1:10 PM, Bart Van Assche wrote:
> > > On 5/24/21 1:36 AM, Can Guo wrote:
> > >> Current UFS IRQ handler is completely wrapped by host lock, and
> because
> > >> ufshcd_send_command() is also protected by host lock, when IRQ
> handler
> > >> fires, not only the CPU running the IRQ handler cannot send new
> > requests,
> > >> the rest CPUs can neither. Move the host lock wrapping the IRQ handler
> > into
> > >> specific branches, i.e., ufshcd_uic_cmd_compl(), ufshcd_check_errors(),
> > >> ufshcd_tmc_handler() and ufshcd_transfer_req_compl(). Meanwhile, to
> > further
> > >> reduce occpuation of host lock in ufshcd_transfer_req_compl(), host
> lock
> > is
> > >> no longer required to call __ufshcd_transfer_req_compl(). As per test,
> the
> > >> optimization can bring considerable gain to random read/write
> > performance.
> > >
> >
> > > An additional question is whether it is necessary for v3.0 UFS devices
> > > to serialize the submission path against the completion path? Multiple
> > > high-performance SCSI LLDs support hardware with separate submission
> > and
> > > completion queues and hence do not need any serialization between the
> > > submission and the completion path. I'm asking this because it is likely
> > > that sooner or later multiqueue support will be added in the UFS
> > > specification. Benefiting from multiqueue support will require to rework
> > > locking in the UFS driver anyway.
> > >
> > Hi Bart,
> > No it's not necessary to serialize both the paths. I think this series
> > attempts to remove this serialization to a certain degree, which is
> > what's giving the performance improvement.
Btw, Is this performance improvement is on top of rq_affinity 2 or 1?

Thanks,
Avri

> >
> > Even if multiqueue support would be available in the future, I think
> > this change is apt now for the current available specification.
> I agree - this looks like the harbinger of a major change,
> And going further with respect of hw queues,
> will need the spec support - e.g. doorbell per lane, etc.
> 
> Thanks,
> Avri
> 
> > > Thanks,
> > >
> > > Bart.
> > >
> >
> >
> > Thanks,
> > -asd
> >
> > --
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> > Forum,
> > Linux Foundation Collaborative Project
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
