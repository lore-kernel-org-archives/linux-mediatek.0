Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C704C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 12:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/IP4ZZOX1YxY4gIgwoObW/ELNbIIlsMV8cWkMSuALys=; b=IVoFAdJ1iVPdQQtEfjve1Hb6Uw
	rtG8/8EHonoA5cKCfNeGfLOZDY7AQz0Gb86HPQOCaf0tsognwgGrwPCpOcre7T94VwkhGFvFx7PkP
	s4DcVyjSHHgKD0GMGAu9g70mxKGCKloTVArBGMUKEX2TcHYxT+nC30nkdZoGOwt9xbLYippSMFOws
	prOqfRWP9oWWsOTdYXLK7udm4xz0juQjSTI5endrc4kb2AgoDEo98M45CyP2pE7KffmR6wMrSTjNA
	UB6FMzxJPGmEZwnnPVZZVaTOrWvm53UyYtOJVAlDbQFrEMkcAFzR3nssXKKqDTzxSRuMZX5gSc0yg
	JFrUZmVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD287-00Bik1-10;
	Tue, 12 Dec 2023 12:44:55 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD284-00Bii8-1B;
	Tue, 12 Dec 2023 12:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702385090;
	bh=fh7FZZL1dXFnJ9a0fCOZXUu1JWD9X6vCmcu50N1gCII=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MyzPT614PHETIJY9A4KrepPh7kIgIFLCBrtwSu3VbS6qqbIg+N4JUKGWaIupfXUij
	 qwgIYe8synYpFPr+QYelmrgEMu0FwnQMlEX924slEopJSTYFm+CV8WEw8Vzx0WA5WU
	 GErbWHn52a2Nce+cpcldnlro4qFTPzidp03UbVxyiLtwUsvBTUYVRzqmnIKab4yEyE
	 uB5Ie1lbhCDlTw6IeXD1ZLezFpDzeK/MKtZ7XfWCvDaXJLR04H89ueZitY3scvo9CQ
	 BMVOLB+RKRODnggXP6XsDW17fRKmN8qwFOlxRLHWnZRGCoe1wjZrqZ8B82zOYI5l7f
	 WpL+0X6mpAaNQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D1AE13781433;
	Tue, 12 Dec 2023 12:44:49 +0000 (UTC)
Message-ID: <25ec0476-0ee3-4f2a-b0e6-ee33580159ab@collabora.com>
Date: Tue, 12 Dec 2023 13:44:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v9 3/4] ASoC: mediatek: mt8188-mt6359: add es8326 support
Content-Language: en-US
To: Rui Zhou <zhourui@huaqin.corp-partner.google.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, allen-kh.cheng@mediatek.com,
 kuninori.morimoto.gx@renesas.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231212123050.4080083-1-zhourui@huaqin.corp-partner.google.com>
 <20231212123050.4080083-4-zhourui@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231212123050.4080083-4-zhourui@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_044452_610533_E132BB09 
X-CRM114-Status: UNSURE (   6.71  )
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

Il 12/12/23 13:30, Rui Zhou ha scritto:
> To use ES8326 as the codec, add a new sound card
> named mt8186_es8326.
> 
> Reviewed-by: Trevor Wu <trevor.wu@mediatek.com>
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

....but this series is going to be ignored like that, because you didn't add the
right mailing lists to the To/Cc.

Please use scripts/get_maintainer.pl

Thanks,
Angelo

