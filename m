Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD358C3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jul 2024 07:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCUFueEIYiBasscuYXg0w0IStFPNUwyN57R9AJXyN3M=; b=G8pPcNesqhbC+cUZgMZllOhbYS
	TgBm/1m1Vw++bw7DopjauOmXCy5GdnFWlHyN2npDFcRNm9R3uEfWevlpjIW1XyRKLpFjviUnM4Qyb
	E2EHhqKHwTvpmNhiUk8dd2O0CPIVk3+3aL6Oaen/aXLGKwIUCP4p0tNcQ9q9l8v6wTsbZhV2fM2hH
	ponKhrIVkDVeql1MdQZWlRS/D5A8FuQCGq2K2zot4k0A1Vl838jPe4yv6ykQ3xWgy5hvhx1X6Fwsj
	vfiUvQmcCX6bzdaY77r3LCyBGARSha7KyLKraJLRqmm0fu4nQcjcMYJTnbvclTySuf4OdxD7vkEgs
	MkxwLHhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWtHm-00000000EpI-1YX3;
	Thu, 25 Jul 2024 07:53:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWtHN-00000000EkT-2FXT;
	Thu, 25 Jul 2024 07:52:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DF335CE12E4;
	Thu, 25 Jul 2024 07:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999BBC116B1;
	Thu, 25 Jul 2024 07:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721893967;
	bh=A7CLgRbWMZ+cFvBw/N3DfWwnkk5FgFwxgjnz1Tvfi9c=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=mFJxiI/ke/2sho6ai4rYz7tIZTZLgYAE7ZlslLw6iMArNY3O+bSLBoi9bDzHajo5L
	 fvpG2qRC33U8w3RwVyrASlWrB/sz23I0jp5YhYtIYqxM3p1cCUvQC0Bl9TKbdwQGE1
	 T4ZDgLWeZGxOIvR/gBBTeiKJ4S11Lpf7ftBeUAYeHAYeMmxPRlPAmMc3iu7nU79/9l
	 mtyas+Xn2hVcnqbb23CByAM3u4yoVm4B4CO9pvPDrM5ZX0a0hA4WuHw7zpbqNY9Nkv
	 uaxS88ez9a1yoF8nbsrcLm6U87mvodmDUTaPhbS8PDgYwC1NzTFne07qVf1tl6Z7+7
	 tsZO3xuPRaJmg==
Date: Thu, 25 Jul 2024 08:52:42 +0100
From: Lee Jones <lee@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] mfd: mt6360: Simplify with cleanup.h
Message-ID: <20240725075242.GA501857@google.com>
References: <20240707114823.9175-1-krzysztof.kozlowski@linaro.org>
 <172189384152.837660.3590109373140262352.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172189384152.837660.3590109373140262352.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_005249_768413_DAEB182F 
X-CRM114-Status: UNSURE (   9.57  )
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

On Thu, 25 Jul 2024, Lee Jones wrote:

> On Sun, 07 Jul 2024 13:48:22 +0200, Krzysztof Kozlowski wrote:
> > Allocate the memory with scoped/cleanup.h to reduce error handling and
> > make the code a bit simpler.
> > 
> > 
> 
> Applied, thanks!
> 
> [1/2] mfd: mt6360: Simplify with cleanup.h
>       commit: 05dd1b4a8d71b5c422bff8bf6ad22baf5722c2a2
> [2/2] mfd: syscon: Simplify with cleanup.h
>       commit: c80c7dfec9d8514f1fcc34402124026e59d2e2cb

Not keen on using the includes filename as a description.

Changed the subject lines of both of these to:

  "Use scoped variables with memory allocators to simplify error paths"

-- 
Lee Jones [李琼斯]

