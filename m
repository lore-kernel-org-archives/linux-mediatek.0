Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578D4C77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jun 2025 05:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdewN+OqwPnfjHa4kNqJuR+GOLJuDMWb9fhOCDaUpO4=; b=nYNSp9wcSP28g651fhxpL91gLh
	adUHmuYZbp1/q/eVSfVlwNZrMRlEi0c+MSPfPMFppU0bZG/OGLLRPhss0brUJnvQFmhUEzxocJ+tp
	MB+9YE3TQrjo6A4liBDSJ2AuvYMOGmKEo+EHh07RCq3Eate3miC/5H//TinfDCx3xSt0yZcTsnmQy
	oyhkWdxhKzRM3HOnxZyRutStRTdJd2t7La4ugQudvELn44MMOFcWYgAs4TNJypNY0A7EhXb5elHJz
	gznQblSBtj/YsEaMETfzwFU7AVKjMobRwa2UPZRAI0RbjSLxOsROJpQO0TfKXCNiND/bgxlu/rlxe
	qv3ezdTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUIbr-00000007a3G-2xeF;
	Wed, 25 Jun 2025 05:23:47 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUIZZ-00000007ZxV-05Pp
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Jun 2025 05:21:26 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so417814b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Jun 2025 22:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750828884; x=1751433684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdewN+OqwPnfjHa4kNqJuR+GOLJuDMWb9fhOCDaUpO4=;
        b=Pt6yF+AzgftcS/zkGOs85Fk9aza0TVi6Y6Xo0EMIU/iKfhNiffDfuGek7/VmQbiUWq
         nuDSafGlnpd+YdB3xTFFHT8fvdYHUiKD93aVcr8Ijf09EjndsOzdOABAQOdtHgnfAj9N
         PfUBGHV1aJvQQ4qTe1eRIs+kAbikRNkLEE8nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750828884; x=1751433684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EdewN+OqwPnfjHa4kNqJuR+GOLJuDMWb9fhOCDaUpO4=;
        b=pzkMsa9NDKqFFf4nckg0pguQHY5ghh/dVIz0ZnYHN97F1JABoQqO4PgQyGRmLncUfQ
         v2G4RgxoMYVzRXL0J4OZaEVQKnbr6Bx/xVDxWI2wrlBfmMaCZTuyXP99d5CLsp9+mn3m
         t2wcRF6ZCgzIW+AcgVHqEZTttsNV5LRKFXlQRh3OeYUAWy6nFVgxeBrh7Nk32HcF2j/Q
         yyr8THsqJRU78PnCtBecP+iTWpndIJYSPwBBZ8LrpnZG6E+r4xoFs7jtDojieHRmQxzI
         SAbmsdmbL5I/h+zDVoBgjxUALZFHeRMa1/iayWESw38iguZskQGXMnF9sJ0RkbDsshsr
         W9vQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0v6oJj0Sow5G6Cc+u9DUnPnASwX85/KD5Ro+ovfoTM0/8iqjTUHNnjvSrvUrdM2qw8J8bmLfSNiIRXrAfCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhALeYNekvovNUEZ5+cTijM5Jj1K7ROmPwY4W/v9Q6btWSLSx3
	85A5DE6ySl7w7z+KDSMZRnhxCOOOvHOgUyYiARrI70/QKHWNobX6Dze1rzIvocRbfQ==
X-Gm-Gg: ASbGncvjlxG/wrtUEtE2zIdLKEd5OlNzNV7u+YywpO2uO1Ak9d5zjm+hGKN6mtnBfdf
	+JEVSCHxxyLgPa2V062bjroOLoFfooy7zc6CeNWtgFxv/RurKyBz1Z4wSRxibsIoeiEMvQdM4Cg
	BjI7zkEkrPGgO6ss+M6X9axGjKCVUASQpmnEAqDMq999BKlDf18JldDG6+1+Kc9xO8f8q0+JUpk
	cboX/iSmCxyeYSyU/FLmdMB22vsprsFUBP1ShfEkitllhJaNup2U0bVmeVfvajXCyELOkJiwtYO
	iqRat6k5181dbnt2VfL8rJouubnhbkj9RQDwSEKbPI5E0MOv/bjemrxo3YG+9o215nHTBMB64uV
	jvPAqbVnpneHz
X-Google-Smtp-Source: AGHT+IHtRUvI4BFjONg8E4iCJF2EoVUYaYsRjRtF6W4pN3FGjeweBp2iZqpmntUDbugSl88Vu2pCtA==
X-Received: by 2002:a05:6a00:464f:b0:749:1e60:bdd with SMTP id d2e1a72fcca58-74ad4ad593emr2674902b3a.2.1750828884013;
        Tue, 24 Jun 2025 22:21:24 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:301e:ee9a:3fb5:c761])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c882cda6sm3536393b3a.96.2025.06.24.22.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 22:21:23 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] mtk-sd: reset host->mrq on prepare_data() error
Date: Wed, 25 Jun 2025 14:20:37 +0900
Message-ID: <20250625052106.584905-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
In-Reply-To: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
References: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_222125_081188_7FC6EA34 
X-CRM114-Status: UNSURE (   9.86  )
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

Do not leave host with dangling ->mrq pointer if we hit
the msdc_prepare_data() error out path.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/mmc/host/mtk-sd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index b12cfb9a5e5f..d7020e06dd55 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1492,6 +1492,7 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	if (mrq->data) {
 		msdc_prepare_data(host, mrq->data);
 		if (!msdc_data_prepared(mrq->data)) {
+			host->mrq = NULL;
 			/*
 			 * Failed to prepare DMA area, fail fast before
 			 * starting any commands.
-- 
2.50.0.714.g196bf9f422-goog


