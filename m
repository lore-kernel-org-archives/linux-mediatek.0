Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A209F60A261D
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2026 17:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LuqIxNP1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fzUMgN3/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6brLkp4HNSnptBFTLt74SChIRfCfigfsHoKebnZBRPE=; b=LuqIxNP1dFLjrF6fJQj3L34p7m
	zapQX1KaUkywOPMDXDS2EenKCVf8TuXR0fzLE05QOnxqkh2DUnlKg1j8G4RSK1RzdzjebFGbGgvDK
	0MHy8IdL+OuRqjmAOeuhOoN0Mf5svj6jRmFTgG5ARLu4p1yX+qum/rrsXsxtrd/WDJ6JPyXnevzmo
	bcAJrfx582iVvH0ExpzgMr3ZgFo5QPpFBL+DHp3ZSjYdhUjeC7oJDI+tfUz0+erxhmZcbeDPq4nQq
	A0UAjwEwR/J5sZ5u/sjPQsPmjgDnoAz5xYlVDPXPgdKYgQoBOJh/j+an6EgVgVNddDbjqzqGrV06D
	pXtCUUzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJW5-0000000GluI-3olV;
	Fri, 23 Oct 2026 17:57:21 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJW4-0000000Gltt-0ftY
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Oct 2026 17:57:21 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-3514b90bb89so2629790eec.1
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2026 10:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778239; x=1793383039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6brLkp4HNSnptBFTLt74SChIRfCfigfsHoKebnZBRPE=;
        b=fzUMgN3/dQVrpsGBHR9RX9ZYkFN/9bADuargfUNNuC2W+vQCo6CoixPdd2CMdZeYhX
         70P46tpLGoMjJg62JMqttvFfQmoXLhVOJUCDmOTvZCD5H86YC7swaBULqiuTLEIiCf7e
         /SBnapfHwAwNGdokTRpECtVFfukL/YjueWgMm9ZHaTWQsoUOieLA48Dv5Lcl2P8cJgtR
         2zRPk9qzQ8oBh+z9tdNlJSecbDmBpUyFplvC3pekMxjTm8sSOuJ+LP3iCIyV1GkIO9E9
         P4NqQ1rbeNWiJy1ClussP3hu38sFTFqkwwEW4dX62KyC4/AnAEbbrBoN/y0R4RCBC1cO
         B0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778239; x=1793383039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6brLkp4HNSnptBFTLt74SChIRfCfigfsHoKebnZBRPE=;
        b=fZzT5kmJUNTW4TWFJr1atwtFhWcBktisTYqVeEvzdH71sOWsMD4JILgIL8VRp5X+xw
         brA8E57k3iG7VKV0qYVkT3YlSHsvnr+ybAu03KEAcsLo+ywRBMnInNJoU4Cbb0Af3r+s
         onxs7zDzL+BFNd82QC90vQTEGLwc2D7B2srjPJVVHOaCBe36AUtOKzMoAoMpvrDxwzzv
         zkL4tu1B9tc8QwKkXcKD2GEQoTuy4nn1BU/xubt1K69KcOgpa1s7HqgpwggHB35LKozg
         wZ1H9+O7uDLppu9ZW7kMdddUF8whZdeISmhZ2IQlmFPE+yzuWM2rdEWkhvXoEqBwSnGd
         LTYw==
X-Gm-Message-State: AFq9FYI4+AwxS3L0aWcOe9i2jbvNDK8ofsCNOavx7Hum7uohBFOn9vKB
	csW8kXw81S77pP7VINOIoTbNwG1zKSjd/mkp3Wr2SpnRmOYwmX/Hjl3S
X-Gm-Gg: AYBFou0FN7wWbytvp9jaca5ZvdGNTnRbnq05PqMAuemBOaQ7DQrAVw5SCZVGuTtp9hw
	Prx4hhgvjSaF+7dyT0QJQmdQ+8lGmJOG9FW6O/78+aFG7rVJ/2ZM9vX6wszlBw+CXtKCca87BTW
	MhCjo97RArmGJTG4OyDuL85RmVKtljMSXxPwAsyFRbSMa4i+J8Fq8fEVDijJ3I2ninFWX8Y6N89
	wicSo1fIo4Ixg/pCK45X3ywap6o6jKIiFpfnNcNMiIOGpza0FyD4y5YJ8xGjuC6f9+Jbx3SVu6a
	wfdYcBIFnN+ig4zAziopvxM17A7VLtEeiL3KpAWnoJFmrcAmLy3aiZS9z0RqX2is00r8s1Pvj0B
	hXM1wf+JoQ3SE/1WpjYR2o4LH/cDlgaKzjQpGoRX/6rTxFWhl4h7H5AKj8RMoK28/7DqQhodm+T
	THbGuqmpT6mD41QxQhJo1AGf7Q/D13t7AIgLPwfN2aZO0ZxLeIwXLNUICl0eKY9Y4y6QODNG/ub
	1nCC3FVEPwrsteklia/Aewnf2bXiztLe40LuZkBRKxMMLgwQzRvcZ6u5FgMVGNGGdJh+ViocJsK
	vIyP
X-Received: by 2002:a05:7301:1a01:b0:356:23dd:3c72 with SMTP id 5a478bee46e88-369e834e1c3mr118671eec.4.1792778238706;
        Fri, 23 Oct 2026 10:57:18 -0700 (PDT)
Received: from localhost.localdomain ([110.235.239.152])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e6c7dd34sm1139656eec.1.2026.10.23.10.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:57:17 -0700 (PDT)
From: Vikrant Yadav <vikrantyadav4802@gmail.com>
To: lorenzo@kernel.org,
	linusw@kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vikrant Yadav <vikrantyadav4802@gmail.com>
Subject: [PATCH] pinctrl: airoha: fix bias readback in airoha_pinconf_get()
Date: Fri, 23 Oct 2026 23:27:10 +0530
Message-Id: <20261023175710.19181-1-vikrantyadav4802@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_105720_208036_B1BA594A 
X-CRM114-Status: GOOD (  12.57  )
X-Spam-Score: -1.9 (-)
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

In airoha_pinconf_get(), the last branch of bias check
"else if (pull_up || pull_down)", has no check on the requested
parameter. It was meant to reject PIN_CONFIG_BIAS_DISABLE when a pull
is enabled, but it also runs for PIN_CONFIG_BIAS_PULL_UP and
PIN_CONFIG_BIAS_PULL_DOWN. When the pin really has that pull set, the
earlier PULL_UP/PULL_DOWN checks do not reject it, so the execution
reaches this branch, which returns -EINVAL. Reading back a pull-up or
pull-down therefore always fails.

Signed-off-by: Vikrant Yadav <vikrantyadav4802@gmail.com>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index f505a3f69c5d..8cf4592cbc73 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -554,7 +554,7 @@ static int airoha_pinconf_get(struct pinctrl_dev *pctrl_dev,
 		else if (param == PIN_CONFIG_BIAS_PULL_DOWN &&
 			 !(pull_down && !pull_up))
 			return -EINVAL;
-		else if (pull_up || pull_down)
+		else if (param == PIN_CONFIG_BIAS_DISABLE && (pull_up || pull_down))
 			return -EINVAL;
 
 		arg = 1;
-- 
2.34.1


