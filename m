Return-Path: <SRS0=Knfd=4Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC3DC3F2CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 16:49:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D05E424697
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 16:49:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SM/55AEI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D05E424697
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T4UEhihsA3F0TF5GhdnbBd7MGGUH2upUxNbckcoy1BA=; b=SM/55AEIZUwNYr
	Wai9hw6v6VRmVT376riJOAVwEN3nThbalVMLKTjdPIvUxebzTnu1A6qEQ2D4tMxG10HSXdnWivw28
	A/rNTLLn8PO+DKB9NRP49nVP+yGM3IxF+KL19/MSx/Vo4EIjCgb6KLKFcu7zEBSoOMxULowkwOjQB
	BakawCQ8wwK2L0NOpjOsJf4SjxKHSFEMg0u7p/IDIyRRjBsB/tAvfH8Lo7VU4bP2FNwIu0dH8ebNB
	hGibz7/yC6/bpLcNPMt40JaduNHY9yWEOA2MF8sUa8LxsXYFBXSTnqI9jTBkzlhWVhZ1O/7DMVd8a
	SC8congwn/lJpD0xEotA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7ip3-0000ks-0w; Fri, 28 Feb 2020 16:49:09 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7ion-0000ZY-Uy; Fri, 28 Feb 2020 16:48:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6113031B;
 Fri, 28 Feb 2020 08:48:53 -0800 (PST)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 D5E293F73B; Fri, 28 Feb 2020 08:48:50 -0800 (PST)
Date: Fri, 28 Feb 2020 16:48:48 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH v4] usb: gadget: f_fs: try to fix AIO issue under ARM 64
 bit TAGGED mode
Message-ID: <20200228164848.GH4019108@arrakis.emea.arm.com>
References: <1582627315-21123-1-git-send-email-macpaul.lin@mediatek.com>
 <1582718512-28923-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582718512-28923-1-git-send-email-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_084854_290909_38FBA502 
X-CRM114-Status: GOOD (  12.63  )
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
Cc: Sasha Levin <sashal@kernel.org>, Shen Jing <jingx.shen@intel.com>,
 CC Hwang <cc.hwang@mediatek.com>, Peter Chen <peter.chen@nxp.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Jerry Zhang <zhangjerry@google.com>, andreyknvl@google.com,
 linux-usb@vger.kernel.org, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, eugenis@google.com,
 John Stultz <john.stultz@linaro.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Vincent Pelletier <plr.vincent@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 26, 2020 at 08:01:52PM +0800, Macpaul Lin wrote:
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index ce1d023..192935f 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -715,7 +715,20 @@ static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
>  
>  static ssize_t ffs_copy_to_iter(void *data, int data_len, struct iov_iter *iter)
>  {
> -	ssize_t ret = copy_to_iter(data, data_len, iter);
> +	ssize_t ret;
> +
> +#if defined(CONFIG_ARM64)
> +	/*
> +	 * Replace tagged address passed by user space application before
> +	 * copying.
> +	 */
> +	if (IS_ENABLED(CONFIG_ARM64_TAGGED_ADDR_ABI) &&
> +		(iter->type == ITER_IOVEC)) {
> +		*(unsigned long *)&iter->iov->iov_base =
> +			(unsigned long)untagged_addr(iter->iov->iov_base);
> +	}
> +#endif
> +	ret = copy_to_iter(data, data_len, iter);
>  	if (likely(ret == data_len))
>  		return ret;

I had forgotten that we discussed a similar case already a few months
ago (thanks to Evgenii for pointing out). Do you have this commit
applied to your tree: df325e05a682 ("arm64: Validate tagged addresses in
access_ok() called from kernel threads")?

-- 
Catalin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
