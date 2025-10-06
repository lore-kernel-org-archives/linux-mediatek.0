Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF595CCA470
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Oct 2025 21:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykSuG+jlMa59PgQtNlOKjt0WWar3y1ZxZjMPxMcJ7KU=; b=4KbzXieZcbNQgNUwfC+3f1DLz1
	ccjM3WJ5cr5l+Pq6YfAKTRUv1pLrk6195octlrvDVTfasyKGSCIsfpzUIrjvYuuBdhuWbxVLWQxRk
	IF85ulKMVN8aazUfUrtUOwkS9/aXf7Esn61EEWDXwpT+hrOsltYMBxTwW0DWH5hryvJ8jYvmK1G+0
	/RtFE7t4a17jye9B9D33+0W4NGdI5UIHwJ39RKzFsHx9wf9QCaeGvcdjatYs8k/XJ2VXOyBI4ICmX
	imGRsZRdYYrksPR0Fo9sENSYWlPMiPGzgNN2zZNrG1nInfDj3wN2i7cI73Jo5a874RqUHmPekxgGG
	EgpkZdww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5tDI-00000000sy1-0orq;
	Mon, 06 Oct 2025 21:57:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5tDF-00000000sxR-3lxQ;
	Mon, 06 Oct 2025 21:57:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41981611A6;
	Mon,  6 Oct 2025 21:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C8EC4CEF5;
	Mon,  6 Oct 2025 21:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759787865;
	bh=yp9tR/3bMmlgJmoJe+O7mORmnlg42QVaBRKpSQK+faw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GTyoIor0/sVEIADuKwC2wgz0koY/pk6wANm9phf3dA/bKr5hBzcYwHqszSKqpPCX2
	 cA4l0i8FyBxnWUi31SE26Qw22ZzmmwFflHH2APVfOv7uEGxUzoAmxxZncclZhC2yvi
	 zF/0Ffbfq2BJEHjUvUzaIOkIKVrB9F2cUszSPmI1sgfzD/jR6Y9GOzdRwE79/xP51m
	 el9HfnvxsvKbZSGHiuOhx7KhB0kEObs9wrwscFDOkh64eaEo0Aw3D+2A6LuPhsHOKx
	 mMdvE1E+KkI/JjaVQC9qQuGuxTHSsxNmxY8GR3GYFgPIfoNwRj9Z7UMdnqHPFtvQPP
	 7xor4IFATWACQ==
Date: Mon, 6 Oct 2025 16:57:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	John Crispin <john@phrozen.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>, Felix Fietkau <nbd@nbd.name>,
	devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: watchdog: airoha: Add support for
 Airoha AN7583 SoC
Message-ID: <175978786337.652658.2471025622526650707.robh@kernel.org>
References: <20250929114917.5501-1-ansuelsmth@gmail.com>
 <20250929114917.5501-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929114917.5501-3-ansuelsmth@gmail.com>
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


On Mon, 29 Sep 2025 13:49:13 +0200, Christian Marangi wrote:
> Add compatible for Airoha AN7583 SoC. The implementation is exactly the
> same of Airoha EN7581 hence we add the compatible in addition to EN7581
> ones.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/watchdog/airoha,en7581-wdt.yaml     | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


