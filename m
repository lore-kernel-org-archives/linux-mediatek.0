Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB199C433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 17:12:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C79C61A19
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 17:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C79C61A19
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nECQLT1/8dJrf2JuT5vKDtS6UDIEU2iLmQTDl0RhRgc=; b=By+pYr7gYWbB2IO9VJXUaO5Yv
	lIitnX8pxHwxPtDT4MWNsQ408Hu3xVIZ7/yW/2cb1TPoZJ8OZVDKboVxIqJ98mU74/f1d+jns/U7n
	EudwlQjCrZwD7gOartnfqjbB8F/r5qGp7COsXeQQC0AMAwPoIcTzjechs2lsHa3libbw0VY2zXHbi
	4gyM94+JJUIK7Rc5ZnBfFLnSG4ebSzfOwA6r+eF0Q1ARe/4MiATVz5SDinili/M6nw2mRmreyEAF5
	zRsEsnEpZr+z5779/a/Z8uhLWnE04kUCZawB9qPTAHuDhqnm/nDIVM/weUZpORUs4AIerN2enpDRe
	9yPGu4O3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP73a-00HUXT-Dd; Wed, 24 Mar 2021 17:12:34 +0000
Received: from mail-io1-f47.google.com ([209.85.166.47])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP73P-00HUW2-DA; Wed, 24 Mar 2021 17:12:25 +0000
Received: by mail-io1-f47.google.com with SMTP id k25so10180465iob.6;
 Wed, 24 Mar 2021 10:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Kfyvyp1Ln5yTnaTV7CcKtsoEbrgL8xSGq9FGtJAW0mA=;
 b=S+dVmKUTvBozAj4dGzQqxpZqvwkEb14+mVgtS9AO0zpNXa0dbvmmHl8HQeqz9+q72u
 kryCw1S7HFSfo4RhXeFcJzW8K0/mSEQ1oi4OpretFNnejvRJPVQVeD/4TdlLWux0aCwd
 e3aMSJEjGO4e1bErCgI4tGQ3VJQOZNDcHf9paQfa1Vsh98zdG29/2v4ryyRNjkJ8rsgI
 Q7hY3CEPZLNvS4zgPP0UwpunQL8Jx2QNJPv3ttn66rGsMSEFDf/K+KWsocvXX4UHxgoY
 7pnQnOHWGIGAueWke9gtf6aI5ltbJ+eZ1XEzH2EJJ1tDMsINhBzDdL6yQDNUwMSDx6hN
 Hkrw==
X-Gm-Message-State: AOAM532yIrcELYEvMWtgQ4vWhJG8lbVevnwQJNnHNq953vzUmo4quzFK
 fELtUTJNiPUTv2aBNEJ2nC4V6VSt2w==
X-Google-Smtp-Source: ABdhPJzRb9p2nx4RVdyDBLdyoKqhTBxwu57ERtx6jXb/Pon7xXueKAeC6ubejPFeiotv0m6IHkNtpg==
X-Received: by 2002:a5d:9807:: with SMTP id a7mr3302492iol.7.1616605940764;
 Wed, 24 Mar 2021 10:12:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id m20sm1358405ilj.66.2021.03.24.10.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 10:12:19 -0700 (PDT)
Received: (nullmailer pid 3264026 invoked by uid 1000);
 Wed, 24 Mar 2021 17:12:17 -0000
Date: Wed, 24 Mar 2021 11:12:17 -0600
From: Rob Herring <robh@kernel.org>
To: qii.wang@mediatek.com
Cc: matthias.bgg@gmail.com, wsa@the-dreams.de, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com
Subject: Re: [PATCH] dt-bindings: i2c: Add device clock-stretch time via dts
Message-ID: <20210324171217.GA3262580@robh.at.kernel.org>
References: <1615622829-15167-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615622829-15167-1-git-send-email-qii.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_171223_507856_B70D06B0 
X-CRM114-Status: GOOD (  15.75  )
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

On Sat, Mar 13, 2021 at 04:07:09PM +0800, qii.wang@mediatek.com wrote:
> From: Qii Wang <qii.wang@mediatek.com>
> 
> tSU,STA/tHD,STA/tSU,STOP maybe out of spec due to device
> clock-stretching or circuit loss, we could get device
> clock-stretch time from dts to adjust these parameters
> to meet the spec via EXT_CONF register.
> 
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> index 7f0194f..97f66f0 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> @@ -32,6 +32,7 @@ Optional properties:
>    - mediatek,have-pmic: platform can control i2c form special pmic side.
>      Only mt6589 and mt8135 support this feature.
>    - mediatek,use-push-pull: IO config use push-pull mode.
> +  - clock-stretch-ns: Slave device clock-stretch time.

Should be a common I2C property?

>  
>  Example:
>  
> -- 
> 1.9.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
