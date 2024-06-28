Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C98C3064D
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 09:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qg2JNCw4iTyk1Ktv/XVxaurr+o/tC7peyA7xUlc8HLg=; b=R3hx2eSyfaSDk2fs6Y9PNmSzwQ
	RVcb6w4+koug6VL6aJJtLLJ3f3eqvLqvmOM8+EeYFjUIoswPeaHfWIDjQbcvyjvYQKbaExkI8KDBd
	eawllLWKFbKCqeoYp76A12rDTQysU3hPxX/FJbwlOGQhgBwp4aKsEz0daodBEPq5YW+PIJNf5HAk4
	3pd4kRusHzVyhjyyvdqvduyhShDDTHpMPBce6jdjFrdgt5+hq/qeeAX7/WrtLoRLhY5ShVYfkm2Rb
	wu5y17yvNovRdsJAjlUz5avy2xGdiPTjJyVV5fR9JENrZz1YHusIFGxW4XOLDtU7eOwHhnYNUqvcu
	QvJSsHzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN8G5-0000000DKKC-0EYU;
	Fri, 28 Jun 2024 09:51:09 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN8Fn-0000000DKDi-1uLv;
	Fri, 28 Jun 2024 09:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719568249;
	bh=qTzcwmP1nuaEPFNJ2NL4qi+LEvKag+OkYl7iKtyfQck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ag+6Grtwa9KaHBfOLlE3drmAudUuo8VOXBkvAtCF7TZNWm2AZX0Kf1tgLrX2Qb481
	 8upbSWHg5bdgGLa7IwFPS8gw73CXbsLTBR6IOP6tmEMTGwip9u1fBG0yW9aC9kBXJ0
	 BPfi9e8R9wyL4JMT0iR3B403ZO2nUJ43FcTM0zTL812MN4/jwZ0YD3zdgqDClX+TzI
	 MYtsSAoz+t3RL9YKXRoIyXwk9Kp221H36YqqjqRT7PeuhlcSZt9lUmzFmbONcNDigy
	 v168dDuMYJ8EF1W1YqYdqI4RO9WeeAex2BWH+Xu+QMp0O0VZEYO0B8x97d86tYSHPD
	 wCQX0ceHPcUHA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7426937821A8;
	Fri, 28 Jun 2024 09:50:48 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/1] MAINTAINERS: ARM: airoha: add entry to cover Airoha SoC
Date: Fri, 28 Jun 2024 11:50:43 +0200
Message-ID: <20240628095044.132276-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628095044.132276-1-angelogioacchino.delregno@collabora.com>
References: <20240628095044.132276-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_025051_646575_A41CA091 
X-CRM114-Status: UNSURE (   9.41  )
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Airoha SoC is not covered by any maintainer entry so relevant patches
can be missed.  It seems Mediatek SoC maintainers were covering some
parts of Airoha and Airoha itself is subsidiary of Mediatek, so assign
the Airoha maintenance to Matthias and AngeloGioacchino.

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d6c90161c7bf..1ef2a3fc5d53 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1909,6 +1909,15 @@ F:	include/dt-bindings/reset/actions,*
 F:	include/linux/soc/actions/
 N:	owl
 
+ARM/AIROHA SOC SUPPORT
+M:	Matthias Brugger <matthias.bgg@gmail.com>
+M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Odd Fixes
+F:	arch/arm/boot/dts/airoha/
+F:	arch/arm64/boot/dts/airoha/
+
 ARM/Allwinner SoC Clock Support
 M:	Emilio López <emilio@elopez.com.ar>
 S:	Maintained
-- 
2.45.2


