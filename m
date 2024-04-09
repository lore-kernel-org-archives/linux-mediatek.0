Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B673CC67861
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 15:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+zSuTvHp/UhMc+aA1irvxjz/IORRvxR3Fiuph9vntY=; b=qrxj+x67vPEP0BysP2OApIyfrc
	XwdmZf2RJwQ5Ri2AiL2M9qQk6O3qxDCdC//abk3OZUtTWPU9NTcXPIrD25utv4XoNDQO12YQ0htPa
	3pROx+ZFnvxONED+5Gws6Or2EFBXkWKAjvi5hBlZYviyDq0U6qWxcXxUC0bwZSJ22V8ogc4i2SFzA
	yL/w0Q92oM4Z7nlIMEc1Sh218d1DS+5XwE+lO68Aatfuz5CkHtUqRMFiA5HWtXU9xDT+g1o6XsZA4
	gK+y/GkJuLerl+J8uUq8EyakDwEal2MKQGljk7j6zudfirNPr10dXhgI3lYMzJTRtQdlH70PKEfXH
	ltntLn4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruDNB-00000002hUZ-0ocU;
	Tue, 09 Apr 2024 15:26:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruDN2-00000002hO1-0J8D;
	Tue, 09 Apr 2024 15:26:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 23BF1CE138D;
	Tue,  9 Apr 2024 15:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4A7C43390;
	Tue,  9 Apr 2024 15:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712676397;
	bh=oCGXVyPyR9B3gNUVZorJo7CahECeQomuVMDkB/ArHes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FmuY8Bcjk7RIfLkVWu5lRVYTeo0dohNfwjfmvJ9X+LABWVwUCJHFLc1AwmqR++tW1
	 2NziFaHSE4+XLtT5of3JVlEaG1p1neewig3CNaBhOwODe9s5hJnwTYT+n9K7M+hdkl
	 c4PJgD9/W03RtH+/WOrWe5pghLTFWucpQc0qrrjB5I6U01EmWKOp44TWRkySbY2xgC
	 H1NWK15e8yIk6olNHLX0B4GWN8f0pM7l7bZjjmvRgG7ljmA3MgVcHfrozeNR31L+en
	 LxWzIijG1kPkFcUEZL0GE41EjRTrpSsk75EdMMnRv4Kes4TsbaQdN7xPLoRQsmO/Tj
	 PpAtlfUrhu0kw==
Date: Tue, 9 Apr 2024 10:26:35 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Golle <daniel@makrotopia.org>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] dt-bindings: usb: mtk-xhci: add compatible for MT7988
Message-ID: <20240409152635.GA1289655-robh@kernel.org>
References: <20240213130044.1976-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240213130044.1976-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_082648_769050_F016E7AC 
X-CRM114-Status: UNSURE (   9.56  )
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

On Tue, Feb 13, 2024 at 02:00:43PM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7988 SoC contains two on-SoC XHCI controllers. Add proper binding.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
>  1 file changed, 1 insertion(+)

Seems like this got missed. Applied now.

Rob


