Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77166606A88F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 20:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TrlW84rx;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kVdrWS3t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KG0frz1qgVuhICCz66saxxD6xAtI8Ts+CPzc9aA7q0w=; b=TrlW84rx99L0F4d7KLgJh3/uaS
	Kc9K82PsYfXukyr6uWY9TmwrfwGn9Sod9ek5xKYjecd/pVGIH82P9JN1kcgya2AZXATH9XSM9ffxa
	05IjUxPvci8jSSmyPxBuyXnG31WKgFzlDvT/Tp9feXI8UdupLtdM35n9JdKko1J+o5hL+LZq+X7i+
	Gl+XaYXMiEnEPyB8QTcYoM4ybS8jR99xvguOEuq+pAYnQIAS19/8N7ZCESUYCshfIbJNbCvQRJb+V
	1/HrJO379fp+lYjHTTWtvbGqj801YWxF3lsJKzR5BeY44Z52AaJehHPz+m6QWFozzf4WiKkn4Nr8y
	oFsh1foA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxzR-0000000ER47-093X;
	Fri, 13 Nov 2026 20:35:17 +0000
Received: from mail-oi2-x08.google.com ([2607:f8b0:4864:32::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxzM-0000000ER1C-2bgY
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 20:35:15 +0000
Received: by mail-oi2-x08.google.com with SMTP id 5614622812f47-5187c752f46so586238b6e.1
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 12:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602111; x=1795206911; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KG0frz1qgVuhICCz66saxxD6xAtI8Ts+CPzc9aA7q0w=;
        b=kVdrWS3toUCzfL/b3q4lE7BvDSYBiKxuYk/WqZANN9ZJ0gYtG9CYZdZNCSbCSi3SVN
         adzAoygS1mb/zyj4QFQBcVqsv2NFRt0vrT3v5ZdR/Tp7GbOdlOb4tyunJzgeGn5Ejzns
         bg8iWUdHZZtvKtQFGCSQLh/BnarQoRTLpONnsxSnq4HD0S4QrWniyXDrJfZaN1OurC9z
         g+FHxPcMFCmDHB0lWK3SpWFtDKvM8e5scZONIpF9KEB/7ga8wipeKuMhGPBzSjTeYjI1
         PEDJFqF0Pg8RVY6s9if4uc9jiPT4PFW69s53l+bUDT3HT6jjIGKnMG0VyKiSbfFkeD3p
         /1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602111; x=1795206911;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KG0frz1qgVuhICCz66saxxD6xAtI8Ts+CPzc9aA7q0w=;
        b=z9XkxW94BwC94rnjMOcT8LJv13Pi+ri+cJTFEnI2yGsKBYOaLOFZTOJeOmphcy8ufq
         OocfycnAU3ZGdwp30Tx2tvdh8qSFhLnKGqdh1ynjKWQTI/3ebK/a30ZuzDoOUkVQ+MzQ
         ZUxbWbDozIAw1+kWoXs79HOo7p+SC7Q3uYwByUTAJj5wLXeJVsbGyx2IBKaFG4MLonRS
         5+z4IBTjGk1nhaoBe55VMmQARpL5rR7TCcMYr8TOKaFb/Ogq20+eMVFaiymykLGL/1Fd
         pVYNgreobNflJvXI3DJtiNLjmnUr1hkKVCHidc6fwq+nf6qYGfbNdPNoGi0CH3cQXbq9
         uHzQ==
X-Forwarded-Encrypted: i=1; AL+hErEqTOeMNAdJoSHidU+PfzivIkiJR4WdqqLvtOYBPZfK0pKQVe4im8qb60BD4UbcIoasig7Ttw2vH9ZcgHDE6Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z931omSZlrg7Hr1UbzXnCyJamLJyauizqO7GU/PALQLuBg4Y2Iv
	Lvyl/cjJNhI7lYi9d/f37cefVxrjIsECIsBuYUMrLXbsp0flKl9OmyTnbTP193+NmW1AfA==
X-Gm-Gg: AYBFou1ql+Bv+VfZNEsq0lpCIl5Y3cd2Swilb/v+TuowlAOBML6W8SEjaYNqY4f/liK
	/9zdV/bIvRNrTicz2iAJTIlH02pFa3C72hswax+IVImM9krAi00d6sT0Zo/OhT7uptk1OHTNo4k
	Gl0uCwlKX+apcaNtjaHjzUjK5wCz6F4UhkRw+Z+kXcJHqHnmUGrMCEryj5NnV7cZSyINkfhO2Xb
	wFJxlAmtReJUR3zr9lIdkSFBYHT4TpRKqo+ygLGZJ/11k1zlbeCDYw5OHQ/6tWdLkfA81uCStGB
	ql6WUUJvkMvbT3ogQN95V6ZnWkBzlwY26spafPPmfxQR8jBrbcn4XnaCkkXTnRZ/ri5nqL4e1NQ
	qk3MNdDnnV744jYgcNwdj8eCbpCO5fIqxVzIUAMNjQJAjpNRTTzUjPobAlRiJ0bAw3+F2YabB49
	/ESi+Bqs+Wog/tIzmeG6s6+hL15p0ICKj5CN5hMvleyXtSS2q3I/2GBKQiae5DdZQBoX2SLk6i0
	f/NYkRIL9/exyBlitJhne+ZtSXwknh5+BufD5J037qxP5wfajeCFLz9DHLsibnxrqrEipK717qN
	XtofNA0ccpdEl10NNnPlVSftHSpoce0Hoiy778YvJdla8wrkeacDL3pZKSHEL05IUTVpDeIp+Pz
	M2rlDNElnDjUjmPwHKqU=
X-Received: by 2002:a05:6808:1527:b0:4a3:3108:866a with SMTP id 5614622812f47-56e637950e9mr3481169b6e.17.1794602111487;
        Fri, 13 Nov 2026 12:35:11 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm2712225b6e.13.2026.11.13.12.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:35:11 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH RESEND 0/2] clk: mediatek: Fix FHCTL DDS mask widths for
 mt8173, mt6795
Date: Fri, 13 Nov 2026 14:34:54 -0600
Message-Id: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/42OsQ6CMBRFf6V5M8+0RQGZHGR10NEwQFvgqQXTI
 mII/27AH3C9OTnnTuCNI+MhZRM4M5CnroWUiYCBaoq2NkgaUgaSy4jvhUTbJyIOsaIRtfZoC3/
 HN+m+wUiVsVBRZbZaQMDg6UxF4+q+wjm7ZKcj5L/dv8qbUf0iXsiGfN+5z3piECv/R28QyDHUX
 HG5lyrZqUNtC3psVGchn+f5Cwnp5IDcAAAA
X-Change-ID: 20260912-mt8173-fix-dds-mask-width-6cb71c6fe4d1
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794602109; l=1971;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=SOLu4jzxQrQXcZ93wAkCZjEM/VLMoV7Mr0LjnwhotLc=;
 b=fFa1XmGpk3uBIN1Zz6dT/QjiYTDVTbfEew2GPALp8trqTIHfGKnKk9edIoN7tUBqvwxjac2jk
 emNoj2NFPYmDGP15GLsBdV+AHx657qde8qsIrnkzqjM7JUqLtbxn51N
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_123512_985361_C84052DD 
X-CRM114-Status: GOOD (  14.11  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Discovered this while working on bringup for the Amazon Fire HD 10 (2017).

In f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping
through FHCTL"), and 45a5cbe05d1f ("clk: mediatek: mt8173: Add support
for frequency hopping through FHCTL"), the DDS masks were set to the same
GENMASK(21, 0) as mt8186, mt8192, and mt8195, despite not having the same
pcwbits (21 as opposed to 22). These two patches correct that.

Tested on an Amazon Fire HD 10 (2017), an mt8173 tablet, across 6 MMPLL
rate changes. All of them timed out prior to this patchset, and all of
them succeed with the patchset. mt8173 currently doesn't use FHCTL, but
this will correct it for the future in case it does get used.

I do not have an mt6795 to test with, but mt6795-sony-xperia-m5.dts is an
actual consumer of the FHCTL node, and switches it on for mainpll, mpll
and msdcpll. If someone has that device to test the second patch, that
would be appreciated. I do believe this is the correct fix though
regardless.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
RESEND: no changes since v1 [1], rebased onto v7.4-rc2, with Angelo's
Reviewed-by collected. Jerome noted these go through Angelo's MediaTek clk
pull request for 7.5. The Assisted-by: LLM trailer is dropped for the new
contributing guidelines.

The patches were still developed with the help of an LLM.

[1] https://lore.kernel.org/all/20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com/

---
Ryan Brue (2):
      clk: mediatek: mt8173: fix the FHCTL DDS mask width
      clk: mediatek: mt6795: fix the FHCTL DDS mask width

 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 +-
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20260912-mt8173-fix-dds-mask-width-6cb71c6fe4d1

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


