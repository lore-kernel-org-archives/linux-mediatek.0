Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB865C4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Apr 2024 23:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9hTDE+OmzSnorVJyzQcFNYmLnBIvZgvXWNavzd4DaM=; b=VJfEU6TTNWRoTEzJWgRYjobpcQ
	9XrBlGlAlPlSAndQWJOriSerY1KbccZVm5fiNOGeJWeLigypBZmEFM64SwGRR4JomPZa5IeMuabjp
	BUzUCXVDG799cQNkyCovprELA7F6vW8SRPcu0tDL9lGLxcDvu+LR2jisQS333pp0JMTc8qY2Ghg3q
	2KBxLsDNsmuL0p9MQcj4XD9V4n4kBxd+kye32KIzn5q3ZLL80qHb9Tv/8oiHN3INPsREWmAo1jmoT
	kG1pHHZwAxWmSJoF0+x/ziruQ9E3XFvIa0obXXaroTnVzFoXJUusCKPTrc22On726l9djz7GHW6ki
	KCvd9yZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryJoT-00000009MIZ-0QjV;
	Sat, 20 Apr 2024 23:08:05 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryJoO-00000009MFy-2e9G
	for linux-mediatek@lists.infradead.org;
	Sat, 20 Apr 2024 23:08:02 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-349545c3eb8so2347945f8f.2
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Apr 2024 16:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713654477; x=1714259277; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9hTDE+OmzSnorVJyzQcFNYmLnBIvZgvXWNavzd4DaM=;
        b=zpBBoixudSHELWA3D8CQLw4ulWI7jpnSGXTLLwdvRkN15vEm6/VX3hzvch7eH89ZZv
         1kdCZd0tnCHW+oiPYBm/avaFjgcF11yL2SIzCLhuYOi2tUUu8JWSrbHWZ1ErxzH8P/c8
         aTL5P4ghnbSf+i87GDXWHiuNJN/E0XRyPqqevNVxcDsiYrtprCd5c//jXpquDxDmhd1x
         eyQAVtEvjLCLRot8aOQC09PX+hRrMzckDiqnYq7n8TTvE9g0qed5ysj3D8G7evyqE7WF
         OLzLoIXMnaVbDE1FsPzdWXVduQ6sRlfF6kO3uvydWJhIgQWoxTIFcf5lSVvoArbi5EsP
         amdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713654477; x=1714259277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9hTDE+OmzSnorVJyzQcFNYmLnBIvZgvXWNavzd4DaM=;
        b=ZtVqepfmjmxogHW0on8IJ0BMUGkw8hzOM8+yARPriDuX4GSzC/YvmWwVCLFlnLRb2r
         6Nk+bsETSuWwPvTcf6hnVHhqPkQOJgoAOYNOqtSvjPMmKeDInRQc4LlPnkfPg3s0nPoI
         gxEm5J7yYeyjM6+qJKPCbWJFbxE7qBqRTPy/900oHszi3IHuTVtEWKb+/kePcYEr32h+
         ARQhEymY9SRzq6uwjVeB26low4hhAEJWKbaDjV4MAxPu5QKN+UQuxgY8L3zgTbFWAFYM
         RwRM7L1kLGXTKCDeZ6l2rR9dq5AztG9aoIyISnmwdl855Y6VZVT/0w74j35HzEsK9pWn
         STAA==
X-Forwarded-Encrypted: i=1; AJvYcCWnj72YZ7qBtdmZ19yUZUZ6wI8jyLVACPLqOzZzCnjuGTh1ilJqn+vuWBBG2/w1Z4uNfsteY1BreMPpeuhnxOOhLCSeAkvFKVV+Eg+2g4V/QBGm
X-Gm-Message-State: AOJu0YygScR3/+us28OpKB5hBtmty+hJt1PSk48YVjvQDnXMmReAw0+0
	21DGvEWYgmM3Y8zEyYHJc0chC1gjifF1hgEquDT3iMuOcisyUTdPqlSff4FZemI=
X-Google-Smtp-Source: AGHT+IFGdOa11zFVqyC3KCcGi9RrrofVzZm8cOluppaZLRYUDrIPrVm3Gfdre6MIxYSUZ9KallR7Bw==
X-Received: by 2002:adf:cd84:0:b0:33e:7f51:c2f8 with SMTP id q4-20020adfcd84000000b0033e7f51c2f8mr3599510wrj.36.1713654477259;
        Sat, 20 Apr 2024 16:07:57 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d6383000000b00341b451a31asm7862874wru.36.2024.04.20.16.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 16:07:56 -0700 (PDT)
Message-ID: <ae9b190c-3961-4704-bc93-cb1c4182672b@linaro.org>
Date: Sun, 21 Apr 2024 00:07:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/26] media: stb0899: Simplify check
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-2-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-2-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_160800_717141_D1D049BE 
X-CRM114-Status: GOOD (  14.73  )
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

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> chip_id is an unsigned number, it can never be < 0
> 
> Fixes cocci check:
> drivers/media/dvb-frontends/stb0899_drv.c:1280:8-15: WARNING: Unsigned expression compared with zero: chip_id > 0
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/dvb-frontends/stb0899_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/dvb-frontends/stb0899_drv.c b/drivers/media/dvb-frontends/stb0899_drv.c
> index 2f4d8fb400cd..35634f9a8ab5 100644
> --- a/drivers/media/dvb-frontends/stb0899_drv.c
> +++ b/drivers/media/dvb-frontends/stb0899_drv.c
> @@ -1277,7 +1277,7 @@ static int stb0899_get_dev_id(struct stb0899_state *state)
>   	dprintk(state->verbose, FE_ERROR, 1, "Demodulator Core ID=[%s], Version=[%d]", (char *) &demod_str, demod_ver);
>   	CONVERT32(STB0899_READ_S2REG(STB0899_S2FEC, FEC_CORE_ID_REG), (char *)&fec_str);
>   	fec_ver = STB0899_READ_S2REG(STB0899_S2FEC, FEC_VER_ID_REG);
> -	if (! (chip_id > 0)) {
> +	if (!chip_id) {
>   		dprintk(state->verbose, FE_ERROR, 1, "couldn't find a STB 0899");
>   
>   		return -ENODEV;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

