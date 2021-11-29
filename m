Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBC1C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 09:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Caj8t9HyIToHQ5tD0TOty8+ASRFv2mF/BFottd/SvO0=; b=PnRqtvYizzrVv8
	svvfaNCigAAkTUHs7vlrZaFh8jigzV2wyxhdXaZgVMFAwdIWxr5j0SnvNvm0mslAYLvFgMBrdIWOZ
	cz4QcGKhs7C922/M/ZNBajI51D69kJOIXOJB4Q9KGVAtYJGql4xSgZ1OZr08fDYuB/bj6UFImWDsR
	BDIC2GF3lZn6pRp0SoC35EFHWlJlPDSGkQqaW2q532gYhUrtC2jWS+tKUKK9v4WCCsGQ4yqY+iXe7
	k9qeTmKrLjWBgENAP9JjGyIn1oTbUywwE6b0F66TGyPSwH1IvFA5qN97m+P7LwaMEAzmsb+pTWGvV
	2tEeg1TmFs2d1cxUCKOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrdH0-000HzJ-FF; Mon, 29 Nov 2021 09:48:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrdGR-000HXv-BP; Mon, 29 Nov 2021 09:48:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE69661256;
 Mon, 29 Nov 2021 09:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20459C8CFC3;
 Mon, 29 Nov 2021 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638179277;
 bh=50op9YAtX0/PCCZuHHAdCtTsRwW2P9kyuSBk3Zk50fM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Oki8XiQlbzy0bzjG3M7lzh+UspuiW0aj+E0AudObl3VBhss3bB8v3WrDKSjA8Ld/Z
 aNvZvy9NXWEZ3Adm2/S16ADKTH1MGJ3PC6UZc7aNlMTGOKozWz8oRSe1BSRomjbePZ
 PmWDVXyBr03dy2eDubT4kEY5bQScrvOPYF7METmZ1UoG+UUdII+3+P+7+Hg3AQN3su
 E9Oxf+G4F4WGNwWIZqKA5C3UqgPrzYlfhKZWRIfOi7SMS/agARzf9LvyiOQAgGbz9k
 bsn9vTwcQJn6uz23kO3ELjb6FLqKddPr7895vs/w7gv0CM5GWuyL6QABnjsTcxpaTr
 gyCnfSIRMC5Cw==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1mrdGN-000RC2-0a; Mon, 29 Nov 2021 10:47:55 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 18/20] media: mtk-mdp: address a clang warning
Date: Mon, 29 Nov 2021 10:47:50 +0100
Message-Id: <c6e2bedaa593ba764d3cafbe7940005e6b0b594c.1638179135.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1638179135.git.mchehab+huawei@kernel.org>
References: <cover.1638179135.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_014759_465176_542F8A3F 
X-CRM114-Status: GOOD (  13.81  )
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

The typecasts at the dvb-core generate clang warnings when W=1
is enabled.

Such warning is harmless, but it causes the build to break with
CONFIG_WERROR and W=1 with clang, so do the cast on a way that
it won't produce warnings anymore.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

See [PATCH v2 00/20] at: https://lore.kernel.org/all/cover.1638179135.git.mchehab+huawei@kernel.org/

 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 976aa1f4829b..3d38793aaa25 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -148,7 +148,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		comp_type = (enum mtk_mdp_comp_type)of_id->data;
+		comp_type = (uintptr_t)of_id->data;
 
 		comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
 		if (!comp) {
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
