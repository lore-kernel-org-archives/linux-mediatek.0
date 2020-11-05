Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55790C4741F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 18:22:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6CD52078E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 18:22:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0a6SoTGP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="BFWGCTu1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6CD52078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8lOGvLbMEs3/run1nmBDqWl60ZuxhlM4AX94mEzKwA=; b=0a6SoTGPnfrtCflv2ptVpBg5X0
	Bqef1bdRWiVdtEKSAkLqsm8adLq71Jy4l8TzvRo8DKBBdN0sYlSL8kq6RX1HN+7fFmdBUWCvqrkzp
	2ZzpxrfmBKLy6G2XYdwDm4r2FfH1r8thj3z7qWfKhA//Muidj4f+jAbnfUw8qd56YL/FAMTxqQ5Ok
	mw3uvvRKwaI8SAqFKJSdkIW8S2Vju1hIeYPL+GnxvbWuA99ATe/w9Q5A0iGnHFDgdEZ5dgtW4trIc
	qsA75dLZEpOQHWxVERxheiFDyG6C0lXMhDavL8SOcatl6h1LB3lTDhDDLr3eoJKD2fpeQ8jsICJlD
	mGjuQwcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kajuF-0006uE-Ul; Thu, 05 Nov 2020 18:22:44 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kajuE-0006tW-0z
 for linux-mediatek@lists.infradead.org; Thu, 05 Nov 2020 18:22:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1604600548;
 bh=Pc5dbaOido24NXVb8HZQjU9gpMX01LN8EOHWxl80a84=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=BFWGCTu195qaD4Xv4Rn8gKgigHnyGgo/1Aqq/TAJFaynGfiIHy9Lw4lUQwZKj6Y6S
 BIUO8eDrNfhFCc/av2fv+XZujyKclHLdJDDtV54nJk55bBzVCtaceROj1rY8KhxK72
 SLw07C6KN2NaxSP3INreQTHfKbhqlKwM8uOEF6TM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([217.61.147.34]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbzuH-1k3cD53Mkh-00dX4I; Thu, 05
 Nov 2020 19:22:28 +0100
Date: Thu, 05 Nov 2020 19:22:25 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <c529dbfc066f4bda9b87edbdbf771f207e69b84e.1604510053.git.ryder.lee@mediatek.com>
References: <c529dbfc066f4bda9b87edbdbf771f207e69b84e.1604510053.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3] PCI: mediatek: Configure FC and FTS for functions
 other than 0
To: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <B6B7543F-E57F-469A-A4FB-C4B4E98345C0@public-files.de>
X-Provags-ID: V03:K1:CcBqTaMual05Jcwtvw5hBu21DlgbPmbjcZcpR7jddnT/v//uArp
 M8xkGEG+pb/dajrE0rlzGwzpP2IezhLUX5fdzjoLuWLuGeZO+jqWOHvgEdPc5A3LjyOmR6u
 qzXnTdCNL0yDJaWJIkwHsSqhHFiHkzdGGH9giA181eA9Y2xB32Qemg72m9qTneTCJycKtSz
 a+hjvSubA9bWs+T4aKgQQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:F5MTwzFoSuI=:a9D71ezL6d0ls2dfKDUfi+
 gEdLyxDg6omv2WsqNd6xYdG0k324fYXKZaOSY0ILES8cHy8OZDFiDt3atMNp2fCiwKllzJvUU
 pj2Ej45bpEfRZj680ATurbAtgAKiYmi1qtBRnG6Lmdkg0xXr7sNAMoH5jLbXjcwd2U5NkBMB3
 9xwk91WAqp2uAM/aW7A/dXD9euexCRP/fkBRyo00CvO6I78rwtZot5muujx6lJPuqE/mHAzwy
 NNagoeOZIKmq3MNjUSsXsD3QEWkAoJEYupYe2r69ke5Pn/sew9zL8Ev58cOszNbDOYHjEywoP
 xfRY8cKRBnOYRY8bO5Rp+cxVsp/5DyxWg5vt+iNh7jXrbmty77fMuQDTteyUFct9zPx/TBWSz
 Ar1wQ0y/V/dx22+DMnBzebZowUEFha5PwFLZjUDzv8PCRwYrANteX+7KtjAtHRkJmYJtwjjq3
 aiDqZkQdtg6frSpfsQfERhvwmg1bpOFuT6X7/Bx9zuWY579WYFRDb0BptGHSVwKCPSaZJdl3C
 xLZv6QvEAv05fdegKCz9x7UMr/rEPC5f4TPnjoAZoCz0Xk/VpicpbgISBkuMJO54aKpVM5si/
 sXuhjmWz2WIWj1RPtaXRFMzU8ONfnnGzVose5rO8DQnyPAs7OJpnur8eTEpuezPYIjOkLU6dB
 HJDA4BixbhBmeYDdz/5T1TzjapOHVMgKbro0MAjRlKwxTJ+EASzluLVTNW05NlQX+vF9l8edf
 XVwVLdUfu0qqJbJCOTd6rx9PuVXkm8Qpafj50UULul8YHBSghK7uBOXgNmvmNyYuLtQ8z3WUU
 9aOKUBYHEgOstReZ4Gd7ir9OCyiGw8cA1vVyfe27MxurnbyHRG55vaiUaua7y+qgoBanmtWIl
 j10B75qb1baRL+NVxM/w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_132242_376156_C473F4AE 
X-CRM114-Status: UNSURE (   5.51  )
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
Reply-To: frank-w@public-files.de
Cc: linux-pci@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

How can i verify (triggering bug without patch)?
regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
