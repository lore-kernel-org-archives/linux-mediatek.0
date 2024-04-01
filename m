Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375FBCD1283
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Apr 2024 04:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9P7DNDDewKZzJDm8kGzQZn2gBUwX7Mnh0jPmlVtXWrY=; b=nafUU7P3R/FSZshXpbFHy6rAbS
	FQLummmpSx9drg6vIVSV4LTtG324fqVdUH9ii1kUlo5HhNRQKgHlQUkb4jBxmlo41uBHoBw+a49Nd
	LEsTeJq8/Nb1bJ+K+IcrJ2PUt+iMIm9lBIRoiiEiB3K37ti4J9Tl9Cq84BA+5xfqLkasthdqYrYWL
	W3EBo/YG+CXs73NKNJaVryHvXuf/S0e9sLgk+05Y6EtcJ8yJN3iLtYMr2hher52ppiZaNVnaaIvSR
	rEwt6Zr5dIs7vyWsxhRI+gT/gVnENoNpNhcVnQYAMUuad/u9Tsr3KQ/6pIf2Km83nkV/ZopqJAW4n
	RXjWmzlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rr9c9-00000006uoQ-1nrZ;
	Mon, 01 Apr 2024 04:49:45 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rr9c6-00000006unw-0IoN;
	Mon, 01 Apr 2024 04:49:43 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-2218a0f55e1so2353417fac.1;
        Sun, 31 Mar 2024 21:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711946978; x=1712551778; darn=lists.infradead.org;
        h=content-transfer-encoding:from:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9P7DNDDewKZzJDm8kGzQZn2gBUwX7Mnh0jPmlVtXWrY=;
        b=KwTy245Of3S38aHHZvSRBXKWDmBNwXMxB4myX04vpnn/Hj4dmNqhtoB5ED4QmpPQGb
         ZeuZK5KcINw71kny2hugJMQbW2sNhuGxALJg7aHyhifNo3URw3AT04xUWDxglQUvPBXG
         +xf7+AguMEnR68If+OxHmRXnKmzRQDasWeL57O1lz3vkMx6eHHbLhYzet4KkNQnnXQWK
         bD5K1DcS7KcNIEiF+WYqlyxCaflMQaXahBPDq0jeQXRWAypfJLCQfIx4wseqp7lv8XwH
         sI6fpcFWgoucesJiNw0nXCdcPtrr1b4Mlcc9eN1sOLrZUwdO5ZF0qQ9Su+gGtE7g/u/c
         +QRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711946978; x=1712551778;
        h=content-transfer-encoding:from:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9P7DNDDewKZzJDm8kGzQZn2gBUwX7Mnh0jPmlVtXWrY=;
        b=cIrA7t2UH2xoqYtENwP6sgx9D9zAxN8so7xzoC7kzOVhLUONrsIUmjtE5RH5aYFgJI
         kaW0fE9IqMy1ts7rEwXHKAorTaJqTS0oZF47mdCIZqUnBLAgw7zIGimPPknumDUUwKfo
         VV3jWSnqR6DLOzdFNYNu1RjZPmf8MJygEFK1JJbZrCipVvuf9+u/SPanwW95m2/exFqN
         f39UyKDC/O0aWpQu09PqSDRdzKv5C2GdVTTscSIlEGWw3tyxalSR1jGO0lfpTE4ldV5i
         touPX9WTixQ3XYT6LaFJzn2oSmUru3sY2rTnoTXo2vDjoI91KMP/uctzCDAXVQt8eqPY
         /Sag==
X-Forwarded-Encrypted: i=1; AJvYcCXGKFp/FWi/P9VwElRXSEdnc2z6cFoRD2bFPyMUMaTKE5GFFMJ6lMcOr2LsovwAWRHAt8bSRGOnm8aiTA6VpO/H/7DMI0RNTfYkyMJPULQ22KqnPm7n+jiQYtGMaAbbR3tOpnVdj2m9zwoP1GtlbQAONxxpk7thsUg=
X-Gm-Message-State: AOJu0Yzf6YN76pLh5R9b5x4SPmp+DDT9fNrkKHeEihb4ZWHVdRzRg8hr
	3t2k5q16UPCjGXr27gOSLtdZ/Vnc0ZfVAanuCWTn9ydsyjexyd9n
X-Google-Smtp-Source: AGHT+IGMYFyjD1S0J/UlMasZQdb+LzfB19BFL7nbiO9VGTxLKWZM7nDChE1SjMsf1YPBvo7tIhAIfQ==
X-Received: by 2002:a05:6870:3912:b0:229:819a:d2e6 with SMTP id b18-20020a056870391200b00229819ad2e6mr9837827oap.15.1711946977956;
        Sun, 31 Mar 2024 21:49:37 -0700 (PDT)
Received: from [10.5.5.43] ([103.139.191.219])
        by smtp.gmail.com with ESMTPSA id fj42-20020a056a003a2a00b006eae2d9298esm5613056pfb.194.2024.03.31.21.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Mar 2024 21:49:37 -0700 (PDT)
Message-ID: <d4b0aa10-c2d3-4beb-98de-23ab929a0764@gmail.com>
Date: Mon, 1 Apr 2024 10:19:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: mt2701-wm8960: Convert to dtschema
Content-Language: en-US, ar-LB
To: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240401043505.40972-1-agarwala.kartik@gmail.com>
In-Reply-To: <20240401043505.40972-1-agarwala.kartik@gmail.com>
From: Kartik Agarwala <agarwala.kartik@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_214942_148864_AEEF78D6 
X-CRM114-Status: UNSURE (   6.05  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 4/1/24 10:05 AM, Kartik Agarwala wrote:
> Convert mt2701-wm890 bindings from text to dtschema. This is used by MediaTek mt77623a/n SoC.

Apologies for the typo, it should be mt7623a/n instead of mt77623a/n.

Regards,
Kartik Agarwala

