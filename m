Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF7FECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 11:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+wsEOz1lXmh1dQ070ZA0ZNsoyuii+m0sEQzkpV+V+4=; b=0IIfbNJAi2jVrU047u3UVo9nrH
	2ps++8W3b0WmMXYSao2WOb6as4kfI2NDC0hqVir+HeKTVpbbCEx5e0MzvjXuF4DFCX+MnhQ8P67N6
	DhGmLyPj19hDGDR0pLSlKOCqzBC1wg+WOSMvw0lPZpJ1WbE5Y/NV+1mxBu/jhICINj+qa+eA2OL2g
	Shflc7J29Y91lTeWtEviBzVKoAuGK8RjasDac3fABtTJeJm1+Cjb9ahkle64fxVJ7HhtsEXxRA6rR
	ZJW5AFuMnafDthgfaHA4A0BtPzGKt2CIc95SYXAC9PCOMVrr2bQY8rktMI2H7DzmkpSFkWs4FMnH0
	F0hxDszg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snd3G-00000001lsh-0Mq9;
	Mon, 09 Sep 2024 11:59:26 +0000
Received: from a7-39.smtp-out.eu-west-1.amazonses.com ([54.240.7.39])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncuH-00000001k6m-3HFg;
	Mon, 09 Sep 2024 11:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725882600;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Ds/iFWKEadcyezEOhzSp7/w1QfqVAzd+958xE/zYiKs=;
	b=A9DkJsXecUzSXKSBfPyuCspayk0urKCgg9VXRtiLU4nbwS3y/1hejKEMytcmt+Rn
	F7GYKYFmaFy/37rUzPvG8KDGn3bRbbHGhjGTkCO4oZyUKSjOXBz3FSFbxRG/jclbTnM
	iNQjeGtND6IPTw7WcJNRdGpC4THBI0jyh8YDqLcRrBGwA1J1dk+EP0dxP5fXMlH3XBi
	m/EFdHzmWAzZ/RlNgtWljbF2B8Cq5y/vdLiyHiSg5NkgHcNrzAbVmGTEEz4b0FxACTU
	qPNdsTK+EmaFy029VkwC9KGrvUJywoEVF+ZkEatxRoSYe3aGm2QDqyPjSnoa+TT9HaJ
	DuP2qb0gOA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725882600;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=Ds/iFWKEadcyezEOhzSp7/w1QfqVAzd+958xE/zYiKs=;
	b=XcbUgz4WOi+t2Og+VHeGt4G07LzJvsDKUBGKfCIH7nCtG+sk6s0JvvZK/Sn9m+cC
	Tx1+oXsiyc7ccIOOOWnnK/tdZrt2qIRJfWDl70zFn7h7/wx2oDa5vKRRXl2YzIrKFld
	DkruMCWvJXvFPHpTzeKh+/ojGd8jfoWVzr6pdWLI=
Message-ID: <01020191d69e8a97-8bce7a3d-8327-4aac-b280-7856aa17f31b-000000@eu-west-1.amazonses.com>
Date: Mon, 9 Sep 2024 11:50:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] ASoC: mt8365: Remove unused DMIC IIR coefficient
 configuration
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Alexandre Mergnat <amergnat@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
 <20240907-asoc-fix-mt8365-build-v1-6-7ad0bac20161@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-6-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.09-54.240.7.39
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_045009_998183_DD7171BF 
X-CRM114-Status: UNSURE (   8.69  )
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
> Nothing ever calls mt8365_dai_load_dmic_iirc_coeff_table() so the compiler
> warns about an unused static function. While it seems likely that something
> should be calling the function I don't know what and this is breaking
> -Werror builds like allmodconfig so let's just remove it. It can be added
> again along with the user.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



