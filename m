Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C59C7EE22
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 May 2023 19:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6BHb4xVvMEfgN+9lRCelTqOTmzUYyfbAtctnb7HRBw=; b=J0rgoJicLeRA+ujB74ZuR79EmD
	/qnRWkfECVmjA1YvZBDNNsdIgSjHYsg1te6ox/RfVKsdIfuPZljPUAGHIJXE2ZbKT6M/p231CuXHi
	Ji6yHTLxYiFTl5SyycPjj0j4Mf7eD8ohVPa+gqVnDEV2n/9YtT8y+fpgQwhXOfAnNip4H8HcIbrLD
	WDbVNHUJhj8XQ1sqE78WxwAlHLATlM3Mho4vAoI2DBdw7BNNfQQg2JNLG363ePv9PZbYuz/wg/zjO
	C1Agf3qNAftgcAdQ7lgUQgBTi4Svvcu/u2x9tXNnSECEOGvQkHOc+gV+RngUQflJD/rbwHhxK0ncR
	BfljPYiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6jX-001Dd4-0q;
	Mon, 08 May 2023 19:41:19 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6jQ-001DbD-0W
	for linux-mediatek@lists.infradead.org;
	Mon, 08 May 2023 19:41:17 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50bc25f0c7dso9371927a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 08 May 2023 12:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683574868; x=1686166868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u6BHb4xVvMEfgN+9lRCelTqOTmzUYyfbAtctnb7HRBw=;
        b=CfsYd66/CQThuWNpAvqHi/MJfVOwNKqnCWFXJeAFfvAiraDwp4Jt5CBun22SMkPabl
         9dRNgNtAykAZuiW4gwbmcz0e/3iJjD34SxhtPshsDAwcYo2rxXe+GO9jALW/IXMeZz+B
         V1AfCxlclLF2SoyC3fQhoHmw9Ec5a0eya/S4PsSIVCb/RT7/e3U7hmpT4F8TvcsHqO40
         AsN+FQg9ezOn1IuuyjmcIx4QvNomc33QMqJ4D/Ucu6d8vRpfLfeulS8ZhB/sbhAwuQLT
         ik2Pzqjuxk7wSTwjyd9TMfq2D/iIPV/kFTKBU0uixzx6PGM6trE/eWWYfdHTjnsqnfhl
         hEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683574868; x=1686166868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u6BHb4xVvMEfgN+9lRCelTqOTmzUYyfbAtctnb7HRBw=;
        b=aFpPTyVx/BSjGmyn6qkwvqLubHjMAcJQCuHCf0HDgJYLmW9EWbz+wGpgkVKTH594JD
         A9DSYvLNqerfnxcsIlzweggN9cghJC2K+xQ2eZJ+xI9Q/QRahy0NCcAqOVl9ilOAunrc
         xPBCjL36KKGtXT6gtpYelyD6AW+Nyc1HBnQydZfGeIfb3km7F3bpTHXEsT0LFe5e1FqT
         jD8LstF6oXin2z/u4cL5AZM5AjULUoQ3MCI8bbOcLYAPOHsofXXJVB2uoI1vYWBzppOv
         0r4XvvNJMNUv2sAe49e0b1sGcNIWhuoJ2bhQVFEnwwwv+V5QiX9C50zZdV9zyoI75kUg
         wP2Q==
X-Gm-Message-State: AC+VfDxiANPVLq5Ct1lM8XaMLn4ngBWhghFrvpNKsyp0kVFZo1pYbLZn
	EhRXCPyOoxdqyVUvwIhhEDckRA==
X-Google-Smtp-Source: ACHHUZ4UJvRAHo3YeIqDhqkX6D0qV+reh/JVVWha2vJ3gODEWTvlXChgbwidS5lcWcdtIEGMboCujA==
X-Received: by 2002:a17:907:7b91:b0:969:bac4:8e22 with SMTP id ne17-20020a1709077b9100b00969bac48e22mr785771ejc.26.1683574868376;
        Mon, 08 May 2023 12:41:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d19b:4e0f:cfe4:a1ac? ([2a02:810d:15c0:828:d19b:4e0f:cfe4:a1ac])
        by smtp.gmail.com with ESMTPSA id la26-20020a170906ad9a00b00967a18df1easm352509ejb.117.2023.05.08.12.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 12:41:07 -0700 (PDT)
Message-ID: <5cf04ce7-c60a-51c8-c835-58f24e7c8759@linaro.org>
Date: Mon, 8 May 2023 21:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dt-bindings: mt76: support pointing to EEPROM using NVMEM
 cell
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Christian Marangi <ansuelsmth@gmail.com>
References: <20230508155820.9963-1-zajec5@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508155820.9963-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_124112_232859_039B94A0 
X-CRM114-Status: UNSURE (   8.95  )
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

On 08/05/2023 17:58, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> All kind of calibration data should be described as NVMEM cells of NVMEM
> devices. That is more generic solution than "mediatek,mtd-eeprom" which
> is MTD specific.
> 
> Add support for EEPROM NVMEM cells and deprecate existing MTD-based
> property.
> 
> Cc: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


