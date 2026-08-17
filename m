Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3428EC5B572
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 01:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTXaudvWoxuGzfbgjUkmdWyCX58/fNvRPaDbXsjSX+0=; b=TJJC47jNpdkY5bQyYPPvJRxJoa
	r2VeRmSVGvcrGrx6/5oPu4LCwALbwX71bMzyWdl+bBK5FCJIOnxbwHirtAmYQsg0By+L1c7Lvg5WT
	LMtIZZ2GwdTi497ATb7wamUCyKKeUhJnWCGUT88lGmebxa3dsaW7wQzkf+4ydNSecCQ3wx7yLgyH7
	dQBFjwhGZvBRMIOnJg+CW8b0zoIuPRsJu6MQJ9VVbfP9/K+h4osjbp9ZnFK3Br5JNL9u6Dw9k85SM
	nnmKImKl1w3ukesMxOFgUMt/6w4koOCeRtY5ZrFylOworXAQ/0/aGSnocHBrPojSniEIOM/SUmvwO
	yAf5tIkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvmML-00000005Ges-1uPM;
	Mon, 17 Aug 2026 01:41:53 +0000
Received: from out-105.mta1.migadu.com ([2001:41d0:203:375::69] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvmMH-00000005Gdg-3NJ3
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 01:41:51 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=DJCwPNFqhWi0MlleUBlxxtcVRk7WJHfmQEnRLHVll7o=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786930903; v=1; x=1787535703;
 b=VS6FYMjn0HMocvmq9fgmwO3dOwvRtgYkmQjOxoZe9gYBSxQ20oy9oBQELnqgPamrSHbV66oT
 EbfdCeh2QG0r4Kcu57SFIpPdVrotpuAejQtAXCZNxNLh8jhmJSb+bQHuGqC1AoH+oeod0jnGlh5
 5D/ia0EI37sg9R1TE3rPnRK62QeenXQd+yn9JJdnf7Yh5oWrDpl1ru2h1eY1j5Rc5Y+O4ZbedmE
 optQ9VFSZPyZDdeBAAdG5fkk0IM8rY5NLlZT+TRl6lPcoAcPvquEFNxxYjqHIRlCWfEn8KF1I15
 oWVDaGLItvjnrgBSxOiGOU7qqguSZsrlVTBBy+KqTMd/w==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: from fedora (2001:569:be59:c500:b340:3f2c:4486:21c1)
	by smtp.migadu.com with ESMTPS id 10df0a6bf6b43069;
	Mon, 17 Aug 2026 01:41:43 +0000
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Eason Lai <eason.lai@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Kun Wu <kun.wu@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Leon Yen <leon.yen@mediatek.com>,
	Litien Chang <litien.chang@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>
Subject: Re: [PATCH v1] wifi: mt76: mt792x: fix memory leak in USB TX path
Date: Sun, 16 Aug 2026 18:41:40 -0700
Message-ID: <20260817014140.68399-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <af39515e4277cb0c8079ed172ac8e0fccc106063.camel@mediatek.com>
References: <20260805073812.1433126-1-eason.lai@mediatek.com> <20260806222922.30384-1-lucid_duck@justthetip.ca> <af39515e4277cb0c8079ed172ac8e0fccc106063.camel@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_184150_182078_374D1233 
X-CRM114-Status: UNSURE (   5.35  )
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

Following up on the first hunk. Looking at that path again, there is a failure
behind it I did not account for on 08-06.

mt76_skb_adjust_pad() calls skb_pad(), which frees the skb on failure, and
today mt76u_tx_queue_skb() correctly returns without touching it. Routing that
exit to err_free_skb: frees it a second time. Special casing does not help,
since skb_cow_head() on the same exit also returns -ENOMEM and is safe.

The prerequisite, in mt76_skb_adjust_pad():

	-	if (skb_pad(last, pad))
	+	if (__skb_pad(last, pad, false))

It reaches mt7925 and SDIO too, so probably its own patch ahead of yours.

Worth flagging as well: mt76s_tx_queue_skb is not a model here, it has the same
two exits and the same missing free.

I have mt7921u here if you want a v2 tested.

Devin

