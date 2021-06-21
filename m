Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB0BC48BE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 08:30:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2906661164
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 08:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2906661164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsC3CahVqHvEEMVgzj7PswCEVNcbSqNYsj37GKO9TcE=; b=vHrULA3eaHaN+N
	wvEz8CIjlXbYqvW6ExDWwLyNF5dtNIAec6XP1q/y66mcnuOaPmSYI1tHMwXm5+yQyaYR4NWaxC6e9
	D7In/zvlFaJBeBsHbVM6wmIKtnqk0s5OlfV9JPmUY4Y5fQn+i1LwPVfyVInAgPNOtXLK53Z+vY9Pv
	8VVWo6BdkJMnGVnwvACGfkbBI1rPKrzWZ/f4EsLgKZ3/dfAeUMQGg3hBWET0xRzw0Mq+ed97DE0Lf
	vC6k4iSk9G9exlvXnU7Fkugkn+BfeHHuPfs6Bpj01UO19Drh5yTQ+jDWC5jFiucvvoBx4512ja1r3
	UpYSOoui3W8vbD8a5D6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvFJU-002ghD-An; Mon, 21 Jun 2021 08:29:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvFJH-002gdV-C1; Mon, 21 Jun 2021 08:29:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E91E060FF4;
 Mon, 21 Jun 2021 08:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624264174;
 bh=KPznl7d9Wv3j9LDZ3CCsrENhbmOEiGLgBvC80ba2OpA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NKcKMH9coXa7nADZfEz4x5P/kGS731f1HhZIVx60t48cKEoNQpwC2N117B/ihq7YH
 Uy1qdn1uXFk84gWE6naSTZwYWwEs/9S0Ns+5CM2UFMt7/Ju2cz2giWHuRVYm8LynOC
 iK69jfglBsA9O91maMPa+HjuVBpXHcSBCWhTczvq34FSkTO5NiwGCKc3M/HOgeuewx
 i3QB353yODBZVuLSC+Pu2PIuB/Jko4JIlpp3FKMH39bPvMEBZBVZ61oOEoA5fVpX2w
 IaF29J3BRvTnsoeKIewsKg3FujT1pw0K585rLJ0tGUhLOi4kHbpLDAn5MP//T1zPzP
 Rt9IkBIIWV19g==
Date: Mon, 21 Jun 2021 13:59:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: angkery <angkery@163.com>
Cc: sean.wang@mediatek.com, matthias.bgg@gmail.com, long.cheng@mediatek.com,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Junlin Yang <yangjunlin@yulong.com>
Subject: Re: [PATCH v1] dmaengine: mediatek: Return the correct errno code
Message-ID: <YNBN684ZiVdVb4eU@vkoul-mobl>
References: <20210621062048.1935-1-angkery@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210621062048.1935-1-angkery@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_012935_464984_BBF8B433 
X-CRM114-Status: UNSURE (   5.60  )
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

On 21-06-21, 14:20, angkery wrote:
> From: Junlin Yang <yangjunlin@yulong.com>
> 
> When devm_kzalloc failed, should return ENOMEM rather than ENODEV.
> 
> Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
> Signed-off-by: Junlin Yang <yangjunlin@yulong.com>

Patch was sent by angkery <angkery@163.com> and signed off by Junlin
Yang <yangjunlin@yulong.com>. I would need s-o-b by sender as well...

Thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
