Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFB2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 09:30:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFE7C60EFD
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 09:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFE7C60EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jEZkdP9ZYLc7lu/gUC9yYfZER1lqOz8tWWnsd/Dvboo=; b=MdcbkyapNt+f6g
	QZVdph9Gd0vvzkVld8vHGDODD7mRlMYwI++yq5TP+lN5rZcx9wmtLjg0b3yMbSsylC6QLXgpilVDi
	j7hAWZ6KjfKIcG2H88yWozF+FHHdvmoTytFyW4Lk4NlKxpyO32FQcf3Fzm6+a3pF0t2BZ7d4cH6Sz
	C5bBqrWfcQE5EOdSZ9p3YcSaaorsuSo0plg8kRV3WT66LVQh/lYrBBQPdDaN9/vAqcBdVDvC+du2g
	DjygUlgQCDeh7i6BEWQRPY9EZ0EvtKk74e2pk9K1MxH7YdE686HXMp43UU7cSMbOi8EEwm5u4DIbQ
	jf9JA5/yuqWTF1g0oUmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mThXE-00Ds5H-1Z; Fri, 24 Sep 2021 09:30:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mThWc-00DrlH-L3; Fri, 24 Sep 2021 09:29:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A51961039;
 Fri, 24 Sep 2021 09:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1632475784;
 bh=2oeuxZrFJB0Hk8Nems2Au4UGPvKYbwE2jCoLgMnV170=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dwg4PcKLO18rhE5rH3va7pTooZV7yJ1/yJq4hnzGROeGcBpJ4B+IrN9Pv31l+UKYX
 qvfp4YbbCZSWu+InhrhmUXxPOEi1amOuEeNG84phnjFD01oHAq1twZDFqB0sItrIIT
 K2i67BChS7gOPfTATaHeFkQ+sCVYyI5Crt7nVIB8=
Date: Fri, 24 Sep 2021 11:29:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Petr Oros <poros@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Miles Chen <miles.chen@mediatek.com>,
 Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Macpaul Lin <macpaul@gmail.com>, linux-mediatek@lists.infradead.org
Subject: Re: backport commit ("e96bd2d3b1f8 phy: avoid unnecessary link-up
 delay in polling mode") to linux-5.4-stable
Message-ID: <YU2ahYG+mbriOevz@kroah.com>
References: <20210924091020.32695-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210924091020.32695-1-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_022946_736757_F924EF0F 
X-CRM114-Status: UNSURE (   8.82  )
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

On Fri, Sep 24, 2021 at 05:10:20PM +0800, Macpaul Lin wrote:
> Hi reviewers,
> 
> I suggest to backport 
> commit "e96bd2d3b1f8 phy: avoid unnecessary link-up delay in polling mode"
> to linux-5.4 stable tree.
> 
> This patch reports a solution to an incorrect phy link detection issue.
> "With this solution we don't miss a link-down event in polling mode and
> link-up is faster."
> 
> commit: e96bd2d3b1f83170d1d5c1a99e439b39a22a5b58
> subject: phy: avoid unnecessary link-up delay in polling mode
> kernel version to apply to: Linux-5.4

Now queued up, thanks.

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
