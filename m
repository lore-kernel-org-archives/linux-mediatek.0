Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5B0606A334
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 12:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eYccfx/4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z8G00Yrp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MbbNnl/jR3I2yk7n0pnhFk5B2IOyBxzkEUr5ZXc5j/I=; b=eYccfx/4Wj+dX5UtWIOSDKzliZ
	9w0uQVIIvQJKo2ixSOcq1uoIKqUIA0j7zRUxhHf2ogsSchWlJgkuuu3PjXv4e79ka4w+lFpZOKPt5
	HY7t0QEEksg4jtbfbA9L6IEIxajjarcaNUyfyk2kJyqvUVXnRnWWGElicmJz261m8k7FHVc4iEQKT
	khjkKnaShBuHLqe2qzaTeJCUcTG+IZmvTnKOiXOxVidMXFXyb6NhD/83Ynk+2CHNU3U+t/C7HTs+H
	Gdzlto0GHEJe4su2U/3XO3SPuftjQTk5whL5OS+g16t/OGF4XZaIcJI1l2sNsldGgXyoymUMoYwn9
	1fRML7wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvbK-00000002Jq9-0SEw;
	Mon, 16 Nov 2026 12:14:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvbI-00000002JpN-1kIu;
	Mon, 16 Nov 2026 12:14:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C70D140E47;
	Mon, 16 Nov 2026 12:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B25D1F000C5;
	Mon, 16 Nov 2026 12:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794831259;
	bh=MbbNnl/jR3I2yk7n0pnhFk5B2IOyBxzkEUr5ZXc5j/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z8G00YrpMZOFOLqZjGfm3ltH/GlUUkVKqMZNf93IProiIv/J7xu2U8EjH0ShqbYoc
	 AZTrr8aN+PE0KX8sGiQ0y0J/Af511zBRVAkPbsNdA5vE5tATFeEZRJbHeMVOodUZrv
	 OH1aN31qJVt1rpseTxC3rHTlTYnuyrNYpUlGw5A5PbRDYoSzFc3F6b2XBju34Zudl+
	 RcugStbk3rSR74W9Rt2YP7q0bzjHJ+Ult/PEzZ1vAAU3fBqcYeBuLE94ldhW7znMf7
	 xu60wi38paiT0gTQauw4tOmTwpYX+2FK+rymiMhTGpfJvg6me3WtKQr0zB/0LOfVks
	 cdnhwm6iYT9PA==
Date: Mon, 16 Nov 2026 13:14:10 +0100
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
Subject: Re: [PATCH v2 5/9] dt-bindings: timer: mediatek,timer: Add
 compatible for MT6895
Message-ID: <20261116-shiny-encouraging-mushroom-dc03de@quoll>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
 <20261113-initial-mt6895-v2-5-4ab0aa9fa391@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261113-initial-mt6895-v2-5-4ab0aa9fa391@gmail.com>
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

On Fri, Nov 13, 2026 at 10:05:01PM +0300, Alexander Letuchiy wrote:
> Add a compatible string for the system timer (SYST) of the MediaTek
> MT6895 (Dimensity 8000/8100) SoC. It works with the existing driver
> through the mediatek,mt6765-timer fallback.
> 
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
> ---
>  Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


