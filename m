Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C780CD8CAB
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 16:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRoUi3Xaj9/vW3JOic0lJo9yZRKzDYlftz3mCeomBqs=; b=na47Or2bRV5f4jTPYK39iNQfLg
	qBgWysxvxVfLMoZAtsH8Ws/S1jqNxUvH1tOr49y8f6AcB080JngEJaQYWRHHhcFgvNIZ3nYTdxZOW
	TsTbwS80FQqZRSKkLCjDH4z3+RUdfX7CC85jy7/zrm/cPGIEL6K5fU2CdbelYkm+DbjYb5Z3IGoze
	AhqtFcm6NvmgFZ/tKkzoSBvtXbryo9HsNZEXTYy/LFxcwBaOenRpqZPB/HSfzapl4/0gEZ3CUQQhY
	WG9kd2CkjOwNvzZRF2xqz83K6XaQBA3vZOiQRBoAclUmKqUvuFTffTPjgeEKx3jjtj6quDyqA+eDC
	6UIcPJGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqFv1-00DnBj-2b;
	Tue, 10 Oct 2023 16:49:15 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqFuz-00DnB3-2q;
	Tue, 10 Oct 2023 16:49:15 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3296b49c546so3776664f8f.3;
        Tue, 10 Oct 2023 09:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696956550; x=1697561350; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kRoUi3Xaj9/vW3JOic0lJo9yZRKzDYlftz3mCeomBqs=;
        b=fty+fgxmPLjvrSRKWIjxFHyxRfiRX8KOQoDQHKNDO44p+UugpmHo2xTFtGj758MMEs
         kMFcIJYq84/KSJT8rVGkXefu6Ia91Ygq9acuhd7kZcfcwlp2eXnMzLPWDRlUklu0P7J6
         zp0g4LDNjszJmV6WiH8LXV9QqgQmNegCtpJI7wgTwxZoGLx1r6nrDsSB1mvEU33ifqPN
         7CIRvecALuadRem/roNlpiP1hY0bIlWo4ulEjc/koXWnBkuQjF0lxoFpq25mVZYSCdBj
         xL1zlO8LVkckH7h1GT38BE7rhUYPJ9SmNdbXGBQi9oq3JVKNG+YsuPy4OFam8qf2RQrD
         XOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696956550; x=1697561350;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRoUi3Xaj9/vW3JOic0lJo9yZRKzDYlftz3mCeomBqs=;
        b=fhqn2aMDQriNchpDIp2x0KL4bnSJJ5Zt3m44bjlnUhJfCeiVmxmE4a+3eXvi3abueS
         ndk3/obP6bLtimLaytiJLSUGsIrDtoXqDCBK4H50mLxZ3FNLpYNAADoL8g2+2pyEL+Rf
         ddjYdmqqFGKJha8PNSdgq6ylSgoSgKtdCulMMCx0+qhsuQLNPpu2TBZPOSHKcjf0T84e
         /J+8qTfOoKw8DgDyQvtogH6Nh9mrh8u/T0+MwPmufQV7EAMbHcOIXSQZl6C6F0jQCpJ/
         3ciUk1A822w+ireeYpWXtRKjFgVq4IRQCV4ARtJ2hEYzm/27MMWe5dwQP8o+8CgtXtsB
         3vig==
X-Gm-Message-State: AOJu0YxIWbn29KWxkxgIxa+3vsEPLod+886cbCqKU00dFAr6xKlqJ+jQ
	LPYDVbLFF9Z63u8OBcpJIiI=
X-Google-Smtp-Source: AGHT+IH+JUkcLf/ecz4OOARVhnPjr2KCLrmDW4cCzSkY9RxtXFVqBpwDpNO/TOhJBJQT5jok2aD36g==
X-Received: by 2002:a5d:674a:0:b0:317:e68f:e1b2 with SMTP id l10-20020a5d674a000000b00317e68fe1b2mr15338549wrw.28.1696956550228;
        Tue, 10 Oct 2023 09:49:10 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id t4-20020a0560001a4400b0032763287473sm13276997wry.75.2023.10.10.09.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 09:49:09 -0700 (PDT)
Message-ID: <65258085.050a0220.dfda3.2518@mx.google.com>
X-Google-Original-Message-ID: <ZSWAhEDlKhBIbZxk@Ansuel-xps.>
Date: Tue, 10 Oct 2023 18:49:08 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>, John Crispin <john@phrozen.org>
Subject: Re: [PATCH] PCI: mediatek-gen3: fix PCIe #PERST being de-asserted
 too early
References: <20231010160423.GA977719@bhelgaas>
 <1E611A63-AD66-4E61-90F9-F1DB41BD6466@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1E611A63-AD66-4E61-90F9-F1DB41BD6466@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_094913_916451_5D522EDF 
X-CRM114-Status: GOOD (  30.34  )
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

On Tue, Oct 10, 2023 at 06:42:07PM +0200, Frank Wunderlich wrote:
> Am 10. Oktober 2023 18:04:23 MESZ schrieb Bjorn Helgaas <helgaas@kernel.org>:
> >On Fri, Oct 06, 2023 at 09:45:58AM +0200, Daniel Golle wrote:
> >> The driver for MediaTek gen3 PCIe hosts de-asserts all reset
> >> signals at the same time using a single register write operation.
> >> Delay the de-assertion of the #PERST signal by 100ms as required by
> >> PCIe CEM clause 2.2, some PCIe devices fail to come up otherwise.
> >> 
> >> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> >> ---
> >>  drivers/pci/controller/pcie-mediatek-gen3.c | 8 +++++++-
> >>  1 file changed, 7 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> >> index e0e27645fdf4..ba8cfce03aad 100644
> >> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> >> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> >> @@ -350,7 +350,13 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
> >
> >I feel like I'm missing something because this patch seems to be
> >adding a delay for T_PVPERL, but the comment before the existing
> >msleep() claims *it* is the T_PVPERL delay:
> >
> >         * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
> >         * and 2.2.1 (Initial Power-Up (G3 to S0)).
> >         * The deassertion of PERST# should be delayed 100ms (TPVPERL)
> >         * for the power and clock to become stable.
> >
> >>  	msleep(100);
> >>  
> >>  	/* De-assert reset signals */
> >> -	val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB);
> >> +	val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB);
> >> +	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> >> +
> >> +	msleep(100);
> >
> >So I'm confused about these two sleeps.  Are they for different
> >parameters?
> >
> >T_PVPERL is defined from "Power stable to PERST# inactive".  Do we
> >have any actual indication of when to start that delay, i.e., do we
> >have a clue about when power became stable?
> >
> >> +	/* De-assert PERST# signals */
> >> +	val &= ~(PCIE_PE_RSTB);
> >>  	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> >>  
> >>  	/* Check if the link is up or not */
> >> -- 
> >> 2.42.0
> >> 
> >> 
> >> _______________________________________________
> >> linux-arm-kernel mailing list
> >> linux-arm-kernel@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
> Hi
> 
> Seems it is same as the patch i've sent some time ago and which was rejected because of the additional delay...
> 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20230402131347.99268-1-linux@fw-web.de/
> 
> Or am i wrong?
> regards Frank

Reading the other series, I smell this can only be handled by a quirk...
This might be a defect or the board not following PCIE hw specs.

Thing is that the bug/limitation is there and we have enough info to
find way to fix this and lots of tester.

Eventually even a fixup based on a specific compatible.

-- 
	Ansuel

