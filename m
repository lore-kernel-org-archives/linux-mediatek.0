Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D00AC433EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 13:31:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01C712072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 13:30:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IZmigkUM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="j0V0viTo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01C712072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZeuRSHvuFcSYxpWnWxXiGt27a7zUWsVM7bHQceNyZwY=; b=IZmigkUMzuBUKfr+skREFBndF
	JsJg9LYQ8Bq7k57dY68bwCoKXvKo0T8fadwALWarmBn4ArM/xmNX687lPlztfWOnWdYH9YXCsFe0c
	B0zrV+0/SA4SnlgtObWH30n98fyDkOpGLy/EZsNvMtOkwz3fUOCWA4DYSKXp9ILON+MnxCku5FiB8
	l9hK0h4IVh+EiTH9a31nFuQ7W/l1WOUafhTcqXYXJ6NWsKyVhRyEKC63BTGHdHLSYtFRpV10XUA+0
	+lAePqVbTkEnySwZIXVicyrzSyPHE9kqByCtYPyVw7kGqqKzSpyFNCdz/zjwOlsrXbR0SQg8rLA12
	ul7Epos8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juyXg-0000TF-Gm; Mon, 13 Jul 2020 13:30:48 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juyWf-0008Lo-Ck
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 13:29:52 +0000
Received: by mail-wr1-x444.google.com with SMTP id q5so16570619wru.6
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2020 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pl8osqFHzEcsdNW9tfkecnvuu2M/qEbw8a1f1sca/Bk=;
 b=j0V0viTo0JLbXENBdA8u1+UQl/wK7PVzGbNY3YKPkjM6a93X59GWthJFO0yR9ONhfF
 +drSmRuFiaHGhkaieOUng8wozlwVYqlzoqVh+ijxMllnXMQqWtoZduqq8nLLZSsheBZR
 FMrf020wFUq6/ZR6gYCTH1BnUE8yN7ePXjQUyHqBTGkctxxLUcCMfkmkcR8zA9iagnh7
 DgCE83w6nFrC2jtNTQfu/xA+iR91Xeg4jNGr6fGMBeEKGSL7aZD6iy4iy9yHxxSPk94H
 G6m+Am15ak2b7/KYTmu4i9QtIkTJzEBZ9HKtZmSVXS33an9eGFMuG1ZKEEYU7w2IKWs8
 6pqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pl8osqFHzEcsdNW9tfkecnvuu2M/qEbw8a1f1sca/Bk=;
 b=GtqR1VJD2k0q7YvrTryD08DAMsOM43bFbv5v3JYuI1P013AMT4dkqcVciPrjwu6jkm
 +272NZVQ6miXGLX3eumV4nX+pwT6+oBo3F/G8kjfao4k1Wu9EoNWrGDOFwVCO/fGUT7C
 KsafevsXb6DdscobUyzO/GBMxdiiFnziVaubt0IUYxjN1gGErXJgvAYosyR9epGaliCf
 ovMlgZ396vDTfiXExRqBCU+Uu5b6/74fL1BsO3H+/gtL4Ofctw4EGLGtUQ2o+a4HPvCw
 xWYwYYOXvFrusM5AmgQVsfSnFu1CkKNBdZlRQzfk8fRwTmwVnHtpGXf4mRut9At+8Id9
 UA4g==
X-Gm-Message-State: AOAM53136nN1bdEmcCAdc7jjIsgGDkGvd0H7IfY6kmr9XgMubbXuXJdZ
 OiYcoCSZoyXA9Aj5DyH27GQNRw==
X-Google-Smtp-Source: ABdhPJwykKAe+1hKtLIks/qZbsmfhZ3wQYs7n9CAFTDWM+nYh/VUMUiFm2oxGk4afCL5P/rY946YCQ==
X-Received: by 2002:adf:f0ce:: with SMTP id x14mr76501632wro.137.1594646984561; 
 Mon, 13 Jul 2020 06:29:44 -0700 (PDT)
Received: from linux.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j14sm23896642wrs.75.2020.07.13.06.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:29:43 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH 4/6] remoteproc: mtk_vpu_rproc: Don't try to load empty
 PT_LOAD segment
Date: Mon, 13 Jul 2020 15:29:25 +0200
Message-Id: <20200713132927.24925-5-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200713132927.24925-1-abailon@baylibre.com>
References: <20200713132927.24925-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_092945_553270_88CAB7AC 
X-CRM114-Status: GOOD (  12.92  )
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

The firmware generated by our toolchain contains many empty PT_LOAD
segments. The elf loader don't manage it and will raise an error:
"bad phdr da 0x0 mem 0x0".
To workaround it, implement the sanity_check callback to detect the
empty PT_LOAD segment and change it to PT_NULL.
In that way, the elf load won't try to load the segment.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 drivers/remoteproc/mtk_apu_rproc.c | 35 +++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/mtk_apu_rproc.c b/drivers/remoteproc/mtk_apu_rproc.c
index f2342b747a35..565b3adca5de 100644
--- a/drivers/remoteproc/mtk_apu_rproc.c
+++ b/drivers/remoteproc/mtk_apu_rproc.c
@@ -137,10 +137,39 @@ static void mtk_vpu_rproc_kick(struct rproc *rproc, int vqid)
 	vpu_write32(vpu_rproc, CORE_CTL_XTENSA_INT, 1 << vqid);
 }
 
+int mtk_vpu_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
+{
+	const u8 *elf_data = fw->data;
+	struct elf32_hdr *ehdr;
+	struct elf32_phdr *phdr;
+	int ret;
+	int i;
+
+	ret = rproc_elf_sanity_check(rproc, fw);
+	if (ret)
+		return ret;
+
+	ehdr = (struct elf32_hdr *)elf_data;
+	phdr = (struct elf32_phdr *)(elf_data + ehdr->e_phoff);
+
+	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
+		/* Remove empty PT_LOAD section */
+		if (phdr->p_type == PT_LOAD && !phdr->p_paddr)
+			phdr->p_type = PT_NULL;
+	}
+
+	return 0;
+}
+
 static const struct rproc_ops mtk_vpu_rproc_ops = {
-	.start		= mtk_vpu_rproc_start,
-	.stop		= mtk_vpu_rproc_stop,
-	.kick		= mtk_vpu_rproc_kick,
+	.start			= mtk_vpu_rproc_start,
+	.stop			= mtk_vpu_rproc_stop,
+	.kick			= mtk_vpu_rproc_kick,
+	.load			= rproc_elf_load_segments,
+	.parse_fw		= rproc_elf_load_rsc_table,
+	.find_loaded_rsc_table	= rproc_elf_find_loaded_rsc_table,
+	.sanity_check		= mtk_vpu_elf_sanity_check,
+	.get_boot_addr		= rproc_elf_get_boot_addr,
 };
 
 static irqreturn_t mtk_vpu_rproc_callback(int irq, void *data)
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
