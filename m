Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2F7C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 11:55:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E179206B6
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 11:55:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kYdKWTLc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="oMhko7lg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E179206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=analog.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSH4jhR7xNuqIvBb77Tsy0tA4HcjB9TgN6O5veR8WCc=; b=kYdKWTLcciPkwD
	5HOaGRBIQJ9Y1JyzsN5ypCf1dxZAdW+7LehzNkPbP5ZqSjWaGUnxwt8G/6ZmFkRwOBDGLW5MnQ1gK
	cRPRPBaw39iOQc6sD6YU11F4Dv/JS8xS8aVTdZRkGAKwRileZ/NTIQ9S1STOjkkpQGMluQsRAaPco
	0nXcj9qDqIcM95eTmAfJoU4IUaAl/MmxgxqM6eXKeCxF+6oPgFya04hhu2xRGv4ULzPbP8vtZKEdC
	vpMbxeYMZv51OxCOuEjXHmz4hweDdXnBOAhuILIY5UCpu/4M6wfAhhsO4sr7IZqz9Ep0oLrhkxh1W
	Fsvc0HG+3CRocnPvTWsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jedbT-0007BM-RQ; Fri, 29 May 2020 11:55:11 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jedbO-0005nV-Cd; Fri, 29 May 2020 11:55:08 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04TAxrAT026418; Fri, 29 May 2020 07:08:42 -0400
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2053.outbound.protection.outlook.com [104.47.38.53])
 by mx0a-00128a01.pphosted.com with ESMTP id 316wp8brjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 07:08:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHk+n904bo3KoBm7gE5qhev6sa4ZhebXu6kSU5l/aa/PNLFvAOeGmreY+JwpA0qYIPS2VScCxB3dop6P+jEkENcAJM9V/ePVhQK/Z5hbfqw2UMAfOVRPiwUUQziuYhAX+flyvOn4bS9i8QNoV+eNdAlMb/22NNK03ScTY/vMbMNwz95m6KgczUehdroBlMyF8e2ETnvUiTdVS1632fHtsugxtrgm2xTGxkSLct/BBhxytJ42ZwNxqCUt2Bgr0eez3cicD9qWKYqfihgtGV964GmR/ZhiPlMDYvJlTjmUlar2gvZo/NxGk9Ibrmt6stlhFG+RtC5E8RRvWE9IjurHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BweM9eA1kr78dAafyPIy5UypVpgM5fs7nVfSvD3PuY=;
 b=JheeoFz5DnPPhkoddIqvSUQVQe0eQAnWtDSmvPfjS7fgdD23FBEzSc+ko1OahEH7pvW25xGYovVniCeCSWlJqKRGhdKZz3ZX6Z4bUki+V4d3SCczmlXEWW0IORnqjajeDysw2WuRnfPVmT3QXXWegBH9f53EC/IgVAxOUe+ODOXkHy5fWnSuQOGYJt/BaFqLeUsmb2Wv54dOECSWxcGzzDwcXpHzBLUDz1QQGunE2+T1uYvjvYuqgn1GgjzxCHUVyiEQmyQf5gZUHw3jpKZz7MGyjnzP7XWAKKMDHxsqI38cmw4ZbwXElBSbVzPmqNq7rCZxYJOEwVC3NlHecQuqsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BweM9eA1kr78dAafyPIy5UypVpgM5fs7nVfSvD3PuY=;
 b=oMhko7lgwTTwwLeXMm+E0ttRv00/adq0Mf0aSy1TzgjLZfN8whssGUgRnnWppVmpGliK+/31lK99lz2oUwnhjY5UWp1FVSTxWHd0/Dhw2AItOTCQaPKZQ7gc11I7QjIadwmcGMou9rwwPpCujZ+Yr1JOLs82At+gUjosUOB8yXM=
Received: from BYAPR03MB4407.namprd03.prod.outlook.com (2603:10b6:a03:c5::24)
 by BYAPR03MB4582.namprd03.prod.outlook.com (2603:10b6:a03:c5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Fri, 29 May
 2020 11:08:39 +0000
Received: from BYAPR03MB4407.namprd03.prod.outlook.com
 ([fe80::18cb:6059:b74f:73a0]) by BYAPR03MB4407.namprd03.prod.outlook.com
 ([fe80::18cb:6059:b74f:73a0%7]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 11:08:39 +0000
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: "johan@kernel.org" <johan@kernel.org>
Subject: Re: [PATCH 4/5] iio: light: lm3533-als: remove explicit parent
 assignment
Thread-Topic: [PATCH 4/5] iio: light: lm3533-als: remove explicit parent
 assignment
Thread-Index: AQHWMBQTKJFuUy7W6E2X8purierYqqi+5C4AgAAOtAA=
Date: Fri, 29 May 2020 11:08:38 +0000
Message-ID: <05500c815f4881a6aa86c809c5ac53e8af3f3e91.camel@analog.com>
References: <20200522082208.383631-1-alexandru.ardelean@analog.com>
 <20200522082208.383631-4-alexandru.ardelean@analog.com>
 <20200529101608.GC19480@localhost>
In-Reply-To: <20200529101608.GC19480@localhost>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=analog.com;
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e6543637-aa9e-4673-dbf6-08d803c0a3f1
x-ms-traffictypediagnostic: BYAPR03MB4582:
x-microsoft-antispam-prvs: <BYAPR03MB45829E414C05156BB5960DCFF98F0@BYAPR03MB4582.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 04180B6720
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pvy3gsIQUEU12Ty6pkWokVypxBGcELJ34XKnn9quFT0hVs+UFf+JaTdWXbHEQb28X4FtEOQlDw6/CX0LvFFF/znh6Osh367zhQJWNjGhOsfTUGKC2mmrceD1NX1yP++0oTKFThJFKwaLLpO/NN/MBbjQ4ZUE1frBzKNvjNSzaHL//sXmzDYEFHb9jqRxEsqAjNs6gJnGNN2xWXRSnpPMVwSr2+020nKkGDUAGgSgqXu5wRnB+k0dRF9DWd4sIK65Aq8EuAsU3p1T+qPuO4I69T5CTkHVmPaqakNy9bO44aqnZy/IT0XwsWVtzF0PHHHge4ylgmqi3FwYo1XAiCgq7A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4407.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(396003)(136003)(366004)(39860400002)(376002)(91956017)(66556008)(54906003)(4326008)(316002)(76116006)(66446008)(6506007)(64756008)(8936002)(6916009)(2616005)(83380400001)(8676002)(6512007)(7366002)(186003)(66946007)(66476007)(478600001)(26005)(86362001)(71200400001)(6486002)(36756003)(5660300002)(7406005)(7416002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: nDFaIjJOTh/KO2gQZICr1bGxEqH/m4+iduILwhoFJ86cF2vzlXtribqRbYIC70dpldg9ZHq/pWc6LNPs3yqQD05k6g31M9H2m45ZorRMpMGq+aIPHqx1kgvDMNXrZoNK7FRT1NBzDXbp+wt5EcgeS+Pf88NNRVEuY6d7Q0H+kJq4XpuGLVx3NDhjcW+bMIfzbbVHLabwnq0IZy9tZNy++mv3ZAVoLqbds8mYLgfw+f5EW6XlijisUKF6sMZB965+fiNDGc4fI4PbUpuxgby/qsWNBv6IuVlg+gXYJ/lSlBmdv4mJdoM1+Z8U4efm5u7IbNILO/RB+fdfDB+fYe0ubQu5hw4VPwEGqxspzdJLX5k2P2tLsa+SJXArk2hmShBucRosHg7il25VNde5uU0NSIlsg6a2Q3ETUePISTUD2fWba7s9YSwthor8698bWoZLhw+ruS7tOo43kY7ul6thmHFOnjBh42pnfz7lzGQIgq4=
x-ms-exchange-transport-forked: True
Content-ID: <C6D081712A43FD4B9CD4A682AA944F89@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6543637-aa9e-4673-dbf6-08d803c0a3f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2020 11:08:38.7175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SW+hVDmgLYi3/thy6Uk0Na0lBfw/jLF/wpJ1LCkcRXYxWJ/unGYyJQb7EVTXm6HS/hs4SLD06hC7otcCx85V7QZDg0MSDuqwfVvKhmXSgbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4582
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-29_06:2020-05-28,
 2020-05-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 clxscore=1011
 malwarescore=0 mlxscore=0 lowpriorityscore=0 cotscore=-2147483648
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005290088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_045506_526827_735235F1 
X-CRM114-Status: GOOD (  19.26  )
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
Cc: "milo.kim@ti.com" <milo.kim@ti.com>,
 "tomislav.denis@avl.com" <tomislav.denis@avl.com>,
 "dan@dlrobertson.com" <dan@dlrobertson.com>,
 "heiko@sntech.de" <heiko@sntech.de>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "paul@crapouillou.net" <paul@crapouillou.net>,
 "lorenzo.bianconi83@gmail.com" <lorenzo.bianconi83@gmail.com>,
 "fabrice.gasnier@st.com" <fabrice.gasnier@st.com>,
 "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>,
 "tduszyns@gmail.com" <tduszyns@gmail.com>, "krzk@kernel.org" <krzk@kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "wens@csie.org" <wens@csie.org>, "kgene@kernel.org" <kgene@kernel.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "agross@kernel.org" <agross@kernel.org>,
 "slemieux.tyco@gmail.com" <slemieux.tyco@gmail.com>,
 "orsonzhai@gmail.com" <orsonzhai@gmail.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jikos@kernel.org" <jikos@kernel.org>,
 "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "vz@mleia.com" <vz@mleia.com>,
 "rmfrfs@gmail.com" <rmfrfs@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "ak@it-klinger.de" <ak@it-klinger.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "coproscefalo@gmail.com" <coproscefalo@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "syednwaris@gmail.com" <syednwaris@gmail.com>,
 "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "songqiang1304521@gmail.com" <songqiang1304521@gmail.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "baolin.wang7@gmail.com" <baolin.wang7@gmail.com>,
 "ktsai@capellamicro.com" <ktsai@capellamicro.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "peda@axentia.se" <peda@axentia.se>, "jic23@kernel.org" <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-05-29 at 12:16 +0200, Johan Hovold wrote:
> [External]
> 
> On Fri, May 22, 2020 at 11:22:07AM +0300, Alexandru Ardelean wrote:
> > This assignment is the more peculiar of the bunch as it assigns the parent
> > of the platform-device's device (i.e. pdev->dev.parent) as the IIO device's
> > parent.
> > 
> > It's unclear whether this is intentional or not.
> > Hence it is in it's own patch.
> 
> Yeah, we have a few mfd drivers whose child drivers registers their
> class devices directly under the parent mfd device rather than the
> corresponding child platform device.
> 
> Since it's done consistently I think you need to update them all if you
> really want to change this. 
> 
> And it may not be worth it since at least in theory someone could now be
> relying on this topology.

Thanks for the feedback.
I guess, it could make sense to do here:
      devm_iio_device_alloc(pdev->dev.parent, ...)

Currently it's:
      devm_iio_device_alloc(&pdev->dev, ...)

That would make it slightly more consistent.
i.e. the life-time of the object would be attached to the parent of the platform
device, versus the platform-device.

Currently, as it is, the allocation [of the IIO device] is tied the platform-
device, and the IIO registration to the parent (of the platform-device).
I'm not super-familiar with the internals here, but does this sound a bit wrong?
Is there a chance where the IIO device could be de-allocated, while registered?


> 
> > Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> > ---
> >  drivers/iio/light/lm3533-als.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
> > index bc196c212881..0f380ec8d30c 100644
> > --- a/drivers/iio/light/lm3533-als.c
> > +++ b/drivers/iio/light/lm3533-als.c
> > @@ -852,7 +852,6 @@ static int lm3533_als_probe(struct platform_device
> > *pdev)
> >  	indio_dev->channels = lm3533_als_channels;
> >  	indio_dev->num_channels = ARRAY_SIZE(lm3533_als_channels);
> >  	indio_dev->name = dev_name(&pdev->dev);
> > -	indio_dev->dev.parent = pdev->dev.parent;
> >  	indio_dev->modes = INDIO_DIRECT_MODE;
> >  
> >  	als = iio_priv(indio_dev);
> 
> Johan
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
