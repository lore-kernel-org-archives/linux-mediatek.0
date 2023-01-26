Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1EDC05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpShKnT8l4uBvTiN8b4jBaQ9LUSmIno+HxrSbwCoG7Q=; b=wwvZGy/mF+y2c1Bp+Gag9DLVSR
	dBJLFgVD6tZX4c9hsoPLc6W+cMP7ul/vFJr/gXVoPQFhBpOcTcej8OERe2KdzU5l6t0y1ODN3b7aW
	3d8lMw5njP+kqX4vfPRAdCitkwTvNorEVr4195ZTLHEie2FRUV/mqjMGP320QwjQOkfque4jppbSz
	xqqK951M4xSyLBFWWyBRurBWN65qS+8OPZEM7qVETJlRWGuvoAIkcDCHjAar6wWvJ/zQrbTnTQwnw
	z/isbvjFmJPBIl0h5HdyhnFrNOCfBrQDps+bOgh3rg+yUXFgHnh+OAxBz0QCld6WA3oWthkCsdFzM
	ipNt41xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4Dl-00BWxo-Ea; Thu, 26 Jan 2023 15:31:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4DU-00BWsq-CX; Thu, 26 Jan 2023 15:31:09 +0000
Received: from ryzen9 (unknown [79.119.122.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aratiu)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B411466018E4;
	Thu, 26 Jan 2023 15:31:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674747065;
	bh=6l03pcXoUO/jHX88INu7oBIANmYByZgCGrrOf8ec8TE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=j1Fj+iWfuNKhwLJchHJXaeWh5IVuL0FfKzwaMsYbmbYtd2l9Zn0UIqMeLoaU4n/F+
	 4jtru2ouZzgUiUTx014f31+8o5cdEC8m8aA7LiazFvig/51vh1Bx1bVCFzukswKpkQ
	 RnRLTTLMkpOjKcbyHy3zo3ycpvcrYdLURClRKDU87PkDeHhKguJ649mrBV2RxDOPzf
	 miPHXgy267Eh0Cn7gEaDG2vcR2I378DEII1DpBPz5egq4sW9jpqpqRL5LjGoby+4pQ
	 xerjzHOWrllJey+1NsxWMLQyI/gDhDIGkePJPiCZlvX7Tai3aG6JE9yhQideV5oiDv
	 u4CrCuG0kvVIg==
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: u.kleine-koenig@pengutronix.de, matthias.bgg@gmail.com,
 weiqing.kong@mediatek.com, jitao.shi@mediatek.com,
 linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, thierry.reding@gmail.com
Subject: Re: [PATCH 0/2] pwm: mtk-disp: Fix backlight configuration at boot
In-Reply-To: <20230123160615.375969-1-angelogioacchino.delregno@collabora.com>
References: <20230123160615.375969-1-angelogioacchino.delregno@collabora.com>
Date: Thu, 26 Jan 2023 17:31:02 +0200
Message-ID: <87h6wdxqh5.fsf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_073108_577705_F5207CB5 
X-CRM114-Status: GOOD (  14.52  )
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

On Mon, 23 Jan 2023, AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com> wrote:
> Since the pwm-mtk-disp driver was fixed to get PWM_EN state from 
> the right register, an old two-wrongs-make-one-right issue 
> emerged: as a result, MT8192 Asurada Spherion got no backlight 
> at boot unless a suspend/resume cycle was performed.  Also, the 
> backlight would sometimes not get updated with the requested 
> value, requiring the user to change it back and forth until it 
> worked. 
> 
> This series fixes both of the aforementioned issues found on 
> MT8192. 

Thanks for the series. This also improves backlight on MT8183.

I've been testing using the panfrost driver on a ChromiumOS 
userspace on a jacuzzi board and I've had issues like the screen 
going blank then not coming back, which these patches appear to 
solve. Many thanks!

Tested-by: Adrian Ratiu <adrian.ratiu@collabora.com>

>
> AngeloGioacchino Del Regno (2):
>   pwm: mtk-disp: Disable shadow registers before setting backlight
>     values
>   pwm: mtk-disp: Configure double buffering before reading in
>     .get_state()
>
>  drivers/pwm/pwm-mtk-disp.c | 34 +++++++++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 11 deletions(-)
>
> -- 
> 2.39.0

