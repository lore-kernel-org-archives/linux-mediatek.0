Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B39FC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 03:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gAysW166qthpFtRZ9EW6Y4KLPHdWslBVungLYLisyNA=; b=saUnEgnwx3WbxtG9TCnGIDUWRs
	M5DRqJiAxFLBCaOYX/NsmrL3EM5wVi/MtGVc3eTIbU7V5gvTJ9ypCjPzCQcXUpS/G0lGEejtEM3kD
	TAARF/h1tTqrT+3OLJM12IC18Y9yWlQF22cqM7+OQ7D2Aamjpzaxugp8EiT4SXXkJjH2Mnh3ZVsP7
	mBVRWSeEdhOSXXUWsAzRD9b2fRicKzFx9OHCFmLDR1UIkF6q7Pf2IEYzDdpfntwQlo4D12UQcU9g/
	jIeez51jPlxQVTTlzt6J/WZjjcvDcsFcwv2EDVvlgAmG5iH0/F4YwBkLdmSVKQ2BlO/z9+bb2SGkt
	anFZ37Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owx2f-008ckp-MG; Mon, 21 Nov 2022 03:00:17 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oww1l-008JMt-Up
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 01:55:20 +0000
Received: by mail-ej1-x631.google.com with SMTP id me22so8764197ejb.8
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Nov 2022 17:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gAysW166qthpFtRZ9EW6Y4KLPHdWslBVungLYLisyNA=;
        b=ZRBRWoq45blSrBIsZeUEcGgKoTyiBsBgIbXIx9gBoRXZ3isfHzKRuMWAbHxfMZ8Ria
         i54KoxOXJgcZuR8kWiDXANkBtc+D/hKUrwzPYAgFY6v0H/pNeGBmon0e61yaqt8dLCUE
         7xjjino+23/7fckPFV+kZ4ZY3/cuWFTqAXQXka6YpIjKd1mL8MFeZGe9HDi2tX5nxlpW
         TA/xPPa/OTtGS/rfl4nvqC3t9lLHhE15qs2/KT1z4m0LWJ2lvwntAH3ez/CsVT3hpmVP
         pTNjzUL2GEyzASGG4cdhrihanSEjbkGw64DH875rnxT0t60KpikVel093FHWvLZlJtpn
         GQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAysW166qthpFtRZ9EW6Y4KLPHdWslBVungLYLisyNA=;
        b=Z4ZKOYlQ3TB2DAaTz6ev9Xo48n/G9aAie1tmnDBdLHK05zpauwvh7ZQ/vwkTUrK8NJ
         AXpqjrLz8lSTdGgK5y2rALhzyg/P3ePOqsYfsKxi5X8kB1YABbiRXLvyQoHZgczz4zrZ
         NWxjHun23N+05KevwlcvFY2f2g29BZLL/ioqdeht8DNhYP7+Zh3D3r8mVTrz3wUH1mKz
         LWZG+7eGpgZzmvRbJPh9oPGMotsHmnT7L/CJ9DNQS70J3wa3fJYmRrlJQxDw6souHZ4q
         1Tbuf1b9MHsIiz3ZdeKRRwAuKsjECV6YQMoiqz1mRvp1d2qkAKW7bGKb4/nFLXwTNLDh
         Ws4A==
X-Gm-Message-State: ANoB5pm35OeAwtth1YZz7IS4xrfvn54v19bkNjvI3dW9s6pkp5bi6Zut
	BNuECy/Jn5I0jQqKBRUKXDKaHg==
X-Google-Smtp-Source: AA0mqf42ju9Ig9HbCEQ5Tf/VyWWVHTWoYqPNy4F1KF/X0xBB0zr44Zdgv5HAUw2wXJEHDsc4lmFxWA==
X-Received: by 2002:a17:906:34d0:b0:78d:c16e:dfc9 with SMTP id h16-20020a17090634d000b0078dc16edfc9mr13749226ejb.327.1668995706654;
        Sun, 20 Nov 2022 17:55:06 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 17:55:06 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	khilman@baylibre.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	matthias.bgg@gmail.com
Subject: [PATCH 0/9] Remove the pins-are-numbered DT property
Date: Mon, 21 Nov 2022 02:54:42 +0100
Message-Id: <20221121015451.2471196-1-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_175518_314674_5A95140E 
X-CRM114-Status: UNSURE (   6.57  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

During the review of my MT8365 support patchset
(https://lore.kernel.org/linux-mediatek/20221117210356.3178578-1-bero@baylibre.com/),
the issue of the "pins-are-numbered" DeviceTree property has come up.

This property is unique to Mediatek MT65xx and STM32 pinctrls, and
doesn't seem to serve any purpose (both the Mediatek and STM32 drivers
simply refuse to deal with a device unless pins-are-numbered is set to
true).

There is no other use of this property in the kernel or in other projects
using DeviceTrees (checked u-boot and FreeBSD -- in both of those, the
flag is present in Mediatek and STM devicetrees, but not used anywhere).

There is also no known use in userspace (in fact, a userland application
relying on the property would be broken because it would get true on
any Mediatek or STM chipset and false on all others, even though other
chipsets use numbered pins).

This patchset removes all uses of pins-are-numbered.



