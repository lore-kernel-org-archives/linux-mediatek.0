Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139D5C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 17:12:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C65C72067C
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 17:12:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v456b6yy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOT8FZXV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C65C72067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gHcgOv8rJjYF7EASuDLwfrSiUbzKeO2TMYWp4G278bU=; b=v456b6yy5RhiQ5ddu9lpW7e0/
	91xZEZCkHptC8dmJdqYZEsZlVzqWxfLKygjxBlgEO2cfBKwUFI2/TCEJbWycVQK5uSyK+xuSu+cth
	8dqzOTY59Y3nQ3vNKh5AhqFhqRVI+PQsAsBtDiJko7/VvWmftNzk3qjwCsgcEADBAYL/oeWDL6BJh
	VBSXX+gg4+ddGT9P92RH+yp5Lj2Mi1MmmTCeIkkDRdbAaf2K3DYYXEYHIVhCV8bQBmC4Moo0Lddcb
	Q7dUYjL0VQEwotDhwBFWywO4rLlUPdkzjjyn7V5XsequcVks+FeqCR/0tzf9L2ELNUsveP3CRy5xY
	dMKVJpckA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Rde-0006wP-B9; Wed, 19 Aug 2020 17:12:38 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8RdZ-0006mH-7O; Wed, 19 Aug 2020 17:12:33 +0000
Received: by mail-wr1-x444.google.com with SMTP id a14so22275564wra.5;
 Wed, 19 Aug 2020 10:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P/BxB6Tk9AqvsGBqiTBEZmxawpSGqW2VpShvG8egiLE=;
 b=aOT8FZXVbYAg7wGPDj6bcP9F+iWPGFAHwmYImaZXz4dUZFvLGzdMD5+6ayifi72/FH
 21dd5Set+gYeTPzss4RyBymKDuogTsC0beZM4OvOL+ezO23pv46w1CIc/RsIQ6PMUPoL
 k1P3ymaMirYfMEx6WQ6qQv6OKryMX2mOn99eiEABq5HfSSCwULPH0sV5/UOEvfxjCdcI
 hsf5z7wcQ7vzqqZNsEj1ft73UrkozG8GecNNKYKCNl8IJU525hQnfL14HmWvmCdnCaYw
 PZqzYQ6UK5hq3eiWw6FU2yVpuc54RspJhyBq/IXuIJjyuWIy89lFl10O02gOtcOZMCd3
 +7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P/BxB6Tk9AqvsGBqiTBEZmxawpSGqW2VpShvG8egiLE=;
 b=oQSn6GtH4kqiJFGb1ZLmuFhjcODSWvGlyM53i6QAiO6JL50mPZ071aHWfVk8fZ56MR
 BXIkr6XW5A66L6v6FOAmAm5xv7TnXnGxVJ1h5j52Avf9zrQ1ngVlEJpOkV3pGVJm58CF
 zaE3Ar5vhoCqYGIH5v8cdh07ed+h1sVxu1ITdnPNbTrkex/tcqnbsc6dD0Cmfar8FkYN
 /EdNCiEVFMbiVf8fVuFDD/hyUxlaKDrihUDN40I+1w8ztIhzJuYYxGslDq4r8S5eb7ih
 lxpUWFZr0C9ady6QZcS0XcBe3pk8wtiKWH7hKj2t8cGUPWjd58XcC1OK7VvOwPPYX0Qp
 tyCg==
X-Gm-Message-State: AOAM530//NMt2o0OpgviugHN57WFYJOTNiOUvUbAxVh++uWUS5e6ZSTX
 F1pEKKMit8+/ZgKO/Z5OCNY=
X-Google-Smtp-Source: ABdhPJxbMdMiABMczUJpbzVpjiKzWMQlXai3V6kLN1aQ5/US5xWa8crZteCDS1MmrXTkNtT+nkvzHQ==
X-Received: by 2002:adf:9c8c:: with SMTP id d12mr4884761wre.369.1597857151947; 
 Wed, 19 Aug 2020 10:12:31 -0700 (PDT)
Received: from ziggy.stardust ([93.176.180.54])
 by smtp.gmail.com with ESMTPSA id s2sm20811016wrr.55.2020.08.19.10.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 10:12:31 -0700 (PDT)
Subject: Re: [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <f68cf4c2-6c79-fe46-b7b4-bcc49e0b6b69@gmail.com>
Date: Wed, 19 Aug 2020 19:12:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819081752.4805-4-linux@fw-web.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_131233_313951_B43FF1F0 
X-CRM114-Status: GOOD (  20.97  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 chunhui dai <chunhui.dai@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 19/08/2020 10:17, Frank Wunderlich wrote:
> From: chunhui dai <chunhui.dai@mediatek.com>
> 
> disable tmds on phy on mt2701 to support other resolutions like 1280x1024
> 

Isn't that worth a Fixes tag?

Regards,
Matthias

> Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   drivers/gpu/drm/mediatek/mtk_hdmi_phy.c        | 3 +++
>   drivers/gpu/drm/mediatek/mtk_hdmi_phy.h        | 1 +
>   drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c | 1 +
>   3 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> index 5223498502c4..edadb7a700f1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> @@ -184,6 +184,9 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
>   		return PTR_ERR(phy_provider);
>   	}
>   
> +	if (hdmi_phy->conf->pll_default_off)
> +		hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
> +
>   	return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
>   				   hdmi_phy->pll);
>   }
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> index 2d8b3182470d..f472fdeb63dc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> @@ -22,6 +22,7 @@ struct mtk_hdmi_phy;
>   struct mtk_hdmi_phy_conf {
>   	bool tz_disabled;
>   	unsigned long flags;
> +	bool pll_default_off;
>   	const struct clk_ops *hdmi_phy_clk_ops;
>   	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
>   	void (*hdmi_phy_disable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> index d3cc4022e988..6fbedacfc1e8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> @@ -239,6 +239,7 @@ static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
>   struct mtk_hdmi_phy_conf mtk_hdmi_phy_2701_conf = {
>   	.tz_disabled = true,
>   	.flags = CLK_SET_RATE_GATE,
> +	.pll_default_off = true,
>   	.hdmi_phy_clk_ops = &mtk_hdmi_phy_pll_ops,
>   	.hdmi_phy_enable_tmds = mtk_hdmi_phy_enable_tmds,
>   	.hdmi_phy_disable_tmds = mtk_hdmi_phy_disable_tmds,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
