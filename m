Return-Path: <SRS0=fEyP=GA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DE6C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 13:00:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD65922582
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 13:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD65922582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zoStuKI4+Ng8+K72JqFdAYbSSj06srSGHHqps0G0/Nc=; b=H3lDnrsk8e519KKU7T55jdDuY
	5tzb9BSZm2VznnGgnhBCMn9cmExozLWhPZGwCnzDRIZOLa+0qHqSuFfGx81DYqeIqCWLU8S0XIu4c
	g/jm45fpkE1Kq60RuuxfFVecxopskl0jwpl/ZZLo49YnMo3A5wIpYt0w5veWRQA9NniQ6n+3bsJcj
	/ZinjqB4/sn02it6evTh7+WE8oHCsv/Esj7ivleHEhKBm3fFnm0v68ZrqhWRBrqEdaVqS3zT10Nr2
	mEHPGIeK0m32tycywYgNFUZiFNqaXK1PFmdRHKCMdHXm6vQGiQQXFn5MAztxkrEnGJHggmv/Vn42q
	7mIvQRRgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kts7m-0004Jz-8w; Mon, 28 Dec 2020 12:59:46 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kts7j-0004JC-4V; Mon, 28 Dec 2020 12:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1609160383; x=1640696383;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8GXfwboeRQXyegt0P1ZqPiHGrq+VYz20x6Ng7HfH8kQ=;
 b=U1FuSPyQxBYFNxpOovMBIC76dmMj3foVnVGKY8JXw4hAvNq3ybNjTmOb
 zlUY/a4kKGItaBEoq90ql4FNVbfv6ErnyiGemTIZwa/vO/lSYHP2jYaqb
 pb69GBBOcfhLHS1t+ref19tVvJWSRs2uqTNTVU1JIfuyoyCQBMTVVdgvh
 dxc7qVTLuamjLGR0kxr/Vhg9VdIiWKlj00okyGHtmTC9Q/uUEvCvfZMiV
 uXBQ5z4OsT26E4FNnzOXyGJlwF17rQZGUgR2QUJcx2cowcFiVsffr8JZs
 jxmLo6g5m0Q82mE6aRyb2JCerWAe96hgwSeEq4qQe5DbT/JF/MBThBuv2 Q==;
IronPort-SDR: trp/8wDWdj5XAXaAbfArU/P5M0kHfGW1zsHuRPdkBTKlG45L1wMjspfsg6GHmYLhnCP+Ry7OmH
 QkKh0/YQh9NlqrkfTGAubidUqP45RpTcdgR5gIpNeV0kTBC4TMhaqbZRp20snKJ7eS1OZb/K97
 vntkBl/0r71n+Dxjfs8Em+OrsudC/nFQRSFOZLEMYAWM1gj0y/g4IZIZArZNBdImfTw4eAxjbG
 KlZWwc1QGYljpHNBWDkTVtmdO/tql4UJrauGH9Qo5Z5KwJ8wDDR+Frbrt7kQSDW2CIJoB5iONb
 Bq4=
X-IronPort-AV: E=Sophos;i="5.78,455,1599494400"; d="scan'208";a="156158953"
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hgst.iphmx.com with ESMTP; 28 Dec 2020 20:59:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErX13RUYWBEbaaq7Jdiui4olJXzfRM3HjdlfIle6FF2nA30ReSSjSyp8RPrAxVvId3j4L5354uOXQOYTx5dB6EyEFK48dzoqoC1OKmtdOcqKq8UhU/iNYpA9CEdM9uDUN0gkzV5zf7KV6wG3udnLDgENxiOvhJcfIrasuqrQWTRmdn4JL1XpZMgt4LSlN4djSTSQltKi5GLccc1zCMi/RH0UE3QzbNFsGqFVkIp0rzVNL31/ohxwwsj1NBRETa5kFB3dRvCF4v8KZvZWS+c1y+q8m9BeB/a7lqFhsr+sLtdLTZS3qywkc3TtyFESfJCXiPzJaAtC3rulkjXCU8pzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GXfwboeRQXyegt0P1ZqPiHGrq+VYz20x6Ng7HfH8kQ=;
 b=ZKOGsNBIpBgTDhcXHFDGvih+ooVI/vIDypAS2jjsLKOkSATESthvhE0ZldCX5iRmc+ntNhpJc7DGiPdrvu5S6eCOjPw3BiO594wQYhmJLaOCFkuQkTxVBSuCF4kakWSsZTBi1Z+1B1c7/qJiwYGoWQL+YcHa+MT6J+Lt10eSwcgGx4o33CETpCPFbN7o4myhRIWIJncXNs2Aw9GrbnLDmoYZAcVpuEQtEyXbm7LDC/97jYZYWz7ZhP7De4kmaiC6bcGO/QWeHm9mPlfZaLkEWTLAFdZ7iDHTwkOIRK7Vqv0JGIC6kPR/bBioVNYxKYlAic9tRilXL+j8cXWjauojOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GXfwboeRQXyegt0P1ZqPiHGrq+VYz20x6Ng7HfH8kQ=;
 b=N0TXkxtKubg0hHTtOC4XUwKY2JJyjU+2w4zNppX53kODcJONb5SyvcUJ7GZO8e64TP2Hi8ue+N5wP/876ujk6Yn4RqgZ1GcTMXTFn3vnVhtGeeWT9DnGz890gKZNCWH0+G+iWxxgAs9oTJHeid+ziyrMo/qdcvIwKt9sAA+Ome4=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM6PR04MB4156.namprd04.prod.outlook.com (2603:10b6:5:98::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.31; Mon, 28 Dec 2020 12:59:36 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::a564:c676:b866:34f6]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::a564:c676:b866:34f6%8]) with mapi id 15.20.3700.031; Mon, 28 Dec 2020
 12:59:36 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Can Guo <cang@codeaurora.org>, Stanley Chu <stanley.chu@mediatek.com>
Subject: RE: [PATCH v1] scsi: ufs-mediatek: Enable
 UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
Thread-Topic: [PATCH v1] scsi: ufs-mediatek: Enable
 UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
Thread-Index: AQHW2DQ3JDYDYaEKR0iGb34jWf7AcqoC/HmAgAEYvgCAAAYJAIAAMzzQgAgzZVA=
Date: Mon, 28 Dec 2020 12:59:36 +0000
Message-ID: <DM6PR04MB65759543EFF1258995C76AC6FCD90@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20201222072928.32328-1-stanley.chu@mediatek.com>
 <c862866ec97516a7ffb891e5de3d132d@codeaurora.org>
 <1608697172.14045.5.camel@mtkswgap22>
 <c83d34ca8b0338526f6440f1c4ee43dd@codeaurora.org>
 <DM6PR04MB657598535F633F59A1DB1F22FCDE0@DM6PR04MB6575.namprd04.prod.outlook.com>
In-Reply-To: <DM6PR04MB657598535F633F59A1DB1F22FCDE0@DM6PR04MB6575.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d0ad947b-ad23-4c8f-8957-08d8ab306dfe
x-ms-traffictypediagnostic: DM6PR04MB4156:
x-microsoft-antispam-prvs: <DM6PR04MB4156C1ACA267B85EFD6F97C9FCD90@DM6PR04MB4156.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pMMZtha4sr85EHpUIpC1NQCRFSSx+0vJOGaY57HoG4iuR0FQvTVSMv6qLThoO4yrV8gh/vrW+dm96k5TdJcy18UHgWJzSO8Zi131u5CaAwuB5/XUEmFTGg7o6YMZOMowP7PwVCUmAmDU033UfIosglRw1zB4aidQJ5Oc7kXJ3DEK1pmVzR9Oan7X6slZVLVncXRJmp7n8H63/o6vjNWpLCDRGBibOvLnmnlR5HY9nxYaDEWj27weHIXcGYjoNmGoGtI1jKms9Xfg57Lvg5/RJ+oBWqM9XVejCbAVZ0fJLLYJGPVLzzrLHIux/kvpyNRQ/JmxayoQ21XBd2ZeQ5MjwJbGgYP4URbrVAO90bzchjnVGQaHvcmGfYtLZ50xTdN2Wt1sA9mVEEfovPwoAvuz5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6575.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(8936002)(71200400001)(4744005)(5660300002)(52536014)(478600001)(54906003)(64756008)(4001150100001)(66446008)(7696005)(33656002)(66476007)(66556008)(2906002)(110136005)(8676002)(186003)(86362001)(76116006)(4326008)(66946007)(9686003)(316002)(55016002)(26005)(7416002)(53546011)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?E6DQ9T4S3vb8cmtDPVvzetx2mPJatAkbQVX+OuYSdIC41CKB++kbv/BCeYey?=
 =?us-ascii?Q?0yNVrxWjT1NE1nkzgTnqA1WCQqzH1XNdboC9wu7nPO/5ktf/JgkVN9IlKlLb?=
 =?us-ascii?Q?ZzM6icl1lVA7+axkPQXBMh3T7RRH7ag33+BHZUbdiTbIit4nCzrNUU3hWHiJ?=
 =?us-ascii?Q?/qgDv6cgubQSrHWb3dx3bzPQEXPnxwvf8dPO8f0x0fUKPVa/WKMpuJREkl6K?=
 =?us-ascii?Q?1Q2JM6/edR0G0FMo5rGv3t9AZKd6h1uh+D75UBoQTWWiGaxDRW8dz3Awoyng?=
 =?us-ascii?Q?TsX8mtQvee9bWuADdVyAW5gTyrZVXPf8OZmr7ere0LNUVxHi6mhfqGYSgxNW?=
 =?us-ascii?Q?/bGJOQ05ckRZGZUeim0YJVokVlWtIPSNuh7v7qAg1Tyb0K+RITuo8XyKyZ/n?=
 =?us-ascii?Q?I1c49uL7g5d6hXZJLVNwcv5IyAz5/f5RD9hoHMyOIhJzMEphg8Zx7XaRVR9X?=
 =?us-ascii?Q?+d/aEER3G9+m5FCrDX35XCSsONHBIY0F6yLJKBmI0/Q/QiEaMcuIhbpxYMca?=
 =?us-ascii?Q?ZMwXTE7yVc1MqfqRCFsgDLhymoCwUo3YYPZWcDFzMUoJVgPOWgbAlBOqpttR?=
 =?us-ascii?Q?5jRmHPPyn1a0Zq786prdANA9l9XodeYw+CTC61bCRtcLUs4esQQia8/GYNsF?=
 =?us-ascii?Q?B8n04GJzxxphk6ZYPDPw+lLuRCI70gu+FV8s2nUZg4Kf3BbWAfGL/vklHNi8?=
 =?us-ascii?Q?+8bLTDUY6iZ9KSPIrMBjI6/RSV5zXC4e5hVLuyT8Yftnd1u/V0kpyYM8w+uk?=
 =?us-ascii?Q?HKwuD4H3lZ+yQ18DRgF8NVgTzh8fhid+FJIdsDq/KCNwKVY0TSrFVyjKhOZd?=
 =?us-ascii?Q?tYjNicx/SsB2b/Zmq60l1DRTBL/C5I8p7KaAMY4Nmpp4rGjd9QD0XWIezJ1y?=
 =?us-ascii?Q?6rRB1Q6kYG5vkAulIoT4xUccxejgd7Dazb0DEBzNfZ6Eov0nCFXUeOclfKL5?=
 =?us-ascii?Q?TMwNPal8tbN5nnvYh9av5BlWpiA7SK+YA5X7wpQh2Pg=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ad947b-ad23-4c8f-8957-08d8ab306dfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2020 12:59:36.3390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nmsBCEYYATUH34U7QaF53bIb1nRbrtNBt1DYMgPhkQXxccuUAdZOSXCrZDeqS4JmWJlgHIMpxUKWEpYc0wdhmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_075943_480455_50FA0C9F 
X-CRM114-Status: GOOD (  13.00  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "jiajie.hao@mediatek.com" <jiajie.hao@mediatek.com>,
 "alice.chao@mediatek.com" <alice.chao@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

 
> >
> > On 2020-12-23 12:19, Stanley Chu wrote:
> > > Hi Can,
> > >
> > > On Tue, 2020-12-22 at 19:34 +0800, Can Guo wrote:
> > >> On 2020-12-22 15:29, Stanley Chu wrote:
> > >> > Flush during hibern8 is sufficient on MediaTek platforms, thus
> > >> > enable UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL to skip
> > enabling
> > >> > fWriteBoosterBufferFlush during WriteBooster initialization.
> > >> >
> > >> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
