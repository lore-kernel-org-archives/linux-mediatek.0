Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE6D606A333
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 05:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y2cUhSMQ;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=j///4p1S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bD2ax/aLK3TbiC+MuA5c3fv1Msqgl3zH1491fFdGzOw=; b=y2cUhSMQdCrYJH
	MMytTSqeZb4b3YKVdFDbQ2e4uvfvwaPTKjyuI0xxzsexwdrsBO9USar9vd+PRf0fRSTjCAtwSOQoo
	G8tfE6QLc78PiNymFcpazr6RLjdeo8/eT7DSS9N2idTVe8TxR26miiAwvJVsk6tc599GyLRxa1tg3
	JCCtmygGVxLHZYVyi673A6+KjYkw6/B6PsKv62oEGPiMZqH9l1ZYplFYFOgRoN9S3X1tLwA5pmX9O
	kh8bPdRmSi7R4vfaoAHWw4Ic0zLVmAqYV5Ne2VT2nj4ZwsDatQdlD/JZT5etUzRJ0TVux2ycwpyky
	Fc9k2rsRphQj0xF9slDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuhZ-0000000AtnU-0cKp;
	Thu, 19 Nov 2026 05:28:53 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuhL-0000000Atgx-2UFP;
	Thu, 19 Nov 2026 05:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=bD
	2ax/aLK3TbiC+MuA5c3fv1Msqgl3zH1491fFdGzOw=; b=j///4p1Sm4iOx1f1x/
	ZNKs/kBmJhb7QO9N11NByMfu2yCyj/HW7XhsIcavU8JsyGZ9gJAfnu6clN0ZXrVc
	YUDUGvEAbeWEGJwvenUSV9LO2vSW10pwUNQWUsSFbj/ChKdi2z/1Q675HABETJVu
	h5HZG/u0AmXYR/y/R9laKmaLo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDX3+zviP5qaWbXIA--.59393S4;
	Thu, 19 Nov 2026 13:28:18 +0800 (CST)
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
Subject: [PATCH v2 2/2] cpufreq: mediatek-hw: Clean up on frequency table creation failure
Date: Thu, 19 Nov 2026 13:28:11 +0800
Message-Id: <20261119052811.2877720-3-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261119052811.2877720-1-haoxiang_li2024@163.com>
References: <20261119052811.2877720-1-haoxiang_li2024@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDX3+zviP5qaWbXIA--.59393S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7JrWfZw43Gr17GF45trW7CFg_yoW8JrW7pF
	W09FWUAry5JFsrXw4kAa1UWas8Aan29rW5ur47W3sIvwnxJFWYva4Fga4jqFZ3urWkAr1Y
	vrWqyay7uFWUJr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ztjg7bUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7RK4J2r+iPJhUwAA38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_212840_059367_D449DF95 
X-CRM114-Status: GOOD (  10.75  )
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

If mtk_cpu_create_freq_table() fails, mtk_cpu_resources_init() returns
without unmapping the registers or releasing the memory region it has
already requested.

Unmap the registers and fall through to the existing memory-region
cleanup before returning the original error.

Fixes: d776790a5536 ("cpufreq: mediatek-hw: Fix double devm_remap in hotplug case")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/cpufreq/mediatek-cpufreq-hw.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index 65f15fe935db..3ab139d1a552 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -277,13 +277,17 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,
 	ret = mtk_cpu_create_freq_table(pdev, data);
 	if (ret) {
 		dev_info(dev, "Domain-%d failed to create freq table\n", index);
-		return ret;
+		goto unmap;
 	}
 
 	policy->freq_table = data->table;
 	policy->driver_data = data;
 
 	return 0;
+
+unmap:
+	iounmap(base);
+
 release_region:
 	release_mem_region(res->start, resource_size(res));
 	return ret;
-- 
2.25.1


