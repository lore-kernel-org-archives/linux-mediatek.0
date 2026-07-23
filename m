Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F3EC531D0
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2026 18:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNEry2bLNg81OguQ9I1ru3wEUBWoj/YG1funVUmQkdk=; b=DS1tI0zhKjSChyYWfkCqMUxTsX
	kaOCh7gG1xXXVwcF4no6MDaphx/CalLULDCAs43DcWkak241nc/9pj+8crazjDzAWK5YiaB2LkhLS
	iWVGr4N1egzZ+ZiHKJaqC5RRKCBAvMgKbclDeMVkM1PSh72QqaGEAZM8FVxfGoEDdPASlwnHB9w3Y
	ODgFXZurQXPG+jngh5IqUOitXbx/w8r3moCVgNv8pzYGFxuZSo7H/wa88DdV+i4xZl3z01eEKTOau
	sb3heGzUZL71Fbwu9mACC1AzAJ08wHIjH+2WdW6+DI02d2+ScbKm77GKniWofmUn/YS87flzlDcA1
	nguaLN9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmyRk-0000000Euhb-01Qv;
	Thu, 23 Jul 2026 18:47:04 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmyRg-0000000Eufo-3hw0
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Jul 2026 18:47:02 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso1228320a91.2
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Jul 2026 11:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832420; x=1785437220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNEry2bLNg81OguQ9I1ru3wEUBWoj/YG1funVUmQkdk=;
        b=FeFwSTDN91Eb9hcU7ZFGxv9xGxf+1EGeMJ3QQwdQ4pHTXkOn4TacMS3+FHUI3nys7e
         wcF5wgXhGyIDbdfPCXGiir6fNVmuA2gUdrzCfYwVNUtzQqR/+cv149YxncuIJ1tEAmwl
         3aV95EjDGakdde5mB3BSxg/64P5h0jTjc442SJhHrKpm/oG0SYUWyf5VpTCI99UdeEOH
         682ZyNCggC4UJdhRhsX9on/Sny4NWwZjGBzTCDy0HMEiaDcZ4F+DPPM12w0aOtJ9hK0k
         sQAMHl0VyIWZmZNWz2x/yS+9+IeAsUB0rNiw21TprbuhqUSBXFHwOGOYJ6zl6VHeU5Rw
         vUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832420; x=1785437220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BNEry2bLNg81OguQ9I1ru3wEUBWoj/YG1funVUmQkdk=;
        b=iQ6XTRpW8+N0dI1rdnKSvSO1zd5mfLuAJS1Jfn/5inHXST9BkVrswHOcDm1E8h9b0k
         o1K3QUuvMEFUl0h3lkDTgA7xHaVPea+0UWt3IUeuG7d5GKgYNxTyxUjZfCBcepasxm+C
         2emtkS9co4LyQZyjUI7Ra9KQXssdGU9us2MTtBOGu2TZV1f+pyjRu8pRFhUuRlk+9i3D
         nCHSSPBfuxzMbPMYJdAefHKnfiqNwBbIE7Wk/oBndSL5N/uLZFWIqRgMua8MrIY5PZi0
         TUroECK/cwtm8eKUTaO0Lexh/w/lYLTja3daqr8EjqnK4vL3gal/SHG10Cjpw41vjBvX
         GCwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp43K7/nfFbHGgIjnesH3ZFeBV7Arz4YAAaY3bu0TFJltIbE0X3TNAgvEfNBR4TJbjiGgcdA7vOWf1p3HMURw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/0FGAUrkxGptDes0vMLBpqKZOVTmolJYQDJvhzYJXRhEAlUGM
	iQVL2YXcoKaXuamsjML46tNiAlzAPJPCsYxLg9hCMJQUacJ8Cz2Sa3K8
X-Gm-Gg: AR+sD13LIwUItGZvIMMfN2wDU0l7yOT27vR5veOnOTJAn9u7UDH4/Viy+nTQINpFYdm
	gcLnTSNBZQ9KQCXgcz9DKfUXAG3QvVA52X8Nph0Sp5VzBO9A3EGdd7P3tax3vrr9g2lkbFwr6wk
	wvbsI+ogUKqJEHcDQ5CLu3WD8jPzvhJRBVrYueKdARs9L3QQGLGGYeCiBRZqpsAqQx5K2eA7hD9
	sUppU5WvaYOz+LvPQtkOvunfmVAO8fsIMSDilxzRXYMd615DG7w/M/zUzjOxuNwfCeXj2kNbiGW
	rmt5U5hGq0Mg5bZY7XPs7ttlz3qul9tyYM5cKz4TQh6gWY9ls2J4zkcsI2qSr73vJmmcjMkSNif
	HPMwccd8DpgyX61t/i8sKlGE/XzLduaKj39IXUcBpkDKjChyIs6us+tu11ORRNrQAq4X9K5Hg
X-Received: by 2002:a17:90b:53c4:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-38ec657558amr4646237a91.10.1784832420077;
        Thu, 23 Jul 2026 11:47:00 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af8a45sm308155a91.10.2026.07.23.11.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:46:59 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Julia.Lawall@inria.fr,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: cocci@inria.fr,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 24/36] pinctrl: mediatek: remove conditional return with no effect
Date: Fri, 24 Jul 2026 03:45:26 +0900
Message-ID: <20260723184538.3888637-25-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_114700_934256_9C77AE3B 
X-CRM114-Status: GOOD (  10.87  )
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

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 4918d38abfc2..a8ab982d8f21 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -1242,11 +1242,7 @@ int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
 	if (err)
 		return err;
 
-	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV_E1, e1);
-	if (err)
-		return err;
-
-	return err;
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV_E1, e1);
 }
 EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_set);
 
-- 
2.43.0


