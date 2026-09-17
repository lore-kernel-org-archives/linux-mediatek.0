Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1530C982D9
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2026 21:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhGqQvEgqcceDfwacv9AFFFJVljDY2FHfHQZ/xmKpow=; b=z1qL+mU/hCDYT+XE5H6efnzHDr
	OwOVe3N7OzXtoSsF/nQvQ3E/yQ4I3Mx6yM/q13GTk8HNWIbrR9vlkqN1RqWUI6QDo0gjHk/5WSB3A
	5koSSuTTi3O+vALUGsTPgaFRM4T7n+1oD1/E2QkEB57FYNaBmpTydEXgRWmGBhgp4KDJWx9Fqk2JM
	ugTdWYbuOJw6vtTv4/gtcaD/i44jR3MthgWaQh+RvaUwF+Ta0n10H+Jk/VWr8H0ZH5Q9zW24uGzSN
	6MQfotKkwQ72ILrJpIfoVaqCTyE3N8PH7GQs4KDd9JZ2/AZkZBeOweicM1okINO3w0p4uxN8heWQw
	6+uHwsKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JJl-0000000CX2Y-3KWX;
	Thu, 17 Sep 2026 21:06:53 +0000
Received: from mail-oi2-x09.google.com ([2607:f8b0:4864:32::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JJg-0000000CX17-0nuW
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Sep 2026 21:06:49 +0000
Received: by mail-oi2-x09.google.com with SMTP id 5614622812f47-4c9a4910efeso28300b6e.0
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Sep 2026 14:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789679207; x=1790284007; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UhGqQvEgqcceDfwacv9AFFFJVljDY2FHfHQZ/xmKpow=;
        b=XQBjpG2xlIw5XoJl+X3hppnP77QYyqPqGEP3jyZlfrep9FZ/gk/lnZq/uZzsm1FFxw
         LVlHC8Z7ntd53mEIZdl2fNWsmcDN/ZI1FLcIachwhZzR2xEIKTBYQsHUUmBfwCl1nAqi
         ad5AVo4wDYnhl5wPnFbXOOrelJsTMBbKc3bdydpUri4soslzuAGRToWwxYn8pgErVr/D
         Do2xV9RE9j+bLkG6BYif/5qkwFA2xpmHe8KdT0xuEQAQbFuZlXFhvF705pl3h15CrWD/
         LTy5uSX5DVZqLqbLO8rfW6e3PNzN5aZgYcwUrVyJbhnS/Hrrl557k+tPqfIhxKM3MTfN
         zlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679207; x=1790284007;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhGqQvEgqcceDfwacv9AFFFJVljDY2FHfHQZ/xmKpow=;
        b=LwTwY14m5y4ovEYz8wtwBDdBthjT94qV0woc3odBEgvhT3uGlk3SoTBYC3sGkx0ih8
         R3Y9Ybc+V6RlRcQ2FBa3a0pf/Zqla4jbJhQOKWrsh0IxR/CHFnlQGRm2yUxRmOc+YnVt
         /EXMGdCThNojYZ3KLFfwCyWNzyLTDQ80WAimffvyt2qLsqxaSHGMGiF+BksLOMWCDb8J
         uceKYrHwOnlWMtIPWFZ79+UnyKwvDTSsw33k8Pey9T2c/eZ24YyrnsdSkhVTNSZvMpiu
         SbFWVSgM0mXT/1jIDG6xeI4CAgUl65jCL2JNOVm52Wj5KV5ZkD92EFWU84iDyZkKpt/R
         rzag==
X-Forwarded-Encrypted: i=1; AKwUvBzVfoyENCo/kvJIFphTpP8ZnZgsEQVwRfC1E0Of6tQTOQhUmsgYeJy12cnE62Qj9M9J9mLeyMKJ6ezgW237oQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mqqJfBoxbiQzU4Xmen01ykgzPLnBYRv70xhDt4Wiiw8ElO9q0K
	W6eyLFNnw3GKYjjn5B2adZVWxvywKuAEw+kLg97ASXRooUH3Wezqqbwy
X-Gm-Gg: AYBFou1260KPaa0mJj9//QEBu2CJkERj6JUSD9GmaCn4K8VtzT5x92HpxUPy8ity8tb
	ClmD9K7STJl4Mq9GjENXiDYQq2V1vkVoIWahw3soUinNbFILYvjAGiD3TzaxDB546Fw0lV5iaFZ
	zGRLT0H2t8tfMhL0ZSMK5aLtyK19dZezZuJ8UfUrVTmGjr9f4TCLZ4nSsawSuvwXea8hcPN4fHp
	iNo3LXTjbQJaxBndeHMaxlm/cCX+bnh6v4okfhrMtfSzsM8Jz5ztM4TX8xBFPUzxrBJkCBumGcj
	sw4yX80en+WyhgH2+xLsnfNFe1nb4TpB44G338G/u99lZy03c2I9MKYqrmgUFwIXgkrgG3ZZ+nf
	B0mwK0OKknTeTqI81chCi8ghY0CqGJ6lrkREYef/S5YPncu9hdaRViwkZ/yjvNHblGgcQL982aJ
	Q3w3jXYtaTmbx3TqQqyiub1ZoMFo1Oy1YR5t+tzswoA/8syRmD/ixEcycWuQ97PwzOwjc8ylJSL
	HOLDtoMtCtUfYY=
X-Received: by 2002:a05:6808:c175:b0:49b:33c8:4b75 with SMTP id 5614622812f47-4ccf6a67699mr616748b6e.5.1789679207257;
        Thu, 17 Sep 2026 14:06:47 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6cd41d0asm3431836b6e.10.2026.09.17.14.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 14:06:45 -0700 (PDT)
Message-ID: <bc93ea43-0650-4a3f-919d-6e0272d24073@gmail.com>
Date: Thu, 17 Sep 2026 16:06:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
From: Ryan Brue <ryanbrue.dev@gmail.com>
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
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
 <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-2-d35d2ac3d6f0@gmail.com>
 <aqpnpT6hU5Z0s1TZ@ashevche-desk.local>
 <71a6ed12-f089-404a-85ec-546e03b4db3e@gmail.com>
Content-Language: en-US
In-Reply-To: <71a6ed12-f089-404a-85ec-546e03b4db3e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_140648_245151_C4D60FF9 
X-CRM114-Status: UNSURE (   6.67  )
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

On 9/17/26 4:01 PM, Ryan Brue wrote:
> On 9/16/26 4:55 AM, Andy Shevchenko wrote:
>> Why not add this device support into that driver?
> Please see [1].
>
My apologies for double-replying, I forgot my link here.

[1] 
https://lore.kernel.org/all/2d1b80f2-53f6-4ed6-81bf-e35c0a9efb26@gmail.com/

Best regards,
Ryan

