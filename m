Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE09AC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 10:57:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79CD123BAB
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 10:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79CD123BAB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JwVi30TvlkIKN7KewXyEWI1gdw5bpwUszkGClUZUE+g=; b=qEXK6rpAscYvbPkzwHGzHWuyR
	D6dKLr+Zxv7zaCPQcutbkMGPDyVmWbB0ikgykftX/jIn2spgHjZsyGrtuBwlfFu06IMd/xkO6Vpq7
	PKkF+KgZrsIhgKIpoVYCyie6TiZtseMLak6t0Loanwp380y35E6Filue5gGF5SSO8ZAOFcTxLuQ03
	17nwoB+okLh32ZcgXg8YD69gMYyqxt2S0kMxc2FBWJ+V2iulvzxabX4x2UF+VjmyG5tvOAkjcZGoh
	oGkQ2OFKH8rOc4d0g5dWifVKDMxrlsq21kCqo6YS3zTv1CuxTiDbzjP8UEfI79lhtaSYAhjqdRAtD
	oPzyl5YLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knJdm-000581-Ht; Thu, 10 Dec 2020 10:57:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knJdg-00055c-TW; Thu, 10 Dec 2020 10:57:38 +0000
Date: Thu, 10 Dec 2020 11:58:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607597855;
 bh=+yNy2/EhKij1FrxrK/M173AdxIP7Qw+piOTeN0Owbwk=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=YqWT9A8V1/rwqj8dU+bFqO3kPDEHGzBagQ50kyDtSZqSbkS6KE1WRE95VtxK6gnbD
 JqzjKXl1JUblAc7BspaphdDpa9W7IHVld5x+e/tAF2M1DFri3qOVhfbGs/KH5nGKHp
 VBwkyzBcX2PHgiRtRNv9qddao6RrODx2jEPgFmGw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ikjoon Jang <ikjn@chromium.org>
Subject: Re: [PATCH v2 3/3] usb: xhci-mtk: fix unreleased bandwidth data
Message-ID: <X9H/ZVpHf2Owd6rj@kroah.com>
References: <20201210104747.3416781-1-ikjn@chromium.org>
 <20201210184700.v2.3.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210184700.v2.3.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_055737_088874_83936578 
X-CRM114-Status: GOOD (  12.69  )
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
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 10, 2020 at 06:47:47PM +0800, Ikjoon Jang wrote:
> xhci-mtk has hooks on add_endpoint() and drop_endpoint() from xhci
> to handle its own sw bandwidth managements and stores bandwidth data
> into internal table every time add_endpoint() is called,
> so when bandwidth allocation fails at one endpoint, all earlier
> allocation from the same interface could still remain at the table.
> 
> This patch adds two more hooks from check_bandwidth() and
> reset_bandwidth(), and make mtk-xhci to releases all failed endpoints
> from reset_bandwidth().
> 
> Fixes: 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host controller")
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

Shouldn't this be the first patch in the series?  You don't want a fix
to be dependent on code style changes, otherwise it is really really
hard to backport it to older kernels that might need this fix, right?

Can you re-order these patches please?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
