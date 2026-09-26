Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B6AC98328
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Sep 2026 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a2QwrJTjNePGvVoDDQsoh5hhf8GU4fREmLPOvIhMRHQ=; b=mYf93k1RNvTa8vk9jFKetnsKcv
	kqcZROJzdPrXG5eB818ggyOjwhUsSJJDo3UDI9Hf2eNY+c/A5VvZ4RQb6LrWOQlTwtpMpO5XFj5Cd
	y4dgzwbWKuDIQUOWxVAnSjksJ7orB8KOXf5UcnQVth1/lTM8zfq+Hom7GNXWaNFNyZOPJ5ZkI8L0O
	1yg8QVQ4t67n/eKytP1BTbutMfwxwQpXK5Lwkrq7RX/bCsnq+Gv06drEhAIo7O42u29oRT7uZp/Jy
	ZPbkRnpNbbJ8RiXf2WrLowe12aKqqR9ek28Y4WNyYTM3VcGOwsjyL2LumE9mY3b1nKTnVp0TiWVFy
	FD3fESbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAPGh-0000000FFSH-2HTN;
	Sat, 26 Sep 2026 10:04:31 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAPGe-0000000FFRv-4BFW
	for linux-mediatek@lists.infradead.org;
	Sat, 26 Sep 2026 10:04:30 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccc02279so978696a91.1
        for <linux-mediatek@lists.infradead.org>; Sat, 26 Sep 2026 03:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790417068; x=1791021868; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a2QwrJTjNePGvVoDDQsoh5hhf8GU4fREmLPOvIhMRHQ=;
        b=oRItCPWTxDlrL3nFUL5UrxXXLMBNJeorPLiuicJbLJrP7QsqPX5HpkdbDEhca7xH93
         /7KKdaLIwEkGZ+dKDdDe0niD2QM3Miyl2eKhsdZN+K7ezmd6AfVHy39biG2pmYttg2nw
         ucxgnLOzthIKsV3rABw17UhfJBNN0wUptdVk2PON4FBmFgBTj1RAozbNeLCZVOu8RZxA
         ACEE3wkeflDP0gz+fc79aCiH2OUZzRG8hnHxF5E3EgLKWuCO4V4AN62s/rjOrIU/Zc5O
         EIaMGRnfP6v+486MJsQIsRcbY6hJQM/MoMMSF24NtyaI2WCvuL/2M0cgG8QQJd1Ju5IW
         1pFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790417068; x=1791021868;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=a2QwrJTjNePGvVoDDQsoh5hhf8GU4fREmLPOvIhMRHQ=;
        b=jQV8icZFtFFVDVYXqG7GPsMCxslecsNyDA96rjSYAyK/oqqV3TQvu5ZWRLVF66mJIE
         2Lf+6CV6uKd+GGCduRBKzFsj8CCk+GU5yyQBu+rQvRRmz5WcMxT9UN7sSh57a6Ji1Psj
         RSL3Q4apUTus5j9jzva+7gZc7RFyrKtLBX2B2ruxdNPXJv9TcYquBtlxae0PHkF8Bilz
         2v6eMs/V/pCI1uMnJq1cqRMzFaoRq9mWx06zzUPA6uy41ftxVdAymCR9rcb2DLfdASBa
         lgNYOVeFw/4nL0ybOrzIORqtNE1lXV9cXBIOpZURyo7NVQuPAYMulcYW/wPVcxG6hNg2
         yoYg==
X-Forwarded-Encrypted: i=1; AKwUvBy6VhV0oQ4Aj3V/iHAEZGQjQR9M1ja6kSqeDqIeY5/Xkdk/C6DnWWuNNyLz3tYcwZf3+X8urjyLPa9+84cpKg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLwIsffg9PFkBLG4elu2n3EP2ATzxghuaPFk/wmFnhf54lktb1J
	b6nX4Lndf2jBHEBgpMOp5XAgmnKNfgvsB0r41HiFXQkK464yleGoMH8P
X-Gm-Gg: AYBFou2LFlaQyOY6us9rUtrCiTY5mOOKC4zRUU1Mt5F6nB+xHkwq4ML+GPnJTnowaaA
	2cOQf2fryfSTg9g0RcsDqOO3kk3hxp22VNEpSKKZVyVtTN2xi2rsQZ/nn9AGPVTU7ZlGW3+kkj0
	wZBi4mXd7nWpPRIvR7IFTnNWetbQ2R9jgihIN/YzBSvK0wZRUjvKSUjo4b7MkMI7fzIMMt1Q7+1
	W7CgaV0dNef0NsNEh68mbVb7i673fgunxemvTcAOXVV+MssgJUjovWhbv4wcOeSdJyWCMnRySSe
	GXwr2bgPQ1udAusO0mtCQjbUe4Irp24K2YsHiCO2/+QFeBz1EB6sIs2nBxkPLEx6lQDIlaiVc/5
	4aTB5xY67Ztl1DaYVng4Y2MV0yA+6EgK0WuoEZrrmNq+fUMjMvukA2ipyPaXzsb4CsA10Iumjwu
	NC2E27oIHNYw53U53+hmqwasB/fpRbVg4oJMI+JJwu3hxFsMMLyuSzENxz6Kpv2iDyQMf+jju3g
	ppRtLgoOcNTI1OPIZDV
X-Received: by 2002:a17:90b:17c9:b0:3a0:c833:de75 with SMTP id 98e67ed59e1d1-3a0c833e54amr3104087a91.30.1790417063447;
        Sat, 26 Sep 2026 03:04:23 -0700 (PDT)
Received: from localhost.localdomain ([104.28.254.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9481e17sm8806891a91.8.2026.09.26.03.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 03:04:23 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 26 Sep 2026 18:04:14 +0800
Subject: [PATCH] pinctrl: mediatek: mt7629: fix the 2.4 GHz Wi-Fi pin mode
 array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-b4-mt7629-pinctrl-v1-1-23904cb0c3f3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrCMBBA0auUWTuYDJISryIukjjagXYsSSqB0
 rsbXb7F/zsUzsIFrsMOmT9S5K0d9jRAmoK+GOXRDWTIGU8O4wWXOjryuIqmmme0yXmybJyjEXq
 3Zn5K+z9v9+4YCmPMQdP0O82iW0PlVs9LKJUzHMcXouaD74cAAAA=
X-Change-ID: 20260926-b4-mt7629-pinctrl-1c6921e06627
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_030429_030823_B98691B3 
X-CRM114-Status: GOOD (  10.79  )
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

The wf0_2g group contains nine pins but only eight mux values.
mtk_pinmux_set_mux() indexes the mode array once for each pin, reading
past its end when configuring pin 78 (WF0_2G_HB6). This can select an
unrelated mux value or fail with -EINVAL, preventing the Wi-Fi device
from probing.

Add the missing mode 1 entry for WF0_2G_HB6.

Fixes: b44677375fee ("pinctrl: mediatek: add pinctrl support for MT7629 SoC")
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt7629.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7629.c b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
index 385d66b8e3fb..29a4c171e8b6 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7629.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
@@ -294,7 +294,7 @@ static int mt7629_pwm_1_funcs[] = { 2, };
 
 /* WF 2G */
 static int mt7629_wf0_2g_pins[] = { 70, 71, 72, 73, 74, 75, 76, 77, 78, };
-static int mt7629_wf0_2g_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, };
+static int mt7629_wf0_2g_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, };
 
 /* WF 5G */
 static int mt7629_wf0_5g_pins[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, };

---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260926-b4-mt7629-pinctrl-1c6921e06627

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>


