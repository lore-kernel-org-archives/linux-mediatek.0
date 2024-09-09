Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BABECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 11:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grsG/XsrlVbHY+kUn8i1DR1xLGe+9ssjXHQ4I37LfMI=; b=TB14RX8ioW9GmT/zvOYnb7d0gI
	BhBazIKAzhNX6ZPc7BI10+Kf5K/yFTNz3V3cSvezcOYr3NfaIwtDSELLBzDXGyYnanL2CgThJxqtb
	vCnB5B6S7ct0etjlxrHnSEx5By44tv/QYHVd8MaQc1GynLFD3fcaygsBTBR50QS4/ZViuAJLoIWro
	MkT9Uq9JeT09fEN1LrsNe9P3Quxl9lF49osR50htsfi2jFWBo0a2ytjEVkIV3y4iUEDbY6B0eWacr
	T7NFd5k9WTTAgcfq61pK+qmJc7/goiX9ZiNGy4wB+bXCFDUDdS1ck5MatkqrlGq0yPMsE74xl9tKq
	A4m8t6Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snd1K-00000001lf2-1W9H;
	Mon, 09 Sep 2024 11:57:26 +0000
Received: from a7-44.smtp-out.eu-west-1.amazonses.com ([54.240.7.44])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncuE-00000001k5g-2i5V;
	Mon, 09 Sep 2024 11:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725882603;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=v1HhRq7gXv9e6Ou37iAaZkAGoGCYjQzYexGBG0WM8sY=;
	b=Vi4bPpVGjThhSBWLruOFwYIMx9IV2cjoo7stT/ceW7NCgJ2jnosrLuu8BL733U+m
	+x7uuvOGSkUJy1w4CX4wI3DgVSk9kG5TtECl+xm8CZZRHDzioSNyp9Rii0KqPl01SqG
	+o+BK8cUYySasTB5kk2Bv2byjIBXVNDj8EDaEMTGfxGbArOVbc1O4x9Urg+Jnt2EPY4
	xR+iZdxjv7N0uw0IAAMQy18uZf11bbKOOf81QnZEqjgsAmQ55MgPtMwGgagvAboS7Wp
	Rr0C7iqmwa8NXea57VNhhjIAm4tP30PP3imSJ0GmspJHBzi4PJECqOScfJgRxw+wH6+
	6/Z5q7e5ww==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725882603;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=v1HhRq7gXv9e6Ou37iAaZkAGoGCYjQzYexGBG0WM8sY=;
	b=hS+O7T9weNO+RnK5HRVHtT1TrMq580Ush7bTjdBbmisSwFmKraVlVZdQN4BmuUed
	rkGtpK3ydyK2PGbGO5/XJHjuY1QmIwdWQDiQ6LNr9e6B/u67lrYPOK7eycKokzu3Zka
	fYSH1BtnSDY57b2OazIPyjKqrE2sx6emhuJA1caA=
Message-ID: <01020191d69e9539-c581e25a-4379-46cb-8bdd-d186ec99f6e9-000000@eu-west-1.amazonses.com>
Date: Mon, 9 Sep 2024 11:50:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] ASoC: mt8365: Remove unused prototype for
 mt8365_afe_clk_group_48k()
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Alexandre Mergnat <amergnat@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
 <20240907-asoc-fix-mt8365-build-v1-3-7ad0bac20161@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-3-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.09-54.240.7.44
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_045006_864747_6F57C29C 
X-CRM114-Status: UNSURE (   8.12  )
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
> The function is not used outside of the file it is defined and the
> equivalent function for 44.1kHz is not prototyped so remove the prototype
> for this function.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



