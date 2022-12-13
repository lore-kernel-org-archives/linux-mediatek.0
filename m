Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B24EC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/WEpWt3hpFvlJL+R8LvFYdMjKiGeM8FCYzIYGeMAQQ=; b=30sNC9gz2IwumZAw7son7i6sKd
	9zz0nLurDHcwZVTeXiPQDIW8i93KyqkirtZkYCBa1L9wJSrVungwM6wN/iv+R4xWR4+zPH8UUmM/W
	AeYYQ2qApSjHqeBpU6TUH10Z4U+tjsmbezjo7IHnJ63xHZRj3B5XiJ5LJyE5Jh/Cubdcyy1fgyhBH
	jdAw4ergxxtV9zDJD6fHkC7OX/SOn23OLrCSfFBYHA+vmM0OXDkE956MSGbaCON3y77E40HMuquxD
	77CVzHbOPIzoWfWzeOqO1H/5yMzzG72C7bMu9tCzvW3Kc6PPs33bdG4V9mQo+Dwfpa+IBsxt8o5lg
	ffHhJHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p52tK-00Fvrf-NP; Tue, 13 Dec 2022 10:52:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p52sf-00FvEx-DL; Tue, 13 Dec 2022 10:51:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 24C536602AB2;
	Tue, 13 Dec 2022 10:51:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670928683;
	bh=CPtGI1Gm3EBQgjAgidWD2nOZuLxuahaQPZx80t2p9Aw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FnrvvckKqFm5f5w5WSHzXga8eY2j1Zlh+4OwBbS2cgSCLJZItOxhwN6OTwKpdOuUM
	 6dfWe2dg+1EtWVaY94pImHhAp3wxFnp69+M7DmeeRY3Vw/KJoC6Rq8rBOJXr/gdFY3
	 njevkjoaQIVXuCnREJvnm6lYKgA/p4UsgCFp549Wj1YkyS+XQ2KLYUsqR1/jFBmyJ8
	 /n1RMpwIPFB2qjrsY1ZwOeWR8l5VgJqdUXx55E9N159VDIwfpsUdmx3fx0Z3uNtsp9
	 biJlY4u1kt/MNr8u6vqslcs/7U3R7mQTWBX6GgIEZLPU1dIv3cEGfWTHMfzEG/IY4L
	 dA5rg/9pfxfQg==
Message-ID: <2383be6d-8ddd-f12f-5083-cf837f9f9478@collabora.com>
Date: Tue, 13 Dec 2022 11:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 07/12] ASoC: mediatek: mt8188: support audio clock
 control
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-8-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221208033148.21866-8-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_025125_648863_4148E940 
X-CRM114-Status: UNSURE (   5.59  )
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

Il 08/12/22 04:31, Trevor Wu ha scritto:
> Add audio clock wrapper and audio tuner control.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



