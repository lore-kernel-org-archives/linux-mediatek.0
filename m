Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF9AC001B0
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Aug 2023 09:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImTxFrGkAb789gW58cUuVJn9oePTNlXvzPB5nJrZCQ4=; b=1SO0Z9hnb96YTTGuV4t/SCX/Gl
	lYKhwLePkmMaPxMPhxRqObUjI7FswRO+H08Jl1U4wpDljfSyA1duw7EXmlQjZV8jwsrVRXxZMzAYl
	mx6m7/NFyAUvNCOoW0oQrcqwlvjnuFZv7QofhJSEiID7hTt6bnxiYLiChtGNQsf7Z6m0XVDCIOPT1
	mggePrjk0gtI4JYQ/aXPbZe4uugfq58j+dWB5+v2s3F1cHcUi6KIBoCOkfnHL+v5uR3Ncf0Ncla0M
	u66dI2pzEmKqPxmvICV4P4kbIIyiUxtU54V+GjuaQ8s+8z635byTjSgvEipa5TeTDcERpKOZVDd8J
	b7g6w97A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSwo2-00GaqX-1y;
	Mon, 07 Aug 2023 09:45:42 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSwnz-00GapF-0u
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Aug 2023 09:45:41 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31768ce2e81so3766197f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Aug 2023 02:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691401537; x=1692006337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ImTxFrGkAb789gW58cUuVJn9oePTNlXvzPB5nJrZCQ4=;
        b=F8E8v6VCabwPufDFg52rLMuhHjcVTlKRIkxSchTMvPMZvYyrHlb88+ruQSwa9aS8o+
         ecPuJfre8m1B3T9UCIUAWhmtm8WxAEJP/1vvCQulIVBvbuAvIcLrFAeIwG7fvHp6xYyW
         rS2Q/C/CaNvFsf2mvN/RElo/LPHvXfCZxeDnKOACOZFS1rN5USa+JIugANj1tKyraWz2
         lwnOwzQO0UoH01bs1joHvmBKFe27HdhKZxO2cxH97j51YKJKWkaqGSEe03V/Dhy5a3yR
         HWWq0IA29ZPUkeHH/kjNQH3mlNVUB9jY7+Fzsljudd5LBNYDTjEbAdD76wnUXJckbCWs
         92xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691401537; x=1692006337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ImTxFrGkAb789gW58cUuVJn9oePTNlXvzPB5nJrZCQ4=;
        b=Pz9SyDMc5VaCoeJiY3E6T72HPdE8Dq975CxedDfnNDNDxLwJkPt+O4AmKobLTrpKUe
         MKkoPjazmBT9zIQWE8aJl/+x40FRH9YOuESTbayU6IAbvoYQZ8nI8TAVV7opKq8o0baR
         ZmOS3UjNOPEartNY++eJO72v3kOvNUHXZZgZD6gZraLkE9QYvPSS4yWOpGFXcRmNDNWP
         3l+KPH8g+zYlE+Ks3q7Iy1iWs/+cJKVQCPPK318XsMSNgD+IqZSQ8fTm3yNtOlEyAfIT
         fhpdUY1z5MEl80zm0iDcvaghOl2DFDXUigVFryVsaaCETpTE6iYJduMyU20zkluM5PQo
         ABbQ==
X-Gm-Message-State: AOJu0YzXI7f16h6rvmIh7LaLhdqx6dcLVA+T3zvkFuIEjF3DMLDix5Tt
	i77AE9u4n7I3KD8YTW65iWfD7A==
X-Google-Smtp-Source: AGHT+IHz363ez884R4/+bJfvf59hexuHu1VfipBNOcFTwW09jwsazFEehtYVAJh1NXc2ExFcVlICdw==
X-Received: by 2002:adf:ff8c:0:b0:317:df3e:13d with SMTP id j12-20020adfff8c000000b00317df3e013dmr3290134wrr.38.1691401536950;
        Mon, 07 Aug 2023 02:45:36 -0700 (PDT)
Received: from [192.168.3.194] ([89.226.188.45])
        by smtp.gmail.com with ESMTPSA id w17-20020adff9d1000000b00301a351a8d6sm10042906wrr.84.2023.08.07.02.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 02:45:36 -0700 (PDT)
Message-ID: <98fe8211-52b4-37ec-a0eb-7dc0ae5a0615@baylibre.com>
Date: Mon, 7 Aug 2023 11:45:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v4 2/2] drm/mediatek: Fix iommu fault during crtc
 enabling
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230807015110.30579-1-jason-jh.lin@mediatek.com>
 <20230807015110.30579-3-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230807015110.30579-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_024539_426503_8068CB2F 
X-CRM114-Status: GOOD (  10.80  )
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

Hi Jason,

You forgot to put the Reviewed-by got from the V3 in your commit message.


On 07/08/2023 03:51, Jason-JH.Lin wrote:
> The plane_state of drm_atomic_state is not sync to the mtk_plane_state
> stored in mtk_crtc during crtc enabling.
> 
> So we need to update the mtk_plane_state stored in mtk_crtc by the
> drm_atomic_state carried from mtk_drm_crtc_atomic_enable().
> 
> While updating mtk_plane_state, OVL layer should be disabled when the fb
> in plane_state of drm_atomic_state is NULL.
> 
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
> Change in RESEND v4:
> Remove redundant plane_state assigning.
> ---


-- 
Regards,
Alexandre

