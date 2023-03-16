Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4474DC6FD19
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 11:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfGhbI5w3WuDswJbCQtfkPCMptbW1heMaZynDig3b6o=; b=Masd6Y4r7rKUqxiFvroU7t4VZx
	TfD5YKbfZwmdFBbUwjCdvTBLFzjU7Rh8m8vDAkfjLksDi/YlPA4HR3cTOACJC0gRGCc1+U0TJ2/NI
	l8+N4vSePkKY2ZvKPH7cIHxDX+OlRUTF3x/dJhD9nKNMQ5KrSVDAP8NUSTSwR4VFpppogNkhvCFCb
	v8vSA/R8aM50JZlxddBafjLfIYBUD4JiS4i3BlOOqM9C2h59rzHlqyGPcRr/VQkkxfRtTt/h8ylRD
	CG+0eYrs+afDVdPujK2FPUALWzwbqr1A5J9JlVHnHnPvk9oa80ouJNkZ38flXVZ0TZqjwsCfbcrZ1
	6tRTiRRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcluw-00GGCn-0v;
	Thu, 16 Mar 2023 11:37:10 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pclur-00GG81-1Y
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Mar 2023 11:37:07 +0000
Received: by mail-ed1-x529.google.com with SMTP id eh3so6240222edb.11
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Mar 2023 04:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678966619;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AfGhbI5w3WuDswJbCQtfkPCMptbW1heMaZynDig3b6o=;
        b=WdZEAyLcSkyP3jHiliNzzURVyP5bg0AhOJ/n1KD+xejldEkacpeekFFOUFx+zld37q
         U9EEZKk6uTvjNmm3UZZSpWL2MlXnABLnKMcCOdnPawFhuhCC3VMOuegNF1qvL6zd9WgM
         V507GkNiQG30Fj5zDyS0pi8sdPl1/sBVbh14SQGRObgzt6vNOd+8zSrqqi4sGKTuuPXC
         TTVujg0DzKVp4ZIAjD/8lFnLO+i8MHz/q/sl3QRwK002rNkmNRflt1cK5NEOLpUMlgkR
         POjrdhmPwHciq4cFWboHsEjP6oZ1SqATu6+yc9l5zY2xKj6TZ3Q7o+RkI0RAfcNjN4I8
         l8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678966619;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AfGhbI5w3WuDswJbCQtfkPCMptbW1heMaZynDig3b6o=;
        b=mJQpDBXGyKy+e9MgD73u2JFjQZ/4MUafYqn1KLPjoNKAHDNxKcFS/YtBXrtkHXbQm4
         B8ExvchyUTmEB8ZwYjYMFsmgljHlCx86odo2WUIzYsY13e0EVaKaQJORmZ2K8fjJeFx4
         i2PQHTeH73ZIK25zUrwRm4dUaWBad8GU5pBYnDmd8VVlsaRArUhxx2ULkdCi1WEBAzCB
         BmOLmiy1lZmUzcs2DCXLC6I5IJMsOvgvDiCgLRQvsOcIBAF8Xqc3dyIMOoyQ53yoYNn0
         UrFDe0c3ZbcWfn2W+cRnAk8llQyhCHp76ybus0QFmYR4z6evpj67Jd4UodeBDp+0At3s
         VxWg==
X-Gm-Message-State: AO0yUKV0luTprPBJiPkpP73xTMiAdpDESJAY3t6CZecsmyPm/iS+2v1E
	2rJBY50D1JpJ/dS9jD5+M81gtw==
X-Google-Smtp-Source: AK7set80wKzIShLBKFRFwgznGN61cTEyjNtx9HtLBiDrk9zBalX963QlSRikXu3lp1lrDTbm0tt4Fg==
X-Received: by 2002:a05:6402:418:b0:4fc:52c0:df10 with SMTP id q24-20020a056402041800b004fc52c0df10mr6125485edv.26.1678966619655;
        Thu, 16 Mar 2023 04:36:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id si2-20020a170906cec200b008e68d2c11d8sm3728845ejb.218.2023.03.16.04.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 04:36:59 -0700 (PDT)
Message-ID: <0ebf187d-972e-4228-d8a0-8c0ce02f642d@linaro.org>
Date: Thu, 16 Mar 2023 12:36:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v29 1/7] dt-bindings: mediatek: add ethdr definition for
 mt8195
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?=
 <ck.hu@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>
References: <20221227081011.6426-1-nancy.lin@mediatek.com>
 <20221227081011.6426-2-nancy.lin@mediatek.com>
 <4aff6a7a3b606f26ec793192d9c75774276935e0.camel@mediatek.com>
 <2700bd6c-f00d-fa99-b730-2fcdf89089fa@linaro.org>
 <1d65e8b2de708db18b5f7a0faaa53834e1002d9f.camel@mediatek.com>
 <b04eb48e-c9aa-0404-33ec-bef623b8282f@linaro.org>
 <e5ceec9e-d51b-2aeb-1db7-b79b151bd44c@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e5ceec9e-d51b-2aeb-1db7-b79b151bd44c@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_043705_542056_D33997EE 
X-CRM114-Status: GOOD (  13.45  )
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

On 16/03/2023 10:53, AngeloGioacchino Del Regno wrote:

> Hello Krzysztof, Nancy,
> 
> Since this series has reached v29, can we please reach an agreement on the bindings
> to use here, so that we can get this finally upstreamed?
> 
> I will put some examples to try to get this issue resolved.
> 
> ### Example 1: Constrain the number of GCE entries to *seven* array elements (7x4!)
> 
>    mediatek,gce-client-reg:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      maxItems: 1
>      description: The register of display function block to be set by gce.
>        There are 4 arguments in this property, gce node, subsys id, offset and
>        register size. The subsys id is defined in the gce header of each chips
>        include/dt-bindings/gce/<chip>-gce.h, mapping to the register of display
>        function block.
>      items:
>        minItems: 28
>        maxItems: 28
>        items:                     <----- this block doesn't seem to get checked :\
>          - description: phandle of GCE
>          - description: GCE subsys id
>          - description: register offset
>          - description: register size

This is what we would like to have but it requires exception in
dtschema. Thus:

> 
> 
> ### Example 2: Don't care about constraining the number of arguments
> 
>    mediatek,gce-client-reg:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      maxItems: 1
>      description: The register of display function block to be set by gce.
>        There are 4 arguments in this property, gce node, subsys id, offset and
>        register size. The subsys id is defined in the gce header of each chips
>        include/dt-bindings/gce/<chip>-gce.h, mapping to the register of display
>        function block.

use this.

Best regards,
Krzysztof


