Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FCFC982CC
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 05:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qio30BBoJgNtCXMiZsiYGpqURN/Ug560k5Han0gxn+E=; b=NlKOe6LiArRh9dhOogJKACcbp7
	gEwjhUI5WoZ5GP7gofHaDBGWAISvI4g7x38mJPxhCxbnVmWTC5lkWxEZi4GG83MlrK0F/ZfYdL1LX
	ZDyS9V05daqPWJYWGgYtdMYEYcgUaiCobCFaIiIMasRBF0Cnx+6BqNZY1VCDoFev/OpgzPxx00wM6
	0CjCoribP0UWHuPjB3EP1ejOXAp/Dwv1k2IHL05YBHIBvLtE44KqHAn/2FVCrWwTx9p+QTr2y2Jsd
	1bS5mc4ClSB7jpV7ZiwN6tk4Lb3S6ctO9S2XIyh95xuyvwKogziv4cIe0642D9pQJU4vbRXEtb4Ga
	1nyZ2iBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89wF-0000000GvZJ-130i;
	Sun, 20 Sep 2026 05:18:07 +0000
Received: from mail-oi2-x08.google.com ([2607:f8b0:4864:32::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89wD-0000000GvYf-0tAO
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 05:18:06 +0000
Received: by mail-oi2-x08.google.com with SMTP id 46e09a7af769-8069d92e182so822002a34.0
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 22:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789881484; x=1790486284; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qio30BBoJgNtCXMiZsiYGpqURN/Ug560k5Han0gxn+E=;
        b=rKP4RDXrjoCdqFycgsPh8XTXPMDRjdD1ZfRnmyS4q/69xbSmCaIGVIaXK07T+UhS6R
         5bMNOEtBC6aiivNUIkHCCrXeI7I/WqIshk7WCc5J7yNbXH/f6JG9oMRJgcxRklXeFn8u
         0xv4rAA82I9lF2Asf6h8meiOndtL760LVr7ClxbsSQqJxfza50QWK6E193dh3qTseonV
         8ltJzI1EL+6Bdb9weyBEuZCNryhlyGuFqMoPREBrqT12BhImEnnWG/f29UI5M2E2Eq3S
         cJg6joyt7zaNWVNY8S3DPBq88zbLGgDp15L/uJhyxmLys93IKAar5j6X7lb8PI1WgbUb
         Izrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789881484; x=1790486284;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qio30BBoJgNtCXMiZsiYGpqURN/Ug560k5Han0gxn+E=;
        b=gRnM/+y91J6O/+vEKTg32ki3K4Ms2G/BvwNgq+pcG8LfkrHjxkAJjiB3b0kN8Tah/H
         g/aKyWUdNZMEj/9AKz2Sc54oAgrJAwzvvqMqE1QceiZEMKx87I4lVJJ3xzD0zAExBYoe
         x5m+5oBKTArEn72VKg2LNlMEvtNKX4ghzwjV65QkK2koGKLxZYPhY84mdMAabzKqpz7b
         1nMLfhJFXO2AIEdiBjATnV/6pVGxuV2ecOrWLraTbN0Vd7CfWCh6O+/dh+ITqJ4cbWYq
         YJ0nwlz0D/Cvy9zf0knWXpK2TsjrKDk0xiPj5SO/jqxOqRvQlm54/LOcZS9EawoahwXd
         cD0A==
X-Forwarded-Encrypted: i=1; AKwUvBy993rbppLszTmSjdx9mjMgzLGecCwvpk0DD7vyw2yq+QD9aUy9IPCmk2Kvpz6TK5b1fOybqqrM+83HbOw28Q==@lists.infradead.org
X-Gm-Message-State: AFuF++kewruph2LnIfXmLIMisiRGSUixN07iAGppsd+37NGwXtQC7IWJ
	PIFZKEOqwZDGyYYhmxQu+bSisAd/BVYzAkkCV+ZYUUj7AOQRIaDLrC3O
X-Gm-Gg: AYBFou1ENTfy74PRqq6xn5RiEPjXBCXe7CLLy9ByJ/H70lC6TKZlSroOeorvMZ0L8XM
	6OYN9nGgbwwnAbShbUpjEsABL+Z2aHYxKE94uy4kctWAcaBQbieprjPX3txu/BGZv/bZ/StE0Vw
	Ma0BZ80b9h2uJYKufuZ5vvhmTOJ8OuPtyu2rrIGOYdv40QFFCpbSiMsONXeAS634DRLtcvUtVvU
	29gFeEgDbhpOuyy2MtGH19ueXJXWQ0PK/0LDWQVYLylO0YQXYejrK80g86NmYUoZjrogNqJJHGl
	aDw7Uchu8NYakO2QmSeJ8B1Y0y2zxlLCBGD8ilEQuKFu7JDzjTXZTDCUmqySHoI/kaWd4N9DXs7
	x3tYBV+vXl4trWKQnF784ORq9QlDWnFCIAcP5I+X/bIA+1p/NJZAoSU4qI8Gugv7wKBsCp2Mh9V
	T3D18YjTQs1gGT/FyA+Uds2Qq2QInBHDalTmtpFQpg3y/CzbyBuPl0L4QXUM0wZQPIdINwDVxAJ
	iYs3kVJRaGHuU8=
X-Received: by 2002:a05:6820:2219:b0:6b1:2843:1312 with SMTP id 006d021491bc7-6ca972e90f2mr6018628eaf.0.1789881484271;
        Sat, 19 Sep 2026 22:18:04 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::2620? ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd320d5c30sm5494232eaf.2.2026.09.19.22.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 22:18:02 -0700 (PDT)
Message-ID: <1c1b2958-dbcc-4a8f-8d7f-d2eaaebc941b@gmail.com>
Date: Sun, 20 Sep 2026 00:18:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] iio: adc: add mt6397 PMIC AUXADC support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
 <aqzl29C_R4zwAnDK@ashevche-desk.local>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <aqzl29C_R4zwAnDK@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_221805_311902_A1002D5E 
X-CRM114-Status: UNSURE (   6.72  )
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

On 9/18/26 2:18 AM, Andy Shevchenko wrote:
>> Cc'd Luca.
> Instead of this, just put the real Cc: email tag here
> Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Done in v3.

Thank you!

Best regards,
Ryan Brue

