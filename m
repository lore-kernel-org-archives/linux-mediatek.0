Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BE6C4743C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 12:56:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E47B061156
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 12:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E47B061156
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWPxGDZeffUtwV/a3ds7j6ta5gEigmjN6P24N/6Dzhg=; b=KcEpRm0TbWPxZT
	msN8uWrr5UWCIAazuz2c5eTeZ1yDIZuMuJYU5dsqRzW89jxxFp1XmiDuj7Utp9TiPK5jTXBWudZnV
	YTHXn93RCkPArAKY67uaxowyUj+GmVknxHb7fZnYy1kswTakwmUmdre+aeGyJDv/hrFuKpJ4sxp6l
	YebJO9TNqeJSX1Op9UO+lSEHMTFojaM+S+BaBCyLSOJXUMJFLHbqrEd+tl8u6R++/8qXDxQsObGHq
	v5HRroqjMyZS9Tg4PW4PdrCqtSoJP9MUOKFxowVEGARRUVB9f/3EGpAtcOrZcKt7zO6ry5ZvDq17v
	sY88/Zt5Uoz97q5J05pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvJTL-003Wep-1d; Mon, 21 Jun 2021 12:56:15 +0000
Received: from m12-17.163.com ([220.181.12.17])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvJT6-003WbC-OF; Mon, 21 Jun 2021 12:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=RhEua
 8GR26tvHREEceUWP4wYPENJiGTDNytWgn9r17Q=; b=NZx5Q/R1GsGvehJ0EG7Ow
 RiwmL6IYx7uTs2x4P9QKW8fdFiyZBBd9BsoTtof21Qbu9VEOTvq6WlmCgeq9yCIM
 MpWLetNW+7Zb8TnZc1YvZcPURH9qKn/H6NB3yeVyhtx+Ga2I9CHvf1rywKJ18hmF
 vzVcSuTVtkN+QMfFfpCEAo=
Received: from localhost (unknown [218.17.89.92])
 by smtp13 (Coremail) with SMTP id EcCowAD30GhYjNBg8pE98w--.56118S2;
 Mon, 21 Jun 2021 20:55:53 +0800 (CST)
Date: Mon, 21 Jun 2021 20:56:02 +0800
From: Junlin Yang <angkery@163.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: sean.wang@mediatek.com, matthias.bgg@gmail.com, long.cheng@mediatek.com,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Junlin
 Yang <yangjunlin@yulong.com>
Subject: Re: [PATCH v1] dmaengine: mediatek: Return the correct errno code
Message-ID: <20210621205602.00003658.angkery@163.com>
In-Reply-To: <YNBN684ZiVdVb4eU@vkoul-mobl>
References: <20210621062048.1935-1-angkery@163.com>
 <YNBN684ZiVdVb4eU@vkoul-mobl>
Organization: yulong
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-w64-mingw32)
MIME-Version: 1.0
X-CM-TRANSID: EcCowAD30GhYjNBg8pE98w--.56118S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw1kGw1xXFy3uw4fJw47Arb_yoWxAwb_CF
 1Syry8Wr4DZw4vq3s8GFyrG34SyayYyrWvgFnrCFyDAry3CrWUJr9rCr1Fvw43Jrs7ury3
 uan0ka92qr1YyjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0LID7UUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5dqjyvlu16il2tof0z/1tbiLBm4I1spa5dUdwAAsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_055601_276539_2DCB6924 
X-CRM114-Status: UNSURE (   9.64  )
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

On Mon, 21 Jun 2021 13:59:31 +0530
Vinod Koul <vkoul@kernel.org> wrote:

> On 21-06-21, 14:20, angkery wrote:
> > From: Junlin Yang <yangjunlin@yulong.com>
> > 
> > When devm_kzalloc failed, should return ENOMEM rather than ENODEV.
> > 
> > Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA
> > support") Signed-off-by: Junlin Yang <yangjunlin@yulong.com>  
> 
> Patch was sent by angkery <angkery@163.com> and signed off by Junlin
> Yang <yangjunlin@yulong.com>. I would need s-o-b by sender as well...
> 
> Thanks
> 

Due to the mailbox problem, I configured a sending mailbox, and now I
change the mailbox display name.

Thanks
--
Junlin Yang


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
