Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2432BC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 07:43:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB9D564FDD
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 07:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB9D564FDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pS1Cfg3OjfAdgS+5qj+7qUNEVmJP3ab0OgpvjXr3kHo=; b=QManoQofNsoTRqSj7D57llBla3
	xwlocTWlhADVjfn/tEtp+0oxrckRy9JCu3+eWTAf1oVBTHCYWIXARdhJm5hez8kkVksVsXHN9bbaG
	XjWbtW1HnhVqpHxLuP6mK6VQz0gKArqw+JSCYL2J9B6fsZsruquI66yJD4W0ry4h1aUHtq4BkKvuO
	ZWep+i19P2sawI0sSJ9mVS2jglZ4gqxpieVj5Bbni1OBRr3DnINQWyKfTWW6irsekZV0eBUsT5UrI
	mYDGr0KBlxeJ8u1RDf4ar5BEB66GlgDSBgwxfuryQCLzU1sl+9FUn/jBPxvWvJd1SMggBEESDKir0
	FeC0AmFg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJtUl-006Eu2-Sp; Wed, 10 Mar 2021 07:43:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJtUI-006Ep1-LH; Wed, 10 Mar 2021 07:42:40 +0000
X-UUID: e0fa32a8ccc24e3d94fd65206668772d-20210309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=x6tNxEdf4wh1tMPb2P/LSxDSdLUJ9uyGPCYPp6QHLIE=; 
 b=ctzjSMyzCsBowghXETlMJzfdcLiRtohSqQxQCO5ZNgKFgf/Oi7RqhlBJk1It1krA/npr4oy/7wbDr/ZjMh+kAAOtAuK+d4wLvd18qGD8HxEWcwyiag7XT1Q3ST1VfFMPcBnSX+Rs9lxtj1xJbt1bC6t9Ni+2pc2JIV9EoBwHGVk=;
X-UUID: e0fa32a8ccc24e3d94fd65206668772d-20210309
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 539975984; Tue, 09 Mar 2021 23:42:20 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Mar 2021 23:42:19 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 15:42:17 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 10 Mar 2021 15:42:16 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Bibby Hsieh
 <bibby.hsieh@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1 0/2] Revert "mailbox: mediatek: remove implementation
 related to atomic_exec"
Date: Wed, 10 Mar 2021 15:42:10 +0800
Message-ID: <1615362132-30603-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_074235_552735_1F346F2B 
X-CRM114-Status: UNSURE (   9.11  )
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
