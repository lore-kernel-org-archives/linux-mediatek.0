Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA14C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 08:10:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 370E420758
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 08:10:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G/dbkWfF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="U0O+5CQ+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="k779snfi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 370E420758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7yHUtoY8wgLD3D9gPoC7o2sFOdhMpGPeXS7ut1zTALU=; b=G/dbkWfF+kLO1mhSfLI+KlNS+
	MR8HBEZIw19eIvZDuKhFu0pFZza0NOP6MAclvIXCu8XAyxzqhqtRwDyjulEh0pg3G/MaD88VMaKoz
	d3Pi387Pf5asGDz+9xC8DrHppCb8nYfEbXSbbsRoYNaAhq+UjjRiu44BVV00yUpGNwGc0UamCEwIP
	8guKMjyXYENJBo/f+B8uJgIphmuD6QLWZTdoR6PWFz98xm8oKFP/tF/Hfm3kYQL5ZUc4Q9rjIv4JY
	Q3yyzA42fa85r7fsEKWT9uuFaSoSSh8tGgq8U/WBq1pZBIa139caNlShDBVH7hC97BriJU2t0BA6I
	akeCulICw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jutXq-0001sS-SI; Mon, 13 Jul 2020 08:10:39 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jutXn-0001rh-SC; Mon, 13 Jul 2020 08:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594627858; x=1626163858;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B7JaBPI1B9XbmCVzE1KWA9S5o5cjQXSqvLUzq9k/nV4=;
 b=U0O+5CQ+JdKZYXd38BXae/dBZ6UAA5BYuRCcp/eTVd7DPqdRhWTfHwwC
 YG7Qxfc3LqxDzAk/UOpsswJwiie4YnX/kLrRNlP0zgzJNwMa5NsBnlv8E
 cLKB5ffCnwVKR5Jpx7xSWQPVXsXw/rj9mzYGQN4POXi591PFCdSAkQhBg
 fAzxK5CI/ZCmS8eTzAACTXW7ibN6trxzIKog4OWyGDuC/1M5cSfq/+FDK
 dfOYF7d4PkOZUqzPRqX7HdZKj1mImeAf5kqHerSYsMQffuPcj2MPQ4ZQB
 nesCmnXjhas50hSi0Qgw8IK+HAOmnSPSV3yKWhUb4xZpFFtfioZoefMlr w==;
IronPort-SDR: YvvMs75dh36GAug4kAYuD3G2goQonZYit0yfKI48x9cMY+eqNAsT2SM1faW+SYApLm2UqDSZ+a
 MPshRJ/BGT+xaLjiG3HDLfP/Up+s0ulQNcv33dhrXVK+fOeVqeDWZAHQPiKKU24y1sUhE7CZp1
 w02UuC8X22PbSsjAQ9xly2ISFmLSBCs1t8Tiz52MY89QTVFR4rmXKGf3BeS7S0XW8NsosqcL8V
 IRtWh8sGRnqq2Xu7/PU24y8zgreNWRSAQiRP6I8viGsnIsyWWO3rNLKrPlzIMO3pcFKfpFzcP9
 u4w=
X-IronPort-AV: E=Sophos;i="5.75,346,1589212800"; d="scan'208";a="245327578"
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2020 16:10:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JddUs+I+e6xR/B4sF7sqLYm+3sGxvYsE6aoAVsApUDcMTs35++ymM449+iRP/7QOBrRdvstV0PdxXJkFbHJ3qdkgPnjUlthhl2A2ESvgAbyKdcsusedF28EUOwTTrsnI13hVUbK6yJ7+GSn7jeeepgTBeSqzjtUbgbktMwQX6naswcobqI3sJcyFpC9cIn6Bm6HqG0fPTSdr5T+jZ5Ues2Og4rImXm4yYAjEkVFxakVy3AEa0xLqxJoHLzOzP22ge3e6OsoYi9nis/jYS4spg0t0T9vN89+JNTI6KDuvBMj+XP93fnUPttJJhMad+WoU68Lz6LjbD+mZdFp+PsAmTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7JaBPI1B9XbmCVzE1KWA9S5o5cjQXSqvLUzq9k/nV4=;
 b=FqPTc6+oinAYYeQ/NW38Q5sNKPgozBQUMi1bmIFZ02d7OAwln9VHyRY0iM3/K/Cymxhi5PawuLMw4ZOeljwucpcQGR/QRQUyL/20ZYWgbhW3jOUXQne+A1Mdrud+ydgmC2HtIz3lR5cGBMO0TRaXX2TrgwVnghoZRXe2ubboI7olV3Ss4ydO2J0gS9wRjJHOaj/KfL6sKVU4YYEmNNnleyt1vXhCllFtfyhYaqbI3PUr+9BT8TQj1Q6Em3YrJ7Mgd5oEX1tYoFVEsgF1b6XhjeiwQsaLWdyRuOjBvz0dA78AbaO8/Jdkt/ZZ8qHl17UwpdIBQXz9vRlIDzsEc9Msng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7JaBPI1B9XbmCVzE1KWA9S5o5cjQXSqvLUzq9k/nV4=;
 b=k779snfi1oihxRcp/qPVzHT4BmXCCwEOy+aI6ispdXNu4XbawkV0iaWmM2nHcl/kYvWj2Xu28BOPxk2GNip8onx6DPDZl9RyXMpB3Q7Wpu5LDzhrt9eL3KXhZ1phksVcpRrO0/jHghaknswV0g+uwetk56vEmXZGr5IeC5hVS6E=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4192.namprd04.prod.outlook.com (2603:10b6:805:3a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Mon, 13 Jul
 2020 08:10:30 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::1c80:dad0:4a83:2ef2]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::1c80:dad0:4a83:2ef2%4]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 08:10:29 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Stanley Chu <stanley.chu@mediatek.com>, Bart Van Assche
 <bvanassche@acm.org>
Subject: RE: [PATCH v3] scsi: ufs: Cleanup completed request without interrupt
 notification
Thread-Topic: [PATCH v3] scsi: ufs: Cleanup completed request without
 interrupt notification
Thread-Index: AQHWU5heDqJFApuOo0yQOIjuO+/O36kExbEAgAANaICAAF4EoA==
Date: Mon, 13 Jul 2020 08:10:29 +0000
Message-ID: <SN6PR04MB46409838AE9D4BD63797E26DFC600@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200706132113.21096-1-stanley.chu@mediatek.com>
 <3d509c4b-d66d-2a4a-5fbd-a50a0610ad31@acm.org>
 <1594607245.22878.8.camel@mtkswgap22>
In-Reply-To: <1594607245.22878.8.camel@mtkswgap22>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [77.138.4.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 95629abf-70f6-4cc9-ffbd-08d827043535
x-ms-traffictypediagnostic: SN6PR04MB4192:
x-microsoft-antispam-prvs: <SN6PR04MB4192806E6CC9CEE808276E5CFC600@SN6PR04MB4192.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0omG5BNzD4J6ItbByNGE2W9NATFsAwu/XwVt/+DuHIn/IddEZsvIX9S7Tllg23/ubKopJWjpDSQDhFUVYNlU3ObmNjPL6unmHceA6JA6xnxlq4EYUnLkpxyaQk5sQD58dBV1XIvlmQL6FjLrPjq0rKvjTRc/7LDfH9g/GnsOg2MW7Dn6Np0+TfKW6ftFd6HW38UPdztJ1JNTVS14GboqniD5XienTsWrUO4gMPGrXQ4VMrp9PFJtRw1s9zRLhstqAJNE8yGvXoq9DMpKRRENQA0A9o4Pos+UtbLAI7zuSd2+aIPludSzFnIEqNg1FCxqrhqQCWMwJOOLj4uw3MTAMg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR04MB4640.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(316002)(110136005)(54906003)(86362001)(66946007)(83380400001)(66476007)(66556008)(64756008)(76116006)(66446008)(33656002)(5660300002)(7416002)(186003)(26005)(52536014)(8936002)(7696005)(15650500001)(4326008)(8676002)(478600001)(55016002)(9686003)(2906002)(53546011)(6506007)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: o7CQ2uDVRttVMd/nI2dzDK24L3fz7hfjsI0sDGt/JaBiiGbEinIoTtPzQM8byTMxQOYjfB18u/zFFzRrnarXb9CHwXuKxyOo6s64hOT+y+YKPwdOsZfHtbkK9ENJE+fPCWclF0xVj/8RVqyLVBrnuy1P47VACbU7YUdzJ0vTu8vn7sAD7Zdyp4Fjw6rNc5E40M9q3++nsWf9N8CPd+YB27EZgV4OmD+VDExEVMdvHHUk7N7BseLPwv6U7gThnYkDDE/FHUdoI2LtPbGcKgDdJDmxXurCc5M5GVtXyS2P+e3sZZ9VsujAnVop59AjijGFP/4rIHS/WOinLKKXtBEl6147gf7lyKJECbqCBGIlM+NUcsn4n1QV7jyH9rsh31HOt0IbSOY7ntoLbgCSOu8rrkPGc41pX2RoWFo2SOzLGoJXAjCixz2XCfQpx5tlBRIxUxHINceF9IzsSGTtZ4pL9G/epqTZcnBcgcqKlu+lS20=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4640.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95629abf-70f6-4cc9-ffbd-08d827043535
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 08:10:29.7809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DgRnkHwGOCdx+MwD13zn6QYcEnlprt7fNN5MvJqFvR/Qxa4WVLVh6jsaaVNtPPqYrAYLWltFxvepCBXvplbU4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_041036_082156_4B3D18B2 
X-CRM114-Status: GOOD (  25.30  )
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
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> 
> Hi Bart and Avri,
> 
> On Sun, 2020-07-12 at 18:39 -0700, Bart Van Assche wrote:
> > On 2020-07-06 06:21, Stanley Chu wrote:
> > > If somehow no interrupt notification is raised for a completed request
> > > and its doorbell bit is cleared by host, UFS driver needs to cleanup
> > > its outstanding bit in ufshcd_abort().
> >
> > How is it possible that no interrupt notification is raised for a completed
> > request? Is this the result of a hardware shortcoming or rather the result
> > of how the UFS driver works? In the latter case, is this patch perhaps a
> > workaround? If so, has it been considered to fix the root cause instead of
> > implementing a workaround?
> 
> Actually this fail is triggered by "error injection" to produce a
> command timeout event for checking if anything can be improved or fixed.
> 
> I agree that "no interrupt notification" may be something wrong in
> hardware and the root cause shall be fixed in the highest priority.
> However from this injection, we found ufshcd_abort() indeed has a defect
> flow for a corner case, so we are looking for the solution to fix the
> "hole".
> 
> What would you think if Linux driver shall consider this case? If this
> is not necessary, I would drop this patch : )
Artificially injecting errors is a very common validation mechanism,
Provided that you are not breaking anything of the upper-layers,
Which I don't think you are doing.

Can you refer please to my last comment?

> 
> Thanks a lot,
> Stanley Chu
> 
> >
> > In section 7.2.3 of the UFS specification I found the following about how
> > to process request completions: "Software determines if new TRs have
> > completed since step #2, by repeating one of the two methods described in
> > step #2. If new TRs have completed, software repeats the sequence from
> step
> > #3." Is such a loop perhaps missing from the Linux UFS driver?
Could not find that citation.
What version of the spec are you using?

Thanks,
Avri
> >
> > Thanks,
> >
> > Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
