Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84171C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 07:59:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FBBB2083B
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 07:59:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2pHs0+U2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OqZmBKfC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FBBB2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L5NK15rJkTLB/zb2EAT36/jC+DBQL/id3Ubt1ow466M=; b=2pHs0+U26r2E9pwwhJo4dXySy
	jY3K6+j9uHi8GE+M/BYH9FHy9tgliz6h+cUpNFQXgDzVJSZXQoBxld5FxQTOnEmPeob9FFW3am1ae
	M8i2WBWWeRXv7wqqVWguFoWd2UYgiKPPaottkoZGVZ5fgAun7mGyIXOBUyX3KCd0qm616qTWVDM6L
	oxR51Gge80WvALX4vyi+CsaMKrIg0eC+PmG5+3mwCE9c/NNquKY82+wvi57jFeq6dsCWSbAuVTqHe
	oOu9BAVEv6VBi5VnYDARRIfWpDdOKnS46He8sNkkkoNxjtyAhJgFwZecGoaGZChJZlwC2sOjLbuNS
	g+PEJfsIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k13TZ-0002gx-Pm; Thu, 30 Jul 2020 07:59:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k13TT-0002fD-I4; Thu, 30 Jul 2020 07:59:38 +0000
X-UUID: ffee24f13e2d4cee99625c5ac2e88852-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QT+uX98yM5wPRP87L48QAc838LaBBRGGnUX+x83+Owg=; 
 b=OqZmBKfClQ377MsFIHx97ZfUYVRWoTZ8P4PJF8nipz/Qgf4+bVzMc5xfxhp/KCA/SMO9E1feGzv2B/pxSRA57Q0wUC9AawHa0j2OjviT2gDwmRsmmpboPqYrY6n6e+See9/BDcXVQZrGklwVut2mkJvSGeOcFT90O55RcTGptsM=;
X-UUID: ffee24f13e2d4cee99625c5ac2e88852-20200729
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 283392392; Wed, 29 Jul 2020 23:59:25 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 00:59:21 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 15:59:19 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 15:59:19 +0800
Message-ID: <1596095961.17247.51.camel@mtkswgap22>
Subject: Re: [PATCH v2] scsi: ufs: Fix possible infinite loop in ufshcd_hold
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Thu, 30 Jul 2020 15:59:21 +0800
In-Reply-To: <4cb7403fae7226b70a133d4a7ecee755@codeaurora.org>
References: <20200729024037.23105-1-stanley.chu@mediatek.com>
 <bfbb48b06fa3464da0cbd2aee8a32649@codeaurora.org>
 <1596018374.17247.41.camel@mtkswgap22>
 <4cb7403fae7226b70a133d4a7ecee755@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F7CFC4EC7F7578863B89E2903609534A2B1AFCBEF5FD0A01094A74EAE3E32E5E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_035935_748113_D5BB14F9 
X-CRM114-Status: GOOD (  47.71  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 asutoshd@codeaurora.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 chaotian.jing@mediatek.com, cc.chou@mediatek.com,
 linux-arm-kernel@lists.infradead.org, bvanassche@acm.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Can,

On Wed, 2020-07-29 at 18:53 +0800, Can Guo wrote:
> Hi Stanley,
> 
> On 2020-07-29 18:26, Stanley Chu wrote:
> > Hi Can,
> > 
> > On Wed, 2020-07-29 at 16:43 +0800, Can Guo wrote:
> >> Hi Stanley,
> >> 
> >> On 2020-07-29 10:40, Stanley Chu wrote:
> >> > In ufshcd_suspend(), after clk-gating is suspended and link is set
> >> > as Hibern8 state, ufshcd_hold() is still possibly invoked before
> >> > ufshcd_suspend() returns. For example, MediaTek's suspend vops may
> >> > issue UIC commands which would call ufshcd_hold() during the command
> >> > issuing flow.
> >> >
> >> > Now if UFSHCD_CAP_HIBERN8_WITH_CLK_GATING capability is enabled,
> >> > then ufshcd_hold() may enter infinite loops because there is no
> >> > clk-ungating work scheduled or pending. In this case, ufshcd_hold()
> >> > shall just bypass, and keep the link as Hibern8 state.
> >> >
> >> 
> >> The infinite loop is expected as ufshcd_hold is called again after
> >> link is put to hibern8 state, so in QCOM's code, we never do this.
> > 
> > Sadly MediaTek have to do this to make our UniPro to enter low-power
> > mode.
> > 
> >> The cap UFSHCD_CAP_HIBERN8_WITH_CLK_GATING means UIC link state
> >> must not be HIBERN8 after ufshcd_hold(async=false) returns.
> > 
> > If driver is not in PM scenarios, e.g., suspended, above statement 
> > shall
> > be always followed. But two obvious violations are existed,
> > 
> > 1. In ufshcd_suspend(), link is set as HIBERN8 behind ufshcd_hold()
> > 2. In ufshcd_resume(), link is set back as Active before
> > ufshcd_release() is invoked
> > 
> > So as my understanding, special conditions are allowed in PM scenarios,
> > and this is why "hba->clk_gating.is_suspended" is introduced. By this
> > thought, I used "hba->clk_gating.is_suspended" in this patch as the
> > mandatory condition to allow ufshcd_hold() usage in vendor suspend and
> > resume callbacks.
> > 
> > 
> >> Instead of bailing out from that loop, which makes the logic of
> >> ufshcd_hold and clk gating even more complex, how about removing
> >> ufshcd_hold/release from ufshcd_send_uic_cmd()? I think they are
> >> redundant and we should never send DME cmds if clocks/powers are
> >> not ready. I mean callers should make sure they are ready to send
> >> DME cmds (and only callers know when), but not leave that job to
> >> ufshcd_send_uic_cmd(). It is convenient to remove ufshcd_hold/
> >> release from ufshcd_send_uic_cmd() as there are not many places
> >> sending DME cmds without holding the clocks, ufs_bsg.c is one.
> >> And I have tested my idea on my setup, it worked well for me.
> >> Another benefit is that it also allows us to use DME cmds
> >> in clk gating/ungating contexts if we need to in the future.
> >> 
> > 
> > Brilliant idea! But this may not solve problems if vendor callbacks 
> > need
> > more than UIC commands in the future.
> > 
> > This simple patch could make all vendor operations on UFSHCI in PM
> > callbacks possible with UFSHCD_CAP_HIBERN8_WITH_CLK_GATING enabled, and
> > again, it allows those operations in PM scenarios only.
> > 
> 
> Other than UIC cmds, I can only think of device manangement cmds (like 
> query).
> If device management cmds come into the way in the future, we fix it as 
> well.
> I mean that is the right thing to do in my opinion - just like we don't 
> call
> pm_runtime_get_sync() in ufshcd_send_uic_cmd().
> 
> I can understand that you want a simple/quick fix to get it work for you 
> once
> for all, but from my point of view, debugging clk gating/ungating really 
> takes
> huge efforts sometime (I've spent a lot of time on it). Some flash 
> vendors also
> use it in their own driver widely which makes some failure scenes even 
> harder to
> undertand/debug. So the first thing comes to my head is that we should 
> avoid
> making it more complex or giving it more exceptions.
> 
>  From functionality point of view, it looks ok to me. It is just that I 
> cannot
> predict it won't cause new problems since the clk gating/ungating 
> sequeces are
> like magic in some use cases sometime.

Thanks for the functionality review.

I totally understand what you mentioned above about the clk-gating
debugging because we also spent lots of time for issue analysis.

I just finished some fault injection for this patch in our platform, the
results are fine.

The active window of this patch is limited: Starting from
ufshcd_link_state_transition() in ufshcd_suspend to ufshcd_vops_resume()
in ufshcd_resume() because the link is back to LINKUP state in MediaTek
resume callback. So I was focus on injecting errors in our callbacks
between this period and most of injected fails triggered host and device
reset flow.

For example,
Suspend: UniPro PowerDownControl timeout
Resume: hba_enable timeout
Resume: UniPro PowerDownControl timeout
Resume: HIBERN8 Exit timeout

Hope these tests can ease your concerns.

Thanks,
Stanley Chu

> 
> Thanks,
> 
> Can Guo.
> 
> >> Please let me know your idea, thanks.
> >> 
> >> Can Guo.
> > 
> > Thanks,
> > Stanley Chu
> > 
> >> 
> >> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> >> > Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> >> >
> >> > ---
> >> >
> >> > Changes since v1:
> >> > - Fix return value: Use unique bool variable to get the result of
> >> > flush_work(). Thcan prevent incorrect returned value, i.e., rc, if
> >> > flush_work() returns true
> >> > - Fix commit message
> >> >
> >> > ---
> >> >  drivers/scsi/ufs/ufshcd.c | 5 ++++-
> >> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> >> > index 577cc0d7487f..acba2271c5d3 100644
> >> > --- a/drivers/scsi/ufs/ufshcd.c
> >> > +++ b/drivers/scsi/ufs/ufshcd.c
> >> > @@ -1561,6 +1561,7 @@ static void ufshcd_ungate_work(struct work_struct
> >> > *work)
> >> >  int ufshcd_hold(struct ufs_hba *hba, bool async)
> >> >  {
> >> >  	int rc = 0;
> >> > +	bool flush_result;
> >> >  	unsigned long flags;
> >> >
> >> >  	if (!ufshcd_is_clkgating_allowed(hba))
> >> > @@ -1592,7 +1593,9 @@ int ufshcd_hold(struct ufs_hba *hba, bool async)
> >> >  				break;
> >> >  			}
> >> >  			spin_unlock_irqrestore(hba->host->host_lock, flags);
> >> > -			flush_work(&hba->clk_gating.ungate_work);
> >> > +			flush_result = flush_work(&hba->clk_gating.ungate_work);
> >> > +			if (hba->clk_gating.is_suspended && !flush_result)
> >> > +				goto out;
> >> >  			spin_lock_irqsave(hba->host->host_lock, flags);
> >> >  			goto start;
> >> >  		}

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
