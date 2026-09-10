Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6562AC79FB6
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 03:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YKJjaLrDLwATiTkeesDmHnGi32ozSCfkATjDcADW814=; b=XaezWz7Rr1TE+uOBd38KX848wJ
	5Aefic7+f15Cs3rf0K40boy+/7x7CXJRcPM+HO+pLkitPzpTY5axi2ZVp8xTvXp/r1gu3/R90kTeG
	C1m1q72aVUJLNuGHodgD/lwIh7gRkXL2s9ozTLhfLKMnCuB/+qRzoSFGrPeZSMcVrA4KSjAD5YpLx
	AB3RKI2SnIVTo+KhpxHlgMHAfRhUvPc/ForOiYoy68gCqjgAb/Lf88Ekp+A19WuHwm2URzs3OrHlM
	sd0qdvsQoUjRvjJwcaBIc5hO0B/UcwYOl0F4CMudpBkoY4MSwcNQSgOKSl3+KYoq7RyY4bfrrh4b4
	mayo1xyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4VUG-0000000DHpY-3X0N;
	Thu, 10 Sep 2026 03:30:08 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4VUD-0000000DHoS-3bcR
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 03:30:07 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso4741205f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2026 20:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789011004; x=1789615804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YKJjaLrDLwATiTkeesDmHnGi32ozSCfkATjDcADW814=;
        b=I+7QM6yex88wECCB9jE64nopLtevXp5aP0XqEy2uQ58XCeR+4CvjIpokzG7AOX25QG
         6XPrNZYX5kIPHXTPxkCtWIOmp2LtHMCF64HG3MhcHboZO9yUZ+zysGiXYaFIj/cQmRon
         /H1T7iG1jmJsfJiDN6imX2bCRf50uFS2PmoXk5ghMnJissZCQbZlCJShpmTh2OiGZuY5
         Ick0pojxAC/DN8z2p4D62/AhVPMt0PZij4R4C3/vFFE28Lj89VSEMJp8fVOGsssctnAU
         JQgsDZWvrBLToqyqSWqnyxc5x8MdickO/21tn+5x5CLb3DTdqznse0s77rECMtL2LxWU
         cODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011004; x=1789615804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YKJjaLrDLwATiTkeesDmHnGi32ozSCfkATjDcADW814=;
        b=JGPI41MQ4BwbOoYjys6nrqygAP/vLL6rV/TyiURwytyYTGAI5K1oI3UeDE20q1Y1yK
         tgCZT6RaPw4u35aSyHifDb+z7WPWUZ8ySxHnBC4gPlXMUhEN9RIlE9h6KsQR6WZdtDaa
         raWaxr0cft4kXlUzSRuFE/e3uyOF/Dvtcn/PhA2lez8LEnFeGFtwB+w8oidBGa44WBsh
         2h518RIa7xPanV6m+WvJ9JpqJKjhxfHD5+wf5OCWVRmkhP/MH0xt2oPQMfOfM4XJYCxz
         lqup8kcm1ITKrLh+WjaYQNt3uctbBcJ7xjJ1Eh+LGVIoGID6caum+igYHAvvo596rW3g
         8W4Q==
X-Forwarded-Encrypted: i=1; AKwUvByo0eAnhY/E9wC2EJsej3Yp8zLS7DTjHysXwFkcVs5Kr2ylRnstWlqiAJVDWfbIRnny0eFDMqPQ21fSr3jrDA==@lists.infradead.org
X-Gm-Message-State: AFuF++mXB7SmWx548ZXmkXjgvCAf20bXP/7O/4An3lGvu2Dqjg9R5gzc
	kM4K1D4qp4aWuLRUspGZfRWqTniig4Cyd3J+x5VzYBUoK8oiaLFaxJWM
X-Gm-Gg: AYBFou2aM2m0ivpIDzkxCa5UAHNCn9tGX9SXnaC1xYXetJKj3YUn2LuPqU/HKlfNOsa
	yoPGmRiF+CkaCo0tblVSYzfok7C/pCXFAkzgUuUkd2r1pEovHtOxWnhm9bq98NLbdvxMLFkH0Qz
	ZEM8aprB+803OboItftSIrw0587SPSgCx7/D13BdsAMXcM/65mFo6BNgWF9b/mY9Y31GaX0UVNB
	oNYEjMgzvVCczeSr2iouDRw6xua7lJaB2azZiCT6XcNim8FisZ3afBMRjvWNZ2sMcZZwol5kp4t
	wcM14Q8lyOa40UYhIbMlGi0s+5MFRY6DoQ2wUooam/ccII9SOo9mHwrJjP6ETACdA6acDZxK4Ox
	NDxbV5M5u2Ger5P7VD714YDJWm2tG5GMvG1aWRGJ2W/PKzZ+qiQhR9/AEDlANNetJUKXe81/xmL
	lE9wGID+/Tivzu4DdZx3EVILdGti8hedHiyUP4+Ih29B/tAtWU5CKJ6BPQSOQdzz7DNffaY0800
	IG4WgP3YyLabDqtcnkoNJnU+wcvR50rkDuP2E3vn6ag+1ufKT4G6hpOfl/PVS55dlvDte/JnwT5
	ZnFEefiIrp9vUhaummVqKWqw5nfBIZEKmndqetwh0SYZNSOlB9t7D5JU7P9ZiqE8RkIfNwOrllA
	=
X-Received: by 2002:a05:6000:46c2:b0:484:4769:18a4 with SMTP id ffacd0b85a97d-485872cd677mr30353937f8f.14.1789011003718;
        Wed, 09 Sep 2026 20:30:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b3d9-b901-0402-5aad-0ef4-88ac.310.pool.telefonica.de. [2a02:3100:b3d9:b901:402:5aad:ef4:88ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm42468266f8f.9.2026.09.09.20.30.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 20:30:03 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: reset: Fix device registration kernel-doc
Date: Thu, 10 Sep 2026 05:30:00 +0200
Message-Id: <20260910033000.15926-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_203005_938637_82A60CDB 
X-CRM114-Status: GOOD (  10.92  )
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

The comment for mtk_register_reset_controller_with_dev() names the
older helper and documents np rather than dev. The new helper takes
a struct device and obtains its device node internally.

Use the actual function and parameter names and clarify that failures
return negative error codes.

Fixes: 761bc64003e3 ("clk: mediatek: reset: Add new register reset function with device")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/clk/mediatek/reset.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
index 562ffd290a22..b09cdcab0c4b 100644
--- a/drivers/clk/mediatek/reset.h
+++ b/drivers/clk/mediatek/reset.h
@@ -60,11 +60,11 @@ struct mtk_clk_rst_data {
 };
 
 /**
- * mtk_register_reset_controller - Register mediatek clock reset controller with device
- * @np: Pointer to device.
+ * mtk_register_reset_controller_with_dev - Register a MediaTek reset controller
+ * @dev: Device used to manage the reset controller resources.
  * @desc: Constant pointer to description of clock reset.
  *
- * Return: 0 on success and errorno otherwise.
+ * Return: 0 on success, negative errno otherwise.
  */
 int mtk_register_reset_controller_with_dev(struct device *dev,
 					   const struct mtk_clk_rst_desc *desc);

base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.39.5 (Apple Git-154)


