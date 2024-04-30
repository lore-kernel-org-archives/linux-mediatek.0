Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69489C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 10:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61QGK6EE+JvUrOTegIXYCGltaVd3HNOf6mVtdZdFzzs=; b=2DG7+1R/oiRzlIUXd55HleQACS
	Xp4kukVgy314HVmbqfo6OZtaJv3w2qIL9x96dQzDlCb82/Mgkbl7eONiYIa/wG1peU69ys9VsgWuG
	YRDq5ZVIhEWpJLZBPC9EemrvtQyqlTN86UGismXxgHjAdPFUsfY+yi/mNpzFVgvei/ktDev4ri2qd
	5deiQZQcNvQ/YRAV5xXC2N4PwadCfLOH4IiOJbcEwcGT0IAYVkDbJ0Rmnsym1qdKi41YxlOep4lrd
	4z3RZCfIugQ8FIdHXAleR8673EaTTLb32366lq1k6LKvw8uExxboapQTGffm1j/brMR5mVZz2BiiU
	/7mw5dYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1kYt-00000005yp1-28ym;
	Tue, 30 Apr 2024 10:18:11 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1kYf-00000005ygr-1UsT
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Apr 2024 10:17:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-41ba1ba55e9so29995015e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Apr 2024 03:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714472275; x=1715077075; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=61QGK6EE+JvUrOTegIXYCGltaVd3HNOf6mVtdZdFzzs=;
        b=P48OuQDitCj24wV2zDaHjqM6jmaAkB9F3jGCWA62H3prNMgY5QTvuPRV1N+8HlQIX2
         zeKP5XyMYRkUTSV6Yl3plUurUZFTJRv41QMKO4s0VPW6hf/y8KXNNpfr9LuWgSR4t7qu
         DR0FAKwJwzRQIEiCQjm43gE3p8YefZjwvLmtVB9ycAlHxYhb5IzB4DQhryXxOD1fWPuP
         vPoa2WSygTLPvd79KAVTwKyidZZqWxVkA8c1a0QgnEwf6Mfg42RN2f2DNnSUpmEV4lB9
         CEahUgiIeAMlxkwbDVGAOF1p6Jc2N7vV2xjjdAFqbu40loW7bOvgFYvd60d819VjC/ls
         raiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714472275; x=1715077075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=61QGK6EE+JvUrOTegIXYCGltaVd3HNOf6mVtdZdFzzs=;
        b=HUbEC9CHrynFnXvwVEK+9smT2t4ZZ+F035dAUodG01LKJx5tmnVtLVPX5qWWCIxeqt
         fCjuxdayFUBa0j8GaBctllpOWi8RG9WWtQozmIfIPm0vVU1/NY8Uug11keT7UnaAgK4f
         Gc2ksvP46ESwp2zqV7prQ+FdbwPqROBd4DA000A3rLnUJzj6PCtWqD82EvqnnZU5RT+1
         QKueKlSf4sWodUs/H1TUU/wZXgnKjKtwp1s5rN1qry5lK+/N62UP2ZgNmH9k5SzQNAy2
         QWnrEi6A7AAY2z6eBHRfFYMOC5D68M4JjzyQDB85f1lFjJjXOZpe6A9TqK6GwQjhbk4D
         0QyA==
X-Forwarded-Encrypted: i=1; AJvYcCXP61w5Ytf/IiYsKXf77jyXrKoKuXBcgap5bznDCPXerut3MTmtbvTzWB/fS/pqr5p/z512fcRTAC4GouPEmP9y+qOQ4Qqivp34IXFDzTjSNM9p
X-Gm-Message-State: AOJu0YyJ487rY8RWwX823EgpTaQii/Yf2khKEFOJX0b0F4hsNKKX6n2v
	kEBgozXGGWiCHRc0+WWREkGYUcl2zlWCIzL6bbHegusBClilkKQVJMLdZUthibk=
X-Google-Smtp-Source: AGHT+IGicD8LgUlYM1L8jAIzwk7lp2yQ2IjySmGuztg67KCqJ6vLOq0P1wNOuCpEesOPQpne2u8iGQ==
X-Received: by 2002:a05:600c:1e28:b0:418:3eb7:e8c6 with SMTP id ay40-20020a05600c1e2800b004183eb7e8c6mr1897308wmb.5.1714472274834;
        Tue, 30 Apr 2024 03:17:54 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id i17-20020adfe491000000b0034cc9dcccbdsm7046219wrm.113.2024.04.30.03.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 03:17:54 -0700 (PDT)
Message-ID: <1fc23530-89ba-4e36-9e9a-a1289f56a9bc@baylibre.com>
Date: Tue, 30 Apr 2024 12:17:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] drm/mediatek: Add support for OF graphs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_031757_616387_22CC8F9F 
X-CRM114-Status: UNSURE (   8.50  )
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

Hi Angelo,

On 09/04/2024 14:02, AngeloGioacchino Del Regno wrote:
> This series was tested on MT8195 Cherry Tomato and on MT8395 Radxa
> NIO-12L with both hardcoded paths, OF graph support and partially
> hardcoded paths (meaning main display through OF graph and external
> display hardcoded, because of OVL_ADAPTOR).

Is that make sense for you to add the DTS changes of these boards into this serie ?
I asked because, IMHO, that could help to understand the serie.

-- 
Regards,
Alexandre

