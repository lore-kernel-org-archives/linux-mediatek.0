Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11856C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 16:43:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F70B613FF
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 16:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F70B613FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=puVv4yDBGc5tTG5tEN4Um5DU+yRd9Xh1n0spNI1Nl0M=; b=YrWzkiR0Pscy5b0mu3W2/J3h8
	oOS/vflErtdChrJAZuTIItaYzVFCCXgQf4qMznlQMju+eyBtcUehZtAzeX4ywENx+X3K1mbOCy3K9
	JsVkFVKLIGKada6tytEDBJdDGZuW0DHwf/0nH0iGT9b3btm25jOPo9Y5gGlrkcAviOZz0u4xCkjlM
	LbkuySsbk0jweNCjFtDS97UzWxA+Y71y3PX2M8aIDaPbYjoMayXGWZc/Yo9pr4hK+AbO1Zl0SF6cT
	dJ+QDe23SCjuy1np1GMXfd6TETGf3HnbrH+SfYTcXjdFOGWOpgbyyT4jJu1LUsjJjNB1KvEcRDckX
	36aXH0Pzw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbnH9-003rLU-Nl; Wed, 28 Apr 2021 16:42:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnGh-003rGj-Lc
 for linux-mediatek@desiato.infradead.org; Wed, 28 Apr 2021 16:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=1Npsra9lTv9v4xN59JKhYP3YKsTPHiSIJ0ifDE3Owq0=; b=250FTZRSx04DgTLeGDznxrc08w
 Qg5b6VVgSxBu0P6nJAyWOdKbqRjU+BKGEXdWto9MVrbaKR3jcDKv0OmOCKzTEjsLLt7y3hn5kpedq
 g7PI9349OxWkSgHrh265gwKIZHGVokT3bRN1zYKB2n/DNdb4TaE7oqEGfMdO+WDrA6SR0vmoqad6e
 YyvGpG7r03YwpsnjKFg/cfHVa/DhR5ErbUS9LF99RpFdYxVriRu2gKmMQMlTzEIi8Pfc8LUZOsR2S
 WNmRFGYArp9g6QZBdE15sPPyE+AVs+ck1wM47hLTFhA4ELR4rwVAXPTDfk5yxpKgi30qJ9UCKRgLR
 JHxb691Q==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnGd-0001db-HA
 for linux-mediatek@lists.infradead.org; Wed, 28 Apr 2021 16:42:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 l189-20020a1cbbc60000b0290140319ad207so7233466wmf.2
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 09:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Npsra9lTv9v4xN59JKhYP3YKsTPHiSIJ0ifDE3Owq0=;
 b=zUDZjIL2usIB5WXxK/ye4NbuH9+DXS1SfA9xQTM8vq1Dg0Otmpvz9GfHi2opbHEsnK
 FtLetrva6yDTWEssMBaO0U1BGKu97PDRbGkJBJCDLlUCeISqVJmyWvx1rcNZPpd1+en+
 o0onKxEcPszCkG9gC2SOsLJOxZZReh10HmEK7H/qlFs7ED2RMTn2SlGocO3l3cHc8XbZ
 KK/dK54ZXBxKYeRoYlLePgwqmFjTe1BapwtnFKBapqOxVM5xOokZITRx2tA6uypu+T0G
 1jbos3guoOsApl4T+3WXTPmXArr5SGKpUxcJlQ1rxIydrMJX8rMpHjkeit0G9StsQ1bq
 Wkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Npsra9lTv9v4xN59JKhYP3YKsTPHiSIJ0ifDE3Owq0=;
 b=UIBlECl/r3Tnn0c/2JnsEKh8VvvE1NE0YXn1K5pSfUi8iYdEy86Ns56u9sEae7evO4
 3jkwEKk7gpxOiz/FtaE0cmRcHUfnbbHPHp7j0zNuX/LQNeBZV4YZ72S7FiRzH27nagel
 dKnzd5Oen8FI/m3Rxm1xBjEpQ/bbn18ui8fVI08RCqzhawDMZSJbLKmkwJm3lbL1yuiZ
 xX/AcxWlg/b6gTemZqz7lx2PpbUfhBRtboGp2U57knxZQHwJ+UmezOH56VDOCg6US08E
 WrRZflv8WLEufq85ApA8X5WTBf0cPwdJwXVs9rVpZRMKL6L8k3oaYWxLDfDutXRVZiQf
 m4sA==
X-Gm-Message-State: AOAM530fZ3ih2R2JZeMilF1w6pWEDCf/6BquZp+ONaNsmcSUzcc2N63Z
 dvhzMAI/0rFsWvm9fRNueI7qvNwgC7Mb6w==
X-Google-Smtp-Source: ABdhPJyWnC5LYX8PDdAFYQdLJOpHsPJILkQ2WJwopTaZ8WFEeAxhvmHUVeqf21SzpLPRGkU+Tw2Sow==
X-Received: by 2002:a1c:f708:: with SMTP id v8mr5666235wmh.133.1619628145900; 
 Wed, 28 Apr 2021 09:42:25 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:5864:ddd1:d623:f912])
 by smtp.gmail.com with ESMTPSA id o10sm351299wrx.35.2021.04.28.09.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 09:42:25 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: fparent@baylibre.com, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] Input: mtk-pmic-keys - check for NULL on of_match_device()
Date: Wed, 28 Apr 2021 18:42:13 +0200
Message-Id: <20210428164219.1115537-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
References: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_094227_585845_B87B66F7 
X-CRM114-Status: GOOD (  12.58  )
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

mtk-pmic-keys being a child device of mt6397, it will always get probed
when mt6397_probe() is called.

This also happens when we have no device tree node matching
mediatek,mt6397-keys.

In that case, the mfd core warns us:

  [    0.352175] mtk-pmic-keys: Failed to locate of_node [id: -1]

Check return value from call to of_match_device()
in order to prevent a NULL pointer dereference.

In case of NULL print error message and return -ENODEV

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 62391d6c7da6..12c449eed026 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -247,6 +247,9 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	const struct of_device_id *of_id =
 		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
 
+	if (!of_id)
+		return -ENODEV;
+
 	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
 	if (!keys)
 		return -ENOMEM;
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
