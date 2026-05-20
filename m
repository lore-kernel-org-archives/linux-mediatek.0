Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C97ECD4F3C
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2026 13:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUsifWX6aK2jxqZvUw8q1yQUjx3vnN/cEOO8Ykzq3n4=; b=buBB1d7AtlLBAwU+ECVlLzMd8u
	fhh3qmMcvi4taYcge+YhmagfCfxvYTeMoSGU9VcW/MEMGOGLOg9ENtdesAGnXZQ2HJSA9BRQfgtTw
	NyHGPmp1tSV1iz38YzmCXI4+NsPpDC9I3knkMgcXW2dc9iSFcYdgcl8rDD7Q8fPN4SC37onTRr1tW
	iuBmKoPbX6FwymM7bajTr+vqfH3Tj+/lPjH6iEfOzhc18jOmDLSrokY2dsBGE0ZpDjIa+g/h/vADi
	sB+XCBlBiMq9BDstGUV6YsawUpbFuwoGMdJF5XB8h53fZQQmDL2zi2+H5KU2zgTyzwG5xKDlO4OJ9
	dG5pngUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgiX-00000004eFt-2Q7E;
	Wed, 20 May 2026 13:12:09 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgiU-00000004eEZ-3Q1n
	for linux-mediatek@lists.infradead.org;
	Wed, 20 May 2026 13:12:07 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43d73422431so3370194f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779282725; x=1779887525; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUsifWX6aK2jxqZvUw8q1yQUjx3vnN/cEOO8Ykzq3n4=;
        b=TlIuVGhTGVsvdr8CEpjeD3UYlf2sPabc0Ft7IIwxu125bdhTatVij/cq3U+dBpaxcY
         NcaDnbTGOzZMSUYOEk34dlI0pZTM9/8Jaaz9+Iz9CU/opsc3ZNuPkmuZpsMMdECycZP/
         ewjRqNnn19PE4AEDdPgyXP2Ig5H2Xj8Y7JHmZP9wqT3jPAKV8vNdCXaR9aiRCywx2329
         fGrpjqNd7koSIPp2VMmAgqjkzRPWKA8+6PYakIOfa5uEuJOJkJhvjN5rrZkzsthu09WF
         PvEhwu8CoMvZRlBRmVUHTa/wHZ6pc2+HtxTcfVPyXtHGMeHaTMPXPkWCvksL4hT0NdxS
         C2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779282725; x=1779887525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mUsifWX6aK2jxqZvUw8q1yQUjx3vnN/cEOO8Ykzq3n4=;
        b=JIkT99QxcsKtW3G/7Ioj/yffembel6USNx01njghSx65lWun8lUvGCkxt2i3ImXal7
         XxPjgH51mpTw27vmqL0ggrwPin3hVN4J5yTztetOD1l3JGdo5Rh/DLW4k+hdUnCdxL9T
         w7nefuPXXdYWKf1J+g/DNALAcxV5hgP+suznp5VSt1sSEOPBoYjVO7s4e4Wz1TXB9zNN
         6JA86wnefY0czFIVgUoENvq69Cfg9FjUTTxkgxhGeC607TIUufB6xX9PS4Iefgn0uPL9
         TMuutX/lh8tK2LYYfXRZs5IviIzBabl+g79XaenmxAGMOrz/hGSXTecLH5WVZVmkmYoN
         Oz8g==
X-Forwarded-Encrypted: i=1; AFNElJ+xUJOw7ROHOWY4F5432oggKhsewTLlDO94bNJPnVI+6xfAaYNGwr7WvBvDDWQek74h8TW1/+lyi8eKg28cBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtUf//8Wjrv7XDUr4QLO9BUPVyHZUknxwWSozuWbgnih942LUQ
	ea1zQ5whZSPebFwB7iAvZFl/CY0uSRjfNE+BRSBURq3O1TjlfjUHcJtw
X-Gm-Gg: Acq92OE7QxhyvNS2dwQ1M2wZYA7PPxk6ncd3nBgNVGn1VcS7XgxmmsQFoM19CIG4OYF
	0Rb5Ur7o/7FJR8ViQxHDVRsBMTJ0/MrtI7zaMY7dB7Sx6R9ZmYsgMh8UnA6zj8V7+2ZwgXCPoJr
	sCxGFHRddb2aHZcSxrhFRwDLMpMtSCJ1vS3B4w4oZWtsNMHXUAJwYPR6j51S/vIK/zKh5FZwyFt
	52BMaEPuzhW6hKVAppXJzaR7wk51Yzhzsz8vzEVzsmbzD0m06WtlSMuVxzBb1/ephI0SwYHUQSY
	U+SWDuPL31Y1iGWjhtVQs4Z2a5m3RzcpWrFMntjzvZVHITCKhIcmplldTaWwNghg7jzxcM1Y42J
	cJv8rEKKRnkKnOp1C4Eow3MDgrscveMVov0kecmDJkKpB8zfzyDjvjPWdTuFDRejhWx6TV3JQn6
	999Ph7YdCXhDOjfsTWlaxTZcSPqNcpDXVuXWF2UU7Qwx4m1gkzVeWUZvOVmwCnehJ7
X-Received: by 2002:a05:6000:1844:b0:45e:98ed:bde5 with SMTP id ffacd0b85a97d-45e98edbeb5mr3627217f8f.24.1779282724547;
        Wed, 20 May 2026 06:12:04 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe13a7sm56345921f8f.29.2026.05.20.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:12:04 -0700 (PDT)
Date: Wed, 20 May 2026 14:12:02 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
 support), linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek
 SoC support)
Subject: Re: [PATCH] ASoC: mediatek: mt2701: fix snprintf bounds
Message-ID: <20260520141202.1803aa7d@pumpkin>
In-Reply-To: <20260519010440.629290-1-rosenp@gmail.com>
References: <20260519010440.629290-1-rosenp@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_061206_876483_615283F1 
X-CRM114-Status: GOOD (  19.61  )
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

On Mon, 18 May 2026 18:04:40 -0700
Rosen Penev <rosenp@gmail.com> wrote:

> For whatever reason, GCC is unable to figure out that i2s_num is a
> single digit number, with MT2701_BASE_CLK_NUM being the maximum value it
> represents. Add a min() call to help it out and fix W=1 errors regarding
> snprintf bounds.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
> index 5a2bcf027b4f..43157f218409 100644
> --- a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
> +++ b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
> @@ -25,6 +25,7 @@ static const char *const base_clks[] = {
>  int mt2701_init_clock(struct mtk_base_afe *afe)
>  {
>  	struct mt2701_afe_private *afe_priv = afe->platform_priv;
> +	int i2s_num;
>  	int i;
>  
>  	for (i = 0; i < MT2701_BASE_CLK_NUM; i++) {
> @@ -35,8 +36,9 @@ int mt2701_init_clock(struct mtk_base_afe *afe)
>  		}
>  	}
>  
> +	i2s_num = min(MT2701_BASE_CLK_NUM, afe_priv->soc->i2s_num);

To me that is backwards, like an 'if' put the variable before the limit.

>  	/* Get I2S related clocks */
> -	for (i = 0; i < afe_priv->soc->i2s_num; i++) {
> +	for (i = 0; i < i2s_num; i++) {

Caching the limit also stops the compiler having to read it every iteration.

-- David

>  		struct mt2701_i2s_path *i2s_path = &afe_priv->i2s_path[i];
>  		struct clk *i2s_ck;
>  		char name[13];


