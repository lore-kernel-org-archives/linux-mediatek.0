Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79865C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 23:00:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A0DF239ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 23:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A0DF239ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=79YoyzjII05iFzAHSDi2o5nUhet6NJpPvxAwzqKS+Kk=; b=ZZ72cpoD3Q7XXMFTN2TgHQw1x
	MGiLWp+axpDWMT3SKtNf34/h/Qxqj1OYw8KQuEuKXQaRlswNLbrDyzw1YSVJRgIhY/ugamDDnXEb0
	HQ/bTCVMbUs4BNdU0gx7FqGjKxPy4fBbHa7CUyyo1nFS75KDarKHs+BsW0v070ypgNtA9EdEQPfgX
	OrvtLsJEeenMv2kKFRJTO0HqO0WL6v77ReVEVDXzaM40tC2yFRYfIjZMBW4M/4OQDwInhr619/Ite
	e/P7OjC8LY416vaBqRPubrXZ7GnrbaTXBE2kbEABZX+07/+u9gVSzGrJnH2TTmSqPhlYyGll53gSp
	xIKKMlcnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmPUf-0008MP-JP; Mon, 07 Dec 2020 23:00:33 +0000
Received: from mail-oo1-f67.google.com ([209.85.161.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmPUU-0008I4-Km; Mon, 07 Dec 2020 23:00:24 +0000
Received: by mail-oo1-f67.google.com with SMTP id t63so1044368ooa.1;
 Mon, 07 Dec 2020 15:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CFy+nG4iS5p2yYyKX/b5kvW6hcT/gqROUK6GrSdahRU=;
 b=PD7Cxe+rkBf8w6wfOFx9zxN3xRIezTYm5LUNGJtkB7HDMEIkxdemNvZyjr3ULWYlOT
 944gShmYtjHK4Mp6ZVlTe/tkRTERCQXOstoFZtmwjsVOFc9UjQ65SZS4H4z0wLhevFtI
 B87kucvKZO8dp8Kp8p0onvgi0nN9HwD1SZiMV8DGtD7o9Hw7pVf4V4sdBseRxSnlzUv8
 1rWl3+r1N4UJH8dsKK5mS1plRUfJkChHOstkCJGtv2OG56XuMullvV6UHFZzy+F5S6n3
 JUiGLQejW6G9gHmLDdBApC3CzgaQcv9O6flgru1n8HTJ/S7e2n3bTw45o+2g1L5nfLQl
 bVzw==
X-Gm-Message-State: AOAM530Yspw61zMsgdiD1V2GAeugQl8fPanq6HDUuL9pe0+fQGCOHgJ0
 L09s5xwiob7zTHcjQJuXEA==
X-Google-Smtp-Source: ABdhPJzE//ECqTKe9WJx+3uBk86ScLYklU5dwJEKbOkkShMp6z+xNxpE+bs9r/ycNubVmOVXfDg91Q==
X-Received: by 2002:a4a:a3cb:: with SMTP id t11mr8596364ool.30.1607382021970; 
 Mon, 07 Dec 2020 15:00:21 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o63sm2978041ooa.10.2020.12.07.15.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 15:00:20 -0800 (PST)
Received: (nullmailer pid 1006890 invoked by uid 1000);
 Mon, 07 Dec 2020 23:00:18 -0000
Date: Mon, 7 Dec 2020 17:00:18 -0600
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 5/5] dt-bindings: mfd: correct the node name of the panel
 led
Message-ID: <20201207230018.GA1006838@robh.at.kernel.org>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
 <20201204093813.1275-6-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204093813.1275-6-thunder.leizhen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_180022_704074_798F1474 
X-CRM114-Status: GOOD (  13.53  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-serial <linux-serial@vger.kernel.org>,
 Mateusz Holenko <mholenko@antmicro.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Karol Gugala <kgugala@antmicro.com>,
 Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stafford Horne <shorne@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 04 Dec 2020 17:38:13 +0800, Zhen Lei wrote:
> According to the definition in leds-pwm.yaml, the node name of each led
> must match the regular expression "^led(-[0-9a-f]+)?$". "led" or "led-"
> followed by a decimal or hexadecimal ID number.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/mfd/iqs62x.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
