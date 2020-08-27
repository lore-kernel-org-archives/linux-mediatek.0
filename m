Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CF4C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 08:16:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 014F422CAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 08:16:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1wL3hujM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r1f2itQK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 014F422CAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4sgUUrETkOOmQ/8ffn3l3RFrruGwthx0ucja5dUFVj0=; b=1wL3hujMo6VnmogoMS/bpOrF7
	2YiNGy/WLcgGEsQXG2B92tHZZy3+xrCqwP+kuzv2yXgLGYpf9uaffro0ysQLVFxO1BEueEytX9oPp
	uxlbR0l2TBuJu03W70zxLR3P5YkLebgpx8sPgGBCyouJ5TGUiRluqRJcOSlMU8ojYseTQf2+gXuN+
	YtdN5GYd974eIpqwSfPbGOH/8Kcw6+fmSQHMiwsHNpo7xlrPUX6XbjY4zY8OY39Te1l+EK3jBVwDZ
	xMGH8O8/DKNbngQooq0OTizhTdZKHE5PVdKDsxkj0HoBICPZwuvBhjIHsjRRxO2KJUNQnituS27NW
	1oYc1L7RA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBD4d-0000Cu-QL; Thu, 27 Aug 2020 08:15:55 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBD4Z-0000BK-Cq; Thu, 27 Aug 2020 08:15:52 +0000
Received: by mail-wm1-x343.google.com with SMTP id c19so3196326wmd.1;
 Thu, 27 Aug 2020 01:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CRrN+bnESVw3xySjOS/D2tb7BK/BCO+kOmldSTBWoSw=;
 b=r1f2itQK1htdCqLiCgehW3FWfm1h4HuAWXjYf8QoF8itADn/zs0+iM7JnI+bUKhjDJ
 9q8o8tM/h9KIjAJkmPiIY1u5I0e69YY+7WLAVZ1dgv8rA19u7Tuejto8giSdCdATv9eR
 JNVx8tO2iR+tY5RTIyFUv3gV2EOBhgVxJADAAPZ3Fi4YAOqSAH+tGalZkeXB/ZFUG9kg
 YWIXLhpzgMWL3ZAx8la+eNzkPRwKgJ+NsD+k915EacOLtW/fpaUrFdKk0w71ynmWZt0R
 lsi84YQMYM+vOrGJFjE9IAj2tEwp5yODvRG8OJpFCr48Jz4HZ+vfM4MzR07CqATUcVok
 c4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CRrN+bnESVw3xySjOS/D2tb7BK/BCO+kOmldSTBWoSw=;
 b=S4Y0AhB0XeI5tIU12GkgH14Foir+wlS9s6DJmpHR+CWCBbEGP3SgBcaUW/to7ystjr
 p49+0fWPcjv+Zto4/Y93G3OM3I1jdFqqMuAtKOl9PSlCeRDzNXEVlavsZCEyUiEvE03I
 5c6tr9058zNfgna37N+/1cT33OP2Pg22rNzsqIHOs//RpZv8WibUiyILd8hrz491N4vY
 bOeTEoHxSuiPVQwdph0ZxZB19VF4Gb08TWSvw/EUC/4ZPL2BEeZP29ndGHoAzsR6P4s+
 TcJiKvaKT/g42Yc52xoj9Gzl5ncqErgPNq89ugIUHeevS9wTeaAqcbL1PfoopltNa3Uk
 kL+A==
X-Gm-Message-State: AOAM5319ViVCqgL6VnqvzyeDE2K+teFvTZi0UijyKesYccYVMuHhrA8l
 6F7/+9ybSUbB0G/sYLwxPFxaiZeiAqUD+g==
X-Google-Smtp-Source: ABdhPJxAzbZ/JUyfG5E0ziVgDM2CoiNZGp8g0x4g8d4WyFCF1tmqYS4Y/5PBF0el+XD/ICqZ0ubpXA==
X-Received: by 2002:a1c:39c4:: with SMTP id
 g187mr10335779wma.126.1598516148283; 
 Thu, 27 Aug 2020 01:15:48 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.187])
 by smtp.gmail.com with ESMTPSA id c8sm4252871wrm.62.2020.08.27.01.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 01:15:47 -0700 (PDT)
Subject: Re: Aw: [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
To: Frank Wunderlich <frank-w@public-files.de>,
 Frank Wunderlich <linux@fw-web.de>, chunkuang Hu <chunkuang.hu@kernel.org>
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
 <trinity-14a1b182-38ab-4f84-bb72-94d448b05fd5-1597994235320@3c-app-gmx-bs37>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <81276d4c-8883-8bfd-d7d0-9b9ac025ed97@gmail.com>
Date: Thu, 27 Aug 2020 10:15:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <trinity-14a1b182-38ab-4f84-bb72-94d448b05fd5-1597994235320@3c-app-gmx-bs37>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_041551_478696_C9996EE1 
X-CRM114-Status: GOOD (  20.92  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 21/08/2020 09:17, Frank Wunderlich wrote:
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
>> index 5223498502c4..edadb7a700f1 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
>> @@ -184,6 +184,9 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
>>   		return PTR_ERR(phy_provider);
>>   	}
>>
>> +	if (hdmi_phy->conf->pll_default_off)
>> +		hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
>> +
>>   	return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
>>   				   hdmi_phy->pll);
>>   }
> 
> tried modifying mtk_hdmi_phy_power_on using the new flag to not enable tmds instead of enabling and later disabling it, but this does not work...
> 
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> @@ -62,7 +62,8 @@ static int mtk_hdmi_phy_power_on(struct phy *phy)
>          if (ret < 0)
>                  return ret;
> 
> -       hdmi_phy->conf->hdmi_phy_enable_tmds(hdmi_phy);
> +       if (!hdmi_phy->conf->pll_default_off)
> +               hdmi_phy->conf->hdmi_phy_enable_tmds(hdmi_phy);
>          return 0;
>   }
> 
> @@ -184,8 +185,8 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
>                  return PTR_ERR(phy_provider);
>          }
> 
> -       if (hdmi_phy->conf->pll_default_off)
> -               hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
> +       //if (hdmi_phy->conf->pll_default_off)
> +       //      hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
> 
>          return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
>                                     hdmi_phy->pll);
> 
> 
> same problem as without this Patch (horizontally distorted image flickering on 1280x1024)
> 
> any idea CK Hu?
> 

I'll leave it to CK to decide how to go forward with this. Would be interesting 
to understand why we need to disable the phy. Someone would need to verify that 
this holds for mt2701 as well, and not only for mt7623, otherwise we would break 
mt2701.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
