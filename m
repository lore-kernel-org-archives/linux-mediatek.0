Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95416C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 20:59:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C0B020716
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 20:59:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KNMDATwq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="K8An+YpM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="ZxOYay2L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C0B020716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GhcpBgT+Ej2ajj/i9AnyNaRFgkMv8JZO723zStfixas=; b=KNMDATwqDQz6wYsFs5VIWowqx
	jFhJvVeSDVgj7vMTkF0hlVs901CvuUYILsD/dR9LR+5q7UIPB9lBTOXFvAsABvNz5YmgLigTSyB5D
	xQNF/8a6jXrFr7TPE7QiPGkMMktlHsP+xhTf/5O7N7pkSY0VqFd5yHpzjHaGlR8iaQgV9wvm2/pns
	qABKRByR6XKRZwbwrlCx7eyJ5U96PgGOZFlAfV3tNMuOCej5d8+QuVRmdPezvMNTF+kkgWtjwfZyY
	p3KoXQnqm7hHhmJj7z3n3N48vjytPUJnxOcRcGMJ7zR624zXCLitHreSwMFytT+1Mx1ijOdIrJKL8
	3qPRrpGNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5Ess-0001WE-Si; Mon, 10 Aug 2020 20:59:06 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5Esq-0001VH-PI; Mon, 10 Aug 2020 20:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597093145; x=1628629145;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0FohuZoPBfwK4Oz+oXKhchVmpsOsG84ZbQ/rE1JNQvw=;
 b=K8An+YpMp+iAh61O/JUGvgzSY/8Iqb8bKeds2vBRBUBCSj56POoyg4ro
 35GbX1aMP8wRoiaZhJJ7uxzvtHXCV7vRZ/QfpMplaNp3F1vkEadKi3n9V
 zHsywuzw5364EyF1zhWTeRfS4y5wVNVd32rp3zXy6CSU5phsqtaJ8kRVM
 rytD0tuUKwlXLSPXVKzF+hANR44nJ4b5HmWWaXVClCJIAl32bogLNI/v4
 YNzDENChpk2rhTJCuMx/Hzpu5VIdRUnF+4O69vxyfcjkyvUg/RTx8SS0t
 Df9EfMkJQneJaVgBaQObw5p4FsPyt2/1YMileSHp2oery3xDVQp5QVYtk g==;
IronPort-SDR: xEQXW6nFhxVE10SdrZVyjXdxoLjPq5F33p22FgfNhJuFfhYuMAi//WPF8eyXDRqwIAUlGr7YLw
 px0Ez9HckPRKfW24y12qk1I58+dXVZAjAvQGfGdXY/0guOu0PnzEwzR0w7UCZsgS8nkHxTs2eU
 h7zEI+vpDxbNqbv3RITn/X1HQrlcEzjzvszWNJcaSK/qnMVeLUdokoPMWXUqD/EwFHkS4Vqkr4
 2KpsTin4Ef4r3Z4/VCr84rMyE7WysVbl7G8o6T43ajM4nav2pR7zQ5uWoWscInaDPnFiTWUGZf
 gBk=
X-IronPort-AV: E=Sophos;i="5.75,458,1589212800"; d="scan'208";a="144657934"
Received: from mail-bn3nam04lp2059.outbound.protection.outlook.com (HELO
 NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.59])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2020 04:58:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxtFvqYCOi57m1fnYZJ+0hQZ5YBct0lkAjFkC/MITcSNjZ08EVE2O6Sgl9VkEEis3ZYVZl99hXD6hsRWP5NFpEy1oLrnM+uORumBxuAU6rJF0C0OYnxZIwgMpNUDPCdW+bR6XyeXLs5cKKSyyJRMf14YAW3YL6tEkyRMJOKKIBEPVOe0qWKqpnITVhv7n2YbNOWbqCrpUiY1tx/YESRCVmQCMpX89zwvFgkt/i1zl/TDR/f97t3RuRXaTLQtH7+0uabUXxkHKACMmps0nLehaabiUzHrHC+dxqc9glgDiatjs1HmeUK6163w9XVOUfB9Y+7vimz2Wjjt/GFXmdVA7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FohuZoPBfwK4Oz+oXKhchVmpsOsG84ZbQ/rE1JNQvw=;
 b=gvBj/nej6jJnFlDJi2CHY/5tIDbw6hIguXO8k8FoDudYsOsQZ5yEDv/WxwM9ClGmPLNArW6RZaQDeosGGr2AQogcnL4EWqLLeX1qx49hEhRfSjLs/HdCKWK0BzNHGipHiLz1qXzJSxQ4dFiX0PqUU3pERRQNw63I1LRFhRXa8xDNvqBTPGngZfdoxP5TYVdwdZswP0wtDjG1EZFOJ7num5U5LRYj39mia71XeNMVc2cPCAbLxPqzw//cdhGb5yw7hnmfJJNs2qtHBE+zx+8/EPBC036NPo+j8YzYKqi42wXX5Hanelke4X/PIdkgsllnBPsE9gCvt7bENrmGs8ztug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FohuZoPBfwK4Oz+oXKhchVmpsOsG84ZbQ/rE1JNQvw=;
 b=ZxOYay2LfX87Dz9398rBZd5/+Q8CadxQ5Y+TEEhDPtcN3BldjBhX4/Qs1qT6ocy1QyoO3bxFyY7qlUR9+CVWlsr7yG2Jf/dzvO/R0xXc3PWuACpEHKXEcsVIs95vRFrXc5l34OTYRgTh3m663gXpPY6Bw35/VJNdwPy5oW+q9TY=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN4PR0401MB3551.namprd04.prod.outlook.com (2603:10b6:803:45::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.22; Mon, 10 Aug
 2020 20:58:57 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::c86c:8b99:3242:2c68]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::c86c:8b99:3242:2c68%7]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 20:58:57 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Stanley Chu <stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "alim.akhtar@samsung.com"
 <alim.akhtar@samsung.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Subject: RE: [PATCH v1] scsi: ufs-mediatek: Fix incorrect time to wait link
 status
Thread-Topic: [PATCH v1] scsi: ufs-mediatek: Fix incorrect time to wait link
 status
Thread-Index: AQHWbhHwgR3BsHpWkEyhFBMFuXwxrKkx1cJA
Date: Mon, 10 Aug 2020 20:58:57 +0000
Message-ID: <SN6PR04MB464019F00686A7F82547E99EFC440@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200809055702.20140-1-stanley.chu@mediatek.com>
In-Reply-To: <20200809055702.20140-1-stanley.chu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [77.138.4.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3f1fca3f-1ec1-41c7-c2e8-08d83d70332d
x-ms-traffictypediagnostic: SN4PR0401MB3551:
x-microsoft-antispam-prvs: <SN4PR0401MB3551D7B6AF4C4AFC2F2F1C8DFC440@SN4PR0401MB3551.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q9cz6l5XtBu/cVAcgu5E+6iroukpH4zZrlS/jyKzEXiK4pu9W6lB2X9WoFSzuvFbue0BWgnjVE0noa4A9lgwygglikzjjxXvCvRgpuf0SJOFjA+sU2Lotd8AG1HGg8MPjEm2jRS00Ng5vP63SOfcACOSX8iYhcYpClSy7mFNoqorOKliHdh9ohXC+hsQaKWYJPGCFoceB3uEq7SF+dTbGYmj3Vm1GXeOjtzeJva1x3Ok0ehkWB3QzuD6xkcn9IUuKQwsurVMnJxtj7DeziHVSiKfvJi4jSLoHKvmLPKK8eg9WeF68XsFeaQbWITrXAv02KLkGBVacZNLHgoxfZQyOA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR04MB4640.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(8936002)(8676002)(52536014)(4326008)(64756008)(478600001)(5660300002)(66946007)(76116006)(66446008)(66556008)(66476007)(110136005)(316002)(54906003)(9686003)(2906002)(55016002)(83380400001)(33656002)(7696005)(7416002)(86362001)(558084003)(26005)(71200400001)(186003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: kNnqc5MvNwsS8gcLMdmx7c/i4nQ5HAsVEiEqImLcoJ+ID0iGJjt29V2xyN9RDxkI6blz6tiuEqUaTl3b7TXYqsWuOrSkB9HoOs2lUNrPVzEPDCuElwjKUKyfdEtt8WDlnkkAkxFI81fhXAL1hG1wEXmjJrOM1XTmEodVNvoFqhkqAknvq5FuPvWWlUvO0axR2r21sOIlNczdpKXwTCZZkIuBZwgiFaQfmNDNlXex30KKEs7vikfvDSGMp8vaPIm+4G7tQemnrVAqButDmpNOdDU7PZfH3OGFjwt6OSGKbRU+byKYioyq0PUPZVrPq+dyi197sGgB/tUknxYJLRkjUGx/i9kikfesqHvnRE3CgtXgq6NHraHsnI0Yo5vypzjuvpxvY9xUbpH3YPHiLKtUY5tTFduU7MdMm1ZsUdML4zhlLorPTuKEDnvEzU9G11ludK0B4DLm89YziFWq3ON0BXoy0A/IeYjB6Xep+3O/B5qSJJffoLEqYcVFoq4Njx6SSg4/5uAiD+ggTJY5HK2ElxHMpi6B4kIwosX4XnhVY5+rhWLCdgF0AZ8tHZ02N7kpy5/jj0rbGViYlZ+KjfzmA36PnHK4/U3GRoWjGjNxxImeBPcvHc3aKYg/hIDcqU4jgFtLT3TH9CXcIct3E3Gp3A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4640.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1fca3f-1ec1-41c7-c2e8-08d83d70332d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2020 20:58:57.5784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4jG0ej/nNGObeumoWDC+XQeG9FoBYGloT+2VPxFRMce/W55J+Fck5y7MKlNZEYDim6thtj8ePSV5QGIbOFd3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_165904_975382_63D29BE8 
X-CRM114-Status: GOOD (  11.30  )
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
Cc: "bvanassche@acm.org" <bvanassche@acm.org>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

 
> 
> Fix incorrect calculation of "ms" based waiting time in
> function ufs_mtk_setup_clocks().
> 
> Fixes: 9006e3986f66 ("scsi: ufs-mediatek: Do not gate clocks if auto-hibern8 is
> not entered yet")
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
