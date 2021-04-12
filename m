Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2600C43460
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 09:41:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BCAF61241
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 09:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BCAF61241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WlmtBEjtMz3dh1PolFAU5NbjSssEoDP6mtGKymabOw0=; b=Q7RMxzRpgbFJrwZwg7/T/Khs7
	pb4tqF50g3tIS+xUrrgOFalhbm9xukR3lSTY0XuAetPgTbWTTiMddxame6aBRshIEs/8d5BXfBw6Z
	OLP8COe5Q8NkqO57Tp8uYrK57GayR6KKK2GaulRJaTsBltGAPugNUH+Jxdek0/gfEHYzrnSLdQfnS
	/t3xx6ttJWs6abWR9IrzqPxrdaoacOVF+VxVGSAfM0IkaD0jefRaGzmIQ1PccCK2YDYEfZaSSioXC
	XJEVIqVAJeo3Ud9kEQvE47wgVFzNAW1ECU/uxmmdYpYO2iBILCzyemQ+98W8Gw3lr1eBQdm5WPFqx
	U15WlXaAA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVt4C-006JqM-5i; Mon, 12 Apr 2021 09:41:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVt2j-006JWd-Bp
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 09:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=b64pfOb+ESukFQpojWv0aNxV3D5E9ms1GDFWEsqil0U=; b=E3TAfMsBTnZ0DIfA+ZDkkh7mLX
 8NpUNi7JDJFoj9HRTfbmDFjr/YVcVSmQqSFflnqGn+PebRI9t7mQEpfNrqe/bF32Ai7+Fb8QJtRiE
 6S0+hiTSOQsiFPcYLHTkQxWfgGr2DvqK/FyMONrXsnP4yFaDzB9tZsyKBt1R2h3zwVlFk6tyfugwd
 YQd/6GP3sbNTp6k7rA0PYbxhrckr11heAiHlAhbAAl9ObKsqs6UdHF2Lp52AAVmYh8EtZwYLrkfAZ
 Nw6U2hsLmzPWSGVwvh6kZOMCz5ZOazwKcKwiYzXDtpENiHrFKsAefmVTR1pNPGYKI3HCf9vyNPMcv
 yRuZPrxA==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVt2g-0064v9-N1
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 09:39:40 +0000
Received: by mail-wr1-x432.google.com with SMTP id x7so12172651wrw.10
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Apr 2021 02:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b64pfOb+ESukFQpojWv0aNxV3D5E9ms1GDFWEsqil0U=;
 b=cUCTfH9cQ20lN0ASEY1CcKyAskerlXs7EVSJaa6aV9/KVocXxKC9+GyDoWrNIo/+Z6
 xinJzqXyxeW3D3CAEl7kmAQIl0+SFCe0ibs9Urg8AyOHMFU+E8L1wfOvAu319Atd7xv2
 H9wet+wscvVhrd40D2HQX2U9l3P9Y1QnEieLZdZdvGOdjEJd6vAC3u3OcC2NH1yqaFpu
 wPoBNr6F3CGOwT4rkkJQ3k3I7iKBP38HOBmpHCHl+NZpewk2S8wEyrQg4B/6I86x/qmv
 VRRXKBFZsQaPCgjwZfMM6FezSVukE4fYRjWwFFUWkBDxNqUk/JG6wNERV2ufIjHxFpfj
 wFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b64pfOb+ESukFQpojWv0aNxV3D5E9ms1GDFWEsqil0U=;
 b=PudPjdZb4FhDgAbrNcPWHwJA2vAAkK2EeqQH8SOxGQK74C4xjz0W3tFF1cAx2cRnly
 TnvBBQPn42IDhO81se91aRBEmFLNf4Ko3K0p2nNFe+MXjKCNW46cDZUZnhXVGzHWlMC4
 miXMvVLJE5h8iUjsvz2KyouGu/ZsPkGyM0ejIg0Ev1PMYh21+ENnU1LptKXJutahCjWU
 eHRedpFy6jcBHWoo+vW8q7Drs1uIwxE2xvHKDFmH884uCzcuIvZJUD0gYHZEWJjqq5Yl
 zg7INSwnhGzF3X2TIxDHLyE4lzJGpRgyrg4CFrmi7h0qBwSaey8ja6RuTrgiTdY8GNI1
 71cg==
X-Gm-Message-State: AOAM53151tvvyLiw29JRox2KUzvI5Ex2XQ610zcQy2Q3fPyatsyt9s/u
 9xpC4JLhrjoWClVQd9s8Zc6QMQ==
X-Google-Smtp-Source: ABdhPJz96Ixh0rydLkGNtoMbTLcMl1V8ZHJ6OxRZb3g3eu/v9lSIxMYmfdeZLJ4ofiQecixqlveQKA==
X-Received: by 2002:a5d:6c62:: with SMTP id r2mr32037266wrz.62.1618220377138; 
 Mon, 12 Apr 2021 02:39:37 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
 by smtp.gmail.com with ESMTPSA id
 r22sm14405902wmh.11.2021.04.12.02.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 02:39:36 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
Subject: [PATCH v2 3/5] gpu/drm: mediatek: hdmi: add check for CEA modes only
Date: Mon, 12 Apr 2021 11:39:26 +0200
Message-Id: <20210412093928.3321194-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412093928.3321194-1-narmstrong@baylibre.com>
References: <20210412093928.3321194-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_023938_790346_A8DCB7B8 
X-CRM114-Status: GOOD (  12.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some SoCs like the MT8167 are not validated and supported for HDMI modes
out of HDMI CEA modes, so add a configuration boolean to filter out
non-CEA modes.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index dea46d66e712..0539262e69d3 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -148,6 +148,7 @@ struct hdmi_audio_param {
 
 struct mtk_hdmi_conf {
 	bool tz_disabled;
+	bool cea_modes_only;
 };
 
 struct mtk_hdmi {
@@ -1222,6 +1223,9 @@ static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 			return MODE_BAD;
 	}
 
+	if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
+		return MODE_BAD;
+
 	if (mode->clock < 27000)
 		return MODE_CLOCK_LOW;
 	if (mode->clock > 297000)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
