Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55C3C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 08:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bRkIbss5zipQAYfmEG1otWWm3m3WZIhza+y6Bahr8o=; b=TLVx5qdXrU1i1dv5gh2aO8Iu4z
	XVd/ssOhLfyUKM5hCmqgDAqL7TrTfsN3Jpv6V4woymxJdPMsrJr1qBcwniUZpbv+GtSlktCst6nQz
	xpjsJbETXnjXjlcEIoUGrH7ynQW+G0eIdXPiL2u1st0wWXzQaCMV31t4o+/HPWxx4fyKaqYnCinsv
	oLBkUi7ad5peHTloTbyXYx86gKwf+fRlWj6Py5pWl4SZm0ti/gWC9JaJoD9I/2Lxz08sc+lJnCXPT
	YVnBJ9JfmtNJ+nOExBr7twZaJtyKENKToxadYEBgAnEdhjPl3zcYXQTqYQSaB/kAlfBiX+YWoqRMr
	jvOU8D4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyTe1-00EKAg-2x; Fri, 25 Nov 2022 08:01:09 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyTdl-00EK4i-56
	for linux-mediatek@lists.infradead.org; Fri, 25 Nov 2022 08:00:54 +0000
Received: by mail-lf1-x12e.google.com with SMTP id b3so5705422lfv.2
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Nov 2022 00:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+bRkIbss5zipQAYfmEG1otWWm3m3WZIhza+y6Bahr8o=;
        b=sGfn8TkmI9i8hDYhSPtxrhgE9Ta2hjWcuRVfxBsq+wFViSgQThbXHefc5He9zVvod6
         Pin0n6FgG4F6LIZW41SgphvW7G8D91elQxFI2Y1Bsw4MihTCHpsI+RY3CwENvePEcfSO
         qFh0eFkioWbfV6HelKsiLUAOeMeJCa+u6fS+m2XGjdWNOrJtG8wyIYq3Deqc7/FNlzLa
         FMU+AuywRJzy2hiJa1v02aooRuAHDffXgmrc82JRSG8lwMG3GcN81fqteJELIi4ZDHK6
         2ZidDipoOyScEPq6jARLw08OwKjOg4mukZBZe95f9LS7QOZ9onYuaB5rUZoY89gG39tA
         eS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+bRkIbss5zipQAYfmEG1otWWm3m3WZIhza+y6Bahr8o=;
        b=DMhEnNmzHFgtaHkzvlJH2vBKF60v5CTPNUggQR/76ogboV9qwfHRzEmm8+87u8b88X
         V/BC1Z+mUsuo5pJj8PZtvT7jSQJFaYOMfqTJy6Xc72rCmfCW0/ixkVJQqFwrq3bME69n
         tGCrQuTxnwZi1BTEHXFUtvCbMkwR5bU5LjXPB1zc4HwGRkmqpIHNPbZTrCXG00U+Go+T
         v2iE996NeDRpZI4wdb3u0wY4R2kZVCVvGEeJn6Ov5GZfQ76TgjG5t/Pvq4ybN9CSIN5d
         MJVbxev8G9i6FUzG0ApAPPa2HfNkY8fx6xgbJV8ZML/5WgxurOb0ZPlF2PTVMAiVZ35G
         dbJQ==
X-Gm-Message-State: ANoB5pm4KNggYOGJiJZW+1zFsY5kn3UeEspH2OEjHh+AEaGy9tnJ4xMg
	pBWMdVkOqfTKBa60QtSzQFEHKJ1bavPC0JMd
X-Google-Smtp-Source: AA0mqf4tC0yYx22o080fuOAVsXbq5M6KzNEEE4YG4Rls+xEOywYr+ZZATK5FUXFRtoxeN9OQNqnPtQ==
X-Received: by 2002:a19:9155:0:b0:492:f5b6:2124 with SMTP id y21-20020a199155000000b00492f5b62124mr11548307lfj.369.1669363250409;
        Fri, 25 Nov 2022 00:00:50 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u4-20020a05651220c400b004a4731f75a5sm428893lfr.250.2022.11.25.00.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 00:00:49 -0800 (PST)
Message-ID: <4ffbba83-d23c-59ef-0b01-eeb80ea70219@linaro.org>
Date: Fri, 25 Nov 2022 09:00:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/5] dt-bindings: usb: mtu3: add compatible for mt8186
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org
References: <20221123135531.23221-1-allen-kh.cheng@mediatek.com>
 <20221123135531.23221-2-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123135531.23221-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_000053_236342_A77C56EE 
X-CRM114-Status: UNSURE (   8.91  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 23/11/2022 14:55, Allen-KH Cheng wrote:
> Add a new compatible for mt8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +

Any reason for using different email address than what
get_maintainers.pl prints?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


