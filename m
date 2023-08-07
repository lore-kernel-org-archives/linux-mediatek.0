Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59B5C001DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Aug 2023 06:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30W1zdBmETkyXWkWaDUid9up8ZT6wPkzIdNcTDnK3pk=; b=za2xobZQxCKwz2QIpGc8e7QSfL
	Ukr4Jr5VB2NZa4LJ1OiozCJO/0ILfbTmzD9rGG5uQG32CVEINlztA8wZwDTreTNONMZ5keTZUdq0p
	h+6cS/noIiDJK3Bfouu80+tFuJ86ljPjhzc30WLz/qpZFcuipbOd2MnbLJUnCYZyUFE5Lf7sQCLWn
	VcYNJfZBoBRtHaL+epPskixC3i7gCcprbvmsPSb61VNwNpF091ejF3iWrXF8a8ExIBe1N+DnRzN+7
	g1AeNvfjjeWqjaIDILjLK6sBxkXedO8NUxgjSAhyqLq64UKfD20+3vRPk2Q60dcNUJm8+EFFq5/lJ
	gw7ROSwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qStrg-00GHKR-03;
	Mon, 07 Aug 2023 06:37:16 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qStrc-00GHJK-2p
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Aug 2023 06:37:14 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5222c5d71b8so5775002a12.2
        for <linux-mediatek@lists.infradead.org>; Sun, 06 Aug 2023 23:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691390220; x=1691995020;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=30W1zdBmETkyXWkWaDUid9up8ZT6wPkzIdNcTDnK3pk=;
        b=mgLuV22coTdq7+o6lIsl9a8OScBnl9AOir7rb+tc5mEeGXg+Us1ePBiQ4cG0GvH35U
         NlFkRk4Pv17Cq9Vdls1E3oeaESuJ6tQXTd0OSGzsZdSuF7b/BAHN9CXzkY+m8Tw32Udm
         foDshWzor2s55MsqGzZqitomqSvyJyhvNW1LIEzDtyuC3gF8GLhKFOFuV1Ku+YwCcsYT
         AG5TbOgBr2jH+9x79q+pSDthnu9qqAKEj+ia+XzbVfFnCPYaYKOmCKx9xDwgnmkitf6E
         v4RTPROr9bbPHEeuuHIoEb7cwy+7W3JhFX9KZeA8q7eHf5fJ7xhWbY2BnejiHtuUmmPd
         9+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691390220; x=1691995020;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=30W1zdBmETkyXWkWaDUid9up8ZT6wPkzIdNcTDnK3pk=;
        b=a8J2frJ6b+l2h/ghqoFT8GIlRZtW0WEHKyibVSk4SqPeN5q1+pnUiuxRzlWYRqiJsr
         OfIx2GqQL+O6vJJA0gTogDrQhi92o5f4zU27w+DX5TPdKuLooK7DeSS04U+0Ux6FkrHP
         v40g9eJeGvcqvRCN33iT1ColUtnHBQw7UtTq2KBcpkyxbYVV2gnYlBMO8HA8frjyeSI0
         1+mWlp9AvWs8qQi7YunAdf1bfVteYwNRb7asxe2X43XSzBhy5li3+WvQDh2YKgVe9wH3
         ee/CHqTB0h+cXEsBUPOPUYuRydLZpKuK+SE8GgsjGYOYZxEOdGaiUXI4U/x+Ha8jJ265
         xFMA==
X-Gm-Message-State: AOJu0YzAB2PksajO8NIQ+NHmFjejj7k9Em9tk/d1mlOgfZb0P+drQ1IF
	sG8qNDfir/VC+zT9zUAvYLKS0A==
X-Google-Smtp-Source: AGHT+IGH6tPkeAOx5ATPlagL1cpzHldL3hmthfO/OFgujaf+sCL5ZkvBRVDjNTN0aKiV74FNSyh3uw==
X-Received: by 2002:a17:907:2cce:b0:99c:6312:73ca with SMTP id hg14-20020a1709072cce00b0099c631273camr7151896ejc.71.1691390220605;
        Sun, 06 Aug 2023 23:37:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id lt1-20020a170906fa8100b009934707378fsm4707446ejb.87.2023.08.06.23.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Aug 2023 23:37:00 -0700 (PDT)
Message-ID: <95cf4d1d-a697-c42c-e904-1cbb58ec9878@linaro.org>
Date: Mon, 7 Aug 2023 08:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 4/9] regulator: dt-bindings: mediatek: Add MT6366 PMIC
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Brown <broonie@kernel.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230803074249.3065586-1-wenst@chromium.org>
 <20230803074249.3065586-5-wenst@chromium.org>
 <6bf91ced-076f-ecc1-f626-f531f7d991bd@linaro.org>
 <CAGXv+5HkKQ79k8T7LbowpHLCLHDvyxKrOZn=PePyrPREdpT1sg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGXv+5HkKQ79k8T7LbowpHLCLHDvyxKrOZn=PePyrPREdpT1sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_233712_913574_5C1D6600 
X-CRM114-Status: GOOD (  16.55  )
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

On 07/08/2023 08:30, Chen-Yu Tsai wrote:
> On Mon, Aug 7, 2023 at 2:23 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 03/08/2023 09:42, Chen-Yu Tsai wrote:
>>> From: Zhiyong Tao <zhiyong.tao@mediatek.com>
>>>
>>> The MediaTek MT6366 PMIC is similar to the MT6358 PMIC. It is designed
>>> to be paired with the MediaTek MT8186 SoC. It has 9 buck regulators and
>>> 29 LDO regulators, not counting ones that feed internally and basically
>>> have no controls. The regulators are named after their intended usage
>>> for the SoC and system design, thus not named generically as ldoX or
>>> dcdcX, but as vcn33 or vgpu.
>>>
>>> Add a binding document describing all the regulators and their supplies.
>>>
>>> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
>>> [wens@chromium.org: major rework and added commit message]
>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>> ---
>>> Changes since Zhiyong's last version (v4) [1]:
>>> - simplified regulator names
>>> - added descriptions to regulators
>>> - removed bogus regulators (*_sshub)
>>> - merged vcn33-wifi and vcn33-bt as vcn33
>>> - added missing regulators (vm18, vmddr, vsram-core)
>>> - cut down examples to a handful of cases and made them complete
>>> - expanded commit message a lot
>>>
>>> [1] https://lore.kernel.org/linux-arm-kernel/20220823123745.14061-1-zhiyong.tao@mediatek.com/
>>>
>>>  .../regulator/mediatek,mt6366-regulator.yaml  | 154 ++++++++++++++++++
>>>  1 file changed, 154 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml
>>> new file mode 100644
>>> index 000000000000..715c6ffcb3ab
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml
>>> @@ -0,0 +1,154 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6366-regulator.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MT6366 Regulator from MediaTek Integrated
>>> +
>>> +maintainers:
>>> +  - Zhiyong Tao <zhiyong.tao@mediatek.com>
>>> +
>>> +description: |
>>> +  Regulator part of the MT6366 PMIC. This node should be under the PMIC's
>>> +  device node.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: mediatek,mt6366-regulator
>>> +
>>> +  vsys_ldo1-supply:
>>
>> Don't use underscores in property names. Only hyphens, if needed.
> 
> I assume that applies even if the actual name in the datasheet has
> underscores?

Yes. We follow this already in other bindings. Hardware people can use
any names or characters in the datasheet, e.g. "*".


Best regards,
Krzysztof


