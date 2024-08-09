Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6317C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Aug 2024 19:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=zV9AU3Rv7gbTd6Uj0E/svSzWLPTCP1Iw+LmqSAkHkUg=; b=DKb5W0rr+uFEMk
	luhCFrT1vbjACf68mXkaVsvYFGuO/y9eTuxlARVJi4N28WPgu/soPfJuL/oZKk3GbUjb9TwyhL6HG
	Oy0+Il0qt5lo6t4hmsVpXBDwtCKh/giFF0Y8oynqSYmVzqzHj+CifGOt/6l4DY0cZ5IVD9364ELm1
	5F17m9PcQmdRy9CFrJfkRzJLzBYQCMsDjwRqdfmSc4X8e8WmGlweaEBE9sCyMK9LGT0XuCRvaluwj
	D/2g455ONNWxhtbI5O53zmMtq1a+Gu/QkkS0FIIWmxx2vUtvzKSZ9ylDB6yjTsSg0ZQD5k/Yq68UI
	1bK2hfjrZhhNINQD9gbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scUsJ-0000000CHMe-1D1o;
	Fri, 09 Aug 2024 19:02:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scUri-0000000CHFY-2AWn;
	Fri, 09 Aug 2024 19:01:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C4F96173B;
	Fri,  9 Aug 2024 19:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE459C32782;
	Fri,  9 Aug 2024 19:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723230089;
	bh=ZLJsm1HFlTxuiPShZr4R4A26koLmfxhwfvdmvafiIqM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=t1GxE/Lv2tzSNQ+iy143aiponLOW1vIazmIBJe4p8umjdyfANs5Kv84Q4uxQvC84y
	 dVaioklo/IF110c+w93ZLz7wTjge4h5kcVTVdRkHEB/cf/qmDLebKs6VxxCWLLm/XV
	 bWb4laAidtcCnPQ7UjHq6xAMyGVktjPjnLFs8CeWlrgR8sEAYMdqOAW4HaVgLxaA2D
	 L/7IlbrWsFZ4h1x5ynUg4oubnMYetE9oA1l0CjZkQqr/uDqKeKn+DDnxgg9V32lYOe
	 cQ1bCNs0lo+F+wmGsd8CX4lTZNl+2TNolTVCPI1MwEo6S0bcLXl0JLYbGGB+cBV/fh
	 HB61PtKoZoUHQ==
Date: Fri, 9 Aug 2024 14:01:27 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jinjian Song <jinjian.song@fibocom.com>
Cc: chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
	haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
	ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
	corbet@lwn.net, linux-mediatek@lists.infradead.org,
	danielwinkler@google.com, korneld@google.com
Subject: Re: [net-next v2] net: wwan: t7xx: PCIe reset rescan
Message-ID: <20240809190127.GA206091@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809033701.4414-1-jinjian.song@fibocom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_120130_620942_2154CB1C 
X-CRM114-Status: UNSURE (   8.15  )
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

On Fri, Aug 09, 2024 at 11:37:01AM +0800, Jinjian Song wrote:
> WWAN device is programmed to boot in normal mode or fastboot mode,
> when triggering a device reset through ACPI call or fastboot switch
> command.Maintain state machine synchronization and reprobe logic
> after a device reset.
> 
> Suggestion from Bjorn:
> Link: https://lore.kernel.org/all/20230127133034.GA1364550@bhelgaas/
> 
> Signed-off-by: Jinjian Song <jinjian.song@fibocom.com>

I'm glad you managed to do this without all the magic workqueue and
remove and rescan of the device.  Thanks for working on that!

Bjorn

