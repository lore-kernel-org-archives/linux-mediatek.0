Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73642C10DCE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ueR1j+/c76LaVzWDsvGffIHw/5cW+im1b+zlUe6l46M=; b=o4SPE/BBIvjyVQYm4NFhS1YsDR
	EPTqX6LAEv6qatePi1cwgGzrExbp5NCKFbNQbjzWQ5peUp6nRWVyDUnZUtD0PEDFWbrdiOrIQD9/G
	ID8NSS9XWmSDck4uMXU+VXFPZdE7gus+pZmyugrK0B1iIN6W3phrkxt3l4IK0EQsIcLUmYQErgpIM
	zlMlnLaX45lkB7IIBQKYuwMhZAq86HVrYbj7ZFHOYUptR8kdgy93zCtZCt8EV51RNB1X083nnPyLr
	nADydKJuX5v1RLJZR9riOmcXCFA8IsV6MD30Jh4785ByIXRyhbpGav1ELl4dzbqR3K41I7FiEzTSn
	DPFeGF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBCRU-00Cba0-0v;
	Thu, 07 Dec 2023 11:21:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBCRR-00CbWf-0a;
	Thu, 07 Dec 2023 11:21:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6E990CE22FB;
	Thu,  7 Dec 2023 11:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F956C433C7;
	Thu,  7 Dec 2023 11:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701948074;
	bh=Y+kCs8J8Xte1h+4V1sfgYUbvivj8bv1hTvD8IuIDh+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d+gqu0HgAAr0TvC+OmZqlvMV+esi/bBl1U5DBLY5pEgyEhigN3qu5ic0LOFs8xGEW
	 GjubXsS26m3+ZXhanUEOi2q0MuSBCYCOSbgTxODrwr8cEHPIh7Dl7EJGsXDiMj0U+W
	 iKGzC2sbvJPXnJaWKM0Mw05vxO1S25jFERAWaJLB9M4IxPdzoOmgJgzGv6eeQS7RCx
	 frIuj2vmZ3/ydvd3y0ZvUX3oq6V6IBi0iMlKlfSAFKt+btXI6e+4hZCySzkCAV8nqS
	 mkiMIwUtlNdxgDalgPhnuXbOQgYZJFIEsTmWOHm/vHDlF5Er9OWLaoIZ1klFBqoeAg
	 PM+kvTyiDB6HA==
Date: Thu, 7 Dec 2023 16:51:01 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Naresh Maramaina <quic_mnaresh@quicinc.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chu.stanley@gmail.com, Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	quic_cang@quicinc.com, quic_nguyenb@quicinc.com
Subject: Re: [PATCH V2 1/3] ufs: core: Add CPU latency QoS support for ufs
 driver
Message-ID: <20231207112101.GK2932@thinkpad>
References: <20231204143101.64163-1-quic_mnaresh@quicinc.com>
 <20231204143101.64163-2-quic_mnaresh@quicinc.com>
 <590ade27-b4da-49be-933b-e9959aa0cd4c@acm.org>
 <692cd503-5b14-4be6-831d-d8e9c282a95e@quicinc.com>
 <5e7c5c75-cb5f-4afe-9d57-b0cab01a6f26@acm.org>
 <b9373252-710c-4a54-95cc-046314796960@quicinc.com>
 <20231206153242.GI12802@thinkpad>
 <effb603e-ca7a-4f24-9783-4d62790165ae@acm.org>
 <20231207094357.GI2932@thinkpad>
 <286b6f8a-c634-19ed-cf53-276cfe05d03f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <286b6f8a-c634-19ed-cf53-276cfe05d03f@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_032117_571672_CFB478B0 
X-CRM114-Status: GOOD (  33.50  )
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

On Thu, Dec 07, 2023 at 03:56:43PM +0530, Nitin Rawat wrote:
> 
> 
> On 12/7/2023 3:13 PM, Manivannan Sadhasivam wrote:
> > On Wed, Dec 06, 2023 at 03:02:04PM -1000, Bart Van Assche wrote:
> > > On 12/6/23 05:32, Manivannan Sadhasivam wrote:
> > > > On Wed, Dec 06, 2023 at 07:32:54PM +0530, Naresh Maramaina wrote:
> > > > > On 12/5/2023 10:41 PM, Bart Van Assche wrote:
> > > > > > On 12/4/23 21:58, Naresh Maramaina wrote:
> > > > > > > On 12/5/2023 12:30 AM, Bart Van Assche wrote:
> > > > > > > > On 12/4/23 06:30, Maramaina Naresh wrote:
> > > > > > > > > +    /* This capability allows the host controller driver to
> > > > > > > > > use the PM QoS
> > > > > > > > > +     * feature.
> > > > > > > > > +     */
> > > > > > > > > +    UFSHCD_CAP_PM_QOS                = 1 << 13,
> > > > > > > > >     };
> > > > > > > > 
> > > > > > > > Why does it depend on the host driver whether or not PM QoS is
> > > > > > > > enabled? Why isn't it enabled unconditionally?
> > > > > > > 
> > > > > > > For some platform vendors power KPI might be more important than
> > > > > > > random io KPI. Hence this flag is disabled by default and can be
> > > > > > > enabled based on platform requirement.
> > > > > > 
> > > > > > How about leaving this flag out unless if a host vendor asks explicitly
> > > > > > for this flag?
> > > > > 
> > > > > IMHO, instead of completely removing this flag, how about having
> > > > > flag like "UFSHCD_CAP_DISABLE_PM_QOS" which will make PMQOS enable
> > > > > by default and if some host vendor wants to disable it explicitly,
> > > > > they can enable that flag.
> > > > > Please let me know your opinion.
> > > 
> > > That would result in a flag that is tested but that is never set by
> > > upstream code. I'm not sure that's acceptable.
> > > 
> > 
> > Agree. The flag shouldn't be introduced if there are no users.
> > 
> > > > If a vendor wants to disable this feature, then the driver has to be modified.
> > > > That won't be very convenient. So either this has to be configured through sysfs
> > > > or Kconfig if flexibility matters.
> > > 
> > > Kconfig sounds worse to me because changing any Kconfig flag requires a
> > > modification of the Android GKI kernel.
> > > 
> > 
> > Hmm, ok. Then I think we can have a sysfs hook to toggle the enable switch.
> 
> Hi Bart, Mani
> 
> How about keeping this feature enabled by default and having a module
> parameter to disable pmqos feature if required ?
> 

Module params not encouraged these days unless there are no other feasible
options available.

- Mani

> Regards,
> Nitin
> 
> > 
> > - Mani
> > 
> > > Thanks,
> > > 
> > > Bart.
> > 
> 

-- 
மணிவண்ணன் சதாசிவம்

