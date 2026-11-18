Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215EF606A31C
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 03:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=al7YF6hF;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mwprI4iZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CRoVCX5qUvRVZQYCG7l49zxIQXQRCkCrH+z2zQB6lGk=; b=al7YF6hFvLP+qpVDGWYCiXMFB1
	DEhdPvvVlSgLr0/yzWtDJK9w3RgykCFnn3WGqJ8FbW/dvPttVIO593is2nwNmvFVp6N2mMXdYjWzw
	hmAqIpqsuFK/q8ZyglZCojyGAEJkj6tMeYGslSBXpyIXTmGsRFpZXs7JI2uWu7cDNYIOTFCIYt7AL
	XShwNE6OnAEMAQlM2pSyi7MaiPodG3atrgkH2L+EfpwDZefzYfzqXl4WrUKZ5vFlZWZOZVeDAdb1Z
	kbpTMF6fEPgbpnJle9JwWXyJio79yfMz5pyva/nahpwCdkRhwteKBWwojZFcvJlaHxzJxQ6TKnK4Z
	DuhFpy4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWZ7-00000007f1R-1gFv;
	Wed, 18 Nov 2026 03:42:33 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWZ4-00000007f0f-1UTe;
	Wed, 18 Nov 2026 03:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=CR
	oVCX5qUvRVZQYCG7l49zxIQXQRCkCrH+z2zQB6lGk=; b=mwprI4iZ+CbiDSDsWB
	7VgMALErBQDHw1E7HMN0ODI8mXbWwx1x4+ZM5kyOlT0O3kjwoJR5iw0GjwQr6i5Y
	faUNia3AAIHABG+uZynxk434tCUYvIkQgGEN9XzP2/Pk60LHqwGWwwg5HRNamu4e
	gmoOHKho4LRzPUIGipKrGWuEk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDn38CPHv1qYqpgIA--.57100S2;
	Wed, 18 Nov 2026 11:42:08 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hector.yuan@mediatek.com
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] cpufreq: mediatek-hw: Release resources when hardware enable fails
Date: Wed, 18 Nov 2026 11:42:05 +0800
Message-Id: <20261118034205.2002363-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn38CPHv1qYqpgIA--.57100S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyxtryxJF1fJF4DWFyUWrg_yoW8Kw1xpF
	W3ZrWYyr45XF4qqw1xCF4DuasayFs2y345W343A34Sv3ZxAFy5W3WUuFyUAFZakrykGF12
	yr4rtayxuF4kArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piJ5rxUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7RHFNGr9HpGVjAAA3M
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_194230_816983_29A031E6 
X-CRM114-Status: GOOD (  11.47  )
X-Spam-Score: -1.8 (-)
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
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If the CPUFreq hardware fails to become enabled, mtk_cpufreq_hw_cpu_init()
directly returns -ENODEV without releasing allocated resources.

Reuse mtk_cpufreq_hw_cpu_exit() on this error path to clear the hardware
enable request, unmap the registers and release the memory region.

Fixes: d776790a5536 ("cpufreq: mediatek-hw: Fix double devm_remap in hotplug case")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/cpufreq/mediatek-cpufreq-hw.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index 2c57371ad502..65f15fe935db 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -289,6 +289,18 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,
 	return ret;
 }
 
+static void mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
+{
+	struct mtk_cpufreq_domain *data = policy->driver_data;
+	struct resource *res = data->res;
+	void __iomem *base = data->base;
+
+	/* HW should be in paused state now */
+	writel_relaxed(0x0, data->reg_bases[REG_FREQ_ENABLE]);
+	iounmap(base);
+	release_mem_region(res->start, resource_size(res));
+}
+
 static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 {
 	struct platform_device *pdev = cpufreq_get_driver_data();
@@ -321,6 +333,7 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 		if (!(sig & CPUFREQ_HW_STATUS)) {
 			pr_info("cpufreq hardware of CPU%d is not enabled\n",
 				policy->cpu);
+			mtk_cpufreq_hw_cpu_exit(policy);
 			return -ENODEV;
 		}
 
@@ -330,18 +343,6 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static void mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
-{
-	struct mtk_cpufreq_domain *data = policy->driver_data;
-	struct resource *res = data->res;
-	void __iomem *base = data->base;
-
-	/* HW should be in paused state now */
-	writel_relaxed(0x0, data->reg_bases[REG_FREQ_ENABLE]);
-	iounmap(base);
-	release_mem_region(res->start, resource_size(res));
-}
-
 static void mtk_cpufreq_register_em(struct cpufreq_policy *policy)
 {
 	struct em_data_callback em_cb = EM_DATA_CB(mtk_cpufreq_get_cpu_power);
-- 
2.25.1


