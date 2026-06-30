Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E85C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 22:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOQYmXoJWq6uX92/nhVniUwSxIBi5/wxJoHqcXLAVdA=; b=H5zYj2nHIg5hkUGV8Tfm74ts1B
	oA9+1QjQNNeDqv3NbL2U/dg83aQCEo3ANM+rT2amfhYw339uM2/2mAx2XQOWE+70GsXLEI3nRdbqJ
	65ZQjCKdJgbfWsiDab/X3sQV46vR+l83NxviQhg02z2Dv/LhBLCPSIhbztO1sio/kTbSyrPAZpC1v
	E7z8ssWq/tdhs6hEZQD3tH4A3BECZ5nsAkX6gK6vdMxxQrBVTwsA4CqSJ72i2u4CzhH0v+ZLTeCwc
	DGvlfVEivyU1yXWMWuwaNBfTWifkp6zXDiZqi2ahK9ZQFKeXZwi4A5LoPaI6vJMgCB5B8CX4Ke7U7
	oDSygDGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wehQ6-00000000L6F-2b5W;
	Tue, 30 Jun 2026 22:59:10 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wehQ1-00000000L5L-37Sh
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 22:59:07 +0000
Received: from omf14.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 1064AC077A;
	Tue, 30 Jun 2026 22:59:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id 664BF30;
	Tue, 30 Jun 2026 22:58:57 +0000 (UTC)
Date: Tue, 30 Jun 2026 18:58:57 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com, sutoshd@codeaurora.org, wsd_upstream@mediatek.com,
 linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
 alice.chao@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com,
 jiajie.hao@mediatek.com, yi-fan.peng@mediatek.com, qilin.tan@mediatek.com,
 lin.gui@mediatek.com, tun-yu.yu@mediatek.com, eddie.huang@mediatek.com,
 naomi.chu@mediatek.com, ed.tsai@mediatek.com, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ufs: core: add hba parameter to trace events
Message-ID: <20260630185857.54c55d97@gandalf.local.home>
In-Reply-To: <16f26ea9-69d6-4f2f-9adc-c576c288a2f5@acm.org>
References: <20250213113707.955255-1-peter.wang@mediatek.com>
	<16f26ea9-69d6-4f2f-9adc-c576c288a2f5@acm.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 664BF30
X-Stat-Signature: uwehtoqqednqhf3zyo5jct5fcbfkhzr8
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/neeUCV/R9KHhr+SS3nL47b2vY2VzQvkE=
X-HE-Tag: 1782860337-648722
X-HE-Meta: U2FsdGVkX19nYBCqwu9Ixhtn09ay8RBzQ10D02bQ6sj9JfNDHi+XUt/BVZ4gGAaXgyyFLsjh8lbrwf4x+RJUcsbgjLoQE+pFkRBoKhPWJonoTwg32+oRA1Y1xvdg4Em/A6mEJW5v6irtqUi3xX04bR0xjgdImMU3GChz6lRzZlbQjRZgzPmzbJRVi1MhHvAAn0d+3nM7OKrXU0ggWrQ4X3YT7vqhxODo/OFhNtsUStSPx97/RBhxC340pR2yjuNo0ObTldNO+0gp2B05+BunahPio2cMJcm0ZCt9ASPRpbaPnS2jeDiNFb8ZTLXet79cxCGTvH5+zIBllavd2ZRAM1TtlB9R5pfMugudoQQQ8tik9aTC7JvqKQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_155905_848683_317E30D5 
X-CRM114-Status: GOOD (  11.62  )
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

On Thu, 13 Feb 2025 09:19:42 -0800
Bart Van Assche <bvanassche@acm.org> wrote:

> On 2/13/25 3:35 AM, peter.wang@mediatek.com wrote:
> > diff --git a/drivers/ufs/core/ufs_trace.h b/drivers/ufs/core/ufs_trace.h
> > index 84deca2b841d..2f79982846b6 100644
> > --- a/drivers/ufs/core/ufs_trace.h
> > +++ b/drivers/ufs/core/ufs_trace.h
> > @@ -83,16 +83,18 @@ UFS_CMD_TRACE_TSF_TYPES
> >   
> >   TRACE_EVENT(ufshcd_clk_gating,
> >   
> > -	TP_PROTO(const char *dev_name, int state),
> > +	TP_PROTO(struct ufs_hba *hba, int state),
> >   
> > -	TP_ARGS(dev_name, state),
> > +	TP_ARGS(hba, state),
> >   
> >   	TP_STRUCT__entry(
> > -		__string(dev_name, dev_name)
> > +		__field(struct ufs_hba *, hba)
> > +		__string(dev_name, dev_name(hba->dev))
> >   		__field(int, state)
> >   	),  
> 
> Please reduce the size of the tracing entries by removing dev_name from 
> TP_STRUCT__entry() and by replacing 'dev_name' with 'dev_name(hba->dev)'
> in the TP_printk() calls.

For future references, please do not recommend moving dereferences into the
TP_printk() callers. Those happen when the event is read by the user and
the hba pointer may no longer exist.

-- Steve

