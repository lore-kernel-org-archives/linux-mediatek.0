Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387D6109318B
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 08:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwKh84aPEwlbOzcwKg41QhnYITbrVcHTcrSie4jnTPo=; b=rkZTRoFuUndLqgOe+06ZQbx4td
	lxod6R+XTFY1EMtO4hGERDYGFIStxB8yZNCqmZUPzU9r474SPG8g4p81gz9dIn9kp0SpGPf0k8bTF
	PBVOfCIInOqg8ARFWOEatDlSgKhKLgx9yVLV0AYDsx7OWppQTrdU+VZrGnN7wyJdfMzd5LVx91KOd
	vkYBhrToq/wY9xP8pd5MvNilErCsuZEHmCGUgCJVGdy1+3D5NoYcW3mbN2GqHq2roHXEzz3xRAK/4
	O/VJ9Kb0jMk/shkOZ4YT8rl5/RnUPHpCSmUq2y4jsBWcFPnIAPawxfgJb8z/fuYi980o5dSnajHR0
	PmuNmUfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VHO-0000000CMKT-1MtD;
	Fri, 20 Mar 2026 08:32:26 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VHM-0000000CMII-0hGk
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 08:32:25 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82995242934so1294057b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 01:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773995543; x=1774600343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwKh84aPEwlbOzcwKg41QhnYITbrVcHTcrSie4jnTPo=;
        b=On3fklCwI2NmAozmHU2ONTuGtVgJyJ62Y5Q1gEjQu0Vfa3AQuq446FTdAOAw+MzKQ2
         9PN/JxhXjHtSG2CnUeyQs5Z8DgnfUi8dl5K8Urr281V4yf4uC4LkA6A4OnnYmZP0GkcH
         EEGWRIIYw0OM7UGuu+fZ+c40JOVgWDeUhZVIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773995543; x=1774600343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uwKh84aPEwlbOzcwKg41QhnYITbrVcHTcrSie4jnTPo=;
        b=aUfN5w0U9PaDgOLTReeaij0cfc2AUXxD7WTqvjUFCEstlboS9r/SFuC/R8TZ1HZCwe
         VrGDtAIL3eCwRZFHxCYOl90NFvwv4WdGXPjtTt1ZPb3W5iXNLQPnVYlkZ4ANkw4EQviR
         tIq2TVLGMHQyU4srYtC4I8wQCN8fFMRpr5Dt+cgyGrr/lkREw+GjeEscz4BHa97NqDPv
         GD9P4zUSBZ7Nmklzguzq9F8PetrX/XJ7lvI3TJrVqqVWsQuWTNd0zldqSqb5wYoiqxVk
         BpU7qylSqzv/NAh64ObqjjSQ/yMgSZdWs7hoCq2nnnlrDDUUe46t+XrPIPlGk4+p4EM+
         3QWA==
X-Forwarded-Encrypted: i=1; AJvYcCWdx75uFsxZK71hQITqSL41vr5wfAYOL4ZmEZKiu/06mmVOGAcPr187ew9ammAaW5bK61KGjFMgo/lmweiflg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdycIr/re7eoTcG5rBvjZyBzNiju01I9VcfwLYYd6d0rTbfmYH
	6ZNrEHDMlgWpao16zRtLPMgM4ClNSVVK+DIkACm6D0p6OxpKuhReSg9FqyIkadXS5A==
X-Gm-Gg: ATEYQzyxbkYDzRHl555nDQmNTA3fl+1NTV098FzTYpT0ds53gTWtV/l8hrjdumkLTK9
	1hM4NuiupuVB2tNX7pUOHloBVFCNjaWCb5fI1bR4wzCEuVFBvApTM7PVIrEXTDOnjPJ29g8dwID
	Ddb+bcl9kVhhb4TfdA4o4QRmPvDauUUTibf1ZIzrTnBhLcxnXyeddkGw2uV2iFphaYZx5Hsh2o9
	s4qUdmwwyRPEyh2/VX6KpGPqMOIvhnn9fG+OENqrmeHIkhk/Tmhg+DJbTcJS3XoAci95hGwK9ZP
	JXxSSrrBEuzXeSXDcU2KtvstTVTZerxmxngWlbthZtpyiNzJARBwWXs9PaJX/rhv309deB5WeWb
	konI8/ahGkOuQ1mki2+c5INzX7/fsU/sfoKzBPRMsMxS/7U9SUAFUTSgrp0d2Qj05rHqvZrAMke
	/d/m7jynqHTNwDIM7VQo57d+aNNK1ZEhQQrUb/6xRuM9wD4XIkhJ/Dt4oBrxGGqFoGrUuXFYuoI
	rPN7Qc+
X-Received: by 2002:a05:6a00:2e9b:b0:824:3ef6:a815 with SMTP id d2e1a72fcca58-82a7a80b69dmr5877135b3a.8.1773995543605;
        Fri, 20 Mar 2026 01:32:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040debf9sm1408816b3a.47.2026.03.20.01.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:32:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 2/2] regulator: cros-ec: Add regulator supply
Date: Fri, 20 Mar 2026 16:31:33 +0800
Message-ID: <20260320083135.2455444-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320083135.2455444-1-wenst@chromium.org>
References: <20260320083135.2455444-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_013224_214669_E2DE5A54 
X-CRM114-Status: GOOD (  11.07  )
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

Even a regulator remotely controlled by the EC will have a power supply
input.

Add the supply property name from the device tree binding to the
regulator description.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/regulator/cros-ec-regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/cros-ec-regulator.c b/drivers/regulator/cros-ec-regulator.c
index fb0767b33a36..aec275fe1f44 100644
--- a/drivers/regulator/cros-ec-regulator.c
+++ b/drivers/regulator/cros-ec-regulator.c
@@ -183,6 +183,7 @@ static int cros_ec_regulator_probe(struct platform_device *pdev)
 	desc->owner = THIS_MODULE;
 	desc->type = REGULATOR_VOLTAGE;
 	desc->ops = &cros_ec_regulator_voltage_ops;
+	desc->supply_name = "vin";
 
 	ret = cros_ec_regulator_init_info(dev, drvdata);
 	if (ret < 0)
-- 
2.53.0.959.g497ff81fa9-goog


