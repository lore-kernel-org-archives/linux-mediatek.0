Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48B0606A334
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 12:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GZFMO10D;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIm50iQ/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Xn1i3YnRkDlooHuSD1NNSSzodVAxCfUHp6XrUWpozOA=; b=GZFMO10DEH8TyrtlKtM3Qn6YWy
	BAPPXFgBGrqGAM3S4LWpeUe6fvmo2MIsm0OZkVpuuDARX3WYSnwjYS2ye0UmPf/G7m+zZeIYQj2jS
	Gm11iMnZQq1vDH1OupiyUJbjMjqtyoS6MQaNl8YGZsR4T1TELyLK0rEVHrHtql9e5NA561HVcwPPH
	uDJt0SCzdr6H4FpFhzhGjcmEayh8LhsStVfjuyNIFmjhP90G1DRY/mHlCVHVobQ1ojXPxlLdViN2n
	jrzFM67QOlGgKfxgAvtPrk32FZ3jEt+u6pXpFoj5YqfwMyldXgqxPoZXD9En7AhUmlgfj+2zQrsXB
	wfaxhbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvbU-00000002Jum-1Wqf;
	Mon, 16 Nov 2026 12:14:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvbS-00000002Ju9-281L;
	Mon, 16 Nov 2026 12:14:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 451D340AEC;
	Mon, 16 Nov 2026 12:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73991F000C6;
	Mon, 16 Nov 2026 12:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794831270;
	bh=Xn1i3YnRkDlooHuSD1NNSSzodVAxCfUHp6XrUWpozOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KIm50iQ/adAvkjf6peIijG/2vh984qmxf9dwhTBLew3nTx0Om6CadhLy96Bx+X5IE
	 wlrS90PvzDhaVba5SucbE2OYb36jax4bZ47GK/qvZz2cssjpevzK+XnVdBg2fPTsHI
	 iumPd2qooRm0CIzMrmGz/GAFYV7sRe7zeIT13kvKz77iOkgz+H1l/cJOFpLZLJ4oS3
	 jvMngguK3FD4r8fP0tIngANPJ60GSldBwSg5AOH1BlhBo1b5/E2Guafwmj0tVsxNEJ
	 HGclFUizCNNxhHJGYzfj8v4yDk0NXvkATJGkl3expuv7buN9kbDnRcuSGEPPipZMkY
	 1bMT8JxIrGJ1A==
Date: Mon, 16 Nov 2026 13:14:20 +0100
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
Subject: Re: [PATCH v2 6/9] dt-bindings: input: mediatek,mt6779-keypad: Add
 compatible for MT6895
Message-ID: <20261116-real-ginger-raptor-0e6eea@quoll>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
 <20261113-initial-mt6895-v2-6-4ab0aa9fa391@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261113-initial-mt6895-v2-6-4ab0aa9fa391@gmail.com>
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

On Fri, Nov 13, 2026 at 10:05:02PM +0300, Alexander Letuchiy wrote:
> Add a compatible string for the keypad of the MediaTek MT6895 (Dimensity
> 8000/8100) SoC. Its registers are the same as on MT6779, so it works
> with the existing driver through the mediatek,mt6779-keypad fallback.
> 
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
> ---
>  Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


