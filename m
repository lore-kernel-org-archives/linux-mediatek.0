Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF76FC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 09:47:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B97F961A36
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 09:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B97F961A36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ymy3zwsE+FTx9jJFwDduIqzSXXpBLNtPk0nwHNF8uW4=; b=4omn0FpZjkHuHacBEuL4xWBA/V
	ersu/smMjJm80WXJb3LYX4pnK96JC/gM7vYvdsh+0IjrYbcz0GPYmXx1gT5yxrvV1tsZImklx9gn2
	RsuUUqSANUSWiFXMsWKOUv6KXSw6hkF6Og0t/ubc1mL5BR1nFxmAWikWCwmVSLzb7yK7hQ/Crakch
	0FON7cB80KSDwwtlgJ7JkRKNDdIPJXxma/LLOBN9FYCAAOM6NZwODIyFH9MOcHNjyTg00T10EDHmi
	TH4Iiv8OKqpn3EMVr0XMJPI1d9Nex0h7hFWxTs2FZCYyevyZLEX5U7q1W/X/Z12FfcW79mFLcyUqL
	3Cf6k2Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1Qd0-00GWYw-RK; Thu, 08 Jul 2021 09:47:30 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1Qco-00GWWu-OE
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 09:47:21 +0000
Received: from mail-wr1-f69.google.com ([209.85.221.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1m1Qcm-0007PN-Hy
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 09:47:16 +0000
Received: by mail-wr1-f69.google.com with SMTP id
 r11-20020a5d52cb0000b02901309f5e7298so1749237wrv.0
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Jul 2021 02:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sqWyNGudVuElSm2fjSw0fUVrxrGpZuSoG0yfc9ufVeY=;
 b=dQizu6+iLHheT0B24YHoi8/hqhEF6E+1BWufZQTWYGkJqLjEkNRd38mROBKDhB2gfQ
 zG89ZvdvJL6afntu6rRhgV+xHi54P78WxVrvN6+yy5lUcm6eCh7sAfOgTysZWiMCBSKw
 nErURuFwKrwt4abTynjA50l7FlBtlXlZfNo490A2Cwu4hpFqMEAQIV+n3LTSUFnLhV9U
 gajqqsYHvkqBEpgF+qPlzc1QUbo84+L/ISwQVsHxdl0ExmPXJMc/ieN4AJEpMEud7lq2
 Em3v+enYQ2Nzt1DJDA4c3EzZBWLnQtXl6EeImbJuI24JjMteMHRHko/IcoWkxq4A6ZBH
 V4Yw==
X-Gm-Message-State: AOAM5323N6/wncSioFMkJ5pzlrtmXQY6Ub0kS3xN1BeQHCMphc9+jeIc
 HWDIXgQjn9a6686cCFhAig8E1AliCV//R+fla9mtUq0qfz7jRrWdoVi1VBTuwRZVhRGkMWDYknf
 pZO5YGQfcRYQS1xPSUBq+rqqi5f9ltnVKNQXEtRB1AJSk82OYbg==
X-Received: by 2002:a05:6000:18a7:: with SMTP id
 b7mr33862446wri.348.1625737636227; 
 Thu, 08 Jul 2021 02:47:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA3YilHPZ1h4YN/boLpRhydKgVWfFWvPY1mi0CfKNUCFbOLg+vcpMYWAsmGhdef7F2n7aCtg==
X-Received: by 2002:a05:6000:18a7:: with SMTP id
 b7mr33862416wri.348.1625737636070; 
 Thu, 08 Jul 2021 02:47:16 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id d24sm8936115wmb.42.2021.07.08.02.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 02:47:15 -0700 (PDT)
Subject: Re: [PATCH 6/9] memory: mtk-smi: Add smi sub common support
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, ming-fan.chen@mediatek.com,
 yi.kuo@mediatek.com, anthony.huang@mediatek.com
References: <20210616114346.18812-1-yong.wu@mediatek.com>
 <20210616114346.18812-7-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f5df9d97-b883-2786-dd9c-d4980e1d70d1@canonical.com>
Date: Thu, 8 Jul 2021 11:47:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616114346.18812-7-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_024718_867526_0C1059D7 
X-CRM114-Status: GOOD (  16.57  )
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

On 16/06/2021 13:43, Yong Wu wrote:
> This patch adds smi-sub-common support. some larbs may connect with the
> smi-sub-common, then connect with smi-common.

Please start sentences with capital letter. This (similarly to "This
patch") appears in multiple patches.

> 
> Before we create device link between smi-larb with smi-common, If we have
> sub-common, we should use device link the smi-larb and smi-sub-common,
> then use device link between the smi-sub-common with smi-common. This is
> for enabling clock/power automatically.
> Move the device link code to a new interface for reusing.
> 
> there is no SW extra setting for smi-sub-common.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c | 78 ++++++++++++++++++++++++++--------------
>  1 file changed, 52 insertions(+), 26 deletions(-)
> 


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
