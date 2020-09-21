Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB107C43468
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:58:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73D5F20C09
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:58:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zv8wOoNp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqePeyhl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73D5F20C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9yRiA+8GpRbsf0sXfaIpfbiL2Ko7RKzvTyzpY5xbDKs=; b=Zv8wOoNpoGEZs0DpUyhjNTzO/
	AmMY0bcB1u2/rWBB+daUuDhas0ZdVS4HZz+zGvHuNsUrWlT3I90yM2ARUmVi3NXw31oqEz8FOUE6V
	CAJj0qyrkmxwWmomJu9imW22K1/Sdqz1s57wBzgdB+rG2azzSizHIge6QDJ7S80N9D4ViS4o9+M7A
	RdwjeQcMd72+N+NdZBs4ciuxljOiGoHRabfAx8UlhX1KjNouTP3Vzx87e02Vyff0gTKu5yGiIKOa6
	Ds0o7m5ieD8PP63vPZE+i7rK+op8y9S37zSdodZeuNC7CvkM3SvCtUmu7++n1w461sHTcFSKe7G7U
	J0DhvVkqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKP8o-0005h2-Sz; Mon, 21 Sep 2020 16:58:14 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKP8e-0005cX-Om; Mon, 21 Sep 2020 16:58:07 +0000
Received: by mail-wr1-x442.google.com with SMTP id z1so13573004wrt.3;
 Mon, 21 Sep 2020 09:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pwode9WuxR0NQny1g826zVRL54o0hpVVy92ZYMK8Dvw=;
 b=sqePeyhlvkDMq0UuJOosFLcsXj2NVMi0T9t825erutMdwMYePO3YQMyHztvv+S1Srj
 wkVr70iSteaGLlw7mDX/twUNDKPIhbw6XBW+b/L69MDnrin/dhAuHT/Rg8LQtAaFkzxX
 mguMEZDzJz76tly4LqvPvL1IP6fvei34A+HDuK1yPzz27CUPqlGNpy3lCSVu3CK8s109
 4kUaP5QXR9KQjqDiMOFDdvkJzaC73W4TFufIUzh8+oazfB425amqUx1A8WrssgUqSaU7
 wjiGZJV2PPbGvfDsUPmtm1j7UTMzisPYeBx0pKeelDWfvwOdxPeo3wPQDyZZcLauACxm
 FswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pwode9WuxR0NQny1g826zVRL54o0hpVVy92ZYMK8Dvw=;
 b=k+wbac3e/V2VrkQporFCzu7YFFW2+S/L7VOE4CKZg0CTBWADrIdA2WZN5iOxypipOK
 bJWkD0hojlgf60BmFOwU4+TJcsTAtpy/cIBoAWGPXEMuz7MQfgqG6mtjbzog/jSkxQC1
 rowSbtFLyf9afzRO+7Q4dZJ6LgxupGaQN5Z1Bg8hn82GTunUOoSEx4YrVwnF+Gu3cGHl
 5y+TqVQz3lGbOSqQUXPyWqMk9HQn48zKTPRH0upkTj739Lk2GOpuncBbnjf6EXAMIIZC
 PdQkEcueu4pTJGiDc0U9VsrwuB2nu/7GopIuMmuv8UmDl4Sn8gzRG6eplVIe0uOO6Cmv
 am7w==
X-Gm-Message-State: AOAM532JyTXSjomavxijXn1WaGu0Ji2n6W2c/GZBbXe3ze7cM9Yd3Zgc
 KqYJJweR0bangfqdKeJpuds=
X-Google-Smtp-Source: ABdhPJysuN26CjjKmkh684/LBj0YsHAp2r5E1WyzP+CrVHERk8Z/A+gg8P+I+kN1vdh511YnZzgQeA==
X-Received: by 2002:a5d:6049:: with SMTP id j9mr684578wrt.295.1600707483654;
 Mon, 21 Sep 2020 09:58:03 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id h2sm22648597wrp.69.2020.09.21.09.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:58:02 -0700 (PDT)
Subject: Re: [v4,2/5] arm64: dts: mt8183: update watchdog device node
To: Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
 robh+dt@kernel.org
References: <20200803071501.30634-1-crystal.guo@mediatek.com>
 <20200803071501.30634-3-crystal.guo@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <8df5726d-2be4-48b8-145e-67539f5a23f5@gmail.com>
Date: Mon, 21 Sep 2020 18:58:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200803071501.30634-3-crystal.guo@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_125804_881828_B89ACF7C 
X-CRM114-Status: GOOD (  18.77  )
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



On 03/08/2020 09:14, Crystal Guo wrote:
> The watchdog driver for MT8183 relies on DT data, so the fallback
> compatible MT6589 won't work, need to update watchdog device node
> to sync with watchdog dt-binding document.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>

Applied to v5.9-next/dts64

Thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 1e03c849dc5d..f8d835746ab8 100644
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
