Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0459DC12002
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 09:38:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB16D6108B
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 09:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB16D6108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b36bvzMwt1/dUdz77QLh2K+kVSyPF80fvAtSsBtmrzo=; b=DHFVOnkdDa8Glf
	nqw9Ym4IPIULJeDbz9SsFdZreGS7JSK5W/V0IDHvW8NxCKEtU5mNnfZ3Ita7VXPbfwOhmDpkbN6/Z
	eTor10VKJkAilAHYOH4PiEpQuxnw/bkoipnEqH1605GdPgZI02hCv98zQL2bCPnKzwlJRQC+llOKk
	QUGdw2THvBv+mOEs07qDhujnnOyrpHPVZEY9m+6MP0MoK0fuON2/hd05B2ygRmjnyWlhU/Wfdu08N
	DNT99PU6mJ8RVBCpSmaxXk0lycqDISTlMhl/q387RinRhsaT40l8uMcokVa8sJqoJMw1OQWpKwo5F
	DB9Y9IhsvAMkcWtZXJnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Pin-0097LS-Dt; Mon, 19 Jul 2021 09:37:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5PiZ-0097Im-VH; Mon, 19 Jul 2021 09:37:45 +0000
X-UUID: 50149514e1b04a6bb16d2cb2a66c13b7-20210719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=t2NRoXAiy06+RGtUz854em2EKgDOeHNiA2thWLVB80c=; 
 b=huO1CBAEBwDR5LSj7tMWR9vBmnM1G/TfVuSnc/5I7CODIfMT6LVrSO30hsfDncP4Oej/RoYsYCFbQUwe/bMB4pey7LzIwjDu+MpVPjzQpK1r2HZaioIK5cHFEMGXQy6/RNzpiWFWw0XciCA0RQVFgaMyA/IzWAOwIrWnaPWnHTU=;
X-UUID: 50149514e1b04a6bb16d2cb2a66c13b7-20210719
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 733964070; Mon, 19 Jul 2021 02:37:41 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 02:32:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 17:32:41 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Jul 2021 17:32:41 +0800
From: Mason Zhang <mason.zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <leilk.liu@mediatek.com>, <wsd_upstream@mediatek.com>, Mason Zhang
 <Mason.Zhang@mediatek.com>
Subject: [PATCH 2/3] spi: modify set_cs_timing parameter
Date: Mon, 19 Jul 2021 17:16:43 +0800
Message-ID: <20210719091642.24633-1-mason.zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_023744_065826_F1FBF7A6 
X-CRM114-Status: UNSURE (   9.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Mason Zhang <Mason.Zhang@mediatek.com>

No need pass in spi_delay to set_cs_timing callback.

Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
---
 include/linux/spi/spi.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 651e19ba3415..fe027efb85c2 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -553,8 +553,7 @@ struct spi_controller {
 	 * to configure specific CS timing through spi_set_cs_timing() after
 	 * spi_setup().
 	 */
-	int (*set_cs_timing)(struct spi_device *spi, struct spi_delay *setup,
-			     struct spi_delay *hold, struct spi_delay *inactive);
+	int (*set_cs_timing)(struct spi_device *spi);
 
 	/* bidirectional bulk transfers
 	 *
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
