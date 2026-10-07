Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E202CA5FFC
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2026 00:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAIWhhMv3PYHKISI/ix1jVDueQPVFVtzNluL37GORz0=; b=QCOZbn8nV/Eo9EI3oWkBG9mhPI
	9UhKw2GnG6O0YYk35cQa8NYKCxDFhoUDdwri6MYqkHm8WOyYewDevz+YTpP+Xz9KSrKWLckMUdCd5
	lhCYC/moQcbY2UUbxGmO3kQEImBhYL619a78dlz4gTquz+7jlNL3IdLaNPqLGF/TRU6qpw5RAqgih
	kU6R9BKRONqbieYEzSt86/C2vvE/yJGqijJDLzdsCVDszeVWM+99gEvUfLZM4Om/4rkZyevayOZfz
	z8djg5rG195btr5BVlUwQqpP0Pg4nivyA8627wkba6Sn2eHCtP1CMErpLn1v2I9IHRtbRYmCrFwWt
	C+SAXjvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEFy6-00000001YXP-2NS3;
	Wed, 07 Oct 2026 00:57:14 +0000
Received: from mail-oo2-x06.google.com ([2607:f8b0:4864:31::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEFy4-00000001YWa-0f6f
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Oct 2026 00:57:13 +0000
Received: by mail-oo2-x06.google.com with SMTP id 46e09a7af769-8216bf5eb5eso1685335a34.1
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Oct 2026 17:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791334631; x=1791939431; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAIWhhMv3PYHKISI/ix1jVDueQPVFVtzNluL37GORz0=;
        b=XuNIMB6M5SnkcX87dy7AKkGh7r7p2uN5RAsOwYH5B/dnnLyZ50q8kb0/QI4vJLAp4T
         u181fqwzqybAmj6QGW1Unw43M/UwfX9/4WgqQooke/GmHTG/Dlm5Q/LFXJIWcQ/VELCA
         ttGR7gcMkI6rClxDJm0GF5nyxqaCgIIeH1286z5WuhzCOWD9JbYuM8C5Nba4T8uqHIKP
         jZzjl/hZzyVQ8zx6EIsXgR4h3bcF1xdFwLLbNSNKmP79XLJkLZ9p80zF9g99lVLfLtKX
         KTPzzCV2ADW5m5PsgQYucncIzQdscBGQP4z7/E4ioQ2R9wpmDt1/Zgdk0kGcMIZlnF/z
         MkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791334631; x=1791939431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAIWhhMv3PYHKISI/ix1jVDueQPVFVtzNluL37GORz0=;
        b=j9uArJxQmwJxhvdXxiQcGzJd9T37ZAOmoy343gJYWc4Q9voQq7M1DEtm/5+Kdgrib4
         G0hxIZKu8FEiT67hXRsgNL5mA/5jEI2uN8Yt+NSgljfEz3NhpCn0inKd2ZjzL9I2tYjQ
         fofQteWv671goCzGyhbW7sM/4XyTX6elE+gPwt+D/SHInXetvAnXJj1LQapenpu6yi67
         8aDvGk5GIYy6RdB7BY1V2S9FTFaQp2BwTbImr2NJ5iLc64CubOl8oDjj8gQcws8ewQaE
         COAHRwBSpsHUidm4bP7GEraCIPjT8YA6TuyNAuJDrgDjrKV49BncnJjkiNyh+J58pOqa
         +Bkw==
X-Forwarded-Encrypted: i=1; AKwUvBw46BemcqgcYmhIElyd3DZAla/y4Pj9pq6t5fpUR6ZAyrvPgoOD/l6AhAOAOoKbjG3g1QfYB5bEaxi6r2bSWg==@lists.infradead.org
X-Gm-Message-State: AFuF++lWOxXU1sr5NkjERODBAdauQ+QxWXEkoVRdPa5RcNKv458m8tdf
	FnX6Qy7yqEEa9aDGAnsGNJfHD6AN5/yQZhR8EG52VgVxsUcKGtcDhVuY
X-Gm-Gg: AYBFou1rGl6T4r96T9r0WEgFDJhDMN0Cb1v9Zuapeuy/+GwMFj12tkYwRLzG/JiVj4A
	DR3uP9899UuD24pJsD8A+5N1WGzNYdnqBNN+u9NvKGoAfDTBnc+61alutTtgHYv8WJMK6yVRKQ7
	H/igzFHEhd1Ygt7vRt6cfvYi42KrY8M5pRJps2vl6f1iMRmlENrp4nqOf/Y+Z+/fW170amAS0xx
	FpnMPrafo39xw5l8+IKRYSqYT/ktv5lyS7v0WoyS0XJK3IZKZYTDiBUnpDi16WKwaGriVqXzG5W
	CNP8nnPnf0NCO9COtSRONoVqm2L90A7fNEF/Nhuj0+sIJgdQf+6HBGgOBS90sjIixajHxCvunPu
	HxGzstekVOVj5JvzbHyhar6hC+kP/g+mPIf8g9fO6LcNpX8o7diEUOnBoThAG8xrCZVoSTY54OS
	zbf9c8Ja5nuhxLVs5F+5D1LRDPPI2sL6XT6+z7dZmKfB5Puj/oKgo3BolwAW4rvAhIBIazz0bP8
	Ho5+vB6kGMk2gAjeKx0zx7+GrZSugcrsOvVO188SuX4RFnpn1Om
X-Received: by 2002:a4a:e90d:0:b0:6dc:e1c3:b2d5 with SMTP id 006d021491bc7-6e7a913602amr915341eaf.75.1791334627605;
        Tue, 06 Oct 2026 17:57:07 -0700 (PDT)
Received: from ?IPV6:2600:100b:b034:8212:4cd5:c80f:ba72:80cb? ([2600:100b:b034:8212:4cd5:c80f:ba72:80cb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a25722e3d8sm1005183fac.15.2026.10.06.17.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 17:57:04 -0700 (PDT)
Message-ID: <d3d3e7b3-eb8b-456d-9a2c-116334e86c14@gmail.com>
Date: Tue, 6 Oct 2026 19:57:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Use a raw spinlock for the
 pinctrl regmap
To: Chen-Yu Tsai <wenst@chromium.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, mfd@lists.linux.dev
References: <20260929-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-v1-1-db92943f42cb@gmail.com>
 <20260930080609.dnK1-Uta@linutronix.de>
 <CAGXv+5FssQL3Go3VDFbLAT6HP12RS3U3OgxhYOeapzs64QTdUw@mail.gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <CAGXv+5FssQL3Go3VDFbLAT6HP12RS3U3OgxhYOeapzs64QTdUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_175712_220752_A4728E0E 
X-CRM114-Status: GOOD (  12.25  )
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

Hi Chen-Yu and Sebastian,

Thanks for looking at this.

On 9/30/26 3:17 AM, Chen-Yu Tsai wrote:
> The syscon node is the provider of the regmap. You need to fix it there,
> not duplicate it in the consumer.

Unless I'm misunderstanding, no driver binds to that node, so its regmap 
comes from the generic syscon code, and changing it there would affect 
every syscon. Lee, Arnd, Mark, would that be acceptable?

These are the options I see. Please let me know if there's a better one:

- Do what Sebastian suggested and make syscon use a raw spinlock, except 
when the node has a clock, since regmap-mmio calls clk_enable() under 
the lock. Off PREEMPT_RT, nothing changes. On RT the lock would no 
longer be preemptible for most syscons, including across bulk writes. 
Most syscon users that do bulk writes only write a few registers, but 
enabling the Amlogic G12A PCIe PLL writes a sequence with 40 us of 
udelay() under the lock.
- Have the pinctrl ioremap() the node a second time alongside syscon's 
mapping and read the input register (DIN) with readl(). That read is the 
only access the EINT code makes in raw context. This would go around the 
syscon, and it requires that DIN never be written in a multi-step 
sequence, which is currently the case.

I'd like to know the best approach before sending out a v2.

Best regards,
Ryan Brue

