Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F396C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 15:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2M/nWMIArWh6jatNaLmjqxVllqrja+AOnsO6CfEGJk=; b=HdLLOTWCkcq5Y5ClgOW363a51Z
	z58W2u6jNpQBz0qG5l18kKQdBRhWHG3qXQyrEix2lvJmpAhuCCxu7qx6dn2cm38e92lxv1aAwtHVr
	I5c0IzN1lm5kG0kb4fWH8uSFpcjFR30U5Lk/+MVx8jwo4ZUiqwkVhu0pIYBxSxvPCK1hdONAV/29u
	LhS969QD2XqyRM0Uc3lSYoBLrnfvOkXLaZbdtOcmPMm0fUtBCRVu/0B7IMY02i7btlik6e8hELBSX
	xEBBnsz4Qleb3+jlt7u+uiYr1AZa4vBHI+lqYidrsdMgXgNvpchQnK3i0OF+sjoZBbEqyG1KB1G+j
	hJAIrxpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6DYS-0074bj-Gr; Tue, 28 Jun 2022 15:55:08 +0000
Received: from mail-yb1-f176.google.com ([209.85.219.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6DYF-0074U0-Qc; Tue, 28 Jun 2022 15:54:57 +0000
Received: by mail-yb1-f176.google.com with SMTP id l11so22895530ybu.13;
        Tue, 28 Jun 2022 08:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M2M/nWMIArWh6jatNaLmjqxVllqrja+AOnsO6CfEGJk=;
        b=19py3JleUPcflq3jjSwOxT8rhG5IJtOQ8aGu0MhbXSi58T6I3jhuSUQ8lMZflIR76E
         rwIsOvMc7TA4AHJQA8oW3J6T9RkdFN3OayK5NAGcCd5Dq63AfDjAFBdexIxwl/RNfOSX
         AelDOm7w9icVfA/zxTPCjpFoHFeFfC8ntKNK6gZtue99L5v/9WwO26LfDhzowsoz1GCB
         K57EanjYPyEuAse7DI0+fMywImRaW/i3oaL27wbXLw8eEdWaQq5YjVuF2KQXK8+ipI6y
         dk4/3213aI70pC/ZtWgD+0Lq53eHEhW2HHr0bxenMQ5EIt79+phQRc4aXRh5srmL1SSs
         LnIg==
X-Gm-Message-State: AJIora/EVBROqvpIn2GzJS1byYxgU08L7H0WOXL8h+CZBaqaWKnefbfO
	dbs521dLz9YHeZpvJi7j+45qNKk4rkWAR5W+kXA=
X-Google-Smtp-Source: AGRyM1v35HaVSm8aGnI7ET9CfTgX4A2FHre43lUkb7LAgas5M9aN2OgQHgFB+2vu3UVCEj1r+eu3tSjcm/Nu5ocohJc=
X-Received: by 2002:a25:9847:0:b0:669:b4c6:d081 with SMTP id
 k7-20020a259847000000b00669b4c6d081mr19508238ybo.633.1656431692627; Tue, 28
 Jun 2022 08:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220613120755.14306-1-peter.wang@mediatek.com>
 <CAJZ5v0ipi5frHBGWWcFpGCYL7au=dF6vUG772h0r0pnCYsi5Zg@mail.gmail.com> <028eba89-8176-740f-42df-736a0fcf26e7@mediatek.com>
In-Reply-To: <028eba89-8176-740f-42df-736a0fcf26e7@mediatek.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 28 Jun 2022 17:54:41 +0200
Message-ID: <CAJZ5v0g7kuD9CNBUv+9CuthX79Sq01_e4DQAvbUqFPKsMYkedA@mail.gmail.com>
Subject: Re: [PATCH v1] PM-runtime: Check supplier_preactivated before release supplier
To: Peter Wang <peter.wang@mediatek.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stanley Chu <stanley.chu@mediatek.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Avri Altman <avri.altman@wdc.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	wsd_upstream <wsd_upstream@mediatek.com>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, chun-hung.wu@mediatek.com, 
	alice.chao@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com, 
	jiajie.hao@mediatek.com, powen.kao@mediatek.com, qilin.tan@mediatek.com, 
	lin.gui@mediatek.com, tun-yu.yu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_085455_903398_E68A1D2C 
X-CRM114-Status: GOOD (  11.21  )
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

On Tue, Jun 28, 2022 at 3:53 AM Peter Wang <peter.wang@mediatek.com> wrote:
>
>
> On 6/28/22 3:00 AM, Rafael J. Wysocki wrote:
> > On Mon, Jun 13, 2022 at 2:08 PM <peter.wang@mediatek.com> wrote:
> >> From: Peter Wang <peter.wang@mediatek.com>
> >>
> >> With divice link of DL_FLAG_PM_RUNTIME, if consumer call pm_runtime_get_suppliers
> >> to prevent supplier enter suspend, pm_runtime_release_supplier should
> >> check supplier_preactivated before let supplier enter suspend.
> > Why?
>
> because supplier_preactivated is true means supplier cannot enter
> suspend, right?

No, it doesn't mean that.

