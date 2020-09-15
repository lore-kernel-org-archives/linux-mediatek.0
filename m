Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC63C43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 09:34:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33DA02080C
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 09:34:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZITO9jGE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtSqh/AV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33DA02080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3faRYR9EiZgyScC/7E5b40FXFHmb9QKkrBvXLHqlcyE=; b=ZITO9jGEjjoHOjk3xh/SQtUjb
	NjFdUQT79n514swyQiT+4D+0br1GftvB3np5GIto8zNfrpvNoJpGYt6nwiobj0edr1je4mzVnRNV4
	SLicTbcwCi21s1zlKwkzbnkTnAMIt+w9B0eAR86aXG9FWsoXwVf8oRinbmN2nfm75Ja8QYojDU1+9
	6VlwA+ngrJ8hxWZwcjCb02nrKZRF2toM1j6RImEpuECSpe+M6+DeSgabnZ1ge/TxhKllPNvh7LDEa
	OvRede7A+/oXOf1oW6yJWBMjRlxO1oPHe9txyMXgC7Eqbs8nlv05TfxTCRLrSptpuiTEvnglCNT58
	Qm3OBmItQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI7Lx-00005f-SN; Tue, 15 Sep 2020 09:34:21 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI7Lv-0008WE-5Q; Tue, 15 Sep 2020 09:34:20 +0000
Received: by mail-wm1-x341.google.com with SMTP id k18so2699845wmj.5;
 Tue, 15 Sep 2020 02:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=67DGhnHI5ky9aYFAddzT1xx//rw0HE/G/UG2KwUwvZg=;
 b=jtSqh/AVWGpCMKkgPVN4OUymijGKQV8H7Ic+ZeXAtbgB/ZfIuICvROHikgdZ9cop3X
 fpsFP3Co1qOhVtYeiyj0DAAHB/Iq4CmkNzeQnD6uHVGO7bVP094dXQ4g8a1Edy7qKXSX
 TstQWKr+xJEti7JHNI8qD2JDPAjpUeSN5PiTrd03/kqHts3YRWWIwoyziyt1hdg6PNLB
 R9/28q7E52Yoa8eWPI41p82dImuZxrk+YpXkiIEF3kSjESaceXbcveC32pLsBCYzHIzH
 8bkeeEmID6tc/suwcN1+rpDWig6uNr259S7EnQ2eQZ9QiTGTTIMuUeE6Or8wb/J9DHOT
 gMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=67DGhnHI5ky9aYFAddzT1xx//rw0HE/G/UG2KwUwvZg=;
 b=RvhVFh8znN9YFouxqmdliCZeTXMFAnQVBoWx9wS0hrK46fvZiV6Kd05rJODGbPmAtQ
 0HW72BWLD2tfZ7XU9P/1X9JGSOzT3lTV79/tmmsJuVLMeansRnUBChePzPFk5QKmh1ro
 bzM75mIEMyYuqD1TKx8VLnwuLQykxyUFHkGasaVnpft25LqARnNACDAmP0HTcZ5rpM9z
 kB3Ihq2GWqMdLyC81nE00MDFFV967tUsgyNTogIfPxM24l+rxqP6QZ+NZwGMZkXKDlHn
 LvuMb1q2o4eqTeVnzie4FDkZROLk2aZgwZl8Pw0a9X0D8HEyRDVcfKL8nEmH0VWCEWuA
 qoVw==
X-Gm-Message-State: AOAM5313weELyLzbj2FAxKtlu1vQN48mC2c31AcFKSftX80gA5GQwrSu
 t4aXZErogsZL4BPy/hv1gVw=
X-Google-Smtp-Source: ABdhPJyzMN+PH6DddtIX0wFjsQw7cBewtV8OuM9oQ/XZCiLuwUuFUrsS4EFZipnC9IJfFm10GINqOQ==
X-Received: by 2002:a1c:3985:: with SMTP id g127mr3914315wma.32.1600162458037; 
 Tue, 15 Sep 2020 02:34:18 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id a15sm27345109wrn.3.2020.09.15.02.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2020 02:34:17 -0700 (PDT)
Subject: Re: [PATCH 0/3] Mediatek MT8192 scpsys support
To: Weiyi Lu <weiyi.lu@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>
References: <1599201895-11013-1-git-send-email-weiyi.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <673c1209-f71c-398d-dbce-7ad6ca3610de@gmail.com>
Date: Tue, 15 Sep 2020 11:34:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599201895-11013-1-git-send-email-weiyi.lu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_053419_257968_5513CBCA 
X-CRM114-Status: GOOD (  17.48  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Weiyi,

On 04/09/2020 08:44, Weiyi Lu wrote:
> This series is based on v5.9-rc1, MT8192 clock v3[1] and MT8183 scpsys v17[2].

First of all, thanks for your patch!

The actual scpsys driver has some limitations. Enric and I are working on a new 
driver [1]. My idea is to deprecate the old scpsys driver in favor of this new one.

Would you mind to resend your series on top of [1]?

Regards,
Matthias

> 
> [1] https://patchwork.kernel.org/cover/11752231/
> [2] https://patchwork.kernel.org/cover/11703253/
> 
> 
> Weiyi Lu (3):
>    dt-bindings: soc: Add MT8192 power dt-bindings
>    soc: mediatek: Add MT8192 scpsys support
>    arm64: dts: Add power controller device node of MT8192
> 
>   .../bindings/soc/mediatek/scpsys.txt          |   5 +
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 148 +++++++++
>   drivers/soc/mediatek/mtk-scpsys.c             | 297 ++++++++++++++++++
>   include/dt-bindings/power/mt8192-power.h      |  32 ++
>   4 files changed, 482 insertions(+)
>   create mode 100644 include/dt-bindings/power/mt8192-power.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
