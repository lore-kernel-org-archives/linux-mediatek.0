Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C40BC4742C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:52:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 946C2206D8
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:52:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n/roeGs7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lYn5MyHD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 946C2206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TgTnB2OGpHRv5Uv2SoEHyaAFg1B4uz9rgV/T2pNAtpc=; b=n/roeGs70PESiAeRtuaCEMxMD
	jL7f1KGez+DH43+NZFaCRs3t/SxXZabssxXez/wdfl0WnA3G+BArz8inYinGBNaHODBQbwGdt1DEo
	NiG8bqd2xvRCbi65WNa8CTheEe3f4h0pkuo7vpV6ROZectSJL26j2ozgFOYa6tAjK92Xhm3DmMPXI
	c+BmOT0/yWbZPdTjQCs/MWCUvOrVRwIfvagv+KpOxuCHqoYdLDcLuM2p3KvPDXd2fZju6p9MhcYMd
	br+BVfL2Ow8tkyxfiCVUNTN2vgKaeLnSYqmAFzFkhwKZCXaTHTdraIGwa/Ik+7M0If5cMCw8wc8Tz
	jFAFdlnhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keZIv-0005s6-SY; Mon, 16 Nov 2020 07:52:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keZIu-0005rD-HU
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 07:52:01 +0000
Received: from localhost (unknown [122.171.203.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B6FCB206D8;
 Mon, 16 Nov 2020 07:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605513119;
 bh=kIDHVv2Ym+BUKnQTKS5yXXz7Bo9fBdvlozH3Mp6LzZc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lYn5MyHDC+hMuypGUTjD4UlI/0ltk6q0YIK5KJEt4NeUniKmUl4F4TAgJKfoA+Q+G
 VsdYsMhR7Rf/i/aoLRxZiIgtQjyuJc9M/ZA8i1YTBj4LRYsl5JTmJRUndGwe1uAoY9
 nk2s2gD+kH8zk4NfN48hqgzMjhY/0fMp4UfSuqfY=
Date: Mon, 16 Nov 2020 13:21:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] phy: mediatek: fix spelling mistake in Kconfig "veriosn"
 -> "version"
Message-ID: <20201116075155.GR7499@vkoul-mobl>
References: <20201114120518.416120-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201114120518.416120-1-colin.king@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_025200_656500_8F9817B9 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 14-11-20, 12:05, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the Kconfig. Fix it.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
