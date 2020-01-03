Return-Path: <SRS0=lxIO=2Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD37C2D0C2
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 14:25:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84D5B206DA
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 14:25:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sdI1jJtn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GDM9D4o4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84D5B206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vpUtNa9mFaA8XT17Rw0gb5OxuMVrSnQT2k/502FrZLM=; b=sdI1jJtn1XwnvG
	ugGX8XAo16dn/XnO2C9s7NmLGgfzzcennCsD+QkuG92l50JbnvwAoV6726DBVyzEBAtsUEDOfUXeD
	8Mw7TNJiS/7YCG/qMiPD+iaYdVV/pnQ3njVy+2JaEb+5gZ2QoRxttUqYxZe+syFvVWfmKHTqPZMzK
	vNGAHW4N/Yhxcr0KQsgrYsUpmHmLWRRKdYVjWmvEunmO2+flgOWE8dfAO/hfe7+8i/gm8MukdqoQF
	5WI9K4p3OMxzWHlUBkm7I6IBELQ2oOTJd/AT0ipAvdVN7DBMbEs0E+MfFDLuW5QBj0sFQf/4ZBDlZ
	JjeyiOAuLUzJyEGNYA1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inNso-0005kk-Tq; Fri, 03 Jan 2020 14:24:58 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inNsj-0005fd-9z
 for linux-mediatek@lists.infradead.org; Fri, 03 Jan 2020 14:24:54 +0000
Received: by mail-wr1-x442.google.com with SMTP id q10so3640336wrm.11
 for <linux-mediatek@lists.infradead.org>; Fri, 03 Jan 2020 06:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bYev97gpHrXWD4cTObTlC4p8ry7Fm20e+8qBStccKgE=;
 b=GDM9D4o4PbDunO0UiTZRzvlOWD8xXQPVcNj72ji4rteRTGok3nKJKbt3APJknXNL2m
 kItNJhDkEISEfBHdY++LrlV+Q35N48uncWIJojH3E0jHflyPkNZwZBa8UUvoeyb8had3
 CVvJ9VVo0rDFV51OEgw17ggM6MKd82yo3/yppUIc3aV8VHVUujl+KjjKV15sSrLxfI4X
 sWB9RZreKdK5kHVPM85DzyMnZY/8nfykKq5IMwt3S938Me1qYgq5GGqCcKB5cPxPI4ch
 KNmKBpQkFBysoJAs4Gwf/Q/wUFpXJEvOSmnMpJH56DpZoKXfEFipPrVWvrIxscH2/e20
 LPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bYev97gpHrXWD4cTObTlC4p8ry7Fm20e+8qBStccKgE=;
 b=Kjto7Ckarfbtg1sQEo3nCjqsL8C/5Ij8hWnmeK6Yq0VwDgMc8jMIsbHMc29C3EhcIN
 BUo/gd38YozLDpLCvquBfThBYpBO5g9dKy5lgz+I3rASxTbK+fRLEfmU+JF3MAEROAqW
 01SuSxKoIROUfSd93g+B8aQ6DsxSrFT/EZWn0JgIWSSLHnVqoIwC5PqIDD2aB8qYb2yj
 eCmio+lO0+NEGjgjx/CyY3AtbcKznH97dBSbGDNyN0nkKDpYnUC0wgsu7J030C4fbYlY
 5mWUEyoywl9kK12NVPzB8n2Ak8biO7JF1fYtadQDPTZGnrLp5djrBImk97/8hS85YyLd
 S8vw==
X-Gm-Message-State: APjAAAVcx5z6jy4GonDpU9muPWIaMi398hg6KWLlI15rSjXjc0wzKcXP
 BZs3u9RZM3ZQC79gaFCuXODr/w==
X-Google-Smtp-Source: APXvYqxL3jhMkdKPNrLu2LvJpgrGgBdIz4w8yC2ATLMVXINdK6pccS5GSmwMvcuQFyuqoCukv5pzAw==
X-Received: by 2002:adf:fe43:: with SMTP id m3mr91343474wrs.213.1578061488663; 
 Fri, 03 Jan 2020 06:24:48 -0800 (PST)
Received: from radium.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x132sm10311612wmg.0.2020.01.03.06.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 06:24:47 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: fix indentation
Date: Fri,  3 Jan 2020 15:24:45 +0100
Message-Id: <20200103142445.55036-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.25.0.rc0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200103_062453_349538_080D76F1 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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
Cc: p.zabel@pengutronix.de, Fabien Parent <fparent@baylibre.com>,
 airlied@linux.ie, matthias.bgg@gmail.com, daniel@ffwll.ch, ck.hu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix indentation in the Makefile by replacing spaces with tabs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 8067a4be8311..b2b523913164 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -21,7 +21,7 @@ obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 mediatek-drm-hdmi-objs := mtk_cec.o \
 			  mtk_hdmi.o \
 			  mtk_hdmi_ddc.o \
-                          mtk_mt2701_hdmi_phy.o \
+			  mtk_mt2701_hdmi_phy.o \
 			  mtk_mt8173_hdmi_phy.o \
 			  mtk_hdmi_phy.o
 
-- 
2.25.0.rc0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
