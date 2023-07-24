Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F23EC001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 17:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/1LJDLgyxtYwLLVQ7MqhyHlHTh4bPkUiDIcho+GZfM=; b=Nzpr5yoc1+u2EINU/CKRJcRaaz
	jW1zDMVRR5uHHiJPcpkG0U0LSQoRwiQFJRzXZ6gxDRlHjFE/+wV8TC2VXRoTbXGMEGNKsTIECZren
	6ISpmbdskWvuMEEQ7BeowO4SqLe2eaf+JT6DN/++mF/vDSfIblH6T4nZULUT8Une8cs7N+EiwS8kb
	XH8gzoLvM8KDXb5w/xL7Q6Lj7FYgqbB8AQ0lob/zdBUDd81kgs4ufz78BvJRk2OXkbGVC6Xgxe3Sa
	JZ23048pDZkSq7HgO/XLQJ9z1Eldy6TX6URurVoOfeUDSl5jbP+NsOVw4/1NhZYB5r3wt0EGkdOlJ
	bHF0CHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNz0F-004y5y-1H;
	Mon, 24 Jul 2023 17:05:47 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNz0C-004y4k-0d
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Jul 2023 17:05:45 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-992dcae74e0so770775766b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Jul 2023 10:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690218340; x=1690823140;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r/1LJDLgyxtYwLLVQ7MqhyHlHTh4bPkUiDIcho+GZfM=;
        b=oqaIWLHBsBokwzA8MU+vTILFZrNZ6gabOBrfMq5TqHeSuEGcOEG8pjJxJhmUcCmP2A
         RX+9KSZzq0KUfvi1SqYUjU4rqMKnHfAIpv00i5Z4VlDfx8qZJ74b/FVlZDIex9Zy4M7f
         bt7La3JPALRHslMF4UJNLDeC3p2mmD3XN9+c5l4lvvIG26LdD/pxyKBcxwGbiV7/ltwz
         VivBiO4h5xsYHke9MNNmaH4cBH+8SAohDxQ3JcBGSiUfKyYY/6E63fxUyrLpnP5gIlqx
         lS4/RGpo4UCYHxC4Ljczy7g+AI9odUzxdAILOVqY+2Y95pXeaTLBbHIKj6ElsdFoQN3k
         lZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690218340; x=1690823140;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/1LJDLgyxtYwLLVQ7MqhyHlHTh4bPkUiDIcho+GZfM=;
        b=UlqLwp+SeXdVRTVKQRbF3IOuFZdp81pxNFWU/nlHtEpZo9eHlTnBjomQJEfcr+FZFc
         IXpDYsHJs5qXGMSflVKzxDq43fLxFSaHAm8a80VDVmMs6u36f6LIVIjlb3YP6U02ty+K
         oVBX4Ow/g3dg+fu7MqIof5xpCsL9zQ7I/3szKhaTuEY4FEROr+vxS4HBer7w6iQy67nn
         ijp7kQEIw6Hnqm82Fnm4xjLTXFrbgs7AcG2vadhXE3puROC1+9FDRzYiOYVK1ihoqVai
         F1eqhuQVUV1/7PJVsOnGY88/yP9pgheR8CQIuNTnkUGKqm4MmetuD02yXpmYAwQllBZG
         8/Zg==
X-Gm-Message-State: ABy/qLbJJneuHNlymS3sh0pr19Yv63gZbbj9a346JYJJFQ2PiAE9FrCj
	/nwVV9vXAs62haqrR/odwbCfcA==
X-Google-Smtp-Source: APBJJlHwPcKTKIL8LVd0DfZgwQQ01hah+RbyGAamj9A4ipk0zwj2sUnqzG9iAqwMWQ1mO1hBmRf/Yw==
X-Received: by 2002:a17:907:2e0b:b0:96b:e93:3aa8 with SMTP id ig11-20020a1709072e0b00b0096b0e933aa8mr9577637ejc.21.1690218340090;
        Mon, 24 Jul 2023 10:05:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id qc12-20020a170906d8ac00b0098866a94f14sm6974227ejb.125.2023.07.24.10.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 10:05:24 -0700 (PDT)
Message-ID: <60e7e772-bf0a-264d-abac-4ed72766a2d0@linaro.org>
Date: Mon, 24 Jul 2023 19:05:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: usb: add missing unevaluatedProperties on
 USB connector
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jagan Sridharan <badhri@google.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Min Guo <min.guo@mediatek.com>, Gene Chen <gene_chen@richtek.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230723071105.40157-1-krzysztof.kozlowski@linaro.org>
 <20230724162638.GA3784203-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724162638.GA3784203-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_100544_242234_6C0C8B1B 
X-CRM114-Status: GOOD (  10.40  )
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

On 24/07/2023 18:26, Rob Herring wrote:
> On Sun, Jul 23, 2023 at 09:11:05AM +0200, Krzysztof Kozlowski wrote:
>> The usb-connector.yaml schema allows any additional properties, thus its
>> usage should finish with unevaluatedProperties: false.
> 
> Is it problematic if usb-connector.yaml is restricted?

Yes, a bit.
1. Missing reg/unit-address:
Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
I guess this could be easily solved.

2. phy-supply:
arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
(and more of armada)
This is a bit odd:

phy@18300 {
  compatible = "marvell,comphy-a3700";
  comphy0: phy@0 {}
  comphy1: phy@1 {}
  comphy2: phy@2 {
    connector {
      compatible = "usb-a-connector";
      phy-supply = <&exp_usb3_vbus>;
   };
};

I would assume that phy-supply should be a property of the phy.

Best regards,
Krzysztof


