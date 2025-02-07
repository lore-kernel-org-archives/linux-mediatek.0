Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC28C02194
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2025 14:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDisuTD3ZLBeOSNMxc2GUk38TNgB9LS+VU1agrbB+iM=; b=ik+GyeiTFXvtHwEWDG3b0tAqDG
	Ld2nNcUlWeyAwm3XbdIak49WG0ixFAXf7M8KDr1v9eO/GNL2/w2KzmPSa5m8H41GxP2d59xTMd2/f
	7mkW4BbBDULgcNoR23TY+PEamlL+QF26C7bJs+pXS5K2TniSduSVnt9uKr8WVBDRQejTViYwjz3kJ
	E2w8bdtisNNgt6XP7W6npUb/0+/EcV65FruXd5DyF94rFhYsuytscMnQb3QfDhtysEk+OFUUskmDf
	UR7+iS/xAxVDOgpmHYa+dozZQj5aYKU0vcKLy3uLFOL+PYhmwLJQ1/8Eez2a2bcM1oe7y0nE55FmS
	6o+dlHwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPGa-00000009ptn-4AIM;
	Fri, 07 Feb 2025 14:23:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPE8-00000009pWk-1JZf
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Feb 2025 14:21:06 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so14266995e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Feb 2025 06:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738938062; x=1739542862; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qDisuTD3ZLBeOSNMxc2GUk38TNgB9LS+VU1agrbB+iM=;
        b=xTopoJSC5b4rJMflVJ1QyNOavI9fn83BmV6QYtefUSXlSbSoR7iNNu5ALRMv/zcNsD
         uj32bJENGpZkbmzwIS6l4CrY8JSm2huQw5YTuxwrSW161ah7KFoxjcWs043GgHDj+yFY
         xBnwja1AGsLJwU8DEc4izyMvfi45cI1M3GeSqPNncaYB0+sL7xa/ZcqFIKi+MmonYvai
         RVlH7TUkLO6Tl/9tJ49hcdsw52ciQZug53nZqqxxfbCf3SPwIjR45qN+eSfptAm0Ibty
         N/RBoLs9xg1D9QhFUV3p75YIY9rpD8XGr7LNO21hltyAYdBFHgi+AfoAySHTjVFEo6Es
         lfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738938062; x=1739542862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qDisuTD3ZLBeOSNMxc2GUk38TNgB9LS+VU1agrbB+iM=;
        b=arvQoGQZSqC7RzoelgYW2mCAvyhTv/XgeJfY2kbZXR47v+CUBqbpn4Qd4B701Eh0Wj
         cwUmUHAc5LEzGi34P00OEpYyzZvDk69QmdMw5CgBWLyGbtoKpYYprHTpJHjJQV3+7UXb
         kfDmIB7Ao/Bx0Ji1PxYAdkgPUz1HquQaN6dhppxazx0MQ45ktWE0pnMjLdf7a5ESxHmo
         1sG1IszqGZHl/gPEVwpL57yaARlFtAl8IcvkotSvl78px11HPUqrq5f6/IZwgWwviQ4w
         YpKXtxvHCceorBF2FZmR3TllPfRmDascnC6/caK0UKYre9G095R+lIYp2eNSwhlvhiiT
         P0bw==
X-Forwarded-Encrypted: i=1; AJvYcCUVbi/Bzbj+i29IViOiyhTfzAGfZ5bZA4gEcfw1IIOE2xKGU0O+Nhsq+mqPso88JBxWkqBtgxwa/uomJaQQ2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRIV7/snhPj/9qc89mXGqqguY1yJ3pyvGp/GZEFz1tJEdaeYVK
	JABAkznxz+vnwcpi/QEzBrrVc3/dTMrAxoDfvCqnsS/d8u77kweG2KY1hev072E=
X-Gm-Gg: ASbGncsGmP7CeC0wHO5pAH2EdMN0TmYg05bPOBafmBLwqqy+gHT81A+L3aLLWatGcaH
	OOUn1u/nMofBiejI2MHkxP8JPqH7vkmIF2KpZkN7LGc8FLt6pE68iGhiLliMzj/E8i2gokHQhlJ
	lemNrkpG2JskSaUcxwYVUj700vs0uiWUIeVx+iu7XkBgxSpC5/76FNXGOu8V0k17YCDNngmlBqA
	Jh7H8TanlmunIg4hLJ8//aGfvesp5rojBcieiRpbx7ZK9EEgW3EVxIGDCtghoWjunVlfVux+eUY
	69Eugf2D8dlK0f8KCxgaaGlZIsSSDz5suuhu3Z19tBqWylKLo1t02IgQbJK0jMk=
X-Google-Smtp-Source: AGHT+IFxDkESsH4G5gG1BU4H7B4x8RnSu0oAxMNZ2KGruE88D1fDp7b1Y1apydP5lwwz3pFDUdKEAA==
X-Received: by 2002:a05:600c:c19:b0:434:a386:6ae with SMTP id 5b1f17b1804b1-439249842bamr30302495e9.7.1738938062277;
        Fri, 07 Feb 2025 06:21:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8? ([2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da9656fsm58840305e9.3.2025.02.07.06.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 06:21:01 -0800 (PST)
Message-ID: <8af4e0cb-4ac4-4ca4-ae81-6b5f7a06bf3d@baylibre.com>
Date: Fri, 7 Feb 2025 15:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/34] drm/mediatek: mtk_hdmi_ddc: Switch to register
 as module_platform_driver
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
 <20250113145232.227674-11-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20250113145232.227674-11-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_062104_343924_1B3DD6DE 
X-CRM114-Status: UNSURE (   7.07  )
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
> In preparation for splitting out the common bits from the HDMI
> driver, change the mtk_cec driver from being registered from the
> HDMI driver itself to be a module_platform_driver of its own.
> 
> With this change, there are no more users of the mtk_hdmi.h header
> so, while at it, also remove it.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

