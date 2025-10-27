Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBE3CCF9E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 08:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBhCdyoqKlZu14tsbQ4juEZ0TVSjb3G2bD1IUCjdFm8=; b=dUFjhPI08Wq6jIgQ/jWKi3rkSc
	iB1y09N3ti53V0zOETLgRmELmYpqHoY+T7/ELIe/uoAxTHPem/jOxI5Cl73dwp5HMvAu8dtXz3DDW
	mtld0s5kQgLREtrHbrA8RV8vesE9RahkC2tHt+ckOuGu0tGlCOw6SZK5S6nk6/JW7MuSrbJ/hoWvG
	rSOi7pcF2qP2VNnA4X6cXdD/BxLYRrmvn43ksBpW3li9SYDvbBtH8FSfsF5jdNJCGj3Qku5W3BeMh
	YtbC6IWRzHfl7u6iXWsD4ZATShV191RjFT8I4xqQ/Lf8tOu4Lib3CnTn5YlxO2DCTVnGaHNMw3aLx
	BMNryicA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIs7-0000000DQOj-0enM;
	Mon, 27 Oct 2025 08:46:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIs5-0000000DQOV-3ezE
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Oct 2025 08:46:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F0E5605EC;
	Mon, 27 Oct 2025 08:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0EB5C4CEF1;
	Mon, 27 Oct 2025 08:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761554792;
	bh=wTUNdqGBpFLAqiC7mukUvqvsS+BTDhCzY1pxtj3ZT3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dt0s5VNYVtFTxxZdebEu+wKIca0D1Ze4EZoEcMsN2ivUAm2TfO72ZubXUw0jLcV+k
	 ttk9Uyqkpzz9NMVJDfFB1HBDV5CHEOrkYDIY9JwILAhRw41CJd61jD4IqiQs8SCieq
	 tUe6aUFzt3TrPhY2MQkRv6tvTxbYLWTXcg7RdsrGAiYHpaiYEOVxP5z1Tn/uCYxGfn
	 PWDYzzB731kl2WjwgXbHDpsbEeDP16k056V8RIBxxjXc0JILBQdc6eI5nU8i69KT0I
	 V6k/tatFDFQI7cAjjbzTHGO4A+CNPmm7a2kjpSO/23nFA50A88c9bFexEJsObjbOdh
	 gZPxuHnKPX1uw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vDIs7-000000000O1-3kBX;
	Mon, 27 Oct 2025 09:46:35 +0100
Date: Mon, 27 Oct 2025 09:46:35 +0100
From: Johan Hovold <johan@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: ninelore <9l@9lo.re>, "stable@vger.kernel.org" <stable@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [REGRESSION] 6.16 fae58d0155 prevents boot of google-tomato
 (mt8195)
Message-ID: <aP8xa3EBtAH6P9Rh@hovoldconsulting.com>
References: <QwcOPAuQZfqo0I9EwUu4tVCuhXRvtfAgFZ7Hq896xRKosseOz3wvuKJFV1YLUTTTwMANMW6bZPUfLwXQPPgBFiYEzKUjMGZ5D56349pz4m8=@9lo.re>
 <26bc2a33-2a45-468c-a3c1-6ef2ed414f44@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26bc2a33-2a45-468c-a3c1-6ef2ed414f44@leemhuis.info>
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

On Tue, Sep 16, 2025 at 01:54:54PM +0200, Thorsten Leemhuis wrote:
> On 16.09.25 01:22, ninelore wrote:

> > starting with the bisected commit
> > fae58d0155a979a8c414bbc12db09dd4b2f910d0 ("[v2] drm/mediatek: Fix
> > device/node reference count leaks in mtk_drm_get_all_drm_priv") on
> > 6.16.y my chromebook codenamed google-tomato with the SoC MT8195
> > seems to hang while initializing drm. Kernel messages over serial
> > show CPU stalls some minutes later. I am attaching the full kernel
> > logs below.
> > 
> > This issue is present in 6.16.7, however not in v6.17-rc6
> 
> A problem caused by the upstream commit of the change you mentioned
> above was fixed for v6.17-rc6, see 4de37a48b6b58f ("drm/mediatek: fix
> potential OF node use-after-free") or
> https://lore.kernel.org/all/20250829090345.21075-2-johan@kernel.org/
> 
> I wonder if that might fix your problem. It's currently scheduled to be
> included in the next 6.16.y release.

This is a regression in 6.17-rc4 and the offending commit has indeed
been backported to the stable trees.

A fix for the regression has been sitting here for a few weeks now:

	https://lore.kernel.org/lkml/20251006093937.27869-1-johan@kernel.org/

Johan

