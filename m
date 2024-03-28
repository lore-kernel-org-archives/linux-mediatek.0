Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161DBC54E64
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 08:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZ+YBLkNV6VEF2rUgGOJxYuEYM/uMvvAYGZ9fwfCJXw=; b=dbqQQS0hzR7NjZ/wmHPgggi3cH
	DgKmxIuBKS4eAmPgV+VEWYAGpv+FHOz7hUbVDkxawds0MFmYB+6sdMD7bS/DESXQDmYU/+ns7mqUF
	5htUtj2e5bewvwzgC5MAQSrN26aQDOej78znTJggbpJlpWfYUR7YdfKYjp14k+pg4fxDIopzHdLAe
	Wo9YgU1lylOMs1HzAa6mdpfktj69OOv/FCIHsdghEfk3GWzR31XGwPN3yeXBe5IgCrpPMPy3rz+rC
	9EMIj7SwsAysjI0hE+JDIXgZt0WnUncg+G7QBDVAUtwTjGi1aQLmfClD1m9+52oc1TV/lrQ2VklMh
	78Kb4AEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rplT5-0000000D9cU-1HEH;
	Thu, 28 Mar 2024 08:50:39 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rplSr-0000000D9Z0-2cop
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Mar 2024 08:50:37 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-33ed4dd8659so1134221f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Mar 2024 01:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711615819; x=1712220619; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oZ+YBLkNV6VEF2rUgGOJxYuEYM/uMvvAYGZ9fwfCJXw=;
        b=B0NUhjxgVybjdFbdxPKbOlamMN2BuZPQs2S5HNzqB5Cxn916M4mOyyFbuhwqucj0/X
         v3eI0cFjfddnJ8CV6/GwnlUDaxtasOoYkbI/OSQ+OQ8mFpCpfXybyqAqpytMVqYE9+Sr
         IHkj5SGDTHiAnha6fabQggqu4O+Dv3P3RIjMHIXwhMIlL7XdyhtKBBpmK9LdLJdPwsWx
         eqcsXFowG/scBYt5tML0+KOUFiWDQMslislxyAaaMube3Hh08XAUQkDeGXYgvvROlwDS
         SP5OVI1+gdtD1D8hEUojVqlXBbqi2ESVi4fupRbku/zCpq5XkmlsuenH0z/xQ+NtUNHy
         YFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711615819; x=1712220619;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZ+YBLkNV6VEF2rUgGOJxYuEYM/uMvvAYGZ9fwfCJXw=;
        b=NK9biixj5fMStxzbemavz9qzPGJn8RspaXf1lY8oNCPKRSUDmwA6fUK8sKM8zedtO/
         TyltITNMaHzuJVxsHtvcB0VFC8dCfTm9kGwGUBS5Yx9mz9luwz+8jjOyG4VCSCFu70U4
         gmUXALMMj2bu3FUcq1VPY4l5L/U5jpgTaxj1j2h8t7YVFnqYBapYmSHeu7vlxaQOLG6j
         wysyj/Lg5mFUWLcfdH36CrkUaZYMvLzzHz+6Q+4t1XN+Ze7u1IQmeGyygy4CdfgoyZBX
         DNYVCJt1OTZ8pVEZB62JLMTIA8zZFswvxK1FLbGEfq1jiXTEAY2zXXCoRKuT8aFJqXag
         ksKA==
X-Forwarded-Encrypted: i=1; AJvYcCW0Hqugrh48YLIjeO3a0MDb/5oUD4/7RM+A7HsNQJFO86sUR6DLRUvNT9j0wTk5zK//iZh4k+5zxEAVICDZaqsDqTQrTg7k9oMKjn1K9Ad1vEdA
X-Gm-Message-State: AOJu0Yw+zU4YTMj9bK4Decy35/oLkfwpSj6zJTxI/KgaDbcoa7z9eY+a
	v/Q7SGPaJOq3HUQXxeVSHoUv0gEdB8bjPVR03F+DW0prB25hM6JbUzWn6oApXfo=
X-Google-Smtp-Source: AGHT+IHtezabxk0LaPOL3zQ45H75rf+nCNsKrfQeSAmSXeRy5hUrXy9WJyMTcEop3ixcKCztrypIPg==
X-Received: by 2002:a5d:540b:0:b0:341:a63c:58bc with SMTP id g11-20020a5d540b000000b00341a63c58bcmr1177900wrv.2.1711615818960;
        Thu, 28 Mar 2024 01:50:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.148])
        by smtp.gmail.com with ESMTPSA id dv10-20020a0560000d8a00b00341ce1b64f0sm1156645wrb.17.2024.03.28.01.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 01:50:18 -0700 (PDT)
Message-ID: <ace20109-fc4e-43f6-b82b-2ae7c2905b99@linaro.org>
Date: Thu, 28 Mar 2024 09:50:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add board-id support for multiple DT selection
To: Amrit Anand <quic_amrianan@quicinc.com>, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel@quicinc.com, peter.griffin@linaro.org,
 caleb.connolly@linaro.org, linux-riscv@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-mediatek@lists.infradead.org
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_015035_071805_D41D83B2 
X-CRM114-Status: GOOD (  15.44  )
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

On 14/03/2024 13:11, Amrit Anand wrote:
> The software packages are shipped with multiple device tree blobs supporting
> multiple boards. For instance, suppose we have 3 SoC, each with 4 boards supported,
> along with 2 PMIC support for each case which would lead to total of 24 DTB files.
> Along with these configurations, OEMs may also add certain additional board variants.
> Hence, a mechanism is required to pick the correct DTB for the board on which the
> software package is deployed. Introduce a unique property for adding board identifiers
> to device trees. Here, board-id property provides a mechanism for Qualcomm based
> bootloaders to select the appropriate DTB.
> 
> Isn't that what the compatible property is for?
> -----------------------------------------------
> The compatible property can be used for board matching, but requires
> bootloaders and/or firmware to maintain a database of possible strings
> to match against or have complex compatible string parsing and matching.
> Compatible string matching becomes complicated when there are multiple
> versions of the same board. It becomes difficult for the device tree
> selection mechanism to recognize the right DTB to pick, with minor
> differences in compatible strings.
> 
> The solution proposed here is simpler to implement and doesn't require the need
> to update bootloader for every new board.

One of the concerns you got in v1 was: show us second user, so I believe
in your interest is to Cc other platform maintainers which could support
this idea.

Best regards,
Krzysztof


