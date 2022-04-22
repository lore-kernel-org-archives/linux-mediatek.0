Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25990C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 15:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eXy57b3oPIHietGEgm0vFlq/JR/1V+dv8nnxngBDd04=; b=ewsxvfuk+fyVps
	ZGz8qEftAEhUaTSGkK0reFaPwDyzhykOYt3Nq15GkPYmT1jC3XM3+0qbqkY5PkWInh/Z69BH3/WIM
	VU0c0QP2Xb0GqzYsk1+ISC/8R/hvQAzJxWO8JbpUsB5KZlydvUypvZT4t87QywfNdlR1+sgURhjbG
	J0xiLjiJ2dbTfP57RLkpzup/ng97fU/wa+XnE6oPXxmrgg4lCTFatvWjz4VVy70EQTxaa/Uvk414K
	mqo2AwRIve+AfdyZy8Q2NX7RyTvWDt1xbEyM318CRAHcWTtwn3MCYZdV73Iczpx3Pu59tmbfeheyt
	MJp1Lb0bCfjbxpfKprrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhv7D-0015XK-28; Fri, 22 Apr 2022 15:22:35 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhuxR-0011sf-WF; Fri, 22 Apr 2022 15:12:32 +0000
Received: by mail-wm1-x329.google.com with SMTP id p189so5273209wmp.3;
 Fri, 22 Apr 2022 08:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RTXQxTUlDy/+XtQ3FRDbwb/fEP0/XOiKskHAERCJ+aA=;
 b=Li35G7NpXuvuBIHaNfZEPJ/UkjIgIle1to/jslIte4pPT7SoHLW9heC5fTTcFJUiZX
 Z+L2yRuLcsU4nH2o3sHramC8AjH2M7vYdn9NNa62cdZfDK6Myg5AcUjywaYGzhXsOff7
 0mei52r8X848r3jjymXS7WJP+25/4BTUXDHet1DWXTcdTuFZL03XsyGj1tzE3rPcXs4e
 9hCKEpO6xuyWagFlDEU96BvE/XX/XNvqLgGgKtoZ+OJ+4jt80aSCEVMJK+RizhJv+4Dg
 3UxE+OzXPvh8hB0FdsLXh2chCOgrcdbPSgnS8ST8NzhVmnlnY/LGNyab+lPyFbve99/w
 RODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RTXQxTUlDy/+XtQ3FRDbwb/fEP0/XOiKskHAERCJ+aA=;
 b=TucL1QzOJdR7UG5YMCNkDUOrW/1xz1eewhhr3BbYaWuAhTJQ0fxS14u2awjyapuFkV
 9WCM2T2yF16aJPslEqohX9KaOHSkqWfcJcEgWGXizWQweAd4LeASwyFw7K/PWZQYtb8t
 v84B8aKtEzv/lr4xSY92PjaYlgiLYw3PAIy0GITWVk7lLBNx+rr+h1l9NfO13xDG8TD3
 uMwLQ1WoQt+d3DtGVDZ1XHeIUC+xQZPwU+rb39ril6YxNuQrSvvkyARaNoGFuW6MNBXO
 N9Zr7FuyMmOg11/a4KP3KZE7KFU2D9AXN7tK0xzL8FcPiiGZuaEncSQT/P1XfoDOphrj
 WCJA==
X-Gm-Message-State: AOAM5321oCSHqPNnUSIpCTB1QxcNL99ycCDBoEntFrWLBzvK/z7qmA/8
 fKS/YmcqNpi6bc/M3UWGRqI=
X-Google-Smtp-Source: ABdhPJx/9ozGt+podmI9X7yq2z0UtTmdQqvAQs7KH6K85Wh/0AMDUalJOhps+qXlZoJnjpD9AeZZEw==
X-Received: by 2002:a05:600c:20c7:b0:38e:bf41:edef with SMTP id
 y7-20020a05600c20c700b0038ebf41edefmr13797138wmm.173.1650640346174; 
 Fri, 22 Apr 2022 08:12:26 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 v2-20020adf8b42000000b0020aa790a258sm2031690wra.8.2022.04.22.08.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 08:12:25 -0700 (PDT)
Message-ID: <8a341814-6165-df6c-e99f-afc38a46448e@gmail.com>
Date: Fri, 22 Apr 2022 17:12:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arm: mediatek: select arch timer for mt7629
Content-Language: en-US
To: Chuanhong Guo <gch981213@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Russell King <linux@armlinux.org.uk>, Ryder Lee <ryder.lee@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20220409091347.2473449-1-gch981213@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220409091347.2473449-1-gch981213@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_081230_114623_FDB49C5E 
X-CRM114-Status: GOOD (  15.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 09/04/2022 11:13, Chuanhong Guo wrote:
> This chip has an armv7 arch timer according to the dts. Select it in
> Kconfig to enforce the support for it.
> Otherwise the system time is just completely wrong if user forget to
> enable ARM_ARCH_TIMER in kernel config.
> 
> Fixes: a43379dddf1b ("arm: mediatek: add MT7629 smp bring up code")
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Applied, thanks!

> ---
>   arch/arm/mach-mediatek/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
> index 9e0f592d87d8..35a3430c7942 100644
> --- a/arch/arm/mach-mediatek/Kconfig
> +++ b/arch/arm/mach-mediatek/Kconfig
> @@ -30,6 +30,7 @@ config MACH_MT7623
>   config MACH_MT7629
>   	bool "MediaTek MT7629 SoCs support"
>   	default ARCH_MEDIATEK
> +	select HAVE_ARM_ARCH_TIMER
>   
>   config MACH_MT8127
>   	bool "MediaTek MT8127 SoCs support"

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
