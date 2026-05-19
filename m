Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAABCD4F5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2026 22:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSWJVKglNpMUeLvf2TMVSbIheMkylfB7P/Qb2Y04AtU=; b=y2sFEpeJxhmYU9MRIcp2knLmzc
	I4CXF8C+sd3hVBQTUJarXLEw4igHuDF1oLj7iLEePUMR2InKiO5BHR+XYMkbvcRCJvIFuhOC9pJr5
	6ngPUb/TIsAC5rVxsX2LSqY0TPmSyHsQMySukzvnXiFtyy218PaqZpLhNCaODBaO9oGn2R+nNCLmp
	Rq5NROnCCXk+Bxc/wY/oMenzDqyzHK39zKDxFQz3GHvReIzRIkscfYFwRu7q1WAWeUu2J0c0VJiO2
	rIqq2ZRY95pCKyr3ZBtfOFHiv1qozBP+IWF7GV14UEAihp0ujMuGdzZ2SWwxZEXZ6NgfNJEm3vX5c
	AFGpTWvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSzy-00000002y1S-1hXM;
	Tue, 19 May 2026 22:33:14 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSzt-00000002xwj-2n0n
	for linux-mediatek@lists.infradead.org;
	Tue, 19 May 2026 22:33:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so45153465e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 19 May 2026 15:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229988; x=1779834788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSWJVKglNpMUeLvf2TMVSbIheMkylfB7P/Qb2Y04AtU=;
        b=L0Q7bHmEkDlc+f/kahPXGSfqqFfIeQxNSVRsKvfns2vsEC0+kibZtNOtscrrpB8VcG
         8IQ8XeaeiWagTsDhzrgZMWIHn4gmoDTN+jXQ67lBY2aXDCOrUR32FzIGqZLZjO5BlGry
         pAeePUtz/8rIueIoz1YLoTT4tFWGuCFBblpVQWCv9H2j68F3ldz9KCuOCeXn77lZ0gmA
         PWqJ3D0x5zXRzaR1OWg4ibPtSOabr2OPFhQ+yiObqL77ryI6+nnopLpZ76NKBFlqAYZF
         SlQ3mly7ujw2oIfDA8F4giruBFGlOX/FLrSZbMQUSf/J6MXQEGwvf8T87AmElMUmBQAg
         n3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229988; x=1779834788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rSWJVKglNpMUeLvf2TMVSbIheMkylfB7P/Qb2Y04AtU=;
        b=D8bjKZfquSm68Q5mZf/o3+Ib9B5Wup4eqLsMS3Rnzj7YcS7vvCnjCwcURLeg+vyhTK
         ovlZtWxEZee3sRd//K1dfwUHNNL8G+HnrS/x7yqnlY3ZCdU+c1V8ALNzqXL7oZ/9x6WV
         d3G0ntajMkfGjeLuGoxWXx4AHyk8a7W6/kYjh2sV86vsSILCBbnYKeMoCpyB6Wp8RVA5
         dyxl4kLHV6A6ThggxZTIV7vkUl2xX+8GYHzjr12s1OiqqvVTDnfnzbDmyXy5XUUNRpWD
         /BQ2bkJIF6DY7MoZhBNwL6eSQfgx2YrNCH0YtIwc08NDM+ssCTh0apF93Julwe13nk6/
         TvzA==
X-Forwarded-Encrypted: i=1; AFNElJ9JPw0o7k43cLfC+ofCHGRQbLm1zCbOO2TF5Rrlv/GQ6sg/ot95D0MugA/RgA4SWE2ViQ2Pd84fdqBfc9hI7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQW2DgU1BgCT1B/NxvVWFU4DPPTdOU9ngFEA6JE/HzHZKxM8u9
	lAmWgDPtT2xbVaGIe+NVkdFL0Fb2mZWQvljdjhTKBwzKXLGXizQ7vu55
X-Gm-Gg: Acq92OEV+kKGFos1kjqaDFey7OH+l6Mkj9TaIK1HAGgMftf9QhXVEGhutCKyg/MGQqK
	KnxHAI/qIM0YdLszUm/ZQ/K/iJGY95C3pEkmHyjM2oc1HSzDb3mvRTDJEBtRy7H6CXivzgp53Vj
	8Yh4YLUtgyRPhDwEUoxkfmb6+aI59Jt/0f8EFXu8bgp/xdtqz4eYvmKkSob1xAR8ZN/KCCy/682
	6i6uO9P2y+o+B78ekLrdRN/0StnrYfLwSWuxSn7EkwNCH7dxrVZyVlGzIfJHCUgQnyAZ9ADLl1z
	4NqZqP/XUJsbMcQyPAlc0s0ppIwGHLfWhRwu4+LBmTG38rTurXj4NxI9g7IAafbHZF2vnnk+2UJ
	VZIF2/ZpZGAnGsImzPI/BbrVauGnzB5/yEk27Pwo5O9ZSOEmHy7SGX6kowUh8cFuH9fvDb85YU9
	esGRzndB0YeLo+yXUtbaqWzXw0b1bUrl6g7hLEdXlI/dx+wbgh53thIK6aRD07R3ruDZFVN1s=
X-Received: by 2002:a05:600c:4504:b0:48f:d1b8:9a9c with SMTP id 5b1f17b1804b1-48fe60e14bamr314706265e9.7.1779229987604;
        Tue, 19 May 2026 15:33:07 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm346659955e9.4.2026.05.19.15.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:33:07 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 1/5] i2c: mt7621: rework cmd/wait OPs to support atomic afer variant
Date: Wed, 20 May 2026 00:32:43 +0200
Message-ID: <20260519223253.1093-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519223253.1093-1-ansuelsmth@gmail.com>
References: <20260519223253.1093-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_153309_735660_4D10EB0C 
X-CRM114-Status: GOOD (  15.55  )
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

It was reported the need for atomic operation on some Airoha SoC that
makes use of I2C bus. Rework the cmd/wait OPs to suppor the xfer_atomic
variant. To support this it's mainlin needed to do the readl poll in
atomic context.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 56 ++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 0a288c998419..700beb9e7b1a 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -67,14 +67,19 @@ struct mtk_i2c {
 	struct clk *clk;
 };
 
-static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
+static int mtk_i2c_wait_idle(struct mtk_i2c *i2c, bool atomic)
 {
 	int ret;
 	u32 val;
 
-	ret = readl_relaxed_poll_timeout(i2c->base + REG_SM0CTL1_REG,
-					 val, !(val & SM0CTL1_TRI),
-					 10, TIMEOUT_MS * 1000);
+	if (atomic)
+		ret = readl_relaxed_poll_timeout_atomic(i2c->base + REG_SM0CTL1_REG,
+							val, !(val & SM0CTL1_TRI),
+							10, TIMEOUT_MS * 1000);
+	else
+		ret = readl_relaxed_poll_timeout(i2c->base + REG_SM0CTL1_REG,
+						 val, !(val & SM0CTL1_TRI),
+						 10, TIMEOUT_MS * 1000);
 	if (ret)
 		dev_dbg(i2c->dev, "idle err(%d)\n", ret);
 
@@ -117,27 +122,28 @@ static int mtk_i2c_check_ack(struct mtk_i2c *i2c, u32 expected)
 	return ((ack & ack_expected) == ack_expected) ? 0 : -ENXIO;
 }
 
-static int mtk_i2c_start(struct mtk_i2c *i2c)
+static int mtk_i2c_start(struct mtk_i2c *i2c, bool atomic)
 {
 	iowrite32(SM0CTL1_START | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
-	return mtk_i2c_wait_idle(i2c);
+	return mtk_i2c_wait_idle(i2c, atomic);
 }
 
-static int mtk_i2c_stop(struct mtk_i2c *i2c)
+static int mtk_i2c_stop(struct mtk_i2c *i2c, bool atomic)
 {
 	iowrite32(SM0CTL1_STOP | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
-	return mtk_i2c_wait_idle(i2c);
+	return mtk_i2c_wait_idle(i2c, atomic);
 }
 
-static int mtk_i2c_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len)
+static int mtk_i2c_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len,
+		       bool atomic)
 {
 	iowrite32(cmd | SM0CTL1_TRI | SM0CTL1_PGLEN(page_len),
 		  i2c->base + REG_SM0CTL1_REG);
-	return mtk_i2c_wait_idle(i2c);
+	return mtk_i2c_wait_idle(i2c, atomic);
 }
 
-static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
-			int num)
+static int mtk_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			       int num, bool atomic)
 {
 	struct mtk_i2c *i2c;
 	struct i2c_msg *pmsg;
@@ -152,12 +158,12 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		pmsg = &msgs[i];
 
 		/* wait hardware idle */
-		ret = mtk_i2c_wait_idle(i2c);
+		ret = mtk_i2c_wait_idle(i2c, atomic);
 		if (ret)
 			goto err_timeout;
 
 		/* start sequence */
-		ret = mtk_i2c_start(i2c);
+		ret = mtk_i2c_start(i2c, atomic);
 		if (ret)
 			goto err_timeout;
 
@@ -173,7 +179,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			len = 1;
 		}
 		iowrite32(addr, i2c->base + REG_SM0D0_REG);
-		ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, len);
+		ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, len,
+				  atomic);
 		if (ret)
 			goto err_timeout;
 
@@ -198,7 +205,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 				cmd = SM0CTL1_WRITE;
 			}
 
-			ret = mtk_i2c_cmd(i2c, cmd, page_len);
+			ret = mtk_i2c_cmd(i2c, cmd, page_len, atomic);
 			if (ret)
 				goto err_timeout;
 
@@ -218,7 +225,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		}
 	}
 
-	ret = mtk_i2c_stop(i2c);
+	ret = mtk_i2c_stop(i2c, atomic);
 	if (ret)
 		goto err_timeout;
 
@@ -226,7 +233,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	return i;
 
 err_ack:
-	ret = mtk_i2c_stop(i2c);
+	ret = mtk_i2c_stop(i2c, atomic);
 	if (ret)
 		goto err_timeout;
 	return -ENXIO;
@@ -237,6 +244,18 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	return ret;
 }
 
+static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			int num)
+{
+	return mtk_i2c_xfer_common(adap, msgs, num, false);
+}
+
+static int mtk_i2c_xfer_atomic(struct i2c_adapter *adap,
+			       struct i2c_msg *msgs, int num)
+{
+	return mtk_i2c_xfer_common(adap, msgs, num, true);
+}
+
 static u32 mtk_i2c_func(struct i2c_adapter *a)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_PROTOCOL_MANGLING;
@@ -244,6 +263,7 @@ static u32 mtk_i2c_func(struct i2c_adapter *a)
 
 static const struct i2c_algorithm mtk_i2c_algo = {
 	.xfer = mtk_i2c_xfer,
+	.xfer_atomic = mtk_i2c_xfer_atomic,
 	.functionality = mtk_i2c_func,
 };
 
-- 
2.53.0


