Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D325EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 13:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gVKLalCnKJyVFKEYA/aeQE5NMhQhDJSpVDflsC0RHE=; b=Q47/Omf/B9TyqmUINx7ZkUEz1v
	TArTwEo2rUnlbpg+KLZ9dp/RR9Y+VQP7aA+beO8mfpq4YDOK2mWBcJ/2qaOnH4E5kn4BY4U6447GQ
	f51vEUM7K7vg0qknWGAMK4uHCQjstxKmQMYxyjrEfAuK4JbcGc8/5wFlQq+JzCbeEYRiTceQGWBsM
	9igGCp0+gvHC5yKw6ZzdPmmbHILsb4bPN7vGh0K3CXPdqHzogO5AIo5lX8ld3aRtm2FTKzZr67qEt
	SSUibgt9c3jVOgX75wr5nVvicIvdxvq2iFsC1h768esuRSDVlkoEKjTVdljvHaeI/Jo5HhftzFAmG
	WCdvbzDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJZVS-0001lU-1Z;
	Wed, 12 Jul 2023 13:03:46 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJZVP-0001id-2y
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 13:03:45 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31590e4e27aso4331640f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 06:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689167021; x=1691759021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3gVKLalCnKJyVFKEYA/aeQE5NMhQhDJSpVDflsC0RHE=;
        b=yS2Ymfgh8L3mPR+FT8+S9ZseYw10W47Ifo8rhgAW43xrjdyH9QSUS5LxotXGW4pM4j
         LCLIRcxYm/XsY4hUvCG9UZCcIeM+zOwsz2MCi+1Fce3BOGQ03vV56S7aLFXb3JTfLCzo
         nigRNcdTBLQka0/SbQJvcjYTp5xXsGeBqzYKX2NnMVmKQx/IGvqJ4rf2IhcIwl4dZKlN
         2PvDu/UtuPimR3goJZDNwu2DopYqClTptxG4Q8SEDCTVnjleElknDIndTBvPv270AqSH
         OGMg3kWOxudgkaggCpcRd2jwVY6HXoQNwGjd6uxLP3xmSaP41B8WjbbOBj2nwlpXl2et
         o7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689167021; x=1691759021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3gVKLalCnKJyVFKEYA/aeQE5NMhQhDJSpVDflsC0RHE=;
        b=NYe5M5Fv2P6X0cARt1qKe6N94ZrFdfESrgvFXZRJlsvFjgjHbjhaAjAa7cHPtkhprP
         /gR9Yk4YeBeSkGg/PTZhObhY1rQInst8gl+qqPLiUOXU71ENUPwChGc0QYEM+hbHzozl
         ABKSu7BA2OuLCjntYLVnPghSzm+gv2n+9/i8PugGRs6364CQXtDcwGyRy7LnwYUhyx0K
         fF/7FouJwXo9BDyVN2ZqAioc70FpZARGupwldxzyb1BIri4BTP1AIN9E7SgaHQQk7KW5
         1vXqNmcnko0RMwT/f1HkrbbX68W3eVsJzQAg5y8Foua0yz2RicxJj/ivW0hl5CxxQDxI
         PYTw==
X-Gm-Message-State: ABy/qLbbQ6alvdnxBi0jJqfxCAS9iOvCRBO9rh5+928c/LXqmKKHeEmg
	S+ANXLXBB1yIAJLAAi1hpf3jDQ==
X-Google-Smtp-Source: APBJJlGI2b047RWaYG6CTnzPtae20KR5OjN1EgJIkCgV1cLrD0xJ5uB3HcXw1wrHwP5ZVgcWayCYmQ==
X-Received: by 2002:a5d:58cf:0:b0:313:f399:6cea with SMTP id o15-20020a5d58cf000000b00313f3996ceamr19407509wrf.4.1689167021315;
        Wed, 12 Jul 2023 06:03:41 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id k2-20020a5d5182000000b003143aa0ca8asm5082491wrv.13.2023.07.12.06.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 06:03:40 -0700 (PDT)
Message-ID: <3fd78e84-b16d-e1fc-85af-d19efafc83e0@baylibre.com>
Date: Wed, 12 Jul 2023 15:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/2] drm/mediatek: Fix iommu fault during crtc enabling
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230710093253.32224-1-jason-jh.lin@mediatek.com>
 <20230710093253.32224-3-jason-jh.lin@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230710093253.32224-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_060343_967028_EA6819A9 
X-CRM114-Status: UNSURE (   8.37  )
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



On 10/07/2023 11:32, Jason-JH.Lin wrote:
> OVL layer should not be enabled before crtc is enabled.
> The plane_state of drm_atomic_state is not sync to
> the plane_state stored in mtk_crtc during crtc enabling,
> so just set all planes to disabled.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

