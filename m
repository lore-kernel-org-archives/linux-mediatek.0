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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAE9C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 11:11:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57F7A2075F
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 11:11:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EWucz+1o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnWpPtrt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57F7A2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Y5jIwgGhieqn2Md6o6vS5OFa+G3K7OvdvuLH8IcME8=; b=EWucz+1omuGSD8rWscXEdl0Go
	athk4DSRk6FQMl+YJVk+f8qNj8MSW/PhYqSKc9nYu84WpseidrrP5UpNYjQvpfkxcihyRWxZgXKM8
	ikwI5uuNQN2Ea+oYlhVQh5i8cVnl8YHeRq4+BmfYH9hE+9L12NziQ6rPFoL7j4az18SbycgWAs/kV
	q04wuvuKk4HXFjZ5lSwEn9XoolPcBEsnkNQJUv6K4vMzQPGnoVw4hNULAwltYgv1NObSjvONSaafi
	2ajm8W2cDgZguzl1UDEGiJHZRi1uoayqMgSFnhzHjucVAnUriZMQKpzbpo6ccI7PKxVZ8Bi2g9Z9i
	seWlNaejQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k16TO-0002q4-DS; Thu, 30 Jul 2020 11:11:42 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k16TJ-0002oe-1Q; Thu, 30 Jul 2020 11:11:37 +0000
Received: by mail-wr1-x441.google.com with SMTP id f7so24526656wrw.1;
 Thu, 30 Jul 2020 04:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+0iowu5xEfPH7yjXvVBsR1zC3LFBJmoKMH8nuby/sFI=;
 b=GnWpPtrtvLFQrIvPWKQ3x+hLmZQOnsGb2mOxnHtZf+3PKUEyAfUB5sGJImtjtbm6zr
 6U7vMKvKE8VRMhaUPT21A8bglTvJzmBmah7MqtoF++11LRRhCoBBb5x34ABeYLAMKzZ/
 OigG88mHCVRGTHXayDVGS9o/pj9cJ2lAIwo07rR5IKKqA4VngkOVFIF10/p8Cqacdqkr
 IpPvHvvn9RQw5Tsa9iWA4HmvopcWpjmM78H1r6/YC4xXCoz81udYkQez3cJyW71F/2Cs
 JsS9s+UcdTmDDXnmvtlDzykh+mw+4DO06ELW/mExH6HTUqulWglC73UdJvjMY+ui9Hfn
 nsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+0iowu5xEfPH7yjXvVBsR1zC3LFBJmoKMH8nuby/sFI=;
 b=EMJ/v/Ry2pgVMsq++b6MCn5scDFqnLgkAoA5MYzK99GfyJmcsaaaHRFIppEdMIRCwL
 Uv67SCIkOg3ur1EtiuKawENAveFFubxPqRFnbJnSmIXpAzFSD/Kzpw05GhC3NunM6LrZ
 kV7iITHn4vHqNUXYTHJP5hPfC9W0duj0EpAtopaxBKudPbSJGErjrRojMCwkVaqkFKDT
 LeBmUDybGVWIIsJ1s0Wxq+XP6Nrx2zj1OGomWzsI4cddwBrDswkPJzYi83RLLUiJmg7E
 RibXT1T6av5N8SSqQ6DfnY1rHUUste4jKmRqcR75gbeV1/KG4fs7LgtUSlCQHch7Jb17
 jfrQ==
X-Gm-Message-State: AOAM5312m0E3t7BTvt5kuhYiwBkUtijFa9MmwkyvvDgVMy3qm9t86+ou
 RrcGJkqhmoR21axGQBE9D5E=
X-Google-Smtp-Source: ABdhPJyzrCbW0TufxlUf4YkPb0Dtc3clPloAllLT6W6ASv6ufOJZ4JIRJvQHLXGZ3Q5JjOxz3dalBg==
X-Received: by 2002:a5d:48c8:: with SMTP id p8mr2265618wrs.84.1596107495864;
 Thu, 30 Jul 2020 04:11:35 -0700 (PDT)
Received: from ziggy.stardust (81.172.57.81.dyn.user.ono.com. [81.172.57.81])
 by smtp.gmail.com with ESMTPSA id
 z8sm8387862wmf.42.2020.07.30.04.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 04:11:35 -0700 (PDT)
Subject: Re: [v3,1/5] dt-binding: mediatek: watchdog: fix the description of
 compatible
To: Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
 robh+dt@kernel.org
References: <1596104510-11113-1-git-send-email-crystal.guo@mediatek.com>
 <1596104510-11113-2-git-send-email-crystal.guo@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <2fca091d-4889-2564-0fe0-927093929f10@gmail.com>
Date: Thu, 30 Jul 2020 13:11:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596104510-11113-2-git-send-email-crystal.guo@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_071137_118497_B90DFAA0 
X-CRM114-Status: GOOD (  17.99  )
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
> Besides watchdog, mt2712 and nt8183 also provide sub-system software
> reset features. But mt6589 not support this feature
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>

My proposal for the commit message:

"The watchdog driver for MT2712 and MT8183 relies on DT data, so the fallback 
compatible MT6589 won't work."

With that or anything like that:

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 4dd36bd..45eedc2 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -4,13 +4,13 @@ Required properties:
>   
>   - compatible should contain:
>   	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
> -	"mediatek,mt2712-wdt", "mediatek,mt6589-wdt": for MT2712
> +	"mediatek,mt2712-wdt": for MT2712
>   	"mediatek,mt6589-wdt": for MT6589
>   	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
>   	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
>   	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
>   	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> -	"mediatek,mt8183-wdt", "mediatek,mt6589-wdt": for MT8183
> +	"mediatek,mt8183-wdt": for MT8183
>   	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>   
>   - reg : Specifies base physical address and size of the registers.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
