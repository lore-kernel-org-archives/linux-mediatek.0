Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D13BC43458
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 07:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKaH37G0Ewqa53zWdK8uHBZRlRPd7/8BawFkzA4KWg4=; b=0cm2pmOuF7j0yqw4Su79JAn/Dn
	9Bdn8SOx8VdZKConhKA91uP3fQZC5Gsmde5UNAg/+E78N/RR2ARwlFpAQ16G5EuvGx2MdVumxllSf
	nmHotLBWd8ne2ay3MMP32jEdPpJTRDj2CTfBjm0dL6d/Y4udP8m5HMwqZVCxoL0+/5jWzBxYUxBEI
	wrc+wXdXh/0qii6e1jHTFl2RHUPc2bQi1L21FxrcdUO2MIlsikJ6iR3C0YIzGzlF33oB4VfUJ+RkA
	XcZMh7Mp85NDYyNdYicHVKOJpjbKTardzO92NBA2lAbUNmUqAJF4dBk76FldXTy7+cw6dIuCY9ZB1
	YGnRqFHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0Yo-0000000EMbi-1p6Z;
	Tue, 07 Jul 2026 07:49:42 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0Yh-0000000EMU6-389J
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 07:49:39 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3811f512167so3634121a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 00:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410575; x=1784015375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKaH37G0Ewqa53zWdK8uHBZRlRPd7/8BawFkzA4KWg4=;
        b=HjJzWSsj01hpmmSy80N348KbxjOXZ0z9E+Pb2ZLGuR5u+uwhiJEfznKQLDXA+S9oll
         b0daoNplnXdqMX3LLNWgx4abXmiNrnBFhtxua0mbpW5ZBE0Y+f/cKkcJJKTti/QopcaW
         qfp3FJ6bujckpvKTgq8ShKbt8kAOPNsoljsPdkA6EaIyz+BcMli3KX2XojUp6pWRsWuc
         u3ZAmkZ9z1D8OUZgJwEmDPkO4azXJP39IUJX8DFZbmMFNBRe5yL1r92LgKwemdWchqyD
         EdDVOIyhzfJ2SoKSIEtX6ChA2PLM/wgTehCbRh+YGA9CROS8Iujb3Z9LMtKa6cuz+9V+
         JcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410575; x=1784015375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TKaH37G0Ewqa53zWdK8uHBZRlRPd7/8BawFkzA4KWg4=;
        b=QSO6WKjKfxr8tAqrI+bYDFA7QPdTuH+F+dNuPoPhFvH0uOWAe40qXheWseXZJGhPyn
         FILiY7cIM9K6gTm5Z3v5VqKqOTApqgG6Mh4Em9a/zEB1VIKF6t855pkcE6q05bO0v8zU
         5MoPa7VP3RhZcIdIsc1c8mhJmD+kdQ64BBJv7fBCXLieEuuZmPbLt+a0rPLXKor/0PKh
         jkCw8FQyW1frHNDOwhdwFpanakULbdYYKPoMSDBDsRGq6fRiBzIZzlUnmUJWkAO7q/0H
         FUMp57g5Vh7GopEqKXexxs7IdM9hsY+4uIBI6AJY6OlCgeJnzDpQMDFUn90R0ZB/tsbF
         5edw==
X-Forwarded-Encrypted: i=1; AHgh+RoRFGcVhnd//6wSfLeUmBWXQo+a6Pow07zhs0FAOvPYsnrH3lIW7cpzgdfpuzfuxPxrCLF7BiadfMwgNVpFqg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1A7gM6DQqdY+uUl6c4AVAXmZnGHr5h/46oJy9baOVV3L4c7/F
	b+1/FonVYcc7WzgrOmsV0gngCdC2qDA76x9aBYv/Z+W+8ySrXZXPrn1q
X-Gm-Gg: AfdE7ckWlxTH00cTEq8UkYwXBS1/ZHsxY9+WEKc4VbwaOocTZbeJSj+nDqMxyo9qzks
	+vnrzoiw+ci/5vDh6399qP4S77vlCU3Mzal3+v8KSOFro+++O7J6SX1esByigkKf+MJC25jv/hZ
	TLZfX+2vlhmrdmzpLX5Gju7M0lsWB6bf1XCxZIpa4XUX90D6JrVYd8sT4EoajGFzHvL7YUOSr0o
	sKaS4g9K5YaZ2jssWAP2kHuRlyGGglNHLD72nySaENqGnDPgriY3XJVZJqUv/ANf9QMiXK1P4V5
	mGT57Ae4Cc2L9YJFiO1HhY07jX59RYxT/hPqdiLNcSmYyZAba94UtPDUP0BTRxJm9dnXXnRa3LX
	iwhy4inyiChY7b5uY9dRSo0AH+eh6KWXXKQFiqEuGT743d99c4U1zMb5vrvh5H4+4BLM2PZFX4d
	5lXVuGnkyYlJIVWi7z32zh3f6TqecdlKqHGDnyYMOcWz66
X-Received: by 2002:a17:90b:2752:b0:36a:fcf5:64bd with SMTP id 98e67ed59e1d1-3875650bb6cmr3966713a91.2.1783410575001;
        Tue, 07 Jul 2026 00:49:35 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:34 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	stable@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 6/6] clk: mediatek: mt8192: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:35 +0900
Message-ID: <20260707074839.240676-7-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707074839.240676-1-akkun11.open@gmail.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_004937_747561_8AA23529 
X-CRM114-Status: GOOD (  11.38  )
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

clk_mt8192_apmixed_probe() in clk-mt8192-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt8192_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 124294ff468f ("clk: mediatek: mt8192: Move apmixedsys clock driver to its own file")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
index b0563a285bd6..e6ac40e2f12d 100644
--- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
@@ -176,6 +176,8 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
 unregister_gates:
-- 
2.54.0


