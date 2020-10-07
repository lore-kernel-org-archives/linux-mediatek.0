Return-Path: <SRS0=2/VK=DO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB420C41604
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 17:23:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00539206F7
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 17:23:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iKdJ9MwR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="JIS69Oz0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00539206F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JLO/X5+n4Rs8nfXenps3XW3s0dFyzYU3z5uMgG5x6kA=; b=iKdJ9MwRspqHVgRv7se+KNwXv
	QinupenLogf0ZD3c2QI+pDXHI/8D2Hmf63vCwNiYYeaJ015EyxjyYKHyVzAZWSUD7loW1/g4cIwZo
	uAvckj+mQ0UsHBe8BUAYzpC3x99m9OhjI5IIDQGVuEJb2eOu0Yz3dXY91yo7ZZ29jHTG2Yc872RgM
	xV1s0ThFr3BB3zNP2ppfkLkg7VfJS8VPYsDsf8wKMraLdFtg6knNaiEjE9ztm+OMxywv7Ry6cSUNU
	xUpiW/rO29iJezrAHI4kMiuQ8EPCPSyaTfwdkw5j03KldBKqScsSb/nRUjnEN3lHLB3yO3VrtX13s
	Eh984LEVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQD9Q-0007ew-Ek; Wed, 07 Oct 2020 17:22:52 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQD9N-0007eG-L9; Wed, 07 Oct 2020 17:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1602090994;
 bh=gStd7CSr+9t8/90lKMyO+IPWH1Dnp3UnGNJgZmWHkzM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=JIS69Oz03E+0rbXyO7NrmEX/IF+zrZUMLxsq1OiStcSchP3+YvBaN1m1aM/oNbPVW
 OokVxMBFF5z9l8P2bAFzbe9IFRtk6jt0zl8kfi00CwfA3oGEPmtZFzbBbP6QVSV3N8
 ntFSElk/pwME8iPXebKFhCADjMxy460ImJC+nbT0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.208.210.121] ([80.208.210.121]) by web-mail.gmx.net
 (3c-app-gmx-bap48.server.lan [172.19.172.118]) (via HTTP); Wed, 7 Oct 2020
 19:16:34 +0200
MIME-Version: 1.0
Message-ID: <trinity-45b0efdf-27a6-4b91-943f-c3782c637c0e-1602090994397@3c-app-gmx-bap48>
From: Frank Wunderlich <frank-w@public-files.de>
To: Michael Kao <michael.kao@mediatek.com>
Subject: Aw: [v5 0/2] Add Mediatek thermal dirver and dtsi
Date: Wed, 7 Oct 2020 19:16:34 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20201007075437.6002-2-michael.kao@mediatek.com>
References: <20201007075437.6002-1-michael.kao@mediatek.com>
 <20201007075437.6002-2-michael.kao@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Csqd41G7AKxDFuH1C9SuyrD5jWqGjY8u5x7tZCZfuaePzhCmFah/9bWtJBjB+9cchHYoy
 HvGlmXK7xp4TcX0XMJ7Th/1qaq+UVDkk6iVl+5Hep6tJSCTuxX+fQpTzRddjK245Qx8AsWhSoGgd
 dN+cv0TMip0SRNyvEjmCoYAvYjelIYolj6sePUq4FUbMYKLnbiWDHq0XIcC9hle1K2QLKAmOT+zU
 BniDlgIPOqfeLis8fVZ+yMaLuqqy2q6i9MiWVsPTr++2qpqS8mlRNAauD75xKsDP2jEyaw+Gb/fN
 xU=
X-UI-Out-Filterresults: notjunk:1;V03:K0:h+GprEWGXCA=:hFC1+Xe0ZysvV/Zz6AJxHD
 cZD8aco/Ld4woDEUyKrQmBhGLQYzfxqelK9h1KlsAkfNLRxbLFOkw0mS6tnzedpdef1/4msfo
 a572dE1Hx675rRLbvtkdU7AP560i02WRpGsAfHZY0fGItfup2rjDPRpulKeYE+5Nmp4d79B4k
 GjqEcvhStLgAvvPYPiPk545syMmHQVL4wl+0rU5/mOvIEnelbvp+ot8WP1Jqa0v8HWpV7mooJ
 3yv/Uyyk5H3iBwbB+MZpfwv+YhYlos3ttaBamCTuuNZCsyprLH1HlFd/1diYpSBiCgyR/874c
 UCiq67s9zYgmv9xfF8DOZr3ylKUYqGIZvG+/YXHsFRCrX+ElbTV3ZhsVck+zjryUKp2NqObp+
 TB7V+fVroghblDYI90CunBeZsVqXB4Yiu618OWK5EeRwMeTlVZcHnEa68BwNRk0A2nJMjq1KI
 OI87KYAY4gwaUYErIZfOB1q8ek5Qb4pmgOt18A132x2ehNw9AV7QtrBZFTnCZNRhi3u/ZUiU+
 m9ZiIz/fbgk9+ulW0+Gpby0BQOXenfuTu4NtUwo14NUFGl0g1de2yd/Tus1O6J5PAcgORo/UJ
 TVLE4eZageWiMGY7DTkGxvNPw0KASEduJeN53LYpfeghvY1pc3B42sMZlSwxYz2tQ8OfNtqD+
 d4Azy8PABXGTDvzdQSck014AFp77jHz3R9BDBTgrCBKDN7hSF7hZtuL3JkjioGvEKCYw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_132249_983381_D063A6D0 
X-CRM114-Status: UNSURE (   9.40  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Michael Kao <michael.kao@mediatek.com>, Eduardo Valentin <edubezval@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Mittwoch, 07. Oktober 2020 um 09:54 Uhr
> Von: "Michael Kao" <michael.kao@mediatek.com>
> Betreff: [v5 0/2] Add Mediatek thermal dirver and dtsi

Hi,

just a small typo "dirver" => driver and coverletter (v5) does not match series (v1/without version),
so it is not linked correctly in patchwork. I guess V1 is the right here...
imho coverletter should also include platform (mt8183). There is already a mtk
thermal driver which you want to extend for a new Chip.

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
