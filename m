Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76F3C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 10:18:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B99502074B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 10:18:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V7NPo5/B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIdFvI3/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B99502074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I9v26zs/tJNaH4DVK09MbMvYH1MUrWsO9KUhaw0dE3w=; b=V7NPo5/Brx8tkJf5mFMa34v3x
	jhRxvaT9l9EGwwyjA/vKfOG30mcX3ZsyI1MhdyQ3S42Xk8JBREQAVgtXhQ+zG7CBuBiIcZqejgaIA
	0vJmvYeXi4lfM/VqQo1SsCj6dK0gRIO+VODA6lN8N2inyy1JPnk1nvCcE5VdUF858jNL7q+DB5wXp
	38ja6tJt/W6EmkMwX2EtxxxokY9R7RJ6ZmF43ne9US5V/19kWCu3/6YPA8TTGegJjZanLfIl7lBSu
	jbHQT56mioXZJUjK0+hM2uG+pRbiqES/kE9+YFa4bU/edSxVjd3X/XXL+Zy7ljqFNIWMZ5v5o5Wzk
	CblMVGpRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0jAe-0008B9-Nl; Wed, 29 Jul 2020 10:18:48 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0jAa-0008AV-W6; Wed, 29 Jul 2020 10:18:45 +0000
Received: by mail-wr1-x441.google.com with SMTP id a15so21070581wrh.10;
 Wed, 29 Jul 2020 03:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L+8hZ3DUqeSgXJLLu1cI0x5JkwDrCOyHENvm/ECikNc=;
 b=bIdFvI3/b8pv4BIyHsFtohM1EZp7ZiWGwuY25r0zJSXFAfX9+sd5ktN+PbRNZDbqlV
 zRzoLtSlknW5G4ti5ZRIywZWxbhkff5gJSsFZgfpNT6NN6Xipbo8mNa63fWGVtdwWe/4
 OpJGFH4susK10dQS6o3d40MIExTwIPmnfKyZtNNAIwRfuLaLluuJ++DYQToe4lqGulPo
 ItRdwZeTv/4AbPPpZPwojxn37JkFcbE59xemrKMVMQ6WL7Vxo1ft7Svp9S/x6lHX1mLs
 psxI/L8x+LyZcR6Wr5hK0BQn7X2nDQ9zESvULQ7XE+gJA/vMonbnWzDz91SCuPUWA/LV
 IOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L+8hZ3DUqeSgXJLLu1cI0x5JkwDrCOyHENvm/ECikNc=;
 b=q3OjNgZ75OJJOOTTRa+2kkDf/y9cvJEMKW4SH772yuAdrnihQfwNdsZrUaiPzDp9/i
 aJXwC24nT1BWwax1OZAbp/c/fAlAzB8YSuYIm6/S3EoV6Jp357+GY7WMA6Pj9kfTpeOd
 nizitAMDhaOEWGSQ2/EA5RjbPTDkorTvjYneMCNSO3f+FiunlTpv182LUTseiM0u3OXy
 UQ8hYB+hkjqyb/xm80zfivEh9P8HkmpCJlia7rgUIRckA1XOzLnt6ISh3yuOt16QTryI
 q1cF8nVsAbZUENJIul+/7YLUK1izPxr0K+3b7QYFSFCVEpNwrysiTHDKpzVVf9zqgphg
 2Alw==
X-Gm-Message-State: AOAM531JQB8smczWBQdkOajwnEU7JntzXFjYxRBvjvpYA/1gC9pJdZsn
 5yB0OBCHdZfx+uVg6dPFCGE=
X-Google-Smtp-Source: ABdhPJyVVOF7Ria9gxZG0U9j3Vr6Dep9PAZVLWiHJbAHm04ETXwhwhaGwQN1UKqYu3/SAS/3h3B7qg==
X-Received: by 2002:a5d:6702:: with SMTP id o2mr28315989wru.364.1596017923835; 
 Wed, 29 Jul 2020 03:18:43 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id z12sm4182465wrp.20.2020.07.29.03.18.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 03:18:43 -0700 (PDT)
Subject: Re: [v2,1/3] dt-binding: mediatek: mt8192: update mtk-wdt document
To: Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
 robh+dt@kernel.org
References: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
 <1596016922-13184-2-git-send-email-crystal.guo@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <c6ea8852-0381-0924-185e-083ea167f8fa@gmail.com>
Date: Wed, 29 Jul 2020 12:18:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1596016922-13184-2-git-send-email-crystal.guo@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_061845_105979_14D2B666 
X-CRM114-Status: GOOD (  17.73  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, erin.lo@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 29/07/2020 12:02, Crystal Guo wrote:
> update mtk-wdt document for MT8192 platform


should be two patches. one fixing the compatibles and second adding new board.

> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>   Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 4dd36bd..e36ba60 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -4,14 +4,15 @@ Required properties:
>   
>   - compatible should contain:
>   	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
> -	"mediatek,mt2712-wdt", "mediatek,mt6589-wdt": for MT2712
> +	"mediatek,mt2712-wdt": for MT2712
>   	"mediatek,mt6589-wdt": for MT6589
>   	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
>   	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
>   	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
>   	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> -	"mediatek,mt8183-wdt", "mediatek,mt6589-wdt": for MT8183
> +	"mediatek,mt8183-wdt": for MT8183

We will need to update the DTSI in a seperate patch as well.

>   	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> +	"mediatek,mt8192-wdt": for MT8192
>   
>   - reg : Specifies base physical address and size of the registers.
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
