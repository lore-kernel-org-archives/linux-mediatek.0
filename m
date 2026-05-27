Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFAACD5BD5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2026 13:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qqn/GhtdZ2zHm2dhsjmzQoC4+5EN3BPsb9xc1JJYgSU=; b=r3cNOSawMwho5bzqyBVI6hyJMB
	R6So1D9xJWkdOUTeBWLp6BGl7Z0i6QuqCMdmVmzWRdNwdUnZgSCsCW9RI3Uq4PoxJ4IZeLtbGeLaQ
	+nr5fAqwWr2j6LsRdk76g7XEChsYGYVSXU4dvCit6ARcM1I6ROSirjP98sVO7xuz2HgMZtKj8dRsS
	KtCrhcyCPUQDq9/3fNfXtDBcF6p6tuAN3bFgMek6f0FR9hfJrAUB9j2Hdyq+F3riy3l60QmPNbpQ6
	//IkA0hqMoS5gGReOK0x1nU607w/MumHCLGOruV+tfJWAoqIeIB6e9LRW+R06BKSEBqO88hl5s0tZ
	xww7KVTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEmI-00000004FcD-2AXj;
	Wed, 27 May 2026 13:58:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEmH-00000004FbX-3pWc
	for linux-mediatek@bombadil.infradead.org;
	Wed, 27 May 2026 13:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Qqn/GhtdZ2zHm2dhsjmzQoC4+5EN3BPsb9xc1JJYgSU=; b=Y/i/7Dw5ERFncTve74onJSDqRu
	u8Zc0pcNh9tS7fLA8LVLFj3YQ1vXXC48KZmRWeWDw3iqFwgHd6mJws+01sc0r75q+G6T3o1x8NLtr
	eEK5646pyGd9tUMW3oBHbP7ATMx/F5w9FRbI2zHtZt4S9vFTZq/zxmVMPY8LRf9cYKrvc4WmEtwad
	0LcVARKb7pNOTiwuYm1ZjKDwXdnCmPM+Pv9HcJRLXebgQSX9rK7QXyFF0ZYf1SktJqeK3BK431v7G
	JZf3OLQSpLcKnFiNUnFzeE+PoUfVwp//NvPfVy+ehhCWnodTNAFCZ05XqbfbXa7Hltnmp5ub3LYOW
	+tGL27Eg==;
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEmC-0000000E78J-2ZnO
	for linux-mediatek@lists.infradead.org;
	Wed, 27 May 2026 13:58:31 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-134fe980658so13407145c88.1
        for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2026 06:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779890306; x=1780495106; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qqn/GhtdZ2zHm2dhsjmzQoC4+5EN3BPsb9xc1JJYgSU=;
        b=meyKPQwTdsYYfzpS1JLjVRAjkYFQMFCXRjKDpi5xO/0hnTElCt5Cyl/LhwLjd3fUqZ
         1nJLdXdom5eqd/9Qtbgc+GzAL0v7F6Y8JQeL6OtSvY8w68zeXLoxcNv+HxEXrZbUWIAo
         LqtTunlDx0M5IAT8xyyDC3fDaCr5wYbaNY9XAOuM624UrdWzKn0LQHrfZrpM2eV7tuzG
         KMv3MHlZeYlR/uYFQg96TguuorCoFZNytMi5RoDJLXEHVE29tIX2kCCMYOrMXnaP9qOB
         upowk6eN0EBJtLqjOhhnEUY9nC4G+AdKMn5SwftvHjBnf+o1vUT7IXssmneZhM9acriF
         ONqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890306; x=1780495106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qqn/GhtdZ2zHm2dhsjmzQoC4+5EN3BPsb9xc1JJYgSU=;
        b=dEKAlNBpRKpbGpmbu4l1OV9HwtxiMv008Zj9ZTGvxETTSCapmOj1fy9gwLSwE8gilZ
         Iw3+8+pYhGmWgqiF+moJ183NLye71vDqeZzCNc67m1qwJ+kKqMpXKH9L+OspS21NSNio
         yEVAA6N/QwkLePl72y/416VVPwpDshDxhl2G9nzB8FTxc9VauXtjUf8SEKLGC9GtY3if
         bKHm8p9AJcT76FrPGqCB4iy0pc9TDnAU8ggewJ1omfK9F0stqhul+6NZhf7jpONPbWfK
         yGZAUbUQxaoh1Krvy2UcURRWikCAyHlQFUeyiLmTUKjrONNr/O8CMd/k39VluT1+kH24
         O0SQ==
X-Forwarded-Encrypted: i=1; AFNElJ8XKD/yh0LRSuuHeW9dxxVo7XiJnqZoiR+qk514P7voQrfvebfe5eeOA9sK2TgxqGYtqo5IEa4QwDVzbrk9tA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxbHY9ImTiHfnTk1m0uXzRE7aEamK40y36KsUgmcggeK1zn4+4
	6HeWt/KG4cIXtuMw55g2iaepb21cEqjgbnx0u4GKeHe/MwtW2qyTUFOL
X-Gm-Gg: Acq92OHxBKPhECT3i6mpbxoc4vaHy8171N/C0cq/Y0JK34pBthayoejijqtCvtRD3iS
	j2vwiHFNriDrTrl4OgR2x6ZbNjS2swSyFjKAfqOwTAXejrbcAdWvJEi+Jt67yB5ZQjljo20OyGA
	JpUNOtr5bd75ikS+BG2oWqLjKK2D3/pdBqAZxQ1tk8Lk+THob8klJ4pM59OExkhQh9SGWJd73Jv
	9Pder5XHixNRAF2RS97Nk4y/pp2T2tf6yueIPQgJDULMMDx0ldABGxALAQtSpgbGLHabjsWch60
	l5QsGIbl0w3aPx0O2t9aGRqLSwLMYhAVcM71rd5K3zCIj+LfOkYXGf1NcyPpKJpW0SO4gGvhQ+9
	nICpJ5Y8ful3bSe3ddc3okM7+YPa9WbKOuTqxeDihxnGlT0zlVvWLh+j9sri6OUeTKcnLD1wseM
	yxrsmouPgiZTImUlwTaFAryvXx+YFMZZrUP2+9btCWy9NrRkgyWsW5K7TTcR4V8tLuO/k3wxMnh
	BQ89HLBL42X
X-Received: by 2002:a05:7022:62a6:b0:12d:de3e:86b9 with SMTP id a92af1059eb24-1365fc6932bmr8295204c88.41.1779890306165;
        Wed, 27 May 2026 06:58:26 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366aba2b9asm13013788c88.15.2026.05.27.06.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:58:25 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 27 May 2026 10:55:47 -0300
Subject: [PATCH 2/2] ASoC: mediatek: mt8192: Check runtime resume during
 probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260527-asoc-mt8192-probe-cleanup-v1-2-1bb834d05b72@gmail.com>
References: <20260527-asoc-mt8192-probe-cleanup-v1-0-1bb834d05b72@gmail.com>
In-Reply-To: <20260527-asoc-mt8192-probe-cleanup-v1-0-1bb834d05b72@gmail.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2026;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=AiWKUJ6pcaS+s2EMRR0lpjZ6dv0VklPnVPvbjxXu/dY=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFliP4pklll4m/lM4s7ZEHO7aHXznfQp56/39sv0p7Ap3
 3zr9uJQRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEzkyDZGhqXrhb+oauy39J/t
 8NiuduspzslHDBLFfp62j3380CxR4xbDXyHxP0ruxx7puPtlON8wPb8vSjhoa8qtDba7ZzC/XBL
 rwQAA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_145829_037966_709B90D5 
X-CRM114-Status: GOOD (  12.20  )
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

The MT8192 AFE probe enables runtime PM temporarily while reinitializing
the regmap cache from hardware, but it uses pm_runtime_get_sync()
without checking the return value. If runtime resume fails, probe keeps
going without the device necessarily being accessible, and
pm_runtime_get_sync() may leave the PM usage count incremented.

The regmap_reinit_cache() failure path also returns before dropping the
temporary PM reference and before clearing pm_runtime_bypass_reg_ctl.

Use pm_runtime_resume_and_get() so resume failures do not leak a usage
count, and clear the temporary bypass flag after dropping the probe PM
reference on all regmap_reinit_cache() outcomes.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index 9f5057eeeff9..db0ae44a86af 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2227,15 +2227,19 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		afe_priv->pm_runtime_bypass_reg_ctl = false;
+		return dev_err_probe(dev, ret, "failed to resume device\n");
+	}
 
 	ret = regmap_reinit_cache(afe->regmap, &mt8192_afe_regmap_config);
-	if (ret)
-		return dev_err_probe(dev, ret, "regmap_reinit_cache fail\n");
-
 	pm_runtime_put_sync(dev);
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
+	if (ret)
+		return dev_err_probe(dev, ret, "regmap_reinit_cache fail\n");
+
 	regcache_cache_only(afe->regmap, true);
 	regcache_mark_dirty(afe->regmap);
 

-- 
2.54.0


