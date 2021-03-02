Return-Path: <SRS0=N2rV=IA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD02C433E6
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 10:14:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A8FA64EF1
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 10:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A8FA64EF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jnKdM18dgUNHX8LkXO+TopGXbgpinllP0ksHwRcq8YQ=; b=KJHXrU2j+fieJz811NjKzDHg4S
	zDiiPQiAJEJf5vxy70t7bFktBdZhpFgh68X1azWwPamHwy9gEZosLOn/p4pn0jMFAMYx6CDge9Qj9
	uNcoCXpEHdgzgwlw3j4NzsmGccrqzbxma44cFAiB0cRhXg8klOrpp5y2DSq+efsuZ0HvFKUzXWFlL
	oOOw0EBkyQ6/yDZ+kcmo0QTqLzAQr9YVbI7heW5lop8C9TiW/UbiGDbBlnp0q62yt/EWhXhKoZAgh
	J6fZ8BF/I8rD1liGppTBtqcEUD8ScORTWK/haGZ7BBuLAJCfNTOokZn592CqMNTAPGGk+LewBXBTL
	X9yfmi0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lH22R-0000e7-Ak; Tue, 02 Mar 2021 10:13:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lH22M-0000a5-T4; Tue, 02 Mar 2021 10:13:56 +0000
X-UUID: da3e4fd88e8d4d3a8ca4cbb54efe8b10-20210302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=YgyNLe48bevq9tgHZa0vXzlzxizB0lIsC/sfyPUm0VQ=; 
 b=DBJtlqZXPjkqsaiVrP2Qjwr7+OqxxrQKu1icnX6pQcTkbjWVlQeAcUz8vjV3e8CI6wCunUZ/xcErDSrYolwlqzF0fvdJVbBL6M6z+gMOvyJoLuwfahkUbPG0mkOz1CMTKidH4BASZsFmSt7yRu5/HGV4VSiaGqV+yAV1sn4s0wI=;
X-UUID: da3e4fd88e8d4d3a8ca4cbb54efe8b10-20210302
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1296398912; Tue, 02 Mar 2021 02:13:51 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Mar 2021 02:03:49 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Mar 2021 18:03:47 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Mar 2021 18:03:47 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [v2 PATCH 0/1] net: ethernet: mtk-star-emac: fix wrong unmap in RX
 handling
Date: Tue, 2 Mar 2021 18:03:44 +0800
Message-ID: <20210302100345.27982-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_051355_185031_ED23DFE8 
X-CRM114-Status: UNSURE (   7.51  )
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
Cc: srv_heupstream@mediatek.com, biao.huang@mediatek.com,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, Mark Lee <Mark-MC.Lee@mediatek.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

V2:
    update the comment for unmapping the old skb

Biao Huang (1):
  net: ethernet: mtk-star-emac: fix wrong unmap in RX handling

 drivers/net/ethernet/mediatek/mtk_star_emac.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--
2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
