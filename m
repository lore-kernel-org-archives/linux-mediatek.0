Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72767D41145
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jan 2026 08:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=edU6xkXjAjWZJykGFUAvi4D1HZcCJChoYmvCxl8CEyU=; b=fydIJ8/a43fIEAfSgFZTTv+Q1m
	xaaEvDXyF0OSLmLRCYPp2W3Xy6G2wMaIJhq/reQvFhDyqJ/6slTDNVX3UOLEyViW47kBkIUvMgSuj
	XK9f8T+Wbsb66Acfp2ZGtptLrYBhh4fqz9gECWCXe568zLhIItiDePKPFbeCtnOgwYAKIzJAoQjfg
	V0Mz72jPWsP64CbdL2ydOaHMFbpanS1M91aJT3puhmpF5I7v53S55aheFjbY7OWFUkhJzUE2/r9u+
	O2wwj6tmpm6wyV/RPqVAVjUW8l1jtmLUUX4QWKJLilQxaGuaVtqiBSGTESNZL7851q12VIkoUHWaP
	PIbhQE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJ2a-0000000C1EY-0BKm;
	Thu, 15 Jan 2026 08:49:16 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJ2X-0000000C1Dq-2gwl
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Jan 2026 08:49:14 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso4613475ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 00:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768466952; x=1769071752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=edU6xkXjAjWZJykGFUAvi4D1HZcCJChoYmvCxl8CEyU=;
        b=IJecGVPNhmSiWL1TqfCVtVRRdwiq4WCFhThGiTU5DE9jslWwucJvqblX2PkLiruHp3
         Mvf55+itSbasmTkDx7ec1hG43pP7AAnpnHrZ4u4YzQCyMAKjHikq9w6cs0e/+9e86XfT
         XKDPwd8n/lSxFA/o6GlUi7k/J+TB4p8ScOos72vyMB1By2htN2AXGWBtwX2/c1Yc9dR8
         sYVVoJA1a5XzyB+QkCziqjcf9CE9+9v7aI+2fPSYVTaPQLEb2FMFru5ciDbYJ1ZL2vbg
         SetCBfYlDe1LPz95cZzrPS/p7rIlp/vMhTqzFODXI0SvGals/Oh06VDxSvff6S/lHrVs
         7FAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768466952; x=1769071752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edU6xkXjAjWZJykGFUAvi4D1HZcCJChoYmvCxl8CEyU=;
        b=pQZ5PCPAmScZkpSYHclFOcIsO/6DZhDdKEx3GPxFfqypsdFPCupvBdXWpt13EByeME
         2qNlZZxT9F+MFtel2Ni5wE2BBpeqd3jpLdDeDjOw3u7SNc904BI6Ibo3vZI17V62XGFB
         YfxueAAzwMkSMkqmSnJS1uspU+nDb11bXKLEIctzlod1by669yb7XZzsHtIOy3Aq08J+
         d2JrhioaM5k0WuHE19s+s4sGa+DueLGPXcgZ4ExyovKcCCBMVFe3QZMCb7Q5tzQ/mZBN
         reE1nKr9OfiSakr3LmlSIZCMmmPs8hmkk/eN50jbFaBa5qLz5+lrrnrKF8DJQALfTKi3
         /xhA==
X-Forwarded-Encrypted: i=1; AJvYcCVGtP5yUhbOQOk7pJ8g3wv67JHnANhEccKYbpR3YBUYefwQYZuvNJTSwUpdP+bram1M2NsBQStvZkAa/vVHpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQvHzOiJit9gAA/daAD6vGxTcESmxJezBSmlQf3PO3t8cgkUsz
	a6P1LS491kxEgH4mFTYFDXl+HzLtiVdmiOLK4LnQ+ZoVs7m4wfKa5G8LrbWODg==
X-Gm-Gg: AY/fxX5L9tg//HHGh7y8OszVcR/LkQyiaKjyDUHvjLAR03KQqkV+5L21ngbaX414waM
	VqWck8+QHkNYeLtfIHPZEDGXv9yhf8Gxa/1VSVwLMRpoVYMHvjUfQc/MlW5IuVtNwsjYyQOieS1
	x66xdp3IwzYHYpi1LArnBBHFh1BOy0Un73v1ptQF4cC168iP6FWfy6qw5orJE1rFJk6JslhE+CB
	gnfVSR/Z7S5ZFPqodyyfElO8Z/wiMll9gVQobW8pNc7WdAMErPx2zP+DXNGhs1lq2O82FNOdOoE
	4Xcu5nZmz7d5veIOWhEVy+3EtfaaGnH6Mzu57aIT+1Y0NMHPuCnKD35fRqbHRacZy1AAX/T9S5c
	eTBSKOLr2d/DiA/LGXfrpvj73fNL9Hq+hyeXiCryCXQz32DqA3OToMVYWjV/vblgJtNW/ZzvLct
	Dqaczn9YFnVGijB5+IBte/FrQ=
X-Received: by 2002:a17:902:e551:b0:2a3:1b33:ae30 with SMTP id d9443c01a7336-2a599e3df46mr45989525ad.51.1768466952287;
        Thu, 15 Jan 2026 00:49:12 -0800 (PST)
Received: from nbai25050028.lan ([2409:4090:807d:4601:625b:d547:cf6b:e854])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2b3asm243846775ad.88.2026.01.15.00.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:49:11 -0800 (PST)
From: Sayantan Nandy <sayantann11@gmail.com>
To: lorenzo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	sayantan.nandy@airoha.com,
	bread.hsu@airoha.com,
	kuldeep.malik@airoha.com,
	aniket.negi@airoha.com,
	rajeev.kumar@airoha.com,
	Sayantan Nandy <sayantann11@gmail.com>
Subject: [PATCH] net: airoha_eth: increase max mtu to 9220 for DSA jumbo frames
Date: Thu, 15 Jan 2026 14:18:37 +0530
Message-ID: <20260115084837.52307-1-sayantann11@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_004913_680550_04F48B9F 
X-CRM114-Status: UNSURE (   9.68  )
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

The Industry standard for jumbo frame MTU is 9216 bytes. When using DSA
sub-system, an extra 4 byte tag is added to each frame. To allow users
to set the standard 9216-byte MTU via ifconfig,increase AIROHA_MAX_MTU
to 9220 bytes (9216+4).

Signed-off-by: Sayantan Nandy <sayantann11@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index fbbc58133364..20e602d61e61 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -21,7 +21,7 @@
 #define AIROHA_MAX_NUM_IRQ_BANKS	4
 #define AIROHA_MAX_DSA_PORTS		7
 #define AIROHA_MAX_NUM_RSTS		3
-#define AIROHA_MAX_MTU			9216
+#define AIROHA_MAX_MTU			9220
 #define AIROHA_MAX_PACKET_SIZE		2048
 #define AIROHA_NUM_QOS_CHANNELS		4
 #define AIROHA_NUM_QOS_QUEUES		8
-- 
2.43.0


