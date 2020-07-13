Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DEDC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 13:31:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB54A20773
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 13:31:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l2QEaHtx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vYg1QXkr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB54A20773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OVbJ+JsqiVZ/aQduZM9sIbByEkSQTy+0rnmRwhGJXNs=; b=l2QEaHtxzEqfdqUjHJq+ZRuO9
	KXcDE42rKwi8t95dl0IEM2l0Jnd9fPbtp4owFWaqfPkyh6uq2V3ohMoBpyJd6Bu8x0edWAYRGXanv
	S+SSNvVeyW0q+nIgtEeWSy8KjfVZNiitKzOIq2bM9UbnY3GZoCDG8ubKMUPZXnlD27jy1vXHP87ZN
	8ZY85XhfBGwWAnw1ff6FY6s+aEnm5a6Bsd+tVkDxZMwmjoVxGvzMHi1Jr4hLEhDFGnopwwD3tPLZz
	N9Dzp4veimn84DK1GEStqaIimUa7dmoUsC7X+Kp0Eg+cC7YH3fzpElnX7QJrIgZ+RifkyvgXs2Rkf
	2wtPSapdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juyXj-0000VQ-CZ; Mon, 13 Jul 2020 13:30:51 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juyWg-0008Mk-O6
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 13:29:54 +0000
Received: by mail-wm1-x343.google.com with SMTP id g75so13305016wme.5
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2020 06:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QLryLftXHujJqlJtPMVgQIevZpScR7URaSYQFGMf70Q=;
 b=vYg1QXkrPB4tKtY/J12E9irR+rl+St7VpoMQvDD3sdENXMl7hNUJoPpt8dxHHq4WCv
 CPijOiC7QDFUo0WPLzm60ANpKUHRHimoQHRyGV2FnQkxistFnE06weWgWLjXG8XGGMHj
 dG1ZX6gvm6vEw/AvTlp9uA8XCGaTY/njfpK4Kbk2wSNX3f265/o4CZU6jDHdlR3C44BI
 6zBENnKs7WkMIOMrj2G1f+c5wSXtSsS9WMRMvLthCkuEK/OIn3Eurh3UR2a1v+1JRBdL
 v7klvlMmYrodM7wovd181BU/5/LoemsCXV6INeUtFdZReHYpsjXRdysQa3qJZr5XGP4q
 gXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QLryLftXHujJqlJtPMVgQIevZpScR7URaSYQFGMf70Q=;
 b=t8Zbakr5j6YMHyALsdBK5TmYH9j25/DPoKvvEnhZZfFKofYS5bdDOabkr6k1teCJSV
 qZStjp6PIHo1C1yOBpW/YS1ZdGI0+tH+ZhtnLfUxe/mbEn237bNPMA3esiVM28R4y/P1
 kcYV9oA0CrNC1cLUV4Upmj11Fv5cdJgA2rMAUF3uj39/AQmsCzMnZ2+1yJblF1kmCcM8
 NM2pJm32BQGtHUWTGPFVCgY4ViJgGXGVq2PJmgtX37h8alf9qjc/VYmEx7iH4CD2UMDP
 H1+cwg/QVqtVF7fw7U+GgYB9r4oahD/XuoT/GLtkVdznCq3zzB6Twp4Oz42DsWHsefEe
 krgA==
X-Gm-Message-State: AOAM532VJgN85tdI9BtP9kV7ZvSmMuQ0lgiYrH//ixtPN1q02gZgmGZn
 TTMLFTPuOZ7ueRFMHtquew/qpQ==
X-Google-Smtp-Source: ABdhPJxtI2aU9Tn4XMAVUn0tMxGni2Keg7oC3cwRrzpDovC4u7fv3y7dpujSmm3QsvKjFxQHR93NsQ==
X-Received: by 2002:a1c:48c5:: with SMTP id v188mr25055wma.58.1594646985632;
 Mon, 13 Jul 2020 06:29:45 -0700 (PDT)
Received: from linux.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j14sm23896642wrs.75.2020.07.13.06.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:29:45 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH 5/6] remoteproc: mtk_apu: Don't try to use the APU local RAM
Date: Mon, 13 Jul 2020 15:29:26 +0200
Message-Id: <20200713132927.24925-6-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200713132927.24925-1-abailon@baylibre.com>
References: <20200713132927.24925-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_092946_895891_AFEA2EE2 
X-CRM114-Status: GOOD (  14.07  )
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
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Bailon <abailon@baylibre.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Currently, this local RAM is not accessible from the CPU.
If the CPU tries to access it, then the CPU will hang.

Remoteproc may try to use it when it load a firmware
that has some sections in the local RAM.
This workarounds the issue by skiping this section.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 drivers/remoteproc/mtk_apu_rproc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/remoteproc/mtk_apu_rproc.c b/drivers/remoteproc/mtk_apu_rproc.c
index 565b3adca5de..e16d3258a785 100644
--- a/drivers/remoteproc/mtk_apu_rproc.c
+++ b/drivers/remoteproc/mtk_apu_rproc.c
@@ -57,6 +57,9 @@
 #define CORE_DEFAULT2_SPIDEN			BIT(0)
 #define CORE_XTENSA_ALTRESETVEC			(0x000001F8)
 
+#define DRAM0_START				(0x7ff00000)
+#define IRAM0_END				(0x7ff80000)
+
 struct mtk_vpu_rproc {
 	struct device *dev;
 	struct rproc *rproc;
@@ -139,6 +142,7 @@ static void mtk_vpu_rproc_kick(struct rproc *rproc, int vqid)
 
 int mtk_vpu_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
 {
+	struct mtk_vpu_rproc *vpu_rproc = rproc->priv;
 	const u8 *elf_data = fw->data;
 	struct elf32_hdr *ehdr;
 	struct elf32_phdr *phdr;
@@ -156,6 +160,16 @@ int mtk_vpu_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
 		/* Remove empty PT_LOAD section */
 		if (phdr->p_type == PT_LOAD && !phdr->p_paddr)
 			phdr->p_type = PT_NULL;
+		/*
+		 * Workaround: Currently, the CPU can't access to the APU
+		 * local RAM. This removes the local RAM section from the
+		 * firmware. Please note that may cause some issues.
+		 */
+		if (phdr->p_paddr >= DRAM0_START && phdr->p_paddr < IRAM0_END) {
+			dev_warn_once(vpu_rproc->dev,
+				      "Skipping the APU local RAM section\n");
+			phdr->p_type = PT_NULL;
+		}
 	}
 
 	return 0;
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
