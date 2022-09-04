Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6D0C6FA82
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Sep 2022 14:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fC3lh2YMOyHrManyFcmY7+Wx+z/ZpVeqWfU4+YdqBv4=; b=vZixw8m5QhNb/xauL4MtlDQJsL
	YD0oqUPRhMXmEpvUHUyy3U41VSzNi/XepLqSgzMvAhcmFBlMX4pzgwRI+2P3KTlyEAWKW+UAZM4ZC
	hpC4HI/NHS4SSSbMp7A8gJleo8PDYO5OdT6RI8kmucqZ9xVealyQ7JiD8woKW1NzRTVldbq/a0a4+
	EFZ9MKm3qAoHA25fIBrnj+d2tEJ4hgSAxmAR3gALzwZWnj8dBxu8/TKFBOlaNTAxAu+0Avet6DUXj
	TlkY0d0wp8a7ETdGXvAHuAroAQ1Wo3Fx29ypi52uZxG23d3XdeuRxnq/oEQ+DXMsCHZP2CD+GDBBb
	x3rKgEkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUr3I-007Erl-OV; Sun, 04 Sep 2022 14:56:48 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUr3D-007EmJ-K3; Sun, 04 Sep 2022 14:56:44 +0000
Received: by mail-lf1-x131.google.com with SMTP id z25so9946393lfr.2;
        Sun, 04 Sep 2022 07:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=fC3lh2YMOyHrManyFcmY7+Wx+z/ZpVeqWfU4+YdqBv4=;
        b=jWJ6WZaSrU9FfU2y0hsSVm6LyRs2Cu3lKLTVy/RIID88varEs+jkY7d1VruP3yuqf2
         mAjDDF9c1emAj8wh4Hyp2XPYob1i8GENIbDMHmBUriGC36YJARdCRPS2cE54QgvHWznw
         7mVrjAuI624Hp7e0UVmNr0mL9qJn4nh9sWzYQt3L7xdBxIrnipBwRYnPG8/RwEwyz6Xn
         1QH/Kv8YTC29XXLg6OmzqXsCbT1mNRAPKxYBrnaAEKHCIgdgBnT+aXqsbCZi0VC0x/cA
         mU8MXo4zaMwPyA4tYjptrWZoG66L8WfMu+HaYxEwAFKSSBPvKsti/VtABlRtYWul9Orn
         HeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fC3lh2YMOyHrManyFcmY7+Wx+z/ZpVeqWfU4+YdqBv4=;
        b=UCM+vnYeyzVdF7w6enVD2Tdic8eo/e0ZXtPd3bP+GCvsbPNipgk+liWBh4T3rutrKq
         wCsO89dahV9xUM4J6nwj9b+KT0lG+D0+JtnPVovWkEbViSZEKWqcxUy692sKbVsq0mTJ
         VeYDnY/AaBg0H1T+0jJk1iUFLv+VOLmCY3gFTeHKtVbuX9dl+zbMewYHeVThEd/4bbAD
         8N0Xt/CvlGtUVkcbU3iXruFl3aCgUZ52Bu92jjQfgorKD2Ya2VkZyB7O+9QZnOE/CsRL
         59ER+G8kaB2ETV4xe2UEEKp8nUxsupD7H3L/vg4uvA5L2YOY6dewNRrBSpqz+JOweIgz
         jpzg==
X-Gm-Message-State: ACgBeo0xjrPULbDV36ufOmdebTeweCRTvxVbKR7GmpCg8pEt81b794Hd
	GTm26OuqHK6zRaF6mhmI7ho=
X-Google-Smtp-Source: AA6agR61c8An6mbrNZfhfHKEubyxAYbejF29KvnHLmiAlYpPv9/3q/F9sPfNQEADHmqOVrKU4YEokg==
X-Received: by 2002:a05:6512:4002:b0:494:5dc9:b2fe with SMTP id br2-20020a056512400200b004945dc9b2femr11247598lfb.687.1662303399672;
        Sun, 04 Sep 2022 07:56:39 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.119.13])
        by smtp.googlemail.com with ESMTPSA id m13-20020ac2428d000000b00492eeabd6f8sm933897lfh.52.2022.09.04.07.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Sep 2022 07:56:39 -0700 (PDT)
Message-ID: <7294f049-f58f-6ca8-6315-ad062d775bcf@gmail.com>
Date: Sun, 4 Sep 2022 17:56:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v17 02/10] video/hdmi: Add audio_infoframe packing for DP
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
 <20220901044149.16782-3-rex-bc.chen@mediatek.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220901044149.16782-3-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_075643_673042_1BC6E5E4 
X-CRM114-Status: GOOD (  10.15  )
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

01.09.2022 07:41, Bo-Chen Chen пишет:
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 9e3aff7e68bb..6c0871164771 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1536,6 +1536,8 @@ enum drm_dp_phy {
>  #define DP_SDP_VSC_EXT_CEA		0x21 /* DP 1.4 */
>  /* 0x80+ CEA-861 infoframe types */
>  
> +#define DP_SDP_AUDIO_INFOFRAME_HB2	0x1b

Is there any good reason why this is not grouped with the rest of the
DP_SDP_* defines above?

