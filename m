Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB57C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2euWSsPEF/v1H3boU+OtaRrXIWKLVevLYYthNauJxnw=; b=BiTLUsK9hrIziCfdV5BWREEbX4
	kVONPz1PThwGtnEXtXw0w8vW72Plu55DDj5kgQI1gFfnklPKFwHET+GiKSUuPpg4h7ZnmvLnYS6JO
	73mCR/a6+wq4NtZC/okx82RkRYAxRs4DgXfhjKR0DyDEBmsm/wzRFwjk4USwSS5U1arqf4K+1Y+VV
	UVKHiyXiZfXyBShR0+aNCj/+c+gbbkKd6pudsaON/KEOOD9XRE/5oMWwNaFK/WLfnE0GDHoSdMkmg
	8o1VrfQUT7ffT87I0D2FVmjxSgvxqllsCbGahiiKmRki2KDzwZacvRKW4iXtHYxvdjeJ+leA3vPI/
	KPhXeBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whODy-0000000GhYI-0Y3y;
	Wed, 08 Jul 2026 09:05:46 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whODu-0000000GhW1-17aD
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 09:05:44 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47df343a346so134725f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 02:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783501540; x=1784106340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2euWSsPEF/v1H3boU+OtaRrXIWKLVevLYYthNauJxnw=;
        b=bKM/8MON+toUWSyuoXASedvL8bZwPXiBQt16kfKi1kbEpDgFkGwTBrqUs3qNU/Q+mw
         jBJ2cE6pEU+6laGkNaXXwajMH9rQE0PK6Qh/uBlQfGoTth0DIJTbqKIiclUzhqysRQdX
         eGcy97e9KoBWudFw32w4eq8qu/iQcXNJnCXm7RpoEpQ+VtG9EPexKdROjEUaiH2HF6s9
         GvuUg7KvBgJmPeBr1alqdqiEyeoNwW5XXbjz1nIKj/nslWvzQLGVKbV83yDxVHfy8VCT
         2RN9INoB67Dxj8t7ql629f6MMafedjijvhSk3WuM/SeS8//icbeCiDujM9CQVBHZBYuS
         Av4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783501540; x=1784106340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2euWSsPEF/v1H3boU+OtaRrXIWKLVevLYYthNauJxnw=;
        b=rUb4P2+866pym71nSAhz7iZ6B83usADX55zY4VdSj+S96plLwfdoASvrNbZ5qg6J0S
         u2iuB2+Ce+suFET69oiguGktpnuka0fie4c7ojohBiDsoj1yneaQsbifNczH4dY6wiRF
         x/22MZomunnGkg487b5tmm4q6k02uo2Ivf8dseyMEtsKSrJ4oWxMAEKcmk6BrimJh9cP
         /nvM5jEEgFhxubZumd6KsIlbvTfaiSxs/bwcatz0N907mTfAmwAfTE3baCxDLGgfUTkB
         97MZ6qvynattWkfLi1f/gyTNF0a6tvlojCagjtXVbnRtcTVC4sS+bSaXBrs/G9PVXk0E
         sFBA==
X-Forwarded-Encrypted: i=1; AHgh+RqzYuT5QE59xLwWAF1b4JVgky7O5ng4Fa3wcCm4BTHJC3lRw9My9wfVreRw3z9Qksro4JbLk8iMmGhR45/XRA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yypi0mGJAGvmhECbC12k0bLzQF/xdbXLmkvxEWzMzclMZZvblaq
	olBZFvRoAu2iO2CdcgHUlQM2p3qYojk3ezZV0/wnC8ie/jwKwZiYJ1mT
X-Gm-Gg: AfdE7cl25Q9yGrDUbBRo+lV3iukI8dQWB5fL//0XHfT4re3/Yvw/2mp9kgFhoojvk5x
	h10EQb1In/jOQ94wIw8VjwWIausq6AVJNx34pUjyoy46OElELhDX1G96yRG70qGi5yTR1sa4FmJ
	oisvIqHkit1dqfCXJrBPyIOtgGuwvSQYiUVb8/MPHMMRNAxDTV7eXbOQzz+vHLIPcZQiPvhP1AW
	9g33qxhp+yXGYksEk5XO79SU9M6cyLlBVp49K3eiMN75LK+L88oL6kZyE491BKOMEMMUrPin+Y4
	MKbwiklxk8eCAGYTuGTyf2TVv693E6A/kaQ4ePxJFBA5S/jf9cazIqNui73sEqdT+yYIETkcwVv
	KnCD9upHzQHEY71AO05eILo6QURlVhFfI2UMquchnJZqkeqO6djzcrU/wta+SRSz8GrNjt3hNIX
	yelBHAjTkMz5NK/kA/Fzdbx8IYnLqiImqsyFXA/Q7vxgX0gMUEdDItgfsyoz+uPi9G62vwSJpxF
	jQNbZlE
X-Received: by 2002:a05:6000:382:b0:478:65a8:262d with SMTP id ffacd0b85a97d-47df07157f1mr1587607f8f.9.1783501540094;
        Wed, 08 Jul 2026 02:05:40 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47a9de1e785sm40674208f8f.8.2026.07.08.02.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:05:39 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] PCI: mediatek: handle optional reset for perstout for AN7583
Date: Wed,  8 Jul 2026 11:05:29 +0200
Message-ID: <20260708090533.19734-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708090533.19734-1-ansuelsmth@gmail.com>
References: <20260708090533.19734-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_020542_576597_315A106F 
X-CRM114-Status: GOOD (  15.25  )
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

The Airoha AN7583 provide the perstout via a dedicated reset line as using
the PCIe register is not possible as it will cause glitch.

Add support for it via the additional reset name pcie-perstout[slot] and
assert/deassert on an7583 specific startup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 8b57c3d75b94..3d4de9d69407 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -175,6 +175,7 @@ struct mtk_pcie_soc {
  * @phys_base: Physical address of the I/O register base region
  * @list: port list
  * @pcie: pointer to PCIe host info
+ * @perstout_reset: pointer to port perstout reset control
  * @reset: pointer to port reset control
  * @sys_ck: pointer to transaction/data link layer clock
  * @ahb_ck: pointer to AHB slave interface operating clock for CSR access
@@ -198,6 +199,7 @@ struct mtk_pcie_port {
 	struct list_head list;
 	struct mtk_pcie *pcie;
 	struct reset_control *reset;
+	struct reset_control *perstout_reset;
 	struct clk *sys_ck;
 	struct clk *ahb_ck;
 	struct clk *axi_ck;
@@ -865,6 +867,9 @@ static int mtk_pcie_startup_port_an7583(struct mtk_pcie_port *port)
 	size = lower_32_bits(resource_size(entry->res));
 	regmap_write(pbus_regmap, args[1], GENMASK(31, __fls(size)));
 
+	reset_control_assert(port->perstout_reset);
+	reset_control_deassert(port->perstout_reset);
+
 	return mtk_pcie_startup_port_v2(port);
 }
 
@@ -1020,6 +1025,11 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
 	if (PTR_ERR(port->reset) == -EPROBE_DEFER)
 		return PTR_ERR(port->reset);
 
+	snprintf(name, sizeof(name), "pcie-perstout%d", slot);
+	port->perstout_reset = devm_reset_control_get_optional_exclusive(dev, name);
+	if (PTR_ERR(port->perstout_reset) == -EPROBE_DEFER)
+		return PTR_ERR(port->perstout_reset);
+
 	/* some platforms may use default PHY setting */
 	snprintf(name, sizeof(name), "pcie-phy%d", slot);
 	port->phy = devm_phy_optional_get(dev, name);
-- 
2.53.0


