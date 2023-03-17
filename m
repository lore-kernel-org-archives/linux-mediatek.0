Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B277DC74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 08:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beFL+geAyc7uQO4sK08lV/AULDUAeBB8hrSqhCbr/Hw=; b=rvJhQJlNajwelhZVizSi6FcFzh
	8owUp1N6PBDrTQsCF0vRvi4nYym7VX5TahnfYaju2VJL7kha941bWXDe8FYjCUBV07dHh7vPQ1mlr
	vMKF1ohlaWSPTGhIupE06PtqXywIgJPP3dtvQdlFOYvDDlb0gfcbPZDyGVxQB9iIh2yr9E+jog9W9
	E3OhJ2xOy3hTPSdjVXutB32+fdY8bcJ0VbO8XhJ53Xz1JJ0WcqGAMbr+RE/P22mIJP2hA66TvRVcf
	UpSka3/ZOX3PRr+Ttxpq4LHy6kVklhEIm0aOe9VyHQtWtjP4xB6Lgt35PoL2TeKM1RbZZkE11qS7h
	CbyTNzng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd54V-001O8C-01;
	Fri, 17 Mar 2023 08:04:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd54R-001O6A-00;
	Fri, 17 Mar 2023 08:04:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8490D6220D;
	Fri, 17 Mar 2023 08:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F2CC433D2;
	Fri, 17 Mar 2023 08:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679040254;
	bh=p0BUqJSg2SeYj38Fa5fWlisgpVk5eSZqipdHV2NgafE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXL+AVMtAeY3d9tTUmuu7OMV6IBQFULHQ7lDYNXdVTpIY+1AdyRgVzfBmHOx73hJV
	 ZQiYhxhB/35aZ8HBM4zN6FZGxypbBR/Ibs49z9sGKQ3BY9Pg5izZWJCnf32LMBKxP5
	 UZliE/iEMHglYRdDg60LQoaGaePJEsJiJ2QGFm7OS3EGWbpluxulgidcwnznnk/yUE
	 LQDh6N2QeF0pDlZRGs1d1CoXOI1py7xobDxzeXhPiioeP/N7LCXa6QpTqTxicC31xq
	 3FWtbhdn4ZROq9tRIM8XUYOE3YS0w3QDS33wcWRXSOf6K8XdMYTbrBt3Rp4Nhe2Ro7
	 2tUAsVJRi35LA==
Date: Fri, 17 Mar 2023 08:04:07 +0000
From: Lee Jones <lee@kernel.org>
To: ChiaEn Wu <chiaen_wu@richtek.com>
Cc: corbet@lwn.net, pavel@ucw.cz, matthias.bgg@gmail.com,
	andriy.shevchenko@linux.intel.com, jacek.anaszewski@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-doc@vger.kernel.org,
	peterwu.pub@gmail.com, cy_huang@richtek.com,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	szunichen@gmail.com
Subject: Re: [PATCH v18 3/3] docs: leds: Add MT6370 RGB LED pattern document
Message-ID: <20230317080407.GD9667@google.com>
References: <cover.1678430444.git.chiaen_wu@richtek.com>
 <38f1e863b0f099158a63fb6f95056a1cb30d80a0.1678430444.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38f1e863b0f099158a63fb6f95056a1cb30d80a0.1678430444.git.chiaen_wu@richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_010415_084355_5FD4D3C3 
X-CRM114-Status: GOOD (  11.48  )
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

On Fri, 10 Mar 2023, ChiaEn Wu wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
>
> Document the MT6370 RGB LED pattern trigger.
>
> This simply describe how the pattern works, each timing period, and the
> pattern diagram for MT6370 RGB LED.
>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
> v18:
> - Revise the text in document title and description.
> ---
>  Documentation/leds/leds-mt6370-rgb.rst | 64 ++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/leds/leds-mt6370-rgb.rst

Applied, thanks

--
Lee Jones [李琼斯]

