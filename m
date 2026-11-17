Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11811606A330
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lgg1bQWV;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bmqO0pha
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Qi0cmP3wtav6zq7PK8NCDq+4NI8sNadGZ5OQyAp5dLs=; b=lgg1bQWVgt9e4L
	2UgLgn55t7Fg7hMGYnAJeZWqsl8QdYuYss3BER0SZOndRZ9bzWQxM36I2/D2NcPl9I9YKBEmnqm2d
	CD/PpZI9HYvNE7K+n+TJGgwCWYMYU0DpHE3TMUB5nhTQfN3y7/grTnxnzTkO1CTq5h4A/QX7MCt3f
	1nhL/95AzrGU697b55VU9VXJz7EGwM6LfGRO3Vzh/dHqgsznIP3jukCUu45WikJzD+9mbiVmpXpPg
	0qlZn3tBaCiG0m7/AROKbUV3NTwVChfis5cGL5JAyldTvWvJHK7Cpvr3WFxOqYMcfioazcFHknbxd
	VrC3MmmJr21HXMEkKTdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGje-00000005KRY-2yRR;
	Tue, 17 Nov 2026 10:48:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGjW-00000005KLm-0c9v;
	Tue, 17 Nov 2026 10:48:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794912492;
	bh=8CGyToB07yLLfMT3JnBSGWMLvxSQdNUV5kLaFWsKIy8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bmqO0pha49cenR3EsbWuy+N5ejWY7Lh5F1CwHCmevZiVHXzaeiffbRpHvAoifWHOb
	 1wKG701dCca4cwucRrQuFCbVR+ssf7OYRcgLB3J6duOKUu67sudvPaquCTNIoy8LUw
	 Ney1K1+YSz9F26wAaRbQ6jHL5pPs0fLApb/ASfR3aiR4Y50UDKHlXjJcAFOe8KWmBT
	 xeZpL1Yzvp0D6mHz9C3YXbnFKgcGK8DfPAlLrIOpEd0vyHzP8+mseZii0IZda3cEpf
	 0X2S2Af9UkQjOl+bnDRQcaD2Z7kxnvmnug2ZfE2QMGE0fRcObWF/ByjS7cNMahgQ/T
	 bty2+oZHFHEUw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF14017E05D6;
	Tue, 17 Nov 2026 11:48:11 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Coia Prant <coiaprant@gmail.com>,
	Myeonghun Pak <mhun512@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Lu <roger.lu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: mediatek: mtk-devapc: release IRQ before unmapping registers
Date: Tue, 17 Nov 2026 11:48:07 +0100
Message-ID: <179491248222.154190.5453810565368208975.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002202028.420575-1-mhun512@gmail.com>
References: <20261002202028.420575-1-mhun512@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_024814_342497_76FFE79C 
X-CRM114-Status: UNSURE (   7.56  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 02 Oct 2026 16:20:28 -0400, Myeonghun Pak wrote:
> The managed IRQ remains registered until devres cleanup after remove
> returns, but remove explicitly unmaps the registers used by its handler.
> 
> An interrupt handler already in flight when stop_devapc() is called can
> continue accessing ctx->infra_base after iounmap().
> 
> Release and synchronize the IRQ before unmapping the register region.
> 
> [...]

Applied to v7.4-next/soc, thanks!

[1/1] soc: mediatek: mtk-devapc: release IRQ before unmapping registers
      commit: bf97386b6ba804df2e3a42933a4c955659a4263b

Cheers,
Angelo


