Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EC7C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 05:53:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33A256192D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 05:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33A256192D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5xv3yH62Cewtl3f9/hXHz5eagqo17/91Dd8wrVTxsa4=; b=US0BPBgWeNOvu7F9OC1gXTZsQy
	HwXwvECJBrRg2/r35zq34l0BxSeqf1RsvJiiHjgwU++EVtCBOgm1zahHSe5drYsDl22wArPlHYXpd
	TmQXiwFbfYgrUmRDn2un0xuEQXcl/siVpapvy6NDG/LvqEEcWQRUm9k8NFMrqQcc9wNDr0chRO4Vf
	dBZtdQkOcSLXyMdC5c1ILgh0uc4RQn6m4++fdzpbUq0tQdIzr64Mb0HKsal27yBkm0G/0AwxPMmcE
	/l2uXL63p5/cIsAk+1LforkgewUrUALv7GC5T0TX3NytVvt/OkDyNzF9gtitFarfOM1v4OPRR+Cdl
	U5z54smQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lODVI-00AwwS-1G; Mon, 22 Mar 2021 05:53:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lODV5-00AwvJ-Af; Mon, 22 Mar 2021 05:53:18 +0000
X-UUID: 932a8760ee134133911f8732a2ab73ef-20210321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/Z2kt8nNbu9RB+lesnBZhNKowaer0scajPhDWmHAIpM=; 
 b=gfRb+AGP3qKQhEgtxkpQeGYlw8Wzko5leovNZhpGihZpOsh4it3VnA/SUGQw4e5jtfyiotramJiJ9w/acbJ5N8I9SqbDxqTi42oyMiPxtzsp8vaSMMnSPdb5jfymd5vGbFuib4/9BZY5vi49UHWLY19tPSoO/dPZ8tuCxFAtrdI=;
X-UUID: 932a8760ee134133911f8732a2ab73ef-20210321
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 77502328; Sun, 21 Mar 2021 21:53:07 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 21 Mar 2021 22:53:06 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Mar 2021 13:53:04 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Mar 2021 13:53:03 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <fparent@baylibre.com>
Subject: [PATCH 0/4] Add Mediatek MT8195 SPI driver support
Date: Mon, 22 Mar 2021 13:52:40 +0800
Message-ID: <20210322055244.30179-1-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: DFA52094B9505363474F86AB7C703C61050DCB637600FD4349E41A44D408118C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_055316_064249_ED5731B7 
X-CRM114-Status: UNSURE (   8.38  )
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

This series are based on spi/for-next, and provide 4 patches to add MT8195 spi support.

Leilk Liu (4):
  spi: update spi master bindings for MT8195 SoC
  spi: update spi slave bindings for MT8195 SoC
  spi: mediatek: add mtk_spi_compatible support
  spi: mediatek: add mt8195 spi slave support

 .../devicetree/bindings/spi/spi-mt65xx.txt    |  1 +
 .../bindings/spi/spi-slave-mt27xx.txt         |  1 +
 drivers/spi/spi-slave-mt27xx.c                | 36 ++++++++++++++++---
 3 files changed, 34 insertions(+), 4 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
