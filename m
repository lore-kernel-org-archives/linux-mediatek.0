Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AD1EB64D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 15:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lA9/hHLk5qwfI79k0d3i9t2nQjTbjcWdGuZ0ZnzyAiA=; b=nOLEYns9ZxZwZRYMJf/3mtVtFS
	dZxhtO+ZVVtmW2LCX22roBEATF7Wf6O7JNFzsIx1PueoxJ6cxRqXWMbD8Os3pOEAVEiZNDSwpHgs7
	PcA8QXINZSbI95DRpC3CN/ku1FgSFkMctdSoN5BTK7m3AoUVJXukOEWgCMV4LH6+Ufxy5Dc9rD2mP
	uzXqIdTJxp98a9/NwjNq/3we4Cw5J1e2nmJa11aSNPQ5WAGZ1Zk/hwY71Z1D3qVPLuhrTZSJnGBfY
	3z86PMnnXddaNA6vN39Vp3SKZo4IoM3U9M4/yVJnXPRyl2n+fNUzF7RqNUkGDSw50eUN3jRogit+q
	XC20Zhxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qItCZ-00C6kK-2F;
	Mon, 10 Jul 2023 15:53:27 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qItCX-00C6iU-1n
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 15:53:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbea14706eso48054335e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 08:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689004402; x=1691596402;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lA9/hHLk5qwfI79k0d3i9t2nQjTbjcWdGuZ0ZnzyAiA=;
        b=CknPydnVGzDk87VkGC0p9ZLzYIAWYt3UF6+0JuxeclEmisO3B+Q/Fs3+6kgUUu83BS
         Cz4kkhx23VD+2sYkUtJXCocFqMCup+qM/Qo9zCNyq6kHJfGO/DPkRyCG4UGNsBjIBTAK
         wbG+mzSqOYNwcYcuvPOrywvjZ9Jj4Fp8YxXFp23vRevfmx/PaCiwCJPHWNFZ/bTfPILF
         9f0yjY8JF2juLF64vT9LGU47yZ2frhb4P9pRTk9Sw4AzViRZ2hb+id406vs0SaNCyGbQ
         SBL5oUojSuFZx1Oi3KVKcKufzonUpwvgDCosKnIpqd731xh32eXwIQIxKrWSzZjQJ+o1
         4h3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689004402; x=1691596402;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lA9/hHLk5qwfI79k0d3i9t2nQjTbjcWdGuZ0ZnzyAiA=;
        b=UXFBhj6f7njqKoZbhHFtNIyRnWUbsHeBM8tqqdTo/TG6VOq7u5XKPMsmqscpRiwtoy
         rJJVTjwiNKZkutXwsBz6WnALNZ6i5YL0LcB+bh9q7x/uK9WUbajqemiHmfcTV1iXB78P
         abJOfaaZ/lMpiB1pO6p0AYTs25RnkCaPeNQA/U8EbQ1koUUVhggY+z8vPVZiLneEGAvX
         dT+CPZHQ5hmonq12bmBsfrRoGeLUXt2jtTKVacQ42SuF/lKDvO0BlNTiEUWvWlB+mhTE
         /96wtPxde/4WJqnwkGWS1J2Z2RoHX+WNXiCVB4I3ucHZsUXy3NHE/iZQoWmAf31GG4ep
         ihyg==
X-Gm-Message-State: ABy/qLYxVhFyI+mDPen8BQROioYlBydIYY4hMyQfzvGabLU0b/mS2pp+
	cNwlLAyRdfpTm0Tf0OR4z/w62A==
X-Google-Smtp-Source: APBJJlHlL8GgNNdOgjFD+JG/AKxAl7mbQ4NcFkI5galLW268ybjXxtIlMSZdSlwqA8JZaHGxIGaEeg==
X-Received: by 2002:a05:600c:20cb:b0:3fc:f9c:a3e2 with SMTP id y11-20020a05600c20cb00b003fc0f9ca3e2mr4588325wmm.6.1689004402541;
        Mon, 10 Jul 2023 08:53:22 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id u10-20020a7bcb0a000000b003fb739d27aesm10579102wmj.35.2023.07.10.08.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 08:53:21 -0700 (PDT)
Message-ID: <7bc3499d-15cf-8f19-49a2-cc3fa0ca51fe@baylibre.com>
Date: Mon, 10 Jul 2023 17:53:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 3/8] soc: mediatek: pm-domains: Split bus_prot_mask
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230627131040.3418538-1-msp@baylibre.com>
 <20230627131040.3418538-4-msp@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230627131040.3418538-4-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_085325_591470_EDC5E34C 
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>


On 27/06/2023 15:10, Markus Schneider-Pargmann wrote:
> bus_prot_mask is used for all operations, set clear and acknowledge. In
> preparation of m8365 power domain support split this one mask into two,
> one mask for set and clear, another one for acknowledge.

-- 
Regards,
Alexandre

