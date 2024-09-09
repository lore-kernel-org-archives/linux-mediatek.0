Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9E4CD4F4C
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 06:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhbDA6Zo+A3UGelqYOMQWcWcdiPfohLdt87VX/zVhxI=; b=fH+rDgoNAP0UStFTec5u2ocJs3
	so84V9Tqdj1dT3gb6/9tU1Hn/uN/R/hNPY+8WBpi1xKq87ObQif+kf+qoyK4MRpITQRCFQ5BBVVdD
	2jHX6Ztozjvuuuy+FhDkoDIRqIFUKI3AjPzZzEihnxQbDpWZjmTASNiSz7VWC2TEjhwW4xPL91Nxz
	5TRGbt6hmJrV7/v9UwZPoVeYCSxwbSfu2NbYxnKsp5pm3uW4VTcoFUnlrdTGDItFFkmdP6MoP3XsQ
	CPnjot7VTs2SFMF2LaNm+1mK/eu2hX/1IuMZ9MKBWwtdqoS9GDcLT+WNapWQOcYdrLhsbAysuqxVw
	qbZFC0Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snXqd-00000000cnj-3Yk3;
	Mon, 09 Sep 2024 06:26:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snXqb-00000000cnJ-1UGq
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 06:26:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BE9A5A42640;
	Mon,  9 Sep 2024 06:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376B8C4CEC5;
	Mon,  9 Sep 2024 06:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725863159;
	bh=h3R7Wc/y9Jn11tIYXxPq8te7w+gEIXkmjBYE8s+68bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jXdHQo7aaRCa7iGfXH3EpKVNmKcJNH4tYZIvubFW6Ml/al36ieCbrs7mmlcGykROA
	 sCaEJ8mY758FdLDffPfCEVS1Tqo9B9tfporEFRKcL/Jxz6guHEGuWYCm8xy+vDPp4c
	 VK1Fz5RGE4p/xGnrYc4bvDv/kJ0+9alXs9RQ+9kNXKpXFO71mtFUbJEdp+ec8kij+P
	 DipaaDfMgVgbMbRYcd86WpnWpnZi9JoORiAY1SCi3Yh6mu0IQZ5hmohhjBmkYBLdzX
	 gXmPwz3Pl53HlI1WyE49rymwxPU51yOk1+bm4KfRv17/B6rkBD3wu5nUJ26ma+VBV1
	 Azn4imotPlsag==
Date: Mon, 9 Sep 2024 08:25:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Cc: hsinyi@chromium.org, angelogioacchino.delregno@collabora.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	hsinyi@google.com, knoxchiou@google.com, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
	robh@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
Message-ID: <lp7rhdmz5khuu7cpw7cg2oilkgfcip3fu2gr4r2f6vkk3cbg3e@iyqhqhn26pw4>
References: <CAJMQK-imYrDTuycVzQxkfbkZuHehE8uwc+qS2w=UDShETsBvEw@mail.gmail.com>
 <20240909023148.1677936-1-cengjianeng@huaqin.corp-partner.google.com>
 <20240909023148.1677936-2-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909023148.1677936-2-cengjianeng@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_232601_475425_09A5945C 
X-CRM114-Status: UNSURE (   7.04  )
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

On Mon, Sep 09, 2024 at 10:31:47AM +0800, Jianeng Ceng wrote:
> Ponyta is a custom label Chromebook based on MT8186. It is a
> self-developed project of Huaqin and has no fixed OEM.
> 
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
> ---

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


