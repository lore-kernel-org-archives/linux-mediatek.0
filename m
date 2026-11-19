Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23DB606A326
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 05:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vsa1vV6G;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=klkfEfXt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CRoVCX5qUvRVZQYCG7l49zxIQXQRCkCrH+z2zQB6lGk=; b=Vsa1vV6GpOrmCv
	TlNRYD+UyE7ANrGXer1krHkD5HoH10a1Zglx+c0wvk84PIs7gRwbEy9GEDSAJh1L/dqRG6jEB3iW6
	HuDoIUNbFBkFctAd2E/smf6ALAAC3EjTM1Um8GsCe3XmiXVLadnrPV/xjfqq74eN8H+Dm8dfrHRSJ
	7SbbfKKSQERv40Izz/15yesYPK0alBm7E3arCD+HPxDZUCsr1RUvvZpWmwqf+kP16fEc/xS7cBRTI
	mR/dxlbL99uw2T4KXu3wUMdCxx0JGtSnx2ziGenZX20cg8yDLLAoyqsl75Jkeb8Ggbje6Pq9fWE11
	NZRZxc7+G3LC7Ttg30rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuhO-0000000Ativ-0Lej;
	Thu, 19 Nov 2026 05:28:42 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuhK-0000000Ath1-3wxH;
	Thu, 19 Nov 2026 05:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=CR
	oVCX5qUvRVZQYCG7l49zxIQXQRCkCrH+z2zQB6lGk=; b=klkfEfXtWnpsJ4mzqN
	03kCdLrzIRy2uwkyqCewS0H6eEnrCWrNTU/hDhwAAOSgVXBicQZFk195272cVtQU
	5SASYTBX+eR/Eql+pJtxxRe7dp0dMiPkD8oiZCnBHtyamIsvAusMwveimZnMZyBB
	Vzo5GCeY0LmVD8iRFbIOFRmtE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDX3+zviP5qaWbXIA--.59393S3;
	Thu, 19 Nov 2026 13:28:17 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: viresh.kumar@linaro.org,
	rafael@kernel.org
Cc: zhongqiu.han@oss.qualcomm.com,
	hector.yuan@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH v2 1/2] cpufreq: mediatek-hw: Release resources when hardware enable fails
Date: Thu, 19 Nov 2026 13:28:10 +0800
Message-Id: <20261119052811.2877720-2-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261119052811.2877720-1-haoxiang_li2024@163.com>
References: <20261119052811.2877720-1-haoxiang_li2024@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDX3+zviP5qaWbXIA--.59393S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyxtryxJF1fJF4DWFyUWrg_yoW8Kw1xpF
	W3ZrWYyr45XF4qqw1xCF4DuasayFs2y345W343A34Sv3ZxAFy5W3WUuFyUAFZakrykGF12
	yr4rtayxuF4kArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pMhFIUUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7hG4J2r+iPFyGAAA3n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_212839_398550_45551310 
X-CRM114-Status: GOOD (  12.02  )
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


