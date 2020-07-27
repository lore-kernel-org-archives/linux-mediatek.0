Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C86C433E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 10:56:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DC462070B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 10:56:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AELBFI+s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="LZzpOued";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="cSgrDMs5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DC462070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yem21bS2McrnXhnWqb5y2jL7+BkSkutwYhAdn8Zfe94=; b=AELBFI+shllxxqqcrEf0wQW6y
	eF60sJAC2XsHUNrT6crKQ/ifTTu6m290wrSR/BlKI6RJTzKQn+kveCabR21HG8dMxBNnRFtJEHjp6
	Ay7VYNyc0nX9vOUXvg0QqxGwxoSf/XoEuaz88ayHNy4ZSlbyUzKa+4UTrD1j4jpATHz48q+Zlvafc
	cJBizszisjCrbuEiOextiSwDoy9Pom3zeC4Ngwlti+baehWrjSk7xcweYqJvHvLX4fIhbHTIHHn0v
	2jh0jFA3dhgB+0XoIZAS2ok3XhomN7Pk3Sn500HszfD+60amG9hwvyY7Z5pQOUU+y1YBMOvbDF2AR
	7IVGoYn1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k00nu-0007RO-N4; Mon, 27 Jul 2020 10:56:22 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k00ns-0007Pq-AW; Mon, 27 Jul 2020 10:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595847381; x=1627383381;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tPRo4z/ZuyEsvxdR0sYnbJ5SCjdsClRPwyVipi3nDjs=;
 b=LZzpOuedBD8gNICpl+3EmXDLrVV/YXYMEj/i73LXrQ0r0gTeagCDzLPW
 GHOB1XYsuLEM/U/DpKO586vnKy2ComBkya9/XfKLQ5qgaIur0NvJLrE+D
 uLPizm+XhenrpRzE/NAlaT7anBn1sdafY8IhZ2xMZHahDGLhflLP4UFra
 1LICmxw/ZUsCWC8MVACUDQeSQNuyVHnM4Vp7BByn7Q/EQz95vil+1om2r
 +ZOZgeH6cLRtwnvn4bQR/0ES6ayIY0K7/q7VIETMEZIGmCMaICs1/DIoG
 Q6hbQU1E8pNQbYluEjGRcyITYtINeggfKBrPtHuVl/+YZ5Sifwl47M9XW Q==;
IronPort-SDR: nqi+S5mO2OXnuh9o0WVukbH6nd1c3NupcZ/x7t2v+VKnh7xK2in0x5fk7+BaalNWg0hOxajro7
 Iou7lAlHWt366Dt3iTiMF90/jw2DA2YfnCoknviGraOZHmDMFHnhdPqt3bgulti2AtB4LtS0u4
 UgpJNWF3JfPGUgyL/0GGsmVz2ZQTyFWsPEFgZ2cBPK7mVK0duFCTOVnDsop+wCCuTz98eOAqKO
 JdmhwFldsz520zQxkeAzf/sI7aZtlfR++I3D2Oka19rnx+DXDjf4+fJNXvfAOTZBa1XQO4Sw7y
 Oi0=
X-IronPort-AV: E=Sophos;i="5.75,402,1589212800"; d="scan'208";a="144718978"
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jul 2020 18:56:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E65iwbsTVlpnJ018vvj+Nam9CGFrcEfKCCzrZ61yroJDez0MMUjX8uCHjZ50riGhRCrITzBo3xZuVj/8CfZ5XR5JMCoAxT+XtdRtY6tAgfIcYNLw6MNvHKDpsXDWktrdDCylXAfe9ScYsRrvJsMk9YXhjoye268NUyRDvkffXPaDWhIZ5os5gYC+X7YKNoYj9qk38hIInNmE328d5D+5H0723b6bmkKTmQCP+uxM8sk9osMHcxwwPD+iMC3bO0EER29V2qX2+sa6JOrAgr8TbhbrIVIMlhOPPYxYR/FKHohd5te8sYo2FG6RVxBYVKR4xo+pP2rP8jXF8x7J59dHyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPRo4z/ZuyEsvxdR0sYnbJ5SCjdsClRPwyVipi3nDjs=;
 b=ZZWkk2iR/ZV5KaHA3moHXUwz/su5cYtyiOZAwBt1M/1c9pWrLQUaGuDG3e/0Cyd2zroU5aEVLsp4Ajw4Ej0m8POjthfTiaqYFyIGvu/s6M0FI9/cqv2LewdtGXbHVE2/jRQn7QnA+DCE/Md/uEZnCdBVGzOg2CjC0hiGznkZipE7P0emTXQ136N1aK+ba8M4nJvJIqOOPqf1sM7/3xQRfWgzBDcezohoup3MEyyTHes6pdASTmx0Fkv3lLxrJVVZ4frMtIAtsci2EwlHx9gSuaY3wI8Q05jjAp/cpGMEpWncgVHiWzSDRZK1NCp4oof/JwniZPeIHLXtK4t06JMWfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPRo4z/ZuyEsvxdR0sYnbJ5SCjdsClRPwyVipi3nDjs=;
 b=cSgrDMs5X5UTdowmSaGqzvrREe4vaUhY6PlgAFyPX454F4FmHqFm5mv1+4/BKl9MnPHOBsj+s4wWZ7XCf+Nr8JhKmOdA/G1C7JANJmcaVvIsSB1JY3oMJN3mUfQQjbemtGDc/cIjNrjDNoTqcwBwdJ4dsOXJ9YSwlU53tAiyzGQ=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4078.namprd04.prod.outlook.com (2603:10b6:805:49::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Mon, 27 Jul
 2020 10:56:12 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::1c80:dad0:4a83:2ef2]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::1c80:dad0:4a83:2ef2%4]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 10:56:12 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Stanley Chu <stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "alim.akhtar@samsung.com"
 <alim.akhtar@samsung.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>
Subject: RE: [PATCH v1] scsi: ufs-mediatek: Prevent LPM operation on
 undeclared VCC
Thread-Topic: [PATCH v1] scsi: ufs-mediatek: Prevent LPM operation on
 undeclared VCC
Thread-Index: AQHWYcULNd4pKFo2jUeVeHFZyc3XwakbRVmw
Date: Mon, 27 Jul 2020 10:56:12 +0000
Message-ID: <SN6PR04MB4640BB7521A48396F6696157FC720@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200724141627.20094-1-stanley.chu@mediatek.com>
In-Reply-To: <20200724141627.20094-1-stanley.chu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d7ee9da4-2120-4b89-b6cd-08d8321bad1f
x-ms-traffictypediagnostic: SN6PR04MB4078:
x-microsoft-antispam-prvs: <SN6PR04MB4078A9352518706DAC77AC17FC720@SN6PR04MB4078.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1GO5UBzv91qORIV3+cn3r4wr8VVapqf2PU97VlcQPQpjEHrLqAIvcFbkgsnbVl963mb+m5jSOOO4XTPQGSW5v4Zvp+K9ZYpwurUw88J0qdFIUZ4QewGTRfx4+GARNJ2z9RKoG/k3SBDzxg7chtv3e6RovRpJz6odVfhj8F+08eIawLCznkxwsGtOdts5fEClU7hWNuXhqoobo4Ib8wDZDd8mp/wz2iPNlKRpI2I2CehzL77LySxIKdhVq9pilLc6fhSQu+obT61ZNTEUG3WKOAbAA9X8KYkwyIY8sHMsOG0YQlzk9czIlUL7qSi06rzchOm0Wa44CoHiJGyBFiwvSg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR04MB4640.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(86362001)(54906003)(7416002)(83380400001)(33656002)(186003)(9686003)(8936002)(110136005)(52536014)(76116006)(26005)(5660300002)(7696005)(55016002)(6506007)(316002)(478600001)(8676002)(2906002)(66446008)(66476007)(64756008)(66556008)(4744005)(71200400001)(66946007)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 7bIop6eSHfFrWfd1kDuESLGd3uf1oz16ICXd65v+u0BU1ciIeh/ZjGs5lCYX4nlwAXbgNACEKHoIAhbR2eCFuAQLm11GAJoYE0D6ygAPPZHadTu7w0lvpL3meatA8h9MGzQSQRjxsg7w58NI99t2s62y9J67kqid50I3Yx2lDD0JkCquc+YN5iAdnI5NXbbk/7cAEv06zW7Y4IzJ7J49cb7SZyTDVI2OreSH9IHqRv4ZRNHR1YWW1FaSWMN5OYHGLLuZPNFBMoih8/b04DddkXGn27vCeNa99Od6cVJuwDR+kKitsOn6SkMTNz73agywOz3z5GcQgSb3jNk09Nopq6PZslbqVrjSML7dEmb0ZzRtuuJnAIwfpc6UNrZPbWSsB1+U/AV1pgQHNxaJso9pGyfUkkQfgDBu4dMKdZdBg3bXmdNP4PU5WyUzCXiNd5NbSwsKOlbxvY0uRzj4iOzwKD4ZKF/4W7F8Dhp6oGd/EH7QkTK4nvagBegP9lwaop8T
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4640.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ee9da4-2120-4b89-b6cd-08d8321bad1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 10:56:12.1288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ILQk2bRvRkhV+9mtiLZEN5BB10VPflPmv8OdZHyx6jLbQZLeVhf1lQA7u/NeocSQcFfjbHRxhrSjFL1RLPGZ0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_065620_494695_5A4F5EC8 
X-CRM114-Status: GOOD (  13.09  )
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
Cc: "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
> In some platforms, VCC regulator may not be declared in device tree
> to keep itself "always-on". In this case, hba->vreg_info.vcc is NULL
> and shall not be operated during any flow.
> 
> Prevent possible NULL hba->vreg_info.vcc access in LPM mode by checking
> if it is valid first.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
