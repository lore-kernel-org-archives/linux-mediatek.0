Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC53C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 07:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8R9bVOGo16amHaHdQgn3vohiOg/80cUEYV+3t7qlHzM=; b=osqsBeaqoewHROhwqbU2WLDYSR
	vzUCijn3WfnCP7cX7tNXywfjxHV7Ndof+ewDXnphj7YZP4MwcVV4wHOHcbsjyCqYM0XvW/tVko4JA
	vktkcg1WSZ1qec453tTTur1GusT3jOD50Gz2iGZaH0noZVsnmx9l/cqftZtberxahnaE6IVB9lIXt
	nxIVKOPbBzZxG6dJsXUGJ4w8XN2xmAwfLucjIX96dKZ4G8Ev4lntvAEFuP9XIE4bkzjw4oKu3TaHm
	n75Y6+xVHRAWKI5kEJ19J9ei3OhlF/EVkqQ4fK+EIxSaGiwTu4toTkn8DhIL4G2JXAcW8iFLE1COe
	yAlctK2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdIp-0000000BHnp-0U4u;
	Tue, 16 Apr 2024 07:32:27 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdIk-0000000BHln-2xWP
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 07:32:24 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-56e477db7fbso6416098a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 00:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713252739; x=1713857539; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8R9bVOGo16amHaHdQgn3vohiOg/80cUEYV+3t7qlHzM=;
        b=o72rVJl23Tqd+AD/gesWyDmOnOfS3KCioxwrq1W+2FkmL0nJlAykH1Q10hdf8zxenw
         ah4FKJJ+fXr8EkojOvw9Ke1XCvArqPcw1nZU4Y1MkvuKBNKLvpZloARkg91YWo55vkOF
         oRMZFGlEIaiEYMu+rXTCkLhaDXDossJ9/4mGAjpjCfNPD+TWM8dLzQ5SOtvXkMO7dkv5
         BKCWIhgCjBxK1nLz1EovaKrfb/zNfmcV3Ub7cRGuixsvNU9cdP2azSAnsUrYWbFLoRn1
         PFrga0Ix0s5D3b55PMacxgnTm0ZlXjkrszIKtOsVFTKZzmIdjAWLmfnpJuDQ602SkPag
         LLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713252739; x=1713857539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8R9bVOGo16amHaHdQgn3vohiOg/80cUEYV+3t7qlHzM=;
        b=F/CgfjLTzPRUhQB+8ypzRubCf04ZUs9yE366/HvkyPZEj+907wCCS3W4UEBp5c4A4P
         /fgyc4cvefPAIbrzbiAKRXDrTBTek4dymmNJdqbwuOolcHZjTh1xzw5p6mzBC4kQ+CDo
         mXKtQyfQf8q9nhWxKxmI9p2kpkvFwF9KUbsjtkBCWaxOv94JkZT91CZTFBzube9M7IQq
         jb20eWS0m+0cLDZXJUgi2ZSBpTZQKVUJGxVaYgcFMaAsOpsOixD7TRHYitK9orSAGVI1
         Pi3KyPZ7YRQEwrby40ccJ1/5gM5eusnNZSqkgMaQHrADOEiQ/VXwRE+XaQjCVCxSRrqG
         q+tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOBWBrHCzJt4a8xaYJ6f5FunnCL0syG/pyDNpjC53FItuPrlL6iidu6h1gpmQCvhg/2sf0KGX9EnyvDPjDD2z8ae2PINCviz8VdOXv2Pde6wag
X-Gm-Message-State: AOJu0YwNUaW3TH/mi0i/XPohJPYuh7jHG1R4TNm5NnZRCfeIArrBKW1Z
	RGCfSLx4rFvrPVahyASTvix2e1qZ210+aNC3bHYJp/aQ05iq4iYeiL1RZ57ASIU=
X-Google-Smtp-Source: AGHT+IEiSwmXJXJlRrwBTxtu6/XHomvPQRR0BAqxebaWeb0WkKlHDct2PHGh5ytZktKV5zyNXHYwQg==
X-Received: by 2002:a17:906:57d6:b0:a52:6c4e:25ae with SMTP id u22-20020a17090657d600b00a526c4e25aemr2620587ejr.44.1713252739010;
        Tue, 16 Apr 2024 00:32:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qb11-20020a1709077e8b00b00a51ab065bf0sm6421883ejc.202.2024.04.16.00.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 00:32:18 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:32:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
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
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 02/35] media: stb0899: Remove unreacheable code
Message-ID: <e5824d5b-9aa4-4b92-91a4-7e26de8b293d@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-2-477afb23728b@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-2-477afb23728b@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_003222_829308_3AF42782 
X-CRM114-Status: GOOD (  15.60  )
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

On Mon, Apr 15, 2024 at 07:34:19PM +0000, Ricardo Ribalda wrote:
> chip_id is an unsigned number, it can never be < 0
> 
> Fixes cocci check:
> drivers/media/dvb-frontends/stb0899_drv.c:1280:8-15: WARNING: Unsigned expression compared with zero: chip_id > 0
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/dvb-frontends/stb0899_drv.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/stb0899_drv.c b/drivers/media/dvb-frontends/stb0899_drv.c
> index 2f4d8fb400cd..222b5476ebfd 100644
> --- a/drivers/media/dvb-frontends/stb0899_drv.c
> +++ b/drivers/media/dvb-frontends/stb0899_drv.c
> @@ -1277,11 +1277,6 @@ static int stb0899_get_dev_id(struct stb0899_state *state)
>  	dprintk(state->verbose, FE_ERROR, 1, "Demodulator Core ID=[%s], Version=[%d]", (char *) &demod_str, demod_ver);
>  	CONVERT32(STB0899_READ_S2REG(STB0899_S2FEC, FEC_CORE_ID_REG), (char *)&fec_str);
>  	fec_ver = STB0899_READ_S2REG(STB0899_S2FEC, FEC_VER_ID_REG);
> -	if (! (chip_id > 0)) {

This is not dead code.  It's possible for chip_id to be equal to 0.

regards,
dan carpenter

> -		dprintk(state->verbose, FE_ERROR, 1, "couldn't find a STB 0899");
> -
> -		return -ENODEV;
> -	}
>  	dprintk(state->verbose, FE_ERROR, 1, "FEC Core ID=[%s], Version=[%d]", (char*) &fec_str, fec_ver);


