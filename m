Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E3FC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 22:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AVf+pfLkaJ1Gl2NWqezqv2bXezRKHHSaj8ghEqd14w=; b=ahuh9GD7Zl32iz29jkEXcpevJj
	WyDBDeKY3lE/7erxdQvElh+e+6hOV4LcOfHpGvzHoFLgW1+gansIEzK8legLqG+upHVCdiV3ZpdNp
	qEWcYQVSTP6xqlaTOZ6Z7YIWubZCtqwVWgHfVzLl7AmdwWCyZ4fvYjxXOg7a/HnGBjBcuAc2B4b3r
	Qu/tB0bVUdmIcyS0xbaiJUwY9dZkiEfvRBf1h6qxPYgiPAryITw+NfuckK95THHBq4jRxbzNq/GiK
	UzEkO1bSgh/voNZkB50//YtJvlQq/Az/FGl1Zc6v2p7pztT8kM3SaKrMcv11ChL9JPHKH7qaxbKbo
	jI/+ZaqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDYNe-00FPwt-6s; Thu, 05 Jan 2023 22:06:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDV9c-00DjZC-4X
	for linux-mediatek@bombadil.infradead.org; Thu, 05 Jan 2023 18:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+AVf+pfLkaJ1Gl2NWqezqv2bXezRKHHSaj8ghEqd14w=; b=d59qFnw2cpU/BJMqKDC/gsKPAd
	i3dzTtwpBuAZ7afQg/gs4NFJer0VUVxlfKuDlBLdxIepIhUpMfGPnu1WMgdPy/UI0DhvkaSgpJict
	EnZffkHh4vNBXIsXOeH5OMWS/x0j5VW9et+wlgdGO7w6t4lWtCDm3zks8KjfC8WhHBShLDx62hUqA
	/p9lIafLUNcky3BFPISjQhURj4ZutXWCXSqM2kRi9Snfe0WPyGfgi9UAPTUMsBnaFfpFZOj0jEmaa
	SnFnqnlzzoQUCJO2ue1Hc5xsCSaMsR/gEPY5rKmns3nLWlUfhsFFvPaOPb+gsicAbF6AagjeRFzQH
	fg+GMhrw==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDTiV-001Vf2-17
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Jan 2023 17:07:49 +0000
Received: by mail-wr1-x431.google.com with SMTP id bk16so23556272wrb.11
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Jan 2023 09:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AVf+pfLkaJ1Gl2NWqezqv2bXezRKHHSaj8ghEqd14w=;
        b=y7jLrTG7p7QjcN2Cna7QAn3CMLp/iGX9hFgyWOvIeyQoOsHM3qakRasdP5KMfs+NZ2
         FPGzPh9C37o2fDUts5urh+UMB69Vw/ZtDYJo91usNWWpzFe27e91iTXgrN37D02UUx9t
         A9JvGt7PQ8GoRaaxdmXkthGFdlZyGOajaTqKTinkqnl+uv1XKe3UHCKFEvvr+4LtZsLL
         AjXOiLXb2Mb1Xe0l7+XuzUtB3Imrpgn0hRHnNjrVUHZ6R94g8p2yLgyyT+xyPCEPI3RN
         DYPF1DpAztnyht4GNPZeB9OWUWZVtmH+Mr01s3DiR0khgIxwjyEXhz5WtNBVPTTz3INm
         YZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+AVf+pfLkaJ1Gl2NWqezqv2bXezRKHHSaj8ghEqd14w=;
        b=P/wts1VsGUBapuwG1SEBroZp+R2tcrt2pG6MM+0MEcAS1Xi3VnFsusJ+OHr31a9jcg
         MF5ne1WIZYqZWzlVYG25D0km1wkA8UxCwh+2NT805wEwN0Gad30WPQfL31F+asIBeqzG
         jAR1SLAfE2IvHfW5qMUhFg760MaTmHP2dpdbgeB6QCWLdvOjsN70cBGwiQtLXHEcIW+6
         uuxsa8NIPxXwEvbmrTn1yE8Y2hR9+hqIbgU7VsrqnHBeAmRIKAUecm+xKULISl7Giql/
         TEZxxHop2E1dl5cav7oT0dkp9z3RAAUt4luKPsglpC5mrSFcYK51BIOo6Sf7uzJ/7FaJ
         BaSA==
X-Gm-Message-State: AFqh2koZQNY/WeWzunNvt196dv9CdGjNn9LIXYUjRUMqu/pjZcRXV7sz
	Ky/Z9ZlHUbPR+7S5yAg7Y4ysng==
X-Google-Smtp-Source: AMrXdXvaEZbEf1VJvkJQZUZ0wp7+NbVXpfFjW83Omw2E04q6K1OndbNKvbHNrGOYQSYHZx9OqH/3Tw==
X-Received: by 2002:adf:ea4a:0:b0:27e:8d9b:bc20 with SMTP id j10-20020adfea4a000000b0027e8d9bbc20mr26665705wrn.27.1672938471790;
        Thu, 05 Jan 2023 09:07:51 -0800 (PST)
Received: from blmsp.fritz.box ([2001:4091:a245:805c:9cf4:fdb8:bb61:5f4e])
        by smtp.gmail.com with ESMTPSA id f14-20020adfe90e000000b002365730eae8sm37164853wrm.55.2023.01.05.09.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 09:07:51 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH 5/8] soc: mediatek: pm-domains: Fix caps field documentation
Date: Thu,  5 Jan 2023 18:07:32 +0100
Message-Id: <20230105170735.1637416-6-msp@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105170735.1637416-1-msp@baylibre.com>
References: <20230105170735.1637416-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_170747_476357_9010FA23 
X-CRM114-Status: GOOD (  10.16  )
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

This field is not for ACTIVE_WAKEUP exclusively. There are a lot of
other flags defined as well.

Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/soc/mediatek/mtk-pm-domains.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index da827e91d462..34642a279213 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -95,7 +95,7 @@ struct scpsys_bus_prot_data {
  * @ctl_offs: The offset for main power control register.
  * @sram_pdn_bits: The mask for sram power control bits.
  * @sram_pdn_ack_bits: The mask for sram power control acked bits.
- * @caps: The flag for active wake-up action.
+ * @caps: MTK_SCPD_* capability flags.
  * @bp_infracfg: bus protection for infracfg subsystem
  * @bp_smi: bus protection for smi subsystem
  */
-- 
2.39.0


