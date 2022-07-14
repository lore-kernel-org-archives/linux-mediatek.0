Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9C4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 14:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzwovKFyODUwj1YEvh5MVnT1bybKcTNtCsjaiazmbHw=; b=Z7+myRzVigCdhzpPlWePbCcBBB
	9k+vBTzMlfLCZf7kibsyx6o8zER9zheHZy+2yZ9+GDl91k0//KjwQcWS6PURcItP5Jnl+JnNJzO8G
	5Nx2lFcuOLPmY4XPCXeOmmkBKF1jivPJt0QwtgTUiHQSaWFiYoClukJPd6X0jwXNPNqdtS3G+01Wt
	aNmcJ2tVaPE2rJChxxWPHGL7VX7y7cYanZX6Zf+kMDHkUS0NAiQqNwPLdwAQg+rw8PuFxQ7ivf3lN
	QYEJoR7aHYSsH33wKwuKYEoTKpY3nIeWpli6PR+I64ixex4H+QQ71OySKhIEpLbGe3uJsr6vu/5oO
	V0yTBW7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBzwo-00FFkP-7F; Thu, 14 Jul 2022 14:36:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBzwb-00FFa0-43; Thu, 14 Jul 2022 14:35:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5B26B61B38;
	Thu, 14 Jul 2022 14:35:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D10C341C6;
	Thu, 14 Jul 2022 14:35:54 +0000 (UTC)
Date: Thu, 14 Jul 2022 10:35:53 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 08/13 v2] USB: mtu3: tracing: Use the new __vstring()
 helper
Message-ID: <20220714103553.553d9dc1@gandalf.local.home>
In-Reply-To: <YtAd7DUt2V4vYrYm@kroah.com>
References: <20220705224453.120955146@goodmis.org>
	<20220705224750.354926535@goodmis.org>
	<20220714093857.1135e95a@gandalf.local.home>
	<YtAd7DUt2V4vYrYm@kroah.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_073557_231875_53624579 
X-CRM114-Status: UNSURE (   9.57  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 14 Jul 2022 15:45:16 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> > Changes since v1: remove ',' that fails the build.  
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks Greg!

-- Steve

