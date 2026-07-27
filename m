Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEA3C531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 20:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t10LDD82XwrOtVaO7ZJVSu8lJ2IMTbdEHauI3Nd/+uw=; b=lXdRtTGlDp3uL+pc4nPeGqv0RU
	fnuKxWLyPs/wV3Hipbn+FUjmbul4kaUSbB1gyyJLPVq0PtBDoubqciwP3DbhKtXEWRhoJxcCt4phk
	/cToxdVqs7Q+o9s7parHoJs/AWxS/3Q28Tx4wlExoFIlgHEzwWq9HcqbQgclPq5Akp1lh1CWLB7g/
	j13S6CGN/2DlRAozzF1RVO6rr8Imgv+bIm3+jTodM6gvkpy0U+TABV4oOj55G9IqHpPk4Uxvu9441
	z0Aq1nHvhhOMWZnJ29ptK1rjjtiIXwCp0klUg5P4rZngZ2aP/PBFb9/DAB7be3r343bNw7hASBnVn
	GGps8RWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRiE-00000003oa2-46YS;
	Mon, 27 Jul 2026 20:14:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRiD-00000003oZw-1wSC
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 20:14:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E5D8160008;
	Mon, 27 Jul 2026 20:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932B71F000E9;
	Mon, 27 Jul 2026 20:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785183248;
	bh=t10LDD82XwrOtVaO7ZJVSu8lJ2IMTbdEHauI3Nd/+uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dxEGY8TrfYCEfqkblWiu02WRjBRkFEKI64fkLucE5JCdKAODz0XRDSui7rvo4HJDc
	 6eQ7E/os++Bk5I68uVV5EtsqUaRwsJxwrfQGNHXVqbnICAiU5Vx1DzhjmqbPIMI6s9
	 etVlKxhYMHKU589qOl+yvh4FUiPbdZwVjWn+rqrqUnNNxMoOzoBmj4MRy1dCrq/f9W
	 MLeYfSWyfpiskpmJnv6zyhRY/qg3PqkFjV8YtP5YvYEN+HOqEaE3v44A2VdrfpvRJz
	 Xsiwx2ywJ0Ndnl63AMVnJdt426YCi5JZ6tcEfoDlF77TClZsbBk1lEDgqNTxipOzIt
	 u4caS7zlg7fGA==
Date: Mon, 27 Jul 2026 22:14:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Markus Gothe <markus.gothe@genexis.eu>, Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v8 28/35] dt-bindings: pinctrl: airoha: an7583: add
 pon_alt pin group
Message-ID: <20260727-stalwart-ruby-cobra-2ea577@quoll>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-29-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727174141.664933-29-mikhail.kshevetskiy@iopsys.eu>
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

On Mon, Jul 27, 2026 at 08:41:34PM +0300, Mikhail Kshevetskiy wrote:
> Add pon_alt pin-group support for an7583 pin controller.

Why are you adding one line per patch? Organize your work properly, so
the same logical change - adding missing functions - will be in one
patch.

I am dropping all patches from this series from Patchwork.

Best regards,
Krzysztof


