Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69E6C48BC2
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 06:25:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC9E661404
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 06:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC9E661404
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pYF+XeF3RAV/L6egnScnS0u/n4MSwNut1QQFthoCC00=; b=Hh19ZG33H/F/vB
	ILsM1OBjNWW4eFf9XanvbtzMNN54pn6eqGm+Ls8i8Tc2BITge3/K10loWheLwi4OrsfCTUE+CdjOh
	p316uzClJCvAtJSREwUe1kK2vxkAzkPC+YL6ZroefZtvuPP9p6DE8Em8s8PCDBqVuz++w27Kwh2rb
	OE024v9WCZigHrjzTUJI7z+QG/MlZd0IlcvBpxgC7Pu5jV0Pr4ISlROTlttAX5maEfucHTEQKysvT
	kVoV2P7n2QrSPzW6FUrTPYIDVCt1mBfpRtQGGBUlBzlnWNVo43p7E8PMsaDbZf7lGnQZZmTyZpGwG
	XkSFW+sOlff638AUAFfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwfH6-00HOnA-TV; Fri, 25 Jun 2021 06:25:12 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwfGt-00HOkB-VF; Fri, 25 Jun 2021 06:25:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id E80A21F442CC
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: eizan@chromium.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, drinkcat@chromium.org, hsinyi@chromium.org,
 Collabora Kernel ML <kernel@collabora.com>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: mediatek: mmsys: Fix missing UFOE component in mt8173
 table routing
Date: Fri, 25 Jun 2021 08:24:48 +0200
Message-Id: <20210625062448.3462177-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_232500_177711_1ABD62A9 
X-CRM114-Status: GOOD (  11.31  )
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

The UFOE (data compression engine) component needs to be enabled to have
the imgtec gpu driver working. If we don't enable it we see a black screen.
Looks like when we switched to use and array for setting the routing
registers in commit 440147639ac7 ("soc: mediatek: mmsys: Use an array for
setting the routing registers") we missed to add this component in the new
routing table, it was present before taht commit, so fix it by adding
this component in the mt8173 routing table.

Fixes: 440147639ac7 ("soc: mediatek: mmsys: Use an array for setting the routing registers")
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 drivers/soc/mediatek/mtk-mmsys.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index a760a34e6eca..11388961dded 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -209,6 +209,9 @@ static const struct mtk_mmsys_routes mmsys_default_routing_table[] = {
 	}, {
 		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
 		DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_RDMA2
+	}, {
+		DDP_COMPONENT_UFOE, DDP_COMPONENT_DSI0,
+		DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, UFOE_MOUT_EN_DSI0,
 	}
 };
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
