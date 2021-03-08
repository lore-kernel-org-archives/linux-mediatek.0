Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24670C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 16:23:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BC1B65226
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 16:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BC1B65226
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5WJclqFyOTubg1Q1l57iGghu20sSgbktkfAQEQCEXJg=; b=aIfww3sNGK7OyPJB7ju2pRwbH
	Fg+OISlo3z/yE4K7T6oilpujurLpVn4Si7LLo72bbWyQdHtbBb4Mu+yCOYbbVwHqSpkAjpqRMo9db
	Wcpbuu0fHbtM9gCG0fM1MnwM/b0Qf8Hi51kQiuYdB2RWsbd4Tdj/xslAM27KUKeeVAQvuNB7uBcXN
	/RxGckgdrkOSTr+Tlqdew7C+jam5LzaSooOHXh96Vqp7nq/qcJ7gUv5GMH7nZ4hmvWGaJsms+pAoy
	3HpiyN6m9H1h39AF/tyQ6dU/CAZYDlDunnHc4LSVoiOzDD94W4UfqoXL9nVJj3yx0zsyobjC4Y4o9
	QVaBlWOjw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJIfA-000ypv-3B; Mon, 08 Mar 2021 16:23:20 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by desiato.infradead.org with smtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lJIet-000yds-0e
 for linux-mediatek@lists.infradead.org; Mon, 08 Mar 2021 16:23:05 +0000
Received: (qmail 139795 invoked by uid 1000); 8 Mar 2021 11:22:58 -0500
Date: Mon, 8 Mar 2021 11:22:58 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ikjoon Jang <ikjn@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: Re: [PATCH v2 16/18] usb: common: add function to get interval
 expressed in us unit
Message-ID: <20210308162258.GA138835@rowland.harvard.edu>
References: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
 <25c8a09b055f716c1e5bf11fea72c3418f844482.1615170625.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25c8a09b055f716c1e5bf11fea72c3418f844482.1615170625.git.chunfeng.yun@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_162303_365425_9CAB668A 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

On Mon, Mar 08, 2021 at 10:52:05AM +0800, Chunfeng Yun wrote:
> Add a new function to convert bInterval into the time expressed
> in 1us unit.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: move kerneldoc next to function's definition suggested by Alan
> ---
>  drivers/usb/common/common.c | 41 +++++++++++++++++++++++++++++++++++++
>  drivers/usb/core/devices.c  | 21 ++++---------------
>  drivers/usb/core/endpoint.c | 35 ++++---------------------------
>  include/linux/usb/ch9.h     |  3 +++
>  4 files changed, 52 insertions(+), 48 deletions(-)

Acked-by: Alan Stern <stern@rowland.harvard.edu>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
