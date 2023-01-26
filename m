Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4AEC05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 15:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zAB4Qb1ufLF8DugBk2OJpjahUqc8w+2oka2zLrtWcME=; b=u5SG/MNFMzAqp0dyJNxZF5IObZ
	5/Ytx5T+8m58CbSUMZzkdaIwpD8W7pHR4c7GZ/f6Bh0E9WZOQeVf2f7de7b1a1O4mQJ9pv5LAUqDy
	v1KfirqtpvZb8/5Mp5xxfEvXOBTXfd+bLTJxnNEdf7I/qdZUcaQbfzovWrnQ/v4t98UoL6ZkPaSD7
	N1C785K3hRl50t/afAF/4aFUHatCmWQHa4NYYua35vqlFbia1vVwVl5wGxLMEjNnnDudNMBArqzui
	yNGwhEwn3wF8Z+o2PbdxHnBuRwXKT39dZ3i/RdbCWa2UoR9ecwhc/W0/vrKg07rIUSa/2RAO1GkJ1
	Hvakg+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4VL-00BbeZ-TC; Thu, 26 Jan 2023 15:49:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4V8-00Bbap-Dy; Thu, 26 Jan 2023 15:49:23 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9FB3B66018E4;
	Thu, 26 Jan 2023 15:49:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674748160;
	bh=g+Oj2+JQl5wV7jLxmGEkz6OGP2VZYC0NvlMxCkm94xI=;
	h=From:To:Cc:Subject:Date:From;
	b=asNQ0b0J1MLwPOIKDgPcba2oKj8VPzWFySGYMeZFS8KXv81NvKSKdOlAwDaweFTjk
	 vf1rDfJwrlGAFnT5Ris2KvNGn6aVkWQg4bup5voNDOm3yh4UC8RtpEIwc4VRhuXSOV
	 w0piSrktqdluSHKbi/buQUzpzrWpO82PqNTZ81sNMfJ4fdSRSNid1YmbYyw/EfOoz2
	 JyfKeOXknVh7QF7/V42/sgDiPg1MBlLJA2LutnNMz9qpHdwMa2vDfvC+QQJyG5d6xR
	 bxH3pFa3mV7WIy6dtQrE0UeoFn0ocCPA/w7JWVcLHzZdo0+qjpvgoxo/Yb3z5nmiI1
	 8S0GFoynrGqpA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] cpufreq: mediatek-hw: Register to module device table
Date: Thu, 26 Jan 2023 10:48:56 -0500
Message-Id: <20230126154856.1322193-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_074922_626246_0D0692C1 
X-CRM114-Status: GOOD (  11.50  )
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

Register the compatibles for this module on the module device table so
it can be automatically loaded when a matching device is found on the
system.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 drivers/cpufreq/mediatek-cpufreq-hw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index f80339779084..115b0eda38c1 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -324,6 +324,7 @@ static const struct of_device_id mtk_cpufreq_hw_match[] = {
 	{ .compatible = "mediatek,cpufreq-hw", .data = &cpufreq_mtk_offsets },
 	{}
 };
+MODULE_DEVICE_TABLE(of, mtk_cpufreq_hw_match);
 
 static struct platform_driver mtk_cpufreq_hw_driver = {
 	.probe = mtk_cpufreq_hw_driver_probe,
-- 
2.39.0


