Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88918C77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 10:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPpAdhSm4CJD/pgk6jTskL1NGIM3f3MtmEm7eXNsMmc=; b=tnLn0iEZa679gnPfIWB0IbwM0Z
	VGScqYY1UwjqhbWYww+jPUPoXhfk9kEX+7uPCKp0sgry8UHoWNcBcL6i1XvnAKZ+FMGtP0smX0fPX
	hVz6xJfrZ7jR6JH3OiWo/oIuC+7YQzANUhsy7iQIFv4DAAVQYg6Ok0HY5vW2ww4l6lQQvTwRluWMF
	o1lugOZ4HckyzxoVBMRb1wESIfoe39zOsW8jiowYmspY7brY5WedTKUTjHpNkaq8cpYbyyBZ0NN/y
	Qu603tLUSzonYFVchNTwUr3wREsmW8o+QBUcx/Bj9kzSfAuU8K7BTB/G3cZJ9ANTS0t1cG0lwFufW
	9W34GGoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prcin-003eeP-2f;
	Wed, 26 Apr 2023 10:50:01 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prciT-003eSL-2J
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 10:49:44 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-2f3fe12de15so4228911f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 03:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682506179; x=1685098179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPpAdhSm4CJD/pgk6jTskL1NGIM3f3MtmEm7eXNsMmc=;
        b=h8t3mOk1DY13CsWSJvSQLRak2mrfZKHeeT4GR393Ga032pReV4vlUkdVhUo1CqXNK3
         cRIc0qtPx4p4Fze4D0s9gGQ7i+emYWhu2bs+YDQ+8GxEoweG99yX0OCyvWwggC1jZeWM
         d9vSWdWy7zB0DdBzlbJsEZIEsy703GY87jJ++wz1ZwqYPAPGXghcXItMGAhUWaXPOXpx
         i/6YR8dywf+Ma+iXJU9AVz6S1IhDPjliWT0MCfClE00SebboN85a76g/PIZqmxiTGr7W
         j84/A3oQt+95M/e+nUkETVsbOpfzrwLGiC2zxmn6TyyIH16C9k5b3nOOW+LMRc4o3vfk
         zwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682506179; x=1685098179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPpAdhSm4CJD/pgk6jTskL1NGIM3f3MtmEm7eXNsMmc=;
        b=aQIxPy8s2/sbYugCpyBkMXPL6Il4Wg5YBWOzYR4/fcEPM2v/PEsFYg4XzE8W6DDQpm
         XkoJov3lIaoPCWRmu6WnV2xat/5yI4o2rE63QaORdBx8/g1B8uexuo4u+GplnZcrX57f
         5300S+0XlQ0rRpJTgXaQq7EsTkPaPaM5y3HVNevmOQ5PREDUtt3GO4528qDDfIf4hu1z
         KXdY0xJYkIXWQ6u76x6MYbAx8u0WYGQ1B+RiJhXW64UQuPhVXb1BLnvfPyIFgKVmzS/H
         hV/MQY6Xi7Spmw5qR8LxTlQnMbboYRYaVV5jKlPcmsilo0+IGl4zEMBE0U/7OQAJOI2D
         CCAg==
X-Gm-Message-State: AAQBX9fW+KU0uxb2xEXbPJhfOpvJNX3A4GS99EwssoRO3D2D2Cq0oYx2
	/plJc4wfucsTdat2GfwFK70eOg==
X-Google-Smtp-Source: AKy350aTontAhbh5/FKzND2ZbdcpHG6W0NonLo78fbx14JplajvW2ZLTYIjXkLeUV543VHR06kgiLA==
X-Received: by 2002:a5d:5957:0:b0:2f4:3b2c:1b2e with SMTP id e23-20020a5d5957000000b002f43b2c1b2emr14997388wri.31.1682506178885;
        Wed, 26 Apr 2023 03:49:38 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 25-20020a05600c025900b003ed2c0a0f37sm17601988wmj.35.2023.04.26.03.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 03:49:38 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 26 Apr 2023 12:49:02 +0200
Subject: [PATCH v6 02/12] arm64: defconfig: enable Mediatek PMIC key
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v6-2-8d6b1cfe7f29@baylibre.com>
References: <20230203-evk-board-support-v6-0-8d6b1cfe7f29@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v6-0-8d6b1cfe7f29@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=794; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=k532urY0g0V1o02FuoDf+quB6H4pbB8k/wwqhAx1hVA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkSQG/E5aHHBqCCuaioO8fxvJXXol/Q6XwEd52YIOD
 cKygCWSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZEkBvwAKCRArRkmdfjHUReACEA
 CbQfWLBQ0a8kH4g5vbThuYhFwqe1JQiv5flAnX7LXAZGSQy5M3ts6LLb1jsnXZk8NnJLcrZglc+SSs
 vZPml1Moe2faBlLDnGn4LtxZtPHIGnDB3SPB/Ns503pTsz9YWE5SkPVFZZb3VifUzflhpdtyg+09GK
 wyVc7bfegYDa5XhoC7MD10ifHM/YICo+M0KcSTR+lI8E+V68lOCmrxm77kgj0oqMsrKLBz102sDp9y
 Qv9S1urL5Xlgyj+SQ0lndl+2RYUk7zbv0EDROmFJ0eyU25zH1pRWyBberZrFP8AhY1d08Zt5iz0fOx
 l8ddAfnqWmHgsBsyXmzqouY4GaJXc8+nsIZnAIMpIFnZDgRYMG4b0qukFhT5uA/LqDiNJVy4R6jvml
 xepyJ0wW8mxxfavRDFR2srZIVtftrM0fFBeGR85ifSUibyT6M4OMhkZ8Z7sSNglO8SfFHVDq3cF2LU
 AgwdoHivc6tghEl5EcZDgraY3bGT+x6z8oXpAo2JINz49IvOvnTsgkQtV65pPQOJxoHLdkP2th80N+
 tUrMiYYEn5+PLyMs2Z9JScjdWBaYpJuD/1oZEbs1lC/Wzzl9bLy3whNjV3jQCv/K2e2syJmbtVzpL9
 O7JhubUvP3L9ACz/nxBwnlIOV8LsJD5ggqcpCykJDWjwfii6i6LgIjvbfGOw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_034941_754931_85773D13 
X-CRM114-Status: UNSURE (   9.79  )
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

Some Mediatek PMIC devices can manage Power and Home keys (buttons).
This patch enable the driver which handle the 2 keys managed by the
Mediatek PMIC.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e4cb65889ae6..4a100f147de4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -409,6 +409,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
 CONFIG_KEYBOARD_CROS_EC=y
+CONFIG_KEYBOARD_MTK_PMIC=m
 CONFIG_MOUSE_ELAN_I2C=m
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m

-- 
2.25.1


