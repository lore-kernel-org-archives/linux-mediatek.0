Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1B8C433E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:50:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9F1022E01
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9F1022E01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NHkTi8TLCQ5Bud5Ntiusm1lqGaH5XQrdqZB4eykbafA=; b=FnjLjIrFYC8K+SxAoQEvSRs7P
	KdSdMEWZEWWCfqPmzVK4MyHrO9odfit60jHg8iLzSEyxR6GBPeISMAfW4150Uc5yNVcURrfbbYuaF
	tSJAH5xE6ARcKSVg+u/XuRaWidXt7SarpDscgt1yYS3Fu43BzbUZ63zJQVjvTaCp0D0uU9s/m8C/2
	CJDoV1PdG8TCkShbcMGkWFQSg/Ooki7WXRy3PcbvyihlAUwObloGMJVSE0fi825OaAnkTZI2UHrYZ
	Rjq6LZqqSHMpgvXicbwxKzOY4gYp7TtBqCrdFHgTQQxDP8Td5knv+eki6HA0UIukO0m+b1I/nkgnM
	bWiFt8k9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz8ov-0004Pk-P6; Tue, 12 Jan 2021 01:50:05 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz8op-0004Ln-Tx; Tue, 12 Jan 2021 01:50:01 +0000
Received: by mail-pl1-x62d.google.com with SMTP id 4so525379plk.5;
 Mon, 11 Jan 2021 17:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FGU6XdrM5ip9qPogsEZz38Pcqw7Ofqtd00r2eJGcshk=;
 b=JFWnMBvoV4KONNmA25ZyYVeBE8Iql7jwtsebx7WlKY/L52r+xcAbQUYfKrSVGw/UcH
 J2Dy1n3d+DscVP9xAjjnr2z2ghmH7UyaR7mhOeiceOKCOGAtIRBrUGTTeXP6BXxFttiQ
 yd0ru1wndG8+viHMvqV1xnoROYJDtjlQ8JkbmC+G7YSjpSt50SfrP2wDFDUpnBwY9srh
 jLj0GdAmiUdpZVeeSaFLXSE3UcvP7OeEQ3nDifZEgoANLTjyGMU/EPuBPBaqYi9PxsX/
 TnA5jfD+SI7DYnTmyLcYahkZ+X1U46IrgdHd5R0fGgYLf4LktMZAO4UjEPuYc+HPISwE
 Smqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FGU6XdrM5ip9qPogsEZz38Pcqw7Ofqtd00r2eJGcshk=;
 b=L/K+A9PTC7+ikKM025Xqg0D/nFymXoO46rybBHcFZoEbNILobkA7hTs4kg3vKN24jI
 plJU+tIGS35/mQXTS/BBE1g6AlVImpKEF21pzXnBv3Uc8XeNRPL1V2RflFQtKqglDm9d
 c0tk5exEbTyzJLUyoCovYcATMT8XzdtuTaXvjMIprykxxZ1qCjKK4wMMPqblM19FreOU
 j7QiiKcwm1L39xNg3z0ewe59233FwzVknOLNeSLHVMIbU2lJEJoIHuPqc3SSCxrDPz3s
 ATImHJSEoN2vwEivk9gQTv1vJ2FMtFFdQtlCG9SleFdLqmptHMsZQ1XjEfMoe8NX3k1m
 NaCg==
X-Gm-Message-State: AOAM531o5nNVrvHYhlBsEJpmeoIargpnP2kmtlej1Td/uUQAf0Bw0+lt
 GfnrTx65DcJbQRIF2lAGuBs=
X-Google-Smtp-Source: ABdhPJy0bdZeanBUbbWmlcTHHQbnEwK/exVUHRnRT0ardhrmFXFDgfk2NrcxH8xys4HCMVe9G6Encg==
X-Received: by 2002:a17:90b:3596:: with SMTP id
 mm22mr1797272pjb.235.1610416197940; 
 Mon, 11 Jan 2021 17:49:57 -0800 (PST)
Received: from localhost.localdomain ([49.207.194.207])
 by smtp.gmail.com with ESMTPSA id 14sm904376pfy.55.2021.01.11.17.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 17:49:57 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v3 18/19] crypto: talitos: convert tasklets to use new
 tasklet_setup() API
Date: Tue, 12 Jan 2021 07:16:49 +0530
Message-Id: <20210112014650.10887-19-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112014650.10887-1-allen.lkml@gmail.com>
References: <20210112014650.10887-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_205000_206066_71CC02DA 
X-CRM114-Status: GOOD (  14.85  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: giovanni.cabiddu@intel.com, alexandre.belloni@bootlin.com,
 aymen.sghaier@nxp.com, heiko@sntech.de, qat-linux@intel.com,
 jamie@jamieiles.com, jesper.nilsson@axis.com,
 linux-samsung-soc@vger.kernel.org, horia.geanta@nxp.com,
 k.konieczny@samsung.com, schalla@marvell.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, ludovic.desroches@microchip.com,
 thomas.lendacky@amd.com, arno@natisbad.org, vz@mleia.com, gilad@benyossef.com,
 gcherian@marvell.com, linux-mediatek@lists.infradead.org,
 lars.persson@axis.com, matthias.bgg@gmail.com,
 Allen Pais <apais@linux.microsoft.com>, john.allen@amd.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 linux-crypto@vger.kernel.org, Romain Perier <romain.perier@gmail.com>,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Allen Pais <apais@linux.microsoft.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <apais@linux.microsoft.com>
---
 drivers/crypto/talitos.c | 42 ++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
index 4fd85f31630a..be4f7dd810fd 100644
--- a/drivers/crypto/talitos.c
+++ b/drivers/crypto/talitos.c
@@ -403,10 +403,11 @@ static void flush_channel(struct device *dev, int ch, int error, int reset_ch)
  * process completed requests for channels that have done status
  */
 #define DEF_TALITOS1_DONE(name, ch_done_mask)				\
-static void talitos1_done_##name(unsigned long data)			\
+static void talitos1_done_##name(struct tasklet_struct *t)		\
 {									\
-	struct device *dev = (struct device *)data;			\
-	struct talitos_private *priv = dev_get_drvdata(dev);		\
+	struct talitos_private *priv = from_tasklet(priv, t,		\
+		done_task[0]);						\
+	struct device *dev = priv->dev;					\
 	unsigned long flags;						\
 									\
 	if (ch_done_mask & 0x10000000)					\
@@ -429,11 +430,12 @@ static void talitos1_done_##name(unsigned long data)			\
 DEF_TALITOS1_DONE(4ch, TALITOS1_ISR_4CHDONE)
 DEF_TALITOS1_DONE(ch0, TALITOS1_ISR_CH_0_DONE)
 
-#define DEF_TALITOS2_DONE(name, ch_done_mask)				\
-static void talitos2_done_##name(unsigned long data)			\
+#define DEF_TALITOS2_DONE(name, ch_done_mask, tasklet_idx)		\
+static void talitos2_done_##name(struct tasklet_struct *t)		\
 {									\
-	struct device *dev = (struct device *)data;			\
-	struct talitos_private *priv = dev_get_drvdata(dev);		\
+	struct talitos_private *priv = from_tasklet(priv, t,		\
+		done_task[tasklet_idx]);				\
+	struct device *dev = priv->dev;					\
 	unsigned long flags;						\
 									\
 	if (ch_done_mask & 1)						\
@@ -453,10 +455,10 @@ static void talitos2_done_##name(unsigned long data)			\
 	spin_unlock_irqrestore(&priv->reg_lock, flags);			\
 }
 
-DEF_TALITOS2_DONE(4ch, TALITOS2_ISR_4CHDONE)
-DEF_TALITOS2_DONE(ch0, TALITOS2_ISR_CH_0_DONE)
-DEF_TALITOS2_DONE(ch0_2, TALITOS2_ISR_CH_0_2_DONE)
-DEF_TALITOS2_DONE(ch1_3, TALITOS2_ISR_CH_1_3_DONE)
+DEF_TALITOS2_DONE(4ch, TALITOS2_ISR_4CHDONE, 0)
+DEF_TALITOS2_DONE(ch0, TALITOS2_ISR_CH_0_DONE, 0)
+DEF_TALITOS2_DONE(ch0_2, TALITOS2_ISR_CH_0_2_DONE, 0)
+DEF_TALITOS2_DONE(ch1_3, TALITOS2_ISR_CH_1_3_DONE, 1)
 
 /*
  * locate current (offending) descriptor
@@ -3386,23 +3388,17 @@ static int talitos_probe(struct platform_device *ofdev)
 
 	if (has_ftr_sec1(priv)) {
 		if (priv->num_channels == 1)
-			tasklet_init(&priv->done_task[0], talitos1_done_ch0,
-				     (unsigned long)dev);
+			tasklet_setup(&priv->done_task[0], talitos1_done_ch0);
 		else
-			tasklet_init(&priv->done_task[0], talitos1_done_4ch,
-				     (unsigned long)dev);
+			tasklet_setup(&priv->done_task[0], talitos1_done_4ch);
 	} else {
 		if (priv->irq[1]) {
-			tasklet_init(&priv->done_task[0], talitos2_done_ch0_2,
-				     (unsigned long)dev);
-			tasklet_init(&priv->done_task[1], talitos2_done_ch1_3,
-				     (unsigned long)dev);
+			tasklet_setup(&priv->done_task[0], talitos2_done_ch0_2);
+			tasklet_setup(&priv->done_task[1], talitos2_done_ch1_3);
 		} else if (priv->num_channels == 1) {
-			tasklet_init(&priv->done_task[0], talitos2_done_ch0,
-				     (unsigned long)dev);
+			tasklet_setup(&priv->done_task[0], talitos2_done_ch0);
 		} else {
-			tasklet_init(&priv->done_task[0], talitos2_done_4ch,
-				     (unsigned long)dev);
+			tasklet_setup(&priv->done_task[0], talitos2_done_4ch);
 		}
 	}
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
