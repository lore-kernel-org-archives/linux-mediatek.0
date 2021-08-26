Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3E4C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 11:41:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A3B760E99
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 11:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A3B760E99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08C8BfVEQ6eHsjmN5qGmekgyufYJdqdhgcrSLMdz89k=; b=08R182JRHkeXSK
	8JvB+l6I1AE7X19whoRtbbJHilQAcAk/O4KdUrdbvXuqYeAsqwKFH2t5ucriX9nvwPdTKq2Vc//eO
	3IH+43FVuCIlL3R//66toeMjSwe/MyZ0J8at75JC1tvz9OecG2I8fUVPnKNYUb3RoQ/0EHUbtCmtD
	wvxfZdJqK9Eh48EbDwW3nIHci44eMVqKKgNOOw0OY4eBx2ZI0bv5ArbAWbIc8HTFRVHMTNzsqn8J3
	vOQlOiZZZZRe3pwST4zvOnch7fDW480Gf7FInYDfcOpgul3Jof92S1nTfeIRnCidzhEim4Fw7sJ8m
	TjWK8RiOl73w+6yeCVEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJDlS-009y6j-KH; Thu, 26 Aug 2021 11:41:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJDlD-009y4u-8o; Thu, 26 Aug 2021 11:41:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23AEE60E99;
 Thu, 26 Aug 2021 11:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1629978090;
 bh=LBgfhQTnK58QE02OSqoVohFHKyxhIEMkQjpkw7VwFNc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LSK5WshPd07ZqlzKhT91KVSnyT84cSj/y4rzSFBrHzaoXhKOYYeyw36Jo8naH9yaL
 mwcvfm6BPjo8iJTBLevZfbx7uaCNNIEswzB/huQ6MfMstpGdoE/mNtFLUXAZliHHnN
 MTDzBwwnJrQf7USwn7XtunFCrICgsmaG/XVm2UOE=
Date: Thu, 26 Aug 2021 13:41:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ikjoon Jang <ikjn@chromium.org>, Eddie Hung <eddie.hung@mediatek.com>,
 Yaqii wu <yaqii.wu@mediatek.com>
Subject: Re: [PATCH next v2 1/6] Revert "usb: xhci-mtk: relax TT periodic
 bandwidth allocation"
Message-ID: <YSd93+3D/PbacgsP@kroah.com>
References: <20210826025144.51992-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210826025144.51992-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_044131_372884_8839EA36 
X-CRM114-Status: GOOD (  11.24  )
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

On Thu, Aug 26, 2021 at 10:51:39AM +0800, Chunfeng Yun wrote:
> As discussed in following patch:
> https://patchwork.kernel.org/patch/12420339
> 
> No need calculate number of uframes again, but should use value
> form check_sch_tt(), if we plan to remove extra CS, also can do
> it in check_sch_tt(). So revert this patch, and prepare to send
> new patch for it.
> 
> This reverts commit 548011957d1d72e0b662300c8b32b81d593b796e.
> 
> Cc: Ikjoon Jang <ikjn@chromium.org>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: no changes

This series does not apply to my tree at all now, can you please rebase
and resend?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
