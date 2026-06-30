Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C54AC43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 20:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgXozJM0Esf3soperqUV4RS/1nz6e3EwjgHcCk4GTiw=; b=TVOtJjqUxHfuOxg5YiPfEEqbPR
	YuhOx04pVJDtxq3UX2kqBpOLreOKvyauNpve33ZssgCdpKpw+cAmkpJbw1OIA2oqn+SiCUHAiP0lu
	pU53CQMonNvoegNymlZZM2iNVqK27QqyDtau3ee4LwCFFf2Rvlu1nDn8BW1H4aExSdlLQObQwOcSd
	reuS7WDmMa+yVlQaTWRRjQIenC2KjMjJ4AZeIMuFy4Da0ulszeFBxGlBKTrSDvN+HRYvOTVyLc2dl
	G5nGyiO2cl7aP42xlmIW4KlBMct4gqGD3AzkDv+ah6De8A3CiG/mgKiQ9MSX+dA52Azxobv4/i9a2
	FRzKYlyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefVK-00000000CPF-0XoN;
	Tue, 30 Jun 2026 20:56:26 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefVH-00000000COW-1QvT
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 20:56:24 +0000
Received: from omf06.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 13EB0120123;
	Tue, 30 Jun 2026 20:56:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id ADB7F20010;
	Tue, 30 Jun 2026 20:56:12 +0000 (UTC)
Date: Tue, 30 Jun 2026 16:56:12 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: <peter.wang@mediatek.com>
Cc: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
 <cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
 <jiajie.hao@mediatek.com>, <yi-fan.peng@mediatek.com>,
 <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>, <tun-yu.yu@mediatek.com>,
 <eddie.huang@mediatek.com>, <naomi.chu@mediatek.com>,
 <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: Re: [PATCH v3] ufs: core: add hba parameter to trace events
Message-ID: <20260630165612.3e21b510@gandalf.local.home>
In-Reply-To: <20250214083026.1177880-1-peter.wang@mediatek.com>
References: <20250214083026.1177880-1-peter.wang@mediatek.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: ADB7F20010
X-Stat-Signature: a91khpzt41hbtwnya4hbwi8kk583ma9y
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18XEdqmnOvCJFHQSlGyLSrMbLdwtYz64Mc=
X-HE-Tag: 1782852972-403709
X-HE-Meta: U2FsdGVkX19O995+yYKSbgc0QBIAYiDlHJb3jzPWpqxs6nLjN/KhphKM9MNIf0B59sVXGhitkyRuCOZZfblmGLb1C+Vy/5NlfVrH3smBU7dll1wHsZN2xPGr57UJBPlvM9c3w3p9hrCYDMi4DhVfT2Zl/405SNem/bnTpsXWt2sX2N5mN7MviYhMMhG4aN0S27S58WxzY4JU9UB5He8ino+NJOG7M3UYun33+NhS+kwLMSXcjqelQ4HKyNlbIuwI+UQ5Bp0rt6fCeFwUU3oyaO6+PM85V9CygJv7o+sehy0rjzEOUwo2x1FsGH0evq6MFiGJgstE4ALxX+/zElQJv0k1V7KbHrm0G2el+6v/gCPeZ+0Di+H81A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_135623_439845_32FE2973 
X-CRM114-Status: GOOD (  18.17  )
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

On Fri, 14 Feb 2025 16:29:36 +0800
<peter.wang@mediatek.com> wrote:

> From: Peter Wang <peter.wang@mediatek.com>
> 
> Included the ufs_hba structure as a parameter in various trace events
> to provide more context and improve debugging capabilities.
> Also remove dev_name which can replace by dev_name(hba->dev).
> 
> V3:
>  - Remove dev_name entry form TP_STRUCT__entry() to reduce the size.
> 


> V2:
>  - Remove dev_name and replace it with dev_name(hba->dev).

This patch needs to be reverted, as the above causes a bug.

> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
>  drivers/ufs/core/ufs_trace.h | 135 ++++++++++++++++++-----------------
>  drivers/ufs/core/ufshcd.c    |  68 +++++++++---------
>  2 files changed, 103 insertions(+), 100 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufs_trace.h b/drivers/ufs/core/ufs_trace.h
> index 84deca2b841d..caa32e23ffa5 100644
> --- a/drivers/ufs/core/ufs_trace.h
> +++ b/drivers/ufs/core/ufs_trace.h
> @@ -83,34 +83,34 @@ UFS_CMD_TRACE_TSF_TYPES
>  
>  TRACE_EVENT(ufshcd_clk_gating,
>  
> -	TP_PROTO(const char *dev_name, int state),
> +	TP_PROTO(struct ufs_hba *hba, int state),
>  
> -	TP_ARGS(dev_name, state),
> +	TP_ARGS(hba, state),
>  
>  	TP_STRUCT__entry(
> -		__string(dev_name, dev_name)
> +		__field(struct ufs_hba *, hba)
>  		__field(int, state)
>  	),
>  
>  	TP_fast_assign(
> -		__assign_str(dev_name);
> +		__entry->hba = hba;
>  		__entry->state = state;
>  	),
>  
>  	TP_printk("%s: gating state changed to %s",
> -		__get_str(dev_name),
> +		dev_name(__entry->hba->dev),

NO YOU CAN NOT DO THIS!!!!

The TP_fast_assign() happens when the trace event occurs. That is, where
the trace_ufshcd_clk_gating() function is called.

The TP_printk() happens when a user reads the "trace" file. Which could be
seconds, minutes, hours, days, even months later! There is absolutely no
guarantee that the pointer to __entry->hba would be around. This would
cause a crash of the kernel when the "trace" file is read.

I'm adding a boot up test to cause code like this to trigger a warning when
the trace event is registered (how I found this bug):

  https://lore.kernel.org/all/20260630164439.51e61b71@gandalf.local.home/

>  		__print_symbolic(__entry->state, UFSCHD_CLK_GATING_STATES))
>  );

The same goes for the rest of this file.

-- Steve

