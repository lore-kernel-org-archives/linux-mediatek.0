Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B404C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 16:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/q0MZJ4+Hs8nfmckUaUTRdDZ/RrFoFIfZn+oOmPN1Ss=; b=Rbu3Q1bYG7nEl2XdQGGBJgbeyO
	t2g2K6gqY7vy+6XmZGgweWZKnkq/tK2gVt42KSqLVqOjtZ9/zPr59h6Jw4nWHI3eqnXFnEih2zMpc
	r34wVhEh4QkNIAGmlVN6bUJXb5UkPHuRim0yu36i9nVLUlt+nWVPfAtvzfMoM+qoBpV626tLronwE
	T+gUFTezYdlm8gs4eKBDWXjm4dLU0Rq3P85RgqjENmYXKTdUQPuM8AoTDJ+UmybsTkkmnT01w0odU
	OdvtY73Q7mQR964yH+mV8iwF8CPllcba6+eG8Ad867OSMydZycvVoL58yOilcds38rOo4Y3gY4obI
	kwzGonbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oybQh-000FdK-Hc; Fri, 25 Nov 2022 16:19:55 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oybQS-000FV7-8e
	for linux-mediatek@lists.infradead.org; Fri, 25 Nov 2022 16:19:41 +0000
Received: by mail-ej1-x634.google.com with SMTP id n21so11348476ejb.9
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Nov 2022 08:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/q0MZJ4+Hs8nfmckUaUTRdDZ/RrFoFIfZn+oOmPN1Ss=;
        b=TB53FpzTOBfmO4vPF12EQmXaT/7IR6+8sN47+tv5R8ZcQQ7ovtmDfOtW4Ee3HdOai4
         PKjIMXjVcD0Uc7lGywK+HTf3dKFUFTRub+HpQqwPL7HPoqO1K1w12K54Et229XlF7xhZ
         FZ4XpJCANyN5GerP5vAIo+SUmvXsWpizk3UbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/q0MZJ4+Hs8nfmckUaUTRdDZ/RrFoFIfZn+oOmPN1Ss=;
        b=ah0VRNVPZj7GFVe1W98ho2+N8/VNU/hHZifLMgOrsm5Ov3SCyjUROCPG9p2pNM6GpV
         8jRFV+dbmWfEcYT/99Hd3brNCFm8Yc6zP2qr9zUm3k96rqtebak1exHEtGJQy0hwq9Dw
         W7Nz7CHsOVdwNDIRZ7rYe6u6zGA6A1ad5Wf65x9YD5j/v5clDVA2AWqJtFnGA4uTJgmq
         xM/TAVJm6cBWoWoewjVdt5J8v93p/Hz1tWhIzDJgsa6MZPTofilI1ctt4uVj6y05n4X4
         CuaJZhd9ap+z5mw5dt5f1bp3CtKy5o21q2+ljU+uqd3U3WrnuynHYuNWJe9D53bpBYz6
         4rYQ==
X-Gm-Message-State: ANoB5pmtKeR9Bx6Yssk1qLFOjv5nXSJS8Bp+uZXzmY1Hw0GTbK9bklly
	XPCTj34KuXEhEp4E986q85WOAw==
X-Google-Smtp-Source: AA0mqf5rOSJA/XyRv3Hn1/RoEiM2SyXqzkQZs9e86B5m1uyn3rnriQmXLqpwQWtb37c3UPdZyL6RgA==
X-Received: by 2002:a17:906:16d4:b0:7b9:f0fd:47b1 with SMTP id t20-20020a17090616d400b007b9f0fd47b1mr11421279ejd.462.1669393176582;
        Fri, 25 Nov 2022 08:19:36 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id x22-20020a1709064bd600b0078d3f96d293sm1738626ejv.30.2022.11.25.08.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 08:19:36 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 25 Nov 2022 17:19:12 +0100
Subject: [PATCH] mailbox: mtk-cmdq: Do not request irq until we are ready
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221125-mtk-mailbox-v1-0-2e3ee120850c@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=1830; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=Pfgq3cetcD6H5umRF+mnqFYIMTf/wVZSYUZ+95IEVPY=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjgOsKXc9/JqrrNMUJ0FRpX5f3QsGved06zFHgG3TD
 LYdQ90GJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4DrCgAKCRDRN9E+zzrEiIN9D/
 9SGMhOXA7mTz8AZoRLAKZgDbDGIZFvOzu4JcxE5VDEplnxrX4mBGldhAOI00bICFWwL8QFbiukTzK3
 F4kdOnHKOVho+hK22h6R557i9RFbbYuVfjQseRgxjnK0CbaPuGbodXy5YrifRltRG20IrHwGV9wyVi
 fC30dRLYIJXaGzAxXL7v7XdLP6iLhlj79Qxm/c76+nqoPCcbZbVYtQ+mGW2fedSqXsPqxpYz/jMINN
 +OkaagQ1jJDoinN3DMD9/+UszW4Ussg+AETObowjBQZUJyB0zGAVt2ZAA7g/GQpuArdhgQPlLGTHWq
 UVVZEl7FrQxjqR1osa2IhWGfzC4p0To+j2rfXFVmELPsgXF1w3scFMdXKYVGx+B6N181J82b0qAenx
 qX4dTgBrQsmKc36tC9qwJd7jRjdIdY5KAZVYTu9Ku9YyhkNfsdD7SLV5qvy5tou1UftfZisDvZkszF
 +TMEvP8n53e66FVOjP611lrZRkzxp0mPHsXQMWpMf+h4lBNdsipyRR1ycerzyua0Ckjx82mVG534Pg
 LIwGFaCdNkcNx7g8SFRea86hFpyrJlNpwSu5SY7wZeUozFkb2xng3BwFgjVkF4Q1gDOiRXZHo0bIHw
 Zpw49Z8CmlUBNh3RulMe5Fi71RDjNk4RPiliBgkJLAG0zLO7Bix7z7xTdH3g==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_081940_348298_84F1D3BB 
X-CRM114-Status: GOOD (  12.46  )
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
 drivers/mailbox/mtk-cmdq-mailbox.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 9465f9081515..829f1ef3309f 100644
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
@@ -613,6 +607,13 @@ static int cmdq_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, cmdq);
 
+	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
+			       "mtk_cmdq", cmdq);
+	if (err < 0) {
+		dev_err(dev, "failed to register ISR (%d)\n", err);
+		return err;
+	}
+
 	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
 
 	cmdq_init(cmdq);

---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221125-mtk-mailbox-ba6cbd1d91b6

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

