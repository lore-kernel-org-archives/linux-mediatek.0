Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADDE606A322
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2026 07:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ec0mvzop;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RbwCFuAW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nXilgdS7CLOmcdrjW/kYGIwI3BWhhi5w7jGBtQxBRhY=; b=Ec0mvzopUt97U7nEkoHoFmcYjI
	2KzXtoSSVi5gs5m9VX7KmTv5mZGY0qAVfhHS2TCy3BrwZHxY9a3bqJBf9V6BPm6X9rcjVp+2aLk5v
	iEkXHFI4QgMAEq9g4mpkiZ1Lbc+YKaWXQ17XOxmkl6GSeSxFdKLJQh2EiZTlHwliWKqcqJBz8REzS
	ta7zfTUKFnjmq5hnrNxxMSnrp0anw2F2YqIamm2pJqbzTnUSYUUcgAze5BpvP9USpTS1VRQhnp2ay
	jjQSVMgcEvRpsVvn2FtyhXlF/WJ9R4QLBJrm/2wenqt6cVTp6bCgwTp4T5QqnZv8FkgNpwycTHGmg
	5F1CgXwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgo6-0000000Aymi-1rIv;
	Fri, 30 Oct 2026 07:13:46 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgo4-0000000Ayli-0Jf2
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Oct 2026 07:13:45 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48e10a70540so203874f8f.1
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Oct 2026 00:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793344421; x=1793949221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nXilgdS7CLOmcdrjW/kYGIwI3BWhhi5w7jGBtQxBRhY=;
        b=RbwCFuAWf7FugcuWl/dV7cFyFhGBbkf6hZkXS46utf8EKAgRRRf0vw66Cj02lBPSnU
         6DfOWZRXK73OUBMcCeKtoRCpkceCkAebmdMFiWRNIAM4UkNuJV1eJDobMixImgWz/RLL
         QPbvu8iC1QtEmyYzw7SnjrqtZUUZTvsdoEYHYoUo/Ob2YAUbaQvXgU187R7uuTEsXkg5
         3+9diZUc0yyr33GgLXyt/05IvyxGvUPXAi8F5MjsHmd+E9GSn0bPOzNA0prOp2V0Is0N
         R4q6azRakfn34W8BrI/vLBcm3hAqP+OzuDMdCqUpykYWqTuwV/Ez2cm/PTIUEalfv7DQ
         N9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793344421; x=1793949221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXilgdS7CLOmcdrjW/kYGIwI3BWhhi5w7jGBtQxBRhY=;
        b=oJtPkYtg06uXSZXo/PW6oorRgXlOEkDSEchdtwDCX4nA8k3E4iR+W9AEpkyKaFkK98
         +lGGF78hzGZLONBCItSKGVdDAC7Up2mcbEwes6cj4ogyTk6ushSP0AKAaiZbW4njUDsI
         pTo3dAEjlVuS6cq+SfVblvTUVZqf8pP4lcMg8ThvTUChSIaBzDz7vYygavn7EVGr0VrT
         55sHAhnsANasEVFRzUFLeUWEwY/K3oCBRkaX15Ix6ISO6duPixWAaZzheKmcBueZnoJH
         s+vABm1bm2i2sjulU8T8RMQfTRk7rpd4aCb35DtdA8izubUxowmC5qywL94G6g03k+8m
         iFAw==
X-Forwarded-Encrypted: i=1; AKwUvBxn7OO3+yjIDdZMAaWMmYGyNAz/993UBpV/dG1N4NWkYnwBTc0o5BexH2AAV0zyCZL0TUE2uWKEOcx+z1S2gg==@lists.infradead.org
X-Gm-Message-State: AFq9FYI3wncIcpcVlT3y3Qz95fCyBaxJYlup0fpAEsjZTMA35nDmiYz1
	xDiTjubedI81PXq/eCo4Hlwf9Gxe0fZrCF1Q7fBngWArAKgBWXqKQE0tAolhmg==
X-Gm-Gg: AYBFou3A+T5xIQc08KFMh2JKBjzUlkjbI42t/gPxWNDQLgEsnmW6r3YHAkffyL07u4/
	va5Xn2Ly/eHjmRrfuR1j8M9t2ZrmzcmFD6UbAWLQnnB+ibsDFEPS2f2PKx5MmvsjNFH7kglBP/n
	sqhkBBKFdKiPH0mVC2krR2TSVbGqcqIugilyo7JVpvclUanEs+iS169SRlVR9cmzj62qiMLKFtb
	yKiJl4kyNSviBwblh4ERdtGaKRu4M+BnyIfZ8ZW8A/w54zJTFoMSszOiuDsdFveNwfqbmDlZZ9+
	ThtNqlOAxWip8onAELd0yAIsb3AaAqg8FupnPafcr94mQIKVizzn2R6TavNHNJ69RkmXCXMZNVm
	GHV9a0ko2i1Y4UQuOAmh8GabrrO6a1rOW+CTGeLXLSpMnlH14BuS0+PTKFxVl/rOnVWUwTe/fXL
	gc4MoxSNCOJcJFK+ftOhW7aIXQlXmuuiTgmh9dvKROrrnea2W496zBGZw1r6YfoCa3yuDQOV9IR
	4+Tzn+G0uyV5DnxuV3eeeuXxeJBVkhCtIMq54i3tRZH9fyYhFAB2IErEYHB3/hqjUfQUWhrUtds
	vM/ygFQX1eLQk3NIsRYbS0z+5fpV3XTUkuHM+rLuAurKIwC+m8HYAamn2k5kvlCM0DuuFpcF4jT
	ShaT7b0BoLpRJxhj0JODuHktQuZVh8PIB4A==
X-Received: by 2002:a05:6000:430d:b0:48e:25d7:d276 with SMTP id ffacd0b85a97d-48e6e2c3527mr3261224f8f.2.1793344420640;
        Fri, 30 Oct 2026 00:13:40 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b78c10sm1489936f8f.25.2026.10.30.00.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:13:40 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v4] i2c: mt7621: rework cmd/wait OPs to support atomic afer variant
Date: Fri, 30 Oct 2026 08:13:23 +0100
Message-ID: <20261030071325.2678-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_001344_179800_3507336C 
X-CRM114-Status: GOOD (  16.05  )
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

It was reported the need for atomic operation on some Airoha SoC that
makes use of I2C bus. Rework the cmd/wait OPs to suppor the xfer_atomic
variant. To support this it's needed to do the readl poll in
atomic context and special handling for device_reset.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---

Changes v4:
- Split to dedicated patch
- Reduce timeout to 250ms
- Disable device_reset in atomic context

Changes v3..v2:
- No related changes

 drivers/i2c/busses/i2c-mt7621.c | 75 ++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 9ea5e3f9a763..0283191ac518 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -67,27 +67,38 @@ struct mtk_i2c {
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
+							10, TIMEOUT_MS * 250);
+	else
+		ret = readl_relaxed_poll_timeout(i2c->base + REG_SM0CTL1_REG,
+						 val, !(val & SM0CTL1_TRI),
+						 10, TIMEOUT_MS * 1000);
 	if (ret)
 		dev_dbg(i2c->dev, "idle err(%d)\n", ret);
 
 	return ret;
 }
 
-static void mtk_i2c_reset(struct mtk_i2c *i2c)
+static void mtk_i2c_reset(struct mtk_i2c *i2c, bool atomic)
 {
 	int ret;
 
-	ret = device_reset(i2c->adap.dev.parent);
-	if (ret)
-		dev_err(i2c->dev, "I2C reset failed!\n");
+	/*
+	 * Skip device_reset in atomic context as it depends on the
+	 * reset-controller correctly handling atomic operations.
+	 */
+	if (!atomic) {
+		ret = device_reset(i2c->adap.dev.parent);
+		if (ret)
+			dev_err(i2c->dev, "I2C reset failed!\n");
+	}
 
 	/*
 	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
@@ -117,27 +128,28 @@ static int mtk_i2c_check_ack(struct mtk_i2c *i2c, u32 expected)
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
@@ -151,12 +163,12 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
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
 
@@ -172,7 +184,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			len = 1;
 		}
 		iowrite32(addr, i2c->base + REG_SM0D0_REG);
-		ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, len);
+		ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, len,
+				  atomic);
 		if (ret)
 			goto err_timeout;
 
@@ -200,7 +213,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 				cmd = SM0CTL1_WRITE;
 			}
 
-			ret = mtk_i2c_cmd(i2c, cmd, page_len);
+			ret = mtk_i2c_cmd(i2c, cmd, page_len, atomic);
 			if (ret)
 				goto err_timeout;
 
@@ -221,7 +234,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		}
 	}
 
-	ret = mtk_i2c_stop(i2c);
+	ret = mtk_i2c_stop(i2c, atomic);
 	if (ret)
 		goto err_timeout;
 
@@ -229,17 +242,30 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	return i;
 
 err_ack:
-	ret = mtk_i2c_stop(i2c);
+	ret = mtk_i2c_stop(i2c, atomic);
 	if (ret)
 		goto err_timeout;
 	return -ENXIO;
 
 err_timeout:
 	mtk_i2c_dump_reg(i2c);
-	mtk_i2c_reset(i2c);
+	mtk_i2c_reset(i2c, atomic);
+
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
@@ -247,6 +273,7 @@ static u32 mtk_i2c_func(struct i2c_adapter *a)
 
 static const struct i2c_algorithm mtk_i2c_algo = {
 	.xfer = mtk_i2c_xfer,
+	.xfer_atomic = mtk_i2c_xfer_atomic,
 	.functionality = mtk_i2c_func,
 };
 
@@ -265,7 +292,7 @@ static void mtk_i2c_init(struct mtk_i2c *i2c)
 	if (i2c->clk_div > SM0CTL0_CLK_DIV_MAX)
 		i2c->clk_div = SM0CTL0_CLK_DIV_MAX;
 
-	mtk_i2c_reset(i2c);
+	mtk_i2c_reset(i2c, false);
 }
 
 static int mtk_i2c_probe(struct platform_device *pdev)
-- 
2.55.0


