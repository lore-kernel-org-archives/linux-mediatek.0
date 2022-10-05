Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80882C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 08:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Gd9tGdNqsQu4v63s2hpxh7QJ0rYIJUhnAhh++yKUyU=; b=Ov2R0jtkcuvPqJoJHabqeVJzuN
	Gk1TUd9dk8mfskfWae3gR2L1LoEzErD7vQvAnx9lCybhq/x/USgxaIK5LVjfn9Fvvm1RY2Kdi/27I
	LNQs6HY4Hh9ZgipQx/rrRqZ3GGv9pZjPjorEHWgaD8cAGMHn4aDoYUO9nolaPfSP9XvEHMO4D4lCC
	3l87AM3vKd5l2kNXKf1D8CiKLtFKCGevL/YcP80wTqaidtLJxxPGHIO9g+LjqOChuHTfnHe+woEhZ
	CqTdZ9sPvDZDk3gqepVYY2LT46zChp1SKmTX7KGLXX3E53zcPFWM1dEwx9hxkYBJRM/+TSe5snq6u
	ScdZv4Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofzYW-00CzbE-Dh; Wed, 05 Oct 2022 08:15:04 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofzYK-00CzWj-Jb; Wed, 05 Oct 2022 08:14:54 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id c2so2640904qvo.11;
        Wed, 05 Oct 2022 01:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=+Gd9tGdNqsQu4v63s2hpxh7QJ0rYIJUhnAhh++yKUyU=;
        b=nz8aIgUVQ9bMxKt7JGxC6J/vkRhz7fPSdw9D3wPw4Eyty9FUwR8JXuavRFNVucCiKE
         TvkIG0SC5lrbtA1wFAX07FZqZeJMyxKD7dUH7o/4kMBlTrZOvLxI7dX5p9GeuCEgwbty
         5DrHHlSXZz9G+9hX3sqHLmqywj0wB00HWOOpQElYKpNJ4o4oQ4xlm9Q2L/YMrbIneftw
         /0LKvsGUJDtEmeFZfgmd0+qOcr6CdtgwN+gGiRxixTzUts04Fh+ifyrBq+InDVSNbyBU
         d0LqVBsYCuo4cbjqrKCRad0fyc9JdRsr6HL23K0MkLDIiWNN+nXf/+cPftHLB2EsSpaN
         oT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=+Gd9tGdNqsQu4v63s2hpxh7QJ0rYIJUhnAhh++yKUyU=;
        b=jeSgySbNNL6mQfvwFIC+3p4iYT6zvOBtR9IINhWxg4HqQz7e4Ch8IhbjJs52LTEv+4
         UAvp1TeKwf6wG9qvsOM0TcHuwS42uRh2eXbuLzw0cuFlBUfjy282OXj3g8ieSjfQpRkv
         i9Kfsax3ESmIm7QRIfBiLKEyTaHpEtSMKa25XoYUyIb5XF9SHIu7zWm4C9c62Z5dQ9Y7
         v4dy9XRsAdrS/WixGxIm5Bt33n9YmFKUmTP4xTFvlZfeauEaFF0GYA5Dg0/cFYwvHbQs
         D0o28Kw8UcKdOHeWUSzPME8qFCecGMxcpAztj5jXMi2qLAUvLCbyadyFCr/f0ssJ8gQB
         S6Rg==
X-Gm-Message-State: ACrzQf3SBZbfmrTM3RVSczaJApjjRdvpJu4iTjjTeNePWfLzlu8fVqFY
	n3Ahn6+MC1juxPx5bhj2EDK/m24mpINqToXVOIo=
X-Google-Smtp-Source: AMsMyM5ezlbQ1FH5UHLUmLn/HN9FgfeoEXzJaPgrUC0h/t/FLSf1bn3m7sMEJJ/noJ2bk8gG/KAPF37ISl6R/oDHUns=
X-Received: by 2002:ad4:5be1:0:b0:496:a686:2bec with SMTP id
 k1-20020ad45be1000000b00496a6862becmr22549207qvc.85.1664957688045; Wed, 05
 Oct 2022 01:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <9dda705a8d67826306f6c6129722d3ad8edc96fc.1664816175.git.chiaen_wu@richtek.com>
 <CAL_Jsq+YeZRizJFYuU7RPTcFRe1cDjLgsTidisJ_P5PNC4eKiw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+YeZRizJFYuU7RPTcFRe1cDjLgsTidisJ_P5PNC4eKiw@mail.gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Wed, 5 Oct 2022 16:14:11 +0800
Message-ID: <CABtFH5Ld91S65RiDu4iSpFhAMiFWaQdj-yDRM79=WUkArpA0JA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mfd: mt6370: fix the interrupt order of
 the charger in the example
To: Rob Herring <robh+dt@kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, matthias.bgg@gmail.com, 
	sre@kernel.org, chiaen_wu@richtek.com, cy_huang@richtek.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_011452_684416_7C960289 
X-CRM114-Status: GOOD (  12.76  )
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

On Mon, Oct 3, 2022 at 11:34 PM Rob Herring <robh+dt@kernel.org> wrote:
>

...

>
> This doesn't fix all the warnings. These still remain:
>
> /home/rob/proj/linux-dt/.build-arm64/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:
> pmic@34: indicator: 'color' is a required property
>         From schema:
> /home/rob/proj/linux-dt/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> /home/rob/proj/linux-dt/.build-arm64/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:
> indicator: $nodename:0: 'indicator' does not match
> '^multi-led(@[0-9a-f])?$'
>         From schema:
> /home/rob/proj/linux-dt/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

Hi Rob,

In my opinion, the root cause of these warnings is the incorrect usage
of 'allOf' in our LED indicator dts as follows,
(https://lore.kernel.org/all/27df85c30277a171ae85ff6d5b7d867625765d0a.1663926551.git.chiaen_wu@richtek.com/)
----------
+allOf:
+  - $ref: leds-class-multicolor.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt6370-indicator
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^multi-led@[0-3]$":
+    type: object
----------

and this patch for Linux 6.0
(https://lore.kernel.org/all/20220624112106.111351-1-krzysztof.kozlowski@linaro.org/)

I will revise our LED indicator dts in the next version(v13) of
'MT6370 patch series' like this,
----------
// Remove 'allOf'

+properties:
+  compatible:
+    const: mediatek,mt6370-indicator
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^multi-led@[0-3]$":
+    type: object
+    $ref: leds-class-multicolor.yaml#          // Add this line
+    unevaluatedProperties: false               // Add this line
----------

And this '[PATCH v2] dt-bindings: mfd: mt6370: fix the interrupt order
of the charger in the example' patch is for fix charger example in MFD
dts.
Thank you so much.

-- 
Best Regards,
ChiaEn Wu

