Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB986C28B30
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Mar 2025 03:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QiHxxwrCXq2b5j2dH38FNkm5925po8OjgAA4/miThgY=; b=TZ5KckjHNhja4KCNYDw8YrEoOt
	qkIEk3DDlNAXNgKuP2t/YPwzoyALTJNO9KgFllYohLpkbJMBOrekm5ybJphdbx5WacyJZqS9cLLxW
	TtHOWj2POSU4xdeF1GxPyRpsQWvCAE4OjYXPSKa/8Yvi4WY3XgEEvZLc8a7wddNcv5hG3E4ACf/3I
	5ifJUh+5Ghi9McB7nPoUn/4t1XEbS1MHZ4zXJjSw2w/qfKTOCR6DUvvSTuTsKWvfFxAh1f/hEYMdw
	Xf0ih4hW5xh3AdkhdJBCrhh5E/RtIRwu7HtxzW1K/5XQ+mgatAjLLC7LAls6qqf/ihyabsm8CrUtG
	49DWnYAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsCoD-00000007Pso-05MY;
	Wed, 12 Mar 2025 03:31:05 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsCmV-00000007Pli-3tKw;
	Wed, 12 Mar 2025 03:29:22 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowAAHDm6C_9BnRipvFA--.20421S2;
	Wed, 12 Mar 2025 11:29:06 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	amergnat@baylibre.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ASoC: mt8365: remove unnecessary NULL check before clk_disable_unprepare()
Date: Wed, 12 Mar 2025 11:26:00 +0800
Message-Id: <20250312032600.1235158-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAHDm6C_9BnRipvFA--.20421S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XFyrKrWkZry7tFykJw4kCrg_yoWfXrg_Xw
	4kKFnrWa4kGrnakw15Ga1qvFs3ZayUZFyrX34FyF1DJry5Gr45CrnFvw13uws5Jr4vkF1U
	Xrn8ZF4xCr4fAjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbfAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r48MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjRpBDUUUUU==
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_202920_347013_BCF494C3 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message.
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

clk_disable_unprepare() already checks NULL by using IS_ERR_OR_NULL.
Remove unneeded NULL check for clk here.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-clk.c b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
index 8a0af2ea8546..7078c01ba19b 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
@@ -49,8 +49,7 @@ int mt8365_afe_init_audio_clk(struct mtk_base_afe *afe)
 
 void mt8365_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk)
 {
-	if (clk)
-		clk_disable_unprepare(clk);
+	clk_disable_unprepare(clk);
 }
 
 int mt8365_afe_set_clk_rate(struct mtk_base_afe *afe, struct clk *clk,
-- 
2.25.1


