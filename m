Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66268CF8862
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 14:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YG9htjSCPobl/COdWRekRzl35h8XjCefD/TKGqRHeOY=; b=e2FgYWVsoJ2h9fsOEl3TWdeNnx
	a8BcI+nQBCjKKurFKhjOuEeheblmBHI0b243Hd1y08xiRdsW7hoc8afe6ja3sDu6Ic47yIDMj3uaX
	w7HkuWOlbGSISgQhewPxNIjibHZprBoY10v8ljJe+xBcoHTiBt/p6UtXClG/yVKfFMeOUNI5AGGaq
	+Urzp5kbkMMlcPyH2ObeH9tJFDsa6DDTHpyDv2yFVZCUE118GLVTjvEdHZKriW8T1oNE2QEKYqFG2
	zfPENObdiNHBPON3a5RMwQJvoknP26D9oHJTCgDQbj7OokR6WFT0HoGWs6ep8DOhCTdsZYwpK3y/K
	C5IBbdFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5UZ-00000006pIn-3aRZ;
	Thu, 20 Nov 2025 14:18:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5UX-00000006pHo-0dib;
	Thu, 20 Nov 2025 14:18:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7822D4048A;
	Thu, 20 Nov 2025 14:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A1AC113D0;
	Thu, 20 Nov 2025 14:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763648312;
	bh=kF9f4IYE1Y7cHiV7zpiJ1ITnZVqMqwIVtN5rP9NumFo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M41DNbl9tTc1Nl3bxG+tvWu0Y7C8zaDLP+KAsjb0Ay4+X34Z/q9mBvT1A0ubMuNbl
	 /QB/IZQp941lCD7yPVZNk9fkBfC8GzX30fxLmoe1jGTBMVJN3nhtUZmseVSEqFpc0J
	 udfiVYW1/pd7hZeVUygNR3A/tjFHy6oGuDBhzjH3wQZk+WDYXJXoZ9fsIVAwnxZt2p
	 U+vVnFxScU+Od2j/A0Myb4+vetDfsPmWklx3p8hn/GCSg9+F4BaunY1pShITPuoIUW
	 q3hqtYUSxYrNrsKU3uWy/tdyH6bO68blwsKYu6e9OJqWXjl6DxD3t9iZvbKYwAWkPn
	 y9fQY6NiauyFg==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20251117-aeration-smock-5e7ac06e2942@spud>
References: <20251117-aeration-smock-5e7ac06e2942@spud>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: document control-scb and
 sysreg-scb on pic64gx
Message-Id: <176364830946.726067.14196845460912590375.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 14:18:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_061833_209926_FDAD9403 
X-CRM114-Status: UNSURE (   7.85  )
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

On Mon, 17 Nov 2025 16:29:29 +0000, Conor Dooley wrote:
> On pic64gx these syscons are identical to those on mpfs, and should use
> a fallback. Add support for multiple fallback compatibles to syscon.yaml
> with these as the first two users.
> 
> 

Applied, thanks!

[1/2] dt-bindings: mfd: document control-scb and sysreg-scb on pic64gx
      commit: 1f9793a4d5188cddc0eb69d7840b7c5c57c939a6
[2/2] dt-bindings: mfd: document syscons falling back to atmel,sama5d2-sfrbu
      commit: 9494cb237b490cecc8c5d97824692b82097141c3

--
Lee Jones [李琼斯]


