Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A489AC433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 07:53:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FC382078A
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 07:53:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aiwIS2Bh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Htf22TTB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FC382078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ozKg7pkVcXs07I3CyrKZgmTNqKXPgxrzP9s4jU/rn/0=; b=aiwIS2BhLiYyhd16VM/zHw4ZE
	YSf0T3i78kgy8lZHn3mGl47JvGoWOqvyRQa7yC2Bbwm3L7/Tos6+nkhnwqHkEeDO9Da8h6SOMw7Za
	474ne4tWDNhMRvIkZdMO4jdpBb99HVibUnDwsUSwyukUv5yi7q4q6vw9Icm92phqHUr1E2vpans4E
	ELpq0MrbWFukCjJTFQ7oggBbizhOAVtf4IegcjW4g1NS5I9XwIq5Ti4UKMEF6e88ieBD2CTsEPzei
	Yvnkyj/hKLzrvhwcHczpQqY5hUA5PQ8y7OZo5PAGDLUnbSUt+aSRxe8UyITZ3mVwZBDM/cUMhep30
	TjpsKHvuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBZCR-0000DS-5H; Fri, 28 Aug 2020 07:53:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBZCM-0000Co-Ms; Fri, 28 Aug 2020 07:53:23 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C6F92078A;
 Fri, 28 Aug 2020 07:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598601201;
 bh=JhNpVsbHlCL1Udn63YeuVXj535D89OBHVFbUoaahHqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Htf22TTBK/Pxy8ac6VUWhqB+Gt6XhjgKwY/e110mYWixXOR676XFHXlk9ZGaTk20G
 yMBKVKO/e7vnCTWesykp7ysxN4e9vwj2ZpV8j52yto8TWV4NG8nO+FCFK1iAj5r/SG
 WPQyb84RZUDPXCyBbDoAsLZ+OTxGLsLtjBs7yFYQ=
Date: Fri, 28 Aug 2020 09:53:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v3 01/11] usb: early: convert to
 readl_poll_timeout_atomic()
Message-ID: <20200828075334.GA998738@kroah.com>
References: <1598083553-31896-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598083553-31896-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_035322_909945_D695247C 
X-CRM114-Status: GOOD (  13.50  )
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Aug 22, 2020 at 04:05:43PM +0800, Chunfeng Yun wrote:
> Use readl_poll_timeout_atomic() to simplify code
> 
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2~v3: no changes
> ---
>  drivers/usb/early/xhci-dbc.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)

No patches in this series applied to my tree :(

Please rebase and resend them against the usb-next branch of my usb.git
tree on git.kernel.org

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
