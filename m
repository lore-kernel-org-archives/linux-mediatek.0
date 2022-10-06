Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4793DC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 12:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivBODqB8zT0i8tsODwDmN95hLNFD02EONqwIrD/T+bs=; b=muJ8EspovixGdKg+49hWHZ13Cs
	j0/w7KxLpLOyHB3xFuAFyiFbcOrbiJZWtSvVST9y5N5PWrOG6Ht5S04MItln12H8vrZU7m5jG3Gph
	5htePJjjvL3KFq0tGOKnJs/N0B/XHu6eITKfebzwyVY1nYpnL8nkj9X51hXqnubFmU5GajNKrHKIx
	lTFTv69Eras1WNsQTPvuTeNMSZ26sRCB9igm4ATI3TSG9713pEH5EiDKypVFvC/lH4aoEeJ7AnZVd
	FnFLy9Ur9yd1IR5X1U/YpEdSUiAGlX2X04P1u9sNIHoJXZ8zXnUDpLD+Qc6feVwOTm+uTs/V9q+gm
	Xi+XXjEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQ7h-002LSh-Pd; Thu, 06 Oct 2022 12:37:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQ7L-002LIp-D5; Thu, 06 Oct 2022 12:36:48 +0000
Received: from maud (51.sub-174-199-42.myvzw.com [174.199.42.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: alyssa)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E430F660230C;
	Thu,  6 Oct 2022 13:36:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665059804;
	bh=ivBODqB8zT0i8tsODwDmN95hLNFD02EONqwIrD/T+bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jO3XfDiPepr8diAmDbe/VoloJDamezcRbDNea09v8fiCCGPC1jsROz+FNkzRjt+Yp
	 dew6CZnJPo+vEjqtN2AtVdVoVIrnSj4hQHFLVD1tF50xJnvh1uiQtyO+uxrjymmhzj
	 L76r0TKAWx5gEwzF4nLw14TfCdJnD4MHhObaTfqiQJIr3uPfLkdYv79g48+iriOKtv
	 XlssrXjkFrWycBDh2PhL9xa5kjQuXivVw8wUh9x7G6tuGa2RnkIsU0MbpTKDZ3gRhy
	 mhLHvQnmQRhQma8WcWJE7Yz4owLXIX3dvDZdfXRPIbfRG+TEdKqN3Gqg8qiBRrUE5e
	 q+ipvmcjCERSQ==
Date: Thu, 6 Oct 2022 08:36:38 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org,
	alyssa.rosenzweig@collabora.com, nfraprado@collabora.com,
	dmitry.osipenko@collabora.com
Subject: Re: [RESEND PATCH v3] soc: mediatek: Introduce
 mediatek-regulator-coupler driver
Message-ID: <Yz7L1lwl+uNQWnjd@maud>
References: <20221006115816.66853-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006115816.66853-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_053647_646905_5FEFB92D 
X-CRM114-Status: UNSURE (   4.31  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@collabora.com>

