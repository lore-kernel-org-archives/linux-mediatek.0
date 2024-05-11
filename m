Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9690FC04FFE
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 May 2024 12:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BZ8Z0Aarz6dukVwTSg6oFxXKuRw0aMvSSKkaUBN7Jgo=; b=15h1diTBczZmF12ADQXkJyrbd6
	EqabLrYwixqaZqF3yFLfLMyIgsC05b1MIpbCMDrpV1QJIfWxfBwvNlZn1iqtPDNUEF1zPM5Z7+YlD
	U9hTUOoe8t377m1jBoIjgXtm2jIdyz7AAA6iaiorVPBld05WuN8FdeY1ZI56gkJ2wwqCiRdPtkByK
	S8FQ0uvjt6IUOE0ypkmTzh9/tcCIXGsEDXXV/C158EBSOjB3fh4ZLZgq6Me/0tREGjr+h7SpYXM+j
	1212+0x/Li20BIp1gIRosesoUZJxtp1nSPiD3HQgDNcTeMkKGhNYo1kYU1SQAybXSV7/gi3Rs+pkO
	fqtCFz/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5m5N-00000007vAr-0ALe;
	Sat, 11 May 2024 12:44:21 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5m5I-00000007v9B-3BJk;
	Sat, 11 May 2024 12:44:18 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-350513d2c6aso1156512f8f.2;
        Sat, 11 May 2024 05:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715431454; x=1716036254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BZ8Z0Aarz6dukVwTSg6oFxXKuRw0aMvSSKkaUBN7Jgo=;
        b=IsfBbfx68506UJP02e93eheuJauhTtmpir0yc+uRCwd+8XtgjextrjGmtwDe0PjDyW
         F+rVM0toI0Wj938DQQtnSWUMD2JMLW3ttLOcNigB6xoRt8E89J6MOEc5ufXSMy0vdlEJ
         yY62sHeszia4JZxEnIhgXhctPU/q82hDBvUH+cU9M8hMMZyviRtmZHaSxECvhMwMtrD0
         oDu+UeqrV56AZMACAjCieb9L67ph+QWOjEe42lemWP3PJRtdN5Z2ePk+iyeXBPfL2Svr
         5na3UHTX5St3nuuhhxQZS9B5gifP9GchxJv00eIex/IdPPHm57v38i6Vzu7iERlQb1rb
         D6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715431454; x=1716036254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZ8Z0Aarz6dukVwTSg6oFxXKuRw0aMvSSKkaUBN7Jgo=;
        b=QCBpp1M/ZOy6My4XkZV7qPBsJ/ldtPLYzHIUJNk9JGCeuqkchlhY3TDe9j/9+52hLA
         x2wwY8J4pqP+GpAboZ5vzjVTKVyuNIpDzjol3QkSSVf7FUOsaDr8XL4OEWkorcwuOgFG
         s20zIXPQ1yYuVDbwIdZr0PoclfgULYcypoXdvKVGkEpXhk7sgbUq+kMYW1xUE0WHhwzH
         dLvBpAXZoOz3zHh8HJspOmE6VgJcxGFjMgavgyfQ94APhccWwOkNEps738iccjS8WAHh
         GP6fqWUz33+Ijp6PHAC6cyIbHzdcxNYm1TKL1YNVgsO4SVdZuvRNJHPc/YMEce7msHUP
         bj7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVt2OUtW52Fm0bnwDNlin6eHz6xgaVQ1KKLAHhPdOEfq2aO4BT25dhEW1KUfYcScg/wGZP8MSRM6i+xhAyJEyqYahDd0BM+xT+kDlsX2CSjVRGxBLqcMgaxnoFMowv0ZLwmxlv37eX3G5QdoLfI7VZgZZtIhip2n7I=
X-Gm-Message-State: AOJu0YwRiUK9L94eruoUucAU9mEX5WFcROrv80OcX2Y4eR5cNu6BxP8U
	6dyuXra7Ec/7F8p8hCHZg+ePtaP7NACAhZilUsH3NtpZxhINlQOy
X-Google-Smtp-Source: AGHT+IHkUpBwdP2Rs+StkRWiK5hqO0KXE+W4zhMPOSox52JFXK9GDaBhCcgl7UPv1pYmQBpqXPckvQ==
X-Received: by 2002:a05:600c:4f4e:b0:41b:a271:60a9 with SMTP id 5b1f17b1804b1-41feaa2f38bmr41453825e9.6.1715431454258;
        Sat, 11 May 2024 05:44:14 -0700 (PDT)
Received: from localhost.localdomain (IGLD-84-229-253-184.inter.net.il. [84.229.253.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fd10cf8besm49870535e9.1.2024.05.11.05.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 05:44:14 -0700 (PDT)
From: Elad Yifee <eladwf@gmail.com>
To: 
Cc: eladwf@gmail.com,
	Sam.Shih@mediatek.com,
	steven.liu@mediatek.com,
	bc-bocun.chen@mediatek.com,
	SkyLake.Huang@mediatek.com,
	Henry.Yen@mediatek.com,
	john@phrozen.org,
	Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net RFC] net: ethernet: mtk_eth_soc: ppe: add source port comparison
Date: Sat, 11 May 2024 15:42:26 +0300
Message-ID: <20240511124230.13991-1-eladwf@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240511_054416_821146_6E8FA652 
X-CRM114-Status: UNSURE (   9.25  )
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

Resolve packet loss issue on the following conditions:
	- utilizing multiple GMACs
	- device has more than 4GB DRAM
	- using PPE

Signed-off-by: Elad Yifee <eladwf@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c      | 4 ++++
 drivers/net/ethernet/mediatek/mtk_ppe_regs.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 6ce0db3a1a92..6415ba618ebf 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -1053,6 +1053,10 @@ void mtk_ppe_start(struct mtk_ppe *ppe)
 	      MTK_PPE_GLO_CFG_IP4_L4_CS_DROP |
 	      MTK_PPE_GLO_CFG_IP4_CS_DROP |
 	      MTK_PPE_GLO_CFG_FLOW_DROP_UPDATE;
+
+	if (mtk_is_netsys_v2_or_greater(ppe->eth))
+		val |= MTK_PPE_GLO_CFG_SP_CMP_EN;
+
 	ppe_w32(ppe, MTK_PPE_GLO_CFG, val);
 
 	ppe_w32(ppe, MTK_PPE_DEFAULT_CPU_PORT, 0);
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_regs.h b/drivers/net/ethernet/mediatek/mtk_ppe_regs.h
index 3ce088eef0ef..61fea4b4b65b 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_regs.h
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_regs.h
@@ -18,6 +18,7 @@
 #define MTK_PPE_GLO_CFG_UDP_LITE_EN		BIT(10)
 #define MTK_PPE_GLO_CFG_UDP_LEN_DROP		BIT(11)
 #define MTK_PPE_GLO_CFG_MCAST_ENTRIES		GNEMASK(13, 12)
+#define MTK_PPE_GLO_CFG_SP_CMP_EN		BIT(25)
 #define MTK_PPE_GLO_CFG_BUSY			BIT(31)
 
 #define MTK_PPE_FLOW_CFG			0x204
-- 
2.44.0


