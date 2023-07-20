Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C98BEB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 13:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUTFNNzxpz9uwH1NN747Wn6G7mosnJMsS5OABZdxOY0=; b=NpN38fFG2y7YF8nv9AvWJlv0u5
	hpoBzorgdu7XWOdiH6zC1pG0Fcpz0rbqSYGR8+TimReSljjJOea3lXwi1uVPk35kand4NPEDTP8Ew
	sqIM1dGk4BYVf7oPA1/hpfNQQyVA4U0PGQTxs5x4nzyrZKWm7uHwXeEtYKomM6/lXaotXMs0xMruY
	nM00k64xaNQ6ed35MxKO8353Tha5BNgEBmqJ4SlJJ4DMmeaYXRPPNypDEjbUEFk8FfkGOMvXoJnZ9
	ATRWPXGqK6ZVg2fn1HwwB9FFzf2Cc5VZlr1UvqG3HeRtCEkoWpBzK7N8NnngSZMFzgULE1MeNFl2N
	q7Oo9rSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMTJF-00BCVz-2E;
	Thu, 20 Jul 2023 13:03:09 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMTJB-00BCU8-2h
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 13:03:07 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso1212770e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 06:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689858182; x=1690462982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUTFNNzxpz9uwH1NN747Wn6G7mosnJMsS5OABZdxOY0=;
        b=mYbSu1BjEcQ0to09bRKOeden10c8fmf60Z14TNO5q4AxtKBMUgSXli7MvsscGdm9Iu
         QKnaueckfNnGNRBSEw/YLQX1zgzGec0p4FGihilxzeujQFIKv7oOu/Im1mebBhjUoaOv
         X8N9PvNSLEn6TtBwtgKOQLw8HHIADQg8SXCZCgMVBCBLAXhfzV73vZIX+43mss3TBzyL
         EbK99wcmYDmGoXjyZciyMv7P4W/SRIIcOTsu9laugpFvErRohtA6H7JMSgAQ9VGWlqh3
         nFm9Y4G2KtqFOUCkutoQfAPyOZzutkuozCLOG4BbtBo/LZdiRFHJSVgLs/wVyTMMfLLs
         5Byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689858182; x=1690462982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rUTFNNzxpz9uwH1NN747Wn6G7mosnJMsS5OABZdxOY0=;
        b=K7NrhtSDh3/bUbsoOXbw5B6RpnzHbsa4lJ17kqe0mtdxQHSqnE6nFxqcG5h423En8t
         RYZ6FJj82jCZdZxf4c2t5mXN+2COCqk4E9v5zjuxCCGt0gaYw4uy4sDcWz29D8Lw128C
         8HjSix0AVONvPZC2Ca/FQCb+WHU7aqMGFdcF5kfIuw2ElHhNJzztuaA0p1kOwDpsphnP
         Cs1gOMR3NbMSvN115hVLCwOc1aNxR2ORpsxGWYM1dZn1rNifwqavUZqM27DwhCIdx4Dd
         Y2G9y9lMdEqmPfoXUzIHU9/e2jIcbYLcu33H1QIIburJzLdMaeFzxx1NnhNXPj718VLW
         uG3g==
X-Gm-Message-State: ABy/qLbBC6YC95skYmgE9cprJNrVDnNLle3dhPAnRou++4OKYuByI/Wn
	bysyrDstZHmNrkzrb6M5AVI/vw==
X-Google-Smtp-Source: APBJJlFkZFwqh4iAS4OEASUge9kO88VgdxXGm+cXnF0tKyKqeN44zff9Ug6bPKAeL6TZe9IEhiyqtw==
X-Received: by 2002:ac2:5b85:0:b0:4f8:770f:1b01 with SMTP id o5-20020ac25b85000000b004f8770f1b01mr1499575lfn.19.1689858182181;
        Thu, 20 Jul 2023 06:03:02 -0700 (PDT)
Received: from [10.1.3.131] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s2-20020aa7c542000000b0051a2d2f82fdsm745547edr.6.2023.07.20.06.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 06:03:01 -0700 (PDT)
Message-ID: <7822b114-0ccd-0344-cea0-760b892c85e1@baylibre.com>
Date: Thu, 20 Jul 2023 15:03:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 06/11] drm/mediatek: dp: Enable event interrupt only
 when bridge attached
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, nfraprado@collabora.com
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-7-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_060305_870539_FA094F2D 
X-CRM114-Status: GOOD (  13.27  )
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



On 17/07/2023 16:14, AngeloGioacchino Del Regno wrote:
> It is useless and error-prone to enable the DisplayPort event interrupt
> before finishing to probe and install the driver, as the DP training
> cannot happen before the entire pipeline is correctly set up, as the
> interrupt handler also requires the full hardware to be initialized by
> mtk_dp_bridge_attach().
> 
> Anyway, depending in which state the controller is left from the
> bootloader, this may cause an interrupt storm and consequently hang
> the kernel during boot, so, avoid enabling the interrupt until we
> reach a clean state by adding the IRQ_NOAUTOEN flag before requesting
> it at probe time and manage the enablement of the ISR in the .attach()
> and .detach() handlers for the DP bridge.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

