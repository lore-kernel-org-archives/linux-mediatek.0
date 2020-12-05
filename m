Return-Path: <SRS0=IZYC=FJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABC4C4361A
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 08:05:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3129722D72
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 08:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3129722D72
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ASJaYGFyIX+U20TpyaC9DFLhYSyX+Ab4fVZTs28JJL4=; b=jb8gxy6msbHrmVPgJldPiY2Vp
	w7sPi8KEe0oiiXi/Eh2s3z3WEzZ5MDxh85adHDAhj49jnFN+TbAPNqGEFzlnpZkvMnw1e9NnAyHLv
	kBi/I6ogBIwjZ04CPwF+7lKWzcU8lHNivXRNTsJ8VDHG9ZZ3iZFelCUGyOy2gb1a3p2YjA2H6n2/9
	ex/a3aVikbeg5yAo+0d5mpVp62DO/+1xMMeZ8yS2wHQRXrWrmdsnWDgDO8jJ6L+n3nNH0po1QQaqd
	KtspdRyMRDGPMeEpQbkGhjRP1Zbkz85Lk1EySDhgd4iUgKTRhj/OCZTgFwudnnQFuMC414OsXyflP
	eD8acpHQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klSZc-0005VW-Fv; Sat, 05 Dec 2020 08:05:44 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klSZa-0005Ue-AF; Sat, 05 Dec 2020 08:05:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607155542; x=1638691542;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8s+Tz4Oo/QiPhBUJRalkFRCfP2x6jEr3XwWqQZUtBdo=;
 b=bx40ytxiHIiMqnjNTz5dw0mCfyICFIufmBjZhjIoOQZCRu2sNc0cVHpg
 kGAgOh7GZX7TnVUcwZqkQUsrd3H+3BrkDsKmb3gIPFchbWtG29f9Lcwo8
 FGD7OPi8bLE2dvPnwWamvvdR0chWlP4Xd3wEQ03MrHvWmJfOGrotdiiOY
 K0WcROOq8oJlVNrF7fyCRMSIJUys+a77dAl+cZCOCu8PMKhrzNYn2xmHn
 a92uvnfb6Djqc1b98HH2D5j7dPuxkIO31wnxyE1ONPb+QY8JYShT6tKa3
 1KENmlDRQXLr1le5/bcvwXzdXCTD5rr27pqT+JhQOkTYhyEKaHilUbzxL g==;
IronPort-SDR: Mb5qJjUZms9pADqzV4gFMp/CyuU7xl7oyHLDPf5EC//IRTY3TTLe6VFqGciwj/VOa+rTJwPyC5
 A9BBzNEOhpsR6d96floQ9jGKFTgPKajpB+m6DbarvBrGi43Y7pDFwDonuIpNo1wF5F5f8FdC+C
 ze+9fbXF/vTFBcZVHXHtzkeIOb3dBBO/SNqM/a6A3GjOZ13S2+oicE4Ld+JyDzANuDBEnaCLbm
 s/UJcmAVLqUkafR2/skLfx8xuSdllkrPBFGDtbVVRLQ4dSG1VoVMs+gTnffCsPAziBrHwcxRZM
 Dgc=
X-IronPort-AV: E=Sophos;i="5.78,395,1599494400"; d="scan'208";a="158955626"
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hgst.iphmx.com with ESMTP; 05 Dec 2020 16:05:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nowHzzEfYQM2Kl3+qmmzzbmHc2OhPdluvnTPB/ofDCEcklnPzoUHx/ICXldqoLABKHHWzGJ3dA61/X3k8Q9lK/EOrQyYrLuY/3l6Naa4j5+171sL1F7SolSKU6UkhwR5CaynNi1pPlNi/wmds8Fanvw/IHZhGyhbobQX6gF8qP3524VX9t70eDihUptcP1p+CO0ItPmo8q5WUS0WDRpkUTT9sRSJUT1Ro2+mRc7b1MlrS2lpgmT7VxlsEPCHUR4SBwoKK/FIXPDzPAEIThnmzRHMHzckPra5W+4yvr8RXLl62q2i0QPRRSfE02ghnQoyIF/5L5FXqxB+0JYfLXu+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6cyk+jrXFrtQeW04bPT4N4SEGE2SRK+lPZXJhswSTw=;
 b=fjp4wDEVJ/Vyamc1j+loW87FTv5XkFyE6/FccBsgJVURvU9IxSCQJDh84nEmkpTluPg0+m4ASgV1LfpRebxbHT5/8bGaRUK6xmr3NVF1jvFBiQi+zUztBqVTUHCTZEvWduCtfFPfXwqGAwj1ME/z1UqEXXR84CKsbvgzUTb2jBrad9XkaKTFt0OCXQp95TvngD7AIO2XrJZwF2Bn2/SeIKs+PCiEQbdqbuATNOyfTu6PQH/kL6CNdAYjOd8weF+bqbiXBZpx3VYWdL2T3R8/3VU387GCKb6PHD/W9pxs4KDTzT74wf3ecHHJRJ3axFY0oqIy5YVcxfTufzFbN0bhQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6cyk+jrXFrtQeW04bPT4N4SEGE2SRK+lPZXJhswSTw=;
 b=wnvVhOZAZGTebwAryyPdp5PFivC9bPNYQr2EorjO9X6tQNhUv9EtX8DxRiuc2xJPSiEp+eJ3tEB6oMhozX0FqZa/+BaRezCOWJhwuKY05wcFwP9LY4W4oB0Hh+bSypya7r4TkzQPmmAx+zlzJhV376KltmHzAv+i+3ygSZF/YWI=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM6PR04MB6667.namprd04.prod.outlook.com (2603:10b6:5:247::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.18; Sat, 5 Dec 2020 08:05:39 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::a564:c676:b866:34f6]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::a564:c676:b866:34f6%8]) with mapi id 15.20.3632.021; Sat, 5 Dec 2020
 08:05:39 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Stanley Chu <stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "alim.akhtar@samsung.com"
 <alim.akhtar@samsung.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Subject: RE: [PATCH v4 0/8] Refine error history and introduce event_notify vop
Thread-Topic: [PATCH v4 0/8] Refine error history and introduce event_notify
 vop
Thread-Index: AQHWyq/pOn7SLSBA3UysiLzNTb9IZ6noIz6ggAABz2A=
Date: Sat, 5 Dec 2020 08:05:38 +0000
Message-ID: <DM6PR04MB657567F698B1EEA7D848FE45FCF00@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20201205023938.13848-1-stanley.chu@mediatek.com>
 <DM6PR04MB65758A2779FD814F52E137BAFCF00@DM6PR04MB6575.namprd04.prod.outlook.com>
In-Reply-To: <DM6PR04MB65758A2779FD814F52E137BAFCF00@DM6PR04MB6575.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [77.138.4.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6e8e45ca-7a11-4329-b054-08d898f48dc5
x-ms-traffictypediagnostic: DM6PR04MB6667:
x-microsoft-antispam-prvs: <DM6PR04MB66671AED4D094F2AF6E387AAFCF00@DM6PR04MB6667.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tbkBwM7hzSvpR6fsJD+mD+W6l4aZD2iqhixtoUf/qtbSxxWat9jpH5Gc47H/RXJwu26ru6woi8/qImF59J+ub1wUfCpNKmRkAlbzcu8dE6PXinvJy5fat5BCO0hmH9NVU/RucNSYBZ5uKdhbjLuqRYjaJFrZ4Cx3iIQ24Mc07eA/m0n49B0GW7ppXa0O0lzaqb+cKG4EZBhlA+72vE1bYKGbAA5ymH3WiIrt2rbNz8tbwrKMdSJx8BZ/YxnzPWay4BS4eviP3Jdr2d0AHZUx+E6GjuNKCXLBVavNxHZDYxMPtZqL9UsU2NDzb4S5yY6ywfp3DIvqTX8Y/LImP7yg0Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6575.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(2906002)(7696005)(86362001)(6506007)(76116006)(71200400001)(2940100002)(33656002)(83380400001)(9686003)(8676002)(7416002)(54906003)(186003)(26005)(52536014)(4326008)(66556008)(55016002)(66446008)(66476007)(316002)(8936002)(5660300002)(478600001)(110136005)(64756008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?jBqd4L/IyMl3q+qfqpiG4XJJAX5SBXr6uMnc+G5cnjVyaLbafZWlf36/8Sv+?=
 =?us-ascii?Q?ayCI+SgTWWVuw/dRHNoM+r6v3uFkIERd60sddLVMsRqodUFJ/NYLyh4Jboqn?=
 =?us-ascii?Q?EoQpg1arS0/qbHUgbkJw1oTzV7r0u0fPWLsXnl5OInzl/iae8ZfAoTPsWBRf?=
 =?us-ascii?Q?NPnJmoJQpLaZGZMOys1+Ifb9gRW34uxXCCQaL5ccKo6HdbRvc/ja0fz6tcuY?=
 =?us-ascii?Q?vFN1tLRKx3tRMO6+BW4n6WzLYz77YmdLvz+OXkpQ4XSIWqfjVAJAcX40goEF?=
 =?us-ascii?Q?4/do+wFOXV/jX04jtzjH1NBeeKf2TFrwUI1WqpZMBl+paBJDhKWn4z3SdC9u?=
 =?us-ascii?Q?AlZJU1wgCBMDlivA/lAPshPPesfNYsK38zUAXI736ww1U0fNpSlEZ/LbXQkD?=
 =?us-ascii?Q?Mm9hElqSRZrRXvemYrFen7y0YlMHEGEl51c/1XvRHToL3hM7FBxJWiCTIe8Y?=
 =?us-ascii?Q?St4NCSBmy1O66Vor1t6SF1HxrECtu/M9xtsFxJjmIa9Aabr3ZQZ3EPEgGAiX?=
 =?us-ascii?Q?1PiHPzWWThOT/cG6khShoy43nAzQKS5O+YRCyf59+jegBx0JKCUW7OQXM/EW?=
 =?us-ascii?Q?6GGTWyNsYoQPzNOQ0QXovigzLf7k1+0k3RunC1RlWzOU8c6Fvs4LQTS2xPyk?=
 =?us-ascii?Q?OkCxVWaqmwvRge9QXFb5lqayHmiQ1KAtojjXendcP4FEUg2l5O6BHFMYPC3L?=
 =?us-ascii?Q?y5n3jXrJ5YU99km+wpZmo064WQV2QnOR43/bU279i0CemTUq/SkLYJadrZU1?=
 =?us-ascii?Q?4q3lUUGfUz1zO/ptMGjUaiiXfFkW4DdF3nRNHJvd1IDYd47RKOrzlsotLTxY?=
 =?us-ascii?Q?Gm5C0Gyv3//kFMJloXMQpKFMLbu43G5rxLxKYU7gooVyHrrNg5jD9fGdECXw?=
 =?us-ascii?Q?BYxU+4tqBNefNeV87fQ9xwm5DYZsQcb/wggywJvy5iHzxPcaOFu64sGBaQ7y?=
 =?us-ascii?Q?EMsfqhbc2pGJsqEPlbkqhKYDrrWbfnLYEvvdct6CGT8=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8e45ca-7a11-4329-b054-08d898f48dc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2020 08:05:38.9765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lD+/IxlCjzQgVjPcEfk55ybSN1JKdUqj7O97TIQYj0n4Vr/2xsPN+XnnVCmUBw8D+4aD6ZRcbMmK+2A2A6FOfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_030542_510194_95267D6D 
X-CRM114-Status: GOOD (  18.97  )
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
Cc: "alice.chao@mediatek.com" <alice.chao@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "huadian.liu@mediatek.com" <huadian.liu@mediatek.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jiajie.hao@mediatek.com" <jiajie.hao@mediatek.com>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> 
> Hi Stanley,
> Will you split this series to 3 separate series:
> Phy initialization cleanup, Error history, and event notification?
> As those 3 aren't really connected?
> 
> Please maintain Can's reviewed-by tag for the error history patches,
> And add mine for the phy initialization, so Martin can pick those.
And for the new event notification vop of course.  Sorry.

Thanks,
Avri

> 
> Thanks,
> Avri
> 
> >
> > Hi,
> > This series refines error history functions, do vop cleanups and introduce a
> > new event_notify vop to allow vendor to get notification of important
> > events.
> >
> > Changes since v3:
> >   - Fix build warning in patch [8/8]
> >
> > Changes since v2:
> >   - Add patches for vop cleanups
> >   - Introduce phy_initialization helper and replace direct invoking in ufs-cdns
> > and ufs-dwc by the helper
> >   - Introduce event_notify vop implemntation in ufs-mediatek
> >
> > Changes since v1:
> >   - Change notify_event() to event_notify() to follow vop naming covention
> >
> > Stanley Chu (8):
> >   scsi: ufs: Remove unused setup_regulators variant function
> >   scsi: ufs: Introduce phy_initialization helper
> >   scsi: ufs-cdns: Use phy_initialization helper
> >   scsi: ufs-dwc: Use phy_initialization helper
> >   scsi: ufs: Add error history for abort event in UFS Device W-LUN
> >   scsi: ufs: Refine error history functions
> >   scsi: ufs: Introduce event_notify variant function
> >   scsi: ufs-mediatek: Introduce event_notify implementation
> >
> >  drivers/scsi/ufs/cdns-pltfrm.c        |   3 +-
> >  drivers/scsi/ufs/ufs-mediatek-trace.h |  37 ++++++++
> >  drivers/scsi/ufs/ufs-mediatek.c       |  12 +++
> >  drivers/scsi/ufs/ufshcd-dwc.c         |  11 +--
> >  drivers/scsi/ufs/ufshcd.c             | 132 ++++++++++++++------------
> >  drivers/scsi/ufs/ufshcd.h             | 100 +++++++++----------
> >  6 files changed, 175 insertions(+), 120 deletions(-)
> >  create mode 100644 drivers/scsi/ufs/ufs-mediatek-trace.h
> >
> > --
> > 2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
