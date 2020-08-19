Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A14C433E3
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 16:32:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9166220885
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 16:32:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YxDW0CsP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVyoNLed"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9166220885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6GB7mp1nzgKGf0CVjwfVuVqtpIU2fX4wEBJF92mpkps=; b=YxDW0CsP+2aW9l3ME9AZ/l7yR
	PcpT8kuthC9nEMKbtve3yy3yyCFuzV6JP/w169wlyOAA+2Kl2+tnvK1aOE99Mt3+ATBgnOG8amC/+
	ChRTKXXvLMKqF+frm2eXiwYH/Clnv3en/6NwXBzAZ4g637BiQEBVOx4L13n2pMZpNbVnG4WU/Enmd
	FuEGCKXZgSjx5hAiMN/qF6naDtKdR9L6dcyR4O5IqRXfcV1ffPrkj12dJ2PTdGm0Yl3P3xwsFi1GG
	7PvgvtdUU+hsYb9k9hMhxJTnAgY7/wuGF5giQPvy7kwLt7we4ZpCKSR2wgVQdEgKCTI8AMNDq4Kas
	CG6uD+c3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8R0L-0006u6-5l; Wed, 19 Aug 2020 16:32:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8R0I-0006tc-8z
 for linux-mediatek@lists.infradead.org; Wed, 19 Aug 2020 16:31:59 +0000
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B5C5B207BB;
 Wed, 19 Aug 2020 16:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597854717;
 bh=7UssN4aoqka0Tt/QHgPvZmzPeV4QpvTSg1+ALPNrWcA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EVyoNLedXCdfCwl20CFZYp6HjXdvxJHF+Rrh2tVroK6s6PDeYduXl2PlU6VLERA2D
 A5YhpWqfxSrasIWuXwFHe3xxhZbm/BSWjuGfUd6/NAuVnQCDRBzikeOqDK+KT+411l
 yQpve8uYiuQ5eYD0A7CHaz6Rb/Ug0BVEUaJ0maow=
Date: Wed, 19 Aug 2020 09:31:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 15/28] wireless: mediatek: mt7601u: phy: Fix misnaming
 when documented function parameter 'dac'
Message-ID: <20200819093155.14df0526@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200819072402.3085022-16-lee.jones@linaro.org>
References: <20200819072402.3085022-1-lee.jones@linaro.org>
 <20200819072402.3085022-16-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_123158_397504_1BD18611 
X-CRM114-Status: UNSURE (   8.56  )
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
Cc: Felix Fietkau <nbd@openwrt.org>, Jakub Kicinski <kubakici@wp.pl>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, davem@davemloft.net,
 kvalo@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 19 Aug 2020 08:23:49 +0100 Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/net/wireless/mediatek/mt7601u/phy.c:1216: warning: Function parameter or member 'dac' not described in 'mt7601u_set_tx_dac'
>  drivers/net/wireless/mediatek/mt7601u/phy.c:1216: warning: Excess function parameter 'path' description in 'mt7601u_set_tx_dac'

Acked-by: Jakub Kicinski <kubakici@wp.pl>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
