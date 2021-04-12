Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C37C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 11:20:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6D7960FF1
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 11:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6D7960FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HGLQIbzbAiAWmU5zPQ9s6LBjnBpwOX8I6kIldNHsIYU=; b=mMMe4cBZIH0zlCkfAYZa59Nsm
	bsZLZl19JIp0344MIkcRUnEok/1w2I0rKM8lDnsuUeyCc8H3Caz3ftWGvh9YNEFGJ7Qxs/0b//Llh
	YzSZMHYUlWaJLjimKDVDFo/k6R3olzN7KN6vGZ55OQvaw+sIzBdO/2ywlg6O+CjlE3KnanPSrT+7D
	+ESO4GprDRlvOqgyVwd1nAZaZs9tpfvSqaqNQApcJ/Kox+6uZEfDUT3ei8Ia3v/AWS7TfJnJeuwhb
	7hoT7S13xNFhsGvC7hni9Xh/31E6FtkOPl7+9iSo1h3a6rRVNipfiRk9uokj6BWcY4pGisBf1ncuJ
	t8m3/IrEg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVubq-006WQ1-Jv; Mon, 12 Apr 2021 11:20:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVuau-006WB5-LO; Mon, 12 Apr 2021 11:19:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=6ZvkNAvUSm9jSjWp16RrMTao69EDroKNjaQgT7nOR48=; b=03iZ542W6F9dFjR3d3y1+7trZg
 GF4XSZ5Cph+9+aWE9i32hu/wqPakODXQ7tJVqXfGUckuCmZJLHe5B5V08ld6UBEzqN5JLawZGAWHn
 XOgoIuvoycL01DN+61IX5QmamDPeSB2zDO7RAso+484YdiyE/AYM89Mk0yKvkLOFUNSd9lwNh9R3R
 fN2LPGcxC1++qt+/g3QO7YpRD6JvAjAigJidKE/0PYDJOgAxjQYLr66CIrY4hr3dK+lvU6YTfxIWi
 mGTK/SJXPnQmZ0HqIHgxvAPeXGZ/4JUMWEshKWZqBdRFVizQDxeLeQF9KYRMw3VR/dgz5nyiMvASo
 KyXd6hpg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVuar-006AGQ-Kn; Mon, 12 Apr 2021 11:19:03 +0000
X-UUID: 69469beb59c04b38ab4622bd51a9bef7-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6ZvkNAvUSm9jSjWp16RrMTao69EDroKNjaQgT7nOR48=; 
 b=kDQqDnszW+Tihs/KS91Nmf6FqL4noUjpJC8X7xk79np8zZ9gEWkCTpNjqZYdq6jDP+23U7w+zfM3v+pTTxFBJk7uFmvF1k/OFWVFNDhjJnAsPPqogWnjndes17MooJmsE+dKx4IFKHt7feRzgpF60KbKuz6mIBK0TrZ7ie4K52Y=;
X-UUID: 69469beb59c04b38ab4622bd51a9bef7-20210412
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1370439509; Mon, 12 Apr 2021 04:19:00 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 04:18:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 19:18:56 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 19:18:55 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,
 3/5] Revert "dt-bindings: mailbox: mtk-gce: fix incorrect mbox-cells
 value"
Date: Mon, 12 Apr 2021 19:18:43 +0800
Message-ID: <1618226325-31927-4-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_041901_711837_F20B81CF 
X-CRM114-Status: GOOD (  11.87  )
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

This reverts commit f83b03fc727ab56a77e68713d6e40299698f3c9f.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
index 7771eca..cf48cd8 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
+++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
@@ -47,7 +47,7 @@ Example:
 		interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&infracfg CLK_INFRA_GCE>;
 		clock-names = "gce";
-		#mbox-cells = <2>;
+		#mbox-cells = <3>;
 	};
 
 Example for a client device:
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
