Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DDEECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 11:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2OwdI6bj4cMW9Oc4kfUckxGx6qU/O/TXz07cQ8CYys=; b=dSYkZ8mpWgruDJ6rR6hurrnyeM
	YsDZBrI2zRsfAF90QVtFmSDf6Jv2rGuNITFe6tPbScV2L5MVzZ9te+Y0VcbQW1zHJrmOS5UZm0CE+
	dsJEUCL8/rIpFEzmSYwngA5hEZpfYqC+rqttzoQgqkRfnHq5P/L3f7lroNhSNIot8cQcsQv1C6T2c
	TJaWEuhox0U8gdMDr2Vj3i5c01k0xMDaQDBAaoCcgUYSrmTMDdBXWTHHBIO2IJmpb+s73NUBOsy4L
	4SJJmhTNj1Q2xINAqT5kF/P/OQNH4H4J72j9rxkiELTbUae5jeECFzF9+7fgCz83TY5bJAsflfnWP
	g2hrxy5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snd0L-00000001lQp-0IT2;
	Mon, 09 Sep 2024 11:56:25 +0000
Received: from a7-42.smtp-out.eu-west-1.amazonses.com ([54.240.7.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncuD-00000001k53-27y0;
	Mon, 09 Sep 2024 11:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725882602;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ygfmowPRaEjKrQQZNci9q44h/vDEG5PoM6dtbziwh3I=;
	b=GTrp2e0gqjLHTxUQ40M9ofLiLjsCG5V5qjIKNtGRuspxJa3cQwFOtKMaGQNScetP
	gnXLxS2sxHZiYK5SJ2dhJRylXGhFkFHfC8oq12ISIzrOsxokcHxyhOkVjo+1La9YRYj
	bha1EyfI4mJHF0IV6z6kRvdArsU991T1M39EsuBqXq6Bom+vxo7yRylds9B7csCq6ez
	iaOhRkrMRyDPoIfWIcHU6atA03Op3nA4FqXi2tsoLRZTU002z2b/1tbr/VjIUrvgsQV
	m+Q86NVlNZ1chRnd7VtKrnOtMwZPW2Gcqd7zM3srvrzRibnLRgSo05FQ0X/ftipNxIm
	ts7cXwcjQw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725882602;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=ygfmowPRaEjKrQQZNci9q44h/vDEG5PoM6dtbziwh3I=;
	b=hhEj2D2VsAHIb5Rq7VuwsOFK5gcJiUedcUHI5/O76aWjm85mEWWuu9Yu5bDfO1yQ
	a0oyR/bV5gXOY0927dC0QepQKjI4tolG/Ax0CukQcsRbYxZ9nI4FD+3lENEK/i6Socj
	x5jgN3KgNAtcACA8B/JN4FJ2HATBHmNP0vxGXWFE=
Message-ID: <01020191d69e91bd-6b0ddb3d-ebaa-4e15-ac44-99feee5e0a07-000000@eu-west-1.amazonses.com>
Date: Mon, 9 Sep 2024 11:50:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] ASoC: mt8365: Make non-exported functions static
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Alexandre Mergnat <amergnat@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
 <20240907-asoc-fix-mt8365-build-v1-4-7ad0bac20161@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-4-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.09-54.240.7.42
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_045005_721351_CC9F85F3 
X-CRM114-Status: UNSURE (   4.49  )
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

Il 07/09/24 02:53, Mark Brown ha scritto:
> The compilers warn if functions without a prototype are not static so add
> appropriate static declarations.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



