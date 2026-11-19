Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E935C606A320
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 10:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ORDjAzri;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=bIJ0EY4+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JJGLYPHzddrv19l+Wt/RsAOZQA+9iUUhc2s8/QuRBZA=; b=ORDjAzridwBO/V
	uhB62x1l+HuyC7SBRnp6qwgLCalPM5VErlMyCt/5i/KFscni7z+gVe3BZCczFzBu2frOsBkgp4Xlq
	0rCFIP6Xx7ocRBAw3kw1R20Uj7vH2+gBUU7+FXG8fp7uXxQ5jTaKbX6BHw8Xx3fU5omNSEc/sd4HH
	Pcc1POaZZU+YCeb+73tuIyePYP1yFGb9Df2o94+GwAS6kWkTkIIftnSr6SorRzAWDmmUNLetzLgPJ
	xUx/qCjUnvGoCpRZbKQzuDRS3Vbz6xkdv0cEOliCIvl1wXyo6bY949awAZ7Kpj944GFTlnyCogAvm
	qReC7Vek9PPWhf94Ou1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTz0Z-0000000BTkE-2LRH;
	Thu, 19 Nov 2026 10:04:47 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTz0W-0000000BTjP-2XHX;
	Thu, 19 Nov 2026 10:04:46 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1B39D80BE4;
	Thu, 19 Nov 2026 11:04:41 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwzlICTmi4r9; Thu, 19 Nov 2026 11:04:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1795082680; bh=JJGLYPHzddrv19l+Wt/RsAOZQA+9iUUhc2s8/QuRBZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bIJ0EY4+XIAASk4SLBZy8dy4H/Ry3xo38MZDSvT1Hjo+i6dgyDZ7X7IhTqXwCOKoH
	 YrFGvCEgNBraIpbpIgRxgzWxIy3GMH3c0BZ4C2Q+3w96UAZsnaqMTD+W+RMgApCifj
	 ZvDXByOjb1sFXMFsqARxOv6jEpuEugcgN7PrwOM+il3aZch17EFmgmGg6wyvnF5zdD
	 UBs4YBQoT4F6dGWe0lgV908l/D10QgzZrnYISC7vdQzOdAvJJP1SB0J0llXxm6bbjL
	 OrqdWjfH1nEMlTshteWqyqQ6AwborlBTis2moIYGxrwkf/MqADB9x9202G7atQjYo5
	 htrkMgUkkGnvQ==
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
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: npu: fix RX packet reassembly across NAPI polls
Date: Thu, 19 Nov 2026 10:04:20 +0000
Message-ID: <20261119100421.1963265-1-fmaurer@disroot.org>
In-Reply-To: <20261117-mt76-npu-fixes-v1-1-11bf744747f2@kernel.org>
References: <20261117-mt76-npu-fixes-v1-1-11bf744747f2@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_020444_960666_3CB40945 
X-CRM114-Status: UNSURE (   7.62  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 02:43:46PM +0100, Lorenzo Bianconi wrote:
> Tested-by: Florian Maurer <fmaurer@disroot.org>

Thanks for posting. I ran the posted patch on mt76 467ae2e3
(W1700K, kernel 6.18.55) for another hour of iperf3.
There are no oops, no page_pool warning, no refill or skb failure.

Tested-by: Florian Maurer <fmaurer@disroot.org>

The missing rx slots from my mail of Nov 16 are still there (232 frames
without LAST on their last slot, 7 unreadable tx-free events), but that
is not caused by this patch. I will send the [BUG] report separately.

Thanks,
Florian

