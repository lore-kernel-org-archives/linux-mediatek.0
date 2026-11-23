Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AF4606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 12:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z//011Eu;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OyV2PCBJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bqbUZFybYwrKL6TCArPSsR3vEqPnEk4U4p4dC8FCLAE=; b=z//011EuwimNU7R+1e6AmWqvVY
	nO9o7RSh+6etEryK5SmH1X3tw4FTLOCIDJ3X40XYBM7ZVmc0gj5PdEGf9bsLmMro1Q1kmWfM4NOww
	DRiNlYPCPF9r5K8ZaZhGBKZd+zr8vrkh+AK0lzZTRK5Y0wXKZLQ1Y7fs2Wex2j/pP7elLKQL70KJm
	L00HUhqJ7Gb3DAWOzoNcwGABV2d48ggyDBEBFrCiuB12YB51lMBGiwDFi8MOGKaHkFkhcntymUxJb
	0kZTzrEt1JAJ0wwTAxAKoJxoTI/vj1vGtJ7n0nxK7amKopaEW7azFZ57UIcLLQNdlk4HDgmvHpgwq
	zN6q94tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVT7M-00000003M1h-2noY;
	Mon, 23 Nov 2026 12:25:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVT78-00000003Lyx-2nSY;
	Mon, 23 Nov 2026 12:25:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 07B4A620E3;
	Mon, 23 Nov 2026 12:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABDE1F000CA;
	Mon, 23 Nov 2026 12:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795436741;
	bh=bqbUZFybYwrKL6TCArPSsR3vEqPnEk4U4p4dC8FCLAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OyV2PCBJJ+im5vPd3xyuANOjncvF8C1bCv0h2kafDuHWsWqdc/RrtvsCYCVBNf2sZ
	 hE8C8j9By19o58nXKo0bTBiZ0GAz2TZNmv4aqVbpHjweT2AK85Zg+d16vRzfO7CZ+C
	 AFvtpIPT225W1kPUPuknuXCiO7sFli/BTDxuca7TfKmKf4j1uu/jfFxKI9ZqMuaiHJ
	 B3o+6+rPu/2M3n7j88L69i0B6a4B1eI9A4yY0smhPoAWmze7f8VgV6psvWfExo31w3
	 Qd3CKUTnqX52ta8UzCFXREkp+AvTCMznaLYdScQ7nhxgDQX6UDLZax39fa9ZdfkO5t
	 4on4/LFaOVg5g==
Date: Mon, 23 Nov 2026 13:25:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rui Cao <i@udp0.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, linux-serial@vger.kernel.org, 
	phone-devel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 MT6833
Message-ID: <20261123-puffin-of-splendid-fertility-fb7ba0@quoll>
References: <20261117-mt6833-base-v2-0-058a0685c40c@udp0.com>
 <20261117-mt6833-base-v2-2-058a0685c40c@udp0.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261117-mt6833-base-v2-2-058a0685c40c@udp0.com>
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

On Tue, Nov 17, 2026 at 05:11:32PM +0800, Rui Cao wrote:
> Add MediaTek's MT6833 (Dimensity 700) as a compatible of its own.
> 
> It can't fall back to mediatek,mt6589-wdt, which also describes
> MT6589's twelve TOPRGU reset lines: MediaTek's kernel for MT6833 resets
> the connectivity CPU through bit 12 of WDT_SWSYSRST, past them, and has
> no full reset table for the SoC to take one from.
> 
> Signed-off-by: Rui Cao <i@udp0.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


