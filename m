Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7B2C07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 10:12:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F47E610FB
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 10:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F47E610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9kYtspKWlD4mlQ0EbdMzvZGVAhzT6XHi7Qqu9aV/8kA=; b=JTiBWgsl5DcNDj
	I1KXEbNcR4Y7kMPyNyzO6BM+1h1QA4a7nQmSpV6lN2tnaZtm2yB6IxtFGDtnxNPFI6cTX5jbw9obL
	kix7g1cBZAqnnEW7ej9Xpls37689pbURkwAF/oTy+L93NTGDjoVpO94V5pmaac6FG07rA6KWs0/Wu
	t4YvV17kx79D+g3BxuZ0u89KTc+OdK5M8P8NhGj8/601GloRFHyip8YX8cPDXSPD13O/uxwssBQkh
	sVMnPa5r1oE3l7HSK4o0q42ORU6ZSxWrT3ZyYVCCukc5yJqB4xIdnz2Y5S+ef4GFpVn/eFa4CrdVZ
	QSONeKpYYrZpkoFUWmFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5QGR-009EEa-T4; Mon, 19 Jul 2021 10:12:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5QFn-009DzG-KL; Mon, 19 Jul 2021 10:12:06 +0000
X-UUID: f60a16eb93654e2f95d92d37cff88703-20210719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=z1uukciGEySS+EahaSgPOLaWGYrPItoBu7oMbaEvhp8=; 
 b=Kc+f5HV85QZr1muExiraznjSw3vd3AITopCE8tPlzBNFMFTNPdvywhCfCfcgmvSJ0lDuLioA2qdCMl05F7EITxbc2X5TQH3hRjWVA9CRfKl7eT6qVJ2lT5sx/c9ySycD1WZ7l1kzTPiLdgWSgLnXaUlrD3eLoxU/M8WGmMfQ4VU=;
X-UUID: f60a16eb93654e2f95d92d37cff88703-20210719
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1508660128; Mon, 19 Jul 2021 03:12:00 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 03:01:57 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 17:31:44 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Jul 2021 17:31:43 +0800
From: Mason Zhang <mason.zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <leilk.liu@mediatek.com>, <wsd_upstream@mediatek.com>, Mason Zhang
 <Mason.Zhang@mediatek.com>
Subject: [PATCH 0/3] *** spi cs_timing restructure ***
Date: Mon, 19 Jul 2021 17:15:26 +0800
Message-ID: <20210719091525.1453-1-mason.zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_031204_055502_8EBC43FC 
X-CRM114-Status: UNSURE (   9.02  )
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

Hello,
This patchset has restructure spi cs_timing, as we know spi core has
removed spi_set_cs_timing() API, it is a correct decision because it
asked spi devices to call it in one more time.
so we need find another way to support user set cs_timing. Actually,
spi_device set spi_delay for cs_timing is enough, and about how to
set cs_timing, just put it one the master driver.
We have test this patch in mediatek platform, it can compeletly meets
our needs.

Mason Zhang (3):
  spi: move cs spi_delay to spi_device
  spi: modify set_cs_timing parameter
  spi: mediatek: modify set_cs_timing callback

 drivers/spi/spi-mt65xx.c | 102 +++++++++++++++++++++------------------
 drivers/spi/spi.c        |   6 +--
 include/linux/spi/spi.h  |  23 ++++-----
 3 files changed, 69 insertions(+), 62 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
