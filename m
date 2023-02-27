Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067D2C64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 22:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6u8oq2oXvTRbMsEPSGA+QLZ+vr7GcOeYXtTa8jueGTM=; b=whH6uwTwcuHhWLIfJqmHG9FAwQ
	zDeHccBCERijVDIy5hzWOL3nfh56oSVjB5sz07bFAV7DLrM0NCQjMljYQHaWUoA5UqiKbwnguXvGG
	1+RFjbUxP15WfQ3PKPEn/8th6ju4FCV4533bn2UmwlzOK8KIVvWyGOepyzBv2y7pI9QDqiz+kNwMd
	yma2X5yxu73J1k+Pnu3k8QgKExunAUj7LAqnyVPGzn4cqnSJXEuvVyhb8jQHMQ/vts4/1Sj1GXDEU
	oSwhzTqbmiki1VERkjKOnayjELSYNlpXAVeIkBVCHFjHORD7aaC89OVvsiPReCKsR4vIR2HH41hfH
	kODImFRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWmBQ-00BV8n-Ji; Mon, 27 Feb 2023 22:41:24 +0000
Received: from mail-pj1-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWmBC-00BV5Z-E0; Mon, 27 Feb 2023 22:41:12 +0000
Received: by mail-pj1-f49.google.com with SMTP id cp7-20020a17090afb8700b0023756229427so11731699pjb.1;
        Mon, 27 Feb 2023 14:41:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6u8oq2oXvTRbMsEPSGA+QLZ+vr7GcOeYXtTa8jueGTM=;
        b=Hkl+qrYEw7RqNlB2cELg/piM46IgIxDha27/qCEfexaCTr+p9HdgTn7ffdLcfb3YdM
         QskelW+UvpVIglpAqzds5WLFdQre6o6VO5HGaYKA6+RH9A+CZRg+sw12abwoTRp5Wszf
         nSqkaMWM44wFCw4h7pJecNOkMjEBR+/qXovtCylD656JnZ5IHsFgBZndO1yRBfjJg8q4
         6D1x3r18t3NTpzKBq2wogEOcfYYk3CuY1vv+dL2D+bd1DfDIfKMe/DzD2ZqBf21GiU49
         ILeoV8ucxHApCEmUifcU9wMQe0Pp+VpItduJRP1K8D7bkv2biIakP32Ck5ig1nfu1QlK
         1L/Q==
X-Gm-Message-State: AO0yUKWpB7uH8s5QKSlrQy0E2hdzpQxBi8ZZjqQdnpQsHhM/STiuhtpw
	JYwX5SNy2Bn1N7ECc7Bg4aw=
X-Google-Smtp-Source: AK7set/ht7zdEIgJouJZ9Ofe7q3lKZZEmj4XTuh5hFbe3Xy1z0z6jV+xr3cc0RfOBA2xBW+OFHDuvA==
X-Received: by 2002:a05:6a20:6983:b0:cb:aacb:312c with SMTP id t3-20020a056a20698300b000cbaacb312cmr1031666pzk.27.1677537667460;
        Mon, 27 Feb 2023 14:41:07 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:6cf3:f584:1162:e48a? ([2620:15c:211:201:6cf3:f584:1162:e48a])
        by smtp.gmail.com with ESMTPSA id v19-20020aa78093000000b0058d54960eccsm4662778pff.151.2023.02.27.14.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 14:41:06 -0800 (PST)
Message-ID: <6a076b7e-9b0d-11af-ecf8-8e3db96b4eae@acm.org>
Date: Mon, 27 Feb 2023 14:41:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/7] scsi: ufs: core: Rename symbols
Content-Language: en-US
To: Po-Wen Kao <powen.kao@mediatek.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 stanley.chu@mediatek.com, alice.chao@mediatek.com, naomi.chu@mediatek.com,
 chun-hung.wu@mediatek.com, cc.chou@mediatek.com, eddie.huang@mediatek.com,
 mason.zhang@mediatek.com, chaotian.jing@mediatek.com, jiajie.hao@mediatek.com
References: <20230222030427.957-1-powen.kao@mediatek.com>
 <20230222030427.957-3-powen.kao@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230222030427.957-3-powen.kao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_144110_501876_F8BEA338 
X-CRM114-Status: UNSURE (   6.18  )
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

On 2/21/23 19:04, Po-Wen Kao wrote:
> To avoid confusion, sizeof_utp_transfer_cmd_desc() is renamed to
> ufshcd_get_ucd_size().

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


