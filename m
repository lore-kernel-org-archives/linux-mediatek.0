Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50285C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 07:01:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDCCA64EE5
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 07:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDCCA64EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wstbcr7KEWzQEbzSNuP1uN3j6yF7DCVjJNQKFNyqN1Q=; b=W1DPOgXsJ7N/k6lDMV+IDY0kA
	B1VFLYcz3ksjlj8y8mbmN9+/8tqCMPY2z+yXytZNTGQOi2rawKFRBxXBncmViC+DcYPvXDQ/oIEsm
	E9r5dB0ZiV3WomQv+wML2qvvMWzb4rnzjzPZXvhFUz4kegMK/nwQHzGhUPlfXIXYP/svxqZjK7GtF
	FyqMgQfMGIH9utAFzoUAMPlGElF+GBDF5RATrrerlwDx92T3uoNvORU4ZgdXJjEzM1VS2sA1WDV8r
	v9xJ2Gp0eTdNQAVPQ4PqFrdC4sRK9NEvE12NA6mfJAXl1zKMsrkljNjaHYeUWP0V+3aj020M1VGxi
	aOV2/DVXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6pgL-00030H-9o; Tue, 02 Feb 2021 07:01:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6pgI-0002zl-CY; Tue, 02 Feb 2021 07:00:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46E8264EDF;
 Tue,  2 Feb 2021 07:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612249256;
 bh=Sx91zXS5CZ2NCFm3joeQvkrfBaSq7Dz4/hhWtEtu4R4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PcVPk7bd6st8hJE1dMfrGQttc63UAXOr22gtcYkwt3I59ZNfBh1Br43xIUol7TVYX
 aqRGj85hYZKxuPp6cc5EMXLVOHCnn2JR7+fIfx6lhKzs0oN890SINZpTXlMK++Xna8
 FMi7Nsqp7GFyTYkbDj9LL01UTUibTBYoalIZprgM=
Date: Tue, 2 Feb 2021 08:00:53 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [next v2 PATCH] usb: xhci-mtk: skip dropping bandwidth of
 unchecked endpoints
Message-ID: <YBj4pfN7iq+U4zW2@kroah.com>
References: <1612247298-4654-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612247298-4654-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_020058_802512_D7ECE33B 
X-CRM114-Status: GOOD (  10.06  )
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
 linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>,
 Tianping Fang <tianping.fang@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 02, 2021 at 02:28:18PM +0800, Chunfeng Yun wrote:
> For those unchecked endpoints, we don't allocate bandwidth for
> them, so no need free the bandwidth, otherwise will decrease
> the allocated bandwidth.
> Meanwhile use xhci_dbg() instead of dev_dbg() to print logs and
> rename bw_ep_list_new as bw_ep_chk_list.
> 
> Fixes: 1d69f9d901ef ("usb: xhci-mtk: fix unreleased bandwidth data")
> Cc: stable <stable@vger.kernel.org>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Tested-by: Ikjoon Jang <ikjn@chromium.org>
> Reviewed-by: Ikjoon Jang <ikjn@chromium.org>
> ---
> v2: add 'break' when find the ep that will be dropped suggested by Ikjoon
>     add Tested-by and Reviewed-by Ikjoon

As v1 is already in my public tree, please send a follow-on patch that
fixes it instead.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
