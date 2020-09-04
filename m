Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32043C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:49:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB7892073B
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:49:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k6c3mBVF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crU4Qd6Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB7892073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=erwujnvalRxQDSz6i1OOOcKEl6tHfxjBwq9cAsAcxkU=; b=k6c3mBVFLf1CSpo0UzKM1Dyzx
	QsYgXlGOGarmjuGib++CpK5/an0AYiap51Q6j7sO0h52br/Z+qsujAHo6byQtTFJA8ygFJee0hWl3
	wAddLWdvzFahlU5wpbIyS7xNPuUPPRgMqaOlaKNz/v03rIdd9uuVrcOD+P6smxCvq0WA9koURlCAL
	Z5dmK0zUbvKaFkiLT2T93R8SqUb4RhOYkU/WZiP6VY3LkQoF48wcGkoTnPgZBgBdMM5CmZTo0MsC4
	rHHrPyI/tHs1EdvPDWDPaMJne4kFWaqJRhuDOW/f9SrUM4pWh5muxsoTMXVjlhz3qTC6xfT6sgzHJ
	Aa19buWng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE2jJ-0003S0-IU; Fri, 04 Sep 2020 03:49:37 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE2jH-0003R0-7N; Fri, 04 Sep 2020 03:49:35 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 2so2551508pjx.5;
 Thu, 03 Sep 2020 20:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r9i8umvaVSCytJM5iVtoZF4CvYGhoyV2FUivwOerO4A=;
 b=crU4Qd6Z2+DAAeZF1HTd0p3YNhtJUieOOImq0TqKNBWzEAAr8RwBu5zYvd1ltMPhCZ
 heSOuQ0zSAXKsjn9i6Hq+r+XK6noMsY4+wgTMzmUHMSqzTKo34VHo7xZF7suyjwmfUn8
 TJV++BfiA0JQyGQfrzZxXK1nfN2Re5TKJoRqQkzQdX8PXenJaAzrVhzkjho11cn2nqKZ
 6Rwe1E1LSEFAEpfnl1N/tu/1oGEqLZBj+Khq4YclQAjyKuOPgn/TYdi83L2gbtLCIY7X
 PGhaAskoS3vC0g21NXgOsoVRsF2NxQaukKgCwBZl56SvXksVeBvC4wp1ly48RLRUaka4
 7rHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r9i8umvaVSCytJM5iVtoZF4CvYGhoyV2FUivwOerO4A=;
 b=bnM2rpnYRxxGLncHmDCldTtfMXhzmLp/VoC7h+Dxe2IJIipoJ2GRBgjwkQ8hPChuEp
 mJMP5sapU0bFko2IfKmKpBx7PSjNFnYxShmueUofeNppMjolMzC+T6y6OQtpzHKZlMEv
 H6gorT6HS/mZ1b02607KhpvMm9uVHX1J4HKv5I1XYk1gvZ4MnnijCkezRxlhwJ9iAUkU
 Br+2C/BaFXFjKP++rgLIxrC49q5c+cLvdle8enN173LD999PEfd5JheBvvGeAPmAmkJY
 Ulm2wSm8avHnRSbKEJ0ae4pTYtiX/58K8XC6SN2muXVLjRxbidGOf+Sr1WEBhc/VQb8m
 hwQA==
X-Gm-Message-State: AOAM532S2RSMl+JX61M/YIj11Z+6cL4YivWZwo3YLI+bhM1qMPEPQmYg
 +jMI9OKj5UQQQlkGIoLfFPR6N/XiF70=
X-Google-Smtp-Source: ABdhPJxaTmX1TKvxuvR4aSt7UoimXF7486URqY05IsKTArsai2OPCHITVNeEHzzBYlPb4MGSdwAcig==
X-Received: by 2002:a17:90a:ae15:: with SMTP id
 t21mr6402232pjq.224.1599191372722; 
 Thu, 03 Sep 2020 20:49:32 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id g9sm4802550pfr.172.2020.09.03.20.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 20:49:32 -0700 (PDT)
Subject: Re: [PATCH v2 03/11] usb: gadget: bdc: prefer pointer dereference to
 pointer type
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>
References: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
 <1597923046-12535-3-git-send-email-chunfeng.yun@mediatek.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <4146418d-14a1-08ae-b387-944f6625e56c@gmail.com>
Date: Thu, 3 Sep 2020 20:49:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <1597923046-12535-3-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_234935_262109_8A0D3D9D 
X-CRM114-Status: GOOD (  10.78  )
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
Cc: Peter Chen <peter.chen@nxp.com>, Sasi Kumar <sasi.kumar@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
 Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 8/20/2020 4:30 AM, Chunfeng Yun wrote:
> Prefer kzalloc(sizeof(*bd_table)...) over
> kzalloc(sizeof(struct bd_table)
> 
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
