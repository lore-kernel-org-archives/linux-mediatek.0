Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4408BD1F9C5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 20:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqVt/spvnFRxjn1WXe0eVX2euq2WpDzvF69NN06PFJw=; b=ECotmH9d8IUZ3WACqisnuyjOk5
	3/WqGe+tsKW6hw+hzzUoo77Oo5xysYG1jpOwmlWmzQJlgUvXye02zBj1T6xafC6MktgIJfjpp3sqy
	octh4sxsbQ3O37r6RGZYwsCZevnsYX4/ZC3GXiWqAtGI5cofBB+fzCp3bQZXBO+9mSnvE93OIAkH6
	MtbvfVl/wQI5+q5m/AFehUeDqeUGo8RiB4hhp+9k7aS/ay+HNmhr2RYtWdYjaBvPQoxerReVgbyoX
	bkczWjZqJ4r9ah50PqrCjuL1l6WJ2DroMZqFuEU/xzXkAWeMQL3f295AfrtWN0W8yQG/hafRmposI
	4jdE2blg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0niA-00000009SEu-0XtO;
	Tue, 15 Oct 2024 20:00:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ngk-00000009S5N-0FNt;
	Tue, 15 Oct 2024 19:58:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E6DCE5C5B34;
	Tue, 15 Oct 2024 19:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A19C4CEC6;
	Tue, 15 Oct 2024 19:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729022317;
	bh=EjPsWgAbg+UEUmMgAu5NLa7fLl0gTr0MHFf4N9ocwHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJxWtuvN2iv48dz6CnEJBhsbL/G7fN+OGZ4cQpm/dsCkCaYRU12+DzaGVCHjRMph9
	 2fcFi9ghE84ehws1OHwNg7lfW9BbNfVlmi0ZLZ1lay6doGelKXH3wzdS/URuJVcE4E
	 2XnaZxm3osz2Q9zzLrx1R5rBgazYdxm7H8cJl2ttBMpnuZXpIh68lwROSkoAQ6r0fz
	 xNTWHfqjHxryup2v+vYCUTOZFoMopfyRPOolKYKUC7uAEbdfR3Up5aAeMlaIZBwwns
	 zQJeLVh+mtpA5IP3cmcMSsXeLDcVGfB5ivSBI0KXKUFtq+yQe4dS610mLVL0Kv8YCd
	 viQz6V70NE4eA==
Date: Tue, 15 Oct 2024 14:58:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, Sean Wang <sean.wang@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	ansuelsmth@gmail.com, linux-pwm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v6 2/6] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
Message-ID: <172902231337.1700754.4934935169511405807.robh@kernel.org>
References: <20241013-en7581-pinctrl-v6-0-2048e2d099c2@kernel.org>
 <20241013-en7581-pinctrl-v6-2-2048e2d099c2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013-en7581-pinctrl-v6-2-2048e2d099c2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_125838_161323_84E2FE16 
X-CRM114-Status: UNSURE (   8.19  )
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


On Sun, 13 Oct 2024 00:07:08 +0200, Lorenzo Bianconi wrote:
> Introduce device-tree binding documentation for Airoha EN7581 pinctrl
> controller.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../bindings/pinctrl/airoha,en7581-pinctrl.yaml    | 400 +++++++++++++++++++++
>  1 file changed, 400 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


