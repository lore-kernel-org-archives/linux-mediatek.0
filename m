Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716B9E77187
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2024 18:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ew1JHjhqkWJmDSXVbI/FKPuwdWHyw6y2n4tHfV3qKKU=; b=fw6R15XsbzX7PVZvINNZ92Q8/1
	LOdJOaiiHQuDjbSlE7StgM7doJyPqQGjA8S/bOrHFTopwcaTE+AXf1OBhhivK3j7k/tB9xOGaKZ2O
	l5ocBm47TDM/6tDnN4MvTPp6g95uxdHEZMD+9H7EuzNtNcaIuMlUncII3/ffBWAGFSznbMgOHzQCD
	Lq9fd9LauUONVCWl8dw4J9Zw1iVPRRJs52boPO8/M7oDT/Rw3mA9uAb2CZmUvQYiWnyHt/4IqLZ0L
	7vhSn2A292ZPvGiacfM+7oVM81SLfymWgdHcv5y2r8XS95ptCGJkmEk1qEH/bEMkc7soeEAdoDYno
	Z+eQZqIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyXh-0000000HP2t-1WfD;
	Wed, 18 Dec 2024 18:13:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyWZ-0000000HOvC-3ank;
	Wed, 18 Dec 2024 18:11:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EBAE25C4C29;
	Wed, 18 Dec 2024 18:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA4AC4CED0;
	Wed, 18 Dec 2024 18:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734545514;
	bh=ew1JHjhqkWJmDSXVbI/FKPuwdWHyw6y2n4tHfV3qKKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bh8F4QY/XZJIzgRGMofeHwHQ67y/72nMQxtcMFh9TkMJQUrzY3mW5YhoT39yRBipg
	 mWxP86dxBQSu0Od693xazF2e1NZ5DJHTLRypK9K7+DJL5EecOJhBhbzLZWnYZYjcUE
	 DCT9IDfLJMviQhEjzXW6K7HFHQe1gCQubk+HjviIHdfzQxeN6VkDTfy3dn1JfVCKYy
	 NAPMtF/nXqltuTTBk5Y0B9HUpCSMFvSag/Bq+jVzIWCmfFcKLF6upYBasRIJmkmwDo
	 oucJOZ3zKR8UAJCA4sMgVX616a5zepJoVl0XULMj8ZJkXrrJblHzl+v2YitcJfz/JT
	 5LlWEc9i3FyOw==
Date: Wed, 18 Dec 2024 11:11:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] media: mediatek: vcodec: mark
 vdec_vp9_slice_map_counts_eob_coef noinline
Message-ID: <20241218181148.GA2948182@ax162>
References: <20241018151448.3694052-1-arnd@kernel.org>
 <20241118200641.GA768549@thelio-3990X>
 <20241119110226.dbd54clp46klvjl5@basti-XPS-13-9310>
 <20241217174628.GA2654633@ax162>
 <20241218124505.xwgsnpi2rvbngqvs@basti-XPS-13-9310>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218124505.xwgsnpi2rvbngqvs@basti-XPS-13-9310>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_101155_946592_0C232839 
X-CRM114-Status: GOOD (  10.84  )
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

On Wed, Dec 18, 2024 at 01:45:05PM +0100, Sebastian Fricke wrote:
> I have sent out the PR and it has been applied to the -fixes branch in
> the media tree, due to the holiday period there might be some delays but
> I expect the change to soon land in Linux-next.

Ah, thanks a lot! I was looking at the main media tree's fixes branch
but I see it is only in the media-pending tree right now:

https://git.linuxtv.org/media-ci/media-pending.git/commit/?id=8b55f8818900c99dd4f55a59a103f5b29e41eb2c

As long as it is on its way, that's all that matters to me. Appreciate
you getting that process moving!

Cheers,
Nathan

