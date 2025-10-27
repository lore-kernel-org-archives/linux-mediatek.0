Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3865CCF9E5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 13:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxCxgTTYBjc8S0jD67TUtLW2Set5t8DUr1y2eOxYbsM=; b=oQrAgX2AvY3zz4bkw7mLIr5kh0
	pAhejBD7ohLd+AHWr+wzDrWsQGNu1aCT5rZIUYiMuGgNHyMMt5nM6nps4AyO3IydbX5F0h/3OQXYp
	lDoB3NrgnGhOxPWd2wISSb0kv7zqczoCSlQU9BlapScWwZu0u4z4+o4OVojk0XFdnqTHt8S67xnK+
	in6zi165A2VGsQrFxzz8qII8nKklPJctVtfh6mvXPG5xrlBitvdQtkiWobIe6h5hc82ywoTTP2wvT
	K1b89+GhhQO//z2Rf6OYtCENTiaO7txy4XYe5ScS7TNX1J0xZNBTkgC/PZw6hOELZy1VRE3oXnCiC
	VJaCJEOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNPf-0000000E4Ue-42tF;
	Mon, 27 Oct 2025 13:37:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNPf-0000000E4UU-0tq0
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Oct 2025 13:37:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4814F6026C;
	Mon, 27 Oct 2025 13:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43E0C4CEF1;
	Mon, 27 Oct 2025 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761572250;
	bh=sDzyF2CI4Ve7jNRefYb/GwI6Wxad7x3z6YmDoIi8foo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oRs8YjiL/vupq7FSOVRNEacfhBQcf1T9IF239ohLVyns22THLQIQ9BXfdWQCcNKSr
	 0GB6ETuVxjbeBGQbf4RpFbrrhoB9kk7PRCvKnSDFb6lN2zyATw6bGBB4vRYVXE0IGK
	 ALOpRiHpDyPi1N/kZoShILXepKHMBlA/enKdVhyZfT2VKyKkUqmJWBsNAHsf6UWJYk
	 2pL43uvQsT1HO/AI1dL8fhiRRPXun2lTqRven8udzlAyxhKpNS6eIgP3Xgx2gZ2lK1
	 Kkzau+qsaMFg4AjcJxlq0Qe6mr5iphzHUfNZWPKWiyvHtQtq+MtdXodtRc7WRfwfP9
	 2Uq2br7Mufr+Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vDNPh-000000000Jg-2TyV;
	Mon, 27 Oct 2025 14:37:33 +0100
Date: Mon, 27 Oct 2025 14:37:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: mediatek: fix VPU device leaks on probe
Message-ID: <aP91nfnpShIhXcVQ@hovoldconsulting.com>
References: <20250924133552.28841-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924133552.28841-1-johan@kernel.org>
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

On Wed, Sep 24, 2025 at 03:35:49PM +0200, Johan Hovold wrote:
> This series fixes VPU device leaks during probe of the mdp and two codec
> drivers.
> 
> Included is also a minor documentation update to make it clear that the
> VPU lookup helper returns the device with an incremented refcount.

Can these be picked up for 6.19?

Johan

