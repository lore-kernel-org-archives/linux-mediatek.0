Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1365C43334
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Jun 2022 11:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yp4bmUkucrfn0YoCb3947aiyNMhaiNjLfndCRiuztxU=; b=qMsxFcKiy3cYPz0kAc5dRw0SlC
	mNqP0BS/CjUF1yTQozCdKj+goTPyoNHhGHkBP4btWraQsLFMfs8u7W/SksDtenvqRzTFV5N+paolw
	YawLOwEOSecw9tCXyCOKefsDX/RSDHfjf+vAeI8BzXytro8vjy+ZubzYxZvshtUSBIwNx5YmiEVdg
	a/fPLsRaraj8NjHsw1ckpgGZ4g3i0TYLNJqwtT1spz+siEU1wD1KMeXot2Z3mArbGyFQYFO8sALnN
	3rU1F6vfND5Ncc9P22XTagR6tAMyPHnKiJH5SBuL8TDMr0RUkaMrJSDHWbd4K3G/uVbemF1dFNOhI
	Ixyyfe7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2tR2-00E4gl-6a; Sun, 19 Jun 2022 11:49:44 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2tQS-00E4Px-Ej
	for linux-mediatek@lists.infradead.org; Sun, 19 Jun 2022 11:49:10 +0000
Received: by mail-ed1-x533.google.com with SMTP id o9so2328631edt.12
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Jun 2022 04:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Yp4bmUkucrfn0YoCb3947aiyNMhaiNjLfndCRiuztxU=;
        b=yr+bG3jG4+68iQNvAiVbY3Z1gBJqsRvJGx5qiy0JF4mCyAGs2+gQW+U/llayv2QvZa
         JObgwL6nY/In7vN0HgMJyKOHcXvcqtzdmIISyxAbBNQcLPd/7bs5WSSXoP1BF4CC0oSj
         cOA/+WUR3Mjc/ZGuFAcYgKsUk8uEOUyOsnHY2Kdcj/KV2McZ7G5VwDWc+oYaFweytQiE
         3DWEEJAHPlikXDtlaqwLSmEuovXWj4PGrR2gjXnxInhsq+/pVhYHn++AcQqqzmdENG9M
         mGqPzpp9dyG8QRwIRiVCBK/yzkGrKuwNwcUEZGSzbCoak4I6gm0aJOkIY6vumz7Ed2+i
         k4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Yp4bmUkucrfn0YoCb3947aiyNMhaiNjLfndCRiuztxU=;
        b=0vciKCJUOJQN+tz/nnzDDpNDtiWd60rj7LfWPeX+8xYjWLjFmNHZZm5tCDolUE9Wp/
         jdgCFltW2UjuRL6TFB/6TF+HvSp3IQn8xPgvCrJ5EgxXuZ/VzH4eSuPKuRBVWJmwHROV
         Kt5As+qD1R6MD7S84vQvyVKuMAyLrEPwNBWMxiVXq2beZIXKDXGs36+ZjVl/kcLsHoXg
         QNq0qasr37HiNEC4DSFmmPKI+3Muew86NbGFJxlwVLfwzGm/wUWi2KzZCrbq9RJAjAIw
         7AuRAW2mYGWn6MbXdHGHn1uChXyEyVank/s2mAFHbC374N/pdOulTGPFZ3LxlKHL3/Tl
         qoCg==
X-Gm-Message-State: AJIora+aLD8ZMFF4DtOgbGSg1Yg94N/8JM3Nhy4PLIEv4exkrI6HJ9lj
	xf2+GZ8MXVB/uw/8LCnORds/iw==
X-Google-Smtp-Source: AGRyM1uf/0HgCvqeSezyCxo06xRPdiDZsKSIjIh9ayuMCVtMgx1owUBRCkmcqmcT3JXy2reZyX/UXQ==
X-Received: by 2002:aa7:cb13:0:b0:433:4985:1b54 with SMTP id s19-20020aa7cb13000000b0043349851b54mr22955689edt.182.1655639346743;
        Sun, 19 Jun 2022 04:49:06 -0700 (PDT)
Received: from [192.168.0.206] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id fd18-20020a056402389200b0043570d96d25sm2987288edb.95.2022.06.19.04.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 04:49:06 -0700 (PDT)
Message-ID: <5c7a1763-01fb-249d-a301-9164e2139ac6@linaro.org>
Date: Sun, 19 Jun 2022 13:49:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] dt-bindings: usb: mtk-xhci: Allow middle optional
 clocks to be missing
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-usb@vger.kernel.org
References: <20220617222916.2435618-1-nfraprado@collabora.com>
 <20220617222916.2435618-3-nfraprado@collabora.com>
 <d95e046262751a7f746fabc5f1d9a39e675730b3.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d95e046262751a7f746fabc5f1d9a39e675730b3.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_044908_542109_D239CC75 
X-CRM114-Status: GOOD (  13.50  )
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

On 19/06/2022 09:40, Chunfeng Yun wrote:
> On Fri, 2022-06-17 at 18:29 -0400, Nícolas F. R. A. Prado wrote:
>> The current clock list in the binding doesn't allow for one of the
>> optional clocks to be missing and a subsequent clock to be present.
>> An
>> example where this is an issue is in mt8192.dtsi, which has "sys_ck",
>> "ref_ck", "xhci_ck" and would cause dtbs_check warnings.
> How about using fixed clock instead to fix the check warning?
> Using enum way seems make it more complex.
> 

That would mean the clock is not actually optional. The DTS should
reflect the hardware so either you have the clock there or not. Either
it is an input or not. Of course there are some exceptions (like
non-controllable clock or regulator which not always has to be modeled).

Best regards,
Krzysztof

