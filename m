Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC9BCC6B1C
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUYTFLfF8KyYjB9jrAOG5HypNcpJe9ONDAWrxzRVXzY=; b=Y9yIsq73xRkJJAwnkstlUzlITj
	Hgq1dXgn52oXAOxtYXxUA9wfucaA1DVfIdxtYUmz1l5z19FXYz1ps9/xe+GKkP9FChoPRzZxZriVN
	9yTsKEeFb2o9A8Kt0y007kb1XPIuHhIv/gsvmqC24wovbxVVDfMfroOrBFqdtbl3s2z4eyR7TD0Li
	6Qj4eGWR/hL5t+mY+f9O1S0sOLUZ1iRVRpfyc3E61wxj7f7tdPJbnWZXeDVCzYHwRtrKmuQr5RMy+
	sOW2kA7p1K0BA/O6fZ1XXQq2WttWyGgixlUbLNGmRCvGnNAt2qA6QOGrrO4D/DrpTuENIYTP6ghyh
	rGgSJ9Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGu-0000000DG7D-0kqN;
	Tue, 13 Oct 2026 15:18:32 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGn-0000000DG1L-3dNg
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:18:27 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-881269371acso2512434b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904705; x=1792509505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUYTFLfF8KyYjB9jrAOG5HypNcpJe9ONDAWrxzRVXzY=;
        b=l/rGENL15a4H5lV6Rvo0dUt/5ni26bT5t/Of8FNvVw2bG1IXVIPxCZL6Vzjkm/g6J3
         1MDFr4cPcS56P7awPWNIWFwjFNcJFGTGcuQF+PcI6LHHS/yvW91xIrPckZeDXieLurUE
         bxQlsHIc+JGzfNyuHw+SKodyubqGXGKuWXaw6+W3hYPqXGbZrABkkRoNAZhGFH2c/FDe
         862SApTi5pWEE8GjPA1km5Bwe7iMTNkABoekLiiWphJxqSO2zwGNy7cLyML4cM55oP1E
         CrGAhRosWzMvWbgDgHFzCy1a5cXmPVTYIbRJaA+TXR/2y656D2hPpVW4r1hDqLPhBxXz
         o0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904705; x=1792509505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUYTFLfF8KyYjB9jrAOG5HypNcpJe9ONDAWrxzRVXzY=;
        b=YlqKUqflI5fYXtiNZL23N0qTKjogdvcawSNurp/WocA7nC4AuW3Vrq2F8A5azIUfKa
         FTcaqJcWFdlWcMtknGD7wBdVwWfhdq7RTaG+0WBz8R+UlMJYO2ASWXVBpEZU4lyMmhGF
         125k5n6Wa0JWgGJjtTmO50JVv9mY/IyLpfx3XJh4hQdNRrkrhx8RaL3SgeOyTdVK0Ec1
         kh1nCgbJoh5iAgwGgjfH2/dyMPNlKqcxWGoWQUr//X2hFTDMNUcO9XqBc4MYOX+6Vf+g
         jjihq5MSApbnyhdX91vymRKwWPrP9Nca7E8rlXYlL+22EjQ97mcL8AFjglUPnL8+mX7N
         /1UQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzEbDKnhhcWQwtlLPfLick60JHM01MbyA8X/f3H3OcbJgBStq3saac018L0OIEMYLHB9oeT3qNLdsPU8Sz5w==@lists.infradead.org
X-Gm-Message-State: AFq9FYKNh9XktYiTYuUVP/qaZdbrJd1e1PbcMIl3vfnrhAfMQM4js+qh
	PMjodAK52VWUvFJ+Z65RsaexSEJypEzySNW3HFvsRkuwZZjEPQI4pGH5
X-Gm-Gg: AYBFou0dpmJDqJD05sKJ6HUjCdpV2UEXvGuQO1YRP5t3grWzh6oYJDwPe3K+6bgiSKT
	X6bMpSIvBCR+3NPwUvP8hnR3fQnIs+6QXJaC3zbuhsjk/R83/0W2c610WLyX7bLfXN+5PFmJRyq
	RQXful53MgT9rCeV/m30e34CTOeDXqBmVhO8D9jym86RX6T5VmQnD47JiiCQiDXp8D6mcInA720
	7D3Xl+kHSg35i6c779TX+379GWN/0PhCO8M2EMH8nrM2ZgDraIgCfOo7i+k8kEfAGVZTyBWC6uU
	la/lOfouGoO8J/vRi/OgCCtri2+QWQK4kwH4aJbZO/rw7LYD0pP8UFogDt0Cxs9qTQGw0m4IVMe
	vd9jkjmQ03Ga3R7lSq0bWIzZAcJMic3gHigJ1ZUG5WtNAUXFsJIZeo9mU6FkdI8MWIqmyWOYXcT
	hKJgrLUtNb8HOtljI7RLyXNd6j+V7cVmK0qosEuMmJkAkjorYRknaGRheFm3VrFYj7c4r8V2Rjg
	rL6i5SBbmUd8DuyqWWqiZEhjiD9
X-Received: by 2002:a05:6372:a80b:b0:3de:ab1e:a63e with SMTP id adf61e73a8af0-3e165032ef1mr7892032637.39.1791904704905;
        Tue, 13 Oct 2026 08:18:24 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:24 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 05/35] clk: mediatek: mt8173: Fix memory leak on module removal
Date: Wed, 14 Oct 2026 00:17:04 +0900
Message-ID: <20261013151734.3177690-6-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081825_931902_A2A2AD4A 
X-CRM114-Status: GOOD (  11.59  )
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

clk-mt8173-apmixedsys.c and clk-mt8173-infracfg.c do not call
platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Capitalize the first letter of the commit message: "fix" -> "Fix"
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt8173-infracfg.c   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..65dc4489a09c 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -179,6 +179,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_ref2usb;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
index fa2d1d557e04..9b8c35897789 100644
--- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
@@ -128,6 +128,8 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_clk_hw;
 
+	platform_set_drvdata(pdev, infra_clk_data);
+
 	return 0;
 
 unregister_clk_hw:
-- 
2.56.0


