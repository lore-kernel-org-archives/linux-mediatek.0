Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC55C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 10:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQjqWxPLHITGHyqkO6YA1j86gunAzOjonUjodcYsF20=; b=vFNqZruvLg8lzu
	qd6fJmfqriVWIZq1G3A9OvDsZ8EAfaRNWTdBQn4YCw59R37zGrbm+5VmzG2Y/iHJbu/PclUFkQ92h
	Qh3XrOwxoHbblzewOZ0oKNjGQHj1kMySzwmPh5ky1Wu5+j6dBItbdPbZxB6Trh5UktVfxbmGkw8My
	art5BBGd/el6vU0PiGxry5LiwBAV/swZzxysmbKMC2iMXah0KXHfYH45tcxV15JpWUQDmje/eAwOx
	tlUxaO5I/JX8QuoliwCEpJOhmonZvzKtSWc8h1/QGrYbdEnZLh7wrx+/I1b0GDqEBFX3lMVHtLcvX
	bkbBhGW9peeD5J9kq5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noNYk-001N7w-Aq; Tue, 10 May 2022 10:57:42 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noNYJ-001Myg-TN
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 10:57:18 +0000
Received: by mail-ed1-x52a.google.com with SMTP id a21so19522638edb.1
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 03:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hP5Qt4iyca+XwfT38e5QSOL60aC/HqAALnLY/TUKCos=;
 b=AEfURBdjsXwWF/lcnLtglije6dm0motmFUJ3sHf/KkiBswiXy9ufjlvwlDrR8WN4PL
 XMuEpKM07Pqu9NcReVRuZc3A+BIweN6yHXQr1S3nbr8pUlcuHYBz38kRdm64sycaSvXE
 OXg1rzHEXLqcL9QRpUYewLWV2+dKqOxqw1TLTEQmvpx43S2ZTDtTH6ky3U1jzkqcqGC8
 AcKmC8TZWXCmrP/cm6i9xBgI0MmH4YIDvYb11g3Pi26OkoxNETSWljjEqQL+GQRrHofK
 YlsS4Ju/BRl2euM7KPii2RrZs+NzRZf+Ogd1545zbmABGq5xffHTMxTib7OexD0VCOaC
 Nsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hP5Qt4iyca+XwfT38e5QSOL60aC/HqAALnLY/TUKCos=;
 b=1r7x4zYovsYcTDeyGcyfj56TBuv2GOCqAF3A2IeBsKOajz0Mz2YOzZGOmH7l2OjcU0
 CbOsNcPXlTaqeD6uzNJ+6iUNni1HIs1rXf5UEKYvttRBfZcwscKEpSNr9GGPQqDfVvI4
 uLnDF3nAT3zX/scqT4gfLL3fp9KL+I2ilNcmIId13lUqadH7G3eq/C5eiXUiuL1c1Vfr
 cyrQnKb+tETlFKvbYU9HQwSX2nlJ/2IcxpsEXz0dqcQbMLtl4XUYA4zFDnCAi5Ukw6TL
 P38emIz7agX/l5ogSbNhSdo+vdbBhzrvRSf66DymId+N6sdVmwc0WATOwSlA3T9/394s
 adLQ==
X-Gm-Message-State: AOAM531EA7gbRjc55Hd0MrZds9YWB/Z206Y2nroRndwWjdmsyclck2y+
 g7R25Oy+ipaVYvt+n6ef0w1s1A==
X-Google-Smtp-Source: ABdhPJwV2FoRMmaQQWsKESFLsiexggF0TXhfn9LN0RLxYk94n+1r1hcpoWyyOn26z4+WeOxzmE6bzA==
X-Received: by 2002:a05:6402:b2e:b0:425:d3f7:4c1a with SMTP id
 bo14-20020a0564020b2e00b00425d3f74c1amr21827716edb.366.1652180232182; 
 Tue, 10 May 2022 03:57:12 -0700 (PDT)
Received: from [192.168.0.251] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 t3-20020a05640203c300b00428aafb23d0sm1351992edw.57.2022.05.10.03.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 03:57:11 -0700 (PDT)
Message-ID: <0686125d-4984-5dcd-32ca-4eeece09d7c3@linaro.org>
Date: Tue, 10 May 2022 12:57:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-2-rex-bc.chen@mediatek.com>
 <a5c9e7ad-c4b5-e757-cd6d-f79de47d1ff3@linaro.org>
 <fbbbc7e6a951bdde648ddd896f1fa163dafa16f1.camel@mediatek.com>
 <1c3fd336-1450-9b68-df81-2f01cc2ba32f@linaro.org>
 <CAGXv+5EHFjqiVQbXgcJWCo+TmaTU_z4e0g85beMLCNjyx5qJcw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGXv+5EHFjqiVQbXgcJWCo+TmaTU_z4e0g85beMLCNjyx5qJcw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_035715_998848_1D0F9F08 
X-CRM114-Status: GOOD (  14.13  )
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

On 10/05/2022 12:37, Chen-Yu Tsai wrote:
>> Use a generic node name, as Devicetree spec asks:
>> "The name of a node should be somewhat generic, reflecting the function
>> of the device and not its precise programming
>>
>> model. If appropriate, the name should be one of the following choices:"
>>
>> I proposed dma-controller, but feel free to find better generic node name.
> 
> dma-controller is covered by dma-controller.yaml, which references
> dma-common.yaml in its entirety, so I don't think that would work.
> 
> What about "blitter"? I think that is a generic term that is/was commonly
> used with display hardware and sort of describes the function of the RDMA
> & WDMA blocks, and if only one side is memory and the other is the display
> pipeline.

Sure, sounds fine!


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
