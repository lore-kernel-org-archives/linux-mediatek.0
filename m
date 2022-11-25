Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E133CC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 17:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IW9TW2hjrT+/De0pJl1J2xvxRS2i1/S0hDRBrqezdyE=; b=Tth4UTlCniTRpuHpVbnNXf0RvJ
	OoyqrBwuR5TTUrsyRB0vdsjTouO3d2khAj5/Aeiy1COXAKdx+1Kd4VmFC9CS6URUJnnk+XN8IGCfX
	No4ZUzDXLRfDX2SvgENmRupvzi6w6ktEhqS2aBBPeqpZdwahUMt2y9d3/w1KId7ER8QHkMogcAura
	XXYt75hY6jM5PYT/ECwHDH1WmSrBNRC1HbR5NKN4P7Y5Xcu5erTxp9D6jZDrAoQBv3Vocb+2QOKS2
	Qex9w4Rm8oItE8paJw5ub2cZ/n0oyscZN8w+htYp3AbwHnu80+o+CaXNn1u6rCxsIXlE5Catz8MKi
	wr6tCjnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oycIa-000h5Y-56; Fri, 25 Nov 2022 17:15:36 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oycIX-000h4U-Vo
	for linux-mediatek@lists.infradead.org; Fri, 25 Nov 2022 17:15:35 +0000
Received: by mail-il1-x12e.google.com with SMTP id f6so2221286ilu.13
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Nov 2022 09:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IW9TW2hjrT+/De0pJl1J2xvxRS2i1/S0hDRBrqezdyE=;
        b=i95daCPbgmjJiaRUVDPwpjztsQpU5y1IZdtrbvbWhoqPaeLXPbMAiWP5GlDzc9//P+
         1x7oYxNZsjvdPj5ccAZRy+GC4mjgA5WwpSUILvWLfYvYR7I0rjh1oo0ny5jCePDycVn1
         2RZu7gZtDqX6wFcDUgcQT0WzCzKDMp8hbCeBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IW9TW2hjrT+/De0pJl1J2xvxRS2i1/S0hDRBrqezdyE=;
        b=KWdcScLaeUtFDg9PFq3lAfzD6MduF5RVwqIbSc1YsSbjLkRb2xCaB7GH04lDEhqvN5
         XmBfroDcPTjmi89e4g9JZGs39uhjaKAgyswjFMbzgKsuKeHKRwpBks1P8jMyDAqWJTcT
         M4KadEwUqEK+Z2tdkN3xyMIRtBrWwCmTfVh7P+BwhhwyX2KfnsNConkrWP4MQmdiD0Om
         me2HKY5MsOuHdB/Y7VRanHsNv1+8CBNVasF/jc4KVnGmhQtKMg7H5qvE0qYGNcwaJ5+0
         cZBMhgLuSNhQY+kO94vJL0ubVXfd4p7qqqGvhp1D+TY+hq9HnzX2enUCzdDaytf5XveY
         5oIA==
X-Gm-Message-State: ANoB5plSgP1B8/WuhoEM20BcMk8mJo6SdnNrbMf9Slv8F3XRcccllhlw
	xiGwC8BJphGtIJZ7CwxoDlGLP6WlqUgs5+zi
X-Google-Smtp-Source: AA0mqf6cDXfwBSMi6wt72LyWHHbrjvSHiYje6wMoQX+y2k/Z1eXcaJ3Yi+LpzJ05y7MZksfPPVFETA==
X-Received: by 2002:a92:d707:0:b0:2f6:1a0a:9e2a with SMTP id m7-20020a92d707000000b002f61a0a9e2amr8414969iln.121.1669396532410;
        Fri, 25 Nov 2022 09:15:32 -0800 (PST)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id p7-20020a056638216700b00379cc6aba93sm1510388jak.34.2022.11.25.09.15.29
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 09:15:30 -0800 (PST)
Received: by mail-il1-f180.google.com with SMTP id f6so2221234ilu.13
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Nov 2022 09:15:29 -0800 (PST)
X-Received: by 2002:a05:6e02:1312:b0:302:f7e9:ca64 with SMTP id
 g18-20020a056e02131200b00302f7e9ca64mr1841112ilr.133.1669396529417; Fri, 25
 Nov 2022 09:15:29 -0800 (PST)
MIME-Version: 1.0
References: <20221125-mtk-iommu-v1-0-bb5ecac97a28@chromium.org> <b5682296-4844-863c-83c1-1fb9a35009d8@arm.com>
In-Reply-To: <b5682296-4844-863c-83c1-1fb9a35009d8@arm.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 25 Nov 2022 18:15:18 +0100
X-Gmail-Original-Message-ID: <CANiDSCv14WNUmAf5H6H-nsz8WZTTT5niUO-dAGtkdohPnn3b1Q@mail.gmail.com>
Message-ID: <CANiDSCv14WNUmAf5H6H-nsz8WZTTT5niUO-dAGtkdohPnn3b1Q@mail.gmail.com>
Subject: Re: [PATCH] iommu/mediatek: Fix crash on isr after kexec()
To: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_091534_065400_5CF40F73 
X-CRM114-Status: GOOD (  28.72  )
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

Hi Robin


Thanks for your  review!

On Fri, 25 Nov 2022 at 18:02, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2022-11-25 16:28, Ricardo Ribalda wrote:
> > If the system is rebooted via isr(), the IRQ handler might be triggerd
> > before the domain is initialized. Resulting on an invalid memory access
> > error.
> >
> > Fix:
> > [    0.500930] Unable to handle kernel read from unreadable memory at virtual address 0000000000000070
> > [    0.501166] Call trace:
> > [    0.501174]  report_iommu_fault+0x28/0xfc
> > [    0.501180]  mtk_iommu_isr+0x10c/0x1c0
>
> Hmm, shouldn't we clear any pending faults at probe in
> mtk_iommu_hw_init(), before the IRQ is requested? mtk_iommu_isr() might
> still want to be robust against a spurious interrupt, but then it can
> simply return without doing anything at all if the domain is NULL, since
> we'll know that's the case.
>
> Thanks,
> Robin.
>
> (It might be nice if request_irq() had a flag to say "if this IRQ looks
> pending already just clear it" for drivers that know it could only be
> spurious at that point; kexec seems to lead to this problem quite a lot...)

It is not only about the "last" IRQ before kexec. The peripherals
under the IOMMU might still active and producing faults and therefore
IRQs.

I tried this:

@@ -886,6 +886,11 @@ static int mtk_iommu_hw_init(const struct
mtk_iommu_data *data, unsigned int ban
                         upper_32_bits(data->protect_base);
        writel_relaxed(regval, bankx->base + REG_MMU_IVRP_PADDR);

+       /* Clear previous IRQs */
+       regval = readl_relaxed(bankx->base + REG_MMU_INT_CONTROL0);
+       regval |= F_INT_CLR_BIT;
+       writel_relaxed(regval, bankx->base + REG_MMU_INT_CONTROL0);
+
        if (devm_request_irq(bankx->pdev, bankx->irq, mtk_iommu_isr, 0,
                             dev_name(bankx->pdev), (void *)bankx)) {
                writel_relaxed(0, bankx->base + REG_MMU_PT_BASE_ADDR);

And I still get the same crash


>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > To: Yong Wu <yong.wu@mediatek.com>
> > To: Joerg Roedel <joro@8bytes.org>
> > To: Will Deacon <will@kernel.org>
> > To: Robin Murphy <robin.murphy@arm.com>
> > To: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: iommu@lists.linux.dev
> > Cc: linux-mediatek@lists.infradead.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >   drivers/iommu/mtk_iommu.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 2ab2ecfe01f8..17f6be5a5097 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -454,7 +454,7 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
> >               fault_larb = data->plat_data->larbid_remap[fault_larb][sub_comm];
> >       }
> >
> > -     if (report_iommu_fault(&dom->domain, bank->parent_dev, fault_iova,
> > +     if (dom && report_iommu_fault(&dom->domain, bank->parent_dev, fault_iova,
> >                              write ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ)) {
> >               dev_err_ratelimited(
> >                       bank->parent_dev,
> >
> > ---
> > base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
> > change-id: 20221125-mtk-iommu-13023f971298
> >
> > Best regards,



-- 
Ricardo Ribalda

