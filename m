Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998D7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 15:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OXaPpXDmLS7AlfqQ3kjzlnKPKDMjcJ+rbLiA91ff/8s=; b=vJU/JH9GFD2AXN
	aG1sOKe8eP9bld7ozpgad2ELPoUSKv0btuFSd2LBP8hMrg/sWeX2RnljLhv2DQP/WSRKDc7lx2WO9
	vkmihVtVUKhg0FjxpCp6QG/D5S3G+h4IdXWkp4/YaToi97CFX+mC6nOLBYfSELYzo0sp9sT8GTtc5
	W82oSsJ0s1Gb6uZVWa1ErYeMAeHCZ8tZIFn78XnLjKTp3dIEc62PN+IeS1D2pCi3drSJEQT+Y78rg
	U8ddNLPOyFmgalIlptAuioFi4Hrcwg9T3XG199QmxGxQv/gNULzfdIg/l4CesPiIsxrCbLV22R63f
	qH4Yu/BSOlOtawLwOHog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns4iL-00DGzQ-NC; Fri, 20 May 2022 15:38:53 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns4i1-00DGo6-EX
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 15:38:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 h205-20020a1c21d6000000b003972dda143eso1139113wmh.3
 for <linux-mediatek@lists.infradead.org>; Fri, 20 May 2022 08:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=TruT4yP/IHfoBAPFqMeOajFvg64Ll1wtLuhAHSQOFUw=;
 b=baUhuljZbwT6dq55Q5DjftLm7uBZoDRY77RVV24wEi0ULaHmuIKEjRzk1Wgu7gOPrR
 Z8NiPOMX5+Moyv/a0GjCkNqUrKgRVDVU6jnStmTqUoA+pQnx9IXNvRxeRC0MzcCdF9jx
 fFljZLckMr/3Mtx511k0FeC4hIATmBROKme2WHNyycxccHfnaCKjKWHwgT0JUVeIOk4z
 fnrASmUzHJ+0TXuinGFpenZN8hMuvjZQ+dsWYbObHPzX9Wq35/CyPuPha3z0xwHVgOyL
 +WpPewvIcGBTUVka+YHokTORsIr/VOEYeWcdot3+RQ77I9bRguuoKPuEtMpdT8KI4ODW
 0isA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=TruT4yP/IHfoBAPFqMeOajFvg64Ll1wtLuhAHSQOFUw=;
 b=AqA+fcq/sVAbYd4gnWRmlgNQ1pZDLEc+CiKWEDvaAujVWmNOh+hffNYtmaDgCLiBV/
 NBMYH4rgine3j3By3kZOxfQ5Ud99Bjc6fITkB/o2M3CxrGYRgB2qNsbABXlMCMJfLaYm
 ZG/iFI5N570/GSL5yspfpR/zx4GNY8wM/wG29OpoA50xAt570DBdz5noD2awpDsNaTxx
 zMXDBEp9NZNt4WzcID77Pf2QSAz2ZGa2blwmRlJFqLNy2MMLuKEvZWimN2z0J+CD9Tqx
 DkzTBIUGIpbctAlpFzzwvah56+4cj8BvZ/CQZFfPNvjVHMeEGvim3xN0dig8tHZ2Ryms
 z/bQ==
X-Gm-Message-State: AOAM5325/EOYEoZXxjiAHEVm3SRa4P6c/CjEmn3lXuLxImsBH2J0x1IR
 +scjp6+nJ8dVyTru5EnMbitiaw==
X-Google-Smtp-Source: ABdhPJxafD+YBsse6nty71kaQksxTaFOykMVQUpcVH6/gwR3/Hl7XdJzIBXayCDMq5Sc86yZmypl3Q==
X-Received: by 2002:a05:600c:354c:b0:394:586f:694f with SMTP id
 i12-20020a05600c354c00b00394586f694fmr8717762wmq.159.1653061109803; 
 Fri, 20 May 2022 08:38:29 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:41e3:1219:c56c:30b8])
 by smtp.gmail.com with ESMTPSA id
 ay13-20020a05600c1e0d00b003944821105esm2276938wmb.2.2022.05.20.08.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 08:38:29 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] Input: mtk-pmic-keys - Use regmap_{set,clear}_bits
 where possible
In-Reply-To: <20220520125132.229191-3-angelogioacchino.delregno@collabora.com>
References: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
 <20220520125132.229191-3-angelogioacchino.delregno@collabora.com>
Date: Fri, 20 May 2022 17:38:28 +0200
Message-ID: <875ym0kydn.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_083833_592639_EB39FE76 
X-CRM114-Status: GOOD (  10.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On ven., mai 20, 2022 at 14:51, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> Instead of always using regmap_update_bits(), let's go for the shorter
> regmap_set_bits() and regmap_clear_bits() where possible.
>
> No functional change.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 24 ++++++------------------
>  1 file changed, 6 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index 8e4fa7cd16e6..83d0b90cc8cb 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -157,28 +157,16 @@ static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
>  
>  	switch (long_press_mode) {
>  	case LP_ONEKEY:
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_PWRKEY_RST,
> -				   MTK_PMIC_PWRKEY_RST);
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_HOMEKEY_RST,
> -				   0);
> +		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
> +		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);
>  		break;
>  	case LP_TWOKEY:
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_PWRKEY_RST,
> -				   MTK_PMIC_PWRKEY_RST);
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_HOMEKEY_RST,
> -				   MTK_PMIC_HOMEKEY_RST);
> +		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
> +		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);
>  		break;
>  	case LP_DISABLE:
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_PWRKEY_RST,
> -				   0);
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_HOMEKEY_RST,
> -				   0);
> +		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
> +		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);
>  		break;
>  	default:
>  		break;
> -- 
> 2.35.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
