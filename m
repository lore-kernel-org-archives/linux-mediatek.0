Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAD6C3600C
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Mar 2025 08:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90gDvk3demECY7VOA8oQ4FS/bffYuplxa5xr+KoTfEE=; b=Czpxz6E/oTPTiaH0hL40XjTMhA
	PGQm8lqYRhRATZPdbHiIAlP/xYUvgzU0g/rax1fdrqpnYtKfFtCQUzmk1sqIssDz1aMm0oGp37RfX
	7PQxidpMVlYz01f7WW8+l64yVOQI6mj0ko1krajWzS5NpsFoIL29NRJkRMX2boP5FE4RspnIDZJGC
	60zHShyTJhGS/WoB9TpvwxHcTaClJ0fGezUQrH/5knv2fwpx027XWWOGVSFLitdHlH4BOiE+h0mVy
	dl8HYTUIjiKbvxbYnL+oCMto3U7QVbjRldQNAfDO1LK1V4ibQdgYImVKESDIePI6oz0P0fn7aNQOe
	7auktnPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twcpa-00000002XPf-00ei;
	Mon, 24 Mar 2025 08:06:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twcms-00000002WuO-39M5;
	Mon, 24 Mar 2025 08:03:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EBAD7A4A440;
	Mon, 24 Mar 2025 07:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3279BC4CEED;
	Mon, 24 Mar 2025 08:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742803437;
	bh=bVc8ppawXuFZXap+bB2SZMErDGCzppriuGtA2w5+FAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mOgNvj+4vU03obYi+4rPDzBTYcup6VXKdy48bVjZY6PqjIisLRYuY3vw6mZlt/36Y
	 Qp8RlSvpnNGvrkfVDldpl463p3uAyBim2nJUr97B1zXu0vL4sDVBUDHTz3B91gM9pG
	 pF0t2ToYS+gmDEc2gVDUHqSiBc4XpuDBmZKaNEtX83WtvcxKtbL6/a4IwVj4EEzGHA
	 RQs5HW+XG6Rv+xUIvvLWndqebzugrx9yh5iVcDQKb7zd3otnRekULB1b7urTymwzpH
	 QtxZBeqNN5N40hvz+WNY6e+BCNfQDGVbMZnnl2B5p3anES6LaWIHIBjefo9fyjUE1j
	 QhLzPg5V7a4Vw==
Date: Mon, 24 Mar 2025 09:03:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, yong.mao@mediatek.com, 
	Axe.Yang@mediatek.com, Jimin.Wang@mediatek.com, Wenbin.Mei@mediatek.com, 
	Guodong Liu <guodong.liu@mediatek.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: mediatek: mt8196: Add pinmux macro
 header file
Message-ID: <20250324-cunning-ruby-lorikeet-aac6bf@krzk-bin>
References: <20250321084142.18563-1-ot_cathy.xu@mediatek.com>
 <20250321084142.18563-3-ot_cathy.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250321084142.18563-3-ot_cathy.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_010358_857301_C391E285 
X-CRM114-Status: UNSURE (   9.46  )
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

On Fri, Mar 21, 2025 at 04:39:13PM +0800, Cathy Xu wrote:
> Add the pinctrl header file on MediaTek mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h | 1574 +++++++++++++++++
>  1 file changed, 1574 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h
> 

Where is the change adding the pinctrl nodes to the DTS?

Best regards,
Krzysztof


