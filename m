Return-Path: <SRS0=bt65=BM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552C1C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 04:49:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 179822072A
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 04:49:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e6s1Z/sX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="krI6ohHs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 179822072A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e7k650q/qFkoGzJ3KfVgaXkZdBajeX9t8baPGdGIi70=; b=e6s1Z/sXZeRC9oWXYpoKDy4d2
	I//jsc4gYmnfNnlpeEcsPt5CAxk2eo/6Yk6FDSbYoV1GPZho2F3yC0RH5fA8r7HR2Uh2SiNui08fV
	+rWd3E3p6oYYyyOU9c4/uNhS4+/uOppfA+8H1NpD/ZdOIlHNINE1Q7KPMZVbMfeL0WjU7nwKwnzi+
	2llyOF/AgJcJ2dVQJqM64fRCGB3XjNWhU98i/3G1ygg2NOX+Q6I7tf6DAw+oVqtUoVpNbTlTPcpo8
	KEy06EbokM0xWd+/3hIyOhr5Wt5V4W5JKOfzo0SyDZJpHpBsvrIw8UeCwXtkBHwI+slV6/lfThla3
	lxROU6G7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k25wQ-0000Jk-HM; Sun, 02 Aug 2020 04:49:46 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k25wM-0000Is-QB; Sun, 02 Aug 2020 04:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596343776;
 bh=d6pa9qyO4ebYl6Gjzcm6qUkA1sR4+0nvmuHulLIEwSk=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:To:CC:From;
 b=krI6ohHsaZ+dQ7eyQfIei/F66oDXM659RvEpJP9JK9mJJeCEuPTI7Iz1Dizzo9Vc4
 X+l5LofRfhXM3Ss3YnAaJ8hKRps7GTGherF9NyjNlJxPgLtSfGZxO356uNM8GDaJ3R
 eSXfqNagdUap8n0ZMDsAb+FgNgBJath6att13grs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([217.61.158.217]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZktZ-1kDtne0Bst-00WqYd; Sun, 02
 Aug 2020 06:42:53 +0200
Date: Sun, 02 Aug 2020 06:42:42 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CAAOTY__7wCeTm0OY0P1VKZp-r7+d7yj=LLb79Nzr1pVVkOjy2g@mail.gmail.com>
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-3-frank-w@public-files.de>
 <CAAOTY__7wCeTm0OY0P1VKZp-r7+d7yj=LLb79Nzr1pVVkOjy2g@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/5] drm/mediatek: fix boot up for 720 and 480 but 1080
To: linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <6F0FD8AA-A582-45FC-BE1A-06B3812B3DEF@public-files.de>
X-Provags-ID: V03:K1:KhyXaG0jr6aA9V5C1Ggsw1obPQoBRxRiw27abReqz2kmvby8piV
 XZKCGh/or/j/Foag7XjwnyyRKO19ZF9b107LB+efhVUVgTYdeJ1DxNySte2gVFUCZr7Amrq
 YGGUW1znGZm1ePEPxg5IckIDLjW5cTEyUw8lHSr7L23rkjrs1w/rU3971Pbve/bcMnqtDsl
 nSuvNyI6mQuC8pmvm51/A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6zkFdkG3C1w=:YFu/WE8hNvMxT4W92HiV9M
 MsoH7pIA16iEvXu3SwTabPgz1iuQMaGnMxYvo4Qsfhfkf1lceBs18fFnAB4S8Tw9Q+yPknDSI
 2vfv/Sgj2KgTI6xdvXg+cYUX1v/LKZc93xHfvgFAwZYKKyMsV3O4AMNBFmhQafqAsVZxNuFov
 cCmE9AQkCLRaIAsB59NJxGe3eM6cop89Zym3c0+YlHbA77tBcY/rERQxyyS9FJbcqA6nzLviU
 9vl0IsbTseeY0I8+xg6h+5HNfxS2yFMY13f5cRAi/gW081SLvV0igKoZ7FoW+Q+qzhAKUR5Kk
 0jdd3lYJflpk9MMs8wTC1KuwYtGnqJQRuLN8vjAr/gWtBZ5JC5igx2HHK8xUxFsY4KD72hSOk
 W0XxwUkG6+pycf/iAhLNz5/DqTM76iCtekKNi7cTwuYF2p9VWpFpxeHdoUzLaa/J5rCR7C6mb
 6A0GdAWvn8baN35sOsaXwskpvc2qjePFEhLHhMWZeGWYl7OKNrZ83lfM94ZeZWz59JRKfagak
 8zbBZYJksyxZJNoZRoWqmmea880pZMUpWs3NDf8eMC/K08g2akMi2agRxUF8In5XUH6U/ayce
 e3dRG6gowkDm+gyrtLw43uPewPGOK0Nhi+UyDrCuvU3TLv20qCWQQeyFsaFo9u/9DDZNiITzs
 ppXyf89QClpfkPTfWDnIL17Xz7AeYGa+NuDNB+id60/VSXznMwofBBh8y+CP9XUWxCsiAMODp
 yT4rGQqdW9iGzOugV1esebXW282F/1ij5jLbOi2wmh2PYCM+ieLdTp5L9s3pmCK67YxwVtKVp
 uaMcEItvXUh+5DEQus3v/Ap0uwhrKTm78Y1TvvDU/KO5W5XLn7cxvih+ol67GkyPnH9yd1lKz
 wmON1hcsjZdh6EabSDb38TYKlZwmFHaLqDteYGbJl6yJdJH66P965EF0asmYsHJT6OgHe9ytd
 43nNNtDCE+zdpo8B4mXvoVaT4P9kz4SuGqY7hDBDYIhqttkdYp0GsWur2NPqAdzh8yPRVKIR+
 TP0Q1Vy9c4avz1KTWyoadCAyyvvxm1f/X5YZjd0XDidAXpNCVS9O9nk8psZFWsA7hoVR/bLEQ
 v4v9oksyMyBjLnK15bdxxf8ag8zMgjN3jLUVWE26yX9FmBXtPkxgIBSOaZsDB2oVbct2oEHfs
 sgk2gxKsf1oYD3YIe8lO9CQnjwOllQwKUInOxebjwg2WxtCJLBr+McC3WXQDUq413yaxKH8f9
 4PpOD2ZKiuOU9RInSrKiH0odgAtOuBAicAXgN/w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_004943_079053_4C3C306A 
X-CRM114-Status: GOOD (  11.07  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, chunhui dai <chunhui.dai@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Am 2. August 2020 02:08:44 MESZ schrieb Chun-Kuang Hu <chunkuang.hu@kernel.org>:
>Hi, Frank:
>> - disable tmds on phy on mt2701
>> - support other resolutions like 1280x1024
>
>If this patch does two things, it should be broken into two patches.
As far as i see,it only disable tmds and so fix specific resolutions like the the one below.some other (like 1080p) does not have this Problem.

> I think every pll is default off, so you should turn on pll rather
> than disable tmds

Is disabling tmds wrong here? Which pll is needed here? What does tmds? I got only the Patches for testing....

>> without this Patch i see flickering on my TFT (1280x1024),
>> so i guess clock is wrong.

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
