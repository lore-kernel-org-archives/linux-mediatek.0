Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC98CD1291
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Mar 2024 20:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K7N0D7Kjfk0JATRsxflDv0tI3CZgim2NBK8j/8+EBeA=; b=bcKvKbLpnC7igG
	s6M4BMzWJFrFysTLiB4hNipiv5s56lIRqyzZDiQpCIFPnZ+2+c3jOvLHxmqh+duGY2oyC4tGPhBEP
	xwuBMbcv970cRMdkkLwBHyQW7+L6cUjYUdVzWwEt1TkJUmwwNqkhKPZggjr8NUmPiUyNZ5fCmzrXh
	g4b0uMDdAkPeA0kLmeGyJWjbliuSrp8UgNj2xR4fUqb7mHQWtd9ctDAYexgo6MIs7apBO+YynsqPD
	ZgCvWrmwFfNAsiA7qlbnoBO61VWFpk+Dik1S6ZK7rjd4IKMR/OhkncYNB9W5rzKOlpraojc1f6auL
	V27/5Xwk1Nkknh5Q/meA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYJ-00000004BxU-17N1;
	Sat, 30 Mar 2024 20:43:47 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfY6-00000004Bo6-18ak
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Mar 2024 20:43:36 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-33ed4dd8659so2484519f8f.0
        for <linux-mediatek@lists.infradead.org>; Sat, 30 Mar 2024 13:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711831408; x=1712436208; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K7N0D7Kjfk0JATRsxflDv0tI3CZgim2NBK8j/8+EBeA=;
        b=OzudWIGSqss8c1KP68M6Ndh52J5eBP0qMVAd7nlaASQGjscLZlK6TVJmYM8AKOEeB8
         7viv/d+LMrismXS83LfjcjENc3CDf54GFBD9T5MrprDZKMg42lMbEFM2hZhtmp9Tq4i2
         RV5gR32BtqcPqbFet2/Ef5TRffAktazODbR8ampdJT2FjpTO9CZCDylxqFaHM0bmsAIi
         CclJdqrhANWNEJQ93aXY1n5/44y0RUI2+ggYo1y0Fuy7+TzERjEYQRiGFI/A57ljV3NI
         4ktO1fsxU0zEntqBFyI29tLy/EU0Cx8V44KElrl5QlkoqVud03+h13uj71INP6eE822l
         HNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711831408; x=1712436208;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7N0D7Kjfk0JATRsxflDv0tI3CZgim2NBK8j/8+EBeA=;
        b=fiexj0YktEhqf9YPEvekXXayrSGfIl2MrAQnr4N6s8OXcmz4u97wYlxBfOovvxt8rv
         jsYslj2TGY4i/oeTJjYHuPAoOwubGL44V+EJtLsqsN1KqBesJahKlUCnZEV61iM7bdm+
         VN43u2HqWmpphn052LHmUnQY3Ov0nWOaKKeJqilgl7XmpR616DYCFBZv315OOcc+wYfw
         MUyozmR9SpCmEvEnh3aMowcWyGXG/QhEU5h61ivhu1JLUybv1nGONheyIzTzdreXPEG0
         hqvjhA9IFvQfTIPtutmVM5a7uX4uy7YhiNuW26Yfae6RmRrkhaKnECvoq9Z90bIK/iaT
         J0+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmZbSMmeWAlJi6iuiZ5ZSFXpYB7PiDHlPWlKRR+P6XLNN/73n1uSEFs/OId5ax5l9rnwlfs0dB4sPyIPWNRjUMTa58XhG96SRd5cHT/eLyzkyY
X-Gm-Message-State: AOJu0Yy57PDQKQt9p3HoI7YrCwTFIjjazlJ03/Mc793Wgy7Qxxr5Smeb
	p3ZAKgomt9VSf1n2nfQTS4HysnKwMmouugjANVl+8Bs5zQFOowqEUc0WlXNOsyU=
X-Google-Smtp-Source: AGHT+IGovvSTbspKm9/uX3uiFBF3Rzq6mLU/EqERkjT+y/Op/qBmj/dbGtOoq0wlVWRETE6RaWnnJA==
X-Received: by 2002:a5d:6043:0:b0:33d:8c9d:419 with SMTP id j3-20020a5d6043000000b0033d8c9d0419mr5302058wrt.24.1711831407999;
        Sat, 30 Mar 2024 13:43:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:43:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/11] drm/mediatek: drop driver owner initialization
Date: Sat, 30 Mar 2024 21:43:11 +0100
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF95CGYC/x3MQQqDMBBG4avIrB2IUSl4FXERm992aJPIRG1Bv
 HtDlx883kkZKsg0VCcpDsmSYkFTV3R/uvgAiy8ma2xn2tbw3HFIfn+D0ydC2WvgAC9uw4ud620
 /38xSUiqLVbHI978fp+v6AXV4FlBuAAAA
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1673;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5hjA386zwMlffmMn4NRghhyylnCA9pQb83mqNAD1Gws=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHlky5Ab07wRdqkTCAV1panAirUB2C1L0ur5U
 OVvafL4tMqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5ZAAKCRDBN2bmhouD
 10EZD/4w3np5oImOf6K7LQ7H1fmbPZuL+mTQh94jIgP6B7mi7lCuetbrxbmX9ijN8D3RvaGfH6S
 V1+KbFL+cj9L7V76xfnKzZIvbLSKwXqZdxpg6cQqhiFko8NA7d2OrH7Vi4ObyUEGYSuYoZ6s3qK
 U0ZwJlDue5FA1BWh3GmIjkn/tEiDRb5ALIHn2asHTZlqsBn3YN+N0CtSlB6dIFkWmvNa9e9Ewdz
 k0U4Fw7hGPH8aQMRbV64K5ykBTKhpyamK5M88gmp/yDN5JVvr7r+sZJi68lpORSr5bpHGXLU1+Y
 dCYrWy7fPjLbURMCm4IQcTh3bKafPXM3E2gNH+PMz4Bn+iZcgqrBhj750Psn7QTplIwawfFQTQf
 b7jk8TRAVjRiA0FaVx368uEBGtBJKWX2lllipHiiTYkhvPOYvyVPvdc8FDxebngkxuAxDcBaZok
 +soCitosPhDTF7SPeqHqBuuS2OADZzJEVINvuXllxkAZ2EewnUrgj281B0BYhmto1ZX6nqb8tZa
 esoGpfD6kOCoK5BIQUZMPd7CNV6KTXyXzDpaqq1nvwnt4W4KZMn2dEuEmCmZ+g47R4MP6adIfxg
 bJam4PP2V/8geJx70BJY7XJoWix1UrUwTVAtpENs5W1iKjFSggoGibqIHJe6cEQa8/LPMH9s0Xq
 gDCpgluIJFYRuBw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_134334_440678_1C3D6416 
X-CRM114-Status: UNSURE (   5.20  )
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

Simplify the code by dropping unnecessary .owner initialization in the
driver.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      drm/mediatek: aal: drop driver owner initialization
      drm/mediatek: ccorr: drop driver owner initialization
      drm/mediatek: color: drop driver owner initialization
      drm/mediatek: gamma: drop driver owner initialization
      drm/mediatek: merge: drop driver owner initialization
      drm/mediatek: ovl: drop driver owner initialization
      drm/mediatek: ovl_adaptor: drop driver owner initialization
      drm/mediatek: rdma: drop driver owner initialization
      drm/mediatek: ethdr: drop driver owner initialization
      drm/mediatek: mdp_rdma: drop driver owner initialization
      drm/mediatek: padding: drop driver owner initialization

 drivers/gpu/drm/mediatek/mtk_disp_aal.c         | 1 -
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c       | 1 -
 drivers/gpu/drm/mediatek/mtk_disp_color.c       | 1 -
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c       | 1 -
 drivers/gpu/drm/mediatek/mtk_disp_merge.c       | 1 -
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c         | 1 -
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 1 -
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c        | 1 -
 drivers/gpu/drm/mediatek/mtk_ethdr.c            | 1 -
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c         | 1 -
 drivers/gpu/drm/mediatek/mtk_padding.c          | 1 -
 11 files changed, 11 deletions(-)
---
base-commit: 7fdcff3312e16ba8d1419f8a18f465c5cc235ecf
change-id: 20240330-b4-module-owner-drm-mediatek-aa525b70f033

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


