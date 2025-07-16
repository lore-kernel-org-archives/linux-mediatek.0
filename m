Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C036C83F1B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jul 2025 21:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRKMCti2Ai/CuBdEyVpIY2yewXiU7F1sYeoCE/NOUlg=; b=Kc+eWocE9Z1b22yriO623oujxX
	x6wEe0kN49JpcTZrL4JPByaZyWykQrI59uQ9SpVaJvDliT1b4MHdq6LNmMS3DGh4avBSS2g/3TmV1
	SJgzmsHllnsl/08k1sm6EF9HzAFHem7Cu6TxfMuzR6P5lFizmFO70m4Jz48JBqU/Wc6s13DCaRHeR
	qffBvBW0PrlB0Iod/nTZaJk8fFlQeIgv+nxunBiTx3Rh27RGLFyh5zmQ6gxewy9yVht6jiH/nMu7m
	DT7QboJoj5AX57O3pns80a0WdJN1j2AhvdX91J5e3FjoIefEqsyT/3Dp9EUUIBN9ZLPHzVL5PSCj0
	6z7gyTBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9bn-00000008hAl-3r2P;
	Wed, 16 Jul 2025 21:24:11 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9Wr-00000008glD-1ECF
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Jul 2025 21:19:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso2877425e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Jul 2025 14:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752700744; x=1753305544; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gRKMCti2Ai/CuBdEyVpIY2yewXiU7F1sYeoCE/NOUlg=;
        b=I83T/AZSA6TjUavdXmC14NtWZcsnuyo8vvAT2ADdPPoNfcqyE7lDsOavnEjFAzjrG0
         7kYgIBUckWEVyf8QI6wSxrMvL4NRgQ/8NkmFLvS7b4DP6IaTcFVp4ligENdc769Mo7to
         /Xf091BIKKEkJCKoc8ZkP2oa2yWI8zNikoajIZ7KQhX4UVW9zrahskxWWmkXsOj70Bye
         VqlQibzA1+FnHUpKvnl3Hi9RzOe2L4b/85DAtUG2/5UGB+z5hHDwc+dxICM8t4Y7998V
         XsVR0PQYH9+pHVRjFlH4CLjp7g93QDsmzcYraBaYrquwYfO6ZJ3KailShBkvkfpVMr4v
         vBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752700744; x=1753305544;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gRKMCti2Ai/CuBdEyVpIY2yewXiU7F1sYeoCE/NOUlg=;
        b=mtYFmn73alD4+LDQqF47PsBrdssAJnV0g9786u4//ABHkoGY1var1ga5lkhoG+h+lo
         ICgaNuHpdalRsNuSmPgzCSvB45d4nlcbc3owVKLC8ZsGfp9PtuJNr272E6Vg0gPoGQP1
         q/GzykU8dWvzQJbTfRTnthFpwp66fO4hlwk/gpFknUMuv2zs20FxjPl+E0Q5uvUDYDRU
         aXg2jkZ6JSliPErGtUvfXxzlx6hth9K8wTvOHX863SaJ2mMQpO3dfnPmgvVP72DsPf89
         KKPHn6+NFG1Pp+zwySWhHE0P7J+iSniEZR4XZWG4q+dGDglVm0oBTi9xDlN8fsVBzbkE
         PI/w==
X-Forwarded-Encrypted: i=1; AJvYcCUOEjQs9JxnZteEUG7+gxiUAdAO+mDuK3wAsleYg3GspL+g0y419LP9WmTMmEUtyh0LKzuXgPu9kQdVdJQx8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBUaBps5/7onbJyfMLFA4U5Ua9Vkn6IMERyH5BoYftMCrCO9Wd
	nLcv1sTC1cPWVep7COKtFWdXzS/dUvGvVlq6qIFlXRvOgF/rEINfmw/d/Fy7UvDrqi0=
X-Gm-Gg: ASbGncvykK1d8xk+2sXeX+J6Nj2mQssUHe5XL5VdBXz1njmxB66GzzIDeZGjVj9wLFt
	JdLgj+XiZP80seKduaCD0avvaRE4bpFij0ZInrg1xqNl0EdFDmfG8lKO0YWE/z3zWzdYr09f8E/
	4VKKGPwO5uHUIaoPTGyqvXv7fYo0fMjin2lKqx83z7xhEH7rjATPXzFiC4KS+OiK61YkXZVF++K
	JMQeq3b0jKv0rjzrU+0o5iKCXMbirmlk8os2YaljN9D21LVV2c45mY50bAlPZ4hJ/VDrx5FF/be
	hKuv1wvMtXbgsvTZaNyN/peU/bogL9cAXLwLCpNqVQ402OitZyNjA3MfibGSYD52TBGt/7x+155
	/qVk3f71Fvj3y/mywxPeN/rcHiK1elMcMlJTt+bEMSnDrOjAEn8vhY2d97UAx
X-Google-Smtp-Source: AGHT+IGU+ypDAJJxAGg8IJL70QMGqBYPckZVXPJfzPAtYPsw777vZbMiHPPbbkBp+5WtNr4iOtNXRw==
X-Received: by 2002:a05:600c:6097:b0:456:302:6dc3 with SMTP id 5b1f17b1804b1-4562e3c4b98mr33569505e9.26.1752700743650;
        Wed, 16 Jul 2025 14:19:03 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f4294sm31833045e9.3.2025.07.16.14.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 14:19:03 -0700 (PDT)
Date: Wed, 16 Jul 2025 23:19:01 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Mason Chang <mason-cw.chang@mediatek.com>
Subject: Re: [PATCH 0/3] thermal/drivers/mediatek/lvts_thermal: add mt7988
 lvts commands
Message-ID: <aHgXRcyEWreMC_P-@mai.linaro.org>
References: <20250526102659.30225-1-mason-cw.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526102659.30225-1-mason-cw.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_141905_354813_CC14CDB6 
X-CRM114-Status: GOOD (  11.13  )
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
Cc: linux-arm-kernel@lists.infradead.org, Steven Liu <steven.liu@mediatek.com>, =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Sam Shih <sam.shih@mediatek.com>, linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Nicolas Pitre <npitre@baylibre.com>, Daniel Golle <daniel@makrotopia.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, Colin Ian King <colin.i.king@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, Julien Panis <jpanis@baylibre.com>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 26, 2025 at 06:26:56PM +0800, Mason Chang wrote:
> Add the LVTS commands for Mediatek Filogic 880/MT7988.
> 
> This series fixes severely abnormal and inaccurate LVTS temperature
> readings when using the default commands.
> 
> Signed-off-by: Mason Chang <mason-cw.chang@mediatek.com>
> 
> Mason Chang (3):
>   thermal/drivers/mediatek/lvts_thermal: change lvts commands array to
>     static const
>   thermal/drivers/mediatek/lvts_thermal: add lvts commands and their
>     sizes to driver data
>   thermal/drivers/mediatek/lvts_thermal: add mt7988 lvts commands
> 
>  drivers/thermal/mediatek/lvts_thermal.c | 74 ++++++++++++++++++++-----
>  1 file changed, 61 insertions(+), 13 deletions(-)

Changes applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

