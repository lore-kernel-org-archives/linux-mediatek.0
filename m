Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399E2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 09:47:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF25361076
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 09:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF25361076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+7ORKg5M9U3mVGULsaaVNkbANVv0X+GGj2CN1Jq1R/w=; b=5BQUsA/zldq40A
	ThKmgdu8wGJzCZUGVVZnxNKnjyjCqMmA7UXkKiwItMVRc3RmBbbXlZkH4XEXKkY66qkwcsIur8EYy
	Jk+aV9+QMOwAnmFaYOVlcIiqKAOkggcmWB0zBPbLa+x2HQ/Z4w2QNZw9LBl0MD0y8f9fByV4PPXXG
	QoTBoJQ3oUI2Fp6y5gxypkCUuyWxCgw1woJrdBA8PKaV4C6LtYgTN1jK3hgIo2bhzjweQ9il7WzMF
	q3hKGXfCRa/0KqFU7buMxbqCcgzM0Slf8JUq4FYUOoAZrkt6EBxqQ0YtbV1Kc8mrFr/A59lUBpBUo
	yyViwEqJd/hPPqsUHPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mThni-00Dxxm-78; Fri, 24 Sep 2021 09:47:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mThlD-00DwNY-Vr; Fri, 24 Sep 2021 09:44:53 +0000
X-UUID: 9b29e9418d1c4ff4ab7f6ae6b53c6341-20210924
X-UUID: 9b29e9418d1c4ff4ab7f6ae6b53c6341-20210924
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1573710655; Fri, 24 Sep 2021 02:44:49 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 02:37:21 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 17:37:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 24 Sep 2021 17:37:19 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Miles Chen <miles.chen@mediatek.com>, Bear Wang <bear.wang@mediatek.com>, 
 Pablo Sun <pablo.sun@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: backport commit ("f421031e3ff0 net: stmmac: reset Tx desc base
 address before restarting") to linux-5.4-stable
Date: Fri, 24 Sep 2021 17:37:19 +0800
Message-ID: <20210924093719.16510-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_024452_076195_D99EF2F2 
X-CRM114-Status: UNSURE (   6.32  )
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

Hi reviewers,

I suggest to backport 
commit "f421031e3ff0 net: stmmac: reset Tx desc base address before
restarting"
to linux-5.4 stable tree.

This patch reports a register usage correction for an address
inconsistency issue.
"If this register is not changed when the ST bit is set to 0, then
the DMA takes the descriptor address where it was stopped earlier."

commit: f421031e3ff0dd288a6e1bbde9aa41a25bb814e6
subject: net: stmmac: reset Tx desc base address before restarting
kernel version to apply to: Linux-5.4

Thanks.
Macpaul Lin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
