Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C5AC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:59:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81D6260234
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81D6260234
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9yv5nNFx6DadhFTMJC74QKnb/sXFCk+kbUonzuvhf+8=; b=tb4yIoUVNSDYzTBXbKz4EPz7+7
	B/meGP97QuWhqWKkOYhw2KG95hAWjiavFzoOUMsYRURARqlbcA+hO7dWy2YCe3+iyDgk5PYJ1+Z/b
	HlqBP277hJJt/v+sel4zgWomAZn36aPYGcDgozKKZsfO8yfBZ2C8utkYo8tS9PyYlFi3rb1g3tjy2
	6gOnmaSeXgEtpUvQI5ut5jfmtllFjTC4vIESYCW85GqwC3IGXNIUr1kKm2/F/9H02HT0g8gP7DaXq
	ua6hamGr/hdHPRIwazE93fUROYFW5BrqbAXG/X4cnnosbfF73DS1a1NjQ6g3EGjhBWQcF8RN1ijBm
	Sidik1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDNb9-003CGA-5n; Tue, 10 Aug 2021 08:58:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDNb5-003CFC-MY; Tue, 10 Aug 2021 08:58:57 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 k5-20020a05600c1c85b02902e699a4d20cso1977108wms.2; 
 Tue, 10 Aug 2021 01:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DZGtTjtzuONYDWQ02eZzQw+Y6sEYh4NUv+medlIAmQg=;
 b=egqehrq7CkJ97r5UIn8xQu8mS1JgYuuTIE88Yr6sIQfBuwd2f3cHYoXKMX5k8AeOXT
 zcUZLaJ8nM2QHotO5d3amELtbpr5YHHBnRivUmGei8ob2B0yF/kE17hSgB2+UeCPt6bs
 /XBwAilgaoeOgcZS/M1mzAMCszKBTxDuu7jvE5qEuROo0PihhQjFwWlKxFcDxcAkBClU
 KgEZC/o1yeHBeQM70+arvJSHFwDSSWfSN9IeCCFzfSo5s+/YISjacxmz6WTxzGtZVAa/
 ULKKC+SUT3ZMYXSc2AErLxggUjsNYlYgQ4kQoukWF3kc35qWCOX0ClymcFvgI76KgaXI
 hCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DZGtTjtzuONYDWQ02eZzQw+Y6sEYh4NUv+medlIAmQg=;
 b=srNCltYcgsziglwrRTzY840SoCORX6Mgs0OuZ6rCoD2S0+G7TOAjBi9m0/Oohvq+zC
 3zS+mcO2bVRvhOO2alui0unUKfRyZ8l/1Hp0sAVa7+t5sFv56asFH9IDKHCTNqpyvrVZ
 Vt2hAeUsfMbSgZUW/3zhGgwcBRFbqLQDlLrY1YBXTKDSaa2pfW9X/8EWUhtYzCoL7ZbP
 JE5Cgl5Wy6XJb+PfhI4glA6bkCZQzpjyXsf0nHnvyIHarPdxc3mz5am0XjQZ4Iy6EYWv
 EkMcCXJvyB/k4C9oixnfaxn6wgap3j0sETv17AbCRSFLfLxGEuujf0V4vQCxj2iKwJuQ
 jCOg==
X-Gm-Message-State: AOAM533QOJT/Ifos3sT1lQi5vrM+8/QyRVl8keWoe8FqfgKKs7uVWsmg
 KyNfUQIT1gY6/tQnHmiemWA=
X-Google-Smtp-Source: ABdhPJzPEKr39AcsB3Lagut2U7pslSZe1FaUFeq/Uoj2qWkA8L7OvGIH6bMmf40+xCTrTTMonQ/omQ==
X-Received: by 2002:a1c:1904:: with SMTP id 4mr15181735wmz.93.1628585934443;
 Tue, 10 Aug 2021 01:58:54 -0700 (PDT)
Received: from ziggy.stardust ([207.188.163.204])
 by smtp.gmail.com with ESMTPSA id o17sm22127178wrw.17.2021.08.10.01.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 01:58:54 -0700 (PDT)
Subject: Re: Aw: [PATCH v8, 2/2] soc: mediatek: mmsys: Add mt8192 mmsys
 routing table
To: Frank Wunderlich <frank-w@public-files.de>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <1627894773-23872-1-git-send-email-yongqiang.niu@mediatek.com>
 <1627894773-23872-3-git-send-email-yongqiang.niu@mediatek.com>
 <trinity-a5eeacb8-1625-4111-b613-19ee1609b902-1628062221917@3c-app-gmx-bap67>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a09da534-274d-3eaf-6c4d-eb2a4817626b@gmail.com>
Date: Tue, 10 Aug 2021 10:58:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <trinity-a5eeacb8-1625-4111-b613-19ee1609b902-1628062221917@3c-app-gmx-bap67>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_015855_812117_579A8075 
X-CRM114-Status: GOOD (  13.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 04/08/2021 09:30, Frank Wunderlich wrote:
> Hi
> 
> can you please test if your device still work after applying this
> 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20210729070549.5514-1-linux@fw-web.de/
> 
> and
> 
> duplicate value constants in your routes?
> 
> e.g. changing
> 
> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +		MT8192_DISP_OVL0_2L_MOUT_EN, MT8192_OVL0_MOUT_EN_DISP_RDMA0,
> 
> to
> 
> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +		MT8192_DISP_OVL0_2L_MOUT_EN, MT8192_OVL0_MOUT_EN_DISP_RDMA0,
> +		MT8192_OVL0_MOUT_EN_DISP_RDMA0
> 
> regards Frank
> 

I did a fixup for that in v5.15-tmp/soc

Yongqiang, please test if this is working on the SoC.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
