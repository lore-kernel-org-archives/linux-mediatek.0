Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B06C433E7
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 09:03:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A968520709
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 09:03:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="srDuQDXd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VZzoNgJo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A968520709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UbJRvZ3/knHEntZ840hWseaXUv4xJKOQrx8EWjpFFCE=; b=srDuQDXdBW9lFGNEsSAl0mcsq
	ajTX0iKI3svOKw7/uueM8C/xfj5OQL8sFPRk/mC8YClCv/Ug8k3mcb3q/9BOhOIoGBNV/e01rjwDJ
	SJ4JwdL6BIJJTojvJ12f8Uf0wArw2GIdIfkD/g6TdJ/2o/adEKcR8y6TJqxCDv+pmMa2Yo4V//Ee2
	JDIeOAdd/Jfrp/uMUyUmKocnUi93ZQA6xJnHAFnlvxPTyaquoluRxmZllx+gY/He+mNkP+Siz687V
	aDCWgZyKBTcjSVcY9e/KaL5Vom47AzGdBKZ4uLblv6VqPNCmKTFffMphA617JbJVB7w8TCuEqXNhb
	r2pEiu/yQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDOgA-0005lE-45; Wed, 02 Sep 2020 09:03:42 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDOg6-0005jn-RO
 for linux-mediatek@lists.infradead.org; Wed, 02 Sep 2020 09:03:39 +0000
Received: by mail-vs1-xe43.google.com with SMTP id b123so2161147vsd.10
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2020 02:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FFV82M/6u73GqedIKaydXrEwLHTHCWqg1HfMv/IVCCs=;
 b=VZzoNgJoW9pVvA92M/1zKgvhm4xk1DywhQbKr9lziWr2euc7xr7tJqZ7BV3F/7mBJe
 Rmi5STwCgT2WSV4eEldILAKBitUAPowEDgRa/Q2ABJz5ba4q+r3+spzDSFyor3Rhdn6H
 ej0ejV3kcN029m/W+Y0vu38NG7P+7Wp8He8+AbEMlArg2sNq05tNxqKEHeu7J+ZVDFLl
 mjnYOinwdHXOv8naM4Hzpmxan4ss9+v9lUC81Gg4dy1bJ7rF8jf/wmAzXdKlZVnmjqmi
 3yAIZwjpvP4EZ0xlfoa1K8iiJFMZurKo5lfU3hqX1jqHjJdZjS3KO0vEIUqHL188eslq
 uTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FFV82M/6u73GqedIKaydXrEwLHTHCWqg1HfMv/IVCCs=;
 b=tsZIt1MtnfA3l9gd9hRXugLbnEKcqmMHgZx0mGMUoeb6YMM8KlyDPniuSYg1EEXL7q
 boDCWI7QOe/w+TX/z2RlMWSCg7eUGqiSnb7nz7nDFtkaiQrU/ENVjQuEhJsVrn6QcaJR
 E0fZGTWjm+h5Ht/YODCtmpDK9tUMzeWUyz8sCYWFXSi/xpPLv2hmXM2ydOQYerge1MGR
 x3OAQZTp+Tkln+MSa9nD8HMp6F3NidhFglXDxzToo6z0L/sP0tH4ymGeFJpN/DhyIpT7
 uG9K6/qYMegmEN9GK8BC4KSxdKYVAdecKSCfGX0ic45W7URBaFYNJD489JBlt6+84Wpq
 8kSw==
X-Gm-Message-State: AOAM531mqBJPpwhloG1sl+ozpifnwck8S8d27WdnPeh1FxU5XJoE9PaT
 AsFM36Is/Fl392ksgpzkIUgM1I7p4lIwiePAy0cB4Q==
X-Google-Smtp-Source: ABdhPJwsRg1A+IZemgbWMk9SB448rUC9bgen53U3T2+v8AYT3LANtcX7wdMKlegnvUy0kMb/FNEB0pRyZk8gx49TIgM=
X-Received: by 2002:a67:b44a:: with SMTP id c10mr4491532vsm.35.1599037416050; 
 Wed, 02 Sep 2020 02:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <1598520783-25250-1-git-send-email-chun-hung.wu@mediatek.com>
In-Reply-To: <1598520783-25250-1-git-send-email-chun-hung.wu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 2 Sep 2020 11:02:59 +0200
Message-ID: <CAPDyKFp+RKTcssd-zpiOnvfNsv5=7b8mtEw645JQ+MLmH-XGhg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] mmc: cqhci: Add pre_enable() and post_disable()
 hook function
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_050338_898407_8D042C0B 
X-CRM114-Status: GOOD (  14.49  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>, wsd_upstream@mediatek.com,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Al Cooper <alcooperx@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Ritesh Harjani <riteshh@codeaurora.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Allison Randal <allison@lohutok.net>,
 Android Kernel Team <kernel-team@android.com>, Pan Bian <bianpan2016@163.com>,
 DTML <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stanley Chu <stanley.chu@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Mao Yong <yong.mao@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Asutosh Das <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 27 Aug 2020 at 11:33, Chun-Hung Wu <chun-hung.wu@mediatek.com> wrote:
>
> This series provides MediaTek cqhci implementations as below:
>   - Add cqhci_host_ops->pre_enable() and cqhci_host_ops->post_disable()
>   - Implement MediaTek's hook functions
>
> Chun-Hung Wu (2):
>   mmc: cqhci: add new cqhci_host_ops pre_enable() and post_disable()
>   mmc: mediatek: add pre_enable() and post_disable() hook function
>
>  drivers/mmc/host/cqhci.c  |    6 ++++++
>  drivers/mmc/host/cqhci.h  |    2 ++
>  drivers/mmc/host/mtk-sd.c |   22 ++++++++++++++++++++++
>  3 files changed, 30 insertions(+)
>
> --
> 1.7.9.5

Applied for next, thanks!

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
