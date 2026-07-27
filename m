Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF81EC53209
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 20:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXkxAzMXIXFrCosu9W3EyUqTk5gQKizKUSmuhAPFZ68=; b=uc/9wx/VzBkxQWJ+B75eQXCnL4
	kKib59Fc1zF2xFE18wlytGjHn8upc5PMsjL04NabyvpSvlww8k2WVnOfNP5NpIfTJg9zzFSk1bvNA
	aCHZNEgFi0rTu0WC2NY3CE//Y5MC1qoXGJQvnJUE+A12b9BcdgpRJDrsfhi+Q9Q+pl9L45X5GU3ls
	+8YzpxucErzXwXZTawdeiMBhlJcwH4grvy7fL3/UCqcFiD5g9/JOZapE1I9WvvQQrd+7c30OivLCR
	DQ1MazsHwQuQahWbp7bxUmEkFKLpamOUZrTWv1csp066X0KF7EYF87MSTyhRpGEijft0314MsY5PP
	BcNX8xQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRh5-00000003oSx-32gU;
	Mon, 27 Jul 2026 20:12:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRh4-00000003oSq-3cV4
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 20:12:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4624141533;
	Mon, 27 Jul 2026 20:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09CB1F000E9;
	Mon, 27 Jul 2026 20:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785183178;
	bh=kXkxAzMXIXFrCosu9W3EyUqTk5gQKizKUSmuhAPFZ68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=au89phaHNhJVD3pPwAzT1BHKXqubkUm2P86+94nLzvreI6Bv06tti53W4KYnjTSXo
	 jZNLZ4xpRdcHvxWWySxLL/SJubHE6DH+aO8qAjEi5UJkjMIv+z+Ahh249B91o5MtFN
	 g5gPg4KwwB6ssR6eFFPcr+YkJBQFGALStB/Ikyfj6dtQFsTk7I5F1mcGdNGs4N3U2b
	 LUnYrXnPHmsST8QIalmXy2nboFXPUB6rzbIKKmXoCn8VhA+o49EgePVVcXo6d/wbXN
	 3SBHCKPESY3JpChyGP4bIgE1RDP90FaIfUa8gsGNFZMcp4PwZ89AzcxANH373cDSDs
	 RbCKl4w0HB+/g==
Date: Mon, 27 Jul 2026 22:12:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Markus Gothe <markus.gothe@genexis.eu>, Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v8 00/35] pinctrl: airoha: split on shared and SoC
 drivers, add more SoCs
Message-ID: <20260727-pastel-skinny-muskox-f99fa6@quoll>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
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

On Mon, Jul 27, 2026 at 08:41:06PM +0300, Mikhail Kshevetskiy wrote:
> This patchset
>  * fixes more airoha pinctrl issues
>  * split combined driver on common code and several SoC specific drivers
>  * improves an7583 pinctrl support
>  * adds support of en7523 SoC
>  * adds support of an7563 SoC

You sent this patch bomb today. Wait a few days between big postings.

Best regards,
Krzysztof


