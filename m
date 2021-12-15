Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A80C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 20:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SnoQ9HDo60qBdm7jqtAfd35jYJXc5bidHhS1WEIS+n0=; b=AUe5gefTXDjmK3
	dQvCUOcr0DD3Z8XwiaeDd1T1hVeWVtTu6Z//6Yp5cnHM3zzXDC0Z8eVKLypb9GrK2gyjXiWaQvMz2
	97MgfSllAxomOc2LnYw0TaInYur97kbwFpfUHt0SWP2S8m0D+Sqs/EkL2X1oUVAYtwGBMDqCOfKnH
	+HklRajP+nEPAr9HY/h5j3zruev4F7mT9Aj8HsGxgHJTkVLttqNPGKE0DSLh6MoN8eO7YkwQgxtPp
	hhT1Fny9KUWT4rC+GgWNHEyi7uDmDL0DJiu4QNYKGGUHGb/oTBaqSW69jUvYpbRSz5vcSnniKu9vm
	pu11WtREyqfUBHtIuzsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxamq-002b7V-Fj; Wed, 15 Dec 2021 20:22:04 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxamn-002b6Z-Of; Wed, 15 Dec 2021 20:22:02 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 n104-20020a9d2071000000b005799790cf0bso26349755ota.5; 
 Wed, 15 Dec 2021 12:22:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yl4rL89vkkQfkiSLnPZW1gZdBwzv6ThVDS0MODexfww=;
 b=ftwNVeuk20lJznInRQR7VuTRMznh14z5ajaC7jSUrHHjh4CVbEwFbv+diWG1x644qJ
 SRmZk0y6oQwMPF5GQJQCygN3tf+uzfKnifwiXLnaY8lkqdTJ9DR/q0Of6XUcIl2MgfUc
 7BsZPC/Kz94Fr5ARxXG/7B2tw1tWiCqODRqYSPOzYsa000P7skK3koXtZHR18FpKwDlw
 SPxqX4yipibwjH8uqrjDDAMHvN5j/xewifgmwMuxM9G5noUQbmr5AZPBxJQJz82aCUKs
 SJ7DQghfuaGlK6s7HilKjf/1TdFh5j9sPeFlwNeSLT9t6eQdTYJUk+3e+BahBlB9xRPX
 Cl1A==
X-Gm-Message-State: AOAM531CEIiN2sqvkk1ESnrlFffvCDwOD5S5fdg4Rey/Qru9TWrh5nHB
 +o8SNSeyF953tkozSiEAJOGgNRG8og==
X-Google-Smtp-Source: ABdhPJxAD+MvRMJzz4Zo3q6S/s9MgZeKC/OTMbJZzQDfyQvMEgsyy2f69GVp1ZXlVMqgAmN9g9agmw==
X-Received: by 2002:a9d:51c3:: with SMTP id d3mr10225774oth.152.1639599719660; 
 Wed, 15 Dec 2021 12:21:59 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t3sm623898otk.44.2021.12.15.12.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:21:59 -0800 (PST)
Received: (nullmailer pid 1773069 invoked by uid 1000);
 Wed, 15 Dec 2021 20:21:58 -0000
Date: Wed, 15 Dec 2021 14:21:58 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/4] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-makomo
Message-ID: <YbpOZi7oroStzT3M@robh.at.kernel.org>
References: <20211213162856.235130-1-hsinyi@chromium.org>
 <20211213162856.235130-4-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211213162856.235130-4-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_122201_821907_9C97652E 
X-CRM114-Status: UNSURE (   9.64  )
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

On Tue, 14 Dec 2021 00:28:56 +0800, Hsin-Yi Wang wrote:
> Makomo is known as Lenovo 100e Gen 2 Chromebook.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v2: Fix enum typo
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
