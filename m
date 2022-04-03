Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B3AC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Apr 2022 15:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8DRSCicqK2m+ev1QjOTwMWEJZQs7Q31wbRGrBEx+LC8=; b=q6vw96R80Wcac5
	geMejFjhlXo6+UqwZvKS1L6Dh2Hzg2P/lBloYeocZuXRwytGegUDWIW6rWmfBL0cL1aEXSOutsgNR
	IGRiVc+WWncPSMRszNkc44mVdf2PIAKFSyICbPEhU53oWxdXmPPiosjF/6ptY4fLCFFQfvMb/uCsw
	yF4LVmReQoL+xo9YJP35up+Kbv8YrqvksiMrkEJiVVnC7NT1qrq9w1Z3ETPzxlRhnena9efFvhxvX
	wBQUYkbRf92YGlUzD4ur8fWt1t+7OgwdtnTSyeHFjgfzhRFJ3pYqMDAog7Z67MRoe4BbzUFo1R0jx
	BAujmGYzJ6n6ybkqHKWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nb2JL-00Big3-NF; Sun, 03 Apr 2022 15:38:39 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb2JI-00BieB-Ox
 for linux-mediatek@lists.infradead.org; Sun, 03 Apr 2022 15:38:38 +0000
Received: by mail-wr1-x433.google.com with SMTP id j12so3344694wrb.5
 for <linux-mediatek@lists.infradead.org>; Sun, 03 Apr 2022 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sEXxi1oey9g2W1h5KyCkUsYbDt35qHocHgmTe1tpXso=;
 b=JcpLNe9/pudDEVRHxP+QM8uFpur6LRnLKIvN74+hO6fHL1sIymSzFuSaQyxNjmwYv2
 s08Q71x4QJOW7Nh/1LbUf3OIY+3t8DFVw3/w/m14RKBsVEjJ8N737SMA2WP2SfEVwxyZ
 PtGiXUoDTa+sVdEwFlcPzAYunvHinNAb1BuxiifJ/b3ac3Lsunq+Nn/6a661aRBmNlRw
 N/7oCshyxl+lICX2Tf3oMNRyPrdhwhKCzAOmpahP1FkeCt+QwPTz0gJzgNnMXsS9XUX/
 0w6UuhpvnLqRjGUYqWZebaQs7UBuhnEB0uCU0WAmpuwMVW6WYOc1qY9Wrjb2WbFz069y
 A/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sEXxi1oey9g2W1h5KyCkUsYbDt35qHocHgmTe1tpXso=;
 b=6udM7oXb5/yMLnp7yvCGe5XJsYnKBhotf8/zYQb5B/IkyPiWrkObFjvLZvR9o8VFgY
 fB7UEFVcWz3JXu6b1p5oZo8C/3Vsf4AZvQVG/O+yXiGmy1/t7w6Ha+uQLBiYP50t+1mu
 B4pMOnOxC9uo0aVp+H+Fq4KUquAehcjS0/XZXraZOkdHNTfDcqKvm3DAVc002IdhlXBI
 EvcJ5amWuIq8Du17WaNJWKPfegOc97CCT1KMabO+rFiLFaAJw2BxkaLCa1nqUrzQevM2
 m9x9KQie1ctpcydyI74SAtGoOOLURzPrJznKM/tB5HX9o++seNw1WnZ95utktdB0Icob
 fL/w==
X-Gm-Message-State: AOAM533PX9Jtm5BrLhW16nXCsvgUiyP9FKJe8euiC2cMCQWghiW/lSTp
 irev/HuNM1BDmrv4njH/vwZE1Q==
X-Google-Smtp-Source: ABdhPJzjTyPm0Buqxb9GeLrcApRwPGIC65Z+MHoPlQL+zDOwSv6J3ZSmjdbYZuXDAfLM93+fdC300w==
X-Received: by 2002:a5d:64c4:0:b0:206:10a0:4034 with SMTP id
 f4-20020a5d64c4000000b0020610a04034mr1155255wri.104.1649000315078; 
 Sun, 03 Apr 2022 08:38:35 -0700 (PDT)
Received: from [192.168.0.172] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c35c400b0038cbd8c41e9sm14788866wmq.12.2022.04.03.08.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Apr 2022 08:38:34 -0700 (PDT)
Message-ID: <d2815bca-22c2-691c-1fc0-07fe87a401f2@linaro.org>
Date: Sun, 3 Apr 2022 17:38:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH resend 3/4] dt-bindings: spi: add binding doc for
 spi-mtk-snfi
Content-Language: en-US
To: Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>, Florian Fainelli
 <f.fainelli@gmail.com>, Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, Pratyush Yadav <p.yadav@ti.com>,
 Yu Kuai <yukuai3@huawei.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
References: <20220403131453.1269229-1-gch981213@gmail.com>
 <20220403131453.1269229-4-gch981213@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220403131453.1269229-4-gch981213@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_083836_858249_88685EE2 
X-CRM114-Status: UNSURE (   7.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 03/04/2022 15:14, Chuanhong Guo wrote:
> Add device-tree binding documentation for Mediatek SPI-NAND Flash
> Interface.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

I responded to you first version.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
