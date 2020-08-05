Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB8FC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 06:35:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D2CD22B40
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 06:35:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZZtVzfRR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yklXSdFp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D2CD22B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1HH4W0pbW993utntn9XvPsVOOmT8pGV6WnQk8eUyhjs=; b=ZZtVzfRRD0iIdNNGV5uxtlR6b
	JGRTmH4JsvxClpOyC9i74GD0lH3juLSkAswIVZwJMdpZuLCIrfl/8Z9LlVjR3DTL6cXj59YqasKYy
	3ok0yunEsaQMeelobt89MVxgbTTIe2G0qroWagdVJyesyqdIUNO2ZXOkV56EhwqlS2TXuyRHm9raF
	Rlvulezj6MCz0F3BpzHJ7tOkYIXCCsyQgmgey6+jTk6e5ie3XKMZQ60SylguWOiSRnNad5jiV8vuF
	QNoVthboEES5pnfgv8n4v7IMA06pIYxzABZXJydd6HA5CszamDJIU/BSg9ztF26uJEMWqm0Yo4eAP
	W/X3xqwhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3D1K-0008Ah-Du; Wed, 05 Aug 2020 06:35:26 +0000
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3D1G-00089C-Gd
 for linux-mediatek@lists.infradead.org; Wed, 05 Aug 2020 06:35:23 +0000
Received: by mail-ua1-x944.google.com with SMTP id p27so9302060uaa.12
 for <linux-mediatek@lists.infradead.org>; Tue, 04 Aug 2020 23:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TRgCHKisb1WQYwUfqfppcbFhz6bMpaA6f/4VF6YibyE=;
 b=yklXSdFp445ZERM6oRjoN7UqKcwnC6QI8nkwgVExbkUSeoci18duLrHPfXXMUCJ4bd
 prE94lWqDR+YDBVux29xB/qOO8GbvyhvMbtMWoPU7hpPlGinCzFJPyBd8XtPh/935gMs
 uDkLj7dtTTHzw20gjRFKTj3kqLizxh6JHim6IXFCXjCFXd3Hyyu+hg+qeZkiZKmr/0I1
 vhcseR8cB0ERTi/rgme3akmGD8LQJzS0zwad+9yKimqsOQNtcZse1yUlOzWBA/lhAv5S
 9Z8ZowvYE6CDb7pZaWLffiUYAawURQpp/aM4z9pYYh5S/YOtkU01TxjuWWczd2TBePAg
 FcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TRgCHKisb1WQYwUfqfppcbFhz6bMpaA6f/4VF6YibyE=;
 b=iBMNLyZKuFgyQCLTlYkjpwD9XUuB7Qcp7BQtyJ33y2kUHCKB0WcOK4Y18dkS0ZcqMf
 kWneZHoKkuq2h7aIDmBspDQ8SeQMJSKUsWiyESLFtGEXo6PPdpc0cH8aSUz/Mc/zUIm+
 mHuJtUiXECPDBmneNVc/JERGHnUDf//YAcQjpoOHzQ81jpaBV6DMAlaVZQ6iR8ALYjOp
 MVVIwEWstODDleBC2SCS5Hq5kXGvdW9KyjfzfL2I9bfwoMdMfOks7C3FLXfSxR7zKxYA
 geLS6xeAhBPT4ood0F5rjyuJYKVJGgRtaGamVDHYcKPKy9LYK0GgPUPx7XHsO+iqk5Wr
 WZxw==
X-Gm-Message-State: AOAM530Hb/lBt5uRhH8/LfzpRJTvwRUTn++LnkaxNl3+JVPgL/itF6p2
 i20p+YrnptTi3I5kMRAC5iBeaUENUlBLmE2HAjDfsg==
X-Google-Smtp-Source: ABdhPJzElO7vtg79uDltd6lqvfyytXKZEg6JRaHzzjpkrOb5TCi+dFCYJVPioPdesMrX8Nxr3m4X1+R0dD2mH1ObVH4=
X-Received: by 2002:ab0:1c14:: with SMTP id a20mr1015543uaj.129.1596609320274; 
 Tue, 04 Aug 2020 23:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
In-Reply-To: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 5 Aug 2020 08:34:43 +0200
Message-ID: <CAPDyKFq7CV5h86rYeAXsaVii68By8c1jN6AgdURQEvbsQ5pM2w@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] mmc: mediatek: add mmc cqhci support
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_023522_846245_D481964D 
X-CRM114-Status: GOOD (  19.12  )
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
 Florian Fainelli <f.fainelli@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Android Kernel Team <kernel-team@android.com>, Pan Bian <bianpan2016@163.com>,
 DTML <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stanley Chu <stanley.chu@mediatek.com>,
 Allison Randal <allison@lohutok.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 20 Jul 2020 at 02:42, Chun-Hung Wu <chun-hung.wu@mediatek.com> wrote:
>
> This series provides MediaTek cqhci implementations as below:
>   - Refine msdc timeout api to reduce redundant code
>   - MediaTek command queue support
>   - dt-bindings for mt6779
>
> v1 -> v2:
>   - Add more patch details in commit message
>   - Separate msdc timeout api refine to individual patch
>
> v2 -> v3:
>   - Remove CR-Id, Change-Id and Feature in patches
>   - Add Signed-off-by in patches
>
> v3 -> v4:
>   - Refine CQE bindings in mmc_of_parse (Ulf Hansson)
>   - Remove redundant host CQE bindings (Linux Walleij)
>
> v4 -> v5:
>   - Add Acked-by and more maintainers
>
> v5 -> v6:
>   - Move CQE bindings back to vendor driver
>   - Add mt6779 mmc support as an individual patch
>   - Error handling for cq_host devm_kzallo()
>
> v6 -> v7:
>   - Select MMC_CQHCI for MMC_MTK
>   - Remove unnecessary option MMC_CQHCI in mtk-sd.c
>   - Add error handling for cqhci_init()
>   - Use native cqhci dt-bindings 'supports-cqe'
>
> Chun-Hung Wu (4):
>   [1/4] mmc: mediatek: add MT6779 MMC driver support
>   [2/4] mmc: mediatek: refine msdc timeout api
>   [3/4] mmc: mediatek: command queue support
>   [4/4] dt-bindings: mmc: mediatek: Add document for mt6779
>
>  Documentation/devicetree/bindings/mmc/mtk-sd.txt |   1 +
>  drivers/mmc/host/Kconfig                         |   1 +
>  drivers/mmc/host/mtk-sd.c                        | 160 +++++++++++++++++++++--
>  3 files changed, 152 insertions(+), 10 deletions(-)
>
> --
> 1.9.1

Applied for next (a while ago), thanks!
Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
