Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FA1CCF9EC
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 13:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CwbhXocmjxTFWUjGdv8larPIeY/QV47kgdj1kXROEQc=; b=c84Aszgf/hPTqwJy5cIkKG4Ikt
	9el2MkIHptF66FvTEpLwa5ABoa5lzEsKVdhydltoePLSwQRCRBE7eBhMtB+I5qBjhtbUfdkFvh1Kc
	M1KNseQHarYRfjuz4yfnBf2FtfVchOAkglLWY6tnHpdzF+RowByV6BzWMd0G5PwTmpGy8BMq9lBze
	00EDOSxJOhRQBUjHl08qb4vH9832buX7GdTlRqgEjXYHFhDnsx0OCJ2q6K4o6ZTTMXI8zvO8lblY9
	hmIvmGvaIw5O3HTNSlntMgOvmZ2xI1iymwM7+9SbdezesPBZHgEXDiVBhagBQue8bqj9Pjv0gjnki
	7KPG7iRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNND-0000000E3mm-0nXx;
	Mon, 27 Oct 2025 13:34:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNNA-0000000E3lh-3Mst
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Oct 2025 13:34:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B301745A28;
	Mon, 27 Oct 2025 13:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BEBC4CEF1;
	Mon, 27 Oct 2025 13:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761572094;
	bh=CwbhXocmjxTFWUjGdv8larPIeY/QV47kgdj1kXROEQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d8ONXjuc/fmeCiRsrIFQ+ouZyIn5sCP9ugBofsPdhICLVSbEAxtdXww682fDWLs/3
	 cSLVWsXwxDTSMHjEMFMk52sMh1PR8/hd57Eh6HzSF9ZnoHLUo0zuwGDt+CzSyX3AHJ
	 4UfPSgV2dyc5PuFRSmBPoW+YkEMCJ/E/Ho9nVV6cwixUrLRTgOH7GS5raoIdggoXrl
	 C3F8ZcOoKYmaVaknLGsyY3HEQ6FMkf5ZgVJoY6bQBWnK8v/hanqesM2dID/pprDhI9
	 pZJbGzAshskjSoVw+UI++8E0vYWJDFYKIv1zLiROl5nixXHQUNH8cSOVLFmGzhWdmX
	 cO/RcQfOrtjng==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vDNNB-000000000Gj-16R0;
	Mon, 27 Oct 2025 14:34:57 +0100
Date: Mon, 27 Oct 2025 14:34:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] drm/mediatek: fix probe resource leaks
Message-ID: <aP91AfdoyESxqfPG@hovoldconsulting.com>
References: <20250923152340.18234-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923152340.18234-1-johan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063456_862691_45FBC157 
X-CRM114-Status: UNSURE (   7.13  )
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

On Tue, Sep 23, 2025 at 05:23:35PM +0200, Johan Hovold wrote:
> This series fixes various probe resource leaks in the mediatek drm
> drivers that were found through inspection.

Can these be picked up (for 6.19) as well?

Johan

