Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E05C2BD05
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 07:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVMa9A6daZ/dRP8VM8IurvG+X0g0NVTgiHoFw7o3XMY=; b=yFcLNIQ7EMAvaWx+XiDfw+1E/k
	8TIt/7/mSemYSUP9alWHeokoM+7lcR8ecruGMf4MmUcinqd656OYc8Ni2bAjAnpmP/NLuSS7s9fH9
	YciKGhi0/4VtT4gGVgdPrAdcodbCNFf/KdJ07wqZxrfSzzf++Dof+WRC8s95D22jmKALPCoLeHhAk
	srXDfAqK7thp9fPhbC5IjeOaNSOygG1+tKc3+1S9wYfUomB2nnKHqlm91IsxA+yryC0+NOxt1cDmj
	DqMU6RA7adU7XavHTMSF81zXw09DZvNqPGzisRbMvYvotcU1KEUyiHYwo6acg4QRN9Zpu3iOkBJhG
	PfOMJJBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLdyO-0000000FrJL-0g0Z;
	Mon, 24 Jun 2024 07:18:44 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLdyI-0000000FrIA-3lYw
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Jun 2024 07:18:40 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-57cbc2a2496so4483251a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Jun 2024 00:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719213516; x=1719818316; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VVMa9A6daZ/dRP8VM8IurvG+X0g0NVTgiHoFw7o3XMY=;
        b=MOpmf7wGtL++jh3sKmZpMS31hp/5Vkk5wydaMeZNV4aprupaHA6UDnrgMP2kozSdaN
         O2xG4bgQgJeB/ueDg0ciOuEXUDvk3V96dt5P5TcROthq7fbxMTSb2oCEgj1l/o+CKq/e
         0YaXclaZ3CyXEP78IfL0iINIBPFoAWVSuzBZEPHfPET74gwe3Xq4b5d8fM3P8P5FCPcW
         axenJPWOldRNae6O3GZ1WsDn5kDZf+vvqTgXOzXmN6H/AheinZv8Zga5uzkew4HyNsUS
         U0YDbTOJnTzlyETzPqJyO0TUmFY79QEqiyAonjSMItNKRTl0eUBdBLNKt8jgr/+Cuu7F
         ZbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719213516; x=1719818316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VVMa9A6daZ/dRP8VM8IurvG+X0g0NVTgiHoFw7o3XMY=;
        b=d+hsMXFyzmjyCqfXZgppipylLEEYaR1vN4H7FJLFnKfFD3KHvPsT4SBes8luypbBMt
         F6GEl4lEDyY6w8SLvE7OLtxCW/akv20XRYFuTOTqyoRQ+3d9nAQYbXwp869+T2LWsGEN
         9H3hJWC3KAZLqtmwj79ITdarSMxJq3bNa4DYJnE9gEZDqpVa28XZEk8K1B1T3kUdedkx
         5WDJ0V6doq9My5n2dCK28i9YhSjFFYaOJAmeRXBmbFmJ1AW6Lx3i50jgP+w+rqOTezps
         /IGnpPsnY5ktQONxPh95PG+d4QddEgMXw67uOrCJ6XBrf+gviBABsBAk6bOgrUlh7HSz
         l6tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpbkWmmZkHvW0DP+jcL72r9vSjSHIja4R4Zkj2xaITIEbRD3RCQv/t0cVZqmLIdXZTvaBooCzaWTlgJLotp56UQcVQNGeoCwttm6u+G9JRJuO9
X-Gm-Message-State: AOJu0YydbHVYVYSKEcqN+jZn1r4jHhkPP5uMRUpIfKJIpSVJbUE8iBd1
	oTVSV/kuwBS6HiwzWpRtZ9l5+Wl2IQdoXUgCjLBpE3eVwewkpvLThbEqIx+C2MY=
X-Google-Smtp-Source: AGHT+IFYuzkC5GcaR7ybJaQuKfvtiTIdzs6hbNIAng1NWd/STYMqVRnXwAQr3lPQRgqXQ/dOhA/qTg==
X-Received: by 2002:a50:d503:0:b0:57d:3ea:3862 with SMTP id 4fb4d7f45d1cf-57d4bdbe7d0mr3049784a12.27.1719213516347;
        Mon, 24 Jun 2024 00:18:36 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303da378sm4280811a12.18.2024.06.24.00.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 00:18:36 -0700 (PDT)
Message-ID: <20fe8bd0-2760-4568-94eb-889b9cdd4339@baylibre.com>
Date: Mon, 24 Jun 2024 09:18:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/15] dt-bindings: display: mediatek: dpi: add
 power-domains property
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
 <20231023-display-support-v4-6-ed82eb168fb1@baylibre.com>
 <CAAOTY_-sk1aoXdG=Wq_fMAtCxqA=VC+GVOMURhaDadXnBqm_kQ@mail.gmail.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <CAAOTY_-sk1aoXdG=Wq_fMAtCxqA=VC+GVOMURhaDadXnBqm_kQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_001838_962194_F0DA775F 
X-CRM114-Status: UNSURE (   8.81  )
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



On 21/06/2024 17:10, Chun-Kuang Hu wrote:
> Hi, Alexandre:
> 
> <amergnat@baylibre.com>  於 2024年5月23日 週四 下午8:49寫道：
>> From: Fabien Parent<fparent@baylibre.com>
>>
>> DPI is part of the display / multimedia block in MediaTek SoCs, and
>> always have a power-domain (at least in the upstream device-trees).
>> Add the power-domains property to the binding documentation.
> I've tired to apply this patch but has conflict. Please rebase this
> patch onto latest mainline kernel.
> Other binding patches in this series is applied to mediatek-drm-next [1].
> 
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Hello Chun-Kuang,

First, thank you for the review and merge.
This serie has been rebased on top of Angelo's series [1] to
use the OF graphs support.
I have to rebase on the lastest Angelo's serie [2].

[1] https://lore.kernel.org/all/20240521075717.50330-1-angelogioacchino.delregno@collabora.com/
[2] https://lore.kernel.org/all/20240618101726.110416-1-angelogioacchino.delregno@collabora.com/

-- 
Regards,
Alexandre

