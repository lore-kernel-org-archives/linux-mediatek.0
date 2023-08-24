Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEA0C27C40
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Aug 2023 10:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11OMDqVoPHj88ZJ2JJBotRCN1O2u/mKSOXzwJ5mYolk=; b=m/DMoaM+mX650q
	86J8AsknKKNM31l4PuGA4orGlappXloAR8js/VTgk/4+HRCyThYCosOKhTYhwO8dDiCS8EMHuK57N
	b9Wvsp6j7BHqEX7b8+4nbg7P1is7CjwYrKYohtN2g8yL47OmpV0cUemftip3H7bGC/aV6Juv13DOg
	ecyKDsnz7JJ1p0yQNM1crsm5KUM0VTJNtzkvODY6KFo2oviatsGHi+jKO3Tfsze1KjnsRXpEtksMg
	xGTkgiO3rnGwFzYrpOaZj6NH1U8Y4zN9y8qZJDaVVcVJ7CS/bpAJbUM4ZVIAFApUkdACbx4+algOL
	SyCQmqrgmsbiXjiW/hmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ7ms-002tmB-1b;
	Thu, 24 Aug 2023 10:42:02 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ7mp-002tkH-2E
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Aug 2023 10:42:00 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bdb7b0c8afso41201625ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Aug 2023 03:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692873719; x=1693478519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11OMDqVoPHj88ZJ2JJBotRCN1O2u/mKSOXzwJ5mYolk=;
        b=TLRyytcCKZ5pvPqDgKQrJygb5/3SMgG9GDYdNw6z2HnL81D20CEDAFstplAijFbP4k
         bxJu/nxU4QI51JcqgWn43/7+qNZd/RWjEAJgvnKSJyZDLYhX0C6TLk9CFt4gHcJiokv8
         /EnejQ+0+FfhONT74+rGUVytbINgjc8WfJPD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692873719; x=1693478519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11OMDqVoPHj88ZJ2JJBotRCN1O2u/mKSOXzwJ5mYolk=;
        b=HbO5m8dwzWmCPGxBSrEOK3Y333sGf7r8H6F9R5ZKwBWCt7jNsHVGjPBBgXUF7b9xQc
         C/EIjcuvLxj9MCt4sfgS1ty1VcMpHMIwMZ2gHQEfERiIA8WHYo9JsWXDRlRp99gWW0wh
         TqK8R5jeW8kfCz4ni0z7jmJLJmUByMmpqubOgsLhT2eIOHQlZyvsfo2NepNuziaNjcm1
         Eu/T58JBuGnA15mi3PSsqQ3v52cTK+neIRDqCQ0DRvcGCmvgJ1BJoy1iT7X/cuuvQ/KX
         bZ3LUjESvxj8Wq8aWw7v1qcC3ejspsaALPulDdU7vqJN2ZWjVHqATAa+ZQMoHr3Kfeo8
         Z4/g==
X-Gm-Message-State: AOJu0YxlKLKoTEzoePEPX1IcmhK2dFoAt77XKVXoJBvmwDa2LWQ+hBko
	U1qt9yyZrHa96ljvz0fn9XEsPw==
X-Google-Smtp-Source: AGHT+IEjXqoNHLwL9K3+kgYdZSexg1MmfuqiBw8xGh1DzEWiwriMgsY3wjC8rJhHLSB9/+0if9QOXA==
X-Received: by 2002:a17:903:1c4:b0:1bb:b91b:2b3c with SMTP id e4-20020a17090301c400b001bbb91b2b3cmr14732522plh.34.1692873719205;
        Thu, 24 Aug 2023 03:41:59 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ed6d:42e3:a23:8316])
        by smtp.gmail.com with ESMTPSA id q2-20020a170902dac200b001b5247cac3dsm12524645plx.110.2023.08.24.03.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 03:41:58 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH 3/5] spmi: mtk-pmif: Reorder driver remove sequence
Date: Thu, 24 Aug 2023 18:40:10 +0800
Message-ID: <20230824104101.4083400-4-fshao@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824104101.4083400-1-fshao@chromium.org>
References: <20230824104101.4083400-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_034159_743524_4CC56648 
X-CRM114-Status: GOOD (  12.05  )
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
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This driver enables clocks and then adds SPMI controller in probing, so
we expect the reversed sequence in removal.
Fix the order in the remove callback.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/spmi/spmi-mtk-pmif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index eb909a6e3b9e..2127bbd2f856 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -503,9 +503,9 @@ static void mtk_spmi_remove(struct platform_device *pdev)
 	struct spmi_controller *ctrl = platform_get_drvdata(pdev);
 	struct pmif *arb = spmi_controller_get_drvdata(ctrl);
 
+	spmi_controller_remove(ctrl);
 	clk_bulk_disable_unprepare(arb->nclks, arb->clks);
 	clk_bulk_put(arb->nclks, arb->clks);
-	spmi_controller_remove(ctrl);
 }
 
 static const struct of_device_id mtk_spmi_match_table[] = {
-- 
2.42.0.rc1.204.g551eb34607-goog


