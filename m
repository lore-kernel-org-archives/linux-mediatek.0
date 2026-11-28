Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808F4606A31C
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 08:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EaOQD+DJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sC0u+Ypx4dW4BDufXD8QEGkBrDgreDlR4Dt/7XSyxFU=; b=EaOQD+DJnC0DrISTzx7pbBYNFt
	9Ogcc/AR8NZj59HT+MaR/ZjTzozThx+Vb3HjkZK7vuD0I/PXV2gtokgsbyYIOpqR6tHt/EXUYxO8Y
	y4VzStIY9y+C4bHYaomDFavGb1e4n8pGnc3v6nE0fFj9AFRMTqahHrugqyf//Uloc1Rd8znf5vuEY
	x76zkQTlbBz/b3R9FolntwpP4bC3sXiF+eaECjz070NONoG7TsS7C8DRJKETOZUJZlUQ2bzf23UG7
	3oZMjTME/W2jDTN39KTpfqn2ltG/Pd2OhazTF9BgKrBmJ4b0E8LdPVXCVictB62SRxRrMISDfo/yg
	NtQqtUcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEAe-00000000Yux-07Hp;
	Sat, 28 Nov 2026 08:52:36 +0000
Received: from mx1.markusglobal.com ([89.147.111.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEAb-00000000YuH-11gh
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Nov 2026 08:52:34 +0000
Received: from mx1.markusglobal.com (localhost [127.0.0.1])
	by mx1.markusglobal.com (Postfix) with ESMTP id 4jc3VD6vJszCs08
	for <linux-mediatek@lists.infradead.org>; Sat, 28 Nov 2026 08:34:12 +0000 (UTC)
X-Virus-Scanned: Debian amavis at mx1.markusglobal.com
Received: from mx1.markusglobal.com ([127.0.0.1])
 by mx1.markusglobal.com (mx1.markusglobal.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 3j9IngDEa6KU for <linux-mediatek@lists.infradead.org>;
 Sat, 28 Nov 2026 08:34:12 +0000 (UTC)
Received: from [10.132.52.115] (unknown [150.228.243.38])
	by mx1.markusglobal.com (Postfix) with ESMTPSA id 4jc3V520ZzzCrhR;
	Sat, 28 Nov 2026 08:34:04 +0000 (UTC)
Message-ID: <17e86b6f-25af-43fc-b0ca-a0eb982e6cf4@fiftyone-percent.net>
Date: Sat, 28 Nov 2026 19:34:01 +1100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 1/3] net: ethernet: mtk_eth_soc: fix the RX
To: Sandeep Haemoon <sandeeph@loljews.com>, netdev@vger.kernel.org
References: <patch-295a65477d87017ff5b65482ffae46fb@loljews.com>
Content-Language: en-US
From: Eugene Markus <eugene@fiftyone-percent.net>
In-Reply-To: <patch-295a65477d87017ff5b65482ffae46fb@loljews.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_005233_628098_F3E5CB04 
X-CRM114-Status: GOOD (  15.65  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mason Chang <mason-cw.chang@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew+netdev@lunn.ch>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sat, 14 Nov 2026 00:34:14 +0200, Sandeep Haemoon wrote:
 > Reset dma_addr to DMA_MAPPING_ERROR at the start of every iteration,
 > so a descriptor that is released without a new mapping keeps its own
 > address bits.

This bug is not theoretical: it has been corrupting memory in the field
on a BPI-R4 Pro 8X (MT7988A, 8 GiB) running OpenWrt main (r38441,
kernel 6.18.60) as a home router with a Bitcoin node behind it. We
arrived at the same one-line fix independently before finding this
series, and have tested it on that board.

You wrote on 22 Nov that the issue fixed in 1/3 came from automated
review and had not been triggered at runtime. On this board it is
triggered, through the refill allocation failure path, as below.

Symptoms, five times, between 8 minutes and 2 h 47 min into a sync with
the node's peers on the WAN port (the GMAC's own port, not DSA):
  - "BUG: Bad page map" in the node's process, then "Unable to handle
    kernel paging request" in unmap_page_range() and a panic;
  - "get_swap_device: Bad swap file entry" with no swap configured;
  - LevelDB "block checksum mismatch" on files intact on disk.
The corrupted pages held a received WAN frame starting at byte 256
(MTK_PP_HEADROOM): a page-table page had the board's WAN MAC followed by
the gateway's MAC at entry 32, and a LevelDB page in the page cache held
a complete IPv4/TCP frame from a peer's port 8333. The trigger is a
page_pool allocation failure: the page cache fills the 8 GiB and free
memory sat at 60-120 MB.

Bench test, RAM-booted kernel with PAGE_TABLE_CHECK, DEBUG_PAGEALLOC
and KFENCE; a test-only switch making every Nth RX refill fail (standing
in for a page_pool failure) and another restoring the old dma_addr
handling; a user process holding 6000 MB with a known pattern that
reports every changed page with its physical address (pagemap); TCP
into the GMAC at line rate:

   dma_addr handling   refills released with   pages changed
                       another buffer's bits
   old, run 1          166                     70, each a WAN frame
                                               at byte 256
   old, run 2          11                      4, each at exactly the
                                               address the driver
                                               computed (e.g. frame to
                                               0x1613cf100, page
                                               0x1613cf000 changed in
                                               bytes 256..1775)
   this patch          0 (59,817 and 45,274    0
                       would have been)

The other misdirected frames pointed below 0x40000000, where this SoC
has no RAM but has device registers and PCIe windows. No kernel errors
were logged in any phase: the debug options cannot see a device write.

On the board itself, the node then synced 57,736 blocks (about 6 hours
of continuous peer traffic) with this patch and no corruption; the build
before it, without the patch, corrupted after 2 h 47 min.

As this is silent memory corruption with network-supplied contents on
shipping MT7988 boards with more than 4 GiB, could 1/3 go to net on its
own, with Cc: stable, ahead of the jumbo frame work?

The analysis of the corrupted pages, the driver reading and the bench
tests were done with an AI coding assistant (Claude Code); I ran them on
my board and have checked the results.

Tested-by: Eugene Markus <eugene@fiftyone-percent.net>

