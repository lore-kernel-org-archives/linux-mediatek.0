Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06370CD98E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbx3ojyGvZm0HFvzH2fDjGYEhzXxcDovZmyIxDXeLB0=; b=CbUGdZLLcDyhsMt8wUSj+NDKxP
	EDYql3eVKyf1jpsgL5Sq/f6Dp/QFajQNaNg9e2/r19FOh1mD0irdhzVXP8faSZiIh0LxRxpgzYcCP
	DFrVzs1ddpOJNUj8akMffrL9g6cBk3OtTJ9rQRS/in8m99Bva9uy2F6p34jzrH2LrTWHPZAsSLXc3
	QIHKKCtAjpV3M1/EYz9ndCWB0Hq1E37823moMQYJWbEovZ9Ecp8JjwGQK0p6ijTfRaMNO3H/nSdE1
	epvV73dLmvpG7qbx5/Cf/Dsjn+nzgWlMK27r4NAwAoMsIIE3axzqVNH+MWkGzv3SXIb5MbSFRSoHX
	cGcV6MJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnf2-0000000H7iW-101L;
	Wed, 17 Jun 2026 10:38:20 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnev-0000000H7dR-1wOE
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:38:18 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-30b6dad2382so6294421eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692693; x=1782297493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbx3ojyGvZm0HFvzH2fDjGYEhzXxcDovZmyIxDXeLB0=;
        b=qTvxpwEhljYR6qhXT1qELlv7sUwox4R7jQdLj50CUXisk+umFlJX9WsVVyygn1ZKXk
         /FpQfJvql7d6XSgQDZcEN8gbG/JsYrClaZEMYrOz3a4epGctwjpP6SxjlzjoTMybivHm
         dSIgdf563Thcf2EVnqw+3NWcyKHsLTQT882IWHCY/cylIr2udmopr4/rJDoCgJjqdzz+
         k5dWMYyMql1d+Mn7SfZWonF6LPCEM/L1K2BEOxNmYgqRs+WgguRLc/UxRHa0ZYvxLXpy
         uK3dM/E6Z/5i3JEAvyrIY0WUSfDHs+twCXMDe0Z7Db1l6LrCqAl8utgaKVQ3+Cp5mImQ
         Tq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692693; x=1782297493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wbx3ojyGvZm0HFvzH2fDjGYEhzXxcDovZmyIxDXeLB0=;
        b=fIoOBU8alHy1ru+NENf0ej16PSqocBo6rDwxVJf9KR/CONr6y4uG9SYyxlGQaN2T4i
         UUogNxOIiufU0duV3cgqHnxINcQ96W1FKqtMEfrE4VCx2ttgxC2pK9tNBwH2cbvzJyQA
         SR05wOcA3yFHx5rdqmTFk2qepzZXFAK12wfYF1+TZRySf0qNwIryVnAdX/n/gK3VBhbU
         ioMVgBplSF8wOWEXmHkj9b2c+xrap+FIYqBAc5SoGhEW2sNssqMcIBloDctD4CGNFVip
         8JKd2rjCx9c3/fmvq/LmcsQ9l4hxXBFraT+NTOp1/yWoxNsD0S3pI9Sg4ch6Nk+L/cTp
         Zehg==
X-Forwarded-Encrypted: i=1; AFNElJ/mgdIdjnHA4fNXcheCLJWuhslaCyrJ4m9/dU7YABnhSJPw8kSS482DsnEWmrnbi0Ch2GVtllKZUiPTN0rtkw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0Dp3xvgiQXaGBhiYafVFJO3gA69tlWLmxrbOuMJ03bJrDP4te
	QrKghzrQUX4YHbTgUPtNGleeVQch2WFPI8CL9V93QKXsNvq9nO9QaGi1
X-Gm-Gg: AfdE7cmZgqDpPt70TpwFS2LfzP8LjXNheFc3+tNHnKwbfO4spy2Z8iwy3qNsCA1ckgs
	FB4seeyeQy/t2tGksEj+R4yIKTdb4ONTjpsTTi9z4XJivKf96dQFeJafKIbnYSEXhk/IF6eSPC8
	nthcAMMqT6WN9bfYXL5d2T4UqycIDenD+Vwa810rOYSZ2jU6ciEeQPJZfneHCgDHkpUEXhgj4JX
	ioc9zU/6Fes9iO4AJhJ6AczDSaTCeT8ri1Mbr6OfHvQ2dP6iE0ZoUfs2iE3li0GRQP07zA0dGrH
	77B1pyDaa9cH/9Uu+u2PCoMVJuLg2SF18CFwd3a/DmlSHYyMp+cR5o15sMrOuU7OKeoR82S3LcO
	XgcIalrFSI1bviHZh4s0wfagF1RJiUz/LrwFC2OUMYjAdHy22QRqW+e/P49/45HSBr29Skha8hl
	rNfOnjAopZ7OuVtPrylx6l63EzyY08uygEI4TIXQy3piMIIgo=
X-Received: by 2002:a05:7301:38a4:b0:304:e7c9:b528 with SMTP id 5a478bee46e88-30bcae4246bmr1408050eec.30.1781692692655;
        Wed, 17 Jun 2026 03:38:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:12 -0700 (PDT)
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
Subject: [PATCH 34/78] ASoC: codecs: lpass-macro: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:51 +0700
Message-ID: <20260617103235.449609-35-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033813_532394_D84D713F 
X-CRM114-Status: UNSURE (   9.24  )
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
 sound/soc/codecs/lpass-macro-common.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index 6e3b8d0897dd..c8c4a98fd765 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -71,21 +71,16 @@ EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
 
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


