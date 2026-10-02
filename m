Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E6ECA5FE0
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2026 09:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8FmFOHYSHqj+TvFJEfarN2rwBXQ1VT7J59Vq32Ksb0=; b=33YIpMd1WNfTM2VIDAq0aLvo5s
	1IMAj5IPbdd4npYTWQBHC7I+uUb3oTDEIbc1hm7pPTh6w0lTXhnutLxgtPIAnUjIfE0ljHB1QYH60
	hnbLWTKYS/0nc8XicwxU78+60oxZ+qmlniXRjCU7mf1Xx0E3msmVQ48nf0n6l57iXn5xxF+Lewcsn
	Kxivq2Jdq6tzhKrwr4+dGO33Q3xckX3xMsxpnTrX/CDJyuLu+8is68x54g1V5IUP/507dTHat+gB3
	ZyYNbZfX4QShRI9ZZI981Glu6pGqcs+bceGoO9kh8TIYCpEzrI47NuJz7PoDSlFZWIBueT0f57qo4
	89rU+kkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZNW-0000000B6z0-03wu;
	Fri, 02 Oct 2026 09:16:30 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZNS-0000000B6xR-1636
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Oct 2026 09:16:28 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4885a1480a2so4417289f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Oct 2026 02:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790932584; x=1791537384; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8FmFOHYSHqj+TvFJEfarN2rwBXQ1VT7J59Vq32Ksb0=;
        b=D9xk+y9fDdTl8AU5uv380sDEBKM2atoBwC+rkD2WwSDDe52bL/zV2M83epy0G92EiM
         Lmp/YTv5qYTxkLo9h93qfizBefLhOBC706viHu8g09U+qDc9DVHdNmBuJPKzhy92k12o
         w0DUuVpbFO7tGQLg0CMnEl/+hcuMfSIDDaoowFvWajHcWncMCjndr06ps1bM8LS+Z6td
         AyujW75aLvGU4IXLXxUjVxVuDWsu97DQ7E+8Noov/I30Tn22Y698H8cIG/evotWq+0Ji
         wudd5uM18ewYeIsJpO1cSDm+hMQxxTRJh68qZvMdtv2HO0QL5jmSJ1X8U2UaBsH1FOeM
         FBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932584; x=1791537384;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8FmFOHYSHqj+TvFJEfarN2rwBXQ1VT7J59Vq32Ksb0=;
        b=mHc4qbQ+upRA3m7zq5mOP/BsJqZTB2KQBu3tSI7tPmksm8KWkoUT8NhQfRMco9lthG
         ra0t4OaYyM4g0PNBVPS+46RX7Qjtgkp6nXoA3Us/1Jjbwkq8FEvABEMDVWWMJyWR/RuB
         d35TwG7RPItni//dtL3dtTraqY/MFduN9it2LRkxzLyompluz392Sy8vVnjok/V2z0jL
         AWqVRAWRYNl7ey5Oj6C/cVC6V0zIqttAyw8x6mbNHaPCJVKJy/nj0onEQnOoswJHASDV
         JW3Wka8SqbI6KkluCutc8VrmsjCEKlCTWg1YTxv0wPptA3yvoWddkyAFZ2fEITA0JlOy
         5IKg==
X-Forwarded-Encrypted: i=1; AKwUvBxr1G5tER6KVb7lWerSwYs5XHJWwBnC2JQjHBj8eSnHQQ8PcfiI0D9x/Iqp3LSm/R3O6PQOINvFsd/YMPSetg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIqzLLg8j7IBkJa4UWOijntYhTuezkw5qbnAIdJudkd6IrMdLVn
	VmygGLRq6W/yXy5FA0v3XTSOXgvpNPZ+G+msO2qyMzk/qWOx8mb4Wrspooj/paeYXSA=
X-Gm-Gg: AYBFou1zdjKlkF4T10MKCxSjh/DdjgaaNMPINWoVf71tnxu4Qa0zh8yE4oipeENuQnd
	n1461qMhaV48vLlhNNmBxt8FdlYuci1fDL4iNXWOD6o7cBY44iou6BGSZ9T6F5VVpo7d6dVA0cd
	8STVk9NJCWNWCeyxgvNDNflcIZ9BLzIAYeWuPCTbt4Jui9xjLlSExBFFuxZM2RLZ3yOIdSWF7KZ
	upn99gLpbkS29GC++F5Zh5PhLsVxbHZxLeLj4qewX0p72VNzhv5NDwJikqOB/hKvjpRM69S0h4j
	5/gA2bFEN/mqxkKaW+Sy8R6n4MQ7edqJfvGgJZy7WuzQI0860+FTDQU4CeBhA8J6UHJ5+8LB7VG
	zxg86F41O8KDsoyfpNNnKZDs3mv+NkwLwhlAp+4fiS4l4oDA18KiLGbWim+4mfb+oYpIHU3EOiR
	N/7fpI9w3gcWOxs5Mq//YiM4xZCiEXf5X0oy8dl8Lq9FrAT84cFJaB/qe/bOmQ0AnfmdMSrDpqr
	5kw1pU9Ffjqoh8BFw/U
X-Received: by 2002:a05:6000:4816:b0:488:79e5:cb2b with SMTP id ffacd0b85a97d-48b127297c5mr3802494f8f.43.1790932584104;
        Fri, 02 Oct 2026 02:16:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9ad6sm4461292f8f.40.2026.10.02.02.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:16:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nickolay Goppen <setotau@mainlining.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
 Alexey Minnekhanov <alexeymin@minlexx.ru>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-novatek-nt51021-panels-v5-0-f5eaf5685c9c@mainlining.org>
References: <20260924-qcom-novatek-nt51021-panels-v5-0-f5eaf5685c9c@mainlining.org>
Subject: Re: [PATCH v5 0/3] Novatek NT51021 DSI panel IC driver
Message-Id: <179093258297.2282096.1579513931131957273.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:16:22 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_021626_321950_45B411D8 
X-CRM114-Status: UNSURE (   8.02  )
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

Hi,

On Thu, 24 Sep 2026 18:08:13 +0300, Nickolay Goppen wrote:
> This series adds support for Novatek NT51021-based panels
> for upcoming xiaomi-clover submission.
> 
> Although according to datasheet, the IС has three power rails
> in the use case of xiaomi-clover, all of them are wired to one
> fixed regulator.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: display: panel: Add Novatek NT51021
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7d2dffd72625784945b8a467b6d47fbed6fe7d74
[2/3] drivers: gpu: drm: panel: Add BOE NT51021 driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/94e45e3ad539291bdddb3cbf8f1803d42786c70f
[3/3] MAINTAINERS: Add myself and Ryan Brue as maintainers of NT51021 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/27282474cd58e274bc866fb881643cf93a1c01c5

-- 
Neil


