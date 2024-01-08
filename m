Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88021C4707C
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 18:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTbnmv//8S6AoGwmpmf7bKm2BZ2V4fg+EHVTPs33yVA=; b=Xr1cLQqUIP29+76DU/375P5B9S
	SGATt1bSCJqgUlVx7FEox17qpOlir/oR+3MiABWiKa+wkbr/wIxzyCazjQiCSb4ndubHcuGRWWy6N
	FpRQ4wpaaQe3B3rmvZU9pusBMf9d5ZtZ9vxqROnpUAwbObotaXroAh1dqHYn7BBpGlXfXUqbBvKF9
	124wtQS4jBNFdFV0E540FUQ83HOgay5cHvYFo8aikuiuTIiqilpqTGRFx7W6mTk/boFU4ppegYIo5
	SklaKZFiwsEvtAki5hfuJlL6emQyEGLZtOOAZgNSYHhDV9R3B2t8I7DH/dwS1xhBc778EUhT1CptY
	jsJqj/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMuBS-005rOX-1p;
	Mon, 08 Jan 2024 18:17:10 +0000
Received: from mail-lj1-f175.google.com ([209.85.208.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMuBP-005rMW-0O;
	Mon, 08 Jan 2024 18:17:08 +0000
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2cc7b9281d1so27183831fa.1;
        Mon, 08 Jan 2024 10:17:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704737823; x=1705342623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTbnmv//8S6AoGwmpmf7bKm2BZ2V4fg+EHVTPs33yVA=;
        b=sm8HwR8UWiZCXpPCCkTxGAAcgdCHPqinbrJ1U4OQp//Tj/AzGvLVWjCscO5EL3Enfx
         esqiio0iZzRBCFXkKzudN6sJlqiG8wAa7+joRlUg/Zne1bGJt2RWE5IKHCXi++kDRgFI
         H9wA6urjVKfnzWrB8ZsINmi6W9LQulHHT7k3Btg27JxUIkJuAktSESLkunDhl7GV3b6R
         E/B0kkxjKt80mBIEVNTF1B0315AzKgWtvJEKGIBwcJL2mLWJacKcOfVSje6S6kSOBGlw
         bZmrdB6TRCqSwpwKKBiHfsVix2hgjQUAs7L/QYdwhRYdaQtkvtlUARR7+gLvVifzn6Mr
         wqLw==
X-Gm-Message-State: AOJu0Yw6tEHBHybdxLg9R28mZlB5Mwh+nCSsBwtP1bp7l3vUs/mLfpJG
	9zGAA+bQGRKQ5WuweOyMBDM=
X-Google-Smtp-Source: AGHT+IG/YKMNWq9Ur9N/wASmN0Xl3EdEs2BMrhUl9KbhdT7qB2KLXiVpvQS9WcC8+noseq7/jC5QQg==
X-Received: by 2002:a2e:9347:0:b0:2cc:2b43:566c with SMTP id m7-20020a2e9347000000b002cc2b43566cmr1779053ljh.14.1704737823369;
        Mon, 08 Jan 2024 10:17:03 -0800 (PST)
Received: from localhost (fwdproxy-lla-007.fbsv.net. [2a03:2880:30ff:7::face:b00c])
        by smtp.gmail.com with ESMTPSA id a1-20020aa7cf01000000b00552d45bd8e7sm90125edy.77.2024.01.08.10.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 10:17:03 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Alexander Couzens <lynxis@fe80.eu>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH net-next 10/10] net: fill in MODULE_DESCRIPTION()s for PCS Layer
Date: Mon,  8 Jan 2024 10:16:10 -0800
Message-Id: <20240108181610.2697017-11-leitao@debian.org>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240108181610.2697017-1-leitao@debian.org>
References: <20240108181610.2697017-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_101707_179110_303D3FB6 
X-CRM114-Status: UNSURE (   8.33  )
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

W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
Add descriptions to the LynxI PCS MediaTek's SoC.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/pcs/pcs-mtk-lynxi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
index 8501dd365279..4f63abe638c4 100644
--- a/drivers/net/pcs/pcs-mtk-lynxi.c
+++ b/drivers/net/pcs/pcs-mtk-lynxi.c
@@ -303,4 +303,5 @@ void mtk_pcs_lynxi_destroy(struct phylink_pcs *pcs)
 }
 EXPORT_SYMBOL(mtk_pcs_lynxi_destroy);
 
+MODULE_DESCRIPTION("MediaTek SGMII library for LynxI");
 MODULE_LICENSE("GPL");
-- 
2.39.3


