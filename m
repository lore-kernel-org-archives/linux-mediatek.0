Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0807FC5B55F
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Nov 2023 10:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=; b=jNCwTrbf5JqwoBGecisQi3/07c
	OfzPzGvZTV7RHX2P+ul/hk43tL44I1jj58/P2ewM6GDDmYIKhe7XoNvN1AX6rmTFiZak4IlUEoWqR
	73NFjAWTCVVD7A69yAqyXuOPBi3sIK3QEr4N9rNRPOl0qd6+Lbci91Z4QSBtpsNJKOdFHDxI9I63b
	TElzO04+pRzrVuFWJmocNUkyMh/80L1faIR4MLgOu+fNm2qOKNpJSuKz2UGnv+BU+sY5vesgLteVw
	fOt2KO0717qMiZBjmZEbsroseHhxRZWi6LUXTjGizIKQcco+sOSQCVEW41Fb1Wd3rlHJuO/MklbBS
	bn5UXzdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4epa-009pQO-0L;
	Sun, 19 Nov 2023 10:15:10 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4epS-009pJy-1n;
	Sun, 19 Nov 2023 10:15:03 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9f27af23441so462793766b.2;
        Sun, 19 Nov 2023 02:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388900; x=1700993700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
        b=ghEWbBX0F0UQoDOv095VDxnhMBUSQO+56vgb5LNnGMUJ4xDn29FlKMBX7/DugsTZrl
         BBV3ethIGXBX5PECgIyg7u751VHFRpa00DZjwYNg/jcB8glE90RCsfMf/NEsmiVSXGMZ
         DFULabIbH2olhb9+elTjvaqd562O2gfFVcDmqecRMocVraOGBeQQIkHXIRTDYoycXRmQ
         J2VAJk5/vjT99OscsnjxMUa60OZiprqLDPc+iuSjU0bWW2uhlkATQNDgoPscPKHw3826
         uwwFonsCIjWiucKQmmHSLnsgvqba3Ll4+ntxSYx4TTqPXBpY1ASEpzXkl9ItgSiCnbGo
         GB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388900; x=1700993700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
        b=UVxH5K7Bg9cz0gkmji4TVDEMLnVGnp7Fj8hpIoDilQK4LwoiEhwdyq2ofbgEu42JMo
         C1fCkjOZgH965NiXqmOJ74l431Vq01kBeIowqr4TZtBeOiwxFrxCBaLhrh8PlNQHYFWl
         o10qTVy0jPwbt97RpgsklqsWmZzXdEabyzDm8bjfLRAPK3oaF7kbiI7qz7wZejH6yUKi
         LOaqs6TOfMS6QAaXs3RQAN+8ebBuZjVLlpmZDIAJfYYbHXf6HsbpnEvs4adCTFks7/aG
         ruUCewVRbkCCz5bJzhOHjbf0wGR1sbteIb6269nDoAj7tyD7tvg/RVVjgZj2/ODZmU41
         wdNw==
X-Gm-Message-State: AOJu0Yz8A3czB+mtoFSSlfNkyltxzeb0sFg6t+QcUvkXhSBv46Hm6BXM
	BLknJ20ZWCNxFXI10zQvn2SKGQ+TgL79EA==
X-Google-Smtp-Source: AGHT+IEA+I/p5Y2kpMMwz/wbD8AVKRFd+63nqxTeNaPbKOxKJmEk1Il1T/beHX2wdaQOaGPL4A2UqQ==
X-Received: by 2002:a17:906:221c:b0:9c7:5a14:ecf2 with SMTP id s28-20020a170906221c00b009c75a14ecf2mr3807104ejs.56.1700388900287;
        Sun, 19 Nov 2023 02:15:00 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:14:59 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:37 +0100
Message-ID: <20231119101445.4737-13-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119101445.4737-1-hkallweit1@gmail.com>
References: <20231119101445.4737-1-hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_021502_696534_F7ABEDEF 
X-CRM114-Status: GOOD (  13.35  )
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

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index d675c954b..54e46e440 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -297,7 +297,6 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
 
 	strscpy(ddc->adap.name, "mediatek-hdmi-ddc", sizeof(ddc->adap.name));
 	ddc->adap.owner = THIS_MODULE;
-	ddc->adap.class = I2C_CLASS_DDC;
 	ddc->adap.algo = &mtk_hdmi_ddc_algorithm;
 	ddc->adap.retries = 3;
 	ddc->adap.dev.of_node = dev->of_node;


