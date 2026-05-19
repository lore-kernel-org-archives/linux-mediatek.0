Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE149CD4F5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2026 22:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNsfYCBsduV7LW18AOFLY4oJx3XVZ8OM9ODGDYLi8HY=; b=SiXKv+iM+0f5buna1rmoQQbcOH
	WEbc9zQWVQIPN1wFxjZk+J5ubioyxpij44IwQbbMhuMcLjdwKKcWPIw9XD6zKeJtSFaHxNJ0w4QaM
	FV1MSMoL0RuADgqes/RImqMQNLvqC1fdazqoLHARonHZPBWsfpQ1U64QVmJ6PBCmJqpZ2GbgXt5Oq
	ZmWNsPEvcz1+nSPC0PuqYHukOul8QycHW3gv+uL71bcOoDWRnnhHOw0fWvdiozwFPs6Bx2B60H89E
	RiUz4ZAjuOLBkuKk25lR51wZwhkwWLPIZMjNPvm0duz1Fsn0A8Ko+UUr7jZ270j7TMMAq+5DURMw8
	6I3Y7rRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPT04-00000002y8C-3tGO;
	Tue, 19 May 2026 22:33:20 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSzz-00000002y0l-0hTY
	for linux-mediatek@lists.infradead.org;
	Tue, 19 May 2026 22:33:16 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso21139715e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 19 May 2026 15:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229993; x=1779834793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNsfYCBsduV7LW18AOFLY4oJx3XVZ8OM9ODGDYLi8HY=;
        b=e4fnji+aH/FVhnND087h5GAEYhPyTaA0I9lpHYOK3IcqSw5ok8PwxDpH1OkwZ5edP3
         enXjfIBZE890DHa2dygCW9mmFyiY8PGS8N2lo/bF8Ifacc72+j//ZVi/wURSvUw6T2oV
         Fa633e70WYgqk6r0gmCTOhH0nj5YNHQcEin7vbQq9cl93EVGJi1+jnt0ST+d+IEig8LM
         L6jx2grZJIfRL6Jt76BHn6gD011ZvdwkElSJT5EdvhPc3zS0ZYeJriiKHG01tuAtInf6
         bjunyBm42hoYp2Rocq5j1lTkS3IojtA9D+ZLSpWS6Y+c1TP+5rrktUrWc3T3JMw2KHqC
         z5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229993; x=1779834793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xNsfYCBsduV7LW18AOFLY4oJx3XVZ8OM9ODGDYLi8HY=;
        b=o2zrd5/4hV4m+JwdHH5WzOxat9+K3YzcztBKfLRaRfEbcOy5dKIQwSTMAS0cheuvXL
         +gFEHPxMN26AefVxMz7KEL0C9QAo9b1/ep9Ges31XXOzURhMcdfsRUduqT9pdKuPoUZI
         s/JELX2zcsuWNA/2WF2ZYS9VZGkqG1AFwBqJb4bg5TWEQtKTirpVExWOp3idQx239D75
         jqpQ4i0hlz+4COo3ObWELkO2LZT6G/OidYWl/mdJt4Z7qgHoxwUlkCPWhqhpe003Kjb9
         5h0/b06biLi760J8qqV6EVXLHDbfDWDxS4147qS1iqhDlFqzAJbsC19z9j68feYwKfv/
         BlTg==
X-Forwarded-Encrypted: i=1; AFNElJ/9fkoqPf9lSkBXRSEGvpoptgR2ijFhSMHFGty2UeB/h5/e3SUJHzbweDd3UPZy1PHtYxnq7k8Y/Mq0Wr+IWw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcxn/r/K7tOMDzFqd88L3CpbfX4KnlziOloUhX1krgqPyf/y6i
	dNrkx0Rv6x0ySm5lLvmbVgFzEMXwYgLhI7SSxFbvD7XflaQUgpqYfc+K
X-Gm-Gg: Acq92OH1TkReVXObK2+Hqoo+TJYy135oDJylO/NmsJpc7afAbuVxvADunuKisc54H8Z
	G3PXXER4YPAwisjhkROG6MqL3pWY4UjzRhgt0OxE5M/1junVKj8nKUYYCrrRc1M8f7X9R//nw6A
	LZqXtC6bVuCpHeY15m6TjturRIFPXWfC864kDGZijp6R1gYdYKEtBb+hAXhMSVT/rpkEXEkqLYS
	uXZxXeHD3TpJqShlCJ6dNIg4bvp3K8UuRhHgZ0UsBQ2IBQNQkucr54AMKez9uzWzqs6wERzrUSn
	gLtt/TG1EIoYv4bvVyo3FtYSRtgEiOuomvSPPsx7YD8/pIk5FJXO3owZV3Ee131p4ikDQBRq4Z2
	97mwKylWd0gyljE4l2O1sY7/2NTu6vzkOOST4It7FXR5gg+/8kNDxEM+ylpxGDKAIutQpMFSY/h
	y2Xg2dECwFPdPEujhkfRsKgeegOviMk4Lwn4IyLqBePXtUHnGXMcLrNkdItDP2Myj61kqsoXlSP
	F3wOWv3Vg==
X-Received: by 2002:a05:600c:b95:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-48fe60ea2dfmr321638395e9.11.1779229993156;
        Tue, 19 May 2026 15:33:13 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm346659955e9.4.2026.05.19.15.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:33:12 -0700 (PDT)
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
Subject: [PATCH v3 4/5] i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
Date: Wed, 20 May 2026 00:32:46 +0200
Message-ID: <20260519223253.1093-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519223253.1093-1-ansuelsmth@gmail.com>
References: <20260519223253.1093-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_153315_251394_C9C4E06B 
X-CRM114-Status: GOOD (  15.52  )
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

The same I2C driver is also used for Airoha SoC with the only difference
that the i2c_reset should not enable SCL_STRETCH for Airoha SoC.

Introduce a new compatible for Airoha and limit the SCL_STRETCH only to
mediatek SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index d8fa29e7e0fa..3cde43c57a2b 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -88,6 +88,7 @@ static int mtk_i2c_wait_idle(struct mtk_i2c *i2c, bool atomic)
 
 static void mtk_i2c_reset(struct mtk_i2c *i2c)
 {
+	u32 reg;
 	int ret;
 
 	ret = device_reset(i2c->adap.dev.parent);
@@ -98,8 +99,12 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
 	 * configure open-drain mode, this bit needs to be cleared.
 	 */
-	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
-		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
+	reg = ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN;
+	/* Set SCL_STRETCH only for Mediatek SoC */
+	if (device_is_compatible(i2c->dev, "mediatek,mt7621-i2c"))
+		reg |= SM0CTL0_SCL_STRETCH;
+
+	iowrite32(reg, i2c->base + REG_SM0CTL0_REG);
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
 	/* Clear any pending interrupt */
 	iowrite32(1, i2c->base + REG_PINTEN_REG);
@@ -271,6 +276,7 @@ static const struct i2c_algorithm mtk_i2c_algo = {
 
 static const struct of_device_id i2c_mtk_dt_ids[] = {
 	{ .compatible = "mediatek,mt7621-i2c" },
+	{ .compatible = "airoha,an7581-i2c" },
 	{ /* sentinel */ }
 };
 
-- 
2.53.0


