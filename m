Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA40C001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 10:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VF8ofKUT5qHRXr7yC8PL3EkIaPv+GP8WoCIG3n2qTI0=; b=qOPP3sCOMTCw+QduLBGj9iiMv3
	zSTCzgyPt4qYF2EcRYHlhYNQjxy24RpXkS3UHQID3eF7sJ85EmmJ8Nzgp0a1ze0s+XT5ad3IHG391
	0t7yysL8UUp16BqcUkQSTMRQVIXazf1G8Dj/NRY0ox+F6m5/u0Q4eHNsSw5gslcTtgsTZwsmbnNLi
	bAAqqRwe+ixu8NxmjG7M2HNJOvgTtp/0L8hvKf4d71bX95c8qbx2tvunMsGVE6JDcaTsav+mYjDpL
	hkyO2SjYVcOE85tyKArTamSsMDF4B5UgCfa0guTVjcjzdyopaoNslHPWbd+JMYe6fW97kEGa8NOXs
	2SXB2dhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM40c-006dPe-1c;
	Wed, 19 Jul 2023 10:02:14 +0000
Received: from mail-tyzapc01on20709.outbound.protection.outlook.com ([2a01:111:f403:704b::709] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM40Z-006dNA-2Q;
	Wed, 19 Jul 2023 10:02:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXRK+B994bzBjl8q/ulGowjbaWT6WxBLNCx+BG3Pgm5rDuKB0HpAy5t3BYHfmPV/G8PX5GNVq7rY7vHyPWGJYoVnWrlCUk/t5k/yyb6P/GjMKPfKnB4Xi7C8DCOQJl4pe+CVjx5Vy2ia+6RfBC6KL/x6z1SeS/H5bh36KpAO9EQRlV+LZ8pWKFqc+aEeYRkdxOjzfA6QDb7Pf1cN0lGES7y1bux+3XtihZQdrymO3Z1yigHobyhHsQWpkzouaSsUlCNmXHeU12nYwLKfWAwU1xuhliEePE0qPW6eMALekcIgPQAr1Hc5JvxSLCrJj658ZPp5BR+CvsEg7zgeMDSYdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VF8ofKUT5qHRXr7yC8PL3EkIaPv+GP8WoCIG3n2qTI0=;
 b=QrSD2+iRH1gO+ML2HgSFeuoR/EniEMPc0OTxFoUXKyH/XtiTLOFwcRhAMZf3np5fPIzLGWY87fDPaEYMmtAA0mSi4VUykOBMP82YcM8YxsHwRHRbNNpRlPvvQ65JOuahIntLq1k6B7jOhNAqWKItnu1tfJOgpI9vKmpPrb0dKsJ8NHrmgGDJaTyFFeZ+5PZJhFeMdpBGW6qC9TtkIC2WtfCjejQnZZmnPyvuLpNVLA661D+5qXbGu0V6B1vQ4QzcN8PwO7mu4tCn6BzeqYJjxy3ybD60FPuq+JwCESErsN1dYrKhzTx6XTObj6xW3aFj6cTO/tww78UlMfXOxZ24mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VF8ofKUT5qHRXr7yC8PL3EkIaPv+GP8WoCIG3n2qTI0=;
 b=lqxIldS8GwuK5y00d/dX7D7txqhrzGSRKSlSComNKNQLHYsBYHj+oCTgQmBSsijg1DSVbqAd/6RvWiih3NuCrqYXBgtT3KeSdkvTy1erOfyl9URh5jhKERO8trTFV0uYjsenrxSGt44soIV6z1/RHM+WYWBNezu+0idD6DvPFwKwKp4+lN2CLZGw+hddDucgIg5mPbQ+44a2xsWGy9oIV2ZcZ9z6uhspz2+LER0052AVdkqnejLLBo4eP99VzCeLfQ68WKt9ZIxwb4BFxpPq27Mo/+mchS/89eH5Uh9Ngs1eiYbXB9mDmJd96wGSHo7FTKqtMtoSkx6dpMyfeFZzOQ==
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com (2603:1096:400:451::6)
 by PSAPR06MB4071.apcprd06.prod.outlook.com (2603:1096:301:30::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 10:01:50 +0000
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::30f7:d30:53e3:ce86]) by TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::30f7:d30:53e3:ce86%4]) with mapi id 15.20.6609.022; Wed, 19 Jul 2023
 10:01:50 +0000
From: =?gb2312?B?wre67LfJ?= <luhongfei@vivo.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Moudy Ho <moudy.ho@mediatek.com>, Ping-Hsun Wu
	<ping-hsun.wu@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, Deepak R Varma
	<drv@mailo.com>, Sun Ke <sunke32@huawei.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
CC: opensource.kernel <opensource.kernel@vivo.com>, =?gb2312?B?wre67LfJ?=
	<luhongfei@vivo.com>
Subject: [PATCH v2] media: mdp3: Fix resource leak in a
 for_each_child_of_node() loop
Thread-Topic: [PATCH v2] media: mdp3: Fix resource leak in a
 for_each_child_of_node() loop
Thread-Index: Adm6KAmSZ5jOnwvEB0WTVqNMksfdBA==
Date: Wed, 19 Jul 2023 10:01:50 +0000
Message-ID: <20230719100137.41161-1-luhongfei@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: TYCPR01CA0114.jpnprd01.prod.outlook.com
 (2603:1096:405:4::30) To TYZPR06MB6697.apcprd06.prod.outlook.com
 (2603:1096:400:451::6)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6697:EE_|PSAPR06MB4071:EE_
x-ms-office365-filtering-correlation-id: dc809bc6-8300-4039-0ce7-08db883f2c0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c5HSDLM6JNjbA+ejL4qNAOEjdXErp1yYJt20Evym3aIpV/D6mB6cOc0ukttIH1vAiqQPLlpsio6w1NUQT8UCLpYO+lMVko1UJKbbzmht8dwCDMDe1iNwwHT1kl8gJ2BSM6yVkYRtpCAtzQSl7enzpqRMtbXRMehPoKBVXpgEF1fDc5178IRsypH5GYqksY1cvp/26H3sgEjGXX87s0JE+0C0dS7CnDZ/JRiyEyB/ApvtJ5+HwR7T/Z8PaTDxmv1vmrAZzyt+Qj9A8Ox+aTCug7VJD75S6IcUrSL6Hi2Rorst6kGZfupaqvwyKKiufLAGnqf7jvCMtXlt8ZSPZkt0pV/CQvlxu7UqMdSrp0oTrt+lGldBUiot+YrFwhzQJzFtHFs/DW4T/5tTcm1oygUPerIkEpStu0tJn14l6hUSDSgUxBhf1dkAfRG0QimKs3vyCng419wlBRYVHD1ZdtHonIpBxSdT2GR22XNnV+1j5NDHwmNJ/xrEZskQgqPmq+HRQh7iEPuR8FoClf4wKsHHgL6wvDIrf6rH2U+FAZrdm5HickgRMBP7M3dn5jqL2rSdzwjKPaknsayJg273L4l20uQLJw1Kvl56RZr6G7IJlgWMdqZSTp6II5Gt1Mn7r/8T
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6697.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(136003)(376002)(366004)(396003)(451199021)(7416002)(66556008)(110136005)(66446008)(478600001)(64756008)(4326008)(66476007)(66946007)(316002)(5660300002)(4744005)(8936002)(2906002)(8676002)(41300700001)(54906003)(71200400001)(6512007)(1076003)(6486002)(107886003)(52116002)(26005)(6506007)(38100700002)(921005)(186003)(2616005)(85182001)(36756003)(122000001)(86362001)(38350700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?L0drTU9tendmekl4aEw5RjIzeG9DU3BxU29YSCtxb0Y2TWdvdDNHdFhGRzJC?=
 =?gb2312?B?b1lEZW1RL1pra0poMk9LYmVQY0JDRFdlSnFYZlZ1ZjJ6bkRUaGdDREJnRkVR?=
 =?gb2312?B?enlOcVN2K05weUxpYk5Ib1ZzQUNmdVNTY3Z5enlqTHd5b1NOUXA1Ly96b2hz?=
 =?gb2312?B?SjlTL1NxN1RYaFhFN3N4c0dKS1AyejdVRitQRzNBREtTRDBNYkVpRTd5ellV?=
 =?gb2312?B?VEV3YkE1ODNUK2QxZ0MyRm9DM2ZQMEdqMVRpUmtsWlJqK0VBbHNHTTU0UW5w?=
 =?gb2312?B?dDNJZnNmdGhHK2VxNnNWRFEzYTRLTEZJS2JtbHNBSWl1ajZqcXRyd25oNjBv?=
 =?gb2312?B?US9EZzR5SkhpbWNwd0RMU3lJbTFmdFlDTFZDcnpDY3hlTFcxUitvMEZ3QkJF?=
 =?gb2312?B?dS81YVJib1VCYldBK3lVck5XaTVGNFpJNEJRWk56TUhIR01kaWdtWW5jYkRo?=
 =?gb2312?B?dXR0YmYyeUtOSlFpY282cWhUclBWTHVuL2ZzS213c2sydTRHWHpZdzZHd0xU?=
 =?gb2312?B?aHBTL3NBQVZUMXNhRHloNnYvTVNYeDhqNXM5UldUT1licXJUajJwaVU0NHdw?=
 =?gb2312?B?bWd4NHgwQkhzK0p5MlIvTFo0aW45T0ZqbHJ1K2c2eDEyajdDeFZ1UWduYWxM?=
 =?gb2312?B?OXIzVEpTZGhVMWlJVDZCMmU1TXE3Q2hLbFY3cVhrZVcxa01Qa3RaQXZuTTEz?=
 =?gb2312?B?dHEzK05mOVV5S2tCSXhCZUloaTlRSXFNSjZodmVYcHU5eWRFL29rdGlyY3c5?=
 =?gb2312?B?aHZCTmd5RTIvZG11RjAxRkZBRlYzdmwxK1lNVDJualJjMUM2aEg2eXZxcUYv?=
 =?gb2312?B?bDQxQThQdHV1YkI0T25TeDFBNDlZUVZlMGRuZHc2MlR2V2FDaHBRdXlJbE1x?=
 =?gb2312?B?RHJ0eDk2UDZJMWxEeXJ2ZTExOTJHWk5NUUp1R1dVTHJ2SGhSYy9NSXZ0bVRC?=
 =?gb2312?B?Nk5Mb3UvUXVNLzkxbHNTc1RzSnNEOUlOL0F6VGdRS1ViQ3lUL2s2MnUwajFM?=
 =?gb2312?B?blVUcTJKWjJ3MWJpRE1kMXpBei9wT3BlLytPMkhHY3dMaUxCdWtnZXp6Rk5S?=
 =?gb2312?B?NUFTRklnY2ZQYzZTRk53b3RZZ052a2NqdE9aUUZEa0RSRWhXZWFoWStRSDhP?=
 =?gb2312?B?QTFkdzhXOGJ3c3hPVGFyK3FhdUlGTjl1TVI3ZUZ4dFJYZER1NU1DYzFMQkxt?=
 =?gb2312?B?VFVTc1FYZmp3eGZmSEZNeFViUkhtQk9NVllmTUlXbm5vcWlCdUdCdURGSUJB?=
 =?gb2312?B?czU0ODhlNG9UTGYyYTA0L2x5YkVnMUU3Z2V1QXRlb1QzYU9pbmtWOUhvM2Ry?=
 =?gb2312?B?a2dReGpJUEY3VkZ0emFvckRCYmo2emNvVlk2b0ZHc2xBSENNT0hOZUZVTUlh?=
 =?gb2312?B?b1pFWk5ieHRJUWtLcEJ3M2dIekFXaVRjY2tJdjl5b3pYQjBjODVZWllvSitB?=
 =?gb2312?B?TjFmVWxVdGgzN1NZaXNaa25iOUxXeVN0QmkveDRIQUxSMExjbGhRS1crZU1R?=
 =?gb2312?B?SGZuMkZHajI3SGhHY0dWRExNZGh4MWt5aVVSNkNQZHhvcmswaW1aQ1l3Z1hS?=
 =?gb2312?B?SDZwNGRFWjNjMHRDMCtLcUFsWXQzdzJvRENnaENpV2tCMXNFb3c5bkdRWitm?=
 =?gb2312?B?VkE5T1BqNThzNExMTGN3b2FPTjhZZ3hCeEFvcktkSzg4N0E3MldIaVhSYTV6?=
 =?gb2312?B?T1VXeHZscWlrR3Nkd1NFT1lLRG1aNUhuODBpZWt1RXFPTHl4NWRjNCtnZml6?=
 =?gb2312?B?VkdDRTBxRWppbkhMeDJUZlcydEd3ZjIzYXlNanBwTUI1b0FoQjBId3FyUFU4?=
 =?gb2312?B?SnJ1TFZEVXJ1VDF2RndLMm91cGd1SU5CbWpncVZybXlVNGNEeWZYQVk3dlpG?=
 =?gb2312?B?Ry9PZnRMMXZ5cjRRYklWUjRqSHhsQ2wrclIreVFVNHpvZWJvWkJPOUlyN2JU?=
 =?gb2312?B?NW1qRG9yVnhIYnlnQ2lEQnJSM1o2TGtFejkvWWJNd3RLL1c2UGxOd0Q4TVhm?=
 =?gb2312?B?VWRnY09uSEhPSGY0VkdycDVMTVBLcUttbmo0VDA2MkV4UUkzOVNkMm1JQzdH?=
 =?gb2312?B?UFJGZHNvaDBWV3JRaU1TL2lFRm9weGlBNGpBRVRIODlrcjN2RG9oNmpVY2tH?=
 =?gb2312?Q?tqWM8uCGo0U28mEIpFPNE5Qoz?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6697.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc809bc6-8300-4039-0ce7-08db883f2c0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 10:01:50.6239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +PQIwfwaaceyQntZR2+fygdAMoP/7/zNMfASOO7NgkgNOecyVapDSefZS2VbZmrqojgKo1Ip+n5/YI8GtX2LWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_030211_796004_2652C261 
X-CRM114-Status: GOOD (  11.26  )
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

Zm9yX2VhY2hfY2hpbGRfb2Zfbm9kZSBzaG91bGQgaGF2ZSBvZl9ub2RlX3B1dCgpDQppbiBlcnJv
ciBwYXRoIGF2b2lkIHJlc291cmNlIGxlYWtzLg0KDQpTaWduZWQtb2ZmLWJ5OiBMdSBIb25nZmVp
IDxsdWhvbmdmZWlAdml2by5jb20+DQotLS0NCkNoYW5nZWxvZzoNCnYxLT52MjoNCjEuIENoYW5n
ZSB0aGUgc3ViamVjdCBsaW5lIG9mIHRoaXMgcGF0Y2ggdG8gaW5jbHVkZSBkcml2ZXIgbmFtZS4N
CjIuIFJlbW92ZSB0aGUgdW5uZWVkZWQgb2Zfbm9kZV9wdXQuDQoNCiBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY29tcC5jIHwgMSArDQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY29tcC5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
ZWRpYXRlay9tZHAzL210ay1tZHAzLWNvbXAuYw0KaW5kZXggYTYwNWU4MGM3ZGMzLi40MGM0Yjc5
YTUwOTAgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMv
bXRrLW1kcDMtY29tcC5jDQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21k
cDMvbXRrLW1kcDMtY29tcC5jDQpAQCAtMTEzNSw2ICsxMTM1LDcgQEAgaW50IG1kcF9jb21wX2Nv
bmZpZyhzdHJ1Y3QgbWRwX2RldiAqbWRwKQ0KIAkJY29tcCA9IG1kcF9jb21wX2NyZWF0ZShtZHAs
IG5vZGUsIGlkKTsNCiAJCWlmIChJU19FUlIoY29tcCkpIHsNCiAJCQlyZXQgPSBQVFJfRVJSKGNv
bXApOw0KKwkJCW9mX25vZGVfcHV0KG5vZGUpOw0KIAkJCWdvdG8gZXJyX2luaXRfY29tcHM7DQog
CQl9DQogDQotLSANCjIuMzkuMA0KDQo=

