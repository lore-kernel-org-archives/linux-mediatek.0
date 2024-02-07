Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4951DC4829C
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 14:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeaVh/lnio4gc/XMvIeYWIMuMXXG24LyCbi+Ce3p0Z4=; b=bZ5vzsu5ZzDTxg/XXHrxCEh2X8
	FcUdYPWiVBXUbFp73lQB8chkc+i8ztapwEhAxSi1GiA7VILHuFRb4Q+XHWHdzbi9nOO/+vOHW8cWd
	C1WUH8rve4zehbYmRGhMBYFs0a2KYTwN9GV2msXl33ABn5CboglWQHfZQgT1xZ7ZHM64iXECNwXKL
	l4g9WNkhzSNG/sVkBsZx6XONRLPlrumVGxDq/4vQeAj7WPX+kdfluLQuf8aeWYb3zG7urXr7/zaw9
	ZtkaVBCJp4c5xEbegM7K8btsOTn4/iCLnyIdVWeniFI3HV1MV8g+UEqwUSio9xL2WoaLhkBV14HI5
	A0cwM6LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjJW-0000000AzTg-0Efi;
	Wed, 07 Feb 2024 14:54:14 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjJE-0000000AzGE-0xmb;
	Wed, 07 Feb 2024 14:53:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-33b535c5d0fso84431f8f.0;
        Wed, 07 Feb 2024 06:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707317634; x=1707922434; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CeaVh/lnio4gc/XMvIeYWIMuMXXG24LyCbi+Ce3p0Z4=;
        b=BJWq0BLFBKLm31EWIiUXYU625ecdDI553/auZX1mzNiHMHEwbZQlkeECvy0KBMDsUw
         YRpQHko5roKnppxe8DLFCPd1Y+2u1JUgkEX0NpQ3c5DIQ+4eZXB2233tBxbm7/+FFh4v
         2AgkmlYGithj43OkPkYN27yPveKaGGfUWFFsdy9zbzzdDvEbojz1E8TiQGkJqPFEAjgg
         R0goF0ccIwwgzguF68iHgKDWFb87DD+LxBx17F+79uinuIaL9/SbvZZzBlS9AHiWbti6
         Ni2f2SVtGYb4js6N3onH7JSZA6LIgh3uOdeUHXZozWUer9wTo2ujcvrIXfumyjvUjtVC
         Xvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707317634; x=1707922434;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CeaVh/lnio4gc/XMvIeYWIMuMXXG24LyCbi+Ce3p0Z4=;
        b=AOT2di4vHlYEwRXvgJifRCpjjExaVncWFh3Xdb8VNJ+SxPdYFqQeeu9rf74B4eqvd1
         JpjOKp9ka3IWrt7DDQRNEHy6sjf73Hs3aFHLu0HaEWbDq6dfQEpn3je+nFtBlyCgC4NC
         JsyoEH1hkStqGG3pVzEW1klO/+hTUdSb+TFn6BSClvRlhPmALwLuAu1vc3o6rsOpyH1B
         dmGotlvka1dUCnC3m3107tT2Dt0M2TEul2j/w1Wm6kev6hKQi7ady0sJwFbD1KJhD3L3
         y1NQyOThfu5qRidIHZv2MpFhUCn4EWUtz9hMSZai+hcnlXH7c/nMVEN3vt2RMiXzQ+xU
         qn0Q==
X-Gm-Message-State: AOJu0YwZKOBuIGjFzMnUOymCUBFdlrGnCruZGo8D6zGCXE4MF7j3RQsE
	6sIYb3jGLH9tQ4gXPobOmH2jvIctavzey7JZuG8LORq4CuMIihZbCqCOY1bIGu8=
X-Google-Smtp-Source: AGHT+IEOQ9PUIelS9Up3Z2leC8+AjPwTxciDKQOF2tPtygDXxH5vKSWw8QMymkOzILSud2oeBvCkJQ==
X-Received: by 2002:a5d:4750:0:b0:33b:274e:af5 with SMTP id o16-20020a5d4750000000b0033b274e0af5mr4000326wrs.60.1707317633607;
        Wed, 07 Feb 2024 06:53:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwEZeTZpLOUCuBBjOuuCPiaDg4fx3wo4eteNjPkY7pPmbXE257RElKiqFaWqGh19r6WiTQa3bHalYEHnoIvIiGYfD/RlDE62gzy4HyBq0t/x4K3RQpaUhnYf09YWrLx6+WybBjC7djl4Ib+nYT5ONxyYhEdYu3bOJh5et5C6WVjfJMtWAj8evl2hKsTx4BRcBc2hsWSHT5Nz3Unz4l909q6KADPQcUo9fAc/cK3cPXlODGHtbLODwrBEwyzhVChRUmlowGgB+e03KOH79Uit/1qDWiv3eEIa97//6SOtKUdeknV0whWZzJukADZYzZFz7525mcQb2gUoqtfuekjW2cRRlAv7IvIYw/RYbJ0OEdNNbwb8ftux/4GnuQm4YRZ5RKGhFE1OxioSy76oqqL1uhGH+XoI6+4MC9NZyg5x6aGuHsZAl+0MwGi6m+CxqlE+BdKOMyVBMaGF4kH09pQsCXuIS9tTx9YnXP3CmgGN1Oi4WW+1+LLQ==
Received: from [192.168.0.101] (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.googlemail.com with ESMTPSA id d21-20020adfa415000000b0033b4fdea014sm1263624wra.92.2024.02.07.06.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 06:53:53 -0800 (PST)
Message-ID: <13e2f96c-2434-4266-8a5e-25b267d1fb0e@gmail.com>
Date: Wed, 7 Feb 2024 14:53:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] mt76: Remove redundant assignment to variable tidno
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240207131113.2450297-1-colin.i.king@gmail.com>
 <87il30h03n.fsf@kernel.org>
From: "Colin King (gmail)" <colin.i.king@gmail.com>
In-Reply-To: <87il30h03n.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_065356_369701_5B97EBE4 
X-CRM114-Status: UNSURE (   8.13  )
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

On 07/02/2024 13:31, Kalle Valo wrote:
> Colin Ian King <colin.i.king@gmail.com> writes:
> 
>> The variable tidno is being assigned a value that is not being read
>> and is being re-assigned a new value a few statements later.
>> The assignment is redundant and can be removed.
>>
>> Cleans up clang scan warning:
>> drivers/net/wireless/mediatek/mt76/agg-rx.c:125:5: warning: Value stored
>> to 'tidno' during its initialization is never read [deadcode.DeadStores]
>>
>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> "wifi:" missing from title.
> 
does this require a V2?

