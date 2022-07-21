Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8412EC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 14:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69ydrAd7VD8ZV4ehf6ZQSkrk7cQZ4KVAcumhEU9GOBE=; b=q3zhSNCe8pO4qb/20KNCsVN5m8
	3oTo6nmD34r40SCoKzLBcxrzLF2FHYUOlziUqZB2UQkPFyKXvSmwO2UAdRpKd1rUG/qO5LjkUUkUg
	Or91Njh0Q6pTYY1FKFkoexUrkkhY/pfhb5etmNZKJ1NML1ggWNBreR/U6cnTF8FpGgoaMUparrFp2
	gM1GzgJJAj3IL9JsRxwtmTGzDKVkeovq0L/Wq4wSVLHM6JUnn69HTjDkscecRlHoTtnipSalRiAnS
	UcsdAfUUg6+fkNawpdS/KUNjNsOeQFLBQS/fCNPyk4IAy5/Ogu9Owsw0Z9K5+ek13Kykv3xpE8pGV
	CRq5Fxxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXQB-008E44-Va; Thu, 21 Jul 2022 14:44:59 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXQ4-008Du9-Na
	for linux-mediatek@lists.infradead.org; Thu, 21 Jul 2022 14:44:55 +0000
Received: by mail-wm1-x335.google.com with SMTP id j29-20020a05600c1c1d00b003a2fdafdefbso953904wms.2
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Jul 2022 07:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=69ydrAd7VD8ZV4ehf6ZQSkrk7cQZ4KVAcumhEU9GOBE=;
        b=v+MSWv3jsuhPI8MOrhpQCczuRCOsBsbkyML0eXqiPfXL1c8SQRwrl4yQQYq6h+Zam0
         xSRmSe3ZbCPYN7P/HLDJ2fMiaq2UBwwQqlOubSlVHT9rN/KVzWxsa/GPsoRd+uPIz8wV
         HIiMZxMugV/fCIU+0ech1hvyhSu+VBIVeFcRPVs210S3C9woW82mB/fty0K/pQGcb2o3
         RAFlIm0Clw0x1no/YbVYyrpEXoguSUqmL2bYGDY5FDQ7PwZWG8AgoPEuZD6CXIO+YvHK
         ajKUjSCbPFu65iu5kH3o/5/LZoBwHuUZNUIiwlNmRtXAoBvN38r2hpiNq2bVyACs7Ktt
         DENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=69ydrAd7VD8ZV4ehf6ZQSkrk7cQZ4KVAcumhEU9GOBE=;
        b=o43QGc7naixAIIQouPGT0X6TnndzvvpOZu1jJZFWnNs3hKB/tDUq4O9wjJG249egAr
         BPk+MplXmIrZkWgPOqjU/enuID1uHxpZ+vIhjGX4p/MvtT/JT4YMuo3T1ma8gk0McN6r
         paL1heENpevfCimQTWKIFrT/DsXDPh2mXPHW59l2FaO+Znb6peW8O5RFoAAI0PF0lFGr
         JvPxQjNXVl8bFsnO/+lTmrf/exZEtCIEaolBSxoEEqrc+zBd/YsKPbCkYl+cPCXJKFBc
         wxNNV4K+Zm+w6mmb/2DcCiRcESTdOsSDtKMctN/Y4dUjQq62RBfcboRpejyniNccmfDz
         036A==
X-Gm-Message-State: AJIora9LEB1prSDJ3ZV1CtHXLpi7IFd33741JfyBENY76uZSFpbAKS5g
	uVmjmct8XLNPs/Mpvt1WIuxqYQ==
X-Google-Smtp-Source: AGRyM1vwqk4YBhefti806ymMWo/noKrgKxFoOV3SpxLphHfrmlFn4YIv+GbcmjvPfqI9ywaKHcoKqQ==
X-Received: by 2002:a1c:f313:0:b0:3a3:1117:282d with SMTP id q19-20020a1cf313000000b003a31117282dmr8809289wmq.40.1658414690178;
        Thu, 21 Jul 2022 07:44:50 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id d12-20020adf9c8c000000b0021e1a801e30sm2149297wre.22.2022.07.21.07.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 07:44:49 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 3/6] dt-bindings: mediatek,mt6779-keypad: add
 mediatek,double-keys
In-Reply-To: <4084d7e6-e722-a4a7-1a34-c50983f7d93a@linaro.org>
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-3-ef9fc29dbff4@baylibre.com>
 <98ec7967-d007-46d7-ef54-aa41426b5f9f@linaro.org>
 <87r12eh9qe.fsf@baylibre.com>
 <4084d7e6-e722-a4a7-1a34-c50983f7d93a@linaro.org>
Date: Thu, 21 Jul 2022 16:44:48 +0200
Message-ID: <87lesmh6e7.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_074453_015320_D078CF61 
X-CRM114-Status: UNSURE (   9.60  )
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

On Thu, Jul 21, 2022 at 15:51, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 21/07/2022 15:32, Mattijs Korpershoek wrote:
>>>> diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
>>>> index ca8ae40a73f7..03c9555849e5 100644
>>>> --- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
>>>> +++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
>>>> @@ -49,6 +49,12 @@ properties:
>>>>      maximum: 256
>>>>      default: 16
>>>>  
>>>> +  mediatek,double-keys:
>>>
>>> Do you think there could be another MT keypad version with triple-keys?
>> 
>> Of all the SoC's i've worked on (MT8167, MT8183, MT8365, MT8195) I've
>> never seen a "triple-keys" keypad.
>
> OK, but the binding you create now would be poor if MT comes with such
> tripe-key feature later...

ACK, I'll send a v2 to transform this into a uint32 property named
mediatek,keys-per-group

Thanks,
Mattijs

>
>
> Best regards,
> Krzysztof

