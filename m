Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F91FC388F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 12:44:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F84120757
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 12:44:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gzd1e5d5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ck9y9jNd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F84120757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6mkAhY4MAaeykVeh2uELLHKAf/SYJqiI0etLcL89G88=; b=gzd1e5d5sC0/CUXA75W1cOuF5
	YP217qJm+IHLHSiG/dYiTYpanCW0fsHyPidQ+uDyQ1FFPPaxUeWBNV4BIGCejl9pR4ZK0rzj1ssTj
	r0WYy4StXw8a/M0SfhfFsM+CcVECrCyoYLeWrAwsavFh4G1z5KYV28U26a/x6sPt+3x+urQSEeWdu
	TROiHjcXXIl9gSuss4FYItC7m8QHqwIIEYj0/PBzE9BHB+5pgbosW/TlwL4m5CGVnQaAQaPeTYkKX
	38BMdoLO8c66eKd8Q7gm8kcMzI4qD5ZkTKCRAjr8zaA18zwiIkn7ioc/HLtM5vT7m+fho4Rw0jcNw
	ki7cGBeew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXOKn-0006Xe-8q; Tue, 27 Oct 2020 12:44:17 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXOKk-0006VH-HF
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 12:44:16 +0000
Received: by mail-wr1-x442.google.com with SMTP id b8so1784966wrn.0
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2020 05:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=HBFttdYAiRM1KfFacsdZju3R8FEz52UG6psn2mn812k=;
 b=Ck9y9jNdJH1H9KVu2owJyTBu42rV4XSWLdMUbByrEIQhakBN7YO3viBNE7ywGE3yJV
 21nxkfIOqKJYmVR7phi6Mzl7xabBrqCSHVDvC6wQjQdXQwgh7fpBlxLd0spJm6TD1f/z
 i8rfkkdL3rv1kNNzjwl5ccwoTqDMuUQz+sXBzzY6oWTJcr7pbtuUho/VDBaGCbA+JUFy
 8rFIc0Mph/wTGNCdJiEdu+j+TUPeGOqq7vp55s9RrKz7oPhApmbGbRXD5yrp3Ko8tRiS
 uvrWHwR+8dFXWShuf4c5KsxIDyJiXxw78K3ZGM/ChFHu1dDwpDKmBilfGofXcucVgkOj
 pjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=HBFttdYAiRM1KfFacsdZju3R8FEz52UG6psn2mn812k=;
 b=G3dYcU9PhyBACB9E6hrb4wfoyt01opf7zwuoKzsciHUP5Ccmlziwdy+MxiVWtdPbTh
 1h9Huz+qBRdm2E2XsTvUJyevBSIGHJHsljKFWGb7MpAKNcGHwcxBo2DC6EIr6jq2jMxR
 mTLyJ8lr+wnAUuVF443DUEE9nPAZDI1oNOBtQEQKfZmzCxkCEnQrNPSi1BC8PdW/xbZ9
 evMgvb7XwAzPSnY1Rv2YvmfaIua9xADeW1HjqRmNoWjkR+bswtSsnL4YMEq8JxVq2VJH
 ixC0CUKwEw2475mXnRamhR+9hGeHhS7UdrLDoqTJvksY2yCmOyZhVDnBhO8PxeW479B9
 KdkQ==
X-Gm-Message-State: AOAM532GZUleefFiQRpq4QkCusdYpfZ06NQaHX0laA7s3w6gAjUWF8Fk
 De72pYIjEsnpX1tI+/J3yW75MA==
X-Google-Smtp-Source: ABdhPJxGIvXpfpZxv774x6oG+TdKSVGildynsy97gcSuNQ0khyKnhSHNQjEj6Ais+Xmhl4PIo0XW7A==
X-Received: by 2002:adf:84a5:: with SMTP id 34mr2855003wrg.152.1603802651408; 
 Tue, 27 Oct 2020 05:44:11 -0700 (PDT)
Received: from localhost ([2a01:cb19:8ae7:9d00:68a3:7a03:6c11:8947])
 by smtp.gmail.com with ESMTPSA id m14sm1891082wro.43.2020.10.27.05.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 05:44:10 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Fabien Parent <fparent@baylibre.com>,
 Yong Mao <yong.mao@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Subject: Re: [PATCH] mmc: host: mtk-sd: enable recheck_sdio_irq for MT8516 SoC
In-Reply-To: <CAPDyKFrMwLeuQoFDgXYo_-T_e2AzfqM-rgp3-SgeuC6Qn6rxMA@mail.gmail.com>
References: <20201023122950.60903-1-fparent@baylibre.com>
 <CAPDyKFrMwLeuQoFDgXYo_-T_e2AzfqM-rgp3-SgeuC6Qn6rxMA@mail.gmail.com>
Date: Tue, 27 Oct 2020 13:44:08 +0100
Message-ID: <87wnzbg7on.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_084414_820924_46311399 
X-CRM114-Status: GOOD (  21.78  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Ulf,

Ulf Hansson <ulf.hansson@linaro.org> writes:

> + Yong Mao, Chaotian Jing
>
> On Fri, 23 Oct 2020 at 14:29, Fabien Parent <fparent@baylibre.com> wrote:
>>
>> MT8516 SoC suffers from sometimes losing SDIO IRQs, this makes SDIO
>> devices sometimes unstable. Make use of the new property
>> recheck_sdio_irq to fix the SDIO stability issues on MT8516.
>>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>
> Maybe this is a common problem, thus I am thinking that potentially we
> should enable the workaround for all variants?
Not sure if this is of any help, but: we use the btmtksdio driver on a
MT8183 soc with an Android kernel based on upstream.

With that kernel, we did not to apply this work-around in order to
have a stable bluetooth experience (pairing with a remote controller)

However, on the MT8516 SoC, it's impossible for us to use btmtksdio
without Fabien's fix.

>
> I have looped in Yong Mao (who invented the workaround) and Chaotian
> Jing, to see if they can advise us how to proceed.
>
> In any case, I think we should add a stable tag and a fixes tag.
>
> Kind regards
> Uffe
>
>> ---
>>  drivers/mmc/host/mtk-sd.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
>> index a704745e5882..3dc102eefe49 100644
>> --- a/drivers/mmc/host/mtk-sd.c
>> +++ b/drivers/mmc/host/mtk-sd.c
>> @@ -524,7 +524,7 @@ static const struct mtk_mmc_compatible mt7622_compat = {
>>
>>  static const struct mtk_mmc_compatible mt8516_compat = {
>>         .clk_div_bits = 12,
>> -       .recheck_sdio_irq = false,
>> +       .recheck_sdio_irq = true,
>>         .hs400_tune = false,
>>         .pad_tune_reg = MSDC_PAD_TUNE0,
>>         .async_fifo = true,
>> --
>> 2.28.0
>>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
