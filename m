Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E96C433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 10:27:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A26C02225A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 10:27:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Se9x330E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgGC+dK0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A26C02225A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QWaKETvmoPOfSk5dZwMpfDxPF7CSOjJ5gmWPAjWD/hM=; b=Se9x330EsTA75Rw4LsORhAjQw
	wdyhYDsAl1BrYJbA+4omSIxvU8rEGCnQE/b4I3OxDB361qSczqcQvYHcm/Fehbecx9iw1EqfL0Xhe
	kQYO0dTZE0+w7t61WeoOrxrxGDg3yH7N5QxQeGFjRRzH9stjbQ35htSwLOUKWT74XK4TxoYpSGGL6
	rV/3moad9OwzylePdQ98oR8Hlt7Em9aU1tRpbc+qOeBaKAXsPF1G0H/VWoea/PpxRJVlTj/TDQUgY
	avFek0+M8EgP2GkuLW7+WM8L9jJHSgf93elwG2Wq1/wjHSD0NERRJVxXyGVDSqsdSAENsu9kk6BNP
	kbBCEN98Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUSNh-0007M3-5F; Mon, 19 Oct 2020 10:27:09 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUSMs-0006yp-Rf; Mon, 19 Oct 2020 10:26:36 +0000
Received: by mail-wr1-x444.google.com with SMTP id n15so10794079wrq.2;
 Mon, 19 Oct 2020 03:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LF3ORmMoGqS/hxFMe+tpwXv3PmdT4f80BHlurUKBSuY=;
 b=WgGC+dK031/CPcsoeMxwhW+H3Zz9qc4Krd6s6DyJsbTXiGr3XJ09t4ESMfBDckSXcb
 Q8aFW5rgFeUeP2EajOUVlPP2JlpPzncMBbwTyDIE1bmwRpRz1XAkpzOdpTjizWi8NteC
 oa0ayROHc3P8yHl4bp/G9QCv+3gYIhCPAbEZXMUabhXLPm9JSaaHiCID7QK66WA5HgsR
 dQBp9j1SINqsSY2UZ+O3r04V96JSI4Im3QGj5i0e1eDiWtfKoQVSVHUjMNH4bdND+YTC
 OGfqGZLs7u4BIIEp8U0oordfXt3zhn8n2HvcBnvPe4nTVUF0bAMVODbLKPJWWFcwzleH
 LgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LF3ORmMoGqS/hxFMe+tpwXv3PmdT4f80BHlurUKBSuY=;
 b=j/Kr7oFR8incDriPGe1Ny8ZMTT2ra3Uu3WzmLs1qg8URkEiQtvtvTsEGZvG6zuMjot
 C6ZqsYfouYM7w2CC4AtwlFiEi5R25BBroUqtancM3ru64mhdbB1EVdJHu1JKzkePTwFo
 2SmOVQJnueSflTHSCbSrL8qSMVNlUviaVhlU5UBo5VuiU+CdiPs3NiPlQoytOZlaNZxd
 pPdhcZLKHhODMsJ86CTHnPppT09FO/AJB9zOk/Pu8Raj0K/a+Oa2CIB/fets7cGDhMCa
 SIgilbE3nKAMOwJs9QAKtiXW5ybC78FheWlcmiqkSSkQESgYcsmTzhU9kJSEp57O6aFv
 gs8Q==
X-Gm-Message-State: AOAM531iEYp0sYLhSoIgup164fAoTYoYI3wuMmE9Lu8pFY2rmN7GTVKL
 C0qrgSvL0mCvb4eXVJkP9oKRWZBhOpkNyg==
X-Google-Smtp-Source: ABdhPJyM1z3+ZxGl43cj39NefKQxXMWzDZZvG8qPptC7P2+1AuqgUBLmSY7aKTbaEp5GBiCnN0pg0A==
X-Received: by 2002:adf:e94b:: with SMTP id m11mr18686214wrn.35.1603103177062; 
 Mon, 19 Oct 2020 03:26:17 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id b15sm17435133wrm.65.2020.10.19.03.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 03:26:16 -0700 (PDT)
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8516: rename usb phy
To: Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20201014162404.1312544-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <3332df44-33f1-d7b6-9c8a-e34e16ab8658@gmail.com>
Date: Mon, 19 Oct 2020 12:26:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201014162404.1312544-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_062619_447730_25C690E1 
X-CRM114-Status: GOOD (  19.60  )
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
Cc: robh+dt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 14/10/2020 18:24, Fabien Parent wrote:
> The USB phy node is named usb0_phy but there is only one phy with
> 2 ports on MT8516. Rename the phy to make it more obvious it can
> also support the usb1 node.
> The usb1 node will be added in a follow-up commit.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Applied to v5.10-tmp/dts64

Thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8516.dtsi         | 2 +-
>   arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> index 943c426e9aaf..50049b6c1ba7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> @@ -455,7 +455,7 @@ usb0: usb@11100000 {
>   			status = "disabled";
>   		};
>   
> -		usb0_phy: usb@11110000 {
> +		usb_phy: usb@11110000 {
>   			compatible = "mediatek,generic-tphy-v1";
>   			reg = <0 0x11110000 0 0x800>;
>   			#address-cells = <2>;
> diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> index dfceffe6950a..8bad8faf35d2 100644
> --- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> @@ -195,7 +195,7 @@ usb_con: connector {
>   	};
>   };
>   
> -&usb0_phy {
> +&usb_phy {
>   	status = "okay";
>   };
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
