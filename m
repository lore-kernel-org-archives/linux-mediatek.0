Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BCBC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 13:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9tu5kfLkLBgd8ubz/EUC+KagXbqcDn5HWzdWJeSb3Y=; b=Egz+oBFe3t5D8D594uYlKYul10
	b+JpOrQ6QHzQ5P4fQBHXPGK5eFT/9AopyxBVXeCSv8P4L1kW9cvPYAk5MawWd1msAK/PAfcZenIKb
	LPqcR/k15nAzBbvY1aVIuXthdpGnArEmL7iE07ofd03NhAxuFrRKQPNg5BdEFmkl1uMyh1Lr8e2c4
	3Np34LmmATJj8VeekRK8ybrS+abUZWlbkDuL6BWihXHeZwF7QPOtug+260awv5CyN90+dtUsGO2w7
	C2UClM5IOtZXmfoWEMrKwahhwfVHgS2/PPWlSHk12w6ZMdp3Xeu/rhLkEUDES/gHyUOmAlZD0t74p
	FVeEtbAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWOo-0079zB-Qp; Thu, 21 Jul 2022 13:39:30 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWJk-0075h1-Qt
	for linux-mediatek@lists.infradead.org; Thu, 21 Jul 2022 13:34:18 +0000
Received: by mail-wr1-x434.google.com with SMTP id k11so1850595wrx.5
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Jul 2022 06:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=m9tu5kfLkLBgd8ubz/EUC+KagXbqcDn5HWzdWJeSb3Y=;
        b=6v6Hu/g3Zo0GWLuMb/6idFPyuTqciNcRwGDVx+n8h2Rqq65ZCYzPnMS6hb3+hpO23F
         8wEH+HIznFFlGbx8xvFvRSSV6krJRDxtCTbvWGXiTuIsk5Ab0S1+Wu9UG0kbhA7RaGb5
         cea6QvDNyrFOH2+4jTRq53uq/wOo/xiG/PQA0q8jj8jDWiTqn4LTpinsH6p9meJUhpc/
         R+E17VM4zjcQvngCUXrU91UwkqlvtXEzfIHOVaDG5TS6XLvyhD5kbZ7v5t45lo1e107K
         utNwAJI1DYsHvrguolIH1iwujd59CZEAOjkrTNQE2zvhMVUs+FN8UeMrU1ebDv40k3Se
         v8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=m9tu5kfLkLBgd8ubz/EUC+KagXbqcDn5HWzdWJeSb3Y=;
        b=csYjufSSq/HTsZo321WoRJJEepmECIRhM8v+YbW2MtDpbm3TUdLxlv5JYOBWqC2nYP
         YADs3MGKEXuZ6CZATBhk6HHR+jFCJxeCFNNTaUPF15I9FxwpRJy68jgIzsXRT7d5mQ/T
         fK2I02udUcCVgiI08Hulw9F1WRd8YyIuIaTP+t0j5jIn99aAtoNt1HsJomH1BhZGknYS
         y24Pp2kBvMDufpU5qsvJOyY0bkwAkpL1oXQz0lLPW7EqgK8x84k1d3JjXlcJTlISDVAa
         vUf1GL6NZIys/O3NooImHG+7kb1pnSX8Yu8JIssulY0W9AlbQlQ/+SKYW5kG5VwkAFMP
         SZNA==
X-Gm-Message-State: AJIora9bcleBP7RB2ANK/84F8dy+/2neUWxNJ+er7L2V5UmNfwRDAUg8
	xr/epY0L2dFNYhKev4ujk5pCHw==
X-Google-Smtp-Source: AGRyM1vFMRoTO4e+uNQGZXhzHMNWPBJJ+oaO5moEg5utkAab7eiYnQAw585oYLpHYefDneVsptGijA==
X-Received: by 2002:a5d:6848:0:b0:21e:5e37:b2e4 with SMTP id o8-20020a5d6848000000b0021e5e37b2e4mr11612wrw.530.1658410452448;
        Thu, 21 Jul 2022 06:34:12 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id p10-20020adff20a000000b0021baf5e590dsm1907554wro.71.2022.07.21.06.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 06:34:12 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 3/6] dt-bindings: mediatek,mt6779-keypad: add
 mediatek,double-keys
In-Reply-To: <c5e94d12-4f52-2e75-3b45-735afa0e987b@collabora.com>
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-3-ef9fc29dbff4@baylibre.com>
 <c5e94d12-4f52-2e75-3b45-735afa0e987b@collabora.com>
Date: Thu, 21 Jul 2022 15:34:11 +0200
Message-ID: <87o7xih9nw.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_063416_910913_7C97AEEE 
X-CRM114-Status: GOOD (  14.52  )
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

On Thu, Jul 21, 2022 at 10:40, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> Il 20/07/22 16:48, Mattijs Korpershoek ha scritto:
>> MediaTek keypad has 2 modes of detecting key events:
>> - single key: each (row, column) can detect one key
>> - double key: each (row, column) is a group of 2 keys
>> 
>> Currently, only single key detection is supported (by default)
>> Add an optional property, mediatek,double-keys to support double
>> key detection.
>> 
>> Double key support exists to minimize cost, since it reduces the number
>> of pins required for physical keys.
>> 
>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>> 
>> diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
>> index ca8ae40a73f7..03c9555849e5 100644
>> --- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
>> +++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
>> @@ -49,6 +49,12 @@ properties:
>>       maximum: 256
>>       default: 16
>>   
>> +  mediatek,double-keys:
>> +    description: |
>> +      use double key matrix instead of single key
>> +      when set, each (row,column) is a group that can detect 2 keys
>
> We can make it shorter and (imo) easier to understand, like:
>
>    mediatek,double-keys:
>
>      description: Each (row, column) group has two keys
>
> ...also because, if we say that the group "can detect" two keys, it may be
> creating a misunderstandment such as "if I press one key, it gives me two
> different input events for two different keys.", which is something that
> wouldn't make a lot of sense, would it? :-)

Hi AngeloGioacchino,

Thank you for the suggestion. I like your description better as well :)
Will use it in v2.

>
>> +    type: boolean
>> +
>>   required:
>>     - compatible
>>     - reg

