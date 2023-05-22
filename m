Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F01C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W605wLVAjZcYJ+UbvgGvWkHLkMFaiTir5YrRz0YtXmg=; b=sm4D18NSsWk/rj
	Zzch7oedKTCnvjVkzVm/GDt6alersBDp2UHnm9UTs0XO1jy29YiKdWiupBXQ78997iJa8JQMUOSNg
	fcY8dNUGhQj0eGnSzQ2E7OSD//E1yq1MI0euRqJmZJOqxUab/GVCEc80zvO7huO+VWAH4eeZqzEUT
	HvcMq7iq9uaax7L0BdxAGwxqtAJGXQVI+Ak7KcnLZ7IWCIysUXGckwqhbCBGH9J5wUPXTIcb25g4z
	jZRE+qPrdaUyYdnKw3oWu6g4moo+vwz3mq9FVG8BiWP7m0QCtD6eHmzGaxH08PKZsMtcz7tCK6lpK
	JMoH7OzFpNmR0Vc3W4Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14SE-006Oyh-2d;
	Mon, 22 May 2023 12:15:58 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14S6-006Oue-16;
	Mon, 22 May 2023 12:15:51 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-96f588bc322so587437966b.1;
        Mon, 22 May 2023 05:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757749; x=1687349749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W605wLVAjZcYJ+UbvgGvWkHLkMFaiTir5YrRz0YtXmg=;
        b=qcQP4Hsv2zkuBD1rc5sn1VmOnLPTnpkC36ZpIoFX5g5+/8j6+xMkWXmdl783YhkydI
         ouC3vQqGioYtYax5t3LtbhBLe89V6Vvcmvy6iY6tJGf3cATIWqmoIzc8TEzKggVb2nNf
         GtFBJF02BH88duMq9StIDqPSSWlOF3alAjJwZ+mHLGBnoavDEgukeXWGeSSZ8lWKS7oW
         R8Xux7ZtyV7n5PbQzbK+ftm9MkcnStykJc9U/2OKQ5iEnYgLYFG3y7QQBOVhTSmk9ktu
         MN9iT30TXuPt820WSkRz5zuN1Y7nkwixR8RfmWTuHdSKTECqM5eYkVaMiQywohNStgNc
         qaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757749; x=1687349749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W605wLVAjZcYJ+UbvgGvWkHLkMFaiTir5YrRz0YtXmg=;
        b=NVE5TOQnkfNR/XJ6ueEGPK4bXXtMJ6AUiQOl8NzeC79iG+3K5JzX1nUkJJOJPNYJkn
         YAW48WTTN8n5o99X//x803USn0IfsoV9DMZmT9cLMF/uBGzqL9+6kGtJICt/NKYYboSB
         y/KqOInEIDZl7muuXspIcx4dygMs0LELT/o8n6e9YZUPbSdzrJX58GIzCpWzH8X/a+IM
         TELpyq7k8gN2Lmwm4Y9s3e2/sXnyKO7jYWJozxV86sMTESoeuX82h8BZzeC1EfyvJdCr
         O/BCJKHlPYVqh6CcsTkA+tOCC6ofnpV/pfKQWkXqMBXNoGB901/oLaS/M2Hr49cZha38
         GrqA==
X-Gm-Message-State: AC+VfDzBzkjhq2fhlyZC4Z1636xjFBU+IIgA4+Clhkwinr+DP1ScZ01C
	j4RByiS4aAuqYUz0l3fl5fI=
X-Google-Smtp-Source: ACHHUZ5udgAI9lXoymHWuGkdojdDxgLRZXFK1CAl38y/EIjRGn7RvR87DFYBmjpyu6txHt2HTifOGQ==
X-Received: by 2002:a17:907:da8:b0:96f:8666:5fc4 with SMTP id go40-20020a1709070da800b0096f86665fc4mr9492508ejc.50.1684757748618;
        Mon, 22 May 2023 05:15:48 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:15:48 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next 01/30] net: dsa: mt7530: add missing @p5_interface to mt7530_priv description
Date: Mon, 22 May 2023 15:15:03 +0300
Message-Id: <20230522121532.86610-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051550_379443_1EC4C852 
X-CRM114-Status: GOOD (  10.73  )
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
Cc: mithat.guner@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Add the missing p5_interface field to the mt7530_priv description. Sort out
the description in the process.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 5084f48a8869..845f5dd16d83 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -746,7 +746,8 @@ struct mt753x_info {
  * @ports:		Holding the state among ports
  * @reg_mutex:		The lock for protecting among process accessing
  *			registers
- * @p6_interface	Holding the current port 6 interface
+ * @p6_interface:	Holding the current port 6 interface
+ * @p5_interface:	Holding the current port 5 interface
  * @p5_intf_sel:	Holding the current port 5 interface select
  * @irq:		IRQ number of the switch
  * @irq_domain:		IRQ domain of the switch irq_chip
-- 
2.39.2


