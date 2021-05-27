Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182F7C4707F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 07:43:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFADA6139A
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 07:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFADA6139A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+TvAzax+tYwINk1YenWUun6oCmDI5tFnaa3boWVDR8I=; b=y8Fyw8FJBbS/kc
	pAwLve0RU33WvvXxAdRTz+hBy9NHlTg2CgN+oQjRgSItACd8MqXkXJXWDM/2K+IZ+ki2cvqMLsfkh
	Pmh0ohaBjXwKsvz4XBxer6TBv6A87OEjozlzoRa05koh0gtHQDEuZGYfXKkP9VLovhhh49S/w60wg
	CuMoTtIWaHPY9no/tB+opYLGhWjXBwWLwsuZBDZ1LWV/ahzXbo9rIXACEJ1tCY4pApFMChmF8uuPB
	xKN9jbTrB5ttWc8nDqVnSrQ6IoSnawSfGSMh0eNEuOMqdgpJYt+jpQtjnu49v3bxPInZ3v3Xe9HF0
	B/PMMM4sCCtMlH5ublcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmAg7-003T0N-KV; Thu, 27 May 2021 07:43:39 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmAem-003SIl-MM
 for linux-mediatek@lists.infradead.org; Thu, 27 May 2021 07:42:18 +0000
Received: by mail-pf1-x42c.google.com with SMTP id x18so2989961pfi.9
 for <linux-mediatek@lists.infradead.org>; Thu, 27 May 2021 00:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BrbVgIij7R8LbUOrOIBIv2OLNl+Ip/Kqs7kj9XlKJUk=;
 b=SQtH/jrOEE6kk88cKkvSxsBamCau/HA6LO+WkxXT2OKIUlRPbubDXoPKK/J84DK90z
 tViLy+vQKnLAJK2PRgLoPMSraWAe08TSrKhWQ84yPmrmIDgjwjiC5qveCCmsX3JtUhaM
 S3QI3SIPi49owjcScyBxFzBrkyDdvujgOkMaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BrbVgIij7R8LbUOrOIBIv2OLNl+Ip/Kqs7kj9XlKJUk=;
 b=WprnvMeSTdwTWkoy3+IPcGJZWs8DMvMLQumbYa0vmjpwlphMxmvdxunbJplBamnpn8
 lUpmh5inlkR7kEuE0O01XkY8VTeWSHl1MgexRO+8vaCXztaWEpZdPfVuUTVlf5HkI3QO
 mF3iC9fmsHv41me09QaqIesiuJ89fhW4SIwPd9UlwfF0OIwva4qWU+iuJaaGSm7Q41SN
 abQReBcODWbQdoEngJBcRVH7hmVTAQCILAtYMhGNWFSfQGQC3wUYSgJ36JWMyZ424u2U
 YBZnVJdMYM62xGEKST7qq2JvmJ2mDPPNSMlNAMOPM2J9znbEiz0lGV/tlp5BrCDNWbtf
 R7lw==
X-Gm-Message-State: AOAM5330gLrp5wmJLFMwLFqdba/PjTOT6M19kys1CEOEXP5tD3n1Vyim
 PPc+H21jYwSUoLycI8phCH2RXw==
X-Google-Smtp-Source: ABdhPJxuVP5C820VQJBG/Cqe/LBzPydpiOkSUvB5K7U8neoHStr0iUEtdqLCANJ++y7pTtplnH8sHQ==
X-Received: by 2002:a65:6849:: with SMTP id q9mr2443138pgt.377.1622101335476; 
 Thu, 27 May 2021 00:42:15 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ece5:55a4:6ad3:d20f])
 by smtp.gmail.com with ESMTPSA id h24sm1184857pfn.180.2021.05.27.00.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 00:42:15 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Robert Foss <robert.foss@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 RESEND 3/3] arm64: dts: mt8183: Add panel rotation
Date: Thu, 27 May 2021 15:42:02 +0800
Message-Id: <20210527074202.1706724-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210527074202.1706724-1-hsinyi@chromium.org>
References: <20210527074202.1706724-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_004216_785767_EB90708A 
X-CRM114-Status: GOOD (  10.05  )
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
index ff56bcfa3370..793cc9501337 100644
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
2.31.1.818.g46aad6cb9e-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
