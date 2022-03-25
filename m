Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1156DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 17:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlqVO3miLgYDKiKxmbe/sFoIghgqQ0XMgKksaxYijGE=; b=U/mmypnFPnmWD+
	f1XDgzKYwdMoQj8OqxwCw/qSL2TDDfz5OuuzR1h6w4kMX7wRsW2l03wDk5ZcR6soY8LCmwj+rYWKT
	jUkS7rbLEJcZCKG0mIHBtQ8uneUeeQIMN2V71hKmSo1pDDS2lQtkEMt4TicNTT20AE/DTOJEFYpkG
	UZ9MrI3606dygfDPqXmndwXfdyISbrcbLIFVdrowNQDhEhYa3MMG/9elDEGWf8AJsi9pLVZ68LvxY
	npjyzMnYwvBg2rzsmqmMl/hbDRE0qYHDj7ARGGU3kpi2tVmda+lCc8I+B/fnBgv1zV2YuY7CwrDs/
	mdbPFv7ScRLhfIwcxqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXo0l-002ulo-Fa; Fri, 25 Mar 2022 17:46:07 +0000
Received: from mail-ej1-f53.google.com ([209.85.218.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXo0i-002ujY-BS; Fri, 25 Mar 2022 17:46:05 +0000
Received: by mail-ej1-f53.google.com with SMTP id o10so16850401ejd.1;
 Fri, 25 Mar 2022 10:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T3ZMNixaLJElkzcw1+eEB0m28rN9ABVv9LlORr52Gis=;
 b=M1EZHBDAao/nfOr1qxUHNx484vRqgg44DW79T7PYQryl3T0bowXQOXqXrliAsfBH+f
 msFiSvRUzLYUrsZblEMgFTSLwFPyh/sge0nPyAtlymhYy8S96U0nnltNVttvjqjqS3Sn
 lRmzbITpf6vs0Cx1CblWuuoVyZV3wGgKC/sgmDWTpoo1DLd4C8r/Eb1tMRo8wyx9dQAL
 B7vXWc8cNdZ61MUfxPHGd3/ULxC7FDUDX2YGDsPweiQNrWKeX1bi47NznroOr6RE8Kjk
 wOX74l+hadJnpOamUg1eLuhLNQgA+8BDIChwsYCbqdVt4NyC05QOy08V16NnE3dmEyq+
 eOhw==
X-Gm-Message-State: AOAM533lN3ilC1fIGvMRH8mNZlIMJKCYVg/jHnTIPP4cJ/Ob9AYjL4YU
 zbnRiQW5QT7XUlO/n0En1HU=
X-Google-Smtp-Source: ABdhPJxzhvYxQoq+OEFG3ywwQ643UpdmE/aW2fDwOBXfrMtLACv55jBSXSPboOkX/8x59n4J/6WaDQ==
X-Received: by 2002:a17:907:2dac:b0:6db:e1e8:c66f with SMTP id
 gt44-20020a1709072dac00b006dbe1e8c66fmr12992334ejc.382.1648230362374; 
 Fri, 25 Mar 2022 10:46:02 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 bd12-20020a056402206c00b00418c9bf71cbsm3079365edb.68.2022.03.25.10.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 10:46:01 -0700 (PDT)
Message-ID: <5f864d33-3370-7a1b-d796-908ff49d3e3b@kernel.org>
Date: Fri, 25 Mar 2022 18:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/22] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 angelogioacchino.delregno@collabora.com, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org, markyacoub@google.com,
 Markus Schneider-Pargmann <msp@baylibre.com>, Rob Herring <robh@kernel.org>
References: <20220325171511.23493-1-granquet@baylibre.com>
 <20220325171511.23493-2-granquet@baylibre.com>
 <8baedbe6-eb60-02b4-a6b8-fe3abc566335@kernel.org>
 <CABnWg9s3vmpCFFai_BMjagqHehk2vbP0ST_tfWvOxmtubPm14g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <CABnWg9s3vmpCFFai_BMjagqHehk2vbP0ST_tfWvOxmtubPm14g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_104604_462924_F92643C9 
X-CRM114-Status: GOOD (  13.16  )
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

On 25/03/2022 18:43, Guillaume Ranquet wrote:
> On Fri, 25 Mar 2022 18:31, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On 25/03/2022 18:14, Guillaume Ranquet wrote:
>>> From: Markus Schneider-Pargmann <msp@baylibre.com>
>>>
>>> DP_INTF is similar to DPI but does not have the exact same feature set
>>> or register layouts.
>>>
>>> DP_INTF is the sink of the display pipeline that is connected to the
>>> DisplayPort controller and encoder unit. It takes the same clocks as
>>> DPI.
>>>
>>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
>> This is v1, how did you get Rob's review already?
>>
> 
> Because this is not v1... I'm not really good at this... 

Don't worry, I made many more mistakes...

> this is actually v9...
> I just didn't pay attention enough before sending the series.
> 
> What's the standard thing to do? resend with the proper versionning?

Yes, please resend as v1 with cover-letter containing changelog. Anyway
someone might scream that you spam his box (immediate resends are also
not welcomed), but what to do. :)


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
