Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FACC76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 14:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MYkMU1LTnOHVMP6HjNeFG2DRZjRa3eGm53fnJdgbc8=; b=v5UMI/RPJOIL9TeOG/L2ZC0A0x
	lxVq6mu04u9p+0Bli9fgyGSx4Quh0LYhRqeD7dKx+h4/34UdwSNKEXoaEEArhB+L3+/ePxOxx28Yo
	6/CGp8b6S/SVqPAK1NvwRY2G1pfsdXnduSHh0uzP8Nn7JDLOZfFGofWeQGGBT3glEsJG2Zsgq9o+7
	s6vpi7gsCZDSbXNo7/UMvLAuGpEy4OQWAPR5hIWfYfPt1/OOR4qqDWYfiRM4UySPcdik5bvgOx2m2
	oE25KXNxgc4/ZLuF8s2PohA5IYyFe071moENTvJqMqbdPNpbYcnJIj8UPHA5i/WrKEH4MloICSgbk
	ozGZkG1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjLZp-00FhNi-37;
	Mon, 03 Apr 2023 14:54:33 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjLZn-00FhM6-0q
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Apr 2023 14:54:32 +0000
Received: by mail-ed1-x52e.google.com with SMTP id x3so118361238edb.10
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Apr 2023 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680533666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4MYkMU1LTnOHVMP6HjNeFG2DRZjRa3eGm53fnJdgbc8=;
        b=aHG4EQpPrwwrZ0xsU+6h+jgYLslKOOi5f0J6zlC90kyvgE9UTdn4Q0F7pOHcdeXnW7
         ugGgxYwmhjEZKPhmZd/z6Og12wPvcP59GUXr9yluSvir/y4ynYPSdxiTWLo9lAIn8wIO
         FHOuwq4hdWcrWbLElbUspEy5TTrdRXtL9PLOEnLnHnIFHowf3o9aOP531Cf4r+3JLIh1
         3PkHDWQ+5nfm9SFo6Tm/sArpNSaVlKYiClE6W1G06KPvrhigzsAi3xwCat18zMHB3zIH
         w3TYqVRGHPAx2r0pok5PyZYjGyCotgek0g/FAtKB8rdPuQIGJJsYmsEKuistr/NT/475
         8gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680533666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4MYkMU1LTnOHVMP6HjNeFG2DRZjRa3eGm53fnJdgbc8=;
        b=coLzJxW30v19DBo2lvfZBmiUJipkx7G1zdZBWkWQYPNN/5SyTb8M7rarOv/QpgKR2i
         PK29Ao10AgL5V2e4WHSmfQt/PlIHQ0Xp6/11KbXcUpDFkKUIvoZe/rPG3pHFlbl1Dh+L
         fnB9R0tsgbgPkBnuI8SIcdg9EoSKCCvivRXXWTL9Zw7HXaLSAOnF1Xhh7NIcPkc9bhSh
         KX6kn70L/mviEFXbtsp8dH7LbXWxunnBH8BWreVFAbmb2F18aWeYmRrr3uNW1GK6p1Nv
         fIcR6zBCZXbRPOPnycSDc4DcVVkuoLUHJxFneo3ArWZrSfp0zebH40spuRRQrDe2LDAz
         YG5Q==
X-Gm-Message-State: AAQBX9fqJbeitOgudB9HIEcisGMRS0TjcQ4ufPbayEY9alj8BqIhy+j0
	Uo9QkytFhP4gARXekFT7X2VX0A==
X-Google-Smtp-Source: AKy350bzC7zhyZol87P/h8Ao3cd9jxB9eNaY5b8cDld4A3nvsptLofinA2tasgAr9kVP46T3v1lsvQ==
X-Received: by 2002:a17:906:b303:b0:933:48ce:73a5 with SMTP id n3-20020a170906b30300b0093348ce73a5mr33462885ejz.56.1680533665843;
        Mon, 03 Apr 2023 07:54:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id q20-20020a50cc94000000b004bd6e3ed196sm4736781edi.86.2023.04.03.07.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 07:54:25 -0700 (PDT)
Message-ID: <6cd130bc-955a-9537-6a1a-301a38aac53f@linaro.org>
Date: Mon, 3 Apr 2023 16:54:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: phy: add mtk-mipi-csi driver
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
Cc: Florian Sylvestre <fsylvestre@baylibre.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-mediatek@lists.infradead.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20230403071929.360911-1-jstephan@baylibre.com>
 <20230403071929.360911-2-jstephan@baylibre.com>
 <4837c3e0-60ed-601b-8512-30fda2176619@linaro.org>
 <CAEHHSvYJrCZop8OvTjsLJjr5HHSrG8dsSQ+K_W2cjdKJ4xfodA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAEHHSvYJrCZop8OvTjsLJjr5HHSrG8dsSQ+K_W2cjdKJ4xfodA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_075431_332544_E21AF1C9 
X-CRM114-Status: GOOD (  15.06  )
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

On 03/04/2023 16:40, Julien Stephan wrote:
> Hi Krzysztof,
> 
> Le lun. 3 avr. 2023 à 11:49, Krzysztof Kozlowski <
> krzysztof.kozlowski@linaro.org> a écrit :
> 
>> On 03/04/2023 09:19, Julien Stephan wrote:
>>> From: Florian Sylvestre <fsylvestre@baylibre.com>
>>>
>>
>> There is no commit msg.
>>
>>> Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
>>> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
>>> ---
>>>  .../bindings/phy/mediatek,csi-phy.yaml        | 41 +++++++++++++++++++
>>>  MAINTAINERS                                   |  6 +++
>>>  2 files changed, 47 insertions(+)
>>>  create mode 100644
>> Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
>> b/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
>>> new file mode 100644
>>> index 000000000000..c026e43f35fd
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
>>
>> Filename like compatible.
>>
> Should I rename the binding  file
> Documentation/devicetree/bindings/phy/mediatek,mt8365-mipi-csi.yaml or

This.

> should I rename the compatible string mediatek,csi-phy?
> The csi PHY module is a module of the mt8365 soc and can possibly be used
> on other mediatek soc.  I think this binding is generic enough to have a
> generic name, what do you think?

You did not allow adding new variants, as you made it const, not enum.
If there are other devices with this phy, they could be even added now.
Bindings should be rather complete.


Best regards,
Krzysztof


