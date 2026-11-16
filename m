Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB297606A334
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 12:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MtyNpZFz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ALvci8CB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5TQnXyxPKsVYp7Swu6UCLm+jMK/P+KGC0Ry72Fb+tw4=; b=MtyNpZFz6Ze7jto+Cte8osXmu1
	kTsuhHqnGhpa/LARm3BKjJtzp+2C0jXmkugaShpzeCncgLEZo+9rDe/dQdx2961qlv1YxZDoLfx7k
	JO1r7/gHRwa7EYvSVe2ftzq/+aun1asOIGPkuE/MMNq+QfBL/2E803euUGpUtzV0ByQzFroXgG9me
	EF8BoShTCGKHxl9SH/UmCi6n9ErWZD7TJT75seQ01RYBwcfQI3ZtQBLUNZRzT73CAa6a7BcZfZ1CN
	c+Nx8lsvRVJlaa+gFoRw0o8LmL+yvldR19n7MLkHFU96oLTPfWlbRkEcCJv3ZDa3/r6JRT9KHGt8g
	fyVslVQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvb6-00000002JmU-2KNu;
	Mon, 16 Nov 2026 12:14:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvb5-00000002Jlr-306X;
	Mon, 16 Nov 2026 12:14:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 218B040DC1;
	Mon, 16 Nov 2026 12:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1DC1F000C4;
	Mon, 16 Nov 2026 12:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794831247;
	bh=5TQnXyxPKsVYp7Swu6UCLm+jMK/P+KGC0Ry72Fb+tw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ALvci8CBxbM/eosyVK1BjxHfGbw2+ug0PaGwZSi7rRYyfOsz6ojgOENO9i/smX4GU
	 CU652soiiZ+0qC+m8SIQtGmaF1OTlqs0aFapVfUyAvUfYC8C+Q4ygS5kYmxY6ejkmm
	 QFZ5fQuQLs4aw5BGeONWggy5rgWpX++X29+SCoaZatkOOwJ10/ir7TeBL2gaEon58h
	 3i58H4i6SzvddpjLTMxueNlzoT1EnPnKcTp2of3PP5br9hM9DFlvqspWpz7WnZHH3b
	 auUF9oDP9H3VuM03LAcAJeVYjprTB+6O71Kx/THxRYhxt3kN8bzfxnJ+YMtICJHoKp
	 HjsGzaww3G46Q==
Date: Mon, 16 Nov 2026 13:13:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Letuchiy <asalde.le1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mattijs Korpershoek <mkorpershoek@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-input@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/9] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT6895
Message-ID: <20261116-imposing-chicken-of-strength-108fe5@quoll>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
 <20261113-initial-mt6895-v2-3-4ab0aa9fa391@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261113-initial-mt6895-v2-3-4ab0aa9fa391@gmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 10:04:59PM +0300, Alexander Letuchiy wrote:
> Add a compatible string for the watchdog of the MediaTek MT6895
> (Dimensity 8000/8100) SoC. It does not fall back to mediatek,mt6589-wdt,
> which implies the MT6589 TOPRGU reset layout, as the MT6895 one is not
> known yet.
> 
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


