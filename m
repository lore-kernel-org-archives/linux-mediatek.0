Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABCCC61DDA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 12:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l/wCsFq/Zorgy/BqKS/v6a3TdSdfv1vfVKndsRYo1PM=; b=NzHyho2/NUAuAIuT95+G8CdAKP
	FVAAfoQC5AtDnOMCTf7IKzC7O4b+Hd8x/yeEGYjKy9vKmztQXIWlOlUx20b0cSmFJEN/GxGZRr31R
	Q10/iKyIZBGReJHA4yrmJmW9GrVF+rNBT9eUFAcuZ2yQusQAZA/EkGywA47WG++r/ooX+NkyNy1a9
	E9KE7mi5lgTSm40eZnZtGuHoyFsdSV/H5/cVAWxHf+TaoFS4anrY9xkGYlKNaD46adkpGVffkCMHK
	9g+XfYSA6GPLQdi7ay6c3nXAUlGxteQxPK6GJJu5w+vhN8yb1aE/JYGfGz49polwCLjnoocaG/uSu
	g2gfRwbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzvQ4-00000005hyn-1UJe;
	Fri, 28 Aug 2026 12:10:52 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzvQ1-00000005hxR-2NRZ
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 12:10:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso6060365e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2026 05:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787919047; x=1788523847; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l/wCsFq/Zorgy/BqKS/v6a3TdSdfv1vfVKndsRYo1PM=;
        b=G2yAP1XiGHCbiG5mDNWZLzPQSZmhvxDdemsSiB5KOPjRwa96lFKoTVLC7hHA2quLm5
         dlQh/J6aV6yOpRQnANxo9nTCncoW0eNmJPOTs5djA7oXmMj8Pjbldb75qT3bTTHhIptG
         I8OuqEgFATzTQHc6Zs5ANatJY6Ml2ZK50VgB9zfPBR6FmIUifXBFjM1G6+QWWqKJh2zN
         Qy2uarLMwDsTuSquXw94Dv8+MbcA9y26qvUVW4o3xT6SVJPOGMkarSrPl3pxPuiUtFrk
         wyn3mRCkQpdmXK+QB0vrugKWnUPSrUYSvuMDyOXTd09AL1ZDih54LwjfmJQYgSlpuhWC
         +nmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787919047; x=1788523847;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l/wCsFq/Zorgy/BqKS/v6a3TdSdfv1vfVKndsRYo1PM=;
        b=XcxE1LmNYCAqB+3VOALSkS5ErpD+yMptuCu0pmQQT/vwkQKwE5OPx7PCmexDse2nke
         MJcHlHiEnq/xnavoLKIpuFfe7zaN+AJwVIZkEK4ir54WYCZwddtgQoLHUEKQ0E3T2EJZ
         0lYHrKrqFPUv7At6q+A96hPt4LQLfsO762FlMOzy71j/Y20gMfiJwcbByuOyameIDypX
         AJjrMCQVvQVOE5fjx7OIYSSLZqOnrGAx8zcAgw84KBuklEqlxDdeDaSIiWNqdv5b1sFk
         FI6hde3AxsJg7zL7KI/HvilPx/QYwYva3zAZ6d0EZvlyL6QVs+j5Mv8sTAX+2zDLC6/S
         fmSw==
X-Forwarded-Encrypted: i=1; AHgh+RqWqM4BThrRKGQPENTQ8ZebOcyeY2m5EG3gHGtLYA0JlpUxlixS1aRdYl5dGD8J4712p6IrMTriZczxJZZzjg==@lists.infradead.org
X-Gm-Message-State: AFuF++lDrYgGTe3gqyboFB2QAH86YVQr+xOX2pNGvnnVIks75eDSSkXU
	jrJn5XPC/uIG49wMTxbXxzv/mbq+eHDbkGHJru4KcSPdA+gQC93q74JbTD5xtDSZVV0=
X-Gm-Gg: AR+sD10sEKeC8yEA32+cd0BWBH4o3rT6F+RllaZqLFt2AULEEA+GZW6PPwHZaPh2yPe
	4DxWBeJEWkKyHUsuVCOo71XmhLpX9HYdUESFtA0T9gXoFaoT48yyScsbjZYpxfVzkR0aydHfYn8
	NAE547KsDKlRJ5iwTyxJTyttss4b2ed5xJZP7YNOBLd3lgbehaJfpuNEhs1sWqS8JkO+fpvHeLT
	3jjf3yWKg9LZKyllhkOUb+fYjYuUnLM2EKMLHQLJUXXauPxp5gBc31QHCDJOtNDrUsas3lhsoUT
	pqNehGJ2N6OvuwAakKh8sdjMzz4RL/oD18kpw/nIJRKzKYbp34cVjYAkOQs4kF66T2AWnC3deww
	7ClrRxH0+KdR0QCOC+n5bhjsU8pBwTxiK22dXcKL2k9Rk7J3aZAAaeWaW/fmvtNtaviQ48vupNY
	ge94uHQIHzn7POhtDwoyTsh8YT0M+Ndq30xk8sYIQOXP2nP6PN8uYWiZS+RS41LyPUE4r+WU5Ng
	6+oetsF0RoQrfF9iMeXzKPaoFm0mjhTSi9v826z2ODT939xb51Fg2Fuw9L6DmSzjv3ku6LtkMNR
	WJtbAAQaGXw7TAGIbwI8TgbzGI5Wma2lg3TWletf18RO+w==
X-Received: by 2002:a05:600c:4453:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-49b91c486abmr84183025e9.12.1787919046770;
        Fri, 28 Aug 2026 05:10:46 -0700 (PDT)
Received: from [192.168.1.100] (2a02-842a-d52e-6101-6f8f-5617-c4b6-8627.rev.sfr.net. [2a02:842a:d52e:6101:6f8f:5617:c4b6:8627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b494228bfsm125368175e9.2.2026.08.28.05.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:10:46 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 28 Aug 2026 14:10:47 +0200
Subject: [PATCH] drm/mediatek: mtk_hdmi_v2: fix VID_DOWNSAMPLE_CONFIG
 register offset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-mtk-hdmi-v2-fix-register-offset-v1-1-118ad5d7ebe3@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNUQrCMBCE4auUfXahjaDRq4gPMZm0q7SV3ViE0
 rsb9fGD4Z+VDCowOjcrKRYxmaeKbtdQHMLUgyVVk2vdofXO81gePKRReHGc5c2KXqxAec7ZUNg
 fTyHHvY8hdVQrT0Wd/R4u17/tdbsjlm+Wtu0D+/pwJoMAAAA=
X-Change-ID: 20260828-mtk-hdmi-v2-fix-register-offset-879afc38cad1
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tommy Chen <tommyyl.chen@mediatek.com>, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_051049_628328_4FDC416D 
X-CRM114-Status: GOOD (  10.29  )
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

According to the datasheet, VID_DOWNSAMPLE_CONFIG is at offset 0x8f0;
0x8d0 is the VID_CSC_COEFF_0 register.

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h b/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
index 521b35c7e14d..bf3ebf5492d1 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
@@ -173,7 +173,7 @@
 #define  TPI_AUDIO_LOOKUP_EN		BIT(2)
 
 /* Video downsampling configuration */
-#define VID_DOWNSAMPLE_CONFIG		0x8d0
+#define VID_DOWNSAMPLE_CONFIG		0x8f0
 #define  C444_C422_CONFIG_ENABLE	BIT(0)
 #define  C422_C420_CONFIG_ENABLE	BIT(4)
 #define  C422_C420_CONFIG_BYPASS	BIT(5)

---
base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
change-id: 20260828-mtk-hdmi-v2-fix-register-offset-879afc38cad1

Best regards,
--  
Julien Stephan <jstephan@baylibre.com>


