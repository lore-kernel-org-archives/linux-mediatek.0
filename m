Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9549C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 10:58:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F11164FE4
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 10:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F11164FE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6QteCFvAYLQQjBTeNPZtOTNtCmHuqGwGgkYV74C/XlE=; b=GAJ0AZBUcFsFe1qOBUIhWDiIoQ
	RddzTr5EQjinYvWA+4poEuXMXTrpCig03QioxLZKQxi0aJPrgB1ZuB1svU+SkI/7DnCKQg0YOMjWS
	Ygz1GGesausBIISohEWBkVihLjxcNJFUaGSWWIHviyMZt9XSS1Cn583RPGM7KIbVBvpN3B2UgcNNr
	SwnDSjAO32QAiivFnlDx5uZdHLkpT7NP9a2szmiqdlTAC7XuTJ/W5Tl8QMDG+esvTXqZeA8PikRrN
	ktszRPyLx2pGzg4VI1eTfJkpLlSpLumnYqHs9ku/ks6D42M5zrYgysdV0ioL9memDnzqSNHylUEhr
	gCnN5lDw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJwXJ-006f2q-3N; Wed, 10 Mar 2021 10:57:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJwWh-006enZ-Ht; Wed, 10 Mar 2021 10:57:22 +0000
X-UUID: 85c62d5f456f4b5785ffc7347790d96f-20210310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=zU8eNoQnixlDd8qzGnyuh4B9Kns0qpOib9BK8Cchwy0=; 
 b=gMCqfGTIIzHiJlcxlKi3XEtjbwEGAWj35p2a3Frlg1aB6KGMvr/DvyNIsL5gidnluY2yNc8cIXXwoexUWSB4D8CdYQctobCFZxXouU4vx1AszXQ+zgD0N9OFSzXY7kLCgMZ8SOm5bDU/rLbQCq+1pnu4Q4BIeYgUzNEhTSXwffk=;
X-UUID: 85c62d5f456f4b5785ffc7347790d96f-20210310
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1163455005; Wed, 10 Mar 2021 02:57:02 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 02:57:00 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 18:56:59 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 10 Mar 2021 18:56:58 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Bibby Hsieh
 <bibby.hsieh@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [RESEND PATCH v1 0/2] Revert "mailbox: mediatek: remove
 implementation related to atomic_exec"
Date: Wed, 10 Mar 2021 18:56:50 +0800
Message-ID: <1615373812-16204-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_105716_425469_EC0F7468 
X-CRM114-Status: UNSURE (   8.72  )
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

This series base linux 5.12-rc1
these two patches will cause home ui flick when cursor moved,
there is no fix solution yet, revert these patches first.

change since v1:
fix build error

Yongqiang Niu (2):
  Revert "drm/mediatek: Make sure previous message done or be aborted
    before send"
  Revert "mailbox: mediatek: remove implementation related to
    atomic_exec"

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  1 -
 drivers/mailbox/mtk-cmdq-mailbox.c      | 80 +++++++++++++++++++++++++++++----
 2 files changed, 71 insertions(+), 10 deletions(-)

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
