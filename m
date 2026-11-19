Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AE1606CC61
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 20:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2O5psTZo;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UvNfOuGX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OtxuJdycJg4ztQS2bYE6i0u4pJUkPkHwSDNOgdsJ2JA=; b=2O5psTZo36NTf7
	MUZAYR0QpJsIeStAg4qkLqzWB3NPcXXvmWYJuTp+AeGFWUhnNw5LgjdXmyOtPgFnK/5NTBfQsFsFX
	2GuI2mPLCcA3nmXmaZJOYXvbT7KvVhJghY7GhVdBg9rle9wCwOFWZLvE1/VmV+V7+3IquZomiERHi
	bOaizjcR0bLRUeSA+3ZDFuyPC0erwnOMbUOzMIGoHjY2xvKqPtNKJY1eJ0ZpYxgpGAI9nuz+IdOhs
	+KsnZfoI8ZNK7FBfVN+1OAcUVmaw1Xegn+FvSJ9UTZ59mujjHsv1yQOKePfABM6ka7TSjg6LY8Kj0
	taB1Ezp/Fva0q0+Z4cJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU93a-0000000DPhc-1v8r;
	Thu, 19 Nov 2026 20:48:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU93W-0000000DPfW-4BB4;
	Thu, 19 Nov 2026 20:48:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DB6044447;
	Thu, 19 Nov 2026 20:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475461F000C4;
	Thu, 19 Nov 2026 20:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121310;
	bh=OtxuJdycJg4ztQS2bYE6i0u4pJUkPkHwSDNOgdsJ2JA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UvNfOuGXgzOfIW+jo0Cw6IHNlnY5awQimnYd/wa2dMd1iPH9zcI2SS8X5OYP01JHx
	 ZnsLASdKAtk3zqh3387LMC1+zJ5Hw83sTiBF3jlOqqZivplBrYDb7+2zmmmuJMbrYW
	 8myd6s9TRh4ZWLiExoycbxEl/FWETDIQGSOiPxJ8+eFTFtYjcPOXfMvKyvmJvIREMm
	 kGSXJF5MeaabtAxXatcdlygRFRMVfGXC4E8euKlOVL3h8+wttQ9l4dsRjFJicJ8CxB
	 JSaEH/uXyg5s72EDl1hDz/D3krGbJQQME3MMA7LMlOIta9Z6u+lv32X4Ep8fKNDnln
	 ArmOke/Ap5B2w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Hao Chang <ot_chhao.chang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 5/6] pinctrl: mediatek: Clean up partially initialised hw->eint on error
Date: Thu, 19 Nov 2026 20:47:20 +0000
Message-ID: <20261119204748.2558209-6-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261119204748.2558209-1-lee@kernel.org>
References: <20261119204748.2558209-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In mtk_build_eint(), if of_property_count_strings() fails or
hw->eint->nbase is non-positive, the function returns -EINVAL directly
after allocating hw->eint without jumping to err_free_base.  Because
callers such as mtk_paris_pinctrl_probe() and mtk_moore_pinctrl_probe()
log a warning and continue probing when mtk_build_eint() fails, leaving
hw->eint non-NULL with hw->eint->domain and hw->eint->hw unset causes
mtk_gpio_to_irq() and mtk_gpio_set_config() to pass the half-initialised
structure into mtk_eint_find_irq() and mtk_eint_set_debounce(),
dereferencing NULL pointers.

Jump to err_free_base on both error paths so hw->eint is freed and
reset to NULL.

Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
Closes: https://sashiko.dev/#/bug/linux-0689c07e-ef74-4bc2-b5de-bd2f361124bd
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2:
 - Clarify the commit message regarding mtk_gpio_to_irq() and
   mtk_gpio_set_config(), while handling NULL eint on suspend/resume in
   the preceding patch (Sashiko)

 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index bf9d20b59213..95d0455f7d53 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -382,12 +382,16 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 		return -ENOMEM;
 
 	count_reg_names = of_property_count_strings(np, "reg-names");
-	if (count_reg_names < 0)
-		return -EINVAL;
+	if (count_reg_names < 0) {
+		ret = -EINVAL;
+		goto err_free_base;
+	}
 
 	hw->eint->nbase = count_reg_names - (int)hw->soc->nbase_names;
-	if (hw->eint->nbase <= 0)
-		return -EINVAL;
+	if (hw->eint->nbase <= 0) {
+		ret = -EINVAL;
+		goto err_free_base;
+	}
 
 	hw->eint->base = devm_kmalloc_array(&pdev->dev, hw->eint->nbase,
 					    sizeof(*hw->eint->base), GFP_KERNEL | __GFP_ZERO);
-- 
2.56.1.750.gf70dc682cf-goog


