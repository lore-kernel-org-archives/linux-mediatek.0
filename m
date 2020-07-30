Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC17C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 11:12:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 993942075F
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 11:12:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ufZM2e7b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qqy5ZKot"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 993942075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0ntc4w80mH4ViY4NmWrG1SOXVzFx9wB68JEhd6kHVdM=; b=ufZM2e7bVe+KhmIrnAn+TeY2O
	B7em1N9G/j5RSedh+cgIdPalSoZFkbqWgCZ7R7b5xf6rB4QHqiOyuw8IBOAcmrvWjY1KkTA2SAfMW
	vtDDRUt+OipYjaMys6MosZ0m86El1/sNIwxD6X5KoHYtyKbyEVjcqC64vYyDIGVvZdVNulYF36e1+
	16L2LTvGRauWNV7uQCjXqlwYy2SnZgtEaYmvgi6yD8cgMnvJjeRU/CKL59YI9UdxDRu+E8q84rvsM
	JtuhtN1LRvLcfrDJawFdvWK62lDLscln0/GbZUcnrXr8GpElNSe4/Zf2hCcPHsNbpL/R/0GgHDPUZ
	SpoxhaOAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k16Tl-0002tl-0U; Thu, 30 Jul 2020 11:12:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k16Tg-0002sh-QN; Thu, 30 Jul 2020 11:12:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id c80so5356239wme.0;
 Thu, 30 Jul 2020 04:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ypTDchxzwbMJAsETKZdjxAeDtU6POm0sHHrOZVadiRk=;
 b=Qqy5ZKoteb2C55iM5DEQ+Nap7nCqIRbSH5jXdUAXF2bih6o7RNFkKfeVb3qt0wugaZ
 p5EYYmvGMKKdXY9031NbpEB1xhBKQdJz2ip4i6BjFIaiCNl5ykCxTUi2MFEyCc5WrSSd
 yFFhbWwX7gSd8p1YhXL2iXKvAUe+eEt/cula8qsW1bxwGzchkQfgKv5kyPA74RuBQlZB
 IdHIwJJsWSAvP0SQ9ihzs7vjr3RLt699FQQRpylUuQLH01Iqlmaf0rWuLw7X2NqvgY1W
 rVnDDzPEbD2PyWalepqqWb6ywoiV3WszujdId2PnOg1lGR3HxKuHN6MuA4cY3hLt7l/H
 qn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ypTDchxzwbMJAsETKZdjxAeDtU6POm0sHHrOZVadiRk=;
 b=W7Gp7ANEYz+5EKCJqFAz8QmUF1t6Z7hlQM/lZF2fJs43+5ySzj/UnfBtCQME8VOITg
 /wB1SkaF8jfs9tQky8wxAX3x4xEc1Nh7DbgHjtlUSn7WDF2sjrJvD88Z2m4QZSa+sQCh
 tUhAiv3PDpMXrnfBqp1EZUkI5bzEwFx2eFyKtOTZyRBh1o3RFHBob+Lqqn3fcnWqpv94
 OpisxTlVp0uL1G42U7NJQHhBssqv9eI96rXo4yo1Sp9HSUfLxNiu1C1Evrz+hbu0XUYB
 oli2FI5jra0oD/UzgFWO21NMe9nVrAJnP2CEm/wxo9t+VHq/u98xUopX65IpcuApE1O5
 jDkQ==
X-Gm-Message-State: AOAM530eqiQrLwlT5wpIZvgWQw0M+nU6viEEAlr5nHkNhznzDwTiQrDh
 +QEdbdmThLRg9Z35ezBmrdU=
X-Google-Smtp-Source: ABdhPJwDv5C04Qwfcy3UO08Fd+s1PAlDltCqZnOGlIVFNo5Coe5SeW7/nBhVtBcWXjPT4cZaz39/Zw==
X-Received: by 2002:a7b:ca57:: with SMTP id m23mr12580815wml.35.1596107519556; 
 Thu, 30 Jul 2020 04:11:59 -0700 (PDT)
Received: from ziggy.stardust (81.172.57.81.dyn.user.ono.com. [81.172.57.81])
 by smtp.gmail.com with ESMTPSA id
 p22sm7854592wmc.38.2020.07.30.04.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 04:11:58 -0700 (PDT)
Subject: Re: [v3,2/5] arm64: dts: mt8183: update watchdog device node
To: Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
 robh+dt@kernel.org
References: <1596104510-11113-1-git-send-email-crystal.guo@mediatek.com>
 <1596104510-11113-3-git-send-email-crystal.guo@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <ace85d53-28a3-a277-b390-bbda9c4c0738@gmail.com>
Date: Thu, 30 Jul 2020 13:11:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596104510-11113-3-git-send-email-crystal.guo@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_071200_912815_2E2853F0 
X-CRM114-Status: GOOD (  18.16  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 30/07/2020 12:21, Crystal Guo wrote:
> update watchdog device node for MT8183

Explain why you update it.

> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 1e03c84..f8d8357 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -310,8 +310,7 @@
>   		};
>   
>   		watchdog: watchdog@10007000 {
> -			compatible = "mediatek,mt8183-wdt",
> -				     "mediatek,mt6589-wdt";
> +			compatible = "mediatek,mt8183-wdt";
>   			reg = <0 0x10007000 0 0x100>;
>   			#reset-cells = <1>;
>   		};
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
