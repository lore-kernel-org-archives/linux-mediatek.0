Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B1FC3B195
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 04:37:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5985720848
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 04:37:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e1padU2U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VIEAdEWK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5985720848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GRnMQYg5kdRanhTs4gLVawCAtafeT2KF8FhW+JGPDNA=; b=e1padU2U5PlD+7
	uOu41PaDVkl/t4XBGzEboPqN00nKILKclI1LSj0W7jmXrT5G+YIbpzi5unxUhkXsX1C3dnHeicARC
	aqdwVlybq8Iy54IF5vjh9iQp1lNH2/5blFtT+lrlZma7ajK1iOCUVW4Ddn+vSr6w0RwWviAn+YRmC
	cq26PFQY14zghf6DT3dhJnQQ089Ee8qTUVXsQDMGbQJPVIMk9HzdSd2NPkfPOZX6aF7FvbBU+kSaS
	w27MlzTJE87dgTsEy+lKkeGDXICcaoD4e7AH7ecnLJQ6RvSW+5nBBdq2VeWiRgDmJ25Nqmyfb0w3o
	whVqKCSKtEuP4mp0YL8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2Sje-0006H5-O6; Fri, 14 Feb 2020 04:37:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2SjE-0005sY-8a; Fri, 14 Feb 2020 04:37:26 +0000
X-UUID: baa1252ce7db45f188ad29ca53ff206b-20200213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=sOXRtKwjw1Ahc1rly56OaA1QzNe/iiZaYY1UpQs1y/g=; 
 b=VIEAdEWKZU2dx2qC57jM/2WPVYo4Anw0ZUKG0nHAyWMs3TzyRnnamaYz1t8Up7eUUroJETTcTOFyN72sq5MECl2fhjQLbNq66jITeAIN74dRFwFzUdOKbtDkD93FvbezvOxxQIH0U4y4zu4DzcgKtCfyDsoTJyB3+3UA8MRmtNE=;
X-UUID: baa1252ce7db45f188ad29ca53ff206b-20200213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 361430082; Thu, 13 Feb 2020 20:37:22 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 20:33:26 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 14 Feb 2020 12:33:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 14 Feb 2020 12:33:18 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU
 <ck.hu@mediatek.com>
Subject: [PATCH 0/3] Remove atomic_exec
Date: Fri, 14 Feb 2020 12:33:22 +0800
Message-ID: <20200214043325.16618-1-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_203724_309120_F1D273E4 
X-CRM114-Status: UNSURE (   6.40  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The atomic_exec was designed for processing continuous
packets of commands in atomic way for Mediatek DRM driver.

After we implement flush function, Mediatek DRM driver
doesn't need atomic_exec, the primary concept is to let
Mediatek DRM driver can make sure previous message done or
be aborted (if the message has not started yet) before they
send next message.

Bibby Hsieh (3):
  mailbox: mediatek: implement flush function
  mailbox: mediatek: remove implementation related to atomic_exec
  dt-binding: gce: remove atomic_exec in mboxes property

 .../devicetree/bindings/mailbox/mtk-gce.txt   |  10 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            | 126 ++++++++----------
 2 files changed, 60 insertions(+), 76 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
