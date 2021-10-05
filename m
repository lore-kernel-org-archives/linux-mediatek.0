Return-Path: <SRS0=zM/7=OZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02353C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 17:49:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3D5061501
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 17:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3D5061501
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oq2lN0H8e/tOs+bylV4YUYLmvjRIEhjALytnsXqubDM=; b=b0UDbimFKPKKA3
	Le6xZJjfhMQcUIr5kcNklZxN+ZiepfqEbkvNQpc/ruKuKWS4XlR6jBg9Q5gOGGk1saFvO9E0iZnKZ
	52ChIfXcz6QZGO4faknCwhuXnLEA7SjEVLwis9EK7AjfIVmioyrBiPFcUlo/OzwvPsQdpUM6GhGL9
	lrUxBQ17HEUjQmhc8G3CWbgZCv6XdSu7H3L1y3/mVGYuHWpSC9/a4aFqtVKeH8LTeKYVhyNvSpqqN
	OAJzqGyuF3D+8WQhc1tOPFRUNA473mDNEZXo4l5MO0ysrR3fY51nudU3ZwYejEbntxn0R0U0cVbUH
	oVbH6Z8xTnNpypYqBZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXoZ3-00BRpx-Qt; Tue, 05 Oct 2021 17:49:17 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXoYk-00BRoF-3h
 for linux-mediatek@lists.infradead.org; Tue, 05 Oct 2021 17:49:00 +0000
Received: by mail-pf1-x429.google.com with SMTP id s16so234990pfk.0
 for <linux-mediatek@lists.infradead.org>; Tue, 05 Oct 2021 10:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=aktO3MIuhcJHP+k3LRfRQCfAEj4yjVMHakhMwYPxUyc=;
 b=QvpDANPwTPG+RBR5Junq7lmP/VUC9TNjvFK3MNeIhkmx9v8aYVfLg+0EEdidHyjGjm
 CA29v46yb/d+Z0/WuM7d/qKnz9yKR/xHkvBt84vcdWoKCvYT9Et6z595FQ5OVP7fdn3X
 wQ9f7tjd75wn7N56/74i3RM0KkDl9wD2Do/eAgprwIjXAYqx3cUx5Tp5MzMnrrvvZv2d
 dR8eJ67Fub4aRUj/exIb18X2WOln+UEUUDm37uyYYTRe+uvxqKoOKtFFLUuqc90L7Amo
 +wL42QktO/JISeCqEbZcZWF8mnydqUKDuhGU3Gxy9PHI3t/m+v7D8CXHBYZ7vldCyrBh
 WyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=aktO3MIuhcJHP+k3LRfRQCfAEj4yjVMHakhMwYPxUyc=;
 b=Ec7WA+VD30DIyTJG1jJwXrRs+7Chp0wMtso2dDW3T6tKQ1LX6MVtYuIRTCwwDJCSue
 vULMh3gtVdqO0tN6hUym1Zn19XU/0kHCDOYFnhYgIdh93uS4tS85s7aborQIvtxV+BRr
 FAVpkDiJR2q8GRegrPkbWAAvgNUrvnnhNV5QhjQ1y5+S5mSC6IjIb5eJPH/U5tD0tcGO
 dIC7LlWFkJpIvItAXTAv5y+M7IotVwqV5AAt6fgMsWtD511EguM4k8eEN6GvvOyCBrdM
 5/RFquJY9pCFBoIBXdDiejPUXtgN/CIxr0GtdY6PmhziF1khwbCFFGZ2dgPaU3XtrKye
 P8Cg==
X-Gm-Message-State: AOAM531nQ8yz9a2Uhi+Gd2qjU8goiq/k+mApK+ifLYsttaTrUF/oURZz
 r5xyWElv0vNncKUffONfzbBPtA==
X-Google-Smtp-Source: ABdhPJz14fGlL05m3Fy56TnqEoOeVrCd12a7yJvSfZr0dfQS9I2/IAbCln5+fu3/sysX6iIiPHGIGw==
X-Received: by 2002:a65:6251:: with SMTP id q17mr16983553pgv.416.1633456136220; 
 Tue, 05 Oct 2021 10:48:56 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 12sm2150475pfz.133.2021.10.05.10.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 10:48:55 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Mattijs
 Korpershoek <mkorpershoek@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH RESEND v3 0/4] input: MT6358 PMIC button support
In-Reply-To: <7h4kan7ytq.fsf@baylibre.com>
References: <20210816100013.100412-1-mkorpershoek@baylibre.com>
 <7h4kan7ytq.fsf@baylibre.com>
Date: Tue, 05 Oct 2021 10:48:55 -0700
Message-ID: <7hbl43fjlk.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_104858_256300_FC71A10B 
X-CRM114-Status: GOOD (  11.17  )
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

Dmitry,

Kevin Hilman <khilman@baylibre.com> writes:

> Hi Dmitry,
>
> Mattijs Korpershoek <mkorpershoek@baylibre.com> writes:
>
>> The MediaTek MT6358 PMIC has support for two buttons: PWR and HOME.
>>
>> The interrupt logic is a little different than other PMICs from the
>> same family:
>> for MT6323 and MT6397, we have one interrupt source per button
>> * for MT6358, we have two interrupts lines per button: the press and
>> * release interrupts are distinct sources.
>>
>> Changes since original v2 at [1]:
>> * added 4th patch with device tree enable
>> * cover letter title prefixed with 'input'
>>
>> This has been tested with evtest on mt8183-pumpkin on 5.14-rc6
>
> Any feedback on this series?
>
> The related MFD patches were merged already, so there are no out-of-tree
> dependencies.

Gentle reminder ping.

Thanks,

Kevin


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
