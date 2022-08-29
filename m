Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E4CECAAD4
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 20:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z2s4JgBDBVm5P/0vJMB3iH3qhoDgjdoNyxQoePpG/0o=; b=NzcKXksUCVtsSDU9wHXHgyOmxV
	QdV6LB2xI6fRBS03EKb6gwJL5MouMPihGz04FbCWnAlZgplyAYPBAoWdFIjunI10PuOMHa2UZyDk1
	SgujEFGU7cOI2ltPOkq1DV9FobrEt+9GfGUYvZpmCsLaoXVxetp+4ZYkjvvM6yOJ1nkJpBkJUAUaL
	pOoPvgWb6xTHFNpiAADYwoBlbw2SsZwP51yUxIxLy0H20s7lkrpaLPVncPfi03/YxSnGVpNVHjYzi
	fEDsOf+hFa7ns1HFrqIEkkGsKoJCM/hAHra3xlT6Hc+QR2P3483OoCssmz2U8BItaNpwluef/UDIS
	XosTDGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSlcz-00CfLI-52; Mon, 29 Aug 2022 20:45:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSlcn-00CfJk-IP; Mon, 29 Aug 2022 20:44:51 +0000
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D2ED56601E60;
	Mon, 29 Aug 2022 21:44:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661805883;
	bh=56t/P/UzpgnnweTlfOL3hudUR1zs7PONQt/DyaRaMG0=;
	h=From:To:Cc:Subject:Date:From;
	b=F+F5kD919uaV+N6QmLPLmUqAsZh38RTmqX8AjvekKvya1KLKDTk6SAue8XVe+d4u6
	 HIBKezp12bUQtO2Wqm8EkKUbS48Y+jzOMzjLHnm4MxbdUD1xDWVJMLj1wSA2rEZGqr
	 0563ATdHgaUy9lvDt4+7Ujmj+XIJuNbhgq+LUXjscZ8J4QSlQ/f26pfYZyj2RSBzfa
	 mQ8OS6BsW/ZgBvLBniU7zxeLlwJA9z49iKLtYKf2LuTA3gq+4RIAAo3YVSP8tdsu9K
	 zQVHKCbaw9uWJKkWK3yBKyrZ2OBlOgRBLdhVkHVAMZff4pIc4O8MOLjDStJY5RpzmD
	 2v9Szr3OvY/lg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] soc: mediatek: mtk-svs: Explicitly include bitfield header
Date: Mon, 29 Aug 2022 16:44:39 -0400
Message-Id: <20220829204439.3748648-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_134449_859568_7E9A7C52 
X-CRM114-Status: UNSURE (   8.89  )
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

Commit a92438c5a30a ("soc: mediatek: mtk-svs: Use bitfield access macros
where possible") introduced the use of FIELD_GET and FIELD_PREP macros,
which are defined in the bitfield header. Add an explicit include for it
so we're sure to have the symbols defined independently of the config.

Fixes: a92438c5a30a ("soc: mediatek: mtk-svs: Use bitfield access macros where possible")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 drivers/soc/mediatek/mtk-svs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 64dba9f830f3..f67f3e971653 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2022 MediaTek Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
-- 
2.37.2


