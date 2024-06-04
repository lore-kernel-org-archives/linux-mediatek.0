Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43647C27C54
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 17:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUDUkB0yPn3kyHBF8xhR/h1d7c4PgjXWcM1OaQiMS8E=; b=TAMO73C5X2eLWI3mGofik/9OmC
	VQOMH54m+0+JN7ouT3RK8H/kz66YDOs6BfEzTWx6Ma6sb3QmQrMQzbxK6w1jXegfIfPq+64Axu6rx
	FI/IS7d1wyQvQFR1eO+yVXj6uWhJ0HjHXlkZVWBztyICfUHOmrs7QEZBDKEr4GNQ3efiDqN7elzmS
	1D0REqQdcsGt98rTn9iBAsVqpR+ZzoHZdULGLDiw3CXycqdoiWUIfxfwTEsWCvlD+dO/BQ4R0U2J9
	u/obTyvbh9xAhrElF7w1unCr15FkhfuXH8IDLxpfBo4nfBC8cKEbN1Ax3sZDqp8FIoWXgAvWHfgDp
	pL+sTqqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEYBZ-00000003LrQ-4BKt;
	Tue, 04 Jun 2024 17:43:02 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEYBT-00000003Lmq-0YFq
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jun 2024 17:42:57 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-35dc9cef36dso4950985f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jun 2024 10:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717522972; x=1718127772; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CUDUkB0yPn3kyHBF8xhR/h1d7c4PgjXWcM1OaQiMS8E=;
        b=OM+w/Ao5LKNN9LLemA87itd7+CksExprx12/ychims1buexIfZpAtnmgKQePe27yhb
         7qVPkWDLsOPkvG2zzLmcHxPvIInuVKdyvWNu+3/DT4iZ2siDioSNLIdrW/ZEHBZJRGh9
         Fgd57uB9p5oYReh65ARica8323dxCizYu5ZM3kbcny9rQFu4ARXAtoLgLn8b6mTenm1h
         AuHC963OM67apWM64Uyxq6xNDaTVrdBVtHQM7D0LQ+QNWOjMxGV6jV7LRooec2cxrbp3
         RCpKnSyV3vL6rkrfLp8IOPrm/oGbBCn15BE+3DTRn/wIu1QIlUvxsz+28hHHC9+Y+mOU
         DBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717522972; x=1718127772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CUDUkB0yPn3kyHBF8xhR/h1d7c4PgjXWcM1OaQiMS8E=;
        b=pCH9FnD6kOidqpPfoZ0ooMRojKA+DbPk/z2X4WNYsKWXla14GFol50UtRPxq34b7m7
         Zs4dddFYSv+pESoSySyTG84ufNVnrQTu8obgFBVmMHilPwkR1SaPN8IQtg7vnAUc+aFZ
         CBkb6vrnQeILGGrT+G11564HoXKeqno84Ghuov1oXZQtq1YCqr0x/zXcRtZXq6M+cxSr
         yLe5g+dIeZ06XbS+yQH7tNHwA1ja9b9I4P+Z5FLoooapeuzMkOqf0VQbXOrq9JogpHVH
         KKBGwtiulkEgvtm0PGYraguYMPAnXYTOpWHqxKU7c2fuAOCqFkRdSLwYJqLeAoIYv9JP
         1Nag==
X-Forwarded-Encrypted: i=1; AJvYcCV5AwlhGVbpI/QVy9jH6sYE1T/A+DtBhBGsH8PdmGh8JsSJ/94kos0FS9nu4gte888Fjn9VKmInClSdgJyD4JZI8T6PcHA8vCA8nX2qQMAZCCp7
X-Gm-Message-State: AOJu0YzgOKjINYty8BgCAN+WKzims6kTOIhzXdrh7FzqDS8zNinoaADW
	wUMB353RsKAJa674JGAi0lTqAIlyoPh+ooljw0WTwYW4BekISmloViqofIRVFME=
X-Google-Smtp-Source: AGHT+IGhKXEdUROFwRvvnHW7fRzNnhSf3T/ROeeU1mS/Kbg505utfgtM14I+vys8Mdd+aRFjeUo0sg==
X-Received: by 2002:a5d:64e4:0:b0:35e:8099:67f with SMTP id ffacd0b85a97d-35e840677edmr121290f8f.16.1717522972206;
        Tue, 04 Jun 2024 10:42:52 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:e559:5ee:5c4:82bc? ([2a05:6e02:1041:c10:e559:5ee:5c4:82bc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-35dd0633791sm12267406f8f.72.2024.06.04.10.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 10:42:51 -0700 (PDT)
Message-ID: <44ec6537-7217-4fb5-af1c-900de7b2a97e@linaro.org>
Date: Tue, 4 Jun 2024 19:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] thermal/drivers/mediatek/lvts_thermal: Remove filtered
 mode for mt8188
To: Julien Panis <jpanis@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Pitre <npitre@baylibre.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240516-mtk-thermal-mt8188-mode-fix-v2-1-40a317442c62@baylibre.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240516-mtk-thermal-mt8188-mode-fix-v2-1-40a317442c62@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_104255_185416_3D395F8C 
X-CRM114-Status: UNSURE (   9.12  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 16/05/2024 12:44, Julien Panis wrote:
> Filtered mode is not supported on mt8188 SoC and is the source of bad
> results. Move to immediate mode which provides good temperatures.
> 
> Fixes: f4745f546e60 ("thermal/drivers/mediatek/lvts_thermal: Add MT8188 support")
> Reviewed-by: Nicolas Pitre <npitre@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> ---
> Filtered mode was set by mistake and difficulties with the test setup
> prevented from catching this earlier. Use default mode (immediate mode)
> instead.
> ---

Applied for v6.10-rc3

Thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


