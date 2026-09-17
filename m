Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CC5C982D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2026 15:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74yEEtCWYGlmpU2Ug1OwwzMYLRDcIaEn/Rs2+G6Scsk=; b=q4iWYpftP/EysiEY/5QWP4QmnS
	nqwEEwwpCK9MkRaDn0mYCn/uQ5d1sy5jCGwAIq2O92JhN0n0rB22YUtyCwSb6smoUnbhBNJpVoc+J
	bIs7pi8ZrjBSPIep3TYHYkVG1LnRMjy0Nip8fHAgpNHZMXah1MBxxgZRx17/BSAKf82o9/jh6ndYF
	0yymyPayRZ4m6xsYAgNLeto+gxSJPvi3j1u5vSasfUw+xOwSFK2nLDEqkRHJZJLfSyRgkgWoK/wsQ
	gqvW1UHkBUZLs+IPGt2S5qFsHqi5hwhRyvaOyLvXkf6RsqSz2lTVY3L71f153Q7wom9/PZD+a1kln
	unyUxUOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ELj-0000000BkbK-1wrW;
	Thu, 17 Sep 2026 15:48:35 +0000
Received: from out-246.mta0.migadu.com ([2001:41d0:1004:224b::f6] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ELf-0000000BkXX-0JPe
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Sep 2026 15:48:33 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=OT+/yVmtxXayw7zlWQbeNg/PbunauEOYNtUr4VfcRoM=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789660106; v=1; x=1790264906;
 b=OFTx8xd1g7y/PvhGL955VupUMsKVhJMRZDcgUfGJJS4N1ZYHU5bHS4JdTyhRl6OQFHW3ogV0
 pUEHU6goNMlnXAGicxJ1eE0qdLZ38Faw+gwkKsW2cS9+T8pi8iEwnCiYh/ZyBj+ocPO4DQaWDO7
 29oAR4F3ETNLJT7+O7lzszMxPQ0LzL9U2bq0h9C6AEaA3nkwofvVfa58cdYSztSIlPU6oRqBn6p
 vvUImpm/BUFqIbE8k57Pre0s14JhX3fYRXQNx2C3xlXg1JimV1tfxDRwn3CVyfxRaLPuZJRttAH
 TuvG7JNuzJrxp1jkLBoPsxYQtSazh42CzmTy2YIk8MIKA==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 925e810515962063;
	Thu, 17 Sep 2026 15:48:16 +0000
X-Mizu-Trace-ID: 925e810515962063
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	lorenzo@kernel.org,
	eason.lai@mediatek.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH] wifi: mt76: Fix skb reference leak on USB/SDIO tx_queue_skb error paths
Date: Thu, 17 Sep 2026 08:48:13 -0700
Message-ID: <20260917154813.5823-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917122058.2150817-1-vulab@iscas.ac.cn>
References: <20260917122058.2150817-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_084831_696255_025603E2 
X-CRM114-Status: UNSURE (   6.64  )
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

Wentao,

Thanks for catching this. The USB half is already fixed and the patch is
sitting in Felix's tree:

	Eason Lai, "wifi: mt76: fix memory leak in USB TX path"
	v5 posted 14 September, Fixes: b40b15e1521f, same as your USB half

It does not cover the SDIO side you are patching, so that half is still
open. One thing to fold in before you respin: frames the driver wants
transmit status for go into a per-station table, and freeing one outright
leaves the table pointing at it.

	mt7921_usb_sdio_tx_prepare_skb  asks for status every HZ/4 per
					station, then puts the frame in
					that station's table
	mt76_tx_status_skb_get		sweeps what is still in there and
					reads a flag and a timestamp out
					of each entry

Eason's version marks the frame done and leaves it for that sweep to
reclaim.

Devin

