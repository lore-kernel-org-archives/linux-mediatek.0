Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A948EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 16:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LD4p4sfEQZPIC3T25oNYTksum1ifXdgQj+79StS1Azk=; b=JhDLFUrKvfHggn
	A0R4DaFSXNs5gTN1/XEFUHDV6ISXALEZNp3jHMvn3fsE6WItKtpVpsdigDYC5hHej8HvvzS+plx+U
	63omcWMtKFZ6lIw5gdZTMRK7WITJJOEM3Dm0nsd3sR8+rGvnDcUzoYntoC79HthVAnFZ1JT2l4Mga
	Y2TJ1+QL/gx+5vBLTpe+HfheEFn0vXC4QyiKtyaxJLajWlClWUMHlZSGqBSmUvfBvV0kE958ouzuw
	sI0uPT8gHLMtfmAm0RBO1xu19w6O3RIrsaEHHxyduxW/yNSZiaLAX5LkmjGfBanYisOqrJVqU3bSi
	hFVVpq+hh8+iB2Pdz81g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUszn-00GmZG-Ro; Thu, 17 Mar 2022 16:29:03 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUsw5-00GkYs-Vz
 for linux-mediatek@lists.infradead.org; Thu, 17 Mar 2022 16:25:17 +0000
Received: by mail-pj1-x1032.google.com with SMTP id gb19so5323177pjb.1
 for <linux-mediatek@lists.infradead.org>; Thu, 17 Mar 2022 09:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6sSNVFojWkEa+kB1rxVwpwdlRixm4OOVySYgWgA6hHU=;
 b=MIjoGDMSbCb+8RaIRBW4suJHxfXpTo855FIRj8RMraN9uYrseVjLtsfrJaw8R1WJRC
 w7a/cIO3C4JIYz+QMRRQycoo5YTjncyXCvOMJEJrWvAuq9oZjUyAGlG32MpJ7JLZ4KVQ
 UuIs7rZVwuFSzXVdmtTDGuiHE4yihgkRMDzdEBLzr4WJGgGovWg8w9oRagk3iJksXpiP
 j+6kzguWQ39dcsXRZSE0xnhH+Z4dzJ9j1NO5YApUmQYCVNaeFvltVT0gEu64ITs0BluW
 4VoClCJ/rnS+Pdl4OyVHHYU/2ftCeULXTeKY23yLhfY0f5m4g4ssHj+30FXiuBSncF1c
 Ycjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6sSNVFojWkEa+kB1rxVwpwdlRixm4OOVySYgWgA6hHU=;
 b=3BC+qN+m988IywLbD9U9VdwXCosBSLDiU/KrBoH5A2vYDhqQXu4acYuguGwMiAfao/
 0rgiVQmyDlQEMZWot3CzEExGgeDcD7nBt4QuHEVsf0SbVYbCrYGpqp3H/94Prt+lafix
 bro/sudtn00MfklTluvQYJblqq+jaq7091f6bgKbxudd5DILrdfR4r1aebKyWxnEH4lA
 L/hvdhdQ6Bvsh6+D5SKyxnfMrUk3HkulJz2hhG9GI+T4hCMOQkwX22qTCpXC1TaH8/hD
 nW/QF3l52wEMz1IxCMLbe0MGjJbe87a18HtO+DSfJvyh03bNpdalncXLSVmaEUoy2+UG
 bqjA==
X-Gm-Message-State: AOAM532pJHwooXAw0WqWnmJlQuTlpHxEaj6nSIqZs3Zb1Vfmnj1JC9fR
 5qJiutPU1T1be7QPQrArhRlbWA==
X-Google-Smtp-Source: ABdhPJwFtbsxAvxS4DCDF9la8zCNKh+F6SHycDDweS3/B6oT2kQgW7jmQaauv6istzAcTM5eZtk0rQ==
X-Received: by 2002:a17:90a:6441:b0:1c6:8de6:9fc0 with SMTP id
 y1-20020a17090a644100b001c68de69fc0mr3243379pjm.163.1647534312833; 
 Thu, 17 Mar 2022 09:25:12 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 mq6-20020a17090b380600b001c6357f146csm10359793pjb.12.2022.03.17.09.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 09:25:11 -0700 (PDT)
Date: Thu, 17 Mar 2022 10:25:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4] remoteproc: mediatek: Fix side effect of mt8195 sram
 power on
Message-ID: <20220317162509.GA2630429@p14s>
References: <20220316031117.7311-1-tinghan.shen@mediatek.com>
 <20220316163451.GA2546942@p14s>
 <8a7be596-531a-52f4-c1b0-ed1d23cfa1bb@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a7be596-531a-52f4-c1b0-ed1d23cfa1bb@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_092514_091119_066EEC64 
X-CRM114-Status: GOOD (  36.90  )
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

On Wed, Mar 16, 2022 at 05:44:04PM +0100, AngeloGioacchino Del Regno wrote:
> Il 16/03/22 17:34, Mathieu Poirier ha scritto:
> > Good morning,
> > 
> > On Wed, Mar 16, 2022 at 11:11:17AM +0800, Tinghan Shen wrote:
> > > The definition of L1TCM_SRAM_PDN bits on mt8195 is different to mt8192.
> > > 
> > > L1TCM_SRAM_PDN bits[3:0] control the power of mt8195 L1TCM SRAM.
> > > 
> > > L1TCM_SRAM_PDN bits[7:4] control the access path to EMI for SCP.
> > > These bits have to be powered on to allow EMI access for SCP.
> > > 
> > > Bits[7:4] also affect audio DSP because audio DSP and SCP are
> > > placed on the same hardware bus. If SCP cannot access EMI, audio DSP is
> > > blocked too.
> > > 
> > > L1TCM_SRAM_PDN bits[31:8] are not used.
> > > 
> > > This fix removes modification of bits[7:4] when power on/off mt8195 SCP
> > > L1TCM. It's because the modification introduces a short period of time
> > > blocking audio DSP to access EMI. This was not a problem until we have
> > > to load both SCP module and audio DSP module. audio DSP needs to access
> > > EMI because it has source/data on DRAM. Audio DSP will have unexpected
> > > behavior when it accesses EMI and the SCP driver blocks the EMI path at
> > > the same time.
> > > 
> > > Fixes: 79111df414fc ("remoteproc: mediatek: Support mt8195 scp")
> > > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > > ---
> > > v4: add Fixes and Reviewed-by tags
> > > v3: fix build error
> > > v2: apply comments about macro definition and function calls
> > > ---
> > >   drivers/remoteproc/mtk_common.h |  2 ++
> > >   drivers/remoteproc/mtk_scp.c    | 67 +++++++++++++++++++++++++++++++----------
> > >   2 files changed, 53 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> > > index 5ff3867c72f3..ff954a06637c 100644
> > > --- a/drivers/remoteproc/mtk_common.h
> > > +++ b/drivers/remoteproc/mtk_common.h
> > > @@ -51,6 +51,8 @@
> > >   #define MT8192_CORE0_WDT_IRQ		0x10030
> > >   #define MT8192_CORE0_WDT_CFG		0x10034
> > > +#define MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS		GENMASK(7, 4)
> > > +
> > >   #define SCP_FW_VER_LEN			32
> > >   #define SCP_SHARE_BUFFER_SIZE		288
> > > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> > > index 36e48cf58ed6..5f686fe09203 100644
> > > --- a/drivers/remoteproc/mtk_scp.c
> > > +++ b/drivers/remoteproc/mtk_scp.c
> > > @@ -365,22 +365,22 @@ static int mt8183_scp_before_load(struct mtk_scp *scp)
> > >   	return 0;
> > >   }
> > > -static void mt8192_power_on_sram(void __iomem *addr)
> > > +static void scp_sram_power_on(void __iomem *addr, u32 reserved_mask)
> > 
> > Why is @reserved_mask needed?  It is not described in the changelong and as far
> > as I can see in this patchset the parameter is always set to '0', which has no
> > effect on the mask that gets generated.
> > 
> 
> Hello Mathieu,
> the @reserved_mask is explained in perhaps not very very clear terms, meaning
> that he's not explicitly saying the name of the new param, but that's it:
> 
> "This fix removes modification of bits[7:4] when power on/off mt8195 SCP
> L1TCM."
> 
> ....and it's actually being used, check below....
> 
> > Thanks,
> > Mathieu
> > 
> > >   {
> > >   	int i;
> > >   	for (i = 31; i >= 0; i--)
> > > -		writel(GENMASK(i, 0), addr);
> > > +		writel(GENMASK(i, 0) & ~reserved_mask, addr);
> > >   	writel(0, addr);
> > >   }
> > > -static void mt8192_power_off_sram(void __iomem *addr)
> > > +static void scp_sram_power_off(void __iomem *addr, u32 reserved_mask)
> 
> ...snip...
> 
> > > +static int mt8195_scp_before_load(struct mtk_scp *scp)
> > > +{
> > > +	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
> > > +	writel(0xff, scp->reg_base + MT8192_SCP2SPM_IPC_CLR);
> > > +
> > > +	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
> > > +
> > > +	/* enable SRAM clock */
> > > +	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
> > > +	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
> > > +	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
> 
> 
> > > +	scp_sram_power_on(scp->reg_base + MT8192_L1TCM_SRAM_PDN,
> > > +			  MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS);
> 
> here	

Yes - it's obvious now that you point it out.  

This patch conflicts with the newly added support for mt8186[1].  I tried to fix
it but did not know if mt8185 needed the same kind of bit masking as mt8195.
Please have a look and rebase to rproc-next.

Thanks,
Mathieu

[1]. 80d691854ffb remoteproc: mediatek: Support mt8186 scp

> 
> > > +	scp_sram_power_on(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
> > >   	/* enable MPU for all memory regions */
> > >   	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
> 
> ...snip...
> 
> > > +
> > > +static void mt8195_scp_stop(struct mtk_scp *scp)
> > > +{
> > > +	/* Disable SRAM clock */
> > > +	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
> > > +	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
> > > +	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
> > > +	scp_sram_power_off(scp->reg_base + MT8192_L1TCM_SRAM_PDN,
> > > +			   MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS);
> 
> and here 			^^^^^^^^
> 
> > > +	scp_sram_power_off(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
> 
> Cheers,
> Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
