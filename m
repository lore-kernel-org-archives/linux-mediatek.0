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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81079C433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 10:22:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0383F2225A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 10:22:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1OQOKaBS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6aRVscP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0383F2225A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IROx/l7oauwLLTqRLdM+OsgFvHPfrtNkCJiRAh5tRCQ=; b=1OQOKaBS7VONxFvEspad/MECx
	WgXR/7KavBroquEJdm23No6FWKGV93vizjS2nlhxfMHX/6egM1EDndewMhJgHJgQPBwgsurrRFsXo
	guK6kVf0gKxn7BRE1u7F5i02AXGFGK0Bh8piOUJBtWCW3NJX/j4LGeD9ICk2zak7OhYd55aZ2ynkw
	za7VxZI1JQ7B0COSNOLR2eozYfOeot39kBDxVNqWIfoU/Ih/16ilA+2IkgK7KgGCzopUweLo3ug/7
	gnU+Gr7ppMR8PJN5pdcV4Kj4E/2Em9Hafm0MtqXflWAmLgC6IqUS767G51WbewK2i3If5CczHYa5c
	FxNlrBBWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUSId-0004Za-9q; Mon, 19 Oct 2020 10:21:55 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUSFT-00032X-Qb; Mon, 19 Oct 2020 10:18:45 +0000
Received: by mail-wm1-x343.google.com with SMTP id p15so9717027wmi.4;
 Mon, 19 Oct 2020 03:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jyCSS4cTjPFXhl4/RUNaCmks9VNBA8VC25KTtXeVMY0=;
 b=b6aRVscPivqUvHF5pqyiuMVkb6+/IO/I9zVsN6PZjZkK4RkcDU7aQoAbUfCMO6qYog
 1pF3mV+Rde3esTbTtWZc+dQ3MAPvES+jW7BAvYOWTXShCiToogyro7bEIH5P2W29c0Qg
 OFvRDzfKPzmVmUyWdvktMahSoQdfcaOVe34sutg1R5KTKI0hbtB10GXB4iMp0bflchCF
 SpwueeiUcR62Zl1TYIGdjqw6iJT19e9rDo2L7qKdPx27rDLMYfaYT0TyAE5Djjsp5M41
 MZNSOD1Qq8rBlmHgLp7HCMM4co6mOC4caTcL8mOI5DFkZrljIOWwJGdrRxcVFSqdxYMy
 m7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jyCSS4cTjPFXhl4/RUNaCmks9VNBA8VC25KTtXeVMY0=;
 b=b6f67P9oOEOG2WC9+j1WLLIDlAWfZD8cLgTMv4Gd7tALrbj1PV5mPbk9bKoD130mlM
 Zkj6LXs2A6wxgKxAdDIXoUXh/LNfNQ9laYpe1MzsP7953ejiaksWduRJgZT0fi/0JHwD
 YLH3g8/XXnIFL0vcvHiM0PXxjCtYfv/UewdViTMOei+AiaB0YwEoyXOLMK3PR5I5PDQL
 z/3ahACImbVyZ5qt9/6vj9YT3VSk7VqtL89RHjNpDCO4PdgquNOOyzwCHj4lVrtPEfxl
 EPJPQe1IZ7mbBNvGC9B0HIRYtUTWOIA2CR+1rBYbXnMPQ+6i3XXN8zivx1HbKVYEV44q
 KmWg==
X-Gm-Message-State: AOAM5307LHKOV7Tj5igk2NnjMynKxSyhOa2xG+nDjJ6n6FCztnVF0/k0
 U7pw/X32CC6hTI7B0GGxmJfVSO+6hBmDvg==
X-Google-Smtp-Source: ABdhPJxqh0JBjgMiNMQsM5zfGmfBmaq0GMxI6SFeha4IKb3awYX27ltJlsnL97exdlDE3lr78UaG7w==
X-Received: by 2002:a7b:c935:: with SMTP id h21mr16006756wml.99.1603102717032; 
 Mon, 19 Oct 2020 03:18:37 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id o3sm17317744wru.15.2020.10.19.03.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 03:18:36 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: mailbox: mtk-gce: fix incorrect mbox-cells
 value
To: Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20201018193016.3339045-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <19590d90-978d-0b03-af79-fd8d7a7f1408@gmail.com>
Date: Mon, 19 Oct 2020 12:18:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201018193016.3339045-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_061840_017630_4F5A3E14 
X-CRM114-Status: GOOD (  19.19  )
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
Cc: dennis-yc.hsieh@mediatek.com, ck.hu@mediatek.com, bibby.hsieh@mediatek.com,
 jaswinder.singh@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 18/10/2020 21:30, Fabien Parent wrote:
> As the binding documentation says, #mbox-cells must have a value of 2,
> but the example use a value 3. The MT8173 device tree correctly use
> mbox-cells = <2>. This commit fixes the example.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---

Fixes: 19d8e335d58a ("dt-binding: gce: remove atomic_exec in mboxes property")

With that:
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

>   Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> index cf48cd806e00..7771ecaac586 100644
> --- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> +++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> @@ -47,7 +47,7 @@ Example:
>   		interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_LOW>;
>   		clocks = <&infracfg CLK_INFRA_GCE>;
>   		clock-names = "gce";
> -		#mbox-cells = <3>;
> +		#mbox-cells = <2>;
>   	};
>   
>   Example for a client device:
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
