Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12DDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 19:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+sVTEBtqtEmkjJ/P9m/lRz7Yy5cRorWE+PspP0QhvA=; b=Jn66KkiZK3gSZI
	DGZSRi4yw0JtIQOl7vYOzXZPIf0oGF9WLZLCE0+rcrfn8HVcNSj2KfFwXiJP7KuR9FibrGGxhvbti
	YzA40AbZ3Y/q88Zch4t0PZBcMck/aUGSSyXpe6ayqf/HoZQOsObo/YzU1YUNHFBy6/9FH9TpsHXkE
	sVyZETtGWYdmYWmeoUspNIqyksl6ObpDDMcEJriCfXaKj4JL+qrZ3QAkdSqJGakBNL40WxftJWN6J
	CDZ+7ohLSVKPLT7w2jmir0YXFA7RLXHoM8F21wFh2bWymm43xpIhaBcJNsIQp9mswN/NrebGC0bxU
	EIqpkkWjOL84HaVMX0hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPUJH-003v1t-3h; Wed, 02 Mar 2022 19:06:51 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPUJ1-003uu7-Kd
 for linux-mediatek@lists.infradead.org; Wed, 02 Mar 2022 19:06:37 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CB4DF3F614
 for <linux-mediatek@lists.infradead.org>; Wed,  2 Mar 2022 19:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646247993;
 bh=m6ojeTgtogrdSSitR1acR3iefkQ9OYzxbBDb1IxSxtI=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
 In-Reply-To:Content-Type;
 b=X+EEE3qMq/w0NKio3LuzmquQDk3sYpRkro9Z/iEAg5GapOGFv2QL6TfbcoR0KzjaS
 vfC80vDfMo/dcISoA6CjZV4/9BWz2BNdB7zrmNlPLleb2MxOQZbjaqC82dn4Cf54RG
 dJFmz2d7RiiD1zZKHvL+iwBSHUZlGMlEW6KJhoilfZU2uvaOJTsOeARpXv97JkssUp
 4gPzeah8OOb0kfgFevBUu26fsh9ZkoAu0PL68/zO5n5ICsg2yNR1teQ8dCiDxbii3C
 ptPgFJ2Ke87f0NmJzuxWmee9uZcZ2I8aL9q6UUfDv74gqivsMhNeRdisCX7WF30Qv7
 LKjuYJSdqLhhQ==
Received: by mail-ej1-f72.google.com with SMTP id
 h22-20020a1709060f5600b006b11a2d3dcfso1471445ejj.4
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Mar 2022 11:06:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=m6ojeTgtogrdSSitR1acR3iefkQ9OYzxbBDb1IxSxtI=;
 b=lQdixkTrGyd+d5zQ/OIAD4f5cFVnMwfBkB62xyxGQZ3I8Iyzy8eam0rNvxDpiePOu6
 vw5SiIIXtcHjdbi17C2YlLUwvQuFy1hPbQbiOb+65RNxAcQTupK8Z+/vKftAcwHF6BMR
 cb9a3Z4i+HC/GlC8DMfIDIO70CYWPLvTqNvdw/ad+US2ERji7yaBotjQIzGTU/4WUJMY
 y036dCiBy2JRZBYyA8TWBiJWZHUkx38wrk7HttmyDi/pwAbzYef9bRBVCZEKee7N/L1K
 Nsoaz6XNjVNfQaKnVOq4ZcdLIdfQHPxGjKkWwhxax38hVwKAXonHAdEkKRXnh4A+zo1s
 0Fgg==
X-Gm-Message-State: AOAM533XREPzXWiTTQYTCbYfauy/WvJIIMU89IObdyJ+OfdPnQGID12W
 CRyU/QyXyzJdMoV/dfowsTa4CiWl9GaCGqZRSW4jcV++/CPINL4q73oVzHJpayslCpEa8q20OVo
 Kg2bF1Z6W+TueqPRyjBE7FRt1lErb04ibdKVD/1UjxrkqAkK7fA==
X-Received: by 2002:a17:906:6a0f:b0:6d7:1021:2bd2 with SMTP id
 qw15-20020a1709066a0f00b006d710212bd2mr6424443ejc.395.1646247992554; 
 Wed, 02 Mar 2022 11:06:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeQrZWG2Oxg6RE7q9wIPUX3Z/sjjW6CdMRyOa97Yz1CbhreGcjtKJUbps/xbBHdxqhb0/UQQ==
X-Received: by 2002:a17:906:6a0f:b0:6d7:1021:2bd2 with SMTP id
 qw15-20020a1709066a0f00b006d710212bd2mr6424403ejc.395.1646247992278; 
 Wed, 02 Mar 2022 11:06:32 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 cy1-20020a0564021c8100b003e359e4f54asm8827529edb.43.2022.03.02.11.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 11:06:31 -0800 (PST)
Message-ID: <77fd3853-25b2-f9f7-6081-969ec54aa6a9@canonical.com>
Date: Wed, 2 Mar 2022 20:06:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/4] arm64: dts: mt8183: align Google CROS EC PWM node
 name with dtschema
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <20220214081916.162014-3-krzysztof.kozlowski@canonical.com>
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Guenter Roeck <groeck@chromium.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Benson Leung <bleung@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214081916.162014-3-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_110635_830112_F3359883 
X-CRM114-Status: GOOD (  13.69  )
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

On 14/02/2022 09:19, Krzysztof Kozlowski wrote:
> dtschema expects PWM node name to be a generic "pwm".  This also matches
> Devicetree specification requirements about generic node names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Hi Matthias,

Any comments on this patch?

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
