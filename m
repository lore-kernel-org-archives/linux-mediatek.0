Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408A2C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 12:37:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F240B223C8
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 12:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F240B223C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I30+xW9HQOqk88hWEYGY+LPsZpCAxKjc+D1kbtC2Qt4=; b=pgqM576VcQNl/+a74dbG0EkMt
	P05LdjjmlP0vaBwWR9sy/qyGhkUquTtFzRl/cQOe+B99h2sV9Lml0vMv+Dwpp+W77lX4HwaOW+G5v
	NK2n74ViYsVmZqMCy5+9zgMl2gS2N7K0uSHmqxpuospzTWeFuvePow8a3dvEeG//aekLIWZspPFEx
	n6yvBNoMc014R++NsV5XQX5BZELPf/+rC5gaYPp0w/N6EAFFd2AvBgn/vKAUg2aaMhQYMsiby1Hin
	Ounf/NWcfA60n1CyLJ8+0rMwZUUIfvmTV7R4rr04bGfXy7EKO+Yzko1wm90EzV4JqHit3zZeBS6dw
	ObbDQBw6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzIvI-0003Hy-KU; Tue, 12 Jan 2021 12:37:20 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzIvF-0003G1-KR; Tue, 12 Jan 2021 12:37:18 +0000
Received: by mail-wm1-x32f.google.com with SMTP id y23so1980921wmi.1;
 Tue, 12 Jan 2021 04:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zMd+XHnFId1Wgsed2jprrzroN/fiYe/FbbKUqXbc1O0=;
 b=aWA3DhcWQA4MMreD6ZpfYBr9Teauz1ija7KFv0t8RsCuZ3BgBrC4psZs8ddKqaLHB2
 EO05spt+UYI/Qr+5fbAOB7i9a+iY7CV0ZJjLJzMQYYUPAJihDA0T3QC5Sbfz6lWBCzH/
 /XAPI0j+Ozy2pTr9of7gGDBbkx0VAmByJleOS+Esmo5Ge8JaHy4ztwrCW64L4agiq/kN
 HYlBLDRW0h6CdZrfGdwC/3aXBcXuaJlarGOV2kNXaLricmUn+sSztl/+NxdnEA7rT7s2
 o2f0OOpmiUjX3DPyR7Q18jfa43bLapYMzi7XObUWHV4bcY1GirEU6n2pbcgOn1Lx/mmm
 gw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zMd+XHnFId1Wgsed2jprrzroN/fiYe/FbbKUqXbc1O0=;
 b=QlDGIQq46GHr8JHqFZDL7YskYbKNj/O4hyp4zJ/+3rdMd9gjfOx5kES2+IOEBUaNh5
 5bqD2b7+GzDCiEic1+EvVlmzucsn/CIyMqA2B7w2zTVlHjVKoeiYrsOWYO3SdCkEfzbM
 +MzWo7q4xFXfvw0XRAFC3d2v2drIac49dD/o6DTlHuwA34Sj2xs+joA1DI3GHS+/rhsg
 SwzGjZIeWrEbG/KL3chCpEt8iRl0MkcMf0gof7rZ2tAXlU646zN44rpx7OR1DW5z6cBb
 IDt/uZBHgIJ8kFLXsf8GpxlVgjkp2SGSN3iKasK3cl6nspi2QwHp6CFXZ1KEwuJ1jjhJ
 lDkg==
X-Gm-Message-State: AOAM530I2eCVUrzNlzDyezKg3tPxZrUjvReKh1/pYXE2vj8LFXFzZh0f
 Eacif9JDyxCX2JL4aW5r+zw=
X-Google-Smtp-Source: ABdhPJzZkIBM3vrqBllD/XocErsVNCfAdadbHNNKk+/k3bsFTvdI16XOCSkzqQsfYYoGVSRaasxoaA==
X-Received: by 2002:a05:600c:20f:: with SMTP id
 15mr3446491wmi.36.1610455036332; 
 Tue, 12 Jan 2021 04:37:16 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id o74sm4107446wme.36.2021.01.12.04.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 04:37:15 -0800 (PST)
Subject: Re: [PATCH v13 5/5] leds: mt6360: Add LED driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org
References: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
 <1608547554-6602-6-git-send-email-gene.chen.richtek@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <1e752ae6-f973-11c3-1780-d11d2af497be@gmail.com>
Date: Tue, 12 Jan 2021 13:37:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1608547554-6602-6-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_073717_745663_1EC2C7A2 
X-CRM114-Status: GOOD (  13.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 21/12/2020 11:45, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
[...]
> +
> +static const struct of_device_id __maybe_unused mt6360_led_of_id[] = {
> +	{ .compatible = "mediatek,mt6360-led", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mt6360_led_of_id);
> +

I think we should fix MFD code to not need to use a DT binding here. See [1].

Regards,
Matthias

[1] https://lore.kernel.org/linux-mediatek/20210111164118.GE4728@sirena.org.uk/


> +static struct platform_driver mt6360_led_driver = {
> +	.driver = {
> +		.name = "mt6360-led",
> +		.of_match_table = mt6360_led_of_id,
> +	},
> +	.probe = mt6360_led_probe,
> +	.remove = mt6360_led_remove,
> +};
> +module_platform_driver(mt6360_led_driver);
> +
> +MODULE_AUTHOR("Gene Chen <gene_chen@richtek.com>");
> +MODULE_DESCRIPTION("MT6360 LED Driver");
> +MODULE_LICENSE("GPL v2");
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
