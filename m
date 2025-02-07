Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B00EC0219C
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2025 14:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAwcnkM+PzRe51c/ss1O+62EsfQXolXBWlx8ljeQQPE=; b=WUdsWl6OmijA8nwssqn/F5akH2
	FF4KL2fpffw41Tcv5UMESUQs/rlkRVi9RjFegLS9qoZjRbkpRc3hM79tyfFnwvqOi8UhiThEBpIEc
	d03EEiIOQjwU+16M7Vh92wHd39Zt00VEFYEuyC2BtYI4HPDlvIPyPp8woYv5O/sLCWe2eszRL3fHT
	6rSHZSE06L5hvvMPdO/cZ5vB0eBtRvGZIxWAA4V/S18SHSgRWRx5TRG0/D5dcGx43DDVahS7S5e3K
	yEVKX4hcAUN7XiYECTvbHGDp9sopN7PA+yZBTWuM0770k0/j3dTuVfxvfzNvJasv+R7yRCItcXhiC
	yCowSqiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPGb-00000009pu7-1HrQ;
	Fri, 07 Feb 2025 14:23:37 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPEa-00000009pc0-0OWw
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Feb 2025 14:21:33 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso14618925e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Feb 2025 06:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738938090; x=1739542890; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NAwcnkM+PzRe51c/ss1O+62EsfQXolXBWlx8ljeQQPE=;
        b=iahGvqnzN7bkkkVW08uK5VbZ2ikQrVNWXDsUnlF2Nb4H4qoTL0XnB7ko+uXzCi+I79
         XaOv1XSL772wJuRTxNB3K9VTylAhlnVZ53oJy4Uis1raD00FFdhdoLfAD25GPuEsg7Ah
         cKF8dPATJLDsSfcUpsbEyfMQUBUjramJ53DAeCP5Ahc/HZWuDvJybfUVhJk5o/8d9EWU
         EHYXYXm7bKw2FHXWPHZ9Ii+2xiIatzQmVFkKsgoq192Fjiao25uTIItO1D+nq2f1OMgs
         SA8o6cj40H2K3sfC6cvzMrXIMcXP/pgJqgKO9jwd4nMIylnLy0FVJ1h7UFIptmOMLWte
         iYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738938090; x=1739542890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NAwcnkM+PzRe51c/ss1O+62EsfQXolXBWlx8ljeQQPE=;
        b=JxuPj0Kv2Sk09Q0Ywxv7ZmAm4yAgi+z+IuL33mErK4UCxXqmqB2SSfMUT1nVhKBpWR
         wZNAXSvLnP+yeoTtifIjlBscuhHyCy61o9qSx+5F6xXge/ON308pMM00gYaXi8+YR2oL
         qC1DDzfigTS2AmwEdAxt49HlzRdDAQmCx+el/U8FTsa8erRCBIiFUlr6aKlckKPoOUi+
         N0kaqdVqqL3Kr0ZsEEQpYIKnFDCbsIcfkrLZiMbqSgl11O7ZQOphXP/HdPVAGmxKw52j
         0h0jQlp7RhAZneqQdSxk2faArs/2STwhMBzlLiHFYXj81ryJgdFVXXgMvzcLQXfYIuhT
         S12g==
X-Forwarded-Encrypted: i=1; AJvYcCUdp1pKdCnOtPzeiFGD0BS8/z151b+zXptz9sGU2QqoS2l3Llb8eoKDL9o5yRwKTCvGDQsSVES4mr7oNWlxKA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbqmK6YG6Dd8QYPdP01oXJpICAOJVvhCyj1jq6JlzIXqeTlHXI
	Pmjiqb4uUzN2kKJFrtzXwJTzIUnyAPlQ7CFXodPqUxqH1XfZEqOsqwvlVhDQByA=
X-Gm-Gg: ASbGncs54nyKWxh4Zk/R4i5kzr+YGMax7EKvG/nSME0Oek3UzDLV3XWByPFYTYiCia7
	Vn8DG7wmVMaDeY324srYPJFI1cqO2wglXgdh7foiZmfDZOdFP22RKFBOlPgvksmXdd5KEWOBLF/
	PZiol3QatwbKZTU3y/HKTrdcoyasu7dGeDOOo78qHef9HMreAhhUi+YpJaojoVw2QQvMKPnvNm9
	V9lw9TJAXg1XS9BBE9PxPd3I2hCwFRpKk0MFWyE/4tJ0ZRZJBqJMNkt8wW5/1eqlfaL+31IEgMl
	n1+d0rBDzuM6zb5648oSFbECKAu5WrYhgkmkLtMxye7nnQgoDQmJgRPefBByda4=
X-Google-Smtp-Source: AGHT+IHsAn/5NuVWMfrT0WHyD1iRvhJHcQ1HOD5ajIz8v5VPfyCTgBqaPudj3dtejQe1G4pbiVMvEw==
X-Received: by 2002:a05:600c:1c8c:b0:434:a468:4a57 with SMTP id 5b1f17b1804b1-439249ca925mr25071915e9.26.1738938090624;
        Fri, 07 Feb 2025 06:21:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8? ([2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391d5283b2sm58939355e9.0.2025.02.07.06.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 06:21:29 -0800 (PST)
Message-ID: <f2e04ad9-c846-40e0-80c4-1b0e443dd14e@baylibre.com>
Date: Fri, 7 Feb 2025 15:21:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/34] drm/mediatek: mtk_hdmi: Convert to
 module_platform_driver macro
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
 <20250113145232.227674-12-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20250113145232.227674-12-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_062132_140220_810F0EBA 
X-CRM114-Status: UNSURE (   7.61  )
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



On 13/01/2025 15:52, AngeloGioacchino Del Regno wrote:
> Now that all of the mtk_hdmi subdrivers are a platform driver on
> their own it is possible to remove the custom init/exit functions
> in this driver and just use the module_platform_driver() macro.
> 
> While at it, also compress struct of_device_id entries and remove
> stray commas in mtk_hdmi_driver assignments.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

