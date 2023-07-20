Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E38AEB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 15:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScmE8r0rxxQCSuio4l33tUu3r4Tsu2mdETilqyHlA68=; b=Ab4QeitHx4HBuqpFhYa8hXKyyf
	CdCrjBbHXD15fM479f+I95bvnZo3jaHyDWIFlUsCe2dB/NfUIlf0hVhPzWJmu5nCmPzPdVtemNWB3
	q6YkbltIKvrQkAGhCoMnDT5kvjRwEo1W3b0NIgoU6UIAINiR+hrRqug71fi1TO8E47QqP9dlpJAlH
	uXCPYn647+R4QNq+qQwOe4BelcEuJ9C4ggyZrSoxJRvI7ubNxTQCGxw04QPR4dYKxBvFnFr9+g+b6
	n8F11G/1BVhq571CfBN3TCc+ZiWMtFelzhOLXMA9JkBtA36pjAH02XaEaWswpjDNSSFu9qekGviYL
	V50e7a6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMW2a-00BcLr-1r;
	Thu, 20 Jul 2023 15:58:08 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMW2X-00BcJZ-2L
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 15:58:06 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fba8e2aa52so8510885e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 08:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689868679; x=1690473479;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ScmE8r0rxxQCSuio4l33tUu3r4Tsu2mdETilqyHlA68=;
        b=A3exCasWYBk9MN1lB8jnIxVvIYr4390ayA7HijOrvQDBD/WZQTcZxCfhhaTK/dSRx7
         AknB73ZWYt+BFUyrwessOCVTrBcH1z60/QOQFXrQtWzH9Zmqvr5mXFNi7sC3dXNZOiGp
         nFRDgc/AFIZoqPmhnVKw05buL8OUCoEJfY06Z+fvPRDxTxFd10+4ikAkY0wgitmYMrBs
         9MvVw87BAPcBcd7vgBp1MelLgXwjyOkWtLYYAwYVgzbQflFvICZ4dWvRgTY03M1fzfSf
         aHKonVx1d+dKiNhnGMyYpQDsXgoHobkZyP4gqNvvWa0oHSOkbq0t4wEDZdgaion4k8re
         t6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689868679; x=1690473479;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ScmE8r0rxxQCSuio4l33tUu3r4Tsu2mdETilqyHlA68=;
        b=QNbm81T59+hL56dUgkuPu7erfa0nw75XEzCD1rCSRagLnkDkfFam2AOQ7haczcABfF
         QeT4Sw+wl066pgR4yRMQiz24vbzCiiqQ7anAH7CgMjMmKdqJabuWvLaoBJiyFXfG3qRL
         w5XHtyUhDTQJe3IBVN38EbyjjkQBceVYMUQTrEUsFtZOvHl5c3YQqKTM+TQ6kVinPy38
         CCP8rxclUex7OyoOcwPVnXXD9yMw1tqJ+KTLWTm74pzCQ6v4OkyOd0NgORVlgsp1HogR
         Gv+ZLjJIF95mR9iv8QPEt5gIHoASaQ0THV7jcryj6siUmnRWj5rc2FvJcQHJE6UyRenk
         PfmA==
X-Gm-Message-State: ABy/qLY/+a1YjieJIsSPETbnBPNSXRUm2dWQMRGAKzACyNKTZLwvi3dc
	yzt5tLt22h/XtMQc5ODpdj3BoQ==
X-Google-Smtp-Source: APBJJlGYC6yA01AOSEM/0mE5MXhgTzoU6ewGKF/cbW8YmGXhi7AkY7Gets4CXxis5J5YQaTN+4qPCA==
X-Received: by 2002:adf:ee0b:0:b0:313:f235:cd17 with SMTP id y11-20020adfee0b000000b00313f235cd17mr2257248wrn.40.1689868679497;
        Thu, 20 Jul 2023 08:57:59 -0700 (PDT)
Received: from [10.1.3.131] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o8-20020adfeac8000000b003143b7449ffsm1690412wrn.25.2023.07.20.08.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 08:57:59 -0700 (PDT)
Message-ID: <d2817cd7-0d44-5572-8e38-da5478da5fe7@baylibre.com>
Date: Thu, 20 Jul 2023 17:57:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 03/11] drm/mediatek: dp: Change logging to dev for
 mtk_dp_aux_transfer()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, nfraprado@collabora.com
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-4-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_085805_763058_4E646AA4 
X-CRM114-Status: UNSURE (   9.79  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 17/07/2023 16:14, AngeloGioacchino Del Regno wrote:
> Change logging from drm_{err,info}() to dev_{err,info}() in functions
> mtk_dp_aux_transfer() and mtk_dp_aux_do_transfer(): this will be
> essential to avoid getting NULL pointer kernel panics if any kind
> of error happens during AUX transfers happening before the bridge
> is attached.
> 
> This may potentially start happening in a later commit implementing
> aux-bus support, as AUX transfers will be triggered from the panel
> driver (for EDID) before the mtk-dp bridge gets attached, and it's
> done in preparation for the same.

-- 
Regards,
Alexandre

