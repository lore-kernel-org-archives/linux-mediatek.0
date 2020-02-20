Return-Path: <SRS0=Q2+k=4I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46C7C11D04
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2020 13:31:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8652206E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2020 13:31:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DTzgmhTA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pKCHkOqt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8652206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDfzMBerDrRdAntdi+vWEDeXuxL+udHStS4xMqpFlzQ=; b=DTzgmhTA0QJucy
	iVHGOXtBX/PazBz5R6nLSl7XbIJWGdvvBh55BuvSpNsY9oxIm8gzkpKSzsyca2eH5zJv19ulGOlU4
	zMMUK4yr9/Ld4L/RCfYlcHfEl1iT96N4BFHgrzd38ybrKSArsnKQUEU3Rsiv/AZykv+2YZn3vXN9n
	DEMpfyyu7lddTDvGxDizkiDq7rEHOZmw5V9RgRDHNzVnuL+sbzBXv9lVIUfcKBvHHpkQYijq0kzCD
	uiewYHyJkD/h4rom/r3xDEgJZwZZeRWYeaKYC9DS7ckwETn2VqG3505tRdf2+T7Nf1radZStbTnUl
	uUhzgLb4vpI8DGu6ApOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4lv1-0007lf-KE; Thu, 20 Feb 2020 13:31:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4luq-0007WW-HE; Thu, 20 Feb 2020 13:30:58 +0000
X-UUID: 5077218484e34b079bcc58cbb3197cb3-20200220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=djf6C0Eeez3RoBVkU7r/xsvLyT1pkg0ulRptnAvpIIw=; 
 b=pKCHkOqttH21TlFjUvPYdX4gP4MsLYjUlXJZ4qiGeJo9YQmACakGqJB0nOloXDd/Ag3dD53pWbyk9ggCo+FJNhVcfBu3IVFdrYiV0W4fhUUmNh6It2eCQMj2BGHTC1zPob6Wp/abAa9q/4V09OZlUTONwEf6TnGVv4SaKtTmUdk=;
X-UUID: 5077218484e34b079bcc58cbb3197cb3-20200220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 518899328; Thu, 20 Feb 2020 05:30:50 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 20 Feb 2020 05:30:48 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 20 Feb 2020 21:28:54 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 20 Feb 2020 21:31:13 +0800
Message-ID: <1582205440.26304.50.camel@mtksdccf07>
Subject: Re: [PATCH v1 1/2] scsi: ufs: add required delay after gating
 reference clock
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Thu, 20 Feb 2020 21:30:40 +0800
In-Reply-To: <bbb0b0637d9667d4691a9a28f9988dea@codeaurora.org>
References: <20200217093559.16830-1-stanley.chu@mediatek.com>
 <20200217093559.16830-2-stanley.chu@mediatek.com>
 <c6874825dd60ea04ed401fbd1b5cb568@codeaurora.org>
 <1581945168.26304.4.camel@mtksdccf07>
 <e518c4d1d94ec15e9c4c31c34a9e42d1@codeaurora.org>
 <1581946449.26304.15.camel@mtksdccf07>
 <56c1fc80919491d058d904fcc7301835@codeaurora.org>
 <a8cd5beee0a1e12a40da752c6cd9b5de@codeaurora.org>
 <1582103495.26304.42.camel@mtksdccf07>
 <bbb0b0637d9667d4691a9a28f9988dea@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_053056_583042_F8B828F7 
X-CRM114-Status: GOOD (  21.10  )
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
Cc: chun-hung.wu@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, andy.teng@mediatek.com, jejb@linux.ibm.com,
 peter.wang@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 bvanassche@acm.org, hongwus@codeaurora.org,
 Asutosh Das <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Can,

On Wed, 2020-02-19 at 18:33 +0800, Can Guo wrote:
> Hi Stanley,
> 
> On 2020-02-19 17:11, Stanley Chu wrote:
> > Hi Can,
> > 
> > On Wed, 2020-02-19 at 10:35 +0800, Can Guo wrote:
> > 
> >> Since we all need this delay here, how about put the delay in the
> >> entrence of ufshcd_setup_clocks(), before vops_setup_clocks()?
> >> If so, we can remove all the delays we added in our vops since the
> >> delay anyways delays everything inside ufshcd_setup_clocks().
> >> 
> > 
> > Always putting the delay in the entrance of ufshcd_setup_clocks() may
> > add unwanted delay for vendors, just like your current implementation,
> > or some other vendors who do not want to disable the reference clock.
> > 
> > I think current patch is more reasonable because the delay is applied 
> > to
> > clock only named as "ref_clk" specifically.
> > 
> > If you needs to keep "ref_clk" in DT, would you consider to remove the
> > delay in your ufs_qcom_dev_ref_clk_ctrl() and let the delay happens via
> > common ufshcd_setup_clocks() only? However you may still need delay if
> > call path comes from ufs_qcom_pwr_change_notify().
> > 
> > What do you think?
> > 
> 
> I agree current change is more reasonable from what it looks, but the 
> fact
> is that I canont remove the delay in ufs_qcom_dev_ref_clk_ctrl() even 
> with
> this change. On our platforms, ref_clk in DT serves multipule purposes,
> the ref_clk provided to UFS device is actually controlled in
> ufs_qcom_dev_ref_clk_ctrl(), which comes before where this change kicks 
> start,
> so if I remove the delay in ufs_qcom_dev_ref_clk_ctrl(), this change 
> cannot
> provide us the correct delay before gate the ref_clk provided to UFS 
> device.

> > Always putting the delay in the entrance of ufshcd_setup_clocks() may
> > add unwanted delay for vendors, just like your current implementation,
> > or some other vendors who do not want to disable the reference clock.
> 
> I meant if we put the delay in the entrance, I will be able to remove
> the delay in ufs_qcom_dev_ref_clk_ctrl(). Meanwhile, we can add proper
> checks before the delay to make sure it is initiated only if ref_clk 
> needs
> to be disabled, i.e:
> 
> if(!on && !skip_ref_clk && hba->dev_info.clk_gating_wait_us)
>      usleep_range();
> 
> Does this look better to you?

Firstly thanks so much for above details.

Again this statement may also add unwanted delay if some other vendors
does not have "ref_clk" in DT or they don't/can't disable the reference
clock provided to UFS device.

> 
> Anyways, we will see regressions with this change on our platforms, can 
> we
> have more discussions before get it merged? It should be OK if you go 
> with
> patch #2 alone first, right? Thanks.

Now the fact is that this change will impact your flow and it seems no
solid conclusion yet. Sure I could drop patch #1 and submit patch #2
only first : )

Thanks,
Stanley Chu



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
