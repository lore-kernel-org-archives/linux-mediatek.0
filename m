Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE5CCD68E8
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 09:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ylj6uLU9Oz3nNV5wvz3CPuIOa3pvMuBhd+xLxR80jF0=; b=AD3sQv7IYU515rgQI9yyVZyzyB
	mO3R7KUJ/+jmgISKbfuJmSjm2BXbabvcxBuaoAOtbwNa3OuHWSs/Af2FLrZb5rv3VfwjpcRViv6yH
	iu0j+vb9GpxKBSaSj4TyATRIyTonbEcbpginwX/kax0LNwTChpXN6r13C9LUyVm5seFhRCjktiYfM
	ElsgEGnwWuOtxpZVV8NxKM3A2/OVZJLjYo1UTtlwkREr6vZmFNZBPT6UVxEHDwTOOpIK58dGlnazl
	SNz9luy5A0iQT+gikWvtOkdzEhHEui4bQuJ9x++SVxo7JvC82LPDEMPHet6Ri6zF3rMbqNVRbYdfF
	thhgsCZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq8hh-00Ctlu-25;
	Tue, 10 Oct 2023 09:07:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq8he-00CtlF-2r
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Oct 2023 09:07:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0B84766030BF;
	Tue, 10 Oct 2023 10:06:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696928817;
	bh=RpOgGZRGVhfUaO4u/weyo+Vj7fpIhUpNL+R1Rudo1sU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f8nnC0tixyeaQ39u6/zLCNXjdI3HCSnbV0aG9spQlHPTvmtsY9fuR/Eg3S4KNwWr9
	 xwWd+6bIX27CapM/QJtvN/HV1xGU+Z9iB00208mLMM6o+Ug97skqP6ezFr2YYdQM1/
	 7yoh8SzwIBNKh5cSpwdK87bwkQzPPhIuXI7q3gcWlQNFUSzInj6xVY4MQ1x5/62mge
	 24qZ58CT09x5R1V/fdhbrQy6piCWQNkeBxm3eQnk2813+63IvY7YuVjTDWS7dOKNLb
	 RhWKIhvO/W+/RbTXivZo0SZk3TCBG4f08miEAxd/0h2F+3t3iC37tZhF4c83cxMHbg
	 XNj810FLiNykA==
Message-ID: <673dcc99-cf42-81ff-47fe-e20079a5e17c@collabora.com>
Date: Tue, 10 Oct 2023 11:06:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [v5 2/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
Content-Language: en-US
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, trevor.wu@mediatek.com
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231010023738.8241-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20231010023738.8241-3-xiazhengqiao@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231010023738.8241-3-xiazhengqiao@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_020659_053321_C71EF624 
X-CRM114-Status: UNSURE (   6.79  )
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

Il 10/10/23 04:37, xiazhengqiao ha scritto:
> To use RT5682S as the codec and MAX98390 as the amp, add a new
> sound card named mt8188_rt5682s.
> 
> Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
> Reviewed-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



