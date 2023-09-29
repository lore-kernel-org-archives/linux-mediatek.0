Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12457E743F3
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Sep 2023 08:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JQvBsQa6Wf0rSJdLMAdZwpOnwCX00w+CswY3ZMKkshs=; b=UlmdUzMXl1ApYqNHq4VGeLqhis
	2m47dVyzU9V0llG1WPu5A6hVg0C/Y2h5Rq0tzzzGhCVHnd5GdKB07nZ+CHW7U1UWQqyzOB0lO+LdN
	EHEFjPcKuDbTJur0Sz5cjbNbPC6KX36i2NTu/6b7fAcdO4B5sTf/QIkjXAU4OCFu3RkRF8/fqIbFc
	L79qfkdYZn54pFqE8F7ifBWEvZpCgB5Y0YeQNTNmD9EFi5Oxava9V48ndFNdGXtAjF3/qdhHSG12v
	fMm4aI0LRrxCjPcDnI6Vv7gh/pzXSQS1uix8g3Pa1m0x+NAKdD8TI1SAIGgavaB87+YEauOvmlblg
	wNYkR0kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm8js-007Mlv-0q;
	Fri, 29 Sep 2023 08:20:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm8jq-007Mkn-0f
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Sep 2023 08:20:43 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 602886607345;
	Fri, 29 Sep 2023 09:20:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695975637;
	bh=UPagtv10FBWXOAdGt2RUXPK7syXYCD3V+4gbtZr1J6w=;
	h=From:To:Cc:Subject:Date:From;
	b=Cx3M3BIYBV4kZumxVhOxMU5stV4ZCCkTulVNM8D7DXZVdOzxgGUFgRJ8qou3HCBZ6
	 hgmK64kjt/Ygc/HM1719abKJaRt2wSbodsHvuYvgcEe/bwXEchKvZ/HbuliOP5NuG3
	 ghnyyq/GcoC3sbOUfs0a9Z5ezyJlweolWqsHFuG+wYyLyvV2LOURnJlcGQ41HH+nD+
	 6IGSgjCZ8UNVhqz5ja4Vajxfjm29IdHYfa8vmMtByMnpndWNm+O8BQwbKxeGzM1020
	 ll2pEMtJHAPuAP7qM8FID0ODXGnkPkEzQaNHKvnCUpmui2k1v9SFQKXdU1uCrys96d
	 zE7vHg31fTSAQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: nfraprado@collabora.com,
	wenst@chromium.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	amergnat@baylibre.com,
	arnd@arndb.de,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer
Date: Fri, 29 Sep 2023 10:20:09 +0200
Message-ID: <20230929082009.71843-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_012042_451827_D7E86DCD 
X-CRM114-Status: GOOD (  10.57  )
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

I am a top reviewer mainly for MediaTek SoC related patches in most
subsystems and I've also been upstreaming both improvements, fixes
and new drivers and devicetrees when required.

The MediaTek scene saw a generous increase in number of patches that
are sent to the lists every week, increasing the amount of required
efforts to maintain the MTK bits overall, and we will possibly see
even more of that.

For this reason, and also because of suggestions and encouragement
coming from the community, I'm stepping up to be a co-maintainer of
MediaTek SoCs support.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

P.S.: I tried to reach to Matthias for almost two months, but I couldn't
find any way to talk to him and he has been unresponsive on the mailing
lists as well.

P.P.S.: This also comes after Rob Herring's suggestion to have myself as
a MediaTek SoC co-maintainer [1] and support from other people.

[1]: https://lore.kernel.org/all/20230804225813.12493-1-robh@kernel.org/

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 208cfcc1aee3..211a8322c801 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2330,7 +2330,7 @@ F:	drivers/rtc/rtc-mt7622.c
 
 ARM/Mediatek SoC support
 M:	Matthias Brugger <matthias.bgg@gmail.com>
-R:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
 L:	linux-kernel@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
-- 
2.42.0


