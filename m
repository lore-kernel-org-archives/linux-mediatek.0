Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB81C6FA99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 21:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8KkEKWZ0gN3SHohoHksswAukmLUtCvLSzW/QOjaikM=; b=rcZNieZvoG5y/u5jgcIrREUhn1
	wfmWXxk83P8j6InP5fMakgxZYuvN8bdg5vatst6Cpc6ykv5dAsaf045nVqaD0EGYFXzfSF0xu1RQ5
	n2cZWoWFgho0tX9h8/NzJXFdJMrykCB9noOGVZJtk+W0PEPzXEBo2ifR1/GIO4sni/pd7XHY8MGDG
	3L5hMoUQDSGiPRRRMsbbDv4cEJpnhQcNnL0nAwIxMHHrNVboUKzzkLFIO6NBGKdiEC8rUJWHmH09O
	SMbKePhXaiqoMzZPQD1ahyMqI9cEARClj4kurkmyZGxQyY06SVNegrY5Kg6gGaGMU7idbi6hTgAoH
	LNW9npQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pakdd-00GFC2-OW; Fri, 10 Mar 2023 21:50:57 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pakYx-00GCkH-Mk
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 21:46:10 +0000
Received: by mail-ed1-f41.google.com with SMTP id cy23so25986835edb.12
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 13:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8KkEKWZ0gN3SHohoHksswAukmLUtCvLSzW/QOjaikM=;
        b=qrYJxUKirtzDvIQKoRJxygRyf4FPSqFSi0XVFQVFP019hUJJhetCebgkKhN79vrs3W
         CIKol9vmqcKXFzhdYjb1UTjEWhmCgRQnV+R2cqHNKf+j8Mpyg7DhTibGCY0vHIrFfqbK
         MYdEtrAnXuCYjFCFYcqYzaJdXR+JsnR/WpDdA+37QliqOcRHKYHhRM2Opif9wIh+NaJk
         nH2yk34ZI9d3FQKuBY2OmYQHDrkb0n+JgCsnkEqH0/5fLxA61A6woskfsucn1TYakkKH
         8fTp1iBBNuDjOcbESiG4v3E2y5Icd1y9w2E4PwTRKo37+BS1ebmSpl+iTtrjxBU4Yy0v
         2w5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8KkEKWZ0gN3SHohoHksswAukmLUtCvLSzW/QOjaikM=;
        b=Ufz079XTkeieOZTpa0X8u7JLPdnI4OFUAtTdKni7tnCMpIkOONhiK+GKo11GyfJmVS
         oKxdSe92VnVssNCSsU7j70BNXTCD55FNnFs/FeCj0O/a55Elou7go6uP61G4A/qmrU1O
         UbvzGnKp90WykhTglxcFxYpPp76EIoa7CU/iZrKaNM8OECKMONXqond6apVTkZ+JAu/W
         hhg9P3WF6xXi8D78xJRwnYMvy/uZZY2nIVv5T4VxB6QYclFpmy7Y0a6X75A1tvGQEdvY
         DfCpOfInjkcOXw29Hn2zFFTtoFVaJng89DGApNr10Za8DZMECWe4/i1HZPnWjDNhxXYv
         NAYA==
X-Gm-Message-State: AO0yUKX7PlnguQTB/OrGgAK1OUBITk26Q66prywGL1Em0c4vOcZfM1tG
	SFI13lJdINrZu5EAY75xIIGT6g==
X-Google-Smtp-Source: AK7set+C1404HGuunAfB3xCjsvxwrV5s95xwTHsN/mtfZYe+CBdiAMXV1CvssAAn+RAQCfGwoNG2gg==
X-Received: by 2002:aa7:d646:0:b0:4af:601e:6039 with SMTP id v6-20020aa7d646000000b004af601e6039mr24224761edr.22.1678484766010;
        Fri, 10 Mar 2023 13:46:06 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004be11e97ca2sm471873edi.90.2023.03.10.13.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:46:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tony Lindgren <tony@atomide.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 8/9] regulator: twl: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 22:45:52 +0100
Message-Id: <20230310214553.275450-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_134607_815222_31A0CFE4 
X-CRM114-Status: GOOD (  15.35  )
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

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it is not relevant here).

  drivers/regulator/twl-regulator.c:553:34: error: ‘twl_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/twl-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/twl-regulator.c b/drivers/regulator/twl-regulator.c
index e2a20d512152..fe80a5e20bd0 100644
--- a/drivers/regulator/twl-regulator.c
+++ b/drivers/regulator/twl-regulator.c
@@ -656,7 +656,7 @@ static struct platform_driver twlreg_driver = {
 	 */
 	.driver  = {
 		.name  = "twl4030_reg",
-		.of_match_table = of_match_ptr(twl_of_match),
+		.of_match_table = twl_of_match,
 	},
 };
 
-- 
2.34.1


