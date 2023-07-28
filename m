Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFB4C001DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 17:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGAKrZWJMbIMB5ZiG1OyunTWaTeBfGr8940TFqx3V5w=; b=X+uCj6kiwh3ADvQuCFuDpq6Bu8
	HqCVx3E99vGvkdWiahTzpc2NpX+fV9AP4npG/kIWRiFZ3eoWdq6lkTAJsdCCOm6mteGS8HfUbvJgc
	YDAILjvxMPcgm/PrdPasmUvbpAhXGldkzXG0SLHGCEhZI26HwLNpOfkRp8rL6uJFvAirpI44Cu0BL
	FNhWkf1P1hF6GMGSSSqhXvdQR3jkOzLET4UujEqyf3KX+mLQ1c46lcDX53QZVHp/+owe6A4Er+hg/
	9M/NlqBMun5OaXC9p5Qua7CZoDUupLTgDF982XxRreCDESKknFDjam+ExgAjKJBaHQAEFIMrVEDiA
	kAFtEpVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPRXR-004Jha-0E;
	Fri, 28 Jul 2023 17:46:05 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPRXH-004JeF-0S;
	Fri, 28 Jul 2023 17:45:56 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso3953208e87.3;
        Fri, 28 Jul 2023 10:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690566353; x=1691171153;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nGAKrZWJMbIMB5ZiG1OyunTWaTeBfGr8940TFqx3V5w=;
        b=Tc/kauorT1NGAkKqKKQCiTRNQMlA7Z1TGVYChj6B2VSF1iDveTmEE/EA/ukWrgey6h
         IobJN6UnRZ4eS5OVpt5hXzZixOI7TSgrcgaRy2sTOnRknlGLXPXDZtRVjjDj5lU1JSJ6
         GDQjMd9nsUQGCV5V76klC/xxKZ010wUFy9gHt7ElGM1r0x7Nd2c4AUgc7Pvr5JCGW/vk
         NeIDH2Zyezq2nh/v/PkHD31xoDMoZMGMx7149O5aVP8IEd4i8vaXgnldWGyQ4Q8bARF5
         wsCRglxCkX5rKKn7wv61DS5Dfwf/j7F9vMs8rWy+StB7p/TRGONx9Mz4P5klkN8FWNFE
         hQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690566353; x=1691171153;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGAKrZWJMbIMB5ZiG1OyunTWaTeBfGr8940TFqx3V5w=;
        b=JslDwM6S5iz7vraFuB2pAZGNWAQ9Bx4uFD782V5MBsiOTNZ5HZ9Nr9myHu8J4JKF9o
         7fvCWG2HoZbyJLhYDsGQDDKY0wHqh5Gm1Tk8KneKoScEmZWrHTnGIMCRHRpuDpRQmlLM
         3p6QErt3GTl7Jr4JsX8xPoBSEcdc1cxzhhroSsOVyv6UuEXZh883a7rPNLS3ZQHsmON5
         QGlFGN21NH7N5TYNskFhauy9INR3QkkyQ8HnRmv/wFmhbRHZHwuV5YsG025whF0+jeKO
         Jd5SW8d9BrIifT7QqIcMRSO1xkbnWYJIFzuPE4EvNc8XYtvJfkl4c4DlRfnTit7j1OAO
         DvwA==
X-Gm-Message-State: ABy/qLZoDygSTlfs8xg7Cuy1yyc1TExQ8xxgiOYi6CC204/XuqeUR59I
	6ThiTxnJ7btqGbj+GS1BbSI=
X-Google-Smtp-Source: APBJJlFm8abjYm/4TWYtQIEydN7BWfBNVQ6mYEuZMyi0sxzGgDUZtGMrFZB/r3PFF68fzZLOJGnF3g==
X-Received: by 2002:a19:9111:0:b0:4fe:1b7a:dfc9 with SMTP id t17-20020a199111000000b004fe1b7adfc9mr2038566lfd.64.1690566352601;
        Fri, 28 Jul 2023 10:45:52 -0700 (PDT)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id f28-20020ac2533c000000b004fb96436ac7sm906991lfh.250.2023.07.28.10.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 10:45:52 -0700 (PDT)
Message-ID: <2fce9526-34c4-99ba-3dbe-9fa0ee2c0ed7@gmail.com>
Date: Fri, 28 Jul 2023 19:45:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] wifi: mt76: add support for providing eeprom in nvmem
 cells
Content-Language: en-US
To: Christian Marangi <ansuelsmth@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230708182936.24469-1-ansuelsmth@gmail.com>
 <20230708182936.24469-2-ansuelsmth@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20230708182936.24469-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_104555_178525_A37FC15D 
X-CRM114-Status: GOOD (  10.28  )
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

On 8.07.2023 20:29, Christian Marangi wrote:
> Add support for providing eeprom in nvmem cells by adding nvmem cell as
> an alternative source for mt76_get_of_eeprom().
> 
> Nvmem cells will follow standard nvmem cell definition and needs to be
> called 'eeprom' to be correctly identified.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Rafał Miłecki <rafal@milecki.pl>

