Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4723606A322
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 16:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lSo7T5JZ;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=DrWFQCUZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2jBU5o2bkTGSmlvbTbsB7gQEFSTPAxXPYXkt03I97h4=; b=lSo7T5JZN1It4H
	M8mpr6i291cGo0Mx/K1PqmWzugtUpiwFPRlrlztd4wp/+YQnGBxQPjLyfbGBt3eCUKHQrV2QycHAd
	mAEBNhe7rv4JPGSvTkENg604yHm/cz6Rmmx+cTRmEzF4SxktfAsqk7aSahadK04tx0JIlwISWSs7d
	VT+Ym87pbVDPy/q2K4KptS1cjfGlk2d97dUb5zQLg8fT9FHh+Mrcmt2zPF7z3gVC10AfsE2YECiWt
	BlPL2YHmiC+ZtBljs7KUBI4KAUG/en5qpn/geqgfV2cJNEwXylwwMI/mG5da+u4hyE9fJWfo3jncq
	21n73hjFrgG6lkO2cB7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzYn-00000003Dj0-0gnX;
	Mon, 16 Nov 2026 16:28:01 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzYj-00000003Dh3-3KyA;
	Mon, 16 Nov 2026 16:27:59 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4F2AB808EB;
	Mon, 16 Nov 2026 17:27:52 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKkmEh0y6lrv; Mon, 16 Nov 2026 17:27:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1794846471; bh=pILPvvNhNcniZXqO6U9udmiLgiJvcbsp+5tCyQ0iSDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DrWFQCUZtaM/iwRuaQiyr0audWq+nwMBikIk9hjfhc8zvqlsmr5sOZUR+ALOuaS6f
	 YCFfsHpYfBNb97a7NKH7ZKk9hkikOSwaZHMB8VtAtRItfaoq3+FAW1UjZhTycOymFU
	 spBSaoGaTVD+hfjKzgyXVi1Iw0OCHcAEO7mHjsYhSkV+XYhvn+AYsKfStrKLP0mMNB
	 6P3ue0rEov+GFGGOadzAJG6jds2PdK5RZzJgMPxnRCyK6r7SMpb8/f/Ty1a/8yOnij
	 Y1wXXAbGmjcs0JRhzfqspv5NP+AXvven9xq0VvVv68qmCgs+6isCdbEVJ9C/4GmHAj
	 PlcuEhlhWL5+w==
From: Florian Maurer <fmaurer@disroot.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Florian Maurer <fmaurer@disroot.org>,
	Felix Fietkau <nbd@nbd.name>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless 1/2] wifi: mt76: npu: return rx slots to the NPU only after refilling them
Date: Mon, 16 Nov 2026 16:27:38 +0000
Message-ID: <20261116162741.2438098-1-fmaurer@disroot.org>
In-Reply-To: <avrdu8qr9L2sEuTz@lore-desk>
References: <cover.1793927986.git.fmaurer@disroot.org> <d6314f34e0965464207656d38a145490b6437aa5.1793927986.git.fmaurer@disroot.org> <au3igPTxdz3i64SO@lore-desk> <20261108205350.2956138-1-fmaurer@disroot.org> <avGnv8Jr7BAiQhG1@lore-desk> <avrdu8qr9L2sEuTz@lore-desk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_082758_252398_45572873 
X-CRM114-Status: GOOD (  14.62  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 12:00:15PM +0100, Lorenzo Bianconi wrote:
> q->head and q->tail are not the same when we have refilled the queue
> with new buffers. Moreover, I think if mt76_npu_fill_rx_queue() fails
> [...] it is not correct to use q->head for dma_idx

You're right, q->tail it is. In my tests I could not tell your version
and mine apart, so nothing speaks for head + 1.

> Can you please check the updated patch below?

Sorry for the delay. I tested it on the W1700K (kernel 6.18.55, mt76
467ae2e3) and it works: no oops, no rx stall.

What I ran: your diff as posted, plus read-only counters that write
nothing to the descriptors. Load was 62 minutes of iperf3 from an
ath11k mesh peer at 113-259 Mbit/s, with four busy loops at nice -20
on the W1700K for 3 s every 18 s. In that time:

- 61.9 M frames on MT_RXQ_NPU1, 1.88 M on MT_RXQ_NPU0, of which 227781
  span two slots
- no oops, no page_pool warning
- no descriptor that changed between consume and refill
- no refill failure, no skb failure, no tx-free parse error

Tested-by: Florian Maurer <fmaurer@disroot.org>

I found another issue of the NPU while testing, so this took me some
time as well:
In one minute, 226 multi-slot frames in a row did not end on the slot
with LAST. Slots of the rx ring go missing under this kind of load (I
suspect the NPU drops them), and counting slots by PKT_COUNT then
assembles the following frames one slot off, in your version and in
mine. I think tx-free events are lost the same way.
I will post it as a separate [BUG] report in the next days.

Optional: in my tree I made the poll report the budget as used when
the skb allocation fails, so napi polls again instead of waiting for
an interrupt. It never triggered here.

Please post your patch with the Tested-by. My 2/2 can be dropped.

Thanks,
Florian

