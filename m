Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B73C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 20:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZa9gyp4u7GgLd7YSy0rDFJgEXLXkSmrz8mKRvaBInw=; b=R8El1lvfPOZChpQX7AU+epXk8t
	jJCNA4aIXpn6KchOfwwPQfn7zlom5yMR2cqE/ti/4K81djj4ImC6wP0cw7fS9zT1f+IXea9/PFF7D
	j1oqnjtQzyonb3HAXGsn34VZFVQoHsVCFO+JpFrzBy4Xdqiyop9rDr158pel0jPu1IrKDP9X+qT99
	2sLROQ4PojBgZkezs1FUGeqiXgSXdWOwhV85IFt/gsUdv3+Rzd3b9Lgo9QlK5xsxAnIuh0ml4X1M5
	1eeFeNnijkAGQ4+1ACHPe8xFif4ok78+hB/SPJ03C/7d3u1sF1ERDzyjuE5RHOT39DvfD9alMsdgj
	lXPMJ+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHAMF-00EY23-VU; Thu, 28 Jul 2022 20:43:47 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHAMD-00EY1Z-82
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 20:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1659041025; x=1690577025;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=T9potqyazLMlQzGvGB+/pLIK7SRNHWZDue1/o7UNYJQ=;
  b=JOX3ElrqG3cAU+rnSp0jSqsgYewf65J6kn55e9mTizZmdwQXHIdWnQD4
   OU/Shc7TIb31Rh2sJueC2ce0ZzzyhLnh8OT5GRpZc5aqAafvLvlesnvuD
   Ff1+DIPTymAF362p4C3B5kBMReryPFL20OfHpUOwlflOPx/mi4xlQeTU9
   37tT91Hwj/WxKZQPAV8LqJNbKEOhy6ZeHLBB9elJ3s8shCTW4Yb+CUE1A
   4muzNWf0z7zXolEsXJRo7sTxpxkXQFgXe+Q7v9BXO+9047HYhGwJ9f8s3
   JxXgk0TnJo5JI27tAYO+qZ0XtpTpK56ar340LcHLe4CjanhOCvmmUBf6X
   A==;
X-IronPort-AV: E=Sophos;i="5.93,199,1654531200"; 
   d="scan'208";a="319289173"
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
  by ob1.hgst.iphmx.com with ESMTP; 29 Jul 2022 04:43:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cokGYLJpc8w4RP5qqhjix4pjhLX6zyBqnvxqDWKaQ4doGCiEhWqQpvrfxr+eZsGoPoMOgl6ZcENBQD4qlmFjeKoTMXrGgPSp4QBuKqFgKRaNpBRG1XQGFrOLeOwvVC2yYu9HxCWaddKSaZITSO8hS0cta+nw5EFMbpVEVw7v35iYNpl8lcXstvZ9IkYDeGHIebRbM7DMPi4xTVIV27XHDqlzgAHvNlwqLO0vK4XKA5S7rbFB7oAz4mD8cJTKpjoFYBOk5ZJhEQlF57lcQ1EFVZaakFk+La204oNMH7xY1rR+80Vl9ng8/TBKKAQyLvzlspH8ZdjeCtf9Y2fR4hlebQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZa9gyp4u7GgLd7YSy0rDFJgEXLXkSmrz8mKRvaBInw=;
 b=Db1FFFyau0+YsypymJJ0Zp2GfkRSjSYOAYfqv7KmnqFYSnDxR5y3OD9+Qw2kTgSidLN0s9D6Qo/2LEECSRcMxd7b5iZTqQ2s3tP/8mbgkZnHWipFHkGYVAphLlXGiHqMyJyHTMUIkDBEW+ymPgck+VrNjWz6jKFz6Camgd00SGM2t/f0ydz4NBCJmKPaIkPSvi1W7rFTTkFEh7zc0B2qmH1nWt6V+L/F7OaucVemP1b1YQcxggwVBM22RUf7Sj1TVau8wS+fpR9cef/ekmB1lNG08mTo9htYhwGM6ShtI333tAdV4BMQy1MMuEoyqo+H9kgK5mnisb6KFNRxo8paaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZa9gyp4u7GgLd7YSy0rDFJgEXLXkSmrz8mKRvaBInw=;
 b=aD3UnQAdrnr5lHZCtoH69I11EDiX9p4sD5TcEpzXN/P13dTpGx6zFEGSHR1sb+c4guZzhtBfm7ssgs1H8dIGHVeez7UlX74TlsIqr5UVq1Mv8QqyCvK+URegOMC2+dJMy2ogolV5IO/Izp1WJrTuCjBYGN/hFUeaf/qKIxyVbuI=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM6PR04MB5644.namprd04.prod.outlook.com (2603:10b6:5:163::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Thu, 28 Jul 2022 20:43:30 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::5d26:82d8:6c89:9e31]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::5d26:82d8:6c89:9e31%8]) with mapi id 15.20.5458.025; Thu, 28 Jul 2022
 20:43:29 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
	"stanley.chu@mediatek.com" <stanley.chu@mediatek.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "jejb@linux.ibm.com"
	<jejb@linux.ibm.com>
CC: "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
	"alice.chao@mediatek.com" <alice.chao@mediatek.com>, "cc.chou@mediatek.com"
	<cc.chou@mediatek.com>, "chaotian.jing@mediatek.com"
	<chaotian.jing@mediatek.com>, "jiajie.hao@mediatek.com"
	<jiajie.hao@mediatek.com>, "powen.kao@mediatek.com" <powen.kao@mediatek.com>,
	"qilin.tan@mediatek.com" <qilin.tan@mediatek.com>, "lin.gui@mediatek.com"
	<lin.gui@mediatek.com>
Subject: RE: [PATCH v1 0/2] ufs: allow vendor disable wb toggle in clock
 scaling 
Thread-Topic: [PATCH v1 0/2] ufs: allow vendor disable wb toggle in clock
 scaling 
Thread-Index: AQHYolIBfrClJa0OSkOlpwz8p9K6+K2UP71A
Date: Thu, 28 Jul 2022 20:43:29 +0000
Message-ID:  <DM6PR04MB65757F6A74AA12BD31BCAD39FC969@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20220728071637.22364-1-peter.wang@mediatek.com>
In-Reply-To: <20220728071637.22364-1-peter.wang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbc10c7b-7bac-4e2a-16bc-08da70d9d45f
x-ms-traffictypediagnostic: DM6PR04MB5644:EE_
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  7HUAVrIAr2N9V0uIOpC+2xSpZgV+ixUw6Y9d+Of9GtuNnfcLoycvsM5QhjwPmjQtMxIIVXT08bLoQ+HDo6xZ3GhO1N3eo1Qm+AUK0mnn3GYmjxrWSVRENJueGozMiFewcMsT6qJelJjkbnHJmmXSQRDDTcvlFsK5F42IBrj2axG29U7xaRy1yhGOy/lNO5RV24PoYwlcuH+grKu8rvjH/7BzsKcEQ538Z8I8fljkV+gehnRPzf+zRJ7XcII0EHrNIUkuQfdqD9ELKVLZhEvlb9B9QCKmoAbQRy6w6yytBuNPet9azUb/Ij3rv2JzLox6itiD2YLGegiwwyKWq4fT64RsMVLijC3xicy4c9R3dvQYOZjQS+DHDJ0rtj492vhZr4DZv8ZmJ3cR7dVqOHPpaVAEWOGA6Fuyb5TfVV7jwl76btm/yW6vftTCnH96Zz/Cn63aNVaGUb2+eFsxWYGKcKjOQUHNRjUN8I8JoHXUpeU8eXAGM0iWeB8+xtjtNv6nrNWn6Q7mB6F6cQ/Y0Ai6FvqTM2f91HOyF2RvWeZiUN4pJtVw9aAd8DS4NC5HZ2YJ0oUE+Ha4PlKaas6TAYPmkqBNYsQUt1F1KpwzEZAOP30woNNGtWyqbWzCpBnJ0/49PDFEXQLmJZhMvvSmg1OsEWz/wQjnDktlW4ho1PbeY8suOAomB0ZrGcXIwiVnj3zqpGLi+wMy0EetpGR/RmYJiSvWtij5eBJY4vOvw9dRGglo+0QV3x5lfOCNVvzFqZMZFI4OgI4oLAkbwN2Id/V+MsGWArfSJ72N5m3Tk0gYdQU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(9686003)(66476007)(52536014)(4326008)(66556008)(5660300002)(64756008)(76116006)(66446008)(8676002)(66946007)(55016003)(7416002)(8936002)(122000001)(4744005)(2906002)(38100700002)(38070700005)(41300700001)(86362001)(478600001)(82960400001)(4743002)(26005)(71200400001)(54906003)(83380400001)(110136005)(33656002)(316002)(7696005)(186003)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?e6u1Ui/JuegGPu8kUQpvDjJICErz+x8j0znfE23cYwY9IIsmuxFYoc+udaEs?=
 =?us-ascii?Q?rU1fRgbP3RnEAG5TA4hqLpYwGHKrtV4k5Q4gGMNoHNlomB2JhWMfFieTP6WS?=
 =?us-ascii?Q?d+P/4i55zsGFon8cazwx06I4eLChiiQrOmhma4At/GsNgkEDQiM90W8kXA/b?=
 =?us-ascii?Q?4AZUhI6EoixbSZ5LcHcWGapWctsZl34qmFJrS3avX/6kc5EOlmPvFi4NyJ5q?=
 =?us-ascii?Q?pyE88y2c7OKngqGU51bMPPXRm4PxAXSj4xSG/0FpMPhvKqdLJdMjAYV9ShR7?=
 =?us-ascii?Q?wKoliAK4jC+fjwSeIGKQ8WrWc6roIT2Lh8rnmX3HtZtSb/33aUxojKUS9/sj?=
 =?us-ascii?Q?V5Ucxdri5YDKZoLO/lzXxI5pUoB4uvZpY6HufI1ljdML5lhLoDr9EE9q6MT3?=
 =?us-ascii?Q?EGa7hP5WbE1yUgqrEpkHT1dR3kAr72qM5inREQbkbK0+Prn3eH14d2oMv6Dh?=
 =?us-ascii?Q?ZKiWvLUKZcfNTljqFQP57i1CwCG9SIvlGOgxmXwy6QYM2R6Yxslfjs5+dEsN?=
 =?us-ascii?Q?gnL8RSzjjrahDU1Gf3TkxAmrkkbRkuA2h56pd4nJZyVES49/q28IB6wKvaue?=
 =?us-ascii?Q?WNfQPiANHrt8zvPcpJr16smHwHjRhsPWByRdlO4uv9JHhrDAQDLDB5IdYCb8?=
 =?us-ascii?Q?s9ettEq+r214VRXB7jhf7DdeaZtr/zG+Fo677q4C7DLZfPN2CQg6yNzV1TUY?=
 =?us-ascii?Q?42JyDfQ9JBq9ZKepKib3yOCpf+fEv164tK3QTzalzf0/nH8VXlrgAck2cq4c?=
 =?us-ascii?Q?Gxh7LCYMbGVNtZsNHmJpXThKFHE2KO2+rcyK/6DUR6yNHECkGhI6NDqOG8Hl?=
 =?us-ascii?Q?EXohmY943IEnYg9CPkk8bS9mUf3gpOdRPXk/UuDN/AoYIiQT4nGFvbKfaGP+?=
 =?us-ascii?Q?PBpSKiNARBqK8601xYxpWwCBWWz2C1RHAjn8PvvFnEX2aHA2ocOuLJ7ebG2D?=
 =?us-ascii?Q?7n415WqQ2xTGPjVK4fYCK7U8Q665AD4gFMbMiGGPxc3VV7s5bZAdiTLCws29?=
 =?us-ascii?Q?9rclRxWwmWlSg+Er0BAxtsQkv770d6k7PzX/hcgWRI1bXyTHCTCmoD4QN4CP?=
 =?us-ascii?Q?RV2Sucf3nuzfb9CwmFvPyMrjQIy0xqbOKWKnwjrwPLwvfZgSK3rx9X+mmq6V?=
 =?us-ascii?Q?yjcXePBVqXkyuagPmfi/ympPFatNnIP+Cn3gN6Fc42RkX0F5X2/Y4LoVPPLY?=
 =?us-ascii?Q?lw7OpKdLtXKRk54l7HnwXOUFCE6zts6XR473rfeQjBJHtidN5A1C0JlsbH7d?=
 =?us-ascii?Q?jw+twBhk914hAl55wmvYNBKWYXrFqSHtrn9bS/hN3E8kpTn+uGJca6UybcEV?=
 =?us-ascii?Q?j3wYCHfTBwOBmUDIGqTJU0NPSTyPQ/zW+o28IVEREQcfFmSqjKvxtQoqdfF7?=
 =?us-ascii?Q?V96p4iMC5ajO75XMt4m74IDa2NE8Dg2Xm6tMctIfNTqAtJo6GrPHy+XXLpdr?=
 =?us-ascii?Q?4juSANCD7IbKoDQfZ2wIkCf0AIUINqIFBvmzHEUDNoQJm7wRWWwCFdbanCzc?=
 =?us-ascii?Q?OkUa5uus9xZd9C5pw1aL5GmpQbxA+u3ZxI4lT58umMyWMfGREV5y4GqiJHvK?=
 =?us-ascii?Q?NisDUmlPjOa4spAurDc8DN0BQUG5NRGIkyZg4Ghc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc10c7b-7bac-4e2a-16bc-08da70d9d45f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 20:43:29.8937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SNIN8P/cLYzNSCuAdimOobmTLfMKU8rm8VrshCiQo083Y1PJn3P2o0c86h1/O2ARmnF6HF6f3265MitEjGfTJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5644
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_134345_332696_17AD239A 
X-CRM114-Status: GOOD (  11.27  )
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

>=20
> From: Peter Wang <peter.wang@mediatek.com>
>=20
> Mediatek ufs do not want to toggle write booster when clock scaling.
> This patch set allow vendor disable wb toggle in clock scaling.
>=20
> Peter Wang (2):
>   ufs: core: interduce a choice of wb toggle in clock scaling
>   ufs: host: support wb toggle with clock scaling
It would make more sense to squash both patches and add it as #6 after -=20
" Support clk-scaling to optimize power consumption" in your earlier=20
" Provide features and fixes in MediaTek platforms" series.

Either way, Looks good to me.

Thanks,
Avri

