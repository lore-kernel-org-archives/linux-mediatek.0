Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB41C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 11:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiuIRKs9PjicPVCiI7+t45e05sE/xszCru50zXxeVEY=; b=unfKQ9JH72PkYhm1E7+2QXIvd8
	JHjaeLLnGRgjeqR/hkhncw1L3ho2VVb9pkbGzQ2/IgG7wVaIj+jUcRbFsZA4XCB7yjBhwpncWP01X
	WQqEbGV5qqtQ01pV7OSXrrnYmSVnUOvhvUeCvF8+AJ8l7723qqAT7Xc6A1tzHfUp6RlN0vuvEU1dd
	aG5cwH+2Kz8cUEIMZVXHWFy+escUKeRTz5lIRQnMIQRnStVmFTq74ODyjIS/3COrubrTez2JKQaEc
	e6fvTbawZ7smf3bVjUCU1dZe86qTduYDyVvAgofCLWlTPFi3HJlIEfmktXlEPDRBAgAXpGYRDseh2
	3zKHgCyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prH8y-000zcz-2f;
	Tue, 25 Apr 2023 11:47:36 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prH8x-000zcV-0H
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 11:47:36 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-2f87c5b4635so5110234f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 04:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682423254; x=1685015254;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JiuIRKs9PjicPVCiI7+t45e05sE/xszCru50zXxeVEY=;
        b=ALjxPtORpNCAYZeu6DgdQlxj7NFa6BnSD70Wnc+hZR0VXLFPGlr7Ne5ajzsnIpVxFD
         7iXjWLORbfbNICGERP1w2eL0pnpd0pZtgL5fereqLjzo75BgGbe5jJtRYg3o9z2JIn8c
         Y7bfX/vVq1AQ/gUH5KjoWINEEgZlhoKBp3MXesyB69LziMgb6kM1owXyPAl1bFKutu5l
         5kzqIzI7PqXkr+M1l6zbwfMaMmTlyeUnze/0csHt4lJxVHZ8KAWBr+ShF3T7EYm9Zstz
         CmeFEKvCW2EZkyPGkKEIpCw1YXh3fiKnpxqMDxz7pIpJUV4ZdryvPaEDeghBzEwhIW2L
         3odQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682423254; x=1685015254;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JiuIRKs9PjicPVCiI7+t45e05sE/xszCru50zXxeVEY=;
        b=DHyCyG97GEq5pA/nGaU0e/oMAWP4JQjPumkvS1qN0zjK3D3Vxwi8c0rllolMKirXxn
         BIng/8MBVNtr76cefUGfUXU58jQ98WCYOM7Iuawl8Xt+dCGnEAvWUxGMz8Qkz3k7+Zb7
         i8X6UVA95myXxMDFWRB1bWRw54pYrqPyhEJgoCsz/Hbg6fZp2+PBkaF8Y1pf14iF1VDI
         2wnAT7LGZNq/7DFOgFhvJcnV7GBFjCkiLiN/lXteTJQZXc2uY8dm4Ss7m9r2G6Pn8eNl
         91j8fbk7EpLWIWNs30Jh9ra7NVmBnm7kvGNs5I6EZKiC+5hFuEeHfyh2b5x/515MOi0f
         LTlw==
X-Gm-Message-State: AAQBX9fJS6X7TU6pkV/O/LMMl3IkvWQM6uzWqFrkju/LTVqyih0bouiS
	+ejt5TnTM+QpKThSJDDt5idlKQr0jzSSAJ4Ys2s=
X-Google-Smtp-Source: AKy350aTPKhEURErKvzC5tUu15uUXe3txxCHawCF48VkO2ZBI2xz2AV7K/6E6w8KpCtXd4vFAgJrwQ==
X-Received: by 2002:adf:fe83:0:b0:2ff:7311:6e74 with SMTP id l3-20020adffe83000000b002ff73116e74mr11502057wrr.26.1682423253790;
        Tue, 25 Apr 2023 04:47:33 -0700 (PDT)
Received: from [10.101.1.6] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n3-20020a7bcbc3000000b003f175b360e5sm14904856wmi.0.2023.04.25.04.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 04:47:33 -0700 (PDT)
Message-ID: <e69e5c5c-033b-e932-a64c-25c00837fc65@baylibre.com>
Date: Tue, 25 Apr 2023 13:47:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/4] arm64: dts: mediatek: mt8195: Assign dp-intf
 aliases
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230424112523.1436926-1-angelogioacchino.delregno@collabora.com>
 <20230424112523.1436926-3-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230424112523.1436926-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_044735_127850_C5042D2D 
X-CRM114-Status: UNSURE (   6.91  )
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

On 24/04/2023 13:25, AngeloGioacchino Del Regno wrote:
> Assign aliases for the primary and secondary dp-intf IP to properly
> and reliably enable DisplayPort functionality.
> 
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alexandre


