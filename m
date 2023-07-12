Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385AFEB64D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 12:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYsJ63thWaEnF2bdwDOY9GkDlg8P9/us46x/m6A1eFI=; b=yEZ3SEnDQmwVrDe7jck9xlqVz0
	QvmmNqlIFbshxKy8veXqs3j7mc/RPSF6WIkUvd8mPmwS7mwM8d9LAAaQj05CqIVxht+fZcjoLy4hN
	fM3sEBN6xtnUfoIJsdaRTimzud9XIuMff4knemM9jlYs493CHUz2yxNk549zp80/SFew93sOGrsD3
	5BJEjPOvvsN11Kmc2UuZtVOPib7CRDY8Meode5Rd0VRh8fPuphArTZuTDKdG6vefL+G4uHsCpmqMi
	M4YkidDI+9+Xs7d1jJa2nlZ5cgVCzImvlgRPSkdJ4dYbWb59qinIzhwycwctRnT397a0IpeXhyoes
	DqGOaGQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJZIw-00HZYh-1O;
	Wed, 12 Jul 2023 12:50:50 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJZIo-00HZWM-26
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 12:50:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso71536155e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 05:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689166241; x=1691758241;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XYsJ63thWaEnF2bdwDOY9GkDlg8P9/us46x/m6A1eFI=;
        b=hn8H70Zyxu8TQrRfZIDwdYKutfQz+JQgByvxMUo15F+OMIywfFp+Qe1KHa4SIyr4wo
         bqkkofWAawRDiaIa5iVwlqDsQ3Qq0VR8tdn/waIy4t/Nb5At258o9quiRvf8x/6b4qAJ
         zWcyLaHmENBOVZpWUM/XrYn4XXcgKwXqi87Xr/6ntu7TiQ+DjPCKfHzB4X3/04rzZ3hQ
         Rwr4z+XHlzVAPJ0AJC/Pr8NOpE0M8HahqrV9k6qGPN1q52NhccZEW4X5jWZBmrELwYlX
         Ast0Hj2NW8cGb8NnubWNxSSxBuwJCNUFkTo6xtIkeVB1+Ejj/jh5XGpsSw4lmPfFgiK8
         HpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689166241; x=1691758241;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYsJ63thWaEnF2bdwDOY9GkDlg8P9/us46x/m6A1eFI=;
        b=ImrL5JDWlUZOwrO/RVlG4jylCXGErkAYF5z61Up4YJIrkvmYKR40Z/Pwg1hhWDxnsG
         Mfg2o9vF6nlqdQqUyZkCvicJ2PuwAfhn234K/y1914oWwg3swJHUua9jIYq99bz6ea9D
         knFDjX2R7rjpRW+e+SIZcK4EqRFjZZPTrHdXsvU3LK21fti3itmelTKFJF1ics50m5Xq
         cPjd/HZljWyBUivQm6wD/oXdiPkHeJc98R9KDucOafb1tJxk2s7kahHNDkev5tMCdSSL
         fCBm65ZXFTREMMJ8z8AsRrzH2lXXOQzHQc0ZH/kDzUK4NHiJOAnQ/SOK8Ky1MG98VVYG
         BYgg==
X-Gm-Message-State: ABy/qLY918HuXSOh7KpgOioh4AgDO5ssbE5xA/hENk1XpjZ98gR6UvaC
	YL2AM/lNR0yDmePw5tWxNio4CQ==
X-Google-Smtp-Source: APBJJlHyphLNHtPrSUBpgCjJ2oqeaRUQji6SkdMtP6DiMk3xvuG5d//Mi73F/YxpSOuHVBAbBidBYw==
X-Received: by 2002:adf:ed4c:0:b0:314:212f:360b with SMTP id u12-20020adfed4c000000b00314212f360bmr16925439wro.17.1689166240964;
        Wed, 12 Jul 2023 05:50:40 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id y17-20020adfee11000000b0031274a184d5sm5023825wrn.109.2023.07.12.05.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 05:50:40 -0700 (PDT)
Message-ID: <5c24ae39-5114-1b79-a952-e7a364a1f2de@baylibre.com>
Date: Wed, 12 Jul 2023 14:50:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RESEND 2/2] ASoC: dt-bindings: mediatek,mt8188-afe: add
 memory-region
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230712070821.23971-1-trevor.wu@mediatek.com>
 <20230712070821.23971-3-trevor.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230712070821.23971-3-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_055042_689603_0055F919 
X-CRM114-Status: UNSURE (   6.37  )
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



On 12/07/2023 09:08, Trevor Wu wrote:
> Add memory-region property to utilize the reserved memory region.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

