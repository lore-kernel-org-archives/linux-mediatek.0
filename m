Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D316BCD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 12:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAPCyLKBSHRTWSRRoqdJH1JxTgNtm+xffvG0gyEDWQ8=; b=wSUrxYDFMNP5SD5oqMccFJpibc
	tvZqV/TmwoVpqjWCjP76tUTrh3qfMs64fHwEz1QAd/ZyoqpqCynE8eNgn74YvWc1Vli+QQYJdyV59
	BOzOwzD/kzdnjGvi85G7iH36C1vU7dTmaAGPlAmmL9ZGOP/OH60g/PMJjfsejKXWr4Q6/jnBgvpEx
	MF32RKPAoHTLYx2/CpzpS8YNcMP+G2cbjyZ9hqf2qRCeV2wDISbhRfJCrJDIq7QTmIrP+YlpNHOvC
	C7M4uRuv/PrgBLCnHbkRb/FvIgj5Zxkx/HpGBgZ2WolVAqZm+w79ZvZllzWnhtHXbQR94yKSWSB2D
	MPwe6ZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXWv-000000070dE-0hKO;
	Wed, 10 Apr 2024 12:58:21 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXWn-000000070Yk-3pLB
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 12:58:17 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-34641b7c49aso1010369f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 05:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712753892; x=1713358692; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAPCyLKBSHRTWSRRoqdJH1JxTgNtm+xffvG0gyEDWQ8=;
        b=fKWavx/ORpWOCEC1yjA9WIZmFaRcgCsaK/Y/wwmg3dpq85CgBHXGIjS/VdEhCv3eED
         tqkFLMm/NJMCTHDkOCkKDbnQdowTTaZOykrPcFnwNbiVnLGzlA9fz/XzdxJzG/g8FG/n
         FQcohkoCyCTqed2EFMIknMyrNeAZiNYFBbGkBUWCgic+6eIIviCS49MPUjtZtU7G0pTq
         HuKsex7/IXNB6PG5+L9aWKTdk2AO6gau/sfkyFcejAsu3zbIBxtRjFyynEcK1YNN7msQ
         Beqd3UILQTWkrTlvvgv97NG04MbjSJuzakBTpQWCe6JiqMtRAhTaptvUYhlAUnylEkxb
         6drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712753892; x=1713358692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SAPCyLKBSHRTWSRRoqdJH1JxTgNtm+xffvG0gyEDWQ8=;
        b=KZ5uRmclGi4l0bmHHX/Yx/lCkWFkL8r10AlxOxuJ3hjy/m/5i4nCQu1IhcsxrYH04M
         6dqo38AvNo/0+WE8lfaaV3ZqLh6RWRV0nSNqHPJNPQ5kNA6qk9t35zSJSmCo4Mak9IFw
         7d6OGWpmkso6nygEHP6TVnCj+kRZQU/9vWiseNCEsH7rseYInDxh6MaHV3jzZR8qX567
         9ryp4IwooHEjyr7koSc3vkH+k9lSgszJjkqAEyS/F+wQ99Capi3cTw/R/XYJkqNp5Vcv
         y9ygzIsyUEvA7CzeXxDsQ0tv7SUqlmaZWuC1PzRtk1oTG1+xiIxLe1bnxmLZFPstCuIi
         dXaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj0rHcKuqJNU7W/fkFMJDD+s7/OU5kdYDK2RhyB9ANhj604dMByMngXHkcrJCWGWiq9+lLJvM4GSEuQUdl3gWPwzc31xWlbvFsCBHopSOLnbSa
X-Gm-Message-State: AOJu0YwDCQhUvCellvyyNs+O4aYhVbZT7DQhamwG3hMF8Yx1ettpl+fu
	T+JPrR0mz1h0tGwx63K3zRYUgsy2cjI8Cfkk04w0rcqj/nnoc5fbWi8wMjPx/Xs=
X-Google-Smtp-Source: AGHT+IHfa120qRAfspKcAyRMy5PXxHlCGJzmW0vlTzwyQGnoeYFwCg8fQKa0TokP1NrBdWntPAlpFg==
X-Received: by 2002:adf:ee8c:0:b0:346:47d6:5d17 with SMTP id b12-20020adfee8c000000b0034647d65d17mr1758280wro.57.1712753891611;
        Wed, 10 Apr 2024 05:58:11 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id l4-20020a5d4104000000b00343e392829dsm13404941wrp.97.2024.04.10.05.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 05:58:11 -0700 (PDT)
Message-ID: <4c43eafe-f173-4a35-962f-a5f5f020a587@baylibre.com>
Date: Wed, 10 Apr 2024 14:58:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/18] ASoC: mediatek: mt8188: Migrate to
 mtk_soundcard_common_probe
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
 eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
 jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
 ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
 <20240409113310.303261-4-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_055814_174424_985FA638 
X-CRM114-Status: UNSURE (   5.42  )
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

Similar changes has been done for mt8365, it works.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:32, AngeloGioacchino Del Regno wrote:
> Add mtk_soundcard_pdata platform data for the MediaTek common sound card
> probe mechanism, including a driver/soc-specific probe extension (used
> for bits that cannot be commonized  hence specific to this driver), and
> change the probe function to mtk_soundcard_common_probe.

-- 
Regards,
Alexandre

