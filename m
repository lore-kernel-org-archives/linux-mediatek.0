Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D162C43467
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 15:29:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5B92251BA
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 15:29:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mukAj/u3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjRGH2PX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5B92251BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0fayxEb75WJUEyctLNvqx6pSVfA7v1h3LC/HGDWfHmU=; b=mukAj/u3VebhIGhaoJULk4eHo
	yxnu2Vm5pZevuBGgjgXzYrLqr/WvTI38d3w0Gyh+i6ZJ0a4dxUNKEKoiuDkNqq5CecVezQj8Z+JYI
	jm8IH7MNFdeM7c9hkre39MqnTrm73RzVQVj9BIIra533f3PdPyKoXNrXZnbxubGW66xibd4JKg0fz
	+Ts7pfJfZ3VtuK8VhkheglEp5Y0IFjcvbiJhbSfEMN01r3Mfu1kO4Le8awvJOR2U2RfhYR/XUt4CQ
	L04tKJ44WqmlozuIA/ZhfFsfnPVvLKY1Qq0sm89APz/H6OvL/ZymwWdgRLQwZ8tVwtqe49ijYRbeD
	WgdWraGAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSMEl-00033Z-FD; Tue, 13 Oct 2020 15:29:15 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSMEh-00032k-Ee; Tue, 13 Oct 2020 15:29:12 +0000
Received: by mail-wm1-x341.google.com with SMTP id b127so76766wmb.3;
 Tue, 13 Oct 2020 08:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mjiyjVsGGXyDjzrsZuC1J4LlhI+CHkfPoB5QM0hQOC4=;
 b=sjRGH2PXzw0V9eOoQIG6NTECrQgppWtQCeoH6EqFPQpDJlEkYOZvgwNM3pJaYvIykb
 a21zOdrGlVqrMNRSfCf3awaV70i0Bf5cC5SRjASUBZu899J7I4UwL0WztUwkqoHw3/Li
 y2TdGz7FsiW7uRf0pysSwsNjMXIWswFk5pZSYrJ4P2qmDNWX8ohK05dPHjh5MMG7e7HU
 PeF+dONFIs9p7kUyTh5h2km7WrnqnzYBDQxvLm3gSbCUfP9X2nDkACJmt613k0E5QSzU
 oUyTmlNkd3KBKPfBrvtOfnCcOln+alEeZTW92HMunW4NHgfO+gE2a8QmH55NO3wK6OzS
 5GzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mjiyjVsGGXyDjzrsZuC1J4LlhI+CHkfPoB5QM0hQOC4=;
 b=uQLzI4UrQUFn/N/80+xjIN+OpDKv/UFTvumF3ne0dCuYYJuPlltnwwA5XmRcyJcZ+5
 9zj0CO85pi8CLwWvNm/aWYSVs5CFh9BhFBOHQkXETwcOeXYuDKAQLCxw4gwNf/Zsco2i
 +JRkpYrfQiCOK4LxXUQTA67tbvE+Hl9d7gwhz1WevO8ELleIpIovDKod51lm/M8O9k5T
 Y1ZMZiW2x4FPBPxizTuOcNB42qOpJ9EnAZmY19KmiYO2v0XkyrrmM42QlpQw3z8uIHM0
 H4j0hsQxNdWohkMfP/H/fIj76aLz311g/1VSUMxT5NEZAiKlZ4A1omQEEjzzO9Q+r5XS
 lQUg==
X-Gm-Message-State: AOAM5304Y687iBEWuexaA1OjAWoV9vH1DPIriaXI/+4GNClJFJ/24RM3
 67Ht3M63sPgkS33wXWuHSbU=
X-Google-Smtp-Source: ABdhPJw4prU04oixGXNv11ba1nnr8682cUZNiDAAoVcJ0ibWqNyHNPuAZ5moFweZHKugXeG3NgEikg==
X-Received: by 2002:a1c:32c6:: with SMTP id y189mr411620wmy.51.1602602950342; 
 Tue, 13 Oct 2020 08:29:10 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id x65sm129753wmg.1.2020.10.13.08.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 08:29:09 -0700 (PDT)
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8516: add auxadc node
To: Fabien Parent <fparent@baylibre.com>
References: <20201012205218.3010868-1-fparent@baylibre.com>
 <20201012205218.3010868-2-fparent@baylibre.com>
 <81a12664-639e-20cc-8b49-6bcb53822a3f@gmail.com>
 <CAOwMV_yqK+yLZH1tOSeUHP7qz35k-bYmWf7jg6qQpvhO9LeJ6g@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <ab900e0f-fd5f-a1cc-8300-b681c97f7231@gmail.com>
Date: Tue, 13 Oct 2020 17:29:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAOwMV_yqK+yLZH1tOSeUHP7qz35k-bYmWf7jg6qQpvhO9LeJ6g@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_112911_507078_821E38AE 
X-CRM114-Status: GOOD (  19.14  )
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
Cc: DTML <devicetree@vger.kernel.org>, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 jic23@kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 13/10/2020 11:06, Fabien Parent wrote:
> Hi Matthias,
> 
>> Any reason you don't enable the status in the pumpkin dts?
> 
> No particular reasons. I looked at what other MTK SoC did for this IP,
> and half went with the status to be disabled and the other half went
> with an enabled status.  So I went the mt8183 way since it is the last
> MTK SoC to have been merged and disabled by default. If you think it
> is better to be enabled by default, I can change it, I don't have any
> strong opinion about this.
> 

Well on mt8183 it is missing the thermal driver although as you can read the 
values via sysfs I'd say to enable it. No need to resend just because of that. 
I'll take the patch as-is as soon as Jonathan takes 1/2.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
