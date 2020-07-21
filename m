Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D41C433E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 22:45:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F4E62073A
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 22:45:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kXwKtqKi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0nX/psB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F4E62073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vqhxI6rxfTRmgYJYzvvoJIJwShTyKZetXg50qU2VLAA=; b=kXwKtqKi9Oifdi2B0oTcdy/Xp
	IY/67ejI9wqrFFW2aMw0/d/JxoE2KQ/qhzzLrJQxCpBYNcqK9fLo520VAb0O9UNNTZn8G1qu1OlWK
	eJTdcZJTSfasRF36ksCacwQXqZ1qqcXMn6EE3UCEvJJ2fYHEBxlFiia0Xx3rKxM93jH+6tUARE4TN
	9ihPim1K4AVSUc6Nxtj3gec/r6zUzN5Us2bDhotYKXuCactifGGz3OnZfNHsWXX0XcnNQFtYiyZbD
	jOfSMCD0lulPYgTjsVDCZITa7affg0JEZBffYFKZBxr1Ae0aMcDa0GWsIFWUBGKnuBk3ODcL7M3Vn
	lPL5RtswA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy10I-00040A-Qc; Tue, 21 Jul 2020 22:44:54 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy10H-0003zh-4r; Tue, 21 Jul 2020 22:44:53 +0000
Received: by mail-wm1-x341.google.com with SMTP id w3so153963wmi.4;
 Tue, 21 Jul 2020 15:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6DknE5QGxTHlZ/zp1raxupBLAZHTzYnP+IplONM/HMs=;
 b=e0nX/psBq57qpJS8FX982l4jvCTI4Bhmbhexi6MOgLdcmnQB38SYWG9Hpk9nuD+aFT
 BkLk0pBBg98pYPUuGEYHc3Bl42Q/vNdsvjSIqDHI57fVeZa5r38zkNdSa1bUILAAQtF2
 Zd3b65laObYxgBghHuq3y5/KFYFcdc3Gftmf4z1kYvUmWyOx3Lg1z9QJ2cG8AjTyLikk
 X483CJyhc2B3rq5i47ar/0uRKrel5xghYIAoOKQfMYaVmeUWY4ox0/vaFDJ58A+2wOPo
 qDc4KFft/HoH54/oJcL605WxE9pcsdgsECiPv/h3RN/0kOF1ACx0x4jCXL8ep6PTZ+lp
 7h/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6DknE5QGxTHlZ/zp1raxupBLAZHTzYnP+IplONM/HMs=;
 b=jaJ5XQYEUod1DUT90bkQLYSr8FhCcj76kePNAAFFR1KXYrfPVBaisYN/XlMno+m5Aj
 IuPflcFZZhUTKzU4AG0LoqSTBbpLVtzkqnrpgryH8iXg8igLNRlfz6EPzThJOzwdwQUr
 amil+8wXgG71ibY8F2N6yR2fKr3+7RV5aEfkMondvd0w0OtjnxbsZeFOvwBMNNkAOFTy
 ora8fMK7xBVZICAZ+mMlJ5lahbeNZ5uImwiLwlQ49kr9qPFG6Hp314zQJEruPTo7y4va
 ofQnTslfqSzX7agap0cEoV6I0v3SrhQfkwjSOXTd4gvpY+XlJNBLQ5eyDukIBw6gCfbm
 FM1A==
X-Gm-Message-State: AOAM531MebJhallejdpwJq5oUW8dagtr+pCDVTeLbzQQfpXOSE6Kppqx
 7Jr64OIFd10vaqhr46f3ho6pTlbYXls=
X-Google-Smtp-Source: ABdhPJxoFLjAttL0FPOz9LEBmCq1IlL6eshCp+cMXmdZngfGahGuhZDZJJvN3RpuFddJCaZW8JER1g==
X-Received: by 2002:a1c:9a06:: with SMTP id c6mr5560010wme.23.1595371491277;
 Tue, 21 Jul 2020 15:44:51 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id u17sm39203455wrp.70.2020.07.21.15.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 15:44:50 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] spi: mediatek: add spi support for mt8192 IC
To: Leilk Liu <leilk.liu@mediatek.com>, Mark Brown <broonie@kernel.org>
References: <20200721122436.31544-1-leilk.liu@mediatek.com>
 <20200721122436.31544-2-leilk.liu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <27e48721-5e54-6947-cd8f-669f4da34c4d@gmail.com>
Date: Wed, 22 Jul 2020 00:44:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200721122436.31544-2-leilk.liu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_184453_200472_F21B38B9 
X-CRM114-Status: GOOD (  18.71  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 21/07/2020 14:24, Leilk Liu wrote:
> From: "leilk.liu" <leilk.liu@mediatek.com>
> 
> This patch add spi support for mt8192 IC.
> 
> Signed-off-by: leilk.liu <leilk.liu@mediatek.com>
> ---
>   drivers/spi/spi-mt65xx.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> index 6783e12c40c2..3d0d69fe0c69 100644
> --- a/drivers/spi/spi-mt65xx.c
> +++ b/drivers/spi/spi-mt65xx.c
> @@ -170,6 +170,9 @@ static const struct of_device_id mtk_spi_of_match[] = {
>   	{ .compatible = "mediatek,mt8183-spi",
>   		.data = (void *)&mt8183_compat,
>   	},
> +	{ .compatible = "mediatek,mt8192-spi",
> +		.data = (void *)&mt6765_compat,
> +	},

That's not needed. We will use the fallback compatible which is 
"mediatek,mt6765-spi" which will take the correct DT data. If in the future we 
realize that mt8192 has a difference in the HW we can add the compatible. 
Otherwise with the binding description we should be fine

>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, mtk_spi_of_match);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
