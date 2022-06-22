Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047CBC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 14:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdeSlF5fWHZ3xXKBzKY62W+xebc6UMKioDmTRwyUM5I=; b=ti7TBR1/J57iGh3fkiGlsHVs1x
	aq6yEyx6cTBQjsJx+IVoJrcRz4vTe4sYEoHbK8n8QlgdsmnOXmYCpvwZJnVuFR/zNJ4UVBBci4v5B
	IdUBMipcr12VRxgXj26KitJzNkhgP6re5mHM8LZG2dZGZC9y5m7VPx1v+DSWQfdSdYUJnqSe9MTXh
	8+f8RgoCGlVOUATG8AAPNolI7ck68S/7sj3Q/tQjpQVOnl3dNxDQIu9cxOq/agOpDc2tc1MRLew78
	vAc7BrrPq2fSCy5W4xgC+G+KZdztVnVDKiX3wyTK+FrpOpcsMfY7PowpgiQdeBX/CqNoWsYbskMI5
	p9KU1TcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o41B5-00Arxb-C4; Wed, 22 Jun 2022 14:17:55 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o41Ag-00Arnq-HW; Wed, 22 Jun 2022 14:17:34 +0000
Received: by mail-ej1-x631.google.com with SMTP id g25so34535954ejh.9;
        Wed, 22 Jun 2022 07:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=kdeSlF5fWHZ3xXKBzKY62W+xebc6UMKioDmTRwyUM5I=;
        b=a3an+DWnKpt2DOtE2474+dpyWuKuuqp8cZVdW/LNxjfmHudnzTYBQ5HGDjGCVHI6TK
         0YV0twS6tEDlqOqIbncsXYNFrMZheYXU4f45+TlMmfeFRtipFBJYAYol6gd35vXM8nm8
         21/TujgU7Bj63LzBSs/dwhtQvHlL2M4DHxSYsb7KjZ7DHD1uzVd5W8oG2CjyrrC4H6zK
         ZTkfw06DnQzzHhjH8Jo2zsf4rdcxpeHiMWlUbV0EVoxy112jL3kXMCHfFpAg6cax4NN0
         hlSZD8qc3NZfXs4/WV6vDg3bVSM1M5wUUL0THtu1GlnTBt8EHGQaDMMVy72ur6G1utWo
         AnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kdeSlF5fWHZ3xXKBzKY62W+xebc6UMKioDmTRwyUM5I=;
        b=ItJpvuH5FgnazzyB9ZHGWpfjpLdzYjTmLVZ8dYiHhevQO58VKqoZelIEoZDU+/1J87
         DwgNvo6eKi1V49uj2oqJeTzaj9Rb2Q8o17CkxWHFemFrNh2OP/FXNwxnj/xqrlKAaMrF
         p1O+PRjAEcxbLGf8InfaYsyWqvRdaPgTNhgKwaYnS+ou5xKreIsFfct8/aSGPUlnJIfM
         TX2edqY48CD6Yww77uftdn9fJEQuptx6+dyqLSNJHiYNn2Odu9IWsT2IO+bSK1WVtHE7
         ERzqb4gUhEKjjFx/a0zWXsT2sE7LjgHp6DYwxetuzoWFVs1Cai7Pj7x2x5qRdERR/Qvs
         tpSg==
X-Gm-Message-State: AJIora8KKvgSXLcPOIqkwYCOB4i/XNwVvOgneFuynpsTNywOcjGzYNLT
	KUaQJrpc58Rcp2xK/sUC75E=
X-Google-Smtp-Source: AGRyM1tzJAEA91jxTi42bg0jzLDgIiPpJr86EGq+c8M1jJUUBWaaiyXJ/8e9nNQgCTcL9ByigtTVdw==
X-Received: by 2002:a17:907:1c07:b0:711:c966:f02e with SMTP id nc7-20020a1709071c0700b00711c966f02emr3441603ejc.221.1655907446732;
        Wed, 22 Jun 2022 07:17:26 -0700 (PDT)
Received: from [192.168.0.16] ([37.223.148.38])
        by smtp.gmail.com with ESMTPSA id lb13-20020a170907784d00b006fe9ec4ba9esm9419558ejc.52.2022.06.22.07.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 07:17:25 -0700 (PDT)
Message-ID: <ec6b910e-01fd-94ef-945c-31d48b2d47f7@gmail.com>
Date: Wed, 22 Jun 2022 16:17:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] arm64: dts: mediatek: mt7622-rfb1: remove wrong gpio-keys
 property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220617232124.7022-1-krzysztof.kozlowski@linaro.org>
 <834af774-ecdd-1929-86eb-6a814c5d774c@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <834af774-ecdd-1929-86eb-6a814c5d774c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_071730_660621_BC0DFB28 
X-CRM114-Status: UNSURE (   9.83  )
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



On 18/06/2022 01:22, Krzysztof Kozlowski wrote:
> On 17/06/2022 16:21, Krzysztof Kozlowski wrote:
>> gpio-keys (regular, not polling) does not use "poll-interval" property.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Changes since v3:
>> 1. Correct commit msg (Matthias)
>> ---
> 
> Eh, jetlag hurts the brain. This should be [PATCH v4] in the subject.

No worries, applied now. Thanks!

> 
> 
> Best regards,
> Krzysztof

