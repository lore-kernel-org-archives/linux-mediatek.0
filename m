Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4FBFD707B
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2026 11:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6Df0BkW3+WFtbc+05LpOma2mHXyroUqsKpSt0hTLJrY=; b=KaeMLfZLldXPLmgA6ajVJtg56a
	pJG1bybrBid8rPUBNXE2+c8cf+KyzTKmAnwnK+w+4j7Dj9hnFi1XUxX1OGPstdqIAhQcFmKaOQCFN
	XXH0xDDC+yCARbpUsEBXvbjBvvhcYEm9aB8SH1N6u/3jQt7BUWfhIYYMBLxljg4LFBSNM7izSW1F+
	5U9vE5ws6ULIlqnVe9Xp1D3Qizk6d6FY1aQ/toq8lfKn7/EIv3JR3z7H3PsAiQBkNNXh0qWIfIbYN
	zllwRPIYot8M+f1Sy6HjAx/AMYAYjaC3w1gU/Rd0HKS4khxpcexsTinRcC0alrUy+hbUP75TPJmwj
	I+cLPm5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SCe-000000065FD-08qm;
	Tue, 17 Mar 2026 11:03:12 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SCb-000000065EW-38Nj
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Mar 2026 11:03:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso46997345e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2026 04:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773745386; x=1774350186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Df0BkW3+WFtbc+05LpOma2mHXyroUqsKpSt0hTLJrY=;
        b=XqwHmOvn9sYV8FG+TefPM7iZW5wULNj0pGfSDqAcj2sUurIZauzjKn2aSMBTf48mUD
         2et0weNdDrhNezXmc2k4Xmi3NPUOYXDDRco6GSGg54/3j1HE6aM2T3eF8jgWgo6RoAcH
         Tc5fCCNCSX1FdRXKHXQddkwMBNg0vTmjZ/+3CjRykYL+Rp6BrPPJpNWXOQ6x4aTU8yoi
         aCTFxo50qeK0dHAHGOLGEd7ceJiC0cJDRBcOLYf9SYzpzKZGBwPvarPLVzwTDW9gEesw
         iURmpM1BqUC/6Au5BL/kWzywmz3bYtIt5aZXRj3voBa11PrPtVsXkQKN1mV6FPTZZwXE
         955Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773745386; x=1774350186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Df0BkW3+WFtbc+05LpOma2mHXyroUqsKpSt0hTLJrY=;
        b=jYuzMqzOObDIXLbEmvJ/RdSjQilTF0s6szsB+VpFp2wg/ixfyzDtXyhyDRcypVemRN
         OhCqdF1Hoh0f5e+qMY6ExW92a2VhtgjD6ApqFq7kBXnKcQ3ZIavgnKUMH6p1QJhosbxc
         V7xNfvltsMAFaUBARZOmBDeDoS3YxvUKMsff4hXn1CrrNgr2u+ul9RI29gnxRpSniEzs
         A95N6925Pz/K7z84yJRf+3YdNQ87yLiOnrJBa0QR3yDQEBPStCMN4iR287NGjD6ihjhm
         ejHBQ8TRcEx1PLXhaR9t0FIQqqb8Ue++OiQ7GtezMVVymackvtbK8rohyt8F/0n3JYbo
         kLjw==
X-Gm-Message-State: AOJu0YzHZyU0weEBua8U4/5z6pTse/qMMZXPGDVn45f1lcF6pw/BfMPi
	zOfRVJ2UGWQGPh60bm3R/M8zkZbTC6dEFsnTbxKfzclYImesH63lCQ6OURKAqLd/
X-Gm-Gg: ATEYQzyzji0ka7F4aZOH4ltz0OUhHknNGjHImOzE0ReJ+IcElZxt/aPeakvg1Js8V0r
	SX9nfv6h3RHWc7j1SA4FGsktPW5VYgK8QMr9vrCZWep57C39U1yfzhvTxi4hWNsQ6t1nMWVvDRD
	e5nlzdoLLDMieKWeBeWH8dtmVoLoUtfqK4O9/705QxqdD8ZkbpuOoNf1mUhHjz3NBmXDhRWM23A
	lMGKRRnyHXGw4U0bl7cbk4jQCKUkh9pJt1sV9iwqrKs3lY9AwoX01VBPxWxkPWmgW22A6B8rP/8
	qt7Y2YRr7gKE9LwXLxpSsmCJsLRFMdXQX9mLwD36oGLF8yI+kBaZ+4t2FhLq6nI7PTdxoJtckYd
	vdVq9rVZPcJCSvQC7utb77toA8QMX4GPJss/ZeZsCsBbJlE/C/033OTC3V0kHpQxEw+nYsVxviG
	6oYC57wHi/vWcY7B5FFGI=
X-Received: by 2002:a05:600c:46d2:b0:485:3c66:e230 with SMTP id 5b1f17b1804b1-48556728c71mr279412485e9.29.1773745385947;
        Tue, 17 Mar 2026 04:03:05 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856e850634sm106157845e9.0.2026.03.17.04.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 04:03:05 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: mediatek: common: Fix probe failure for devices without EINT
Date: Tue, 17 Mar 2026 11:02:06 +0000
Message-ID: <20260317110249.391552-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_040309_782792_B1AE76A2 
X-CRM114-Status: GOOD (  11.30  )
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

Some pinctrl devices like mt6397 or mt6392 don't support EINT at all, but
the mtk_eint_init function is always called and returns -ENODEV, which
then bubbles up and causes probe failure.

To address this only call mtk_eint_init if EINT pins are present.

Tested on Xiaomi Mi Smart Clock x04g (mt6392).

Fixes: e46df235b4e6 ("pinctrl: mediatek: refactor EINT related code for all MediaTek pinctrl can fit")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index d6a46fe0cda8..3f518dce6d23 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1135,9 +1135,12 @@ int mtk_pctrl_init(struct platform_device *pdev,
 		goto chip_error;
 	}
 
-	ret = mtk_eint_init(pctl, pdev);
-	if (ret)
-		goto chip_error;
+	/* Only initialize EINT if we have EINT pins */
+	if (data->eint_hw.ap_num > 0) {
+		ret = mtk_eint_init(pctl, pdev);
+		if (ret)
+			goto chip_error;
+	}
 
 	return 0;
 
-- 
2.43.0


