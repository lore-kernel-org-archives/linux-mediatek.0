Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91727C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 13:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjIdUq4Jsx9/GasEwdm41tjYbvcUo9h/pUwit0AG0qw=; b=JGrspcFsbm20MmJFzTwgBjwFZk
	NVxZAoQrwz3nzxY6UWqNV7X5tbZbr5DI7cF1GFkbNgtlKj73S/QKqy9NafbA27ZNlVyUDcMyNN0fX
	UO27RMSFhVHEoo/5UzjGHlgeYOT7CmN8EHAN0DI54djlsWQX+fP39xpLIiFjgeHP/VuZr0Nh16A5a
	DJMhQ/u6WI4yOb3Rj7R6wqTclxJuAcpuoCoeojk8GoBVDavxVm+mbZzgd+4U3vxBsOMsPEqWa3Ynk
	jzJAlr1y5873eOle92KdMZmNaA9ycZRuOITpHg74/y/8/E0a83YqBJU1+Ma739fkXrDCn2NfXnztg
	L0odj95A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pma8A-003Fp9-1s;
	Wed, 12 Apr 2023 13:03:22 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pma86-003Fn2-0L
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Apr 2023 13:03:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id n19-20020a05600c501300b003f064936c3eso11195915wmr.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Apr 2023 06:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681304594; x=1683896594;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yjIdUq4Jsx9/GasEwdm41tjYbvcUo9h/pUwit0AG0qw=;
        b=I+U9p2RUdQ0jma7vWiMjgOivywGBJsk9WNavQzLUEh/9XwD46/PWdCmz2jtHMZlyPh
         IJR47kFbuS2krTR8D8TwAoya05XsgHSzcDXHIKFJzmddiFLXTOi+ZU/7tUJOrDz/yILl
         SIXsvKy2gl0NfWrtKgHqPiamvl5ngUisfT9GXgEKfhhEJvyICrgLJbZ3lPLJT7BHpfo+
         OSGfbwxEm0Np0ji7Ls9mAhsRxdI+nrPhkMNNSp2Nx/v3JKn9KszmNHXabkT74hCnStwN
         NBB9zEfXfbjr1st9ZZsooom9HhGVRXK1j0XWYSO1zD6vifKgxUFKlHowMFXVEnUTh0NE
         pq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681304594; x=1683896594;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yjIdUq4Jsx9/GasEwdm41tjYbvcUo9h/pUwit0AG0qw=;
        b=Ab76OjHgJBTRSCMURSjhY5tgTOCbf15NuhH2HT76jYX5ZMdgpGR8nTpItvNRHJG0WU
         /uhlM7AfnBfK3JXzjvqK9Tu8NyVj+S2bdRYE8aGmXhTrg5RweDoDfHnE6d05pq4f8Zf5
         R9xRSzkcgIWTODL8A3zADbmXVnEg9HHAAeb/jQxRzGKCVEhUtQPc1r/HNBmM4SY7Zclm
         HX5jZ0761TL89j0X2p1iozAoBthdMCCM2DieZE8cXolReM7A0uZttS9q1qW4jGAgQ7Zt
         0n38Y9X26ChMUUwmhYtyLfLGePAlk01SDz5zQvW4z9iEOXzGpKAm/3cfZhYL69xxyKjo
         D8Tw==
X-Gm-Message-State: AAQBX9fH6BMgd6WG/Ooao/76pG2w3kqm2O+Oc4aojHIBx9jezh4ab11c
	tJx8Xzm7hnWzSt3KJIUiCnVS1Q==
X-Google-Smtp-Source: AKy350bDmpM+Lm/AqJiXBxAL4RoNuLKnffa2b9rPXFmlseSpOQ7ouXWDEFlId84sgS3bp9uw+f9nsQ==
X-Received: by 2002:a05:600c:292:b0:3f0:a137:90d9 with SMTP id 18-20020a05600c029200b003f0a13790d9mr218544wmk.3.1681304594013;
        Wed, 12 Apr 2023 06:03:14 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600c350f00b003ee9f396dcesm2439248wmq.30.2023.04.12.06.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 06:03:13 -0700 (PDT)
Message-ID: <c2b4cc90-9dd7-60b5-66f0-56a4d19d63e3@baylibre.com>
Date: Wed, 12 Apr 2023 15:03:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 04/27] dt-bindings: display: mediatek: aal: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-5-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412112739.160376-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_060318_147368_A5C82AB5 
X-CRM114-Status: UNSURE (   6.74  )
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

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795: similarly to
> MT8173, this SoC has the gamma LUT registers in DISP_AAL.
> 
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


