Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B41C433E8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:48:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD2AC20714
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:48:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1pVTFAdc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hf10y5eG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD2AC20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvD7YG/rdeNUoIiz5+s+RvS5RldUpeqDztZGQbaPVK8=; b=1pVTFAdc/fkWMK3gDVnGAh2HqT
	PwwCZeYExTHw4UlyqO8kEt52eSabK/p/zJUf9J1llXFnThpi0VWm1x/AeIzxwjPB71BiZPbIvvZ2p
	nCwBNTnwnveF9SWzcmJJ2vkkha3alh6X30NL+Bv9hYQMcp/dBHpLb1IwtoPhsXguypYxyX1rU+8Iq
	Q2i4djNKIbvPrVd3aev8VBJkZwAkXPEJk0xSa5aDZYsmNz/GalukFhP3itrcPXIO5UokkA5/GlRYU
	RJvCD178fuiN74gBprfpDvBCNmmW03BXLgO2asBBVONJNmdrzqn2DC/ifE2+PY16ePg40O3nTws9G
	VQHW1qLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysQp-00058b-4E; Fri, 24 Jul 2020 07:47:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysLo-0002Z3-7P; Fri, 24 Jul 2020 07:42:42 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0315E20768;
 Fri, 24 Jul 2020 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595576558;
 bh=Ghgwe3gjfURJUO55ZBx1GA8tQG5sLuihQjn3oQ0A+6w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hf10y5eGPMpMirF29LtX8LvWqpzjqbm3YK94XVS1sRpM3mZbyNFVC+rPIwzLUmzBJ
 ckZshP7Y/wd99Ff/7nnl2+nGwCOIhY5BRtjMVADoU1GwBHtoyoGgRPnz77E255EWHX
 RnAnLfSF567ej8mQ+w/YUnDH1Xx+wTO0fQo8RLGU=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Kukjin Kim <kgene@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 18/29] memory: brcmstb_dpfe: Remove unneeded braces
Date: Fri, 24 Jul 2020 09:40:27 +0200
Message-Id: <20200724074038.5597-19-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_034240_530680_BE22C183 
X-CRM114-Status: GOOD (  15.41  )
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Single statement blocks don't need braces.  Fixes checkpatch warning:

    WARNING: braces {} are not necessary for single statement blocks

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Acked-by: Markus Mayer <mmayer@broadcom.com>
---
 drivers/memory/brcmstb_dpfe.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/memory/brcmstb_dpfe.c b/drivers/memory/brcmstb_dpfe.c
index 5942380f343b..604f0e3fb112 100644
--- a/drivers/memory/brcmstb_dpfe.c
+++ b/drivers/memory/brcmstb_dpfe.c
@@ -379,9 +379,8 @@ static void __iomem *get_msg_ptr(struct brcmstb_dpfe_priv *priv, u32 response,
 	void __iomem *ptr = NULL;
 
 	/* There is no need to use this function for API v3 or later. */
-	if (unlikely(priv->dpfe_api->version >= 3)) {
+	if (unlikely(priv->dpfe_api->version >= 3))
 		return NULL;
-	}
 
 	msg_type = (response >> DRAM_MSG_TYPE_OFFSET) & DRAM_MSG_TYPE_MASK;
 	offset = (response >> DRAM_MSG_ADDR_OFFSET) & DRAM_MSG_ADDR_MASK;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
