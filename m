Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4878C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 17:55:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AE9D64DEC
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 17:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AE9D64DEC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A0pdKxyOzDWiEmhEbrSx3GbiXW/D/9lFTH3xFJADhrg=; b=WnrLaakozbIxNYKTa6/wUtwkd
	aS/XIC2Rq1l3epjxFMMJzlPwy8Ge6sQ/fNANBPyaXIVUm8WjaHuC9U0hahCzoyBMkNnfj8GU4xMOz
	V/ceOEhocQ4fGxwCmmkeJi/q5me8d4FCZif2msGtjl2+nYGysuurER6EC8T5X/bLD5YufLv5OiM46
	pNrB49vp2/JDCzeUA20ebxe6sG3o0Z2/SoQSAptYh0kUwLeDgBy2N6AvTqio++S1T02n3jSxQLc7B
	HW9Jm6h/KrFIj3Q6YKaVKMILKdN1JEXcvijPuT6hMnkh6FhnoJaUhi1Ge+B5MAP5CJChnT+sS1Lg4
	aFioWpYKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l85Kf-0000tR-Ty; Fri, 05 Feb 2021 17:55:50 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l85Kd-0000sg-02; Fri, 05 Feb 2021 17:55:47 +0000
Received: by mail-oo1-f44.google.com with SMTP id q4so1824161ood.8;
 Fri, 05 Feb 2021 09:55:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T42QgMy/ntJkBGGqkjSbsJZWWBXpaF/+D1lujMvpfJc=;
 b=FFwp47/w3ssmWrAX7dm69guly0xfWTUY0finy+tK7iP5VtqrzfJbB2ehAaPSj6hIAC
 6qmCieo3zJ5yTFu4IhXKsgyFPkHWX+d5yCKQTNa8A9eG4jQ+rYOoAp+syL8bHKCcpMd4
 +X2zY/uSs1PRsNYm+3dOGj7Rit6IX9tmYlg+/ADcGr8EoLE+zbhwU6Q+DVzjPenUmi9i
 JPqsaySOHG4fKfkz3CYgAx8kN5/xSCMOq5gcV9tu3B7MUzGTg2rb+kRBHTMNxu9o3VnV
 KEiB+IbpoUCJpjoskypocdlcyrxxJ49E/DjXZ3x49DecEl8oQnxDei81wftLEtETIYx3
 6DBQ==
X-Gm-Message-State: AOAM530XJ9SRex7jd2qqBnmt82wGeMl+bbYH3TaCY37w1DUdRC37xuln
 68FqTa63tJCev0MluSFj8g==
X-Google-Smtp-Source: ABdhPJySCZ7kdYpyhimOLr/9yznPkOjWJYIhPiUxyeO0L7wpfbeLU1V09oGJfG5EdCAHFIQTPlY7BA==
X-Received: by 2002:a4a:a745:: with SMTP id h5mr4329374oom.21.1612547745786;
 Fri, 05 Feb 2021 09:55:45 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x9sm1919074ota.23.2021.02.05.09.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:55:44 -0800 (PST)
Received: (nullmailer pid 3364197 invoked by uid 1000);
 Fri, 05 Feb 2021 17:55:43 -0000
Date: Fri, 5 Feb 2021 11:55:43 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v11 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek
 MT8183
Message-ID: <20210205175543.GA3363048@robh.at.kernel.org>
References: <20210126011759.1605641-1-drinkcat@chromium.org>
 <20210126091747.v11.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126091747.v11.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_125547_056293_BFC1EA5A 
X-CRM114-Status: GOOD (  14.97  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hoegsberg@chromium.org, linux-arm-kernel@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 26 Jan 2021 09:17:56 +0800, Nicolas Boichat wrote:
> Define a compatible string for the Mali Bifrost GPU found in
> Mediatek's MT8183 SoCs.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
> 
> Changes in v11:
>  - binding: power-domain-names not power-domainS-names
> 
> Changes in v10:
>  - Fix the binding to make sure sram-supply property can be provided.
> 
> Changes in v9: None
> Changes in v8: None
> Changes in v7: None
> Changes in v6:
>  - Rebased, actually tested with recent mesa driver.
> 
> Changes in v5:
>  - Rename "2d" power domain to "core2"
> 
> Changes in v4:
>  - Add power-domain-names description
>    (kept Alyssa's reviewed-by as the change is minor)
> 
> Changes in v3: None
> Changes in v2: None
> 
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
