Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AC2C87FCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jul 2025 07:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJO3dbpw9xarIQaEJ3OwJFXXSeV8363U+Y3VHM5slF8=; b=AyJ7IWYdfMr7Za8tnSafjW9Lxy
	e3QWlD42Ln5exNascbPH1ZP4Cf7DROyLVb82hxGubT6GhMsrCco3ArXfyFFNowhNOUtef0ZxVvCBW
	tozc2qejkJ+Pc7V2QTDVZfV8tFpDxlYu/zhNMf/qENONtgnN2LIH+QBq1fedp98f2Y04gViWvqmEw
	cnI/SCqowwiCRjmCjvrP31wvD5lwllCUDmqXFzF4cmRUQWJT2LlIfR3cmJhu8QhHIWb9o1Rcp0w1+
	GyYe9Hs0mL1EMl+25+ZM0aLFFEEF6/cwsHIYR3v2YM+fylz74SValiMduM41qHMLvbNWfPSpQYx+U
	KiATTNaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Ld-00000001cZ0-3omk;
	Tue, 22 Jul 2025 07:23:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7J3-00000001bSs-3CrN;
	Tue, 22 Jul 2025 07:20:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AD0B442C5;
	Tue, 22 Jul 2025 07:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DCEC4CEEB;
	Tue, 22 Jul 2025 07:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753168855;
	bh=D/qLVppq36iQHh/jp2D4snN5Gi/I9boTC8d0En/VQ04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N6pG3no2kAqQquA7w9b69deneG/36FsfavHaBYvNGIm3lVD03CaAgCDXdRzA8wRWv
	 5qh6qUQl6Gp8Qi4qqsV36PknfEzyep2mKfDApKokMu2a3duVYXyxaPRLVdWpX/z5HY
	 QWWtU/Xv2i3zBR88ffu0zcoi+eEF6uGEhXzq8Rh+8pelp0LKBestNFeqz48KC0CZWQ
	 0kBYUgN+A2R9vaxVE1EUstl+qDs9o8blklrMsD8GI6Sw5g1JFxmtQqI2VQ78ZGmCED
	 mM+kgXfYSauiUabUTQf7eavEV9VF5enX/74FeW4UjP1GoqWWdvE1TQN7vKfCuZ1gbI
	 HKwIEku0RstoQ==
Date: Tue, 22 Jul 2025 09:20:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laura Nao <laura.nao@collabora.com>
Subject: Re: [PATCH 1/9] dt-bindings: thermal: mediatek: Add LVTS thermal
 controller support for MT8196
Message-ID: <20250722-dynamic-truthful-mussel-9cdf1c@kuoka>
References: <20250721081459.16278-1-laura.nao@collabora.com>
 <20250721081459.16278-2-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250721081459.16278-2-laura.nao@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_002057_823458_E72F9D04 
X-CRM114-Status: UNSURE (   7.82  )
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
Cc: andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, rafael@kernel.org, kernel@collabora.com, bchihi@baylibre.com, robh@kernel.org, nfraprado@collabora.com, daniel.lezcano@linaro.org, rui.zhang@intel.com, colin.i.king@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, arnd@arndb.de, linux-pm@vger.kernel.org, u.kleine-koenig@baylibre.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org, srini@kernel.org, linux-mediatek@lists.infradead.org, krzk+dt@kernel.org, lukasz.luba@arm.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 21, 2025 at 10:14:51AM +0200, Laura Nao wrote:
> Add LVTS thermal controller binding for MediaTek MT8196.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  .../thermal/mediatek,lvts-thermal.yaml        |  2 ++
>  .../thermal/mediatek,lvts-thermal.h           | 26 +++++++++++++++++++
>  2 files changed, 28 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


