Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9EFC46467
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jan 2023 14:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4+dLuHlcC9jnNQMQw94DnzReVIGUmjOcxr5KvYMev8U=; b=aVJO8RaQz6I+aMXk2y2FnX3Xfm
	zqr/HWoYis0fZhTn1cPU2hCNNU6u2GDaVlWCoYhI9qd/AfAL2SlBVdSeB/5J265dniShvajDNX7t1
	bo4MSFACxRIDpXGKsMB6SSf5q1lNADG9XssX3xNyNi4NQzdFxUbHWyYBUSrV2FUt9dZPRGZNTSNqs
	YEYV4Y24XckZk2cQJek4uUIFlRAe3AeD7iBb4ckGwf2wkxduzFbYlCnyoR9gixfyEOojDtuKCW/pz
	ab0wD4PxIwXchrJynH27rorNGQA3z7fItNFqMhZT6AWgvv/Ud/Dr5M/PltgLXnhieuH35iy29/ea3
	co0M8mGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD4Xc-009cfv-Cq; Wed, 04 Jan 2023 14:14:52 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzBM-007eqx-95
	for linux-mediatek@lists.infradead.org; Wed, 04 Jan 2023 08:31:35 +0000
Received: by mail-pj1-x102e.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso764847pjf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Jan 2023 00:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4+dLuHlcC9jnNQMQw94DnzReVIGUmjOcxr5KvYMev8U=;
        b=Y6p8ZQAFtVMjaWUXOOmJW3dVg7sTCZDpqgmsww1yv78ELTsTvUOzzh1vI4HKCoA/I/
         YDKeO3dbrEB3Uxq4ikf+PWOZI49nPxuRhtLY//2wK2Jj4JLmZE8cxt4ADlPRaqFJRfJd
         LTxf/SNUMnvBAqj9hsojG7XuTAN2ANr3weauE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+dLuHlcC9jnNQMQw94DnzReVIGUmjOcxr5KvYMev8U=;
        b=oEHAK2yprvvBCWR+w2j05xkxJaWoLMLP0wk5P3sq80bIJ+CxFx99TRC2DdTrBDr/7O
         cwLT6Aed5r2nq0lq/FrcvrpZ0JA7OST85DWKJshSgP1ylnpEcS50EhkBF88JFOdrE2Jr
         +gS808vf4//UcXKJYfHMoVRdWu9GkWdapv7ACGhHwHA1TXZlpp/WYV47+pmBQX11uUwU
         iNKIaLi7gW2sTLFJfF9Dc2BTRRJom1WKdgRp/OnKh3LjmlX6dcBrLg5reVDI1HcM4i4c
         1taN1MyiydubQNVAzOGzIUAtwEoJWlvvI3/suZuf8XLn4V5AGW00beDm72hGRz4oh05e
         eLBw==
X-Gm-Message-State: AFqh2kpk3B0DMcvZv6Q/CTWoOWLyZCUgTUzz83MLpayc52ltwNIMlkxQ
	7Z1c6ICW2UjPjXguBAarH2VN6A==
X-Google-Smtp-Source: AMrXdXujFnG7dDV9MJtsjkA59x1G95RzXq9CimM7pdZKe0Di/GVPavoCYPnyhRWzT/EOvKLsFiYF/g==
X-Received: by 2002:a05:6a20:1e55:b0:a2:a636:70c2 with SMTP id cy21-20020a056a201e5500b000a2a63670c2mr66048817pzb.24.1672821085870;
        Wed, 04 Jan 2023 00:31:25 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:9ef5:c3c1:77a5:2cd])
        by smtp.gmail.com with ESMTPSA id g16-20020a63fa50000000b0046b1dabf9a8sm19781604pgk.70.2023.01.04.00.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 00:31:25 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH] remoteproc/mtk_scp: Move clk ops outside send_lock
Date: Wed,  4 Jan 2023 16:31:10 +0800
Message-Id: <20230104083110.736377-1-wenst@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_003132_430428_C0B691E6 
X-CRM114-Status: GOOD (  12.61  )
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

Clocks are properly reference counted and do not need to be inside the
lock range.

Right now this triggers a false-positive lockdep warning on MT8192 based
Chromebooks, through a combination of mtk-scp that has a cros-ec-rpmsg
sub-device, the (actual) cros-ec I2C adapter registration, I2C client
(not on cros-ec) probe doing i2c transfers and enabling clocks.

This is a false positive because the cros-ec-rpmsg under mtk-scp does
not have an I2C adapter, and also each I2C adapter and cros-ec instance
have their own mutex.

Move the clk operations outside of the send_lock range.

Fixes: ("63c13d61eafe remoteproc/mediatek: add SCP support for mt8183")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/remoteproc/mtk_scp_ipi.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index 00f041ebcde6..4c0d121c2f54 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -164,21 +164,21 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 	    WARN_ON(len > sizeof(send_obj->share_buf)) || WARN_ON(!buf))
 		return -EINVAL;
 
-	mutex_lock(&scp->send_lock);
-
 	ret = clk_prepare_enable(scp->clk);
 	if (ret) {
 		dev_err(scp->dev, "failed to enable clock\n");
-		goto unlock_mutex;
+		return ret;
 	}
 
+	mutex_lock(&scp->send_lock);
+
 	 /* Wait until SCP receives the last command */
 	timeout = jiffies + msecs_to_jiffies(2000);
 	do {
 		if (time_after(jiffies, timeout)) {
 			dev_err(scp->dev, "%s: IPI timeout!\n", __func__);
 			ret = -ETIMEDOUT;
-			goto clock_disable;
+			goto unlock_mutex;
 		}
 	} while (readl(scp->reg_base + scp->data->host_to_scp_reg));
 
@@ -205,10 +205,9 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 			ret = 0;
 	}
 
-clock_disable:
-	clk_disable_unprepare(scp->clk);
 unlock_mutex:
 	mutex_unlock(&scp->send_lock);
+	clk_disable_unprepare(scp->clk);
 
 	return ret;
 }
-- 
2.39.0.314.g84b9a713c41-goog


