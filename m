Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC190CDD0C6
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 18:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LDGG+ZQDHae1HZSzt9Uce9kPw28gcxjgHu8jDN2YlGk=; b=chgtYRiFCRIYlZic2AGmSdaUWE
	+ixLG5ZJBGdfqmpUQVRysrHUhC/5hgAB5G6x1+KLglK2znZtQZcFUbSUPQC0BEwUhMiu+X32caNP+
	jO673x04/lPE8A2m19gAXMAt9C610U12lkacN8QW+2v38iFyUyt11ssfP8/6n4iYCUnaltfyxIE28
	cpali3hcoxgVsQjRiiOgZRkcaEy01kw01M7fEpqhz2S1HXNEIvdiK2pUQiFyjwgrAmXQPwmapR2fG
	NCjVCaewaqhwh19qAyNRVMwc2wWgvhU+Q2/JtUmm/veuEJ/Dul++w/g5eri7xq/ZJoiczEjudwMg3
	7JUPBJvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Jw4-0000000BqRd-1w9U;
	Tue, 22 Oct 2024 18:48:52 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Jti-0000000BqBk-351v;
	Tue, 22 Oct 2024 18:46:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43163667f0eso44385395e9.0;
        Tue, 22 Oct 2024 11:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729622784; x=1730227584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LDGG+ZQDHae1HZSzt9Uce9kPw28gcxjgHu8jDN2YlGk=;
        b=VBN8tc4a8OdxsPHbYBj+LAdvm3YZA0GAHDt+jPr51L8NT1lul9C3EoES1a6AOuUn/7
         O9/OYpfIJ6vde7ZtiBEQo6jsOYwzJtVZKndj5S8cJcTwr2w9XuUiKdrD4xwvKKcp1rMo
         xlvr7LvD8Uy1o2R0JpVL+0x0lbZslE6KcjTTbqHL1Hn/Do5G7CN7OoWor4lkNI97zoFV
         +3ZqvAzCWpXlXJ5QtRPbxzg52vgOkyCsfeVy43TMiL2TQAZ3LTTVgtKuISWHc8hrlsbq
         TxppVlIawW7DMlK+Fi9HWYThziZCSRMWqPunkbxxmoc+gD5omjIgdXNji8szR3rUN/rw
         ssag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729622784; x=1730227584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDGG+ZQDHae1HZSzt9Uce9kPw28gcxjgHu8jDN2YlGk=;
        b=R4SQzD+nuyN2MS97l9ig/+zW3SQ57ecv4f80Tr+/rg4pYOYO+C345f+TEXoibtaLba
         wK+yrNxKlQdTodVuXPuhxsubzeISjszhUeEDEu7VodfvDNQ6aJaLDDgxs+KgeB+Jpsxy
         xnxFMsvQyawQEVpFC0mpaB8RJ04EqUxatumGzLPJxHhNLjyxPXHt6cQe+NpU0ncZTORh
         VsJUJujhCHD93Ga396x3gp/iS564C2BoUWmCue+SR4uKZANzojEj707M8sw4TjWYbo1+
         Z80P8BDn1emyNU968tJwW4XZgLSJP/PZUZqIVwscZKE9QPy7+rGOpPPu8twhc/FKpcIR
         7COA==
X-Forwarded-Encrypted: i=1; AJvYcCUcT2mgxGEr2ltansKzFl4kDdkTccJeGs/H9GNVe9z9XmKfLf+21iqZoPR9YN2B7x/EUE1qnShY09tqi5K5YGU=@lists.infradead.org, AJvYcCWGRDcCUdJHveVuwUmZp5zcfvD/DXbF/Z1bzFvk713I46/kWphMzxtOH2tl3diy5q6VtKDc2v375LtSVoBy7szB@lists.infradead.org
X-Gm-Message-State: AOJu0YyePB8JlLEK4vu4+sWwclxf7HZBCck2jXyktxjn+I4DajlFPdep
	m5wFFvrfkeJ8cZmgbCVDmVwuSG6orkL1+sTtDvhfJk6l3f8aXCwx
X-Google-Smtp-Source: AGHT+IEGXgbWX9U0AaFuIJK13HFQXcaZ0nVPPJpIO1kzCYISrLnldzSg9tfWBna4Q2QBXEmg4Tk30A==
X-Received: by 2002:a05:600c:1d22:b0:431:52a3:d9ea with SMTP id 5b1f17b1804b1-4318414298cmr1579635e9.0.1729622784314;
        Tue, 22 Oct 2024 11:46:24 -0700 (PDT)
Received: from localhost ([194.120.133.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5c3140sm95635775e9.37.2024.10.22.11.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 11:46:23 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH][next] thermal/drivers/mediatek/lvts_thermal: make read-only arrays static const
Date: Tue, 22 Oct 2024 19:46:22 +0100
Message-Id: <20241022184622.1296044-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_114626_793831_1080F63A 
X-CRM114-Status: GOOD (  11.87  )
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

Don't populate the read-only arrays on the stack at run time, instead
make them static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 1997e91bb3be..ce223bab6b55 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -329,7 +329,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
 
 static void lvts_update_irq_mask(struct lvts_ctrl *lvts_ctrl)
 {
-	u32 masks[] = {
+	static const u32 masks[] = {
 		LVTS_MONINT_OFFSET_SENSOR0,
 		LVTS_MONINT_OFFSET_SENSOR1,
 		LVTS_MONINT_OFFSET_SENSOR2,
@@ -424,7 +424,7 @@ static irqreturn_t lvts_ctrl_irq_handler(struct lvts_ctrl *lvts_ctrl)
 {
 	irqreturn_t iret = IRQ_NONE;
 	u32 value;
-	u32 masks[] = {
+	static const u32 masks[] = {
 		LVTS_INT_SENSOR0,
 		LVTS_INT_SENSOR1,
 		LVTS_INT_SENSOR2,
-- 
2.39.5


