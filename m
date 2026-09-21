Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276BBC982DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 00:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMAwtCxGCGY6D0JArwPVVoRyTsw+poPi/tmNRvMJqUI=; b=gYcD9RdhMqc+gfzi+MOIJMhMi8
	KKYYwlwBRFM+gWQwwigtMSAH8NNLskEFcAgUeTJ/QB2kCaYI0SfIxVIpcWmS2u8wfnUDPcTqYiHIy
	Z/ZPDMde8csGys067UEELr90Kl7oMg+NTESkl+x3a+edjGgooHiwWlDX1MNfpy6s2piaAmeN/BTvs
	+iBigx6MKE+uFjWT4n81QdS695SYl13NTaFGfhm2//9PA9xN6Xw5Lpi8fsZD30u4BHkZiM69s4zOx
	ntm52rgoGDxIJ2YWknu9tNmye6jMkjUKRWYbtQAVP9IlCvZi0dKVoALzbSLwNR/DIg7FDAJwpjQTs
	x2J536Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8RnX-00000000czx-0Dyt;
	Mon, 21 Sep 2026 00:22:19 +0000
Received: from mail-oi2-x09.google.com ([2607:f8b0:4864:32::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8RnU-00000000cyW-24tv
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Sep 2026 00:22:17 +0000
Received: by mail-oi2-x09.google.com with SMTP id 46e09a7af769-7f4e6693089so1015946a34.0
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Sep 2026 17:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789950134; x=1790554934; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bMAwtCxGCGY6D0JArwPVVoRyTsw+poPi/tmNRvMJqUI=;
        b=UcXnEOlon45zqYAvqQDzBUKJGtS+BtcaWaqcMLj7MtV4p7mc8m14XF55m7hgF9ZCST
         uavNIDPlU5YmTUEBpLpsKrx8Mv6BTdIENb4zC5IhREbgQ9j2C2AbMaRouBCWwM1bFcK4
         URl5X7HtLRKyhusxvkR0+RSaOrLcKMA0EQKlIaEBsneDh7KHu3n2cC6lxTUi8M4N3TdR
         mp97gYN/kDAim4yw8JXXW4sDnDvsFaiNRKICuCLhumcK45wJsnJdHpc6dqHKfHQ4bOZt
         Ka7mnE6LL75gNM+C/rU+kXbWxO+QF9LI81e7r3GfmU7Niytjqnv6rTxobu9Y4NeV2aOa
         g+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950134; x=1790554934;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMAwtCxGCGY6D0JArwPVVoRyTsw+poPi/tmNRvMJqUI=;
        b=FM4+ld5ajXqdGWvc/4Bdm5JU6bmcJRbmX+xdODmbWt2BMoilAEXStHCUIJ6jsr1n9J
         RHjh9NXOFxf/50TGmkNl75bnavSwNoRJsYITcBOKByl6hdQ2SCJxfqFUyZ7iTXQZKhu4
         zdlSXFF5ZR9ZSFq2puR/7v8fgRkBNxBPfXhmEGpQfjWXyrLof+JnwH2fav4pSNkCrXSV
         YHlwPTfwINPFwTyPnMQA02GZ1kr39Gs2wwJTGE/OUDn0o06Ml86V5AGcPvi/fJrFE0mT
         bq5pVC3C2aWPiGtGbLb8WKnWzp8rbvFB9FLYeIxbhmQah75HDlkY07zuD2gc/JVa+kTb
         xXsw==
X-Forwarded-Encrypted: i=1; AKwUvByUfp7N9zv6TUUtwilNxSclBojkNL1Aim4KVV0Uz/aofpeGvHru1GOHhGfvxemNPGM2vrBZXMzAdMZG6hQNhg==@lists.infradead.org
X-Gm-Message-State: AFuF++mLcI+BD9cryE9o91GW8+YNCKDNjiQXXcXUCI/sutgrZpnfdQtQ
	srEuMqqc459Ks4TXA3soHkbviVXLMSol/9BC+oPHhShmASSlbW7CqkufeMWh25GIsyQ=
X-Gm-Gg: AYBFou2XEDDziRU0MtYYf4v7E5jznvTDJQczMX2gHrtcY5/iZiqsIobMG6EXHpt4va8
	EYzKDzGHsWPMU1uqZ1t2/Hc7LTqmF+6H3krnf7FY184fjWeKFMxGvqx6o1rcHOTQOlDXP/JWdxA
	dqSxn5OXm0KltzJJGDHBVDK+pzWt2QKPGn9zukx4nINWtYi8ayID0mdRizO3JqK7K1lMvfe5+3f
	1je/hIKnlBXoMVv9QAxNCFc7kTn/e0SauDA2RZ02VUuA0sROpTOSHQMdQ1ke8dMJtbJxQvgd+em
	ltzTJ2MAAAbb9YPMvyVwr5svluEC1wRyfhgJ3SaX3I5TtuMUrPvlStEChw4Bygt/fSgRVvkHSU5
	r5pbFoYMqI9fxtV+3WwqVfSzjh74eOzE21RjY9kX6QYNmQnWo7GU5IjqHKMQtTFsWSYOFW42LRj
	y7vPVKy4o6F9fDPoN29JUKxD4gg/fz2dCCsEkTk96/b78zjmP/b3jjFriLd2ZVzNlqmCTT3GuP6
	udO9u9IoABbKbo=
X-Received: by 2002:a05:6820:1f04:b0:6c2:1018:3f7 with SMTP id 006d021491bc7-6ca9aa4245emr7824820eaf.23.1789950133885;
        Sun, 20 Sep 2026 17:22:13 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::2620? ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd34b3101esm7471632eaf.6.2026.09.20.17.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 17:22:12 -0700 (PDT)
Message-ID: <41503126-2f2b-4ac9-bb9a-610686be4729@gmail.com>
Date: Sun, 20 Sep 2026 19:22:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] iio: adc: add mt6397 PMIC AUXADC support
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
 <20260921001702.3a208780@jic23-hlaptop>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260921001702.3a208780@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_172216_544701_B501CB2B 
X-CRM114-Status: GOOD (  11.70  )
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

On 9/20/26 6:17 PM, Jonathan Cameron wrote:
> On Sun, 20 Sep 2026 00:31:50 -0500
> Ryan Brue <ryanbrue.dev@gmail.com> wrote:
>
>> The MediaTek mt6397 PMIC has a 10-bit AUXADC that nothing in-tree can
>> reach. On boards built around it that ADC is the only path to the battery:
>> the SoC's AUXADC is wired to board thermistors, and the charger ICs these
>> boards use have no ADC at all, so without it there is no pack voltage and
>> no state of charge.
> Hi Ryan,
>
> Please slow down between new versions.  Unless a maintainer is specifically
> asking for a quick turn around (sometimes happen very late in a series) at
> least a week is typical time to allow multiple reviews to come in
> and hence save on effort all round.
>
> Jonathan
Hi Jonathan,

Got it, thanks for being patient with me while I'm learning the kernel 
workflow. I'm sure you guys get a lot of newcomers not knowing the ins 
and outs. Won't happen again.

Best regards,
Ryan Brue

