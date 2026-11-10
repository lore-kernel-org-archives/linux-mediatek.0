Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E6560A5BCF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 21:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BBfHtEBU;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZC/q1jJr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/bU06E1dTu7o82eVh0tv/62NUVUAMqK4tBifVC8vTig=; b=BBfHtEBUz9moUs
	/b+laAPMAPbddqpoZnT4R7b6PKCxKH1FU75HOpf4bg/RfmmzRyQmZGLfcBIvTWU365w37uHDhjdky
	GPF6C8GoLSL+EnuZnZXlBf/LJaUZIWfABtlEfJ3vyQTitn3fP/uAopTJHc+Ffsi4V2CXuNWjI8yrd
	vlnBPwM7nVJBh94jcjUNT2jtgCrtQbOFwea3P5d+traJrs22PqYvgZPiIwp4sN85A189WFaJ8KzWm
	puryloJjvUKb6XoVyqRnSzB0nzJvV10CmVDHAcSiLs0pU/AAZMdwMU+e11xGwGEiyhv1pFer123DM
	QvVEXEPa5uFkHwhKm0wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtpB-0000000566x-09sI;
	Tue, 10 Nov 2026 21:56:17 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtp7-0000000563d-2GYX
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 21:56:15 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1401287f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 13:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347771; x=1794952571; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bU06E1dTu7o82eVh0tv/62NUVUAMqK4tBifVC8vTig=;
        b=ZC/q1jJrKc33oJhEt1py/ePrntPrn5twyF8JihxlrUilJk6R3H04cEIsU4vG0kEMrz
         MEIudqO1R3Tv9c6J3Avd8cXLEul6bSSQhBFwOQgOgIw+kCtMcryrbSKHO19U8+niG0QW
         8cbk0NuM4XvQeur0bXjHUAjOfIWk/cjzMeFIGGrzzGyJVM8nQCP/UliK3tGRngHAvW9Q
         rSbyUqoZCJ/eaA/tEOtpE0nj3V86OHvuPV9r3aS0r9ntP8vl966NdKXeINb3Asg9rZxz
         f9atUhuruzFo+FIDkLYjKXugWYPpyCPOC564YxGc4oLa00qQvK8rAHP9vLtzGRWodhip
         pHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347771; x=1794952571;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bU06E1dTu7o82eVh0tv/62NUVUAMqK4tBifVC8vTig=;
        b=YRCZVB+uQcCoGZ3W38gy42EXheSwOj0cD6VbIDRzOxtqqYm+inYCg2If5CzJ1MGagJ
         GS6DEBmToFzvT62iCVjZXYay2hil7a8u7GT4xN+j0+E+wW2qYCy3Zkhl1aMD6kRiqW1z
         DxchFdTVHMn8/DHg0Ks+EzxBC1sNADkMLiZ/qNJC1Nb3nX5PsKWVMzWb7zj/V9oLnWtk
         PEV5XqRjAQubGVvTZBVgwQwn9qF0x1AsFnkBD8noMnsYWzaHwMxj8S02Jh08vr826fNf
         DJpoR1HxBSG2ZoBP2umoAmwH30Se9zoDCf46lN3akUHvGAYptyHZByIrWJS0Mc35tGUE
         Srgw==
X-Forwarded-Encrypted: i=1; AL+hErHoB6YFQGz/1JAe08HjIpwMBEW5kwOCThLoEfU/dAOqwLOmlJSoL7dwYBVmYdJSG7iPZiVx7l11TVO3PRazGQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+U4icynQOqTmLWk4nt9ZMeE+jOXjNhXli4A2YPHu1aLNp82VLb
	liioSHmrU4mvtMZsXTLZDC8OCQMWDq0GYjjdgkVGSEU2w2bpBn+m6XGnBbSa5PleYrs=
X-Gm-Gg: AYBFou2Feaxvcs85Sm8byWBwJqqPSaRfZE/Vhz5mxgB7Mmn1sw4vnH1VkHQmzf/Sxul
	5WsYELNThoGRIdFSeAtc+uM1zOaE2m58aaNmReTErSjak0siwiXol8Wrt9oShMd4idNme/y+isy
	RL9f5X9u6qxMvPagi+QU4J6QBfH5xyygeabaorjiD4O6ROJrKsC0GIQnJfVtJTI9RiA+Mo1iYNj
	0D/0sXVrtdEZZVAR5+u/X5r4zfzSPVvHQp97TnleN2fwYCOsSrPrgjvgird7xk8ZHnxbzz8tGdt
	DoOyWrXHH4H38jAVXDRm8CJwwRXviqdQnnDrcwATT3Jua07kkhOdBhh1hZhN5E7yHiRb+36V4pt
	dhhd4v9yiyR+KpYgpqDMkPr4lnSp6y0Oaomz0fzAi7N6VrHpOrEZ2S+zuZEFCuyUq80bt2LUL+w
	+y4uVexr6nyojmqb+fVpUk/D+t5T99IMM4hmB+11hqsTtujPnphX0Lbfobc7cTsiVeNPFtP588T
	qv8yts+C44iANqGfAj6t9n0+HMLqXa4McKdmkY5aBPj86WLC+MF+4+skkHcpoTUabJgtZdmV91q
	10CuvaKz72yNNztm2UHhESE7AD/EdqSpfg==
X-Received: by 2002:a5d:64ed:0:b0:48e:6f76:dea2 with SMTP id ffacd0b85a97d-499c69cb701mr366245f8f.38.1794347771565;
        Tue, 10 Nov 2026 13:56:11 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49835858f26sm7338595f8f.18.2026.11.10.13.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:10 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 09/20] mfd: Drop unused assignment of platform_device_id driver data
Date: Tue, 10 Nov 2026 22:54:34 +0100
Message-ID: <9bf8e674ac935547639dc6f89fc0aab5ac826db9.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=2UUtn/8z9q5Vil/qWmXv1wRJuUXUGptLBomjMZQsNCo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85K0kB+I64ERD0hCsZyM86WO9lk/0iKPumZ0d RCE1dtnaRSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOStAAKCRCPgPtYfRL+ TsofCAC0U2NJpKBqUl4okY4yooT3RlrkPcLeu3peOyFH4ZcFWAIRXbvvYK1Rm8+rb2RqhkOd8A1 sc0aSu4sqf/Uwz35Y7wKCOWUS7OFm3VoUfj77VKhXpSUf0LOXB9IZN0tf4CLIZunj4gS8e0YU/Y 736EXRz5MHk6g+CxnOLM/4N1iIVK31WRGBx2V2XY41wue/5cWWHY/TSL7lyU0Q9y1YPbKnd3kz4 yuJYdJAnaJtqydkGzFGZmtJeTHZauzOGUevEieD/vdxCKTlYsIBIfOqgOTr+AWvxgcAcQw+pNue UyErdr8iUXRmfPkuz0yG6yHCdwBgMmipkoax9/lKTDAr76TH
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_135613_949565_1AD8EBAA 
X-CRM114-Status: GOOD (  14.00  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 529a23b804f7..96aac158fd8b 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME, 0 },
+	{ DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 5d5f816492aa..e74936ac206f 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -435,7 +435,7 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397", 0 },
+	{ "mt6397" },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
-- 
2.56.0.rc1


