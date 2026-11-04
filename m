Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC4E606A33F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2026 07:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lagt6QY/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=REJDKuOj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=121s4JOLOhrrTtqNw+nRPzr1JTP5S9GXqoANnz/M4b8=; b=Lagt6QY/P91++8w5UBHIsIOhB1
	sB22Kj7fBvcNUhGFYQks02IOQDdexteGVI+mdcaLRtrqgGu9/nbWoov72xjluR6gBryyztfnbSmyG
	goxeZ6ihqtP9JVay5WCP7BBcmt/6FZMqvxwKxnIvgmTFu+WZutp5hR3KXUpQJNxLX3ltThLFBSdk8
	BZjd5xGPgPwfLvaeSISlnEwCKdmf5ORlJ//fAyn2JcG0x8frFucEyutuupm3tZ1Hdr6t0OaCFPyd/
	CWKe9+cfXqtJ7s2zAtLwkSb30MWrU/CdI40zh2L9/MnOSoQ8a3jprZbEUdlDKAOlOB1bmRXpmhp5z
	ZBmkJRBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVRO-00000004XBh-3H5I;
	Wed, 04 Nov 2026 07:29:50 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVRM-00000004XAC-1a6J
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Nov 2026 07:29:49 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so312502f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Nov 2026 23:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793777386; x=1794382186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=121s4JOLOhrrTtqNw+nRPzr1JTP5S9GXqoANnz/M4b8=;
        b=REJDKuOjPSD16IdE2c579x5OeF7b1YdZxxsmrH0lHFEZE+kudhS5B/DeSObNvNh1Og
         AAH6Pew1SHF6jrW1QOXoozRd/IbnwbH51wgmqu0hwVyPE36hgU/hMwK0AFGxMAXojISu
         Sdqy+btSoTU0Wt1wnhfuoqNhpWvA3xHO6Xt6EA/JN+VXO69bV+V9lVECoomBqBKbgOry
         RO6r0vRCZm3n+ESDA2Rk9EKowJ+1g0NEK7ZAZXUJuGfM6+8RAHf7N3WP2SLDNgatDSPS
         2KC27FcOnMD1MumQtOmH0nu4Gi7SECSx0JhXfGHgdyHa1fOic0LEz3FhlUEHQYAzk2Yt
         sqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777386; x=1794382186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=121s4JOLOhrrTtqNw+nRPzr1JTP5S9GXqoANnz/M4b8=;
        b=BWlvcxBXH+wTKzHo9znQayBUgl1M7EtAFsFII/0O20+vaSaxoZOIKjMHcULIKKyVl5
         +nL9JfSGrVXBrI1mJVwzJPAbpwcIUxBHVQr2C24gVsZ7TZPee83Qy7FQV5+RHEJM+Lvu
         Jg6Ypgq/aHekMFh47nhxy01S5rIM+KqIwhFvSRTEoytJ0I46oHT9ie1RQFe1S7bCIdzx
         Z2BLf0cHtycEJHW9nDHsyNeeEaGEzUsLfPX6tAz6Da+ITLzRg59iPfmGUWFaDeKELLQu
         UYSeXRgAw3oBA3P2MJfiSirSqA9QeOJnxMRHAYu3oNwkz4P7xphVvxmK48A03lPI20EL
         trPw==
X-Forwarded-Encrypted: i=1; AKwUvBwBAiGkVcD5dGhMlWelB3zitug7lu2BmSAu3OqmVpCxzt4SD8uLvEFcJk5KmhJvAIonwR9+6Z7UbUPwxKf8+Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z8gvptQd+JVj23hNLohbJBAFNxQindYYLST/TvhgMkb3E5UTx+X
	dAZw9eM0gxvPJo0r7kHUTgu8hzfrbAblvOZ6KD2t4Grp0tIEvkSl4+jW
X-Gm-Gg: AYBFou3ooglWfTnwSJ6L9TI77lugS2gtYrJMt0HULE4MDi2095EeQx0TCaan5rwwSSB
	vAikOfj6dHlEmx3Xpx14/jCTK7K06UIDjyP6CSxT5voUkOXuyjAKXHI47eX+SQ+Qis0Hx6MQxRo
	OlWZKdUk/o3FF34Q2mDyfL0DwCPkgdH/isvQQCWGg3t0/TU9fyHx1Pyn7M1fmBBK0XF+IHEP4vV
	qAzwlQHsnQycgGxaz7n9iX9tcfs/JxN+o8upyOC3RD1xn9Z4waWRIArFq29eSxxfo+Eu6zYpfsD
	vRTRsD9DjX6kpp/D+kssBrDkE2xxJobtuoZCOeAbQPrUXxERLtXfyoWfnjBzhGaUdqLjQlfXmnx
	J6PhzWIwl9p69XRFuaM9sMEAGX18eHVlJBC1sX1pch8pFgq2QlkGRYNmj5BRicFMK2c2ojKQqai
	MYPulQqYk+d+9M8oL0n/ijzbDxsSnaS5pjOhHN98NT+Vzu+CuasOjaxkBNRfxeOOYwRR/m+Djdd
	PSTDtU2mlqj4xIPxr8V6ftPvWa1gZl6tLzJjS6IJVmCJ32kGHuu3xC+yMrUxUZp87YefFa86ZUM
	JcxtXTP69YJyuMB5O5/BH0i19JAbSLRV+qOAyJzle2zQ0HJU3w37NZwWAVi1cvyCDIYM/fXwlOv
	WAjjyruLhIiWy+A83L4fZSWi6pN4pGLX0HQ==
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4ac189928e9mr345693905e9.29.1793777386280;
        Tue, 03 Nov 2026 23:29:46 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a555e59dsm130754225e9.0.2026.11.03.23.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:29:45 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC net-next] net: airoha: npu: attach passive devfreq scaling
Date: Wed,  4 Nov 2026 08:29:39 +0100
Message-ID: <20261104072940.52933-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_232948_446001_902820E1 
X-CRM114-Status: GOOD (  16.95  )
X-Spam-Score: -2.1 (--)
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The NPU can scale to different operating state from idle to normal to
turbo. Attach a passive devfreq that will scale the NPU frequency with the
CPU with the use of OPP table and opp-required properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---

Posted as RFC to understand if it's the correct way to handle this...

DT patch will come later.

 drivers/net/ethernet/airoha/airoha_npu.c  | 61 ++++++++++++++++++++++-
 include/linux/soc/airoha/airoha_offload.h |  3 ++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 4d3195eb00f7..f8055ca65ec4 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -12,6 +12,8 @@
 #include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/regmap.h>
+#include <linux/pm_opp.h>
+#include <linux/clk.h>
 
 #include "airoha_eth.h"
 
@@ -656,6 +658,62 @@ void airoha_npu_put(struct airoha_npu *npu)
 }
 EXPORT_SYMBOL_GPL(airoha_npu_put);
 
+static int airoha_npu_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
+{
+	struct airoha_npu *npu = dev_get_drvdata(dev);
+
+	*freq = clk_get_rate(npu->clk);
+
+	return 0;
+}
+
+static int airoha_npu_devfreq_target(struct device *dev, unsigned long *freq,
+				     u32 flags)
+{
+	struct airoha_npu *npu = dev_get_drvdata(dev);
+
+	return clk_set_rate(npu->clk, *freq);
+}
+
+static int airoha_npu_devfreq_get_dev_status(struct device *dev,
+					     struct devfreq_dev_status *stat)
+{
+	struct airoha_npu *npu = dev_get_drvdata(dev);
+
+	stat->busy_time = 0;
+	stat->total_time = 0;
+	stat->current_frequency = clk_get_rate(npu->clk);
+
+	return 0;
+}
+
+static struct devfreq_dev_profile airoha_npu_devfreq_profile = {
+	.target = airoha_npu_devfreq_target,
+	.get_dev_status = airoha_npu_devfreq_get_dev_status,
+	.get_cur_freq = airoha_npu_devfreq_get_cur_freq
+};
+
+static int airoha_npu_devfreq_probe(struct device *dev)
+{
+	struct airoha_npu *npu = dev_get_drvdata(dev);
+	struct devfreq *devfreq;
+	int ret;
+
+	npu->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(npu->clk))
+		return dev_err_probe(dev, PTR_ERR(npu->clk), "failed to get clk\n");
+
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse NPU freq thresholds\n");
+
+	npu->gov_data.parent_type = CPUFREQ_PARENT_DEV;
+	devfreq = devm_devfreq_add_device(dev, &airoha_npu_devfreq_profile,
+					  DEVFREQ_GOV_PASSIVE, &npu->gov_data);
+
+	return PTR_ERR_OR_ZERO(devfreq);
+}
+
 static const struct airoha_npu_soc_data en7581_npu_soc_data = {
 	.fw_rv32 = {
 		.name = NPU_EN7581_FIRMWARE_RV32,
@@ -803,8 +861,9 @@ static int airoha_npu_probe(struct platform_device *pdev)
 			 (val >> 16) & 0xffff, val & 0xffff);
 
 	platform_set_drvdata(pdev, npu);
+	dev_set_drvdata(dev, npu);
 
-	return 0;
+	return airoha_npu_devfreq_probe(dev);
 }
 
 static struct platform_driver airoha_npu_driver = {
diff --git a/include/linux/soc/airoha/airoha_offload.h b/include/linux/soc/airoha/airoha_offload.h
index 7589fccfeef6..ac776dc31487 100644
--- a/include/linux/soc/airoha/airoha_offload.h
+++ b/include/linux/soc/airoha/airoha_offload.h
@@ -6,6 +6,7 @@
 #ifndef AIROHA_OFFLOAD_H
 #define AIROHA_OFFLOAD_H
 
+#include <linux/devfreq.h>
 #include <linux/skbuff.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
@@ -167,6 +168,8 @@ struct airoha_npu {
 #if (IS_BUILTIN(CONFIG_NET_AIROHA_NPU) || IS_MODULE(CONFIG_NET_AIROHA_NPU))
 	struct device *dev;
 	struct regmap *regmap;
+	struct clk *clk;
+	struct devfreq_passive_data gov_data;
 
 	struct airoha_npu_core {
 		struct airoha_npu *npu;
-- 
2.55.0


