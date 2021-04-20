Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252D8C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 15:00:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 734EC613CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 15:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 734EC613CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xzlLJKMafoxGgUnXp14vk+ei6XvHg2+7TTPRAkqrnkw=; b=eAA9TcX/HJ2F2t3nHiIwzrjz+
	gGF5728Hi/v5kgYpJxqHIbEL/fa1rqDGSyPuRwT4bqz5OviT+3NnMMpl1cSmy1EWvrKuaoifCxVjZ
	QqWezRJYUsY6s4LQ85gZBO9DCtAI2ZoYZeXxHqdrc5ba/8WxwDUjoxgxHe7F3dq8e72VSn+tR30/1
	isbbE5Dd0HrfUF3OLJIvDSn8Fy59J6/7uRsXalJEhSSQ96Ie0sffWd6rz3WFBfb7y8zwMXoydbE2c
	x+oKETvgUVtZzV0FUkoMO5NgwzClYJ0U+N3srq/255gr9gZ3KZBrnbcNLZgO+twZPZfYwJG4R+DO6
	/SnwEgSLw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYrqu-00CP8y-28; Tue, 20 Apr 2021 14:59:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYrqs-00CP8m-KM; Tue, 20 Apr 2021 14:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Date:
 Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UtHtZlhp6NQ435Vk3rq97qzyKek1zevPzfOguVvQUcI=; b=owen1uAUdZwU5K1tDJxCcbDmiK
 cAQONt7m4GUWyIfkC8ue92aoH4c7aNyuGFpa0iNz5vX9eilTczqE+MFyBVBer6NYJjAAQG+0ULHSe
 GHP6CY9TsfFh/wTRpe/KQDPWZ4FNpqj6aS9J7YQUkhOMCywjVvNFlOSg5Y6Q5Qvo2erHrsYoYN9Ax
 LwAx6b/mwaH59ardOJ3msaKW1+WsrQCmxwWTKFv9lWxfeHcYkMjskcdIgdTIfFrp8bp/vFbvNJ9f2
 gteVOWRJpHv3CSiriKy/kH00bWfg8cyoRyQ92ntK+zcYOvBNQP1GSQQK5sjTN8TBKA4HJ47M8ui2e
 f7X+a7IQ==;
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYrqm-00CDId-LA; Tue, 20 Apr 2021 14:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1618930770;
 bh=xoiOmaCVEtpySRd04IegAG0BxgeoJmW2GOsRSiidCZI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=dK7Kl+Y/Er9+jMoCpe/4bJETi5ggUrFtuMujRHCt26QWgdKJkMrefZfFZ2P+bWQoT
 B1W4lTQaoHr8TE5JJguvnodz6rAs+PD3boH1DotHu9w2sCW7DCepdKPQX/FPPRn7KR
 ZF+e4ftL6dShxTSCXohtrQayLiHKfPjaIoj+cavo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.77.151] ([80.245.77.151]) by web-mail.gmx.net
 (3c-app-gmx-bs72.server.lan [172.19.170.208]) (via HTTP); Tue, 20 Apr 2021
 16:59:30 +0200
MIME-Version: 1.0
Message-ID: <trinity-4a3f024e-c01d-44e4-a884-530135853d33-1618930770250@3c-app-gmx-bs72>
From: Frank Wunderlich <frank-w@public-files.de>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Zhang Rui <rui.zhang@intel.com>, Amit Kucheria <amitk@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Aw: Re: [PATCH] thermal: mediatek: add sensors-support
Date: Tue, 20 Apr 2021 16:59:30 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <f4329b1a-02e0-aad5-55bd-82d30a38fc55@linaro.org>
References: <20210320080646.49615-1-linux@fw-web.de>
 <f4329b1a-02e0-aad5-55bd-82d30a38fc55@linaro.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Y9ij6feTokwdz5MXRa5sZkEb2F+ct43zXd+nTvnF05xVHLjbDkTKBK5rPvKncRn/st4KX
 uMKyPcmYPW/TNB0Ml0XFq5YN8HPKRKCNC7li1V09gwh9Mhg1OIY+Dc5MPxhmbormWNQbO2/CZw+T
 v6G41ozqEjBwMRzTdscvZXlNZ7DohpQ2Ix2/aG+sP8wMPja2eZZyfmVm4ARhP44lUXU3/ioOburd
 TgmeiGPrOzFugSUQhTXCXxAndcBzVMEyw9ZWFkIbtgbFJn1e4w8rtVIOiYkL1JniXtl55eNJQNHT
 mA=
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZbkFrIIWRqI=:KBVzZ2PKpAubc0ZbdBDcgY
 DL/6Djl5qZ3UUTI3Q4fvCWuUdgkuK3cJT1ooGXUAOMh4jdvxj+wvUfsgcyvUwjBIVqyrRRByc
 rGDinyWraLq4jhtF8jI8+iIxahtqjlro6X24jsnHRNIRqoJDCVn+cP/QrrtWcJ3k2DtcXUMbI
 erJDUZ3bI/HK+PgmuSFOhwWiNbcWXFI3/O0mFZmdsyC0KmWpw+5qbYnqNFI7pjuCbPIdYU5HB
 bBilC+IOGpxN051rY4GzaheC/dGyLbmuaIQHUsxm1O5oFBxcecfDDgmAeYfATTdS5C2xIiVO5
 ogqynYIBG2RZNtmUowCZERL7fpwLxqpDfqgDziPwTC5od2cvZPGSBc7qxIh725Mqf6clKnizj
 owyMNLXQ87GCgz0wMHPIHBJa/VLaLFa8yMoHHkZwpEo7vDCwqYws5K5KQ6moN5pwWDpS+iBax
 +aKRJ8PXxra0KhowiWsxksnyOeuWWJErq0+3A9SGCu9P3PUXVAUhyJ5u3I2/D2iGLsXrA0wTQ
 dffr8+WHUyRHv9KbU5BaNBiVEqqs2SNsWuG8K9AaQBmZ5icFqxl/3NdDNCKBX9t1JZ2gmsO++
 EB1FqMOrlq5LhP3u0C9yrgyn3BaICLtdpqyPJ8f78jABpGgUP0+RFpWBdGjH1s6/C+ccBhI6S
 822mVlCU8CJgZnC30xL2D3cvcya3oWbLmiDKPl6/fNDoPVWbKmrWsWeuAhZYgqg3g6z7qOWlM
 q3QZpX3KPpUa281d77g3NjvTFyacQWrXrm4k22FLOViCfXim0gEjIsnY918Os8i/40zeNh8aA
 TsO6YXtk07Yxo3wgc1u5G0GFMsShr0yQBz8bqRKtHqvHN0lv/+J1vtWVwgmGgh4so/IERQa5l
 G9ZrrXXHAyj1edbORVpo6fUq5IaR7HNKlE3noaZPmeVgmBCoQjlt8aPDlWCnUUDG00PHTbBdP
 pcak/jXyFsg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_075941_027565_E4812319 
X-CRM114-Status: UNSURE (   7.03  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

> Gesendet: Dienstag, 20. April 2021 um 14:07 Uhr
> Von: "Daniel Lezcano" <daniel.lezcano@linaro.org>

> No #ifdef in C file.
...

> devm_thermal_add_hwmon_sysfs() ?

based on your comments this should be enough/right?

#if IS_ENABLED(CONFIG_THERMAL_HWMON)
    tzdev->tzp->no_hwmon = false;
    ret = devm_thermal_add_hwmon_sysfs(tzdev);
    if (ret)
        dev_err(&pdev->dev, "error in thermal_add_hwmon_sysfs");
#endif

if yes i send out v2, at least it works on my device

regards Frank



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
