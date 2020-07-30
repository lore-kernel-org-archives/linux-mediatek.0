Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE9DC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 17:58:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E02820809
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 17:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wfP2ZBjm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="M6qozijJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E02820809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OVScqh2K6oqt2EMKALAf5/mA7UKYJ9iYtZxfaXBZSPw=; b=wfP2ZBjmJbYP0Vtv4eCsLy3KT
	BuVlwVDtQ87ZpIFBTNluQQK80gXUqWDW3+D2Swsl+vJ2LRHm+Nm6IBv+jC8dvz/Y7xz2VEQ60CwCy
	uBxFE8fwsOrbJZz0wb4LF/LipfmVtaF5chZa6vszLwlogmcAdt/UpLDuT3hgJ33TiY8yz2xbeOh2F
	jC7byuPycfuj9i/0UA3hWCDj6moqB2N0r+NoYOMpbFEzl8TOy7BrfiVZwCr8zSiZF38G1C2tH6HRC
	36DSI+ykR8Um3v/d2oW5J0zDISQR7/MTWdaglwdwpXGpH3lD5rgMYkMeG1D4A3NU2kug0AwRckmCi
	CO/hgUrbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1Cov-0006Z8-DM; Thu, 30 Jul 2020 17:58:21 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Coq-0006YF-Gu; Thu, 30 Jul 2020 17:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596131894;
 bh=ziofVbDPyMepDQRodxoTHDhSQkTSPPyJObV8bPWtPoc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=M6qozijJ2FR6LJ7C+qk56utfHoOekPD+pzer79Z3Xol+GnY9i0oZs1roV4lBkbp4O
 Z3M5V9ZcxrxvDpIqPwVhcePhBXO0LdCCLHh7/iFOq2O+LvfplNdAYAemS2t/i+CknL
 0OLZuuHW+JJSMo+jEr8xvXwTt9T0JeSe8rROjDc0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.153.170] ([217.61.153.170]) by web-mail.gmx.net
 (3c-app-gmx-bs42.server.lan [172.19.170.94]) (via HTTP); Thu, 30 Jul 2020
 19:52:41 +0200
MIME-Version: 1.0
Message-ID: <trinity-7671b933-7c8b-4967-9785-1994ffbd090d-1596131561877@3c-app-gmx-bs42>
From: Frank Wunderlich <frank-w@public-files.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Aw: Re: [PATCH v2 1/2] thermal: mediatek: prepare to add support
 for other platforms
Date: Thu, 30 Jul 2020 19:52:41 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <94d81c8a-2710-98a1-4cae-040e9b51fcd9@gmail.com>
References: <1588238074-19338-1-git-send-email-henry.yen@mediatek.com>
 <1588238074-19338-2-git-send-email-henry.yen@mediatek.com>
 <94d81c8a-2710-98a1-4cae-040e9b51fcd9@gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:B0nL+ATtvwAyy4RCra60ZlFLZfK70cMRXJYEps3ztLnlxLK3gcn9MyGnUiOpxnF0vzZwJ
 GYOw1yAEZFHaxM8v146laW3/ZOLx6LyJbSNMXzBB/F7QHiSGR5l5WzsKXrrwFDGfFpSEv/njZpgk
 ZASUvk/u6PkzmEZ3dRcEMvVIOMbUank8trxUvH8mz8xUCw29719kul5IrnlutqBTdFYzrzU+ojxW
 ro8wjUCNgp7MiYpepnm6CaiOm8Rmlls8c9MzSRkQtMDeSTziFYXLK/WnyT22ne1apfgl5gOsiGl8
 hI=
X-UI-Out-Filterresults: notjunk:1;V03:K0:DcWGd/Cb980=:8vszPxVM7/K/shZrzuNN5L
 JSlK0ILwVCjuqfC49qqL6Pbvz/HttW7D3Gb2xRTddVIIj2t8GsKSuxElDj42kbC3k7QXXzzLy
 jqq9Bae6Q8NuZK2Iy4mpmkQIPTT6pTdFhK/Y6WCthqkFrUiOLPNGwDLXq0SmLQxaOdBNYGXaP
 uI2Zkwt8helTcpmw93H2zerDyvpwmzfTj/zlsZeuSunWUpBKPnMd2EmKVAX+78LKRuMcra+gJ
 PQ4UaBCJVjJLPVn3GNdeS7qPYDCeAJXqdi8Dgr2a1wpntWrBuK46cOh/JmxlwnGK7fOv1QDgc
 9k1UziEFg/xW8+pqy5rRE0ddGP/pkeufy4bbb1puoxQSCjgI8RK0PjI8zcJP4VT1WJTDzhqG1
 flcI0l1tvlYOTN41ngHH2fZaccIO70hRd/5G6PMzlg/qCZgB6UV/aSIhTLEDkpRXfvRuFuDlN
 VWy0PJYKBjgYulLQKu5GV/gGp7T6wJiue8Lv7dLWkLeRImZVDOi4MDimS/U+Fo+aQ2UYXjPFS
 TQLtKNUWeOKv9qnqklpZrdkibaDSbd9nP5Kk7rmW900ATIysaNnoyxDj6QOIoO2KxfM9swjQr
 sQ7b3jn2B9WBNEpgQ0U67hOn+47Ycr0jZgHcsYum7pQsq9KUqceGfTrnYQWEe/W+wTgBilvWQ
 x+CZgH9Akfem/uCedUsVCRMmS6H84A89I7bEmdurBKIniM6WsvdYmAxlEjBz/6G+Irx8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_135816_781564_6844CD04 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message.
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
Cc: Amit Kucheria <amit.kucheria@verdurent.com>,
 Steven Liu <steven.liu@mediatek.com>, linux-pm@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Henry Yen <henry.yen@mediatek.com>,
 linux-kernel@vger.kernel.org, Michael Kao <michael.kao@mediatek.com>,
 linux-mediatek@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Tested on bpi-r64 and r2, i hope this can be merged to next / 5.9

Tested-By: Frank Wunderlich <frank-w@public-files.de>

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
