Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C177BC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 May 2024 17:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqESv7WWeMZja//oT9UpepgkVeWQJ4ZwtdjNAEaaYto=; b=YNsjiEcg66nYdLsiILpuCOIL3v
	MH1CtT+tVIRPvKCAW6LcsOEgNQyAscFH2JFXzMJi87xMFuzlCXRVTweEifXSXxNkPT9XFWwSC9PYx
	RnLgNLlftTc4KUuu9t6hIwEPK8MVH0fVJN09blIifsNNL2d0s3BP/3iidefsIqfVITY91nY3gfPe0
	w1p9HkTxLglh7C/ZSASzOicmF0CQNowcPfzo1FIYuFD2d5hnEB84lKm+2zElICiHsVO0O2Z04TiSq
	KG2eEzrUrT+1C6Txlb35UVK2XlDQL3efbxy/d0y09YthoGu//saw93lBWJpNgglqUL/tk59mOpMK8
	vaVT+4SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2a1R-0000000DPte-1xjN;
	Thu, 02 May 2024 17:15:05 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2a1M-0000000DPqw-3QZ7;
	Thu, 02 May 2024 17:15:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 47B90CE1682;
	Thu,  2 May 2024 17:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF56C116B1;
	Thu,  2 May 2024 17:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714670095;
	bh=N5HHrMygWqjBvhvqTPXKIRh02+LNnMgHkw3e9eLY0ew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m/YGbibJzsWR0UG2me+jlP7N6NbtsfyxLPs94dUbAHBdUosFWZ3fAbXfTudpooG5q
	 Ou4W/VP8l/jtDiya8wSkyrYLgbLWid4J2VMgBoX2JsBvXVcjHQ3CeE2xFjkX6BoOG/
	 InKwP3CAB+6vC8c3g+hkcGAjQGOihD7y05OIHD9dYo9LeXIT5Du260ncYPhvibd0NW
	 7n6RFjWUXJ6r4wX00sG/puIqaOvx23EBX59y8xyp04Y7R1+T+YVcHAKrkHvqY9Kx9H
	 sHj8kgTXofB2P1/Pfxe+yxImR09iGrQF4B1qoVlGVt886zcdLlK9nJyHGmr590YuCH
	 O7uGRlvkCb3DA==
Date: Thu, 2 May 2024 18:14:51 +0100
From: Lee Jones <lee@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] leds: mt6370: Remove an unused field in struct
 mt6370_priv
Message-ID: <20240502171451.GE1200070@google.com>
References: <e389be5e1012dc05fc2641123883ca3b0747525a.1714328839.git.christophe.jaillet@wanadoo.fr>
 <16df315e-8a05-49a4-ac07-d1ed150c9317@collabora.com>
 <d526b169-0385-4f23-8806-17bc73c2507b@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d526b169-0385-4f23-8806-17bc73c2507b@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_101501_058999_2B8E765D 
X-CRM114-Status: GOOD (  12.17  )
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

On Mon, 29 Apr 2024, Christophe JAILLET wrote:

> Le 29/04/2024 à 10:13, AngeloGioacchino Del Regno a écrit :
> > Il 28/04/24 20:27, Christophe JAILLET ha scritto:
> > > In "struct mt6370_priv", the 'reg_cfgs' field is unused.
> > > 
> > > Moreover the "struct reg_cfg" is defined nowhere. Neither in this
> > > file, nor
> > > in a global .h file, so it is completely pointless.
> > > 
> > > Remove it.
> > 
> > Sure
> > 
> > > 
> > > Found with cppcheck, unusedStructMember.
> > > 
> > > So, remove it.
> > 
> > Again?! :-P
> 
> Yes. This way we safe twice the memory space :).

I changed all of the commit messages in this disjointed set to flow a
little better.  No need for a Fixes tag either I feel.

-- 
Lee Jones [李琼斯]

