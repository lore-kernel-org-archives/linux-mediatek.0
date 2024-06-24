Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2871BC2BD05
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 10:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXLm11CQ7nSJq8dNx+/yqxEZmqg5awZcUHKg5MYRnkw=; b=227S95tvpZrT8g9yKLYaDKTjRO
	371ERXg1bRgW+XqQiWs1Zo+A1sQzOW7VwTDDEIPF/0L0Pk8I/d0t/eSwX3JoiYZZXmtvPr1DFDsqv
	R8piScRglfmGfvFUqc/RgYFqkXOc+qmMj17EyH3GkYXbZpe9eComeFwh9KIAuZkG+N9Xuh6V1wUEh
	YY0gOTP6z0Dw4+wAtM21qhN8AP+IC6tx/iEx7o81cLXNrA9HOGMYls2+ZxypJBQjxKiAruFd1yZ56
	OpucgUXNKz8pTS/0m9ctVTPAH+NubOLJohlE1vT8L/Tk0wtQGvAnBD3NHG9rMpmE3BMfrPFYgENt5
	CN4XY0AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLh91-0000000GSZ8-2WFH;
	Mon, 24 Jun 2024 10:41:55 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLh8l-0000000GST0-02Q2;
	Mon, 24 Jun 2024 10:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719225695;
	bh=ch79Gc4lN+MutdQw3n21VfhYB3S+xxQl2Zt4rck1GkA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gWqpFYDCfjvsjIxpdYoqJpYMFePdYu47YNMg3K4l/AUDHd8A23uwWl64X5O4iDOHc
	 E5OYq3/6gqNItJDl5zXdTv8vv78WsCRrf9aeCN1lHYx1HVanCRNXdBF1Uu4URzdKNg
	 L7heeD4swiWxLHea7QUT2S0qFejToBON+x6JQzrm2T2o5l39Yf1QTUl0cDcCNVN6QN
	 2KMrtGHesVp3RBU9EtOVbgm0O+iqAPW5f/aF4M94Ivjel1t+ceFsi4qQbgAI/2TNVl
	 /LEPdt8wgRnN/9YRkQvo/URgo6SeXHcYQAPYBC3ELicoJpGf2V896rHW6nHy8Tz4jT
	 1U4qTlTgT2iKw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 920BB37804C6;
	Mon, 24 Jun 2024 10:41:34 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240131084043.3970576-1-wenst@chromium.org>
References: <20240131084043.3970576-1-wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-pico6: Fix wake-on-X
 event node names
Message-Id: <171922569452.118951.6374702543431403561.b4-ty@collabora.com>
Date: Mon, 24 Jun 2024 12:41:34 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_034139_253329_42D692DA 
X-CRM114-Status: UNSURE (   9.13  )
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

On Wed, 31 Jan 2024 16:40:41 +0800, Chen-Yu Tsai wrote:
> The wake-on-bt and wake-on-wlan nodes don't have a button- or event-
> prefix that the gpio-keys binding requires.
> 
> Fix up the node names to satisfy the binding. While at it, also fix up
> the GPIO overriding structure for the wake-on-wlan node. Instead of
> referencing the gpio-keys node and then open coding the node, add a
> label for the event node, and use that to reference and override the
> GPIO settings.
> 
> [...]

Applied to v6.10-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8183-pico6: Fix wake-on-X event node names
      commit: 754e69efd5012248786c47c83d6204599feb315e

Cheers,
Angelo



