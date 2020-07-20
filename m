Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B8BFC433E5
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 19:23:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A718206F2
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 19:23:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cM1JX6y9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A718206F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=07Vg/9w/BkfzAqbvp/XdJrm/5c1aWblA/+FQSaNrseM=; b=cM1JX6y9/w5jLcbpQRBFL59eZ
	LXonEJTRQk4FkW9/hn/m6PXffl5uL/ZExpkc1zi2IH41/N5yuFks22wbr4p5NbeQ/wJ2rz7FddCTn
	5QMjhVGYMN1SIdRHEqXOR96h++d6U6eZP/yf3anqG7kW+7ObI8kpdLeGinP0UDvOoXVNoqlssSrI4
	mRbk5pJkuTYtRpmR8Z4KYGFiibiEC5NnUGHSI7CZDnGuFs85Xhacg9BkWpvriI/uDHyH1N2rrBkib
	oSytqyhu6z8DfhyyVYG6DCbvjxD0oxEM2dR0lIvlZWFiIUmPb4IvVvKD3c6YiHJxVwKUhegQ2v0wb
	gxqiln7tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxbNj-000859-Le; Mon, 20 Jul 2020 19:23:23 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxbNd-00082b-4C; Mon, 20 Jul 2020 19:23:17 +0000
Received: by mail-io1-f65.google.com with SMTP id k23so18802531iom.10;
 Mon, 20 Jul 2020 12:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EcW34XVMNwPSgRnBgMH5wzY65jiGbMY2EMKCOkIXLW8=;
 b=SAi0g3miy5AarckMxVVEi2Scrk25RO+d3vnw1L45G9dD8JYaT0fkxKc9pSgKm2b8L1
 omtS8KyOMcrZ5otzxnyuwZHAZjRzxUJTs4dWZD6+el0TIEzll/BrWdg8maEJ4kPT/Ciz
 jADEg43hjvq+XSUY+x75c4LkGzTh4MlipwznkD5KXKKzaLPKfzRwVVsmA32sFb9fWC6h
 qbbVvKm65EbhHBSAnyssqQhlQtyzF9KNJZu585XcRifrA5lZibQU+9TvKXCeTDPYwVkX
 4ibt5BwUgUqlDmE+MyiVQg914t10+3lp27AGH0RozYc4R8Z3u7neEEYbrBvvc+dqhcRg
 MnCA==
X-Gm-Message-State: AOAM531/JFO/4nBKCmaYpiZOOMm8w8dFnfCV3V2SBnjLsjrD/CW6dErn
 E6ZYzglf/WLFVNCdDKdomBfE4iwlFw==
X-Google-Smtp-Source: ABdhPJz65ED9MYDnMU5Ns3NAnZDXigOQgsr0OxS+BbVEoRiWKSeOFuzrYsYmhOos0feUdhR2SM95Mg==
X-Received: by 2002:a02:908f:: with SMTP id x15mr26751369jaf.12.1595272996277; 
 Mon, 20 Jul 2020 12:23:16 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id d6sm9305202ioo.9.2020.07.20.12.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 12:23:14 -0700 (PDT)
Received: (nullmailer pid 2854945 invoked by uid 1000);
 Mon, 20 Jul 2020 19:23:12 -0000
Date: Mon, 20 Jul 2020 13:23:12 -0600
From: Rob Herring <robh@kernel.org>
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: Re: [PATCH v7 4/4] dt-bindings: mmc: mediatek: Add document for mt6779
Message-ID: <20200720192312.GA2854898@bogus>
References: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
 <1595205759-5825-5-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595205759-5825-5-git-send-email-chun-hung.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_152317_199368_90BC3F69 
X-CRM114-Status: GOOD (  11.77  )
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
 Kate Stewart <kstewart@linuxfoundation.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, wsd_upstream@mediatek.com,
 Kuohong Wang <kuohong.wang@mediatek.com>, Pan Bian <bianpan2016@163.com>,
 Al Cooper <alcooperx@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Florian Fainelli <f.fainelli@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Allison Randal <allison@lohutok.net>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, kernel-team@android.com,
 Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, mirq-linux@rere.qmqm.pl,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stanley Chu <stanley.chu@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 20 Jul 2020 08:42:39 +0800, Chun-Hung Wu wrote:
> Add compatible node for mt6779 mmc.
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
