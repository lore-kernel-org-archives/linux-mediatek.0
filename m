Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E94C4727F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:50:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50BB220709
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:50:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2rRJP3CO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lKftBT0d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50BB220709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7GsBRaNRRU/0+nE9VDv0meu4WMa6D4aFSu61jiLsWMs=; b=2rRJP3COCPMpxJRqlidP4DZjE
	x8nd8+k088NxX5Ihpl7pIzms/PlE1ztk1qKHDobxxEW4eDMaVNsDu+8XJzVYSo5RpQIrMRNd+Qoz0
	0JRcBQ8Kmf/Tzi5YyGbiQy4SSVDrMR1AbB4B7uFtCMxNH1Ey4e/5ercicpeLEfL/iRQa8pRiViyXj
	K/W1Aso1WkcLka8NcfCNM53ahMfiO84WdUkh7aEtiK8od9bsw3+cak2Au2zTOhnFBRXMkiJ6SQy5h
	/JrMsOXDs6KIJxXZwUJLXVerWnDTaXYO8B1cHNyYEJ6gTvtZRqpA35hlpoICcCoAnEjeBxPd0ej3K
	IgjTTr5QQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNXoj-000166-OD; Wed, 30 Sep 2020 08:50:29 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNXoh-000153-Sq
 for linux-mediatek@lists.infradead.org; Wed, 30 Sep 2020 08:50:28 +0000
Received: by mail-lf1-x135.google.com with SMTP id w11so1179837lfn.2
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2020 01:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p9jT18DRPmM+6oT/A0SgvjeQobMXcTPWA1A49b1ezhA=;
 b=lKftBT0dAYKAhl4xnf32V5bPoxz5gnn8O8xL7hbmRT9wMNVCcn3rD/1/976g96qC5q
 ahvfu70WnSj9P7uM6dtIhuNiSSN1qhQrHiytYRJweL8sLFCiNvmbkYPDwj51KfpAxWtH
 9P3y46YPKJUsbsYzrT857GCp3HZeOyivl9iIVk7l9vQDkhGdSRgKuKkRn+yl0GB411DG
 cwphGgQt4KHSGkimli5zRfrbSzE3X8TRTsDlwL8v17PEmrS9XwkXis6hpqXwpwn+manb
 q9gqnqndzyAiyodHgsHBv3mNXvMfmySpSAZ1P1uvELq0y0WBK6FaMpwEmE8cKrK2s3F2
 r+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p9jT18DRPmM+6oT/A0SgvjeQobMXcTPWA1A49b1ezhA=;
 b=sa3q7BZVknnPGyYlbbM0SgZmiom/nBfq2bUV4PgSEiAR8Yin6XXScQwBV1pxo17Wbj
 qJLhEk4WojUie6HrnAPQHSkAnCgR+gI1hU7p+7yDRzZnB/hI832AXX0yv9WH1zt9ft27
 VCypLZrT/Keu6VFyKG2iN3QLlnVjPdRByKTMF4rIKpuaDGkqgwb2OO3vV75Eseph179y
 UJ+vE3tBc195OAWroDZDarhy3KC5hoSOG/vjgegaqaCk6geW1mCxIoV/2pEmcTqQos0P
 J/tCcrUjQ/rd6wFUcOV5B6oZD47NfVJgcXRA4zGhbgiKeG3NL6ejgfwCjyAvIErqnL/2
 B/Dw==
X-Gm-Message-State: AOAM532+gGjUW7RstSyJyGiTN+WIP7vIJUigAV1Dj6uOwa+v6sndoDPj
 1sBPB5WQwWr6v7nzHBQ/LkbdCMc/l4dy44iHAOa1ug==
X-Google-Smtp-Source: ABdhPJyK72VML696C135DEXZ4OyVrftc07keF/4Ek5Cv6BHqy8lTa5W891mP9tY55Gt9drR0NvqruB+j3+zWi/eDK7c=
X-Received: by 2002:a19:520b:: with SMTP id m11mr462629lfb.502.1601455826247; 
 Wed, 30 Sep 2020 01:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200917064151.2184010-1-wangxiaojun11@huawei.com>
In-Reply-To: <20200917064151.2184010-1-wangxiaojun11@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Sep 2020 10:50:15 +0200
Message-ID: <CACRpkdb5ibeGNoayAZvRPf6qpedJvRUTAeCkxt+8mk5Me0LBKg@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: mediatek: use
 devm_platform_ioremap_resource_byname()
To: Wang Xiaojun <wangxiaojun11@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_045027_986172_B3F76887 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Sean Wang <sean.wang@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2020 at 8:40 AM Wang Xiaojun <wangxiaojun11@huawei.com> wrote:

> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.
>
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
