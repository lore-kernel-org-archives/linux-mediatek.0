Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F72C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 09:40:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 807CC6148E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 09:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 807CC6148E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mapRUXGb1/Lu+ssj6wjUg868bzogxAoBT+HPAlubxc=; b=sbTjNBZeWklgIA
	Tq3X6V7fLHdqwoB3JCPPhFnONkFPkiPUclArlEMB63OS/Go8eA/FGztG+zU49t1+Z82rp3b3STFiA
	K1W0oEDWKOQ8XdDvD4iB2gL6+VttAABvqiOL97fmzWE0dcr6S/lF7qSG6q7dcJ4XKEXZPTLi8mA/u
	oNar4Kw3aN0nqNhCC2zKHFn8oFqgIeHAQUEt6EtIlKewPk+PgzJ1iha2kq32dldMc9X6eiskOJ7so
	mObNuECmX74DX4MSSy6Dt/dZIJ8al5alYohAFUw8C2KR86jz/eh5TVhET3Ea9bjmAEYAJbLpOxGmr
	kL6PnlO+YEKn5pwfItiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lytBe-00GmoN-Tt; Thu, 01 Jul 2021 09:40:46 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lytBR-00GmkP-Qw; Thu, 01 Jul 2021 09:40:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 36A5F1F43DD5
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 drinkcat@chromium.org, hsinyi@chromium.org,
 Collabora Kernel ML <kernel@collabora.com>,
 Bilal Wasim <Bilal.Wasim@imgtec.com>, linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH 1/3] soc: mediatek: pm-domains: Use correct mask for
 bus_prot_clr
Date: Thu,  1 Jul 2021 11:40:22 +0200
Message-Id: <20210701114012.RESEND.1.I27436c29c3bede46dcf86df696f48683662d1ec1@changeid>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210701094024.1273759-1-enric.balletbo@collabora.com>
References: <20210701094024.1273759-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_024034_051702_9F5EB86B 
X-CRM114-Status: GOOD (  11.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bilal Wasim <Bilal.Wasim@imgtec.com>

When "bus_prot_reg_update" is true, the driver should use
INFRA_TOPAXI_PROTECTEN for both setting and clearing the bus
protection. However, the driver does not use this mask for
clearing bus protection which causes failure when booting
the imgtec gpu.

Corrected and tested with mt8173 chromebook.

Signed-off-by: Bilal Wasim <Bilal.Wasim@imgtec.com>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 drivers/soc/mediatek/mtk-pm-domains.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index 21a4e113bbec..c5ac649ae51b 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -60,7 +60,7 @@
 #define BUS_PROT_UPDATE_TOPAXI(_mask)				\
 		BUS_PROT_UPDATE(_mask,				\
 				INFRA_TOPAXI_PROTECTEN,		\
-				INFRA_TOPAXI_PROTECTEN_CLR,	\
+				INFRA_TOPAXI_PROTECTEN,		\
 				INFRA_TOPAXI_PROTECTSTA1)
 
 struct scpsys_bus_prot_data {
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
