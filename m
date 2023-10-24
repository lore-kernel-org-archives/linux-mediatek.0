Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDBEC00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 09:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3HnRVdUI/rpUV+zzFX0QJv9nCdOvyM1CPl+kUoP2RE=; b=dyyexduEtrBCOusNq/Dc3aXH3b
	zTItw9pgGtwihRtUu8wbXPORBx/+VPTZ1EjiBTFs6qSSzJZZbiE4nboobBNd2/TlU41l7St81wFxz
	zURdrCUUv0Wn6I8I9r9BSRLwe1Q0+wZvEQ8ByaGJGLWNkXsXVZYJtQ73nRYGCLbyT5hmsBUlm1sac
	rrtshGPJMfObeuoJ8bZ5b/fV1hV8MZNTt+6WzBX1OMze1dtqQ9wlDc8zlDwikNsKUPRGkaWGBBaFi
	g8i6yOIlIAeXTfH4OAoBc3C6hGXbRvlMbJKQWjSXVunqOguQtZUAdgnh0c2vjAmc6VvN10fm2XyIk
	zAAZNv3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDgL-009JOQ-1x;
	Tue, 24 Oct 2023 09:26:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDgA-009JIL-0E;
	Tue, 24 Oct 2023 09:26:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 51CEE66072F6;
	Tue, 24 Oct 2023 10:26:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698139584;
	bh=eyPjnlFwB9ESs7GpmfTaYODwRkcUD8KIZ9RhyRcSESQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=hO+1C/+jaErCZfqqRqqHjQGulYk7w+MiPuEXZESWII4l4TeGM2pBldxFcFW19gn7B
	 3YChhT37kbYsi+kfHnsit30kt4IUo9mBODAXgp78Wlzadhrwjvm1Hr5cOO/6yTC/bz
	 N5vyzsgTOZ4Bh7A95FqPVDljYsgfape72asxOLXeDr19EIQwmAbxs/eH/1VYMZqvTp
	 DGwamU3f8Ctw26km+JgtI8tRE38IGmSAEvbjzNSiE3NCltwidvqAMTg5mp9NLmnxAv
	 lvsJGdFGEA78M9JGVMuOuh16RFwI7zRje8UKg67zYb9is2oAQzPjTjRmitabihpUpm
	 5EeTQZD9eOUVQ==
Message-ID: <1d524b37-f95a-4f36-b78a-dcf865c1a922@collabora.com>
Date: Tue, 24 Oct 2023 11:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: mediatek: mt7986: remove the
 mt7986_wm8960_priv structure
Content-Language: en-US
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231024035019.11732-1-maso.huang@mediatek.com>
 <20231024035019.11732-3-maso.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231024035019.11732-3-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_022626_235636_A99700F9 
X-CRM114-Status: UNSURE (   5.98  )
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

Il 24/10/23 05:50, Maso Huang ha scritto:
> Remove the mt7986_wm8960_priv structure.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


