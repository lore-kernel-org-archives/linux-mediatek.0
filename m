Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F7EC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 22:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpWHFTzTjjC42F3c83Vg2WMgt3IutHQV+PPURqufrB4=; b=fUUEQ2LAxxGuHl7+BD+crCs5as
	msrqmPfHOpm0ucAel+lam3oQ2fLSXwj8X19g85OldUQf1tGloz7XcsNNUSnzXIa+HARayO847uZ9Z
	4FMNtvIzNMcDMuDUywbGbm7PmV+6JufV9ipp53wvnLof4mdQwfmcYu/gXRsDzd9vKaTIm2GLWSTV1
	DXvCDJl9tB2ooX08PSw0Xv8SzY/IZS36GK/qrUs7UzFpIEDvMmxqkRwpdH294r8VR4Zf5dG7gtC+z
	BktKsoBw+8VueA+/Zr59XyTjW74JvigNU6dzm3NqXQcb8UXX9ttCuD1JYVH/GQ3Y80B8zZ45BwHY0
	cOWCKZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1F8H-00Bcmf-Q4; Tue, 14 Jun 2022 22:35:33 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1F8E-00Bcjh-F8; Tue, 14 Jun 2022 22:35:31 +0000
Received: by mail-pj1-x102f.google.com with SMTP id q12-20020a17090a304c00b001e2d4fb0eb4so358565pjl.4;
        Tue, 14 Jun 2022 15:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NwwLE3/14phzBfjRizqiAq2vengibXcV3OpeGRTTx4A=;
        b=aYWZw5Ji6QQA51FQsaM4Vc7ZZN6xsfrRwRNaU3Q35YA4tq6kS9doapSK2QIL0jQ5wf
         mDr0cwFET3f8gJ87YfxKe0kZPrWyVNutkqn77emxOHtmXQV9rBacfo/Sdc2rb54Kp2FQ
         K24gD0poQ6LgJhkqKJdZ6v2K5veqhS+ovFjX6g7HiGh2ejhBTJAl8j7wQMWZz8C6iuhy
         TxLGMJTR5qRWcBZ2wNEmeis7UaLEhGK3MtfO6Zc+CDreNt1bAK2OSWjfTgjQxbsLRdqs
         ryvGXdW9vbORyB+QBKMEZLlw5nGWqvHLU5ufCn1pW7CLCoJ5wcfciQ/k8jF0AalI/aBj
         c3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NwwLE3/14phzBfjRizqiAq2vengibXcV3OpeGRTTx4A=;
        b=qggnlApX1H6AsyFc95r2zgMjl4HMErz64LOB68bF8EjjbRcPepbNhrh1zF41rwMhOM
         HV4/0XPWNoSROAvxvo2qKpgb6ErBZuI5GH5bkadThiEkKzVwz9LwK3QHCrnJVF+0gDgl
         8s4NMepsgbbypOidRaj6ZET3lu8vbjMKVkfNSMSqA4ggAoVtKwKSqef1Qg6nS5bQoZs2
         ZXoFcP84DboJGn2CTfyxQ+DIJpqIzi7zL7m93WjZ6hjvUOsp6yhkDw4Dm4VM6wOeuY8+
         3YOinV98A3zK8EVVCDU7mQaI3ONHrxaR/5J1SdAUgFotSCkmPB5N7lQY5WXCa6L3qDoA
         mS0Q==
X-Gm-Message-State: AJIora9wFa190wSvVId3blTdHkEcfkaIj7aOY2F4QxaXu/s1IIPE8TrU
	gRZXLkxTq7jxzfVmHtTTjBQ=
X-Google-Smtp-Source: ABdhPJx/RHkeFCVkRg7nBFbWmI2VL038XtCgy8qmzH1Fp7OdkNHaYk9vLplec+dk5bINIVeK6WuE3g==
X-Received: by 2002:a17:902:d312:b0:168:9573:8043 with SMTP id b18-20020a170902d31200b0016895738043mr6656295plc.44.1655246127468;
        Tue, 14 Jun 2022 15:35:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id g12-20020a056a00078c00b005190eea6c37sm8067747pfu.157.2022.06.14.15.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 15:35:26 -0700 (PDT)
Message-ID: <3d7d69c1-c0f9-45e8-7e0a-2b57c96dd14a@gmail.com>
Date: Tue, 14 Jun 2022 15:35:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 3/6] net: dsa: mt7530: rework mt753[01]_setup
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220610170541.8643-1-linux@fw-web.de>
 <20220610170541.8643-4-linux@fw-web.de>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220610170541.8643-4-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_153530_555401_A7EEBBF1 
X-CRM114-Status: UNSURE (   9.10  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Ungerer <gerg@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 6/10/22 10:05, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Enumerate available cpu-ports instead of using hardcoded constant.
> 
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
