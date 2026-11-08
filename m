Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3F0606A332
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 21:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LqUMA0vK;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=OhfDEB0y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Dy1FrLRP5sHlIb/uR6GwETHa25cqzjt6QkibR1Iv5QM=; b=LqUMA0vKFjmnD4
	jklj2EGaJe9mMDmHev1TZ9avCdSplEYbZ3FbPTo7C1SE0DoLsYRzcHrupF+c5lNGRLk6AfnuWnKSX
	O5oOnuzMLOGwoPx4R1rylGWuswvmQswjr/SYqj3HNNkLCPC8tazTBxfiGoQ77zNr1fDdBPp9hexKO
	M6J1AXfOGK5rPxHFuRZS3MUDPxbl2bd6apt2q+UIunBOrNCoedkRoZlzKtiNnzufna36Or9mSOGy+
	4L7Ex8P2DE3mOjE+nGt9BNFyXhCvexVWQdgs9ynWU4OgUXh4scPTaWQ5QQLXiIshGeyDNRbYQkC/P
	//N41kdNZ3CydjPVuhCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAKm-0000000Ghts-0YSl;
	Sun, 08 Nov 2026 21:21:52 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAKi-0000000GhtQ-3WWA;
	Sun, 08 Nov 2026 21:21:50 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 228CA80792;
	Sun, 08 Nov 2026 22:21:46 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMlTVqmvejJs; Sun,  8 Nov 2026 22:21:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1794172905; bh=Dy1FrLRP5sHlIb/uR6GwETHa25cqzjt6QkibR1Iv5QM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OhfDEB0yUJDK5+n7O16lNXc668YG5pqs+r5A/f1JNDqBD4UmQbrIN06xKVTtQ6rn8
	 HylnYr2PetuxHS2wlDNJvhvMHmMpTwUV0jrtUslPItzGLSPcr9AAqeS3PglYwrFGd5
	 GepyeDYwir+ttnEqPkveKenJ6dNBC+OxGT2kYqx7dOWuc9Rgee/LQYs1NjRj6okkjL
	 LcA0wF94j39WrVqruzyuyMO0V1u/YI4ea39G5IUTrWNQ1q/grZ6PUCks/eab52oIw9
	 tkMP3ZfdgAhpwYRNHQ9ITQYwwLaRDhicMPZEqMBX3yfbUH0N35Dkl7cLCnA00bevBF
	 L7fDktzz6NKWA==
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
Subject: Re: [PATCH wireless 2/2] wifi: mt76: npu: read the rx slot count after the first slot is complete
Date: Sun,  8 Nov 2026 21:21:29 +0000
Message-ID: <20261108212130.3028297-1-fmaurer@disroot.org>
In-Reply-To: <au3jnOD5ZOJR0mvb@lore-desk>
References: <cover.1793927986.git.fmaurer@disroot.org> <653d93b3c35975cd13dd6b33d76ea6517b55be91.1793927986.git.fmaurer@disroot.org> <au3jnOD5ZOJR0mvb@lore-desk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_132149_036166_E1B4DF69 
X-CRM114-Status: GOOD (  14.11  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 03:26:36PM +0100, Lorenzo Bianconi wrote:
> Relying on the patch I shared for 1/2, I guess this is no more a problem since
> we will just delay the skb allocation. Agree or am I missing something?

I think the race is still there. It is in the order of the two
descriptor reads, not in the skb allocation: your version still reads
PKT_COUNT from desc[q->tail].info first and checks DONE of that slot
afterwards. If the NPU completes the slot between the two reads, the
count is the 0 left by the memset in the refill, max_t() turns it into
1, and the DONE check then passes. A two-slot frame is delivered as one
slot, and its second slot is taken as the start of the next frame.

That matches what I saw on the W1700K: with patch 1 alone, 2-4 bogus
tx-free events per 30 minutes, each 2792 bytes over two slots
(1000 + 1792), i.e. the last slot of one frame plus the first slot of
the next. With patch 2, the same debug counter saw none in 60 minutes.

It gets worse once q->pending keeps the count across polls, as long as
the count is still read before DONE: a poll nearly always ends on a
first slot that is not done yet, so the frame that starts the next poll
would usually be stored with a count of 1. Checking DONE of the first
slot, then dma_rmb(), then reading PKT_COUNT avoids both. I sketched
it in my reply to 1/2:

https://lore.kernel.org/linux-wireless/20261108205350.2956138-1-fmaurer@disroot.org/

and v2 would carry it as one patch on top of your structure.

Thanks,
Florian

