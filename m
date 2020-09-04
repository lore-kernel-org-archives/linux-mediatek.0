Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71737C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 12:07:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C64420791
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 12:07:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HoFeS4QU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="C79AcAR+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C64420791
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Utnj8BHu2UhwY4YH6IFNEvSCslg0WtmnpXPva79WCWA=; b=HoFeS4QUsTk0lQ1zLlR+z2jVg
	L85H+jRayOyZSsWpB7RaYS0LKB/aq9SMpp8ieI01K5zLsbir1n/TTssCiwiCdnq1B/u+JTrfuyHsa
	7B6F47vkQugERR15nwxrTC1ugTSRB7tsQ7mFW6R/bpfIiaZdLBfjV5q597lZpxhvLAiDCusfqnx0w
	+oygOYw2kTyu2MxvV07jSir4jN7RiGQdtENpOw75ePkik/I7QEJhyi1L6MqpBbpjPMCopAxffjPBF
	VWTI3VuY7CnmYI5qJzr2AYHIXfl5D7Neyv9j37F7xRa/JZguwy73vaT0sJuD3xddGoaJd6qP2Au0R
	/UAJAJEpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEAUo-0004dB-Lh; Fri, 04 Sep 2020 12:07:10 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEAUm-0004cU-AQ; Fri, 04 Sep 2020 12:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1599221219;
 bh=FT13C0ebJTxXE8wqcoPUKihv4j2mIvTpRNrXVWEUsZo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=C79AcAR+aNWnOZ+a+KVunn65kAwM27yCj7C582jrTyxyKs/TRW/e4ZhZdsQF77zy6
 uvLpS/cuCnk7DMedhpzNr9dBQTxyPvsedcr0G8SYOgHNiEz5CdI79FzCMZT/m//5yj
 zfzUJbG6hbYdsfSTi+HdMekES/ymDjnYehMHUYBY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.147.193] ([217.61.147.193]) by web-mail.gmx.net
 (3c-app-gmx-bs07.server.lan [172.19.170.56]) (via HTTP); Fri, 4 Sep 2020
 14:01:09 +0200
MIME-Version: 1.0
Message-ID: <trinity-0d5c85ee-1f7f-44ee-9e5c-6349d4edb3d3-1599220869440@3c-app-gmx-bs07>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Aw: [PATCH] arm: dts: mt7623: add lima related regulator
Date: Fri, 4 Sep 2020 14:01:09 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200831143937.28259-1-linux@fw-web.de>
References: <20200831143937.28259-1-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Zdcm2VtIlFuzIg9+2N4g48+JIQEWJ90Ozh5sFswZjRYm38b1Nq1kEi9atHNr1ObC+tCy0
 TJfkljY75fRhxXVJ1KSRT/xfiSE90L69s8Klm5vrENXG5PNU27+Int6fZUXBQZBM96Pd9za6NHKz
 1WP3CqvfFZ96IGCXt0kcpTNWQbByYDrSWYYQleP05HinLLgChqPMbEMBJ83pElU1HCshWtym8oHK
 0FCuGdva1vxhNuHkYPtcHIBV4D2yX1loE2pnseKbeYKGTOHHUVQxEH7HgQ1laM4QH+EHIStOwPH7
 1A=
X-UI-Out-Filterresults: notjunk:1;V03:K0:yy9R5F0Xmfs=:blvZiUhz/V55Tb0rfEvlkT
 megYuDxKlaFLSBwmz7tFtKwRKcsBP/TRLRjq3WrENnUG1Xs7ug+ruR3NB4Mqa9XBtUk8sbMSy
 gq47VxJJnh7MN7YQ+iKDCCOxIHgZ72/srW1a4XNFBtZXN1CjhY0gXiWJWx7ZT2/uwN9lbKH3r
 PJ7yMul1chQpnHtbHWcVgcYXArhuxOpHfvMYhtAcSelhhhCsmDZ05YfoocGTDMD2Hf5AGwOHM
 kQGp8uz6iHNjRV0sl4N+YikRwlQQ9cP5IK8JiksFGzLJOpONxzcJ9Nhdu7cAUapxYczJZgseO
 AzjjlIu7SH3pHqDTSLd4HtMB4nmJP9TlUMwZaWKozG4UmIgMQrrgrL7dFCUZf6UAqjRSzpJEO
 vWnhRpYFpTXF3c3OB4C22dX0Z8kRE61s56dpc7U2YA+GbHDeQn/SowI3KthZcIBUIjmgP7oaR
 SMn98skgO5OzmkyXtiCDujtard+fQ1lOZlWbTdyQG8A35f34IJnfAggzVA0FemU+YIUQGaefD
 HlwqoQrh+Z2OUqGMrYrhtLVRZU0zzNYA5LLxJq9CCvLq8/gcS+vdv44UpthDoqldMBw7/zYfv
 ftrfB54cNoaPY1PhrfYHboDPjjQ0/6M7pb16rOlxnGXQ5zviKW+vFQZtR9J81htn846UjYOvp
 XJLBz+lBO8aNNvLshYdl7LQfSF5CGilkfyEYTs5UWkCn1LyWb7b6+BGQKTllVjUUHNFU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_080708_566223_0AB2C84B 
X-CRM114-Status: UNSURE (   7.72  )
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
Cc: chunkuang.hu@kernel.org, devicetree@vger.kernel.org,
 Alex Ryabchenko <d3adme4t@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

this Patch is now Part of my hdmi-series v6

https://patchwork.kernel.org/project/linux-mediatek/list/?series=343565

so comments please to this series

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
