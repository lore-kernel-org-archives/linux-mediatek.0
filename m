Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0507C48BE0
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 09:48:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D5C8613D0
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 09:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D5C8613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RP9MXTZGhhkW8u51Jj49vqg5cP9XodEF65jdM/68ox8=; b=yh1hsHYwBPvVNmejdlyrs4WjVD
	tEfoeJ4dXufxjfNL8UiqatA5KRElwQ9vOp4J9PtkQAw2U0Z2JblCcI2SZW+MNMe3sylWxdMVxjPnb
	RALxlFMNc87aRiTVcwXdVWegw4byhhuKQEUZHwUy2COEFfPHDZMAKjX43vTTMOSMo1p/ZFnBqH1Cc
	9XPHDZNHHRg+ehx/R5BpyYOfvwVeIvaiFykA3Gb7IXjlbEUBuRkWuTWQ5jk2js9foraMi8u1Mb931
	iREM7zh/GYx45C4taFIg+zfZgLcSW8Z3pW2GtTTzPv257mUrxSFW4wI8UfWo/YhCUwgGWoSJqw5Jm
	ev8rxYJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrdmI-004axj-KM; Fri, 11 Jun 2021 09:48:38 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrdmF-004aut-LE; Fri, 11 Jun 2021 09:48:37 +0000
Received: by mail-wm1-x333.google.com with SMTP id d184so7769772wmd.0;
 Fri, 11 Jun 2021 02:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7ObfSjunS2lqcu+qmz5f/+ME5Q9V/oV3SAiNhGet7h0=;
 b=ClRCy2c0ol1tBDtfW5RGO5sESybQqKJgcKnfy8A2Py/6VY67/NwXULxLLMBifRExwS
 ntroCvu6XNQlu4XJn4tdwlZEQibGveP0GIcF1zwC0Hd/EF4B9yPBdIewIb6KiHM9hQNb
 9OV6wZE44HMN1/Z+sZFFJwt57YeVDk/MvgBvDnPXqCX6kaM3lyBn1a2T4Zv/0GP9G2ze
 lOe5iGnCZG6xFx9kafVbE/9FYJN29esHDg6lLVJEioVWGMBQppyV160ZH068BzPlgfvr
 lg+83qjJq697jJS4ht7RTr2wZo1Z2KWbQqbSz516lS2ABz06tStNlb6BqoxENNL/T8cZ
 NqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7ObfSjunS2lqcu+qmz5f/+ME5Q9V/oV3SAiNhGet7h0=;
 b=OpiCJj1NloSE7U4Ecfw1HABHRFoh4940O+oe9i9DrDtAIVFdN6SoZYVHp2hzx5+5aE
 q7GeK65mFAbjBurnVtfK8CE3qoAOazjgPxi7D00KO/w+wUuZw6t+1yvUAvui7TY/Et6c
 LNc9WymLcEZPNmA4rKFnulTdpXPZax0TnOORvwrj4KjIEP8Zk9UCA8/HZ9hqmRABDWAV
 jMrOaM9DaCwL8dUaiPpi3SmIvr522NU7prjL1SpNh86LMDLA2RiVtfBDHVqEbj6SLJNL
 z+w6zKDs9HcPk4GBzmYXyFdsk3j2jJWDG2HTjwsqxX5qh90Ti7v6Dlz1owcYQ17GYl4K
 tQTw==
X-Gm-Message-State: AOAM530juEykPWXDz66P6ZkQu7e2C3OQ4G0BnoUACwEz5IBckzZJclkc
 DU8etrif+4jAykxBpq9QR1Y=
X-Google-Smtp-Source: ABdhPJzcgh43AweTQqlpG4DsIlO93zwseDZqvtC3I1XN2r+uEIw3ceMUybZE1nde+hE5GmM70BNbgw==
X-Received: by 2002:a05:600c:22d9:: with SMTP id
 25mr19855564wmg.152.1623404912991; 
 Fri, 11 Jun 2021 02:48:32 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id 89sm6799095wrq.14.2021.06.11.02.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 02:48:32 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] dt-bindings: mediatek: convert mtk jpeg
 decoder/encoder to yaml
To: Hsin-Yi Wang <hsinyi@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, yong.wu@mediatek.com
References: <20210611092357.2930310-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b8c3433d-8860-38bc-27f0-877f05e9e0a7@gmail.com>
Date: Fri, 11 Jun 2021 11:48:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210611092357.2930310-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_024835_768036_E29B7C0F 
X-CRM114-Status: GOOD (  14.93  )
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



On 11/06/2021 11:23, Hsin-Yi Wang wrote:
> Convert mediatek jpeg decoder and encoder bindings to yaml.>
[...]
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> new file mode 100644
> index 0000000000000..e4e791d76cdaa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek JPEG Encoder Device Tree Bindings
> +
> +maintainers:
> +  - Xia Jiang <xia.jiang@mediatek.com>
> +
> +description: |-
> +  MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt2701-jpgenc
> +          - mediatek,mt8183-jpgenc

Commit message talks about conversion. Sorry for nit-picking, but I think the
new compatible should get a new patch. If you add changes to a file while
converting/moving it, it get's really hard to find that change later on.

Regards,
Matthias


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
