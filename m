Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4FEC47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 09:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCP1xxVL+2XFFuRCnhWKsh1+37AXhGb+RDaWbRieDPQ=; b=uoBWpiUIYgvcEXo29roO5f+XLO
	Em7C/M4r4ZV9YnFfVUJRjxAG1qkAAkiW8zRKUt7TJ7Ld4ixMZTBQ8ob7sz5fU9wFi0RwWyNewlBCp
	LPKhE3ODt0UQBnjqwoy26SF41ylDRwVcziYRCfOBwIVkXV1bOJzWMXPO+K0ngG3lA120JdsyFj6Jl
	M+Q5lhutaG6D5ENOUi3o7RUCAZSX0Uju9lBUDrymsaoyIlWcacOVHW0l7StYrJR0YqJXLxA0ourtf
	M35TCat6VpctLzNX8kn9lP3yZNA9V3mlkf2dGVHNJ37ZHYQxPdtFTG94WYFIDDnBd9hswki6wrFKU
	0k+4Wzmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpPLv-00000008AY6-23tO;
	Wed, 27 Mar 2024 09:13:47 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpPLs-00000008AWE-3cC0
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Mar 2024 09:13:46 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6e6bee809b8so5487416b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Mar 2024 02:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711530823; x=1712135623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCP1xxVL+2XFFuRCnhWKsh1+37AXhGb+RDaWbRieDPQ=;
        b=DsVoaiTxoLDaujrEq+5fLKmEtFZpeEOc20/ksN72sfB7VjxYD2wipaxTtcAKsRMD0A
         xCbKVNdYq2ylqUhY3diz4wZZXDTPnWeXgj4GKquB7JlcGE2DP0KsCRUSnfF3w08KU5m1
         lh4gh7s6RRrmPpfOV+/Q3bsDm5oe3IrfVf/rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711530823; x=1712135623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCP1xxVL+2XFFuRCnhWKsh1+37AXhGb+RDaWbRieDPQ=;
        b=fNQGODptElvikF/fUuQX7TCraqK25AMtqk3YuRbXiLv8L9lcaL9smHZMqBNidITzRl
         63F61fngqYPZKk/GpTQivrfzftOHHh/vAsbjto4nr5AdhbUsxVkPeIFZf354xxzzOhKL
         4HK0+Mc11eJyoqheoQTGUWlqyWqB1ng1M2NguMPXsDoH4IG6fXRuejIjufPCGOVVv3SE
         u7/OFm+A1n0pZbMpxHgXIgNwTGR5JAtirc6GJZ36wDqVDxPFI/SyuQLo1MTNoXYXVmXA
         F39zwaXQB1VMO6XHFyZWQ2U0z4HOfKNIE2dmvAAmdqoKG8ZRK54trhDTzWNuTjPM8vLG
         eZgA==
X-Forwarded-Encrypted: i=1; AJvYcCUXCiA/X6rSSYpb28GZFFFqBBDSyGKb+OQoFMFUr+zYKu9wzk442u9u1bmjSOM4X6kf0nJW187ucwPadVNMLyzUsfWQMQfTwfxlmUxyT2N743og
X-Gm-Message-State: AOJu0Yw/lnXJ9w3ZDSPI7aGj2udOZ+lGLbVOLzjtDKx3DynUi9sLTtZj
	b/nTwlnM6r/dGsGyUqbg4cGwbxhDO2WQLuaMHzAoqwnrPX78ECkXGyw9YOqqPg==
X-Google-Smtp-Source: AGHT+IGO/q6xt1tiCf12rN/iTWiDaEhcezoHgM4FVnnPfonMbt9q2BCRE5wf+w6mxtmS4gbOe5GCww==
X-Received: by 2002:a05:6a00:cc1:b0:6ea:c46a:3b66 with SMTP id b1-20020a056a000cc100b006eac46a3b66mr2396932pfv.16.1711530822949;
        Wed, 27 Mar 2024 02:13:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:74c2:3606:170b:52f3])
        by smtp.gmail.com with ESMTPSA id fa31-20020a056a002d1f00b006e69cb93585sm7342911pfb.83.2024.03.27.02.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 02:13:42 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: mediatek: paris: Fix PIN_CONFIG_INPUT_SCHMITT_ENABLE readback
Date: Wed, 27 Mar 2024 17:13:33 +0800
Message-ID: <20240327091336.3434141-2-wenst@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
In-Reply-To: <20240327091336.3434141-1-wenst@chromium.org>
References: <20240327091336.3434141-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_021344_938742_7EA123F6 
X-CRM114-Status: GOOD (  13.12  )
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

In the generic pin config library, readback of some options are handled
differently compared to the setting of those options: the argument value
is used to convey enable/disable of an option in the set path, but
success or -EINVAL is used to convey if an option is enabled or disabled
in the debugfs readback path.

PIN_CONFIG_INPUT_SCHMITT_ENABLE is one such option. Fix the readback of
the option in the mediatek-paris library, so that the debugfs dump is
not showing "input schmitt enabled" for pins that don't have it enabled.

Fixes: 1bea6afbc842 ("pinctrl: mediatek: Refine mtk_pinconf_get()")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index b6bc31abd2b0..9353f78a52f0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -193,6 +193,8 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 		}
 
 		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SMT, &ret);
+		if (!ret)
+			err = -EINVAL;
 		break;
 	case PIN_CONFIG_DRIVE_STRENGTH:
 		if (!hw->soc->drive_get)
-- 
2.44.0.396.g6e790dbe36-goog


