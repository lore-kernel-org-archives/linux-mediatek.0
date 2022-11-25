Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3EEC4167D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 23:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4NT0UyLFq74utORBOv4WInxsxyZMPY8J7uSXPHg5TpA=; b=xRc4Rxnq/CSPjsZ6M0F+Ihu9Ll
	Ne6m0fOBJGQIhGYwoT0zVWGy3ZHuiuUOX4jbuklROinyUgaXfWj72qKPNEIBqq3+YMYFHfLXoV7kY
	fb4g0xcLz79p6dLM6b3PJyd9y/YmSBsejnRID/l2e72PDajZnCiJHwUpxJJSrqTfDz+yITMk6TEcB
	FHDxQ9rysE0HhLRDuCGlBkdnAGPer37YYVmi6Y6Af1nHrRiYsTcxT77XwwSZB1ohxb3k3zDQLzSuo
	nrHByzJbUOgYHZ8c6RdUVkFsOryA2hKSwZkrxgcce7fFnJuEuWcry48o856WWutULS4RZ/XxfWRih
	UR2Oii2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyiBe-002qRl-Rt; Fri, 25 Nov 2022 23:32:50 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyiBb-002qQ9-Eu
	for linux-mediatek@lists.infradead.org; Fri, 25 Nov 2022 23:32:49 +0000
Received: by mail-ed1-x52f.google.com with SMTP id e13so8175718edj.7
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Nov 2022 15:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4NT0UyLFq74utORBOv4WInxsxyZMPY8J7uSXPHg5TpA=;
        b=BW6K4u2C+woJDSiuJAEih/ZnYA0F9FxR6us1Bde8zIK4mcIkcYMMCJwbyUWkXu1h6r
         pzcFc+fO6MESNK3xN9+ooAvVEEJLUNaWC6ccu35ftWDhQ+N/JEjs87zR178srgsfULL9
         UF6Y8mXXg7QupirMwWMUkEm/9Dmif1V4FH+60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NT0UyLFq74utORBOv4WInxsxyZMPY8J7uSXPHg5TpA=;
        b=grApu6nDsNJBeaEnHpNziu/7f9wY5Gy+rCh1N/LlTtlyz6vAXR/nevKoN5/N84+17K
         JkSeaOHISC88SU86ycGrjsqzxHArZmvVKWpcwSXM7Z24UPa0Y3eZI4c8VXuDjl+G9uwU
         dm923Lsg4LbaS8gruHFQd9bi9XfjMHFkzd1pCSV3FHybRsO5kpBaWQjCeV2tZkMALEzG
         97WRnmrWeOk7nCX6CI1kiTsRzaeuG5nSdihhIq0rMGWYCHq8dNgODIotN5wS87WpQHJt
         ObMLBGqRq7aVIEsGYpNFVk+h2TWGT3zLW9NpUGkiIFPmEE2jgEIv++eUJuKQYLFyNfy4
         Cc/w==
X-Gm-Message-State: ANoB5pm6ylP3t0p/Fnw6ULYTIqbUhoQf4J6NlBDBbYkcc0HLEoyybWvq
	4Khnx17Chg6Wt7q+mwbnHKkTBg==
X-Google-Smtp-Source: AA0mqf5aNjXsBsD6xe6UJddqUzfL16Tyg8A80VdfhLrJdfeM3jFl65zhd5cZyI803E0nQX/s+ODdqQ==
X-Received: by 2002:a05:6402:e9c:b0:458:d064:a8c2 with SMTP id h28-20020a0564020e9c00b00458d064a8c2mr37748277eda.346.1669419165220;
        Fri, 25 Nov 2022 15:32:45 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a4-20020aa7d744000000b004615f7495e0sm2325076eds.8.2022.11.25.15.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 15:32:44 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 26 Nov 2022 00:32:22 +0100
Subject: [PATCH v2] mailbox: mtk-cmdq: Do not request irq until we are ready
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221125-mtk-mailbox-v2-0-886f70c7173c@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=1961; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=QjxAB+2ksa7uNlJhD3r206IvwLS8xrHsNDF+xigH57s=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjgVCLcbL6+FYpmnVdQr6P3EW3wpQ5JbUz/SYX3vu5
 oY2BcJ6JAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4FQiwAKCRDRN9E+zzrEiGx7D/
 4unhnIlngokFsgCtXIVGn9UwrructwwSqM3dW4jQBnylKPqVJBca+a8ifBW4QvCFH2SCFxLJEynWrN
 4KtM6nYyBvJnucIh6FC4je5ktr11CplKMAxcBPEe6ICJffvI4Lmn7eiobgKrC2V8mBqm1KMhPHTBvI
 XRxf1SjycDxThmDNqZnBEBBbpKSMKnnNYet/PTydUs/vrpU84H+MplwHGKiqp/BX8GEU66oYrUZCeK
 T2BX4vf+3BySMNlY8McuJGyqG+ttCsVzc/Kku6QkxicxfouNV7AvaBo2ojfnR7v5F7+7AWm1ToaCLr
 7gQgFT+yedAUHdoXmb+1dv59ZqAIuNW2tPcMM9/hhnlqDrcjskHRKGf/4Rg1TAwXaqXctMK7u8R4EY
 MEGFHMXAM116HamLBnLWOllsw/o31HMbxK5RBxtBHP61yJHdPKp74++DX6+oAKirP+EgSlqsWHv5ti
 PUg3rxPrngU/05UDKD6g3Z4piSUEgMo+Aks7CFnU9/5OZ4gcw6EiSTep8cdxR4SqjhmWEK7dRb0oKG
 OYoQX+yoX/03xtE8/GCy7uXJXQ1o4hT2UryOcBjQTfqInB3ypoJCBQ2tvWo9h0dGsSKgRds4Ihds7d
 YlO78muMw5YUW/EaMOwDE/dc5depwtst6yA0lnjtdAHP0WWufniasBGi1Emw==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_153247_568717_04BF96BB 
X-CRM114-Status: GOOD (  14.44  )
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

If the system comes from kexec() the peripheral might trigger an IRQ
befoe we are ready for it. Triggering a crash due to an access to
invalid memory.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
To: Jassi Brar <jassisinghbrar@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
Changes in v2:
- I have managed to repro a different panic. Moving the irq enabling to the very end of probe.
- Link to v1: https://lore.kernel.org/r/20221125-mtk-mailbox-v1-0-2e3ee120850c@chromium.org
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 9465f9081515..9ff4f89a55c0 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -545,12 +545,6 @@ static int cmdq_probe(struct platform_device *pdev)
 	cmdq->control_by_sw = plat_data->control_by_sw;
 	cmdq->gce_num = plat_data->gce_num;
 	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
-	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
-			       "mtk_cmdq", cmdq);
-	if (err < 0) {
-		dev_err(dev, "failed to register ISR (%d)\n", err);
-		return err;
-	}
 
 	dev_dbg(dev, "cmdq device: addr:0x%p, va:0x%p, irq:%d\n",
 		dev, cmdq->base, cmdq->irq);
@@ -617,6 +611,13 @@ static int cmdq_probe(struct platform_device *pdev)
 
 	cmdq_init(cmdq);
 
+	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
+			       "mtk_cmdq", cmdq);
+	if (err < 0) {
+		dev_err(dev, "failed to register ISR (%d)\n", err);
+		return err;
+	}
+
 	return 0;
 }
 

---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221125-mtk-mailbox-ba6cbd1d91b6

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

