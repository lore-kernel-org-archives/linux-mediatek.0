Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0483C88E63
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Sep 2026 17:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AE5k/kG8YJbF9+P0eXSyvzyutUhB0PHETgWhH6QKTKQ=; b=t6uEcnVQCz5Ck8O5lv1G5Z2w4s
	SMzm4zFkI6cj4DXnWm0ZjlgfQdqFATN/BbmxiZ0kt1FothrCmmlZaBVxpAg1LIDZeUYiOp70Ibdz6
	zhAZX62czR5l6WCzVy3/o+tiqBDEt/HwT9a15SFUVZd1z1/8gp9W/9Lue8o0ek4bdUrIh9WKAYcO3
	J2cK3JVDmDBlaRQQwGGrB3EzSXi0fZlDFukDiSl8lRDMXmpjY3Jing1N25oUOWHsEbFMulI3+vAOW
	Tz9XNxg0+7H4nLK+HzZaiAcwXhCrt+1fP2T1M0r3sDDmVng2VpWquKhHWt9eEIQFMdVkR6uHfhDLK
	ZgPl9QDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5nvn-00000001rDw-0IQ0;
	Sun, 13 Sep 2026 17:23:55 +0000
Received: from mail-oa2-x01.google.com ([2607:f8b0:4864:30::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5nvk-00000001rDJ-06Ap
	for linux-mediatek@lists.infradead.org;
	Sun, 13 Sep 2026 17:23:53 +0000
Received: by mail-oa2-x01.google.com with SMTP id 586e51a60fabf-448a12ddfb4so1181658fac.1
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Sep 2026 10:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789320230; x=1789925030; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AE5k/kG8YJbF9+P0eXSyvzyutUhB0PHETgWhH6QKTKQ=;
        b=lmw7ojvqkUGKLO7+le59GUrq1pqBv74lu7zo42JMv4xIykd7U6k2p+EAujPRdrjqkT
         FLRz5jCQDF+hYF9TQu3QWJT6NDvxNqLAZc0h1bNXnmfUOMfqmQcsLwfT8XkjO8y0W0i9
         q24DXIZwgCDA/A2M9ISRRE879LNOpM1JRo7XsD81RFYVcsKwN3gqUmSv+l4xkaLEPEtU
         9668qPeZfVSL3O4zJ8ebwxAitODYsyzDIRgd/wRzVjO46A6MitTmDl72xnVVwcjUB8lb
         Nz41S8Yd3Bql0j55Gq8KKvn10JXyPfyMlF1EzT+H71t85g9sR9+Hyt99Ha5Xuv+6fc9/
         5Ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789320230; x=1789925030;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AE5k/kG8YJbF9+P0eXSyvzyutUhB0PHETgWhH6QKTKQ=;
        b=MnGNUr8engejbdJhObzjgThu4ZI3zgtUXGp/dkC77n4kC/z0U7a+pjQ7QAcUmVXerw
         ZspYjZiljPAN+0kdEjc9be4oc9ujjJEyTr4KwkqU8geHoGCtDwKd0NTdwwkYA8E3UFQF
         5pLmZLkvFysew+TRBD+kcCCCG3p0c3LjyTmAEf8pTHQd4kOIfzd9IB4HDuu+RpqtIIqW
         1Db+2vKILeDCPzYsJbVgNePSEOqhSnsjnQ+sYBxg+wwQRYNIbX63dcisAoo7kgCox2+w
         2hUu83I4dP/c4Tii7Z6dAuCDYUcam0xnhXqSKPLB5TWj4E01KJhGIf+QzUmlbnUihFJa
         M6Eg==
X-Forwarded-Encrypted: i=1; AKwUvBxmgtR5I5mmNs4dVqhjcEncEO9FdCXXaqu+yTcndygNm7KGO9kXLpr1eJC8Jj6qhuLVSatqt0RdwpIUTH4oPQ==@lists.infradead.org
X-Gm-Message-State: AFuF++l/b3mnLqLCeLMuBiQ5erTSnzksRY7Wm03c0wYJEu1oRpwC9WDX
	GDCre+oDkaRVAggjCICPiHrvie7aBHTuamru0mR347NgN0XRTClZSA8r
X-Gm-Gg: AYBFou36xi6nfDOPtLOpvGbzxK2jb7f0zasp1d5HW9EJQEQsiwPrA0cEuN0uQZw+pvA
	75RqlvThc4xkmKCBOgiccyoPzOB7bZarBVqC5zfafsELl9QnBXWAtIMjKMoLUm7LSCrhG4xV3QK
	lRa0s4CUMDDQRhmInM9UrScIGIOt6A0rkKydwvY3ET5Lzs+R4CXKXt/GSOttT+O24xCYem46AdS
	txq/d9AXceOAjYqJn1ON1jEAQVcNObDM+ehQQGeSsT/lo6f9cVpWYZHz8FQpFwzn0rt+Mhs8Hie
	KzbYYjpZ0jgz9N2+0NnrC7IXPFiPWOJ1X/xh0qJRq5N8hQjJJVXeLRzUBzMI2V5mCQ8G0qBLfyV
	KRpuPYChZ/PaZtgnYF/mpO0CisJDU28TIOEP/0Kj1XevLVY4wLcla5Fc5hV/s4EQU3ve9NY/+Fk
	Xucx5curXATCOpZ1cVVabKbZZUSUzLqmBz8KtgJlhSW8D8aUNVdfufFG63yqW2ZThdvXkAune2J
	eWhrd7jpiCxvIJp
X-Received: by 2002:a05:6820:3411:10b0:6ba:5d2e:cdbc with SMTP id 006d021491bc7-6c0b9d4e352mr11117155eaf.7.1789320230280;
        Sun, 13 Sep 2026 10:23:50 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8bc8884sm6899818fac.10.2026.09.13.10.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 10:23:48 -0700 (PDT)
Message-ID: <2ac704f5-40e5-4212-8b16-6b23912ef4b8@gmail.com>
Date: Sun, 13 Sep 2026 12:23:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Novatek NT51021 DSI panel IC driver
To: Nickolay Goppen <setotau@mainlining.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_102352_088694_98405D3F 
X-CRM114-Status: UNSURE (   7.43  )
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

Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # Amazon Fire HD 10 
(2017), boe,tv101wum-nm0

On the CABC teardown for the nm0 variant that Sashiko found: the write 
is a single DSI generic command to the panel IC just before it is 
powered off, so there is nothing on I2C for it to collide with (the 
LP8557 backlight is a different device and is already off by then). On 
the Fire HD 10 the full disable/unprepare then prepare/enable path runs 
on every DPMS cycle and system suspend, and the panel comes back cleanly 
every time. Skipping the call for variants that never turn CABC on would 
be tidier, though, and I am fine either way; I'll let it be your call 
Nickolay. Thanks for pulling in my patches!

