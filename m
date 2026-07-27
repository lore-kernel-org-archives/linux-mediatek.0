Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1F0C53209
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 12:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6DdaVZ57Cvm8wo8IqS4pyHaIv3vcpLo2R5s1tMtqxI=; b=aa1eV4mELOMTkepvlKm/yqL+UH
	eHU7+qSsXYW+XYhlg+ICg7+Fl5Q2MK3t38kwsptJ0HFPTvUpoJqm9rVotmDCfo8eI4q2xLV8u1ZWo
	NO+N5CtITVoU1Q0dyau5i9azZosjCV4QLHIVhHnkuwYvd8fF46mHsV41oIUo+HCxvq7TqxA+7PqrF
	Ga32qFg2MMbck6PfjEC2gZY13t9UIlznBptnQ/HdEhFKHFuN9YKrkPV7NAIKSV4UdxotYGEwvJmtG
	FQaZ4PZqmZPSUI2Wfi5FMfKJQaWO3ZYmci928QS8skqbpaUar/56HfUF+Hm+tKJ1ssFlokcDPzUFg
	ZUrMjoFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKl3-00000002k4w-3X3S;
	Mon, 27 Jul 2026 12:48:37 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKl0-00000002k3g-3N64
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 12:48:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so29755435e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 05:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785156512; x=1785761312; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J6DdaVZ57Cvm8wo8IqS4pyHaIv3vcpLo2R5s1tMtqxI=;
        b=fnb4Wdyd6sWGyp5BtG/Oth2YdZqBrFBDt/tB3V5VNDEJQlOkBZVxb6T68Yodn3Askq
         uKvsspjaiyWB69pP24FySNcQevA4tNKAxjx8fdWfFAld3phpq66nBI24NCt0NlPoKqPK
         hxGdz1y4TsGQLlFMa91oQbULpltcRB5F1D4kXUqXnsnxBjCez+/3/pIbuUv9tq1yvGdw
         UlpFYOWeBiiqC4O/DjYJ858X8hFa7BME9Ss7s/b0eRexKECLPzKOVkUWfAhxn0K74sL+
         qsf/bEU9BpWPno0wtpnU9TFKai8wB+lky76OqsPEMewILfX2sPWiNwf4YRiQw79hfgSU
         q7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156512; x=1785761312;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6DdaVZ57Cvm8wo8IqS4pyHaIv3vcpLo2R5s1tMtqxI=;
        b=DyfPKvLpWwfWFMnJ2Sc5PyKtZxZGvjChyy0uEmR5D/EVlNEdmY8vq1xXB6UWaho+iQ
         qvLpPwUY66UXeSwLlhVtvkuDjhYB/2zmT9GGDbRb+1Ea96067Hdn+LEBZeHcDgjDHLEb
         kc0kdScczWGFNACJBS2mR4unpGhJXo8f0vx5kMu/TYhmFUGASQrZElq1ElYwaMVphe2R
         seu2jrxzTGfaGtjNyedqvI5GtTxkQsRn8ZTkdn7ICHDDb24KyU0ykOiNelL9qDmdbFkP
         zmdHxT5782GRyjt6hgz3sdr4xmQ3Te0XdA6Cvjsk2EkWi2JBT0laVwp4Qu4ej7AE5VB7
         DoZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqlxC0Rh2w8K8fEJT7U1u/qRb/R60e/Ol3UNLM+d6MQg90p8R1nGrAhP6E/foPnep4f3zNG+ENSz8bg6scI0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7K1qouoKeQGxbA+f7sv7QH5o7+5jJXEUZ+R5LpHa+xQcF1g/Q
	cyxsCPoZtYA1t4Nx8Iu2zZnqC4yhJ+o4ofe9EbTEEAtIWFDgmpFnGyzI
X-Gm-Gg: AR+sD10rDzchbi36zuM9suTn/omB/D+orkT4otZ4kcRfeRMN2YQkpd+KnNflXqV1ijB
	1U1BMkYNmGgdecmxnNb35g7woi+pHE/V9XvJjJjtvtYru8+u1F7MlEJA1UxpGQTfKG849NpWisC
	yP//J3/+/TXB57aqQimzfgWhdh4HPdZMqEbZV+rTLPqN1zHegZj8eq5uxX78YPPtQ01bav+g1lW
	Jvn+ToPSPIQ0F1ZE62yVOBPnbn4yFoTobC8z3AWkevNRRl4Dr5ExsbVgoXlFzn2av9K6ZZYqBBO
	3LG3HFzNuvVVs+lEwZjaRZSqa0w8anRpiVLkYP6J1LDfb09eBHVm6txGlLYBR7Qj+Nw6yrlhIta
	+QCFf6lIlAL7SI/ijnEIDbO0phrVrknp/W0/ZDaEYntdqnbCwYtmEmIE6a/OKvtPXNmBZ4USnPA
	==
X-Received: by 2002:a05:600c:8b47:b0:493:f176:dc69 with SMTP id 5b1f17b1804b1-496b572e886mr119294425e9.37.1785156512062;
        Mon, 27 Jul 2026 05:48:32 -0700 (PDT)
Received: from owl5 ([2001:861:3201:3d10:e302:2368:a20c:3848])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4858cfdsm238084945e9.3.2026.07.27.05.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:48:31 -0700 (PDT)
Date: Mon, 27 Jul 2026 14:48:30 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Adam Thiede <me@adamthiede.com>,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
Message-ID: <amdTnudq48tZUTG2@owl5>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <8733xko1ms.fsf@geanix.com>
 <0f719c00-3cf5-4403-afbf-713b07255981@collabora.com>
 <aleM9Wy9otpd6Je3@owl5>
 <aRN3_2FHX8XmTcwduTAPwz4UFde4B0tbB09ajyeUg5qZxiIYMmbvMkG7CPoNTl4iySYMZawbLMWijO47R22gkg==@protonmail.internalid>
 <65558ccc-4f2c-492d-8c74-627d27dce864@collabora.com>
 <87h5m0mkca.fsf@geanix.com>
 <alpTEPsy-SIQv_Oc@owl5>
 <b26a4890-12e9-4995-a71d-d0b7458b1570@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b26a4890-12e9-4995-a71d-d0b7458b1570@leemhuis.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_054834_852754_42B58702 
X-CRM114-Status: GOOD (  18.28  )
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

Hi Thorsten,

On Mon, Jul 27, 2026 at 02:28:56PM +0200, Thorsten Leemhuis wrote:
> [top-posting to facilitate]
> 
> Gary, Angelo, what's the status here? It looks like this fell through
> the cracks -- or was this issue fixed in between somehow? If yes: great!
> If not: Would be good to finally resolve this, as we are long past "fix
> within a week" rule of thumb from Linus:
> https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed

Not much happened I'm afraid. The status as I see is:
- this patch is necessary to have TI SN65DSI83 working
- this patch also follows the DRM guidelines saying that HS clock must
  be enabled during pre_enable (see previous answer / [1])
- this patch has been successfully tested against MIPI-DSI panels (by
  Angelo) and LVDS panels via TI bridge (by myself)
- Adam reported an issue with another bridge (PS8640) where resume is
  broken
- Esben offered a patch to the TI bridge that would fix the issue we
  were seeing in the first place.

But for the last two points, I'm not sure this calls for a revert yet:
- enabling HS clock in pre_enable still is what should be done [1]
- maybe the issue Adam is facing is due to the bridge driver instead as
  it could not be reproduced with another setup
- Esben patch would break the SN65DSI83 init sequence, suggesting that
  the culprit really is the MIPI bridge for not following the HS clock
  requirement in pre_enable instead [2]

So if we agree on the fact that HS clock must be set during pre_enable
then I don't see a reason to revert that commit.

Regards,
Gary

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/drm_bridge.c#n169
[2] https://patchwork.kernel.org/project/dri-devel/patch/20260711-ti-sn65dsi83-fixes-v1-2-d85eb5342b98@geanix.com/

