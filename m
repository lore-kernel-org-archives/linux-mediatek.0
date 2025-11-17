Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D6ECEBF93
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Nov 2025 10:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+5/+FobfofAhXwLRikeC/5yNiO8VH/n3Kd78rrHi3k=; b=2pyXz3JrusU0z6wBjJrfcs6GOk
	ptihqZVSvlKP1ltU4iEgVO6fkg9wZqXHwTF4Wzh5LpmxU//y8uCTAJj+F7j7opk+Tgl8nUoHYFICJ
	YTdIAs+2SoNOgsS07z2zFag1ii2eiGksjj1uuDq2BA4hPVTxBfHR1f9updMJNlU3lnXlpCGbfsBf7
	i+6gwwAFrQzLXHu4NxINCJI5A+q7CvWZO2ghWGdlFJxgOhC/pqNMNAKc9A/ltpEv+imBztWv+BIQV
	ijmvwmxOEVHmrpsx56nHIFilr4iGMExv0WW1jCx9Gwm/w5hQePx2/zXNdfGHbbTl9YwtW8sE0CFrJ
	576uAwuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwYO-0000000Ft0e-295w;
	Mon, 17 Nov 2025 10:33:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwYN-0000000Fszo-2HNX
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Nov 2025 10:33:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A105F60143;
	Mon, 17 Nov 2025 10:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52231C4CEF1;
	Mon, 17 Nov 2025 10:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763375626;
	bh=ghcnRQ+nhX7xv2Ba3ggi4m9wIFMl1M+hkyAbVP+4LTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zhxi6nr+jtFF9MxK+qlBz/BSYhzAFGFiT8cO/moudHfhdW742v5PHmOhqpsA2Yr1G
	 VL8h941jkiApYZWngPIAiuYK3jkm/craj9Iy3D2fJc3Xl0YbtNcqdWeDVEESGTKqd1
	 U2XcIPMt+WuFdnbo/Ra2TdDWLslJe4UwCsNReMMpiGMvFiN6lrGaoVQbgHp9C0JFBb
	 PkJp9JcR1a/DtJHrZnRS5Rc+oUlF+YPi/zDnOrfQBxvjpPSx4fCfq+07TmOU56NOxY
	 2lw5J+s9I/+NodTxe7Lb9EouI5n5U4RmxpdrlO/eCeydhkIwD2DSu/HW05jtbRJe6y
	 3RfTI5LdJGirA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vKwYI-0000000072Q-3Gub;
	Mon, 17 Nov 2025 11:33:43 +0100
Date: Mon, 17 Nov 2025 11:33:42 +0100
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] drm/mediatek: fix probe resource leaks
Message-ID: <aRr6Bj4yrcKN-jUD@hovoldconsulting.com>
References: <20250923152340.18234-1-johan@kernel.org>
 <aP91AfdoyESxqfPG@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP91AfdoyESxqfPG@hovoldconsulting.com>
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

Hi Chun-Kuang and Philipp,

On Mon, Oct 27, 2025 at 02:34:58PM +0100, Johan Hovold wrote:
> On Tue, Sep 23, 2025 at 05:23:35PM +0200, Johan Hovold wrote:
> > This series fixes various probe resource leaks in the mediatek drm
> > drivers that were found through inspection.
> 
> Can these be picked up (for 6.19) as well?

It's been another three weeks and we're at rc6 so sending another
reminder. Can these please be picked up for 6.19?

Johan

