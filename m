Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B515C48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 10:56:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED7B2613DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 10:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED7B2613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZf0nHb052wxJIU84iw3vVqZmTaz+QGJGeLhiGb5rNA=; b=t0nE/RyNYuYRmt
	N23KVIjdc9wJA/TZeS9wk1P6inr2K98BI2tTw5yakSvn4M5A/q5DjoTMoYKRNTazuFbn5kX+YxCZy
	RcfGGyDBkao2FZrMI7xxMYS4Q4FYUCR81lBGXRn4fDXVp8NJ7jWIx6UD9vTHRYBbShldueOkcl2+w
	4hvRPjmt7sbrFJBaWWWbOx/7LMju5Pzn+ANtB9/hmFtMVWBEHj7bWljT/A3IGmADjCQl81Fq9IlNZ
	Bbt9CCOaUsF0AhmtQVAORLivewbLPCstfnoUBAFfSQweyIFz1QAnnBr6bvaBrMeV+XDfkQVBhzx70
	EcmtIv0wNvnD57+dzCbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwN1n-00EGKb-1C; Thu, 24 Jun 2021 10:56:11 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwN1A-00EG5w-Sv
 for linux-mediatek@lists.infradead.org; Thu, 24 Jun 2021 10:55:34 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 s17-20020a17090a8811b029016e89654f93so5665174pjn.1
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Jun 2021 03:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hriaztl5QKv2WOAvCmMVPEwAJVtjiW9iYPTLBEXStgo=;
 b=PDsAEsv+dfSRLQusPsoLYF8w7G6GnvRlHkrr1kzzx6as4Dh+x0U/zsW8d+GhiKFdsg
 FA2BBqPC5dprZVkpB5t5nsTliD/J2q5h8naaAS4RkKkgY5ukGDiE+mHZ/fjywOYmt7sp
 ZrJF+LxGucZtg7eBi8oNwcPwnRMsbOh9cKajE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hriaztl5QKv2WOAvCmMVPEwAJVtjiW9iYPTLBEXStgo=;
 b=d930szTbv7Vr/gB0SUlCf7D88l+l3YBElLymLlSCQnV0nzzVFekA+/AHVhOoKKM1qf
 PZ0ePVupwRd3W3Aj3y2RW/yxE4XujkbMvKd/enWUbZNuNuuQKtqRII65xQsUEh2knNsI
 UanHzOM6g2DOLjlBE2CB4OLpHNZ9KAIfGc5zCuUxoasdCrPZGVtJcB8e8DBSbKsndWMT
 T8jBGzmgQ3EFiMzPem1W9cslijefroM0nofkiFLqqlJtOGpTkrJ0/BLpDq5e6HsS6hyn
 6zQ3a4FC63/e9AAO+PIBY7r2J8M/fyu4f9h3CEiOwU41DUbEWe6oO78GRAGKdQpy450n
 9uIw==
X-Gm-Message-State: AOAM531J7237NycGZ8MUSAHGS78TMM3RWnEcqxPxtxgshOrm1swEH8OH
 XklMT5C8gn0XxT37pxg/spUHlA==
X-Google-Smtp-Source: ABdhPJwIDZVYWX3JX8E878WehoIk0M5IUEfQqdozGEiAiaCvO86PR75GYv750m47mk4o7duo8cErKQ==
X-Received: by 2002:a17:90a:9a83:: with SMTP id
 e3mr15001900pjp.139.1624532130023; 
 Thu, 24 Jun 2021 03:55:30 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:368f:686c:969:1f38])
 by smtp.gmail.com with ESMTPSA id t7sm2212536pgh.52.2021.06.24.03.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 03:55:29 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org
Cc: Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v6 RESEND 3/3] arm64: dts: mt8183: Add panel rotation
Date: Thu, 24 Jun 2021 18:55:17 +0800
Message-Id: <20210624105517.3886963-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210624105517.3886963-1-hsinyi@chromium.org>
References: <20210624105517.3886963-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_035532_990118_86A544F9 
X-CRM114-Status: UNSURE (   9.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

krane, kakadu, and kodama boards have a default panel rotation.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ff56bcfa33703..793cc95013379 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -263,6 +263,7 @@ panel: panel@0 {
 		avee-supply = <&ppvarp_lcd>;
 		pp1800-supply = <&pp1800_lcd>;
 		backlight = <&backlight_lcd0>;
+		rotation = <270>;
 		port {
 			panel_in: endpoint {
 				remote-endpoint = <&dsi_out>;
-- 
2.32.0.288.g62a8d224e6-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
