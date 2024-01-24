Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701DCC47DDF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 20:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sxg/U9D+imrfPG9jDiuL0JmY3QErb9Z9aC96KxwmCu8=; b=fR5PtS+9qHdGb6CcVwhbshleJC
	mX4BPLz1TjBGk0JfH5omE/1Dr/UzlzTSGWTBR3e11suTwnKjPswxvn4d6NBkAqcQNH42RVQBj/5A4
	xIrvmqexuQ58Np8FvRMob85/zhRV2X+eQGiHlZdX6JflzbaHLWiVIRsV5oOtwseUEhokBsf3YJHpJ
	8P9C3fyPM+Z8l0fVAOf5gfp3WcPqaCjjF1PWRP2F7rZbEeINE/jJOkhlhFZ8JO/7yJ/+BsELN8ZzY
	p7r6V8bRKBFPFKCzmrd6FgchlsY+y53dygsjryRvipInV5k3O4Mpd4dky+3aSjKKDSTGah1EWiQl8
	JN5/KKaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSjxR-00522q-2S;
	Wed, 24 Jan 2024 20:34:49 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSjxN-005211-2F;
	Wed, 24 Jan 2024 20:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706128478;
	bh=njWPHFRX9VBUYd2HwT+iNnDCR9j7CQAq4CCN3sSHM5M=;
	h=From:Date:Subject:To:Cc:From;
	b=C5JB22EqSKntWSOxCynR/3Q7KltjJGBsros94uUbGKsx1dC0xSmAdKdbrUjNOmBtK
	 /TxEDUHA4qPAfC9Pce4Z19DbgsQhTwCaPv6vY//qvjOjjjazKCkO06tkRpJnT7eYEk
	 AewFIv1eRaXAYaNbAI0YJ1aMHlZ69Av9QAkdHGVenR0zbBD1GxQ4B33sJbArvSygUz
	 tkomH6fOW9qRa3SyPWdoJWCki5VTvCr2avwut32LBGfbzp7MHm3HfRx+1JUhEYoa/w
	 sWYREUhas6l1uIC61K0kVrialRtZL1VHQDD3+bBqU4w/O2vsIXx1I6lXFbpCvpqNGK
	 veHP2lyYMhOeA==
Received: from [192.168.0.47] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5AFFB37813E9;
	Wed, 24 Jan 2024 20:34:34 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 24 Jan 2024 17:31:43 -0300
Subject: [PATCH] cpufreq: mediatek-hw: Don't error out if supply is not
 found
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240124-mtk-cpufreq-hw-regulator-enodev-fix-v1-1-6f9fb7275886@collabora.com>
X-B4-Tracking: v=1; b=H4sIAK5zsWUC/x2NSwqEMBAFryK9tiEJIuNcZXAhpqONTuJ0/IF4d
 5tZ1qN4dUEmYcrwLi4Q2jlzigq2LKAfuzgQslcGZ1xlrKvwu07YL1sQ+uF4oNCwzd2aBCkmTzs
 GPjHUVuWmfjXegD4tQjr/K5/2vh88GESLdQAAAA==
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 kernel@collabora.com, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, "kernelci.org bot" <bot@kernelci.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_123445_938424_098BD52A 
X-CRM114-Status: GOOD (  12.17  )
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

devm_regulator_get_optional() returns -ENODEV if no supply can be found.
By introducing its usage, commit 788715b5f21c ("cpufreq: mediatek-hw:
Wait for CPU supplies before probing") caused the driver to fail probe
if no supply was present in any of the CPU DT nodes.

Use devm_regulator_get() instead since the CPUs do require supplies
even if not described in the DT. It will gracefully return a dummy
regulator if none is found in the DT node, allowing probe to succeed.

Fixes: 788715b5f21c ("cpufreq: mediatek-hw: Wait for CPU supplies before probing")
Reported-by: kernelci.org bot <bot@kernelci.org>
Closes: https://linux.kernelci.org/test/case/id/65b0b169710edea22852a3fa/
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/cpufreq/mediatek-cpufreq-hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index a1aa9385980a..8d097dcddda4 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -312,7 +312,7 @@ static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)
 			return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
 					     "Failed to get cpu%d device\n", cpu);
 
-		cpu_reg = devm_regulator_get_optional(cpu_dev, "cpu");
+		cpu_reg = devm_regulator_get(cpu_dev, "cpu");
 		if (IS_ERR(cpu_reg))
 			return dev_err_probe(&pdev->dev, PTR_ERR(cpu_reg),
 					     "CPU%d regulator get failed\n", cpu);

---
base-commit: 9ac3ebaef3cc43ecd136911c44f1427286ee5a05
change-id: 20240124-mtk-cpufreq-hw-regulator-enodev-fix-f614019689d0

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


