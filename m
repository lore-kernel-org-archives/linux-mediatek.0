Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F295FC55182
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13/m9BHJpTOrbyiXp3UlB7/KUp3A1MVFY837aXZLXF8=; b=ggqqp5POHXazWQWn0VwrHg2QUC
	aMmJOh5+4jBirNUlomUs4WuOo6rSsE0YOvXOuwKMCSHcRnPflrzSAh2mU9vCoIWiqKm6lcZVQMh0M
	ilMJ6fUZPrmz9ha7961TPIRSuMxPLHQc/wFkpJaY9dje51ZcQmYOi4VRw+pE1bJdG68YbehuciywH
	8rbz1K7V6d9yJKElLf2zV+HQT90U2uSeP3X11uA0wk7OzU2tMFe7kJfAZuEdFJEE4y4lRLbfcOec/
	wxW6fHmKQA3oZUVptYE2Uvuhr0AtTa5w+BlorJG0HR6P6iahdTApYXgzq9rA/u/xzYPJzNOfOzCJm
	e/ITCj0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUC-0000000HJs0-03zs;
	Mon, 03 Aug 2026 14:17:48 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtU9-0000000HJpE-3lFl
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:17:46 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3054624a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766665; x=1786371465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=13/m9BHJpTOrbyiXp3UlB7/KUp3A1MVFY837aXZLXF8=;
        b=AmOv6fTu/Wl1DypXFSoDRkYUbA33kl1mDcsfwTbyeCfny4PX3uaRzm0HK37GSy0C/t
         fEwInwaacj3DYwguIuKhSeVMFBaUS/InRwOciSi7vZPMaC6wQDLJ8Jc9Bito/kVbawUt
         rQKBwHx84M8ENZ2CguJpskSmWlLLRHqZaFGHakgpyIV22VSPzN5dBnoA/ElLT0s390G1
         WoKUBuZ7fHGGpgUTpyGu3y24BPqG/c6kJSBWKfvby0YTrrkIm6izfnzGk/KTiILcOXx7
         1VkeuTnCr2wdKcyKUIVcSjlo7CW8/REheLDD0w0xm1NrdzzoI8Rlu3quOAMUHxdUqASZ
         Q8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766665; x=1786371465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=13/m9BHJpTOrbyiXp3UlB7/KUp3A1MVFY837aXZLXF8=;
        b=FsPKt/sXsSShRypKYx1V+swxymbY/fVEEKB6sqal/CNXwcmzyCKs6JQeDWh86qkLtz
         7xKmUDB6QaCZaWCTUqjGdL+Vz6Y/5XuAKXcCW9rcc4PEKLVciSo6p4onxwCTIQPAyY+H
         40QUOMd68YAnowjSupMGa9HZymXwmKdShKAsoW45lOSQHEZ7404a4V0GM5edClrNQBlK
         MH3VgkMNt0njp7T4gEyGBWmUyZZqhsJ9JgAQ35A9WSoJjpexJuTm47ONX1Bqx/0cog/9
         kGVWIF+CxuXR9RuiWD6BIbBGwDMVxyWP4Wrp63NFK8e1INcG0evglsBLlUqSgV90sWnQ
         tw5A==
X-Forwarded-Encrypted: i=1; AHgh+RqqKcf5p4S8wnSDXMpupQc91xigaHruXhrWxeFU1CopoOGEPPLd6i1Fswgq8vDRINV+qk6tx73bLKx68VsJJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp9qn03HqRKYz8fBhcM3Gltb7qCyeameMcGOndthqS1imCFYf6
	13mkuH/15mOFSOSImHEZlz+CHOF5V6PJwcOAZ+MK+f4PpCCJeiDfuLpu
X-Gm-Gg: AR+sD122/EJJ8tir431odzFm0DWEEJRvNOAFdobdVlKS39RmT4uDPb7wLGHejaTT5C9
	/26SmR2RodM2x/1tUO60vhzzGSv8biYGrrBhiH0MH5wSej+zLECwPRjhFXaWDcnDUGidO9y+LvQ
	/ipX7f5K1h4ba2atS2GFWFv6/9O2/Qqin1UPpu+vsVVuCEQDZNUAy+xnOuaqnZaEUW4HTnK3saY
	ivVMDpYCHAsF8b7mpUnwGCWkkKRtfu3RElC9qLwBjhmcsnuKXaB32B8QG3rf/yO1zynCu+lgvgG
	3xwdv5KYjTcuYxoJGK0r4dhhH6HXZoM6NfPc6K8U4RXPaGCknDOVVIFDwB/9WZzg0eb1iBfmUFw
	juIOQxuiu9bJz2SW5dGnzFhXCyI7EEMK+vc5zI5v3MmWCHcoMyZlUoMWrJgZVlO05UcHospEeAu
	9a9WWgGDknqFhzFFrrqmepnCG2sIKE+0fjcamjx+gvgUO8l73CHOyRdZUqU77Z1KYXUmoGq6wlZ
	s4y2fdVq+ZeZ5A5Bixv
X-Received: by 2002:a17:90b:544b:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-38fbc3fe415mr9386869a91.2.1785766664794;
        Mon, 03 Aug 2026 07:17:44 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:44 -0700 (PDT)
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
Subject: [PATCH 04/32] clk: mediatek: mt8135: fix memory leak on module removal
Date: Mon,  3 Aug 2026 23:16:31 +0900
Message-ID: <20260803141659.559129-5-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071745_940556_C1067687 
X-CRM114-Status: GOOD (  10.75  )
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

clk_mt8135_apmixed_probe() in clk-mt8135-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt8135_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 54b7026f011e ("clk: mediatek: mt8135-apmixedsys: Convert to platform_driver and module")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
index 19e4ee489ec3..e3b7dc13b458 100644
--- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
@@ -66,6 +66,8 @@ static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_plls;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_plls:
-- 
2.55.0


