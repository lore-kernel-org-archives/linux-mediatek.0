Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D1CC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 08:55:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 118ED2071A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 08:55:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NlqK8Uu0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="onHJSrrf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="j686fApg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 118ED2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dTbntFuNqF5/sbLszvb4b8Thh54cRQ2GBK8B/9mJWM4=; b=NlqK8Uu03yKLad0+2wcmPKyWx
	sLMFtqqsDS7BxdyVeq437uZ44ho4LAEFlNT1Xn0TWG5dypBwoZMv9k3bLUjl+/vqv6ectkF75auYJ
	AsM2er/a+G/+ETsiEvoAhjuQT+MU3dwSE75URWzIZD6shLVV6/UnAZhe6MXfu58qf7R4tHJaLLFOH
	j6L3jcgxRkmqmEpRyAmmzp7CmYoy06/PjwyVGh/owuWkQV545A+/MA/Ja+xxBsV5/b+UlZ2o/6do0
	9Xg0FGhDCK1skFAi2kDNbDBUGzp25eJJjklGtTZF+gzj9zOBtCPbzg+GfXx9zza8gVPYuMyjfWhCa
	faOm6lk3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZs6H-000761-16; Tue, 03 Nov 2020 08:55:33 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZs6B-00074f-42; Tue, 03 Nov 2020 08:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604393727; x=1635929727;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wHik0GBc1Sfdm4lcekXjkseXFDMrpMWUcWyWYjoaZBU=;
 b=onHJSrrfO/IFL7gsl+WJCueUFz6LRoLB2W8ATCYJfy6htxBI+hoEGIDf
 5A2BsapDZxIU/F59KT61ABucjjep/dzO5SsZf82TdlNnxmz6+1sbBy4VP
 QlXKoVaoVhYjjX9Gh39wJ3+qg/Ga8kFtvkb86QKipGbazQPj5di45gxU1
 seK4rPmNf29k6zw9rsda9hmTo4oxdkCJpqGp+i6Ek0L3gBfCs3dssy2N2
 vC9TO2lYYndkeSVTXL2ZDX0fXSQ2n1/FffTXYyF0cXse4J4hW6mbNVwRu
 2Bn/KzGpdVKvkaMP40gD1BdogVsM2GfW3M0N+AQth1ypOFzghYUkPT8fs Q==;
IronPort-SDR: nsCJw7cW0Rc11q92Txl70Fvg7z7obho71vWNDq5wPCgwgpAbgnShEznHkYCgQXfmbVfLiHG3OT
 axwyeIge5seleuJsB5dAiZGUbzIGHQlXvWIDcz5c6MTNTJY0rpPgVrOTL6mWUTUi7NKvk8y8D8
 E6DA0+RgrniHzulgtGsAtNYtwbyugJK+LhUWNLlrMKvuI+hKmh1lQ+THOtL2RlLln8t+P32san
 1bZB2adAqChaH8qXNjfDY+s261lY4kE3M1RPUsgR1DjpyT4htxKOr2p52Vwc+KdsDARHWkaabY
 9Qo=
X-IronPort-AV: E=Sophos;i="5.77,447,1596470400"; d="scan'208";a="151704976"
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hgst.iphmx.com with ESMTP; 03 Nov 2020 16:55:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIDvuPmu2b4OUW0EoXEIyyR/UjLipO3T+d1zH/OwfdQb4TrbnKhlcIEqqqI7mOCBtUv5IcwY8aLhV//j8qUFB3O++g8rUCvqpgH21VXWQm6leTV5iFjCF/RlLSKZYYv7r8rmWbcJ+76J+n+z6Vk6nhYcDNXrwW64r42AGovpGVkVBJwVBiKupc+KQCExijHos29OQ21FcMjgV85+eQYxb8ubE3wY+col9dDYIX8rMGgEMTmbaX1jXaZCVzBF5I/0K1nlImpaV8dYEUHCz6qXvQ8QH0dXCaw668YHsTx7n1WzD9Jxo0sXGtChV0x838zSXyc5D60ock9X+hY9yUhBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHik0GBc1Sfdm4lcekXjkseXFDMrpMWUcWyWYjoaZBU=;
 b=c5LFplPn8D66sxVpauJsElh6Gg1nWpl4E8OkhjOyJTKianmgf5Z/yrwDPmS0z1xczP5+5uU8rmXHwG5QjFSo+3B6aS0ENJUwmVbwFbHHyPZnF657hQb4lhMZkdwQjIRM5Ab9ru9qUt6XDF0AFIUR0CJWqVLK0MGoW1ba+651B/t3tOy+j/RE7LSHPgrCSm+pF8mhs7L2/BJdlpxl3X7ThmmOqDpSwXVxBMr89i/RZ/ZImw9xtnd20R02VLGDkCVtjACkdCbiY5ZnD2Z1gjQmNtsNOcdnxtogdbKB475fS/EYYKKFplLUkSDPchLB5T6S6jdewdMUnjd5ToEfHENq4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHik0GBc1Sfdm4lcekXjkseXFDMrpMWUcWyWYjoaZBU=;
 b=j686fApgfp5XDJo+vDaFjxf/VB65yxVS+NlgmchDdpVih/uv5Z5sQmFNwOmr/D3CGPplaNHiGJBc49RuzUQ6YwyTbjACuTrxTt2pB2ji11YmV7gkTS6Ru9fFcyW9+e2QvfWgnxGHLHsCVeYMQ8Pz74malSnua4AslJQhy5EGsCY=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM5PR04MB0970.namprd04.prod.outlook.com (2603:10b6:4:47::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.27; Tue, 3 Nov 2020 08:55:21 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::5c59:8281:ef4a:3e2a]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::5c59:8281:ef4a:3e2a%9]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 08:55:21 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: RE: [PATCH v1 1/6] scsi: ufs-mediatek: Assign arguments with correct
 type
Thread-Topic: [PATCH v1 1/6] scsi: ufs-mediatek: Assign arguments with correct
 type
Thread-Index: AQHWrerABC0BriD7CEyLHrMbpYegqqm2BS3AgAAH+wCAABQfQA==
Date: Tue, 3 Nov 2020 08:55:20 +0000
Message-ID: <DM6PR04MB6575E34E36F90B72C4E89883FC110@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20201029115750.24391-1-stanley.chu@mediatek.com>
 <20201029115750.24391-2-stanley.chu@mediatek.com>
 <DM6PR04MB6575F51915ED4E904ED82EC1FC110@DM6PR04MB6575.namprd04.prod.outlook.com>
 <1604389184.13152.9.camel@mtkswgap22>
In-Reply-To: <1604389184.13152.9.camel@mtkswgap22>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 43eb1a6e-4411-4c24-74c0-08d87fd631ec
x-ms-traffictypediagnostic: DM5PR04MB0970:
x-microsoft-antispam-prvs: <DM5PR04MB09700F5EF09FD7E6EDABD510FC110@DM5PR04MB0970.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M3S2o/dhmvoSzFyTFFVRX9/jxV93vq9irYTgUt6/dX0DreBpjac6dgL+gW/QprVp96Nxi2RZwOtLKVqq9IR9G3ARdTkhF2SsOBZCXd334OCW8jK+aWwwAZEt7YyqkWsCgADybpV8uuZPnI+a0mFNexSG7EwYK0dilMHfIgyH5RAsu6s1arDtcqPJYSkWCd5Z3JCOaX51IBbubpxVKkgcmwsKxajwy73shd6/psMPNzPDWUVElmn4oakh5AUL0fo3Gi3velBY6YrjQ5C3q1kTXPajb+wZH7wBW2BKDmYcxqSVXMGK+OSnR2ND/LsY9FIwv59eXEa7rjOanpTu17nz5zYq2aasjCxLOhptydoNcoeRZWTeSkPrGBnzJ8a9nXsyDUCSDV4hwB2IdBy0+jBn8w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6575.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(186003)(71200400001)(8676002)(76116006)(26005)(966005)(6916009)(5660300002)(478600001)(64756008)(66476007)(6506007)(8936002)(66556008)(66946007)(66446008)(86362001)(4326008)(2906002)(83380400001)(9686003)(33656002)(55016002)(7696005)(52536014)(7416002)(54906003)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: l2jqz5zKndwBj3ez7JChEX/9MlalbVUol5u1CP3RK6Rk+C1oK6QAkyhEFCB8nBV8ISiFhwj7u/VgWhJFQ3sz/LB3sQFXSwIMLF+yPcbPlU7rtfnf712UDhVoN2JlIX25VWzJemti2K0rznjmVmn6Wks8+9x83h2Y6XuyplOSXmsENguSF0LSOOmjEGbMVPJ5aL1t8gcEWq7Pdnq+ZuCvpppSDu2rIu9dI929DRYaOrmZ/7c2Mk5p7TV33qGh+sokqAWP9AeJsHbsHrla4DybllnKSBuA1RXKCW1wAZIH/ViczJbFSkDH1NYyMROYGWj4etpI+C5LyHYLYnLfocMZR3r8F/KCwxNM/5Z/lethfSFQGIg5rQoJfC69qT+YX/cbQh0V5MXbhoT9sbe5i2pHJBnOsk1B8Nvn33k0r/4ACh3pfmddUng7wlE2lF1v4rNY6gP/5++0GYyU/gNsVhq7vJ+Pu867SQrkRly6WwuwDrVyUgsQA1ocHKWXGAYl5CsTzKTDHsogpGmvpN4ZpzWmeTIbAZVRj3IQ/noNUzy06He0bgRTTy1JDOjY7YoYfRnMcwlpG1LRucEHcdcZp+hpa20scMiDMiiQIipcBawYl4SiqecCnPGSC1LjOJxCVPip2umx7TENp27o8mDqhc6m1Q==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43eb1a6e-4411-4c24-74c0-08d87fd631ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2020 08:55:20.9328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rBw0xTkcGmtxtDxqAntcKvi+yWBNAAqUhDyBCQnc03KKVpIqcidndcnh2r7t8LNYgt3wO+8imFZ6XI3bYsT/Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0970
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_035527_535259_88649D5F 
X-CRM114-Status: GOOD (  28.21  )
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
 "jiajie.hao@mediatek.com" <jiajie.hao@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "alice.chao@mediatek.com" <alice.chao@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> 
> Hi Avri,
> 
> On Tue, 2020-11-03 at 07:12 +0000, Avri Altman wrote:
> > >
> > > In ufs_mtk_unipro_set_lpm(), use specific unsigned values
> > > as the argument to invoke ufshcd_dme_set().
> > >
> > > In the same time, change the name of ufs_mtk_unipro_set_pm()
> > > to ufs_mtk_unipro_set_lpm() to align the naming convention
> > > in MediaTek UFS driver.
> > >
> > > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > Looks like this patch is gilding the lily?
> 
> Thanks for the review.
> 
> Please see explanation below.
> 
> >
> > > ---
> > >  drivers/scsi/ufs/ufs-mediatek.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-
> mediatek.c
> > > index 8df73bc2f8cb..0196a89055b5 100644
> > > --- a/drivers/scsi/ufs/ufs-mediatek.c
> > > +++ b/drivers/scsi/ufs/ufs-mediatek.c
> > > @@ -639,14 +639,14 @@ static int ufs_mtk_pwr_change_notify(struct
> > > ufs_hba *hba,
> > >         return ret;
> > >  }
> > >
> > > -static int ufs_mtk_unipro_set_pm(struct ufs_hba *hba, bool lpm)
> > > +static int ufs_mtk_unipro_set_lpm(struct ufs_hba *hba, bool lpm)
> > >  {
> > >         int ret;
> > >         struct ufs_mtk_host *host = ufshcd_get_variant(hba);
> > >
> > >         ret = ufshcd_dme_set(hba,
> > >                              UIC_ARG_MIB_SEL(VS_UNIPROPOWERDOWNCONTROL,
> 0),
> > > -                            lpm);
> > > +                            lpm ? 1 : 0);
> > bool is implicitly converted to int anyway?
> 
> This change is the echo of your suggestion in
> https://patchwork.kernel.org/project/linux-
> scsi/patch/20200908064507.30774-4-stanley.chu@mediatek.com/
> 
> Actually I think your suggestion is constructive that the accepted
> values of VS_UNIPROPOWERDOWNCONTROL are better clearly defined so I
> use
> the casting here in this patch.
My previous comment that you refer to was against using bool as well,
But to leave it u32.
Anyway, I am not religious about it.

Looks fine,
Avri
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
