Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EC1C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vPpu55CWctU5kwFhjf/7SlTo/I53ViTakRJXmAVb0e0=; b=Ct2A+TpniYq4uJGmrikG5RBcD4
	dPtDXqTyWWeNiN6JuRqyk1GkxgACuXq655kjBYU+CPTrCNt/3zM44qyzM3cWsW+Zu9/1oLwdCy8ar
	MLO/v+Z+2eOWZCx4Sx6iYLg7b621WAo7SxcHRnm86C3b0dSXtl9u9GEjHp/mI26W6MuCoKLlzM6Qj
	Pt2Me5lPHuIYRAjRAc7QiORPGitlPD1cGjJEUrOVWqyVDntoexk+528r2RDCAaoSC1Og241eEKOTc
	ViBGV1mrPfpziz4BQVXsQ/p4LKmoWuHEwC6pQmjGv0aVyOXdmxwAsHENlD/Pk6Phf9QZo2ZhQy1xv
	xAI6ZqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAttS-00AdJm-39;
	Wed, 06 Dec 2023 15:32:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAttP-00AdIT-0i;
	Wed, 06 Dec 2023 15:32:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7C3C5B8218F;
	Wed,  6 Dec 2023 15:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B75DC433C7;
	Wed,  6 Dec 2023 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701876772;
	bh=w1otnxj6ZQubR19XyLc2pJyxuUrOYv5s6Wn1rb3d1zM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rGASEMZu2w8Un5785u0aGDVqoWrEGsXz1MReexBAxddidRe4ZZe5zAr1Sm0k93D+u
	 Ui2+j1KIQLPLlEMwubHnwKWoqH9i2LMROw+PNo+os8rAPeQ4hST37N62nDpHBIkPO4
	 uHH8Emz7IPGW/hZ6oLAl6gSzocpcZnFhp6YtRXrD5oszVH52J7j9aOgXwG0nWmcR3T
	 k6K524JwL7SyQMLDxr20AN1PKLPXkVriRV40ck2DScbYe+1PPJuMSCQUvXO70HkFBw
	 uGJnKtfwIFtCkPIEyrUnhg4Hi3AGxm9XoGnIVmFItvXFPxt/PpS5LdtUW6oEHHL6xL
	 hEgUg9hmtXlZg==
Date: Wed, 6 Dec 2023 21:02:42 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Naresh Maramaina <quic_mnaresh@quicinc.com>
Cc: Bart Van Assche <bvanassche@acm.org>,
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
	quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
	Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: Re: [PATCH V2 1/3] ufs: core: Add CPU latency QoS support for ufs
 driver
Message-ID: <20231206153242.GI12802@thinkpad>
References: <20231204143101.64163-1-quic_mnaresh@quicinc.com>
 <20231204143101.64163-2-quic_mnaresh@quicinc.com>
 <590ade27-b4da-49be-933b-e9959aa0cd4c@acm.org>
 <692cd503-5b14-4be6-831d-d8e9c282a95e@quicinc.com>
 <5e7c5c75-cb5f-4afe-9d57-b0cab01a6f26@acm.org>
 <b9373252-710c-4a54-95cc-046314796960@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9373252-710c-4a54-95cc-046314796960@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_073255_552101_1AA1E731 
X-CRM114-Status: GOOD (  24.95  )
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

On Wed, Dec 06, 2023 at 07:32:54PM +0530, Naresh Maramaina wrote:
> 
> 
> On 12/5/2023 10:41 PM, Bart Van Assche wrote:
> > On 12/4/23 21:58, Naresh Maramaina wrote:
> > > On 12/5/2023 12:30 AM, Bart Van Assche wrote:
> > > > On 12/4/23 06:30, Maramaina Naresh wrote:
> > > > > +    /* This capability allows the host controller driver to
> > > > > use the PM QoS
> > > > > +     * feature.
> > > > > +     */
> > > > > +    UFSHCD_CAP_PM_QOS                = 1 << 13,
> > > > >   };
> > > > 
> > > > Why does it depend on the host driver whether or not PM QoS is
> > > > enabled? Why isn't it enabled unconditionally?
> > > 
> > > For some platform vendors power KPI might be more important than
> > > random io KPI. Hence this flag is disabled by default and can be
> > > enabled based on platform requirement.
> > 
> > How about leaving this flag out unless if a host vendor asks explicitly
> > for this flag?
> 
> IMHO, instead of completely removing this flag, how about having
> flag like "UFSHCD_CAP_DISABLE_PM_QOS" which will make PMQOS enable
> by default and if some host vendor wants to disable it explicitly,
> they can enable that flag.
> Please let me know your opinion.
> 

If a vendor wants to disable this feature, then the driver has to be modified.
That won't be very convenient. So either this has to be configured through sysfs
or Kconfig if flexibility matters.

- Mani

> > > > 
> > > > > + * @pm_qos_req: PM QoS request handle
> > > > > + * @pm_qos_init: flag to check if pm qos init completed
> > > > >    */
> > > > 
> > > > Documentation for pm_qos_init is missing.
> > > > 
> > > Sorry, i didn't get your comment, i have already added documentation
> > > for @pm_qos_init, @pm_qos_req variable as above. Do you want me to
> > > add this information some where else as well?
> > 
> > Oops, I meant 'qos_vote'.
> 
> Sure. I'll take of this in next patchset.
> 
> > 
> > Thanks,
> > 
> > Bart.
> > 
> 
> Thanks,
> Naresh
> 

-- 
மணிவண்ணன் சதாசிவம்

