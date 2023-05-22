Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B4FC77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 19:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yOtfK1pFQtCc71cFzgVKT6xOp98rRtV2rALJqQa+Fg=; b=ulTDxK+hhaXnqld1+HNA08OK1A
	KnECZ3nm6xw61ANAYac9vlK9jMsK3Ktlrdk7oFQdt7sPZlqt48W24DYHFdVk8cnKj1dD2m+VNgHTS
	TUFI2cOdp2JrjU/FpyUbc3/xVEvjQxpEcUd3dPoUzkQX3YA2xUrVqBGSOf+jRmF8to6kMzCgOAxZx
	RVPev/Ma5S0hXoDngci1ZAIUBpSAAmp+zog03wrqJBeBmoBP55/h2XTCxDQEHC7R6XLlSXgCu2Eeh
	8nu6exjOsuBgQErWXB4VriqKbznbu9zWVGpHnOhO5SgiAIZ2/9bY0i2tUq6+AAowi50a8SCqGjaqz
	0LMIMk/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1B0O-007eD8-3C;
	Mon, 22 May 2023 19:15:40 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1B0K-007eB3-1B
	for linux-mediatek@lists.infradead.org;
	Mon, 22 May 2023 19:15:39 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-64d15660784so3569655b3a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 22 May 2023 12:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684782933; x=1687374933;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+yOtfK1pFQtCc71cFzgVKT6xOp98rRtV2rALJqQa+Fg=;
        b=tzCG7+bIvrimmh9A79/cNNYbpqnrTvZ9KS7MzHN8Wwp9N/VNwyNHiWm9sfXmiJN+FZ
         2NAYs3kITqf86jDQ3tpi3vVo9R3izNAYncChMT8VoVmi6HPAkDIemARWEjqJubVudaVB
         1atrGX3hl/iXBUubxEcRJXz0FdWG1FKy510pwp3Xpz800d6nlmEUq405nJvUPJafdCLb
         /Re6eMA2CPNO3M6CKiek6H7kiLzIBPVhu0jT/VtcH4URW2lTu6qP2wWPpBwCM7yxB0nc
         7iIFFjrTuI1aN9UfKYRt4g6d8659Mn/ft8lHutS63ZrazzQpjQsxrgPANbJl/a3l5cVX
         5GBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684782933; x=1687374933;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+yOtfK1pFQtCc71cFzgVKT6xOp98rRtV2rALJqQa+Fg=;
        b=HT+p7iftLrjJUfSIkfg1RX3QrtXqUyA5Uz04nWakNs8gkqs5uZqtVo6KO1ruEPdsM0
         aWzmYKkfL3Wh+9SDjhOBFz7Cu3b4TswBc3MxxzTjiHYdq5WIoIiXM4y+aAc0G56mtiwq
         mxrOXsVA54ACrB+iXLb6T9TX1lW8DcNclpXoAIixM24R5yxRK8NFZ5oP98yYQrJXRba+
         Otz9VrJ2LckNsLhwJXA2JdAVykaBTfkqhNHpAYvkUUEGGgToOXMnWYNTcLW9dOjFdQWj
         mUJI4rK2C42heBPELyA3noNo37v+fg16yvJiNSUUeYjVy4ngCc2g9eeJreejcD6afd4h
         VMFA==
X-Gm-Message-State: AC+VfDzDX0AAT0ow5QuVwWWNBFMIjCpgXWTyMhETzNteMKgoBnb8nsXq
	kxfWLrc/RPMm4lso8rHbtHueJw==
X-Google-Smtp-Source: ACHHUZ52ZEECneLAS9tm/UNsmG0ECpBajQruy+F2ybktcTEo240DF7Ky6kbzndheezdG3NztN857vw==
X-Received: by 2002:a17:902:c407:b0:1ac:451d:34b with SMTP id k7-20020a170902c40700b001ac451d034bmr16613997plk.9.1684782932841;
        Mon, 22 May 2023 12:15:32 -0700 (PDT)
Received: from localhost ([75.172.135.98])
        by smtp.gmail.com with ESMTPSA id bj6-20020a170902850600b001a183ade911sm5205732plb.56.2023.05.22.12.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 12:15:32 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Julien Stephan
 <jstephan@baylibre.com>
Cc: robh@kernel.org, chunkuang.hu@kernel.org,
 linux-mediatek@lists.infradead.org, Florian Sylvestre
 <fsylvestre@baylibre.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Andy
 Hsieh <andy.hsieh@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "moderated list:ARM/Mediatek
 USB3 PHY DRIVER" <linux-arm-kernel@lists.infradead.org>, "open
 list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: add mediatek mipi csi driver v
 0.5
In-Reply-To: <c63ebd7e-8658-9cdd-4fc4-ade9c94dfa64@linaro.org>
References: <20230515090551.1251389-1-jstephan@baylibre.com>
 <20230515090551.1251389-2-jstephan@baylibre.com>
 <ab9aa30f-82d7-1d14-5561-e19ff10af0b0@linaro.org>
 <4yppinkucchwnwtnnpbqdn4bejmntjq3q6mx6es55f2pwyce3c@qdhdks47lpyt>
 <1853f049-4f00-b7f0-973a-2c4e7b0b2634@linaro.org>
 <7h353w2oug.fsf@baylibre.com>
 <fbf1b0a6-f45d-69a0-5de6-8269567e15b3@linaro.org>
 <7hwn18yndq.fsf@baylibre.com>
 <c63ebd7e-8658-9cdd-4fc4-ade9c94dfa64@linaro.org>
Date: Mon, 22 May 2023 12:15:31 -0700
Message-ID: <7hcz2snpnw.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_121536_427126_89D86099 
X-CRM114-Status: GOOD (  30.49  )
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

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> On 16/05/2023 23:31, Kevin Hilman wrote:
>
>>> Third is to use versioned IP blocks.
>>>
>>> The second case also would work, if it is applicable to you (you really
>>> have fallback matching all devices). Third solution depends on your
>>> versioning and Rob expressed dislike about it many times.
>>>
>>> We had many discussions on mailing lists, thus simplifying the review -
>>> I recommend the first choice. For a better recommendation you should say
>>> a bit more about the block in different SoCs.
>> 
>> I'll try to say a bit more about the PHY block, but in fact, it's not
>> just about differences between SoCs. On the same SoC, 2 different PHYs
>> may have different features/capabilities.
>> 
>> For example, on MT8365, There are 2 PHYs: CSI0 and CSI1.  CSI0 can
>> function as a C-PHY or a D-PHY, but CSI1 can only function as D-PHY
>> (used as the example in the binding patch[1].)  On another related SoC,
>> there are 3 PHYs, where CSI0 is C-D but CSI1 & CSI2 are only D.
>> 
>> So that's why it seems (at least to me) that while we need SoC
>> compatible, it's not enough.  We also need properties to describe
>> PHY-specific features (e.g. C-D PHY)
>
> I recall the same or very similar case... It bugs me now, but
> unfortunately I cannot find it.
>
>> 
>> Of course, we could rely only on SoC-specific compatibles describe this.
>> But then driver will need an SoC-specific table with the number of PHYs
>> and per-PHY features for each SoC encoded in the driver.  Since the
>> driver otherwise doesn't (and shouldn't, IMHO) need to know how many
>> PHYs are on each SoC, I suggested to Julien that perhaps the additional
>> propery was the better solution.
>
> Phys were modeled as separate device instances, so you would need
> difference in compatible to figure out which phy is it.
>
> Other way could be to create device for all phys and use phy-cells=1.
> Whether it makes sense, depends on the actual datasheet - maybe the
> split phy per device is artificial? There is one PHY block with two
> address ranges for each PHY - CSI0 and CSI1 - but it is actually one
> block? You should carefully check this because once design is chosen,
> you won't be able to go back to other and it might be a problem (e.g.
> there is some top-level block for powering on all CSI instances).

We're pretty sure these are multiple instances of the IP block as they
can operate completely independently. 

>> 
>> To me it seems redundant to have the driver encode PHYs-per-SoC info,
>> when the per-SoC DT is going to have the same info, so my suggestion was
>> to simplify the driver and have this kind of hardware description in the
>> DT, and keep the driver simple, but we are definitely open to learning
>> the "right way" of doing this.
>
> The property then is reasonable. It should not be bool, though, because
> it does not scale. There can be next block which supports only D-PHY on
> CSI0 and C-PHY on CSI1? Maybe some enum or list, depending on possible
> configurations.

OK, looks like include/dt-bindings/phy/phy.y already has

  #define PHY_TYPE_DPHY		10
  #define PHY_TYPE_CPHY		11

we'll add a PHY_TYPE_CDPHY and use that.   Sound reasonable?

Kevin

