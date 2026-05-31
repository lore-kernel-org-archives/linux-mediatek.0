Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E60CD6E57
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 May 2026 16:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1LQUsVu/FsRAKce9MkHX/nXfxhg+YMTdjR29j70GgRM=; b=U03m5AL9T2iBDPsWq5whz/JPel
	FteHfMOBv3UB5psOwMsiy4i+7Ltwf5XK3yOEXJIhccwSYJTT5yc14oIaVlitqdHa5TYcGM8//5+Bc
	B8LDXQpBdkgT60QeCrPXvqx33e6Irm0ER9dYwW6bbGTF19tuJAReBTjOy/MCDvCECIr8ZGh8vlbMK
	ypJbvlWGXFzXCjAKuTYf4Erf0E1diRMljYqtrqMTXnFCr0LG4JNef5At8BrMiu7Go/cbKdIpRL1mh
	ZN57rmcyeeLRx/v5oyG23YzffplK5IUyAZWOzC5vp7S00+fTu1vXyHJwk5yU1cW0uF5A2u8zndJ4G
	inGRbxFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTixD-00000009kMA-0e2x;
	Sun, 31 May 2026 16:23:59 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTixA-00000009kKz-3AKJ
	for linux-mediatek@lists.infradead.org;
	Sun, 31 May 2026 16:23:57 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-68c3421b009so2849777a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 31 May 2026 09:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780244635; x=1780849435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1LQUsVu/FsRAKce9MkHX/nXfxhg+YMTdjR29j70GgRM=;
        b=Q3OJ9gAb9QzOhCs/vKhPs3NKM5hkU0bUw2u3Y90jQO83T76F5WcnmT+GsJYj/g5p4Z
         Fk/myYWBqUFleGZrjDP/rOLS9R05PPfFilwVocgRw8/XrbpJHk9rLP/lAz7Vwdfxq5+h
         7OtMKtg4RiR1RcHNwNGTiW9uLv5eQwNwCDro450YAf3bDURUeUVuu0xuNs0Amm3SastV
         izOJIgdeeXYgtMsnqgvbO/AkJRpCmL2VUsCbAbogKEF4ENSeo+SbXaYZ0DMWmnrJ3kvI
         zEeLrgAC4NsNZHfTX9uHjl/KBh8SR7DoDEArOIpZ/4FOMuuA8CKEBQtKGbfNLhJT3IWn
         +feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780244635; x=1780849435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LQUsVu/FsRAKce9MkHX/nXfxhg+YMTdjR29j70GgRM=;
        b=j6HRLGuKRVBx7E01SHrVcAKYFKGEgsrYAJ6gg4HqzqIljkMy6WkuD/nOMsSoSpyr46
         pd3hHdiNzk+1lTJrCEEovgD3Wp+kt6DpzRmZVnGREBr8GqBwy2VJMZQnBJ1flTUSFyii
         a7pMK9l9mZZjjWagENAvM8HvF5WD38pYc+u52WPwFoh620hGfw38EYW9lIJqg4zPW4ar
         8IWmSM5kmgdaDS+PNTmv8c8RGSlEkvyTTK7ZZqkAMOF0Jp1bBLq+BuwyYsBpJdUHu2Bo
         ydYC7Zg5svuRV0WVkn6vCjGJRuxIZcOUiunuJZrg61RqPiZVEM0GuSsMLzgyV0WbmvGh
         +rHQ==
X-Gm-Message-State: AOJu0Yxpns8cckxtGTuWAIvyglnVIQwHdtw+SbhIFqaiapvIpZFlUvqn
	/+kSSVX/TMonX7O4QEEs0B1XYdAoc2/VVDf2Lt7u0FE4ALuMjWvtZiLrignrieEeU4pSLw==
X-Gm-Gg: Acq92OEaYLBUe2OM8kXZMB7czZWC4ybnnBcVkhYIuGg6Oij7ANdTqKfWIDPoeq4Se31
	nv/Uf+IkQ7DY4NLEsQYaV0vYRL2C1Qw/YUgvYOy48wwhREtdS8WmgYUHuQsEVBNSbdc5OLVBe0w
	Q9wpnfAvnzH8YpEilwgeRcgNrCdjpVOBE1eRvK76kSgpQL7v7Mtcey6X23VfGWwYHhVUGu/GYYv
	lXjy+Mhl5QKya9286riEeQB6zy1ft8fLp/aVeoDgsmq43P7IbevHYzjWOUm5ogKuv978Vq74Ftm
	i9uprwcr7OesiJIRxDVCbwtxr2fHodNPE8bCy2vM63WxjV0jbY1GG0On8H3uRfvx0yg8BpsWebo
	y9heOL6UWS97+t2FJxT2kmPkupGmkj3y1tzy4iHOGGqK5WfgKvW7NZ7Kf9Bi/1M66b9JhqVH8mz
	wVqiu4QjO/DWZVI4T0kMQxO5umLaFOgF6T3qTVGd/555nCu1ucEmgAQcTklQBczml1iNYQ
X-Received: by 2002:a17:907:d1e:b0:bc5:2352:555c with SMTP id a640c23a62f3a-beab2372384mr305413266b.14.1780244634733;
        Sun, 31 May 2026 09:23:54 -0700 (PDT)
Received: from localhost.localdomain ([77.241.232.0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-be9d2de536dsm239985766b.15.2026.05.31.09.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 09:23:54 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: mediatek: mt8167: Fix Schmitt trigger register offset of pins 34-39
Date: Sun, 31 May 2026 17:23:32 +0100
Message-ID: <20260531162340.5326-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_092356_796216_37D1ECAF 
X-CRM114-Status: GOOD (  10.30  )
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

The correct Schmitt trigger register offset for pins 34-39 is 0xA00. Value
was verified with SoC data sheet.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Fixes: 82d70627e94a ("pinctrl: mediatek: Add MT8167 Pinctrl driver")
---
 drivers/pinctrl/mediatek/pinctrl-mt8167.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8167.c b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
index 143c26622272..c812d614e9d4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8167.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
@@ -244,7 +244,7 @@ static const struct mtk_pin_ies_smt_set mt8167_smt_set[] = {
 	MTK_PIN_IES_SMT_SPEC(24, 25, 0xA00, 12),
 	MTK_PIN_IES_SMT_SPEC(26, 30, 0xA00, 0),
 	MTK_PIN_IES_SMT_SPEC(31, 33, 0xA00, 1),
-	MTK_PIN_IES_SMT_SPEC(34, 39, 0xA900, 2),
+	MTK_PIN_IES_SMT_SPEC(34, 39, 0xA00, 2),
 	MTK_PIN_IES_SMT_SPEC(40, 40, 0xA10, 11),
 	MTK_PIN_IES_SMT_SPEC(41, 43, 0xA00, 10),
 	MTK_PIN_IES_SMT_SPEC(44, 47, 0xA00, 11),
-- 
2.43.0


