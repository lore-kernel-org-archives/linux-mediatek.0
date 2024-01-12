Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F03EC47422
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xv9bKtjrWhxDkISC7hC2LZA1EmOhisHshDiaAPn67tY=; b=Qs8bjZwS0IEFWAe2a8Mi2r7nn2
	d+ptJYy6sZ4xiRGJhq9Exj0LfQCwX7L/HyHSdnVk6/B6udj/NJZ9NUO8edNjVGDeO7yIyTam8Vy/N
	smo/bWa7C9rlPlsX2/MxMBDXEA3CuZpe4IAhQ5bFisNz95j7Xo9IF0GD6+GZmDdDYuJttwzUygEi+
	d8mwyxEiatVOm7aYsKxSscJuyKPXqjcDwJH4yt47MjcRUbJyLxjIVoR7W9lyciBP4viFSDCZgCEwV
	3OAOPEskBLd+bWK2z3339lPdog02iclXsDaN39z0ixniaa1jf+z/oYM5GlMGDAPuucgIs0mRP5MMz
	Rj1Gj23A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE6q-002Mtg-1i;
	Fri, 12 Jan 2024 09:45:52 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE6j-002Mrf-2L;
	Fri, 12 Jan 2024 09:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705052744;
	bh=kBy0xyGHqh5AeAuImQCMQR9+EKgyLvr9VzSgQV6Ok8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ie5C2kIt8oI4QqfJrr7QGgQRxd/AYoR9Ackq+/ffMp31ZqIPvOGKByOEBVFHMWTN7
	 YeLz1AfbfgO83r/fBBKF9iFbbYucx20hg3Skm7Ourt/zS/tbSBIwji7gKyoayRqSb4
	 G/M0oafeRDg+FYCIOTMdkg9O6RScQnz5h0HvOqHVih3DucDHD2L0DYWL2bDjHpmoeT
	 TB3VAmyR4cS9MwwyOUZZ8qpctQZOtXEaAMu55nziHl2r2CrkHvshS8JBzDtK0kRStF
	 crGnhanSItDoyIDnRHK0Sy0q3F1TbteGzROylsGXgWm45DZLgsMakNmgtGCP5RkDtC
	 zKu5LkHdMdAEA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8B4683782021;
	Fri, 12 Jan 2024 09:45:43 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	cy_huang@richtek.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 2/2] usb: typec: tcpci_mt6360: Rename interrupt PD_IRQB to PD-IRQB
Date: Fri, 12 Jan 2024 10:45:38 +0100
Message-ID: <20240112094538.65639-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112094538.65639-1-angelogioacchino.delregno@collabora.com>
References: <20240112094538.65639-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_014545_897786_7F87B8E8 
X-CRM114-Status: GOOD (  12.26  )
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

For the sake of avoiding underscores in devicetrees, rename PD_IRQB
to PD-IRQB.

Since at the moment there is no user of this driver (yet!), it is not
necessary to retain backwards compatibility.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/usb/typec/tcpm/tcpci_mt6360.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
index 02b7fd302265..745463283323 100644
--- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
+++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
@@ -153,7 +153,7 @@ static int mt6360_tcpc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	mti->irq = platform_get_irq_byname(pdev, "PD_IRQB");
+	mti->irq = platform_get_irq_byname(pdev, "PD-IRQB");
 	if (mti->irq < 0)
 		return mti->irq;
 
-- 
2.43.0


