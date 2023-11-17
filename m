Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6F2C197A0
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Nov 2023 09:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TVxZf23b1Ct7o+eXshFFzhsxx/lGHOCTi79IGHMkXx0=; b=Ex1vwcFY23twz5FGpAqBUrNlgb
	zD14YzI8jZGb6T9XsPt+Juvv5ommEgDSULtMNLn3TbgG1KI5EoQeS3/7knAjYFnoSjnuSG2kLf1zm
	b4yZTCkJx72kQTKUQDs9bse3QYTiyDOR48rlpzAS/N8rKS6v63Mv9qdAPttrOPAEj5oQCT+qpd15v
	RpVhFq06CGEHxjK7rTcDMjgyt0LH/WwlWYqbwGXY0lMdR1g3wCK4m0QJBv3UiFHlwtXcY/doQAZ2/
	TYNTKHh+zaS9IolSJxFzx+gL5IaO3gD1WXxEQF8dGx3LDdc0br0VhcbRI+Ub8yhZCIdPfOJdsVFL+
	3bNJDQGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vZh-0069fX-2D;
	Fri, 17 Nov 2023 09:55:45 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vZe-0069eQ-2Z
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Nov 2023 09:55:43 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3b2f4a5ccebso1138322b6e.3
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Nov 2023 01:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700214940; x=1700819740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TVxZf23b1Ct7o+eXshFFzhsxx/lGHOCTi79IGHMkXx0=;
        b=ciwn7ildAqR/5Vg62vpC3nr58l3TIPQAjVLph3L8AAia667Kj5e0HJ8p0diy3VbuUP
         lew9LDE4N3ocAOD7P/YFhnfCHClITeSFslFyOJ26nRM3Be1gyIM8a8pn9H1F5PEM/vdR
         RU0wVUE+321G93mIcRC+vLXHWiLI9zTtVcCMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700214940; x=1700819740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVxZf23b1Ct7o+eXshFFzhsxx/lGHOCTi79IGHMkXx0=;
        b=kXb6UkElIojNaLXtqrIikT84vLAUOixkkWnCbr73Y/RVfyBkjJakAsxnAuRZzPq1Qo
         1nl1UfO9+0pnn9/X6VDkc0vTGewMmgykAbJGjeQti4Dp5amWnzDKI3aNwrYD3auXkFqS
         DZ9cqp8CgOsaawOhT4eBNtWt/3vJBoGB59UP5pcY9nC4xjV07ILPFvkn/NkIja3nRU46
         /lnXXoPFJ5HhaYcSHYbb4VwIp+otJxKMNJO5XvYnuZXyNJEMTx41Aua4/jMcRnLFelmy
         Ex3Fp56FijGzFH+OGxyGe7THc4q6wyM25YFM4zhEIB2ymijqPAxzc2zNQ/+1CSrDtIB3
         FI4w==
X-Gm-Message-State: AOJu0YxL0UMnt/H8kdK4vEvSOvqL0IStz6RRocghRp/GFWWwdLNBcG70
	wqu9pEiwcu6w1mBD08Owi5Kwtg==
X-Google-Smtp-Source: AGHT+IGOoFsqpjvXqjYKjizRulc4FsjuAYO96rTyTzI2mMyXw6i0NLkFJfJqGRhBvGABhCMn+fGMVg==
X-Received: by 2002:a05:6808:1388:b0:3ad:fdfb:d384 with SMTP id c8-20020a056808138800b003adfdfbd384mr23689636oiw.53.1700214939883;
        Fri, 17 Nov 2023 01:55:39 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:900:4eaa:9148:bc32])
        by smtp.gmail.com with ESMTPSA id d18-20020a63ed12000000b005b458aa0541sm1038673pgi.15.2023.11.17.01.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 01:55:39 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	ot_shunxi.zhang@mediatek.corp-partner.google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH] mmc: mtk-sd: Increase the verbosity of msdc_track_cmd_data
Date: Fri, 17 Nov 2023 17:55:04 +0800
Message-ID: <20231117095531.1693753-1-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_015542_836071_C7889EE0 
X-CRM114-Status: GOOD (  10.12  )
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

This log message is necessary for debugging, so enable it by default to
debug issues that are hard to reproduce locally.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

 drivers/mmc/host/mtk-sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 97f7c3d4be6e..4469003f571e 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1150,7 +1150,7 @@ static void msdc_recheck_sdio_irq(struct msdc_host *host)
 static void msdc_track_cmd_data(struct msdc_host *host, struct mmc_command *cmd)
 {
 	if (host->error)
-		dev_dbg(host->dev, "%s: cmd=%d arg=%08X; host->error=0x%08X\n",
+		dev_err(host->dev, "%s: cmd=%d arg=%08X; host->error=0x%08X\n",
 			__func__, cmd->opcode, cmd->arg, host->error);
 }
 
-- 
2.43.0.rc0.421.g78406f8d94-goog


