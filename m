Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64C0C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 18:30:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A156613D9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 18:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A156613D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+gMvbuvGzR1m/t1TNnQjpQd9/P2x6lXuGcqikc2RP04=; b=pdvQL1HBV5XSB33PrXe7PFMoz
	KPha1B4X0/XQPMlmtsWiGGgsLRlgdyUgkI9K9Eos1EM0GRqhuafaelRQhUwS0MuF0ChzPFAcWsDg4
	4fcHVwGovJTwEK4qlUpsLaRAJiuq/+tNjma5Tdl0+FBWwPpJe/K42dZaDCM0UZXQ2w2jcAupGOkuj
	jJMno6PlgZUmQ1Rbgwrag5UUa81clzxCF2utlAvdwgNgy7NHqNeWZwVAog9P1dhecB3gihHDVXlGV
	Q/XgUe+BQVgBET4s6/RvrjWWLSYZhI2Q+QFqm2Ygdd8hgoVKk/eeMBm6roiaW6h7ZHIA3GtZfeZ5X
	0lCs6anMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYv8X-00CpvF-Oa; Tue, 20 Apr 2021 18:30:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYv8K-00CprK-SF; Tue, 20 Apr 2021 18:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sP61S/5Ei7GoLiO2+Xq/4uwjVjtkrBpHlzUNjBjvixU=; b=czFqrL1Bq7eCm6Uhc/nHN0UPLD
 eFq5KEtGXteTmfOP6Oof+RzGltfk99x4ERwYmKLWTIPvP1LgZ09dnH9ycuSbZsFYpuDpaYAeyTlFc
 LLJaoeiuLUlvcmEeZK0uqdaGZsp237/7F0NNI3LJDXR5sZJgg/9/UvwOIt53dPoKSufDWB9BxJT9P
 xFJepCzOb7I5CdhxZ03/Btcb+7nr62iJM7MpkwslOe69tRy/LGp54WE5UksiGPUbMs3pXzc7FYEfS
 c88SHX2fkOPBvkDgD6zHTMouL2MHXifsOq25X7KBGkMsI5UeJ2Wxbn49yXcGsA7HMZrEfdt+RQzXa
 3C8ULwDA==;
Received: from mail-oo1-f45.google.com ([209.85.161.45])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYv8F-00CLVU-9R; Tue, 20 Apr 2021 18:29:59 +0000
Received: by mail-oo1-f45.google.com with SMTP id
 e12-20020a056820060cb02901e94efc049dso3736961oow.9; 
 Tue, 20 Apr 2021 11:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sP61S/5Ei7GoLiO2+Xq/4uwjVjtkrBpHlzUNjBjvixU=;
 b=hx5yV+bNc7JKBSQ4ePU2v2PThqiTXXt0+WKNBPWETkxyPhDASIsTbpI3CsWcdZ07I3
 eKXZMJtrjBPxiOWLHE/0JLysb1kCqbnhKSM1kqGFLtkjQ+TGGh+/EuZFxpC3TU8xIrSO
 IrTajqOspe0BYEv1c/YhnhLACJUFGUv7Co1WxkCloLirLRS7xScNy3BpW9CgrpPCEvYI
 /ydEtvX4O/jU0VDFGKmx4ysFfOPSeLpM5XWlZQcR19g8qtSRdBCz41gpholWxDiShayF
 yoTGtjT+qrF2bOUhF69b64D9RYHtmpw8LextkuIgqxiK6BheWc/avADPjElQ3Vv591pW
 lZQQ==
X-Gm-Message-State: AOAM533Ffjq/JOh4mauC1vlp/ORJvmmG6XM6mOZwY2rYqTIfFVT07Eus
 jj12d1ThQr3ISkkT/zmKzA==
X-Google-Smtp-Source: ABdhPJy/xdD2FX9SeCd0t6/y5ntqAQbXa6eJ9+A391M7uk2ybqFLJ+beapdhokRWa8De5UfdHnpYtg==
X-Received: by 2002:a4a:e615:: with SMTP id f21mr17906359oot.41.1618943394364; 
 Tue, 20 Apr 2021 11:29:54 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 34sm552948otf.38.2021.04.20.11.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 11:29:53 -0700 (PDT)
Received: (nullmailer pid 3596620 invoked by uid 1000);
 Tue, 20 Apr 2021 18:29:52 -0000
Date: Tue, 20 Apr 2021 13:29:52 -0500
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Ben Ho <Ben.Ho@mediatek.com>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 3/8] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-burnet
Message-ID: <20210420182952.GA3596569@robh.at.kernel.org>
References: <20210416164055.3223088-1-hsinyi@chromium.org>
 <20210416164055.3223088-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416164055.3223088-3-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_112955_346500_51C0401B 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

On Sat, 17 Apr 2021 00:40:50 +0800, Hsin-Yi Wang wrote:
> Burnet is known as HP Chromebook x360 11MK G3 EE.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
