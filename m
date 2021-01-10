Return-Path: <SRS0=wO2S=GN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE51C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Jan 2021 19:03:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5E8D227BF
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Jan 2021 19:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5E8D227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NhDeHHvsaoaL/rRvQSP3+L5m+wQOLZuEQLD7qknRq/s=; b=Vm6PKH+tvOGlVm1eH7rI43iZi
	m1bm1ug10+6VWIe1aFJdTkBZKO9DuzQ/ki5ZlJuyOjdxAAJVAHTswl+jn9tn+5aKImdne62RppIDT
	QNKqOlYb9M/Aa/pBHAY7+TrfxY98uce7bsQDdLeNxFhz88A3hY9R27q24E7jBe9z+S0GsarqOJFAX
	FFwHto7gWbP7HAs+KkR6ImA4yZ7vO9JiJtkHGy+ehbQtnksie8Sxo3MsyMvsFUwyrSsN0hmc8KkKA
	Z/QjcL3wbl9AFV0MyLuFxn0XurnzN/dff/YHdWmJDADC35CM9/EPPYY/jyGKMFTKqCXIig8yZhHzu
	rMaJE38UQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyfzw-0005jR-K9; Sun, 10 Jan 2021 19:03:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyfzt-0005h8-R9; Sun, 10 Jan 2021 19:03:30 +0000
Received: by mail-wr1-x431.google.com with SMTP id q18so14254343wrn.1;
 Sun, 10 Jan 2021 11:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L8k5aeDhAQrJYcZuSR4844j89rsZ2Gq0oMvYHXzyAGY=;
 b=jk+uq0AiDRdiNEnkM7FW6/atgcpdxjIemHB7pOgGoyLVZ0TyvE0Ky380H+GQrDvACi
 bTgBBIKOCXKoNmMMgVUSvzK2jTUd8a9rwh5O2eLa+YCTAY0ZdeyEm+F+SZNmfLAFolGh
 XiMWEB4cZ7qbUOgmlUOiYS9gH2Hheh9ylNyag2DCJVfUfPQP7Yc2lobtc3Ih5UbKkYOB
 BLwWiAIBiXNGJ4hkROlBrb3ynv0LO9YXhK/CjnkUydGP3kgKWFDxrLLkIQEiqfGuJXpz
 CEKYNN7TCMra66BnaFLoGLi4YtL/Uaaqq40XlJeZTUw6v1tcY+EcBykhyLtz/UR+0khK
 qbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L8k5aeDhAQrJYcZuSR4844j89rsZ2Gq0oMvYHXzyAGY=;
 b=WHXDorqt/bRgKVNqhWrImmuWpAVzAZusD7YEvJPuh6Hxu5Tskr5XoZdI7Q9KVhsfom
 T1oxqwg1fhh10i5Lf1yNYaahmGMVCvTLTliMXogHsQTZH6yVdU7RRPeE1IkpKUe23IG8
 lESE+W7WNHHxfmWhB8B8JKHIfxke1l+bmNb9OLUOlef4MGQGFuxsn1BSI0pBlPBEDer6
 0s78JoKZNSv4QwTW4PcgSQXo9whTsZGt3lqUkTIsibdS2+8H/3S7fe690hJ3iR7RN8wn
 M9cfXPxeBSdipDLWGELJa3cbtAwJhfSP8saUdNBszbtewL+RLFRH+F0bHDTajIaWdknt
 rOUg==
X-Gm-Message-State: AOAM532m0q7Zwm61RxZKL8jD8H4j71WHnKNE77VXiXiFn9aPpnUFjLnx
 4nClwnqRWo+Nq0I2xHMVEv4ea7sX4rU=
X-Google-Smtp-Source: ABdhPJyi0WFtw4lD9yCsj0myeC2UeTnAxwmQG0VdV3WIw/TjKxtVrSCOUtB1BlOPHnP+Pbg8SsyF1Q==
X-Received: by 2002:adf:8b15:: with SMTP id n21mr12862781wra.426.1610305404770; 
 Sun, 10 Jan 2021 11:03:24 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:94a0:8ae1:f9f5:9c8e?
 ([2a01:110f:b59:fd00:94a0:8ae1:f9f5:9c8e])
 by smtp.gmail.com with ESMTPSA id b14sm21243092wrx.77.2021.01.10.11.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 11:03:24 -0800 (PST)
Subject: Re: [PATCH resend v13 5/5] leds: mt6360: Add LED driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <1608774440-21655-1-git-send-email-gene.chen.richtek@gmail.com>
 <1608774440-21655-6-git-send-email-gene.chen.richtek@gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <468f24b7-0b00-9d54-32b7-92355cf7b7fc@gmail.com>
Date: Sun, 10 Jan 2021 20:03:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1608774440-21655-6-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210110_140329_950817_EC25F82A 
X-CRM114-Status: GOOD (  11.20  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Gene,

On 12/24/20 2:47 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
> moonlight LED.
> 

You can carry my ack also for patches 4/5 and 5/5:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
