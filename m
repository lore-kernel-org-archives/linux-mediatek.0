Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF73DCD98ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 11:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWJ/7U705zHTEAWXLYlWm+c6/Dx8tZg3vpf9oUByAzw=; b=26b9OVnPWiPJ2dHCEsLG1jLjMO
	CPnvlPLTyqiDgmEEB5BAATAUnjN77Cnh+F2w6ywPXtENlwXbycVr0YzqLLRiVch+/H2T/EaUwvgbM
	ZD9SX2zCBrdZMr/r4oEmGMUgJ1NH6WSPBNL+7DwATcZyaCBV2aTa/GhyA+5V43J+yLXr+szyViF9J
	Gd6ODhwJe+xcya/RQnquasko7jTW2jMOttOUkhV6EO5UrBkBzqpKOelPF16MYq7qODCTV1SpLNEID
	hPp1C+f0/GKKrkhwW1j0Xq4FzSmGYOJuYMKSfrGytuxxDkw+oY4QbB8XD0OXdbt0rGftcTDugmdjd
	AI9bJo4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAct-000000019Jy-3vEV;
	Thu, 18 Jun 2026 11:09:39 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAcs-000000019IU-21mI
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 11:09:39 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36b95eb4bb4so475231a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 04:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780977; x=1782385777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWJ/7U705zHTEAWXLYlWm+c6/Dx8tZg3vpf9oUByAzw=;
        b=IGa8EyyvM1oUonATGl9rjKPa4CBjfd11Wb/oIslYbnamOYdBfSGIve3enBDVHOpI+U
         sTaUWEB7Cd5ioO9quTpCrMhLKruzBMv1eqePf7DbukQlbImHwjjbj/j8+EHYkpWRpTaG
         moOxSdKOwxYgu4cI3gF8z3vxgxeSYvKbEY6RzCR14iVrXH/Om6pKG5uMhNDOzwyg8OVJ
         Zfvx4sG9wBCOMyW+zSeu8+Gvz2i8jU0Rvgzmf/Tfr/PVEulG5dVkKSqj3Vcx+zYdOsZa
         SxU8cdfez09uiQR1FBrhf9fSVPDinLfQLxS0WXCP2cX50caQd5251KAf3NuW3/78rfi6
         1wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780977; x=1782385777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EWJ/7U705zHTEAWXLYlWm+c6/Dx8tZg3vpf9oUByAzw=;
        b=LIoE7eCx91YgdwD1o84Kq5w33Pqtp+k4uHjCp9F83Y5WIfZN/Wb6WR3EGU4xFet5Vo
         mY8bn3Vt2qk0UyZOdcgcbuIuXZhnUWJB0Gc/CB5Imai9j4nTP/v2wjdB7hyS3loFj0Nt
         90X/u8qJgCmVg5C+D2l4ftngiqteYAvZeZ401KrSUcVZ0yVYlA3zb37djs955o+6pzzv
         +oPV10z3xbAtqCoSZ8Jib7TH6r9CZ53/8LgtnZCBd62tOh91UTcpK9TcfGYm+jUzD+A/
         yq1TbfOqAs+4nISMEUz/53gI0pKdsiO7wNmI+g/fPEI4TVm2KpnaANc2fofiNCqLh3Tg
         hoUQ==
X-Forwarded-Encrypted: i=1; AFNElJ80yVThWH8c6KngZ9KJk5yL4OieWKuIioi44v1q/wQ2DB8aCQ8ZSPYwbo9Iy1xhrrUX2cwNXyadJAL0Q1bkjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDJHlf5SNXJpMD/8wcpM92TyNLA83uoN4ZXw3XhWwghRP8Jy+J
	TW8sjyvZ4cKKWV4HL6TzJ0P0DytZndyNH16PZSuLfEEBZ8G04m34l00r
X-Gm-Gg: AfdE7cmEwwkcSd6tBHj+I2KYxRxF/NA9mhUrJsuefkBJw0tVF8SKMUbmr6hbTErsrUj
	DYnYUD7YADq5QNYeeK26DawkqWMq0NeW4i7iMo1rIbdgnqwndybNHungFoz3YcZL31SJ7OcTHYy
	0KuTYn6fTvsrRFU+DOLYdwck65u5UK3o3uEF7AWbejh47yZF/BUXJUOkimBlI1XAO+8FrZbxS3D
	H3ouDlEj/ycWiNSQ8kx5pfm4dQsaKe5YORA3/Df/CQBo53k3kuhGE7AjcrmeVa3X1V06eOg3NTH
	4nQ+nzHtoLyjGafrUjPfZEKQpSIsWa+BZuQCK7+9ZGFFQBUUX1JLccuMljx5MYrus1o+RhqrAAy
	3Ej7ssRk6gU5pA6tc9hRiZBnf0IE2P+y5umUXW2kZzhZiXZHsupg4HQFy3fCXnROT61nCfzmobl
	GHTUly4ZxbqoGuNByuVfi3Xu/Erk73EAQcVV/rQWoKukOcyhuY7K0LqfkDgQ==
X-Received: by 2002:a17:902:f547:b0:2c2:c0db:964a with SMTP id d9443c01a7336-2c6bc23d4c8mr89883015ad.26.1781780977509;
        Thu, 18 Jun 2026 04:09:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 62/78] ASoC: codecs: twl6040: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:11 +0700
Message-ID: <20260618110827.232983-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_040938_530303_EF0A066F 
X-CRM114-Status: UNSURE (   9.27  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/twl6040.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index e10c51092a35..6b18252fa8c6 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -273,7 +273,7 @@ static void twl6040_hs_jack_report(struct snd_soc_component *component,
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 	int status;
 
-	mutex_lock(&priv->mutex);
+	guard(mutex)(&priv->mutex);
 
 	/* Sync status */
 	status = twl6040_read(component, TWL6040_REG_STATUS);
@@ -281,8 +281,6 @@ static void twl6040_hs_jack_report(struct snd_soc_component *component,
 		snd_soc_jack_report(jack, report, report);
 	else
 		snd_soc_jack_report(jack, 0, report);
-
-	mutex_unlock(&priv->mutex);
 }
 
 void twl6040_hs_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


