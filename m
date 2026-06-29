Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCBEC43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2026 06:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wr78EnuqSRjaPvDhU+/m42ml5qRCvbTZ/fBVTr06/ss=; b=TRdpU6vXHdrfWN+nr6mdE8nUX9
	buutEpfzyL8QXsq0RwQ3nSvJP8PG2sc/0U2/ilOpf1F86Uuq05EOYuaeP3IpIivOELy676nZFnwH+
	kFrQBp7g+mFo7FicO66E/AveENDS9LQTDuvU62H28aC/WX6LXDEH/eqWxC2rDuVS+XcWNKiylRKjQ
	2D3/5sI5I9T5S9ORQhquOLvM7hqq86qZGP6tJewWc+EIhfwvPNq1PfTrBTAbxGQl+5ZvbdNv1JYtH
	hc1ugMJTAdGfuFA6AAMy+xpO/tuSpwqH5V2GtlRPDL+U7cJ6QZw2MLVqS2HihTzdBreLPzd0/Boty
	DIMWN/vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5hT-0000000DmJ7-0wOM;
	Mon, 29 Jun 2026 06:42:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5hR-0000000DmIz-2DIp
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jun 2026 06:42:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A3A0C6001D;
	Mon, 29 Jun 2026 06:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC2B1F000E9;
	Mon, 29 Jun 2026 06:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782715352;
	bh=wr78EnuqSRjaPvDhU+/m42ml5qRCvbTZ/fBVTr06/ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZcWPtk8PXmu31LLew82wST+cIuRMIkzO0bscqeYqE89tHzzRY8UUCbVTG+mAM5xPV
	 6KyMUbGNmqiJfLHcqbmX92EpxMdb0Gbxj2LcThHBlXfFjTcs5JKXdOYgXdQ21S+VyN
	 wCyesbUqagN8Jv9gf9pECkTm74xiKAmW0YZco7BMS8tHLw8rUrPK4B60OZBntTwxS6
	 H1UhbLX32TFacBhl90Ugd3qGFNPaQoMjV9AJV7US+BFFm4jAXHX2voesLBERBojZ6D
	 hSY2R2WSlpwiEJ1LTDguwovj+9ZDEE2ju/V26YP5yclTbG4mpU1FS7hx+91QdYUFjs
	 kpR0FjIpcRgnQ==
Date: Mon, 29 Jun 2026 08:42:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v6 05/17] pinctrl: airoha: an7581: fix mux/conf of
 pcie_reset pins
Message-ID: <20260629-numbat-of-undeniable-poetry-deb3b9@quoll>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-6-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260628143733.273651-6-mikhail.kshevetskiy@iopsys.eu>
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

On Sun, Jun 28, 2026 at 05:37:21PM +0300, Mikhail Kshevetskiy wrote:
> In the an7581 case
>  * gpio47 and pcie_reset0 shares pin 60,
>  * gpio48 and pcie_reset1 shares pin 61,
>  * gpio49 and pcie_reset2 shares pin 62.
> but current driver treat them as pins 61--63. This is wrong.
> 
> Also current an7581 pinmux implementation have following issues:
>  * current pcie_reset pin function actually sets corresponding
>    pins as gpios.
>  * there is no proper way to set pcie_reset pins as gpios.
>  * there is no way to set pcie_reset pins as pwm.
> 
> This patch fixes above issues. Also device tree binding schema
> was updated.

Same comment.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof


