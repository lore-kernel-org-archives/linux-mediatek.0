Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BD5EE645B
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 07:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NiYYi53OwTSL35pVnsPB43ZZwlGaeg2OO4TQAH/nsA=; b=C6xHPFoQH8O97y13jp/kC/6Y84
	G0dN7/grN1Nf9AkDEEl2UH1qNSEO/UEuI7Qcw6eQEkMj//4AXP6k7vEN7dz2f0OsShxgC3ESF3v5y
	smzJoYgCowgKy6bXdNaKUDftALVIPF7qznEa9AaxuyJCNxM+Ao6gWkHd6pe4URtVCiFp1XIBtgXqW
	1DUDUiAlkN9u7Hqfp8wbJfMtBOdc80NFqxqCG6xLxTL2yKCD7tj0ScnwAWcmRbFuwkzV9jdQmC44O
	+0p09Le5NC/gTCLWIRciVykpKXggw9Zb3UPUajSsACxz+7eZuAKUt4BT1e4aoy4gDwfXH1EAWiTAw
	OTs6gyJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soehh-0000000CH4W-07pg;
	Thu, 12 Sep 2024 07:57:25 +0000
Received: from a7-32.smtp-out.eu-west-1.amazonses.com ([54.240.7.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soeg5-0000000CGbi-2DSO;
	Thu, 12 Sep 2024 07:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726127741;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1m7M7RGWH/0IfXhPGV9mtNbCDn8qDXKZ4SD0dBzJTuE=;
	b=P4RmSSJcyV9C35wg9iMZm2BMJ6mSVfYZGNmdQrSGKT/LgWWfXBI6QdWAmnl9keXF
	MC0oDUpT7AzRycQx0n55Pv0uBoVJFZ3HZi9trsRL/VSHop77YTayMRRqQ+wWNVq7W12
	ibEwBHCj3n/G3zId+jlAT1mMVax9ulrLbfOJAOW2rbxNWTeU8N8okVI/tA1siCJ165+
	f9pjljeL98uP7j4JSYYt3KMmOepKtcv2qRwlRPh9zhUSBMx4vfp+GrzcswTDNPv58vh
	DVH9Ax8lAaJabs78yXQ3yMirSQhvz8BmIhuhXwcFYnm5JfEymMgZi0ZwV209QnL6bqx
	HRxxKQRkAQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726127741;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=1m7M7RGWH/0IfXhPGV9mtNbCDn8qDXKZ4SD0dBzJTuE=;
	b=g+vgxaLmyyk3btXWYDOGlViy8dC/odqJkrT93Dc+PQNXEBmp9gNTDjj+F5Yf38AG
	zMp7AgBTgfA9ST49lLyr4qSzwSwe5nFVPnkRz/f+Tfrk1ryBBw1uucNWMzb0qArPJ5f
	r2AtnS2tYtfJ5Q+kAkYp10hwt6RWaHaCJ6ep0GGU=
Message-ID: <01020191e53b1b5a-173497ca-00f1-4f81-be2e-0eed9ba7cd67-000000@eu-west-1.amazonses.com>
Date: Thu, 12 Sep 2024 07:55:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: Remove redundant error message
To: Tang Bin <tangbin@cmss.chinamobile.com>, lgirdwood@gmail.com, 
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	matthias.bgg@gmail.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240911123751.2078-1-tangbin@cmss.chinamobile.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240911123751.2078-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.12-54.240.7.32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_005545_764765_1DFC8C49 
X-CRM114-Status: UNSURE (   5.38  )
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

Il 11/09/24 14:37, Tang Bin ha scritto:
> In the function mt7986_afe_pcm_dev_probe, when get irq
> failed, the function platform_get_irq() logs an error
> message, so remove redundant one here.
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

Please clarify the commit titie, like
ASoC: mediatek: mt7986-afe-pcm: Remove redundant error message

After which,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



