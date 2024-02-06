Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE26C48297
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 14:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VCL4zV/fY4TbR6w8G33YGfXgioFiEYO2kvyU3dpfMUw=; b=sXhoAxW8PPwCJ2
	jyaTf/8xzuBy5uMfCfyZgwO1K2hih/DBPpCS6COYQWegQ/zBtoazSZknhkOdU2hHGpXL5Iw0TCRZq
	W8WX4wbQk2z+QHjAjm8KQ+YvccokE9U1MWFBrE0r10dk2dXAKl11lxCYq3VR14wjqi4Mq7rFglGNN
	edbFNxBGCrcZZk3Cz6iwgYo6C/E4XdU3G0CavsItiAHUxXZPW+q09cn9eaxVeiG6mgKzmmGt1aEPU
	ETBwOIeRto5iWc9HFfsyd2vLMa2VrGMnwdv3is+oCr2CkgdDyRsV3nbQnwgr5DhOEPw8FYU1RIJAJ
	nNVfHwxw7m4bG+P3WMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXMtg-00000007xo4-1koX;
	Tue, 06 Feb 2024 14:58:04 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXMtd-00000007xlG-27Yp
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Feb 2024 14:58:02 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-56061ad3d3dso1363026a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Feb 2024 06:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707231480; x=1707836280; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCL4zV/fY4TbR6w8G33YGfXgioFiEYO2kvyU3dpfMUw=;
        b=g/I9FtwBac10yNJPGXiiNsmjesZhXhA8JfPzGzzevv3W52UHeSY40Lg9qFuCsaVjQH
         ktL+8k6XtArkq+4B6ra6KMGhJs/dWtrTR8KcvcqOEJllIIv2pws+0mMllvQ9d4+kMFpv
         dauLd3+Dx5z31JXHXdYk+5H/66zM+ucexJ+3/r4cKSVIxxFQqOeE47eot9n7dsQersti
         B+7iTI1PSpT9gDMQAvxZ0W7/EeagBaUeyS1MMrBYzPIxbn7YdwqFMd0Inl6em5nF5FKn
         vLjKrG7ZcWclh/qV+XW3nS03fnKnPAAzcwROZS7QO92QuwzPbdIk8YcBm8ZQUZ1eN2/L
         37XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707231480; x=1707836280;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCL4zV/fY4TbR6w8G33YGfXgioFiEYO2kvyU3dpfMUw=;
        b=SntCyvan6nFKXVR1uqfoCpPeIUTsiLsfC8uREiiWRFq/WAuXbKhHmlPwqo7SPOS6Cx
         OxAP+w2qmTM6h2EMtkriXQqJi0vG+AQSivHYZEcxMdNl1cd2tKItaeK/iFFHv/MwGPcm
         wBtwZJ+MjPUdyU+aELmAnc5oyNjGzVJjgDmdJk7JnTm5ZkoC9RJfAkBwp+P8KczxRQ2X
         j9pXIkD8zUN8RGZdTJmT5jrzBkaYn0eHfEUOs9CC+j38jP8ZaAuVn++8xvd5kbVMQkD4
         V/lB+tg9aUc/b198eJ4dfAHJOXat80d2fVRkk8dyDCWpOtiAyupZy5hAxwAem0cm+tRn
         DpgA==
X-Gm-Message-State: AOJu0YxpLsi2/fdwx7uI9pnyr6K64UKaFk6aI0/IsApIHI0+qhLExBR0
	UMvkRk0WSjbrz1p7FQtFc0IhoWBmPkTRqvhEIQqlDvYdbbHLaxo3J8adAyKit74=
X-Google-Smtp-Source: AGHT+IE/xkMN+vq5s766SYdEh9U5SinilVRtC+iNa3NXit0ZGBcC6EM87J5PH4nbqf7jKMIRuG73mw==
X-Received: by 2002:a50:bac5:0:b0:560:bb98:6b7d with SMTP id x63-20020a50bac5000000b00560bb986b7dmr972125ede.10.1707231480008;
        Tue, 06 Feb 2024 06:58:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV2qU3BBiKmtKQKW+yzgCKFG+aWqLGGCGZ5OIYjaHTbPrBA4VcqyeA2tbkxDyqK6Uv8LGmGZPGVg/aF7sjjagiuwvo2enujdmA3klp0fgwUIN+gU1AzNmx4aroEb8uepPsd1ckdiGwcQLppJvKWeViTjAISYcxXJlRQNQobV1+h9N46OhD5XRfekGxm3mv6v+KkbSfEGnKXRve612YmHswTbkpE6Q8QEomA9mgR/4xdQh2ZQ/BypZUTAc3dypAI1dwEj/pjUdXaSZsxUqp3HXoriAHaLqyNWU7W8tr2n/zcCBqj87uGjm1hvswqATFsWZnCgOsQf/atT/OH4zWU+R0VND68NHY1JOs4JXbvrXFA1/20Bsofkh1KvYNu/bdPfyhikHRxpfWMAYDZ93zCfRYXOxRTclY7o89dMg==
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id cz6-20020a0564021ca600b0055d312732dbsm1120026edb.5.2024.02.06.06.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 06:57:59 -0800 (PST)
Message-ID: <74778dc1-1c36-4db8-9d5e-abdff9f8d8a5@baylibre.com>
Date: Tue, 6 Feb 2024 15:57:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] drm/mediatek: dsi: Cleanup functions
 mtk_dsi_ps_control{_vact}()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-4-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240206120748.136610-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_065801_582632_A0F09758 
X-CRM114-Status: UNSURE (   5.92  )
X-CRM114-Notice: Please train this message.
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 06/02/2024 13:07, AngeloGioacchino Del Regno wrote:
> Function mtk_dsi_ps_control() is a subset of mtk_dsi_ps_control_vact():
> merge the two in one mtk_dsi_ps_control() function by adding one
> function parameter `config_vact` which, when true, writes the VACT
> related registers.

-- 
Regards,
Alexandre

