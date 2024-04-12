Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BF3C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 11:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZWeBFh7QACCuutiiPpJmVZ9uLRO6+K6nohTcAyDGFE=; b=4p1WtanC2kPT3bem9CdN3v3Ob+
	GZkvjHuNg4j3deaDGmnrxO1Hzf2iITccF/o2ciErdHOH3/dzmxyvDevJjQa2Oai7F78on5z5YyrQW
	YQfSVzbrCtFcAtSbDsdnUAgra+6yPgLGOAh8YsYRfPpKNfttLj8iGcpoTqUWYjul/AG9OXdDTdLwt
	SgPDF5h+SV8hQzViSax9KcmDjynX5Ifv2f2X6hSzrgffcp3KJss8KgDrEXE4Mp5YeLgIaWZ2vqqzs
	Wlmy70WogSsLWv2H8urrCTam7PB2SDMrWKxMpbVaLTZYYNenBjifVGn1icasYIJT/+xtNQQ+4BdHR
	CDL9B0hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvEi0-0000000Gq8J-16iV;
	Fri, 12 Apr 2024 11:04:40 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvEhw-0000000Gq6R-1Hb5
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Apr 2024 11:04:39 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a51a7dc45easo77294666b.2
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Apr 2024 04:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712919872; x=1713524672; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZWeBFh7QACCuutiiPpJmVZ9uLRO6+K6nohTcAyDGFE=;
        b=egAaYXw+0mYHTxtmm8bzDNSgb7tLMHB/iFZmV3J9ekzMUB7SegO6UC83VWOntYnjoZ
         2MDWNts395T3AFuFXuMNTVI6sbciWqPUaCK2gcxcKA7BEpXihyjYfCIGoSrUmW3Og73y
         K5fEspUDTnwfkBfYWi6/3d10pqinOJWGed/BPzWx+nFXjAoGyr3vey/XBgzCApt8bANj
         B2YfgTTTJ/D7YN+2t59BF1mc3BGKicmorDAFW7eAm714sU6C1TjsW0Ujn1FjCe+Ob0mG
         sA+iY5iWh7FyhTam/J6QouCfAyPI+mXCZIKmLOdWd7nWU7Zpywvfzl7YTo2QkPeEBcyW
         QYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712919872; x=1713524672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZWeBFh7QACCuutiiPpJmVZ9uLRO6+K6nohTcAyDGFE=;
        b=k+gmwU/8Y/tJdi1FvThlC4jwusnfC4bpNQWQSCufKb/YeIdXFrQZQq8PZ/JNo6VbdT
         Sgdu0ld4R5DAJE+yM0oVXE4g0cTi9Rs0o3gIYEGPLoK0Dq4EXnGiYKwJrXqxfQ4K4G+R
         WM8+QaJF1hPYa/XHvUb3yLqmcVbVUHPJw0ttPIwG8pQTYZ73/oT2/4qYhnMXPbmwUrCG
         JDNgAjDIHzVD11ezI3vI6qxO61nM/jgkQzzbQSqn2sGDioUqpbNwFFyKB8SWoLy77t7K
         aovcD2DrOMqx4u4nQuxpkaHqok7ZsdepxSVn+G2SKCFUrMzrfkYsmBrkX8QjlJsDYgWd
         nhtw==
X-Forwarded-Encrypted: i=1; AJvYcCWhArtsoyt9WEkgqhB4N3XPXlG5XjKZBuy9Ak5YWngJcFT+vM9e26WMZezFmNSioLpIMCKELH/qNsQPN8BHJKUdzhNxlu3NFwujskX7sv2JcVc8
X-Gm-Message-State: AOJu0YwUi9soSNdRe6p31QoManToLEUBXuWhnytOrhFYDC4dvcIUlrLe
	L6V9xT7qofwAeoxgqJPVs6oOdR/guH3D8dbFvH3tmWeIcjO7OVIbP76itt2XE+I=
X-Google-Smtp-Source: AGHT+IH4VUAKHBWqRNJzHGdIvq8PGL5V48yPws8cK6i36baicRTB+rSLgHyFIHK+0WrfBeufEQueFw==
X-Received: by 2002:a17:906:11ce:b0:a51:bca7:3a96 with SMTP id o14-20020a17090611ce00b00a51bca73a96mr1624173eja.72.1712919871946;
        Fri, 12 Apr 2024 04:04:31 -0700 (PDT)
Received: from linaro.org ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id dm11-20020a170907948b00b00a51eed4f0d7sm1684736ejc.130.2024.04.12.04.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 04:04:31 -0700 (PDT)
Date: Fri, 12 Apr 2024 14:04:29 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	David Collins <quic_collinsd@quicinc.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 1/7] dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB
 schema
Message-ID: <ZhkVPXCDySXRWWJj@linaro.org>
References: <20240407-spmi-multi-master-support-v9-0-fa151c1391f3@linaro.org>
 <20240407-spmi-multi-master-support-v9-1-fa151c1391f3@linaro.org>
 <fkwugrnak3fhkg5ig47kmy3edm45ut4dprkabntnwemjt3w2mb@7cak5zxwzw4p>
 <ZhOJB8o9cRr7oQU8@linaro.org>
 <920d797f-0e1a-458a-9924-1f299a8752d3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <920d797f-0e1a-458a-9924-1f299a8752d3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_040436_387824_7B9163F8 
X-CRM114-Status: GOOD (  32.79  )
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

On 24-04-08 08:30:56, Krzysztof Kozlowski wrote:
> On 08/04/2024 08:04, Abel Vesa wrote:
> > On 24-04-07 19:07:03, Bjorn Andersson wrote:
> >> On Sun, Apr 07, 2024 at 07:23:21PM +0300, Abel Vesa wrote:
> >>> Add dedicated schema for X1E80100 PMIC ARB (v7) as it allows multiple
> >>> buses by declaring them as child nodes.
> >>>
> >>
> >> But is this really a "dedicated schema for X1E80100"? Isn't it "the
> >> schema for all multi-bus controllers"?
> >>
> >> I.e. isn't this a "dedicated schema for all platforms starting with
> >> SM8450"?
> > 
> > Suggestion was from Krzysztof to add platform specific comaptible (and
> > therefore schema). Since the first platform that will support in
> > upstream proper multi bus is the x1e80100, the schema needs to bear the
> > same name as the compatible. When support for multi bus will be added to
> > the other platforms (including the SM8450), they will use the fallback
> > compatible of the x1e80100 and will be documented in this newly added
> > schema. We did the same thing with some PHYs drivers, IIRC.
> > 
> >>
> >> Can you please use the commit message to document the actual reason why
> >> you choose to create a dedicated schema for this? Is it simply to avoid
> >> having to schema with either pmics or multiple buses as children?
> > 
> > I can re-send the patchset with such a phrase in commit message.
> > 
> > One of the early versions of this patchset was actually submitting a
> > generic compatible for multi bus, but I remember that there was a
> > request for following the platform dedicated approach.
> > 
> > Krzysztof, can you please provide here the argument for why that is
> > preferred?
> 
> I could not find such suggestions from my side in the archives, except:
> https://lore.kernel.org/all/dd86117e-0196-499b-b8b3-efe4013cbc07@linaro.org/
> 
> where I want SoC specific compatibles to be used, not versions.
> 
> Now about this binding, it is not a schema for all platforms starting
> with sm8450, but only for x1e. I do not understand why this would be a
> problem?
> 

I agree, I don't think there is a problem with that. At some point,
all platforms starting with sm8450 will be added and then we can even
make the sm8450 compatible as the fallback comaptible.

> If you ask why this is not a schema for all platforms, then because:
> 1. maybe no one tested other SoCs?
> 2. maybe no one cares?
> 3. maybe other boards need some quirks, so this would be applicable but
> not fully?
> 
> I don't know... since when do we add "generic schemas"?
> 

The focus of this patchset is support on X Elite which implicitly needs
multi bus support. Again, we can do the other ones later on. I don't
think we should extend the focus of this patchset more that it already
is.

> However maybe the question is different: why other devices are not
> described here, while they should? Then probably Abel can answer what he
> wants and what he does not want to describe. There is no requirement to
> model all possible hardware in a binding, but instead describe one
> hardware, so x1e, fully.
> 

I'll switch the older platforms as well in a separate patchset, I promise.
But let's not delay this any longer.

> Best regards,
> Krzysztof
> 

