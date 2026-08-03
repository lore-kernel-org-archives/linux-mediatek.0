Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B35C55184
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWFicEK01U6Ib303mAzU47Nrzec6N90vhxPL4yip0pg=; b=we4JOrWEZsXO5GujGZf1SoEXaf
	7FgPxYmqMcuk+DoSKsESbJ6H2LiQIH83mVIIhJqL86xSRlLFFLVW01lCjK3feWVhZMDDfF3HTUhEg
	kd2nAi1Ne62we0jFSR1yc3VWiA3SE6j1i9pEg6yXPFDv+3rkoqSwHcHnMPmD7Q8ZrAMoQJeiNkexh
	ilwaKqrkh61Ra+ZNlmhKZfoVxcS/PoIkH3NL6gubMsaYoWvNGigO9K7IUodBsnzLgipEuPHg36nMt
	alVELVrBoyPwIc+7WJL6QeBfFn9HC/cImrloHpRJKVp4jGOKPr7utreeEeVvWUPW4cesQv9fwO7XW
	WDmIocSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUT-0000000HKEX-3u5F;
	Mon, 03 Aug 2026 14:18:05 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUR-0000000HKB3-3ICp
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:04 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3811f512167so3468794a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766683; x=1786371483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zWFicEK01U6Ib303mAzU47Nrzec6N90vhxPL4yip0pg=;
        b=eWeWpVg+B25Kt48JOpVvbuzXeOPyER+sbdLwkTY+TFj+8Ebj4QdvZnoneyRuqlUcUG
         z1xWrGa77O7WN1LAwA2oUEa2dR0W8/iiLbQoYbeQ50Vs02h4tdfQwSP/TvhJFqGoV9MB
         T5yDyLpO9Zuu30f5YcAL7PR0c0kSyvH3/BeJJ8gAaqyBureIwPZ8oxjbyrQRcC8up7/0
         b16nlJMJIT+Y6RaNm2x36M03GVJa+t4gSY8Sq994hTtN7OwQk+gNrM82xUMn+KW2OvI8
         rK1kOfjlg9FOrHKztU50JsHGaOt1IqI9ieZfwePEg3BgU3eInwZ9Nn5jyNklrom3QEvI
         WYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766683; x=1786371483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zWFicEK01U6Ib303mAzU47Nrzec6N90vhxPL4yip0pg=;
        b=HVW6D54PvJ/3A/gRy/niXCQxw9yOFjL52DTsXb1LxEcilYfjb5g8Z64IuutZH8q3E9
         uOAKx5moNtZI0yPUPOJwn2FspqsafT9NxJvK8d8x3VsgcolmT/uGUR8/0X5RkaQQOJLl
         UFQDsNCdvIzeFXhGHZFOwO1arPcuFjM+oOl315lTs6tMs6jbRjxjj9+FRVoC7uhsM9u3
         9Xk+ORn0/TnlxRnMyp+qqwyuESI62InKSb8Ch46ly40E+V7qDDKim7xttx88pyrelNl0
         OSWdpdod2qyyaE8jl3ze76w/1L1lmn2qyDGHynhCCBz/dBu2vyzMBYbqqRn8MJ86UWr1
         BIbQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDhCIEIc655fPLWRSBQtlfsljzNKu0nlFDtzX1ZI02DdFbq0vFAqd4DhFQUhfzc3DW2mAkxz9aubaInrQTLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBHraEkNEx8sgk795ehVftg++odEZtALiUvi3OCTDX7iJSZrzt
	St0fY9bhh6wBRq7oFWf/USLXF3t9wHr1bo5w/qaBLR44oM27ta2peOA5
X-Gm-Gg: AR+sD10GD65/8jVD9bzcOYCNONVEKtz5mgF9ML4rc9lSqoGNsWdzqZO0TcGN5PzDZAn
	VPMGaNqzpNOwGPoJMN1HQGgQRf+DXJjIaNdY4iaqg1/c0lZd/Dsu6RVgsRoFjQGuW6N2QaEf3tu
	KgAmIdFapRIYhWrD0MvRorVzVjKsDKt6edCuItM/ATJWN+/AdJNPe7wnBBh05rGOezJ/qgrIVOL
	/GfOxUuMhJ4exmPt84M0zEQ1+15SJptf7+YWlPrXqiagAKQrSHeyfngLTrSNLmSUeLPsUSKo7R4
	Awrv3g0aZj5asXkyOMHFNz90qnGn1wioSbx3/nC8mYSU6HlvE85mTcsGJNrxR9ReCCd+dht14om
	d6DqlrM6JRVX42v/20TNq/CSBh82gVBIM9PJOqmpfwKoWYCwE3VgfGb8YJ6UJbVdZUr3yrUJ4fk
	cFWBnnuDHyCdRBIs7T/3KWGh/jw/2h7A1JAUA8bg9n4yiBh5uvR4MX9VOYI78eZRP1IWieSZaw0
	gRY5r7kytCy5sYNCoGM
X-Received: by 2002:a17:90a:d445:b0:38e:6a30:4bbc with SMTP id 98e67ed59e1d1-38fbc53109fmr9002290a91.21.1785766683087;
        Mon, 03 Aug 2026 07:18:03 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:02 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 08/32] clk: mediatek: mt7988-apmixed: Add missing MODULE_DEVICE_TABLE()
Date: Mon,  3 Aug 2026 23:16:35 +0900
Message-ID: <20260803141659.559129-9-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071803_856559_0AD6C053 
X-CRM114-Status: GOOD (  11.71  )
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

Add MODULE_DEVICE_TABLE() to the MT7988 apmixedsys clock driver to
export the Device Tree matching tables.
This is required so that the clock drivers can be automatically loaded
when built as modules.

Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt7988-apmixed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt7988-apmixed.c b/drivers/clk/mediatek/clk-mt7988-apmixed.c
index 416a4b88d100..24f4e7b87a31 100644
--- a/drivers/clk/mediatek/clk-mt7988-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7988-apmixed.c
@@ -75,6 +75,7 @@ static const struct of_device_id of_match_clk_mt7988_apmixed[] = {
 	{ .compatible = "mediatek,mt7988-apmixedsys" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_apmixed);
 
 static int clk_mt7988_apmixed_probe(struct platform_device *pdev)
 {
-- 
2.55.0


