Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2241FC56208
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 22:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aNV4uXbDodbnruGyVrOp44eaeJJKSwZaU6AGbof4wsU=; b=WxvNqtU5KEz2nt61Ty+e6+Uz1R
	4fp+PkJi9fOOSahsOi2NWDOyBTZZ2fv7U8JPr5XlvLl2SuZ3tekcL0f5kblUHSENK0Ml4DRe+fX/S
	pjUabqF2uKBFNG/nwM745lwPjNChmz3qDuyK6AWLo+nFidZRr0Gh/kraQyLao25hgbLw8d5k2KP3j
	1LYvajIs6XIIubY+gsMB8ES5qUm7mav/B25GCmS+CQ0AkVI0FyOBkHr4iuWyJDhbqUM2kDiCyOQzE
	uAliCf19WB2BTYpQ6ge1JNM6yi21XK8vHAp2VJCfEeKMR6icw39Um8IDXkGxZHSYiEjcfFDA9DPuJ
	r1qVdtog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6b6-00000006oPW-2HNV;
	Thu, 06 Aug 2026 22:29:56 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6b2-00000006oOo-3mB6
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 22:29:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1786055385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aNV4uXbDodbnruGyVrOp44eaeJJKSwZaU6AGbof4wsU=;
	b=QqB9lMlPa1c1nl3NBIENn5wAVdr6S9U40sA8wMtH77kTxy1zvQv4QyOVwVe5ixmb9iNvs9
	j6uOtu0UstMJ5ZTK/EUdNZe5x1wxCzwAIG7fxalHEYe0H7g4Lz2gCdkGikE91uXRZNE8PG
	/GanVfi0H75NqcAjiT7amZUU0B7uCFIHNVGD4sXtwGO3P/zl+pf4Xid7ecuVW4BcwZ5KLt
	26h2CpmpQoPIfJBnGH21zh4HW5DcK0O2hevKLhnVNMDavuPIA1ErS84LP1tdymBAe/bpKx
	u20EJ3urRn8JxcD+NURI1zXZyMpqDxQ64YIXid41+COH3Q1I22MeDUX+1AACKg==
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
Date: Thu,  6 Aug 2026 15:29:22 -0700
Message-ID: <20260806222922.30384-1-lucid_duck@justthetip.ca>
In-Reply-To: <20260805073812.1433126-1-eason.lai@mediatek.com>
References: <20260805073812.1433126-1-eason.lai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_152953_350499_C99ECEA7 
X-CRM114-Status: UNSURE (   7.11  )
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

> 	err = mt76u_tx_setup_buffers(dev, tx_info.skb, q->entry[idx].urb);
> 	if (err < 0)
> -		return err;
> +		goto err_free_skb;

The first hunk looks right, that is what mt76s_tx_queue_skb already does.

The second one I think is a problem. By then tx_prepare_skb has succeeded, so
the skb can already be in wcid->pktid, and nothing takes it out before the
free. mt76_tx_status_skb_get walks that idr on every tx status event and reads
the cb off each entry, so this looks like it turns the leak into a
use-after-free. mt7925 asks for tx status every quarter second per station, so
there is usually an entry there.

mt76_tx_complete_skb would cover it instead. It marks the skb DMA_DONE and
leaves it in the idr for the existing timeout to reap.

