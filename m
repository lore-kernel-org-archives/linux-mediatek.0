Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1FDC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 06:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F3K9DgUbde7iZLYXr7kwRy5FkE65MDSfWpdm8Le5lL0=; b=QkB5GssMfyjdDD
	HOE9utBGaNYNU956WQs9Hxnl4PjlCKQezLVwIfWnW/HvoxqdNt3dhaUM2lhnTpOeHM3eyrH6MTUAp
	mdQ5UOUscylP5TQl6XbTVMCj2X+um36LXyKLQq9ym2nXC37Irzc/8lulsQUdHrHezhKheWYVaySW7
	lwzN2bmk7LHl6Uiz8hMFAaLMNxKFaCsO4v0QIJ8sbkPk7Uf/4w1s/34P2KQxA9zzrseY/mG/+06t8
	quYn30ldJKnjjvf+YICrdBAnXwVO4kmIUBbIeaeKucTffjIZEEqrFJcEoeqoDCRwkA9Gc9lK3Ds2F
	ef6h5OZEGzBgJAL0mFoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncLxE-009l4N-B1; Thu, 07 Apr 2022 06:49:16 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncLx2-009l0M-IY
 for linux-mediatek@lists.infradead.org; Thu, 07 Apr 2022 06:49:05 +0000
Received: by mail-ej1-x62f.google.com with SMTP id r13so8808544ejd.5
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Apr 2022 23:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ig1etyDF68tf5y4+B0bKhTRY5wsKZ9GD0NtPhkq4h5I=;
 b=xrLUcHHwKuNTh4APSk1UhhZeFKYx5/K1fJIzae4MIT/Bg1RYnwCOSqstuf/ZYismFz
 3CE2yBy2HCiEUJAT/uhluRStnRmtIzabcvauHCUnncDJ8Tef7BPXRE24Slg8eoVuPEed
 Gjt/OGqI/n7/B0coJmgJrd9Sxx2WmltbunSffJZ7Avw2PXYdaqFgGx6F1GEcu7Rd9r+i
 Fw3vnDg6Ki+RhIKBcblCZ0hVP5wkbBQBAwZTDUoZVPnkzJZad9y/K6Q/zJlo6TuTbnoe
 lrCllXvX3vtSI0HhWwYw6WHEmtKRUglMA43DnsjdHGD2e2igUDPwa5MqXOMJ5ezBnman
 /JbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ig1etyDF68tf5y4+B0bKhTRY5wsKZ9GD0NtPhkq4h5I=;
 b=2gCvdxB9gyzUT4LVwZ5elEzvCAmQap3Q3r4o09P9Gp0xpipy8RceW2vUH0Y3nwFObn
 EzJufz6ZQBDwqDp66vVhdrlF6Mf+ov+NukOzkKx2sEFgETbM/yaomBvLU5of/wgMdMkQ
 CrZ2DbmcsplCvDEaQCPEU/Zcf05UhMOKlI7R3RelsiI9NNW00RNp1B0LCXG0WKlPml/B
 /AjLzI9Mv+kxCtB46ixAKACtdMxlLFE0g+ROvfT4xS20ON6n7fzWGp3WO2F95tNk1V5b
 25UYoRUS3jO3tmY0eDhVVhvytt0Zqsx+4/Gqfp6S3RkAX0G2zw3OqFGXOLLeiovJol59
 fA4w==
X-Gm-Message-State: AOAM531o5809lmKRZSb+/Fo20okzsHQxKuMjI5c+uHyoHBtgbKvyoicc
 /l9ziG+XCCrXhWjCQ4Re4HzQMQ==
X-Google-Smtp-Source: ABdhPJyI+a19I669vtBg9dpBsKeqt/6i1D7etaTUE8OFw7G4q33l4BRlM1qJgUjqaoH0PJSjKLZYdA==
X-Received: by 2002:a17:907:608d:b0:6e7:f1d1:ff42 with SMTP id
 ht13-20020a170907608d00b006e7f1d1ff42mr12405023ejc.620.1649314142185; 
 Wed, 06 Apr 2022 23:49:02 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 s10-20020a50daca000000b0041cc361b1c9sm5877690edj.68.2022.04.06.23.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 23:49:01 -0700 (PDT)
Message-ID: <594c124d-403f-56f1-b9fb-f48042d7056b@linaro.org>
Date: Thu, 7 Apr 2022 08:49:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8183
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de, airlied@linux.ie,
 yongqiang.niu@mediatek.com, jason-jh.lin@mediatek.com,
 nancy.lin@mediatek.com, allen-kh.cheng@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-2-rex-bc.chen@mediatek.com>
 <397e30c2-18c3-93d6-16f5-b113be77f51a@linaro.org>
 <c9a54f1c9350d63489a0f85443f5623fe5d7fe1d.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c9a54f1c9350d63489a0f85443f5623fe5d7fe1d.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_234904_637690_43E418CA 
X-CRM114-Status: GOOD (  17.07  )
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

On 07/04/2022 08:22, Rex-BC Chen wrote:
> On Wed, 2022-04-06 at 16:44 +0200, Krzysztof Kozlowski wrote:
>> On 06/04/2022 11:46, Rex-BC Chen wrote:
>>> The driver data of MT8183 and MT8173 are different.
>>> The value of has_gamma for MT8173 is true while the value of MT8183
>>> is
>>> false. Therefore, the compatible of disp_aal for MT8183 is not
>>> suitable
>>> for the compatible for MT8173.
>>
>> Just because one feature is not supported, it does not mean they are
>> incompatible, which you claim in the patch below. Are you sure they
>> are
>> really incompatible and MT8173 fallback cannot be used?
>>
>>
>> Best regards,
>> Krzysztof
> 
> Hello Krzysztof,
> 
> Thanks for your review.
> 
> The difference of disp_aal for each MediaTek SoCs is "has_gamma".
> And we only control this variable for different MediaTek SoCs.
> 
> The value of has_gamma for MT8173 is true.
> The value of has_gamma for MT8183 is false. (Moreover, the driver data
> is null for MT8183)
> 
> From this situation, I think it's not compatible between MT8173 and
> MT8183.

You repeated the commit msg without bringing any new information... but
let it be, I assume setting gamma on MTT8183 is incorrect or produces
wrong results.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
