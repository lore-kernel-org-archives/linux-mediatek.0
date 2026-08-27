Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDF4C61DC2
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 10:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ntmVipoSayOwXs57Kc1THh0tKdh0WN7s/EHA02RtOpA=; b=h6g0Zvm4/MYs0fR3XSrAwwbVu7
	YUc4sqIqZzI3PkRX5QOx7AM7O59c0tz+bJFU7Ghq3h93y7FGbilYNoS/tzkueVhRcDBXFZB34c3KR
	NTxcQ5/binlXHQcabZssFDios1yIhqgsGNkv220pq65dgleH+SD9fKs7ta2HvDdmh6rTKcdPNu2mQ
	sQknVwozAqX3g1tDLgxp4UTRYXHYHP3XpSo9dWn2bH8LOlib637lN3Yeyq0e26yLa4QaeITTXcAfq
	AUi/wIEX/en+B2F8ZyK+Ft4O1qC+cDAbRJlqjpelNEGfC0cczN/7+U00amcH+HBHQsNJukM2xG7hk
	N+HOkjXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXnp-00000003rSq-0hEg;
	Thu, 27 Aug 2026 10:57:49 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXnm-00000003rSB-46BR
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 10:57:48 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-ca7c1176317so1821739a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 03:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787828265; x=1788433065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ntmVipoSayOwXs57Kc1THh0tKdh0WN7s/EHA02RtOpA=;
        b=A9NlXGA+a5m4U3EmOblQ8ZnDhLBJxodUenCXXuyeraPnYaGPCN2fMBDwFwJjCrp/c9
         GzykveyFm8do1mnwPF9nd3lxUS27S0OO3ksHX+j+io0PYKagagEcBoJMs3AylROQvWm0
         qX4gLdjZdHNeAEDS06Uvenoe4/6D5yF7vMXKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787828265; x=1788433065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntmVipoSayOwXs57Kc1THh0tKdh0WN7s/EHA02RtOpA=;
        b=tAT/TjVXMiEP6m94EfJwLKV+dzxIwq7bYfLk+9ghjBGVbSp41d4wSyw0mwNVm82BXh
         hezLuwEtQ4wW1ILDr51uu+7Qov3MEi4YkDPNrUnsUaSaMtwg/fQV6BJERQw9SwPMfviA
         cxauNnfp3eptKfRxyOzkMTx1xiOozVmQHYhvYrOsrVVcC+fsdkwShd3KbJ2mjbGPHemA
         UNPjjwwcVV4000WTn5Bt/3HnOTqxy6kDjmOFOCddC/bcRmH5iIYLVF+Cya0Hc3tnHBoX
         W/GdtyyRX2w4tO/7+zXCLZfEuQBh7WQBSUluLUyxtMgS0Ehsy2u2uVzXKYhY3QXcJaeg
         yMqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrf3eBkdqfrBk5nivQiK4yIUy9iw8U3aMEj7idlq9uBlbsxi+zsigCQqC0b/ckYmDT/+vLiWD9bn59NZBF5GQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lfs2THXAR592YWLGuLW9C+8B38SaPKn/4XGUXDkYDVghR1KwtD
	yiC6lRs/pvEH41ZQMxydZlGj2Nl2GxlzkfNn2rCK9tOZtNk0oCFQ8y+SFuFwdxPODQ==
X-Gm-Gg: AR+sD10TrTINyRklfllDk4gnj30WowkLZblnsS0annTXSWBp1LvZpCu7aI1P1C9omSG
	u46hykT66tXGnCYb9S97ICfEMfrLsUC3W0LzvyR1kfpg3MyiyCvzULNr5YCXcXP4eW+z8bKxC1+
	BUkwQOxyuU/akIEvfTykPJY5pCBhS6xTWcV9RrWXlU/NS88LnTt0jVvViZJWEfErbMsRogzSbrK
	ceZg+PyRsr3nH+BeJCZUX+78GJWdBw5QtW1D4CK7ZnXK4/oHXFJ2S89sqOyPBprbK/qaro5M0C8
	6QpGDHY3dJp+kUvKVz3ol3TLBeiEoPJ/LHxW4nLILQfYoWxDBlN7oObaVS2ehEptnQAYCR3Mg1u
	WKzEONI5qUfKlkFQ3xgT8WIuqfxftMi5X4byFzH6rHDTOUrTiz6qiH/aPYzTtyfPQXeuy+LikuN
	rJQ3cXJtIUkHp3JQu1Icm30SGljbiLMbEXXll9j6+ljojQAcNMkgiWF+MVmI9VIOO5mCrMhNrRu
	HcJkac8qoCDR3AzGHfX1c7j3k5jOBhiYGZEMcnI/KbkmJpHy1dvo1JGXQ==
X-Received: by 2002:a17:90b:3fc4:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-3966d443146mr29645548a91.12.1787828264658;
        Thu, 27 Aug 2026 03:57:44 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:b7d8:fa42:587e:234d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b186807bsm2434123a91.12.2026.08.27.03.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:57:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pwm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH] pwm: mtk-disp: Fix period readback
Date: Thu, 27 Aug 2026 18:57:36 +0800
Message-ID: <20260827105738.8570-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_035747_027228_E4A85F1B 
X-CRM114-Status: GOOD (  12.94  )
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

The period value stored in the register is the number of clock cycles - 1.

Account for the offset when calculating the period in nanoseconds. This
fixes the discrepancy reported by the pwm core when CONFIG_PWM_DEBUG=1:

    mediatek-disp-pwm 1100e000.pwm: .apply is not idempotent
    	(ena=1 pol=0 281500/499875) -> (ena=1 pol=0 281500/499750)

Calculation discrepancy in the driver was found by AI run by a colleague
while debugging another PWM related issue. Check against SoC datasheet
and fix done by the author.

Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
Cc: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pwm/pwm-mtk-disp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index b5409e15dac8..68a4512e821a 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -212,7 +212,7 @@ static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
 	 * period has 12 bits, clk_div 11 and NSEC_PER_SEC has 30,
 	 * so period * (clk_div + 1) * NSEC_PER_SEC doesn't overflow.
 	 */
-	state->period = DIV64_U64_ROUND_UP(period * (clk_div + 1) * NSEC_PER_SEC, rate);
+	state->period = DIV64_U64_ROUND_UP((period + 1) * (clk_div + 1) * NSEC_PER_SEC, rate);
 	high_width = FIELD_GET(PWM_HIGH_WIDTH_MASK, con1);
 	state->duty_cycle = DIV64_U64_ROUND_UP(high_width * (clk_div + 1) * NSEC_PER_SEC,
 					       rate);
-- 
2.55.0.887.g758fc8c411-goog


