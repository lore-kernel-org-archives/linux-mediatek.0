Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E32C43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2026 06:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJNxsIbjOvKv5Z4KyI22FNEB/VGm79BTV2nCIXFX1mo=; b=n1/gDxwpBTp4J8eKOaRN3XlRfy
	y72UXgHSrg8DJ6Vjw7/vjpy1YqXTsTZ568icmEGZY4W00d27nzHlfVNrTtFg2QDpQVF7QDo1mzYKe
	q6r10WQETjiXrIvHtK9ueiEaBqGd3VoOyvMajZ4m99smxLDqIxwTrvh47uB+sjSC09KotgOclaoZo
	XA7IiyuHetwL7UQdqFIGNMOGjEh2sit1HFn7N7pwKiCcus+3QfNPr5koEM9Le3bBN/ErS8fM4ce8j
	3I5pg/KTqHqnDhhjYCL6B0Tj/ZuYKl2EuIhG74kZeLttz+fx+DluEhNUqpePc6591SHz8q2oq74tv
	rmmKRlKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5gm-0000000Dm5H-3sEi;
	Mon, 29 Jun 2026 06:41:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5gl-0000000Dm4f-1A14
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jun 2026 06:41:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 16556438E8;
	Mon, 29 Jun 2026 06:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEFF1F000E9;
	Mon, 29 Jun 2026 06:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782715310;
	bh=LJNxsIbjOvKv5Z4KyI22FNEB/VGm79BTV2nCIXFX1mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IajG+TGLQzVGcp/P34WawshYbFzWNQmxMSxCpOp8Tqf4IH8lr0kc4tiJMb9BItj4k
	 vgGyymO1OWFVZu+kmu0PRFuCrrw5Glq+6vsl0JDMb/tTYUXYzge42eLWHHUmSBkjBo
	 piz3hSbHbaBn13GLzMGyfQCeBk20qJ6/gLsCJAAaNwhB8Hq2TS8GOgBoD59QcQHME0
	 7jyQ9oK6I3Nj9lxj9PtAmyiXQ8rgpt+aaUe3//4GvfHnTOtLG2CVv8BcWukwWAPMmN
	 hQRivhOSxw5I9RvjPDxUHUqvnlWCf05hdwHhVr7hvjjtLZpv5atmcHo/r7Nkhk3tq5
	 nFDDAtbJLYoKw==
Date: Mon, 29 Jun 2026 08:41:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v6 06/17] pinctrl: airoha: an7583: fix muxing of non-gpio
 default pins
Message-ID: <20260629-inchworm-of-authentic-adventure-ac9eef@quoll>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-7-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260628143733.273651-7-mikhail.kshevetskiy@iopsys.eu>
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

On Sun, Jun 28, 2026 at 05:37:22PM +0300, Mikhail Kshevetskiy wrote:
> Current an7583 pinmux implementation have following issues:
>  * pins 51 and 52 can't be set as pcie_reset, current pcie_reset code
>    will sets pins to gpio mode instead.
>  * there is no proper way to set pins 41--54 to gpio mode.
>  * pins 41--53 can't be actually set as pwm pins. These pins must be
>    muxed to gpio mode as well.
> 
> This patch fixes above issues. Also device tree binding schema
> was updated.

Also was updated? "Also" is a sign you are mixing two commits into one.

Describe WHY you are doing things, not what you did. And describe in
details, becayse "binding was updated" brings no information.

> 
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../pinctrl/airoha,an7583-pinctrl.yaml        | 14 ++-
>  drivers/pinctrl/airoha/pinctrl-airoha.c       | 99 ++++++++++++++++---

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof


