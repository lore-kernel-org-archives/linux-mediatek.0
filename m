Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1652C369AB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 07:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSLJoOVjJQd4eMIIJ0osP/PW1KkboAuwQvhGpWPk5tc=; b=mkftkxO7jApRLonZHtNgB0rhf5
	Q58TVOg3SbX/r6Ww4Ridlne7avHe9MxT06A2BBFZgA8SvrzpbatrKhhSUwcTiWlp3kFnkw6A1vCuL
	nMEgtS7NukMkI6CQtc99wReKsXuWsgA/0qAgwLhaoFGk1XJAfDWflI67OObJY1CalIs0urFVe4OVf
	vlcD78nx6ACtlMcemX/Ci21tTSyFBIczNDSCg8hK7qznOx/uQSZ7hIzpcaIYN+Zlxa5RVJ+wmnO/6
	ZbH683dLVcNrMPE1usNrIMONoMXYIHZlnTJuPb5lv2Rfp3OZFOKzNr74sXAIojExbfIIjhN3sVl/Q
	zIJNc4LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qjJ-0000000D64L-2qAR;
	Thu, 24 Apr 2025 07:10:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qW8-0000000D4C5-49oM
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Apr 2025 06:57:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4EF5BA4467C;
	Thu, 24 Apr 2025 06:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC9CC4CEE3;
	Thu, 24 Apr 2025 06:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745477824;
	bh=zPnLokL9Enz6v0drdyRj8ySVfYvqIPvXAh+2WZuW1zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kSnIxFI1GokV4V+fVsJxeGyERS251Gwh6yUmDRa5Ougu/R0xkaB0lMiwcyIAGt0OA
	 /s5RDb5WGAcsouwzDoe5hdBVb2xf5O2NlM6HF9xEHKeJs1Wei2IH2bgr8qvgwVXQ0L
	 pkkUgy0EH/FZbqo1VlO4uPWXsGaHxvqJEzD5qWEAHFnFygMcxsA0SKBosSwZOZOoUu
	 IqbMlBOa9aqIslVymBzcqpzevDepPN8QQk+0s/cmEXi0v8sPcbAsxBZnoIm+cA9A9l
	 8Kxzk5N9/ZenwLSN4Q1sWSeN1W23eiVrVVEh5NaO4zzyr7F7IrRJJVGEGt/7w/ezzW
	 eedfsGbE8EQOA==
Date: Thu, 24 Apr 2025 08:57:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
	dianders@google.com, hsinyi@google.com, angelogioacchino.delregno@collabora.com, 
	matthias.bgg@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	knoxchiou@google.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v11 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
Message-ID: <20250424-echidna-of-unreal-youth-9ac5b1@kuoka>
References: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
 <20250424010850.994288-2-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424010850.994288-2-cengjianeng@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_235705_091577_2FED44D2 
X-CRM114-Status: GOOD (  10.41  )
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

On Thu, Apr 24, 2025 at 09:08:49AM GMT, Jianeng Ceng wrote:
> Ponyta is a custom label Chromebook based on MT8186. It is a
> self-developed project of Huaqin and has no fixed OEM.
> 
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof


