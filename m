Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FFAC43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=; b=m/1AYg/8zUz4ixwmi+zniSUOMK
	6rKgnWZkclWlMVSO9ZSJCdz0jUJdfODQOSI9bGL1w+lf27sdH/plH4gHzESpTSoWdH7hF5phl1sZ2
	Mkmf/eBYCODgjrBrHakeH86QAb8oK5lJPUxTBfstkJ1PYsANPttF2wboE1VxDeClyYjW1WX2vjhur
	I62nZoNeRbiRJgREquT9YAFJTbL4OK9xpYp1eMUGhoe2f51syndOuYZnligaKa9BgtM8VHSWn2B60
	tavJgukWWkvWbvr2xym+wPcESRUle/nlFwSadueNzuhRKRMDXu/ryhk6+r3GsoUBphu64cOj1Dv6C
	MrHOw5Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8a-0000000HH6V-046P;
	Wed, 08 Jul 2026 14:20:32 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8S-0000000HH0N-3CHv
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 14:20:31 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ccf2360620so4670115ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520424; x=1784125224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=AFn3ZpP18c3lamJL1XJo/jAsGh1NxfP/agXJefNKkd6frz6aqFuX6Iwf/0oCSFKrQJ
         KGyA57+bxJjO7SUYWRIjZFDmw+TbwHTwhtCVEAmbrfW7swChThlqvwERRHE1yD5oTku1
         TIvtN4C7gD2krzuSQUwqhj2WozMWwSt0kXRYr37r6B7yeWQpORwSVsY7J/ju4qrDE1rB
         rgAtonvuAVPCMlQkORwmxUFx1w2kLNe7C9QBXNJV+Byf5jtZLoxdaEotEMFvH5mytUGR
         lyLdzV+8rpKJsAEZpuSKyjZ3AmlPmXKl9hb/RhcATnH6nO4TCwKVlOjkJ+P8PZS1Xxik
         p1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520424; x=1784125224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=gypx4U3j9DWHsA4K3SD349T78KQV+FDUyqWh2xOiN2MjN5KS/yzK3iQRhpSt7u3Z8p
         BBo2u1oItgIWuwOjlEcXzCyW91v/h+3Bty/nMTQ0CeMHtkRH+rtc70XsBcSWLjKsS4BX
         JguFON1EjEMlh2RZ4xbzwFSWfS9bgtM01WWft6S+dm73gnFMhp44bfb2iJ6Cwhhf15kC
         gZ6ahAf0GxbolGb/1rYmU16MEVa1Svxk5PJrvuZxP9AaWXdEyiNsMU2OHror7onvTS5x
         emJ/TW+2Y5cxoUfum4exut3cNveQWqRjW3DN0T0ZdGbJ4Qz48t7huUjC3OZWWGGgVqpd
         FBuA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4sASmi62JkCu+eaEhdjk+FKyrNBPjyqfAYHCAGpw3nsl30x/T6Ld2X7UoUdx/PqpdJ8QBxnORxy4UTKWp6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYGqf+Hyy7FUqaLXXFlYLMAmoSzi+tVboj41I5lBUOBeqx/ZVr
	1yPeTuaxbR3z/Id1cSdPfHWuY1krHY8bj6mohaJlV87xSRxx1DYnxURp
X-Gm-Gg: AfdE7ckwM0eowXoOhSg8c8xcauDY+W+cje5zO8Hha7tZf/eMHEYSc32b8i6MId2Q3/5
	rR/GhNYH5I6gh4/Z1U0SealjWlCvbZkDF7PLRyRwzrLi31yeowx0HyWihJWemIDYSpi9O+IhaMv
	AlmvmieSWL9RzEoloEcMI0xXX/a5mD3su2Dp3Yvw6jBlJASpmqe3EgDfk95h6PWEtDyo+KrRN9/
	YBd9ChCb8VSqyGm+Qf5JF91zgKPYWmRbg2uHHzcD1DXXPPBrHRSQdUYR1CCOoov7YATT/ocNyDl
	pjGUbh/7weCb6NyPZrVQiUMGgZSJe8ELd12m0nAprSRNWWYIBPmvpqm2lZmvF6jqHkbSYn3IiMv
	0pezIHbOToQtio9MgMUd7aYudxYj4Sx9oRgIu+g9jNstSCVickkVy3O5bxxRxidjOAlvoc0tuwq
	jPc+SMRbLcNc08KOAInXdS829r0MmoJ6Q2P6+4LQ3Fe4uFbwY=
X-Received: by 2002:a17:903:380e:b0:2c9:c083:cd50 with SMTP id d9443c01a7336-2ccea36d9demr28201655ad.17.1783520423848;
        Wed, 08 Jul 2026 07:20:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 10/27] ASoC: codecs: lpass-macro: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:17 +0700
Message-ID: <20260708141734.578926-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072024_811001_B58FE3E2 
X-CRM114-Status: GOOD (  11.41  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/lpass-macro-common.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index 6e3b8d0897dd..7e59616ed7bc 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2022, The Linux Foundation. All rights reserved.
 
+#include <linux/cleanup.h>
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -71,21 +72,16 @@ EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
 
 void lpass_macro_set_codec_version(enum lpass_codec_version version)
 {
-	mutex_lock(&lpass_codec_mutex);
+	guard(mutex)(&lpass_codec_mutex);
 	lpass_codec_version = version;
-	mutex_unlock(&lpass_codec_mutex);
 }
 EXPORT_SYMBOL_GPL(lpass_macro_set_codec_version);
 
 enum lpass_codec_version lpass_macro_get_codec_version(void)
 {
-	enum lpass_codec_version ver;
+	guard(mutex)(&lpass_codec_mutex);
 
-	mutex_lock(&lpass_codec_mutex);
-	ver = lpass_codec_version;
-	mutex_unlock(&lpass_codec_mutex);
-
-	return ver;
+	return lpass_codec_version;
 }
 EXPORT_SYMBOL_GPL(lpass_macro_get_codec_version);
 
-- 
2.43.0


