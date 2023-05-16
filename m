Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F66C77B7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 17:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2isPeHLFTut2+mOKdMyVDlP/q2NZewEWxVxxvIO/Yc=; b=uFEYPoN2JEZX2WP8Sf+UfYkuCE
	hmaTx8oMSurqtYKzXtY3sWElSEBL38178RBAPbD00PMfuDNgCIx0Ul+pnjeVVmfr5Hw78Msja44dq
	fKCvUjqI+mQdAWAdQZPS4svDKtQSsQ1I8sqZ8zQgfuY70SOGEd370TDZ1TYFTIwZHB8L9PrUJ5GAd
	fOvRa0ZB8bxcPbDsW8d5C870QhtND4A0JT8mEjqT2ico+5fdW8mrufHjbS8pNnHiwLvK29+GrrjJS
	wWJa+RZZXGkTOq1KSfVpEofVamftEMJgNRdralBiDiIQ8fy82+WtTj4u8s7UfsFPq9EfKTM5Bj992
	vPlznqPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyy2c-006Z1U-0u;
	Tue, 16 May 2023 17:00:50 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyy2X-006Yyk-1x
	for linux-mediatek@lists.infradead.org;
	Tue, 16 May 2023 17:00:48 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1ae4e264e03so298105ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 16 May 2023 10:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684256441; x=1686848441;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A2isPeHLFTut2+mOKdMyVDlP/q2NZewEWxVxxvIO/Yc=;
        b=eRKpjGAcT4ydGtuypR1jvNliTZGpV2leuaDZz83tI20QdbCsZ7qXlYJUXHwpqdpUTN
         6Qy2YUPnnA7AWrC+94F4nqBjrZ4kI8UjNKQHxif2A8NSP6GfdYx3gUsse5n/WdIqAPyA
         AnZQbtAdXEWZTmfJXrVtTd25lMZm1XQQ6Ff21a5A7IqpfcMntLfPDtJI/LtLiLCzCXHf
         BoXaKUGKWYpTpIgM/Tw25G4wh/mrwxeBQmxbZlbmQOoLVFWQfoSI10UGYfz5ukUD9K2m
         QFytZRFjh8VlGLdt314vkZlNBcBy013jMZtyX3IZpdnraSwkMPaIzA8ubz6xYuJZW12q
         /c7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684256441; x=1686848441;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2isPeHLFTut2+mOKdMyVDlP/q2NZewEWxVxxvIO/Yc=;
        b=PXFy77gkd2MZwSgxAqjR9oIPTK5FxMcSxOwZ4669qR51FyU1bDUuCIUaHlnPWZfrno
         MkPy0lWY1jmUYZCrLooyZYHnUQjWRF397VG/8Fz/6nLoq8VARHX/o5VMBDBN8c8e3iva
         G50CzDqNm88y/cI8u38+t7+lhGYPGbhUAy/Vrz3VAXxk35EdIT+IuupPT0mc/iZ19ePC
         bmYntqY1Vj169a9ivUn2PkVylhN1V5KB97XEh284GixmJM6jF51m3YGc4lXoj5CpBHqJ
         pNBwx3k+MiP1s7AuxEloOcINJ7Sbr0bUGEeE7Y0F8zPYStD504xUUOIW7jXT53GI6JKT
         Wg9w==
X-Gm-Message-State: AC+VfDwSBCuwrTtajN+1YOF6qEl6/ah3AWetdQsTPnO4oI42Xt+i7Au7
	kJ6/wfh/xLwRvv7Mqk/5CAPURw==
X-Google-Smtp-Source: ACHHUZ5Oj+Q36rLinLQtgeWgi/+xRXp4Qu5QFFdXKuJd7rG3YFE70e/wjN6HQkclYeSkPaxJbjPcqg==
X-Received: by 2002:a17:903:32cc:b0:1ad:cba5:5505 with SMTP id i12-20020a17090332cc00b001adcba55505mr26320003plr.14.1684256441196;
        Tue, 16 May 2023 10:00:41 -0700 (PDT)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm15716212plt.290.2023.05.16.10.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 10:00:39 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh@kernel.org,
 chunkuang.hu@kernel.org, linux-mediatek@lists.infradead.org, Florian
 Sylvestre <fsylvestre@baylibre.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Andy Hsieh <andy.hsieh@mediatek.com>, Vinod
 Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "moderated list:ARM/Mediatek
 USB3 PHY DRIVER" <linux-arm-kernel@lists.infradead.org>, "open
 list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: add mediatek mipi csi driver v
 0.5
In-Reply-To: <1853f049-4f00-b7f0-973a-2c4e7b0b2634@linaro.org>
References: <20230515090551.1251389-1-jstephan@baylibre.com>
 <20230515090551.1251389-2-jstephan@baylibre.com>
 <ab9aa30f-82d7-1d14-5561-e19ff10af0b0@linaro.org>
 <4yppinkucchwnwtnnpbqdn4bejmntjq3q6mx6es55f2pwyce3c@qdhdks47lpyt>
 <1853f049-4f00-b7f0-973a-2c4e7b0b2634@linaro.org>
Date: Tue, 16 May 2023 10:00:39 -0700
Message-ID: <7h353w2oug.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_100045_848786_34160276 
X-CRM114-Status: GOOD (  24.13  )
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

> On 16/05/2023 11:41, Julien Stephan wrote:
>> On Tue, May 16, 2023 at 10:07:47AM +0200, Krzysztof Kozlowski wrote:
>>> On 15/05/2023 11:05, Julien Stephan wrote:
>>>> From: Florian Sylvestre <fsylvestre@baylibre.com>
>>>>
>>>> This adds the bindings, for the MIPI CD-PHY module v 0.5 embedded in
>>>> some Mediatek soc, such as the mt8365
>>>>
>>>> Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
>>>> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
>>>
>>> What are the changes? IOW: changelog here or in cover letter.
>>>
>> Hi Krzysztof,
>> I added a changelog in the cover letter, but I will try to be more
>> descritpive next time. Changes from v1 are mainly style issues fixed
>> (mostly from your first review)
>
> What do you mean by "in cover letter"? There is no cover letter.

Julien, your cover letter[1] was sent to a a different list of
recipients than the patches, and most important for this thread, it was
*not* sent to the devictree list. So I'm guessing that's why Krzysztof
doesn't see it in his devicetree review queue.  Generally, you should
have the same list of recipients for the cover letter as the patches
since reviewers/maintainers generally filter mail based on which mailing
lists are in to/cc.

>> 
>>> Subject: you have some multiple spaces.
>>>
>>> Subject: drop driver. Bindings are not for drivers.
>>>
>>>> ---
>>>>  .../phy/mediatek,phy-mipi-csi-0-5.yaml        | 62 +++++++++++++++++++
>>>>  MAINTAINERS                                   |  6 ++
>>>>  2 files changed, 68 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml b/Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml
>>>> new file mode 100644
>>>> index 000000000000..5aa8c0b41cdf
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml
>>>> @@ -0,0 +1,62 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-Only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/phy/mediatek,phy-mipi-csi-0-5.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Mediatek Sensor Interface MIPI CSI CD-PHY
>>>> +
>>>> +maintainers:
>>>> +  - Julien Stephan <jstephan@baylibre.com>
>>>> +  - Andy Hsieh <andy.hsieh@mediatek.com>
>>>> +
>>>> +description:
>>>> +  The SENINF CD-PHY is a set of CD-PHY connected to the SENINF CSI-2
>>>> +  receivers. The number of PHYs depends on the SoC model.
>>>> +  Depending on the soc model, each PHYs can support CDPHY or DPHY only
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - mediatek,phy-mipi-csi-0-5
>>>
>>> SoC based compatibles. 0-5 is odd.
>>>
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  '#phy-cells':
>>>> +    const: 0
>>>> +
>>>> +  mediatek,is_cdphy:
>>>
>>> No underscores in node names.
>>>
>>>> +    description:
>>>> +      Specify if the current phy support CDPHY configuration
>>>
>>> Why this cannot be implied from compatible? Add specific compatibles.
>>>
>>>
>> This cannot be implied by compatible because the number of phys depends
>> on the soc and each phy can be either D-PHY only or CD-PHY capable.
>> For example mt8365 has 2 phy: CSI0 and CSI1. CSI1 is DPHY only and CSI0 is CD-PHY
>
> So it is SoC specific so why it cannot be implied by compatible? I don't
> understand. You will have SoC specific compatibles, right? or you just
> ignored my comments here?

Julien, I think you had SoC specific compatibles in an earlier version
but then changed it to be generic based on reviewer feedback.  However,
that earlier version of the driver was trying to do a bunch of SoC
specific logic internally and support multiple SoCs.  You've now greatly
simplified the driver, with only a few SoC specific decisions needed.
These can be implied by the driver based SoC specific compatible, as
Krzysztof suggests, so you should just go back to having SoC specific
compatibles.

Kevin

[1] https://lore.kernel.org/linux-mediatek/20230515090551.1251389-1-jstephan@baylibre.com/#r

