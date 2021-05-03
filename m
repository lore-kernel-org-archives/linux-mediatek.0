Return-Path: <SRS0=onLQ=J6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22563C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 16:11:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD9C561185
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 16:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD9C561185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wp.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nwmTxDi2/8H/yiY67gsuZEpDgrraqHPHieeivI/knyY=; b=J/ATQOz/27SSI8N8bUAaKprDt
	6cN57k1T6PbTCnBh8UzNV4zrYNbb5KwlmaejHf3pV5nhBN8F6P3uodAhHArrqg21yHlkanvulvKlG
	maUAVmzhcUyj8WH0KrOlVdnIzc6BMrmF0HzWbq19yEcJbA6oomgk7ge0U921Yo1/CS8ac78QR/IwD
	Zi9D8CirSOvuhxUKC0YMHKaAPj4vmOm6nEWXga4hLWKisUl8EI07EvwwECI82U3QBBhnRkbJngHp1
	CUToh7FF114A2FeRrgJO3exns8Bd1oXCq86CgKEFYZWY2sIA3EZBAUwKu3v/KXYs5xcpe+Jx1+mnT
	jNPs+r/HA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldbA1-00ELAd-Le; Mon, 03 May 2021 16:11:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldb9g-00EL8B-FB
 for linux-mediatek@desiato.infradead.org; Mon, 03 May 2021 16:10:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=8XGMuOBeACwEZMaYGesUMGBNwiLNiNz4H3wfdfgzzwU=; b=rQCCFy7dQtgc31/oAHFNj6er/d
 Ak8CcOQdz+yr2LAkHYtP5OPgHsQ9Ya2ypslCj7NSSOJQjHlklmMgtai29zRj1x6Id7t13Baq5U20w
 ajE00Eqz7ndDkeiuQ7gg7D3hJhL7v5J6UVwDKjKBOr2czd0ihruR8DyoiOxdikbi7z8K8UITV+YAq
 EFcNNJxMr0wjJP7bcvJ+lEKhCifs0Vo1rY/zDDfi8mc77cOCe1eIzmgzu/RbPYl6QdWX3t5Mpga3L
 9c2oOSfK3AmjDGghhGOSuC00bd9KS0X2320xuLnvueh3ajEYcZux2SA+oDkZb0uOivFELp8qJRHMu
 G+PRgRxg==;
Received: from mx3.wp.pl ([212.77.101.10])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldb9d-003EAx-72
 for linux-mediatek@lists.infradead.org; Mon, 03 May 2021 16:10:42 +0000
Received: (wp-smtpd smtp.wp.pl 18097 invoked from network);
 3 May 2021 18:10:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
 t=1620058232; bh=8XGMuOBeACwEZMaYGesUMGBNwiLNiNz4H3wfdfgzzwU=;
 h=From:To:Cc:Subject;
 b=Qa3B+RxHIksrBt+KGFLhksmE7j49UlPumqfx+pf1iAdp0wLw9BF/5d57pSNQE5aFj
 jxZkA1l/onJo3jZMXu17+xxR6jTb6B5Wcxskf01a3biykzWQPfmzuKIr5WK4K3psFl
 aZMOiiTFoukLWJb0+MnCFqYmZ4WbPdyR1rr16PZQ=
Received: from unknown (HELO kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com)
 (kubakici@wp.pl@[163.114.132.4]) (envelope-sender <kubakici@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
 for <sdlyyxy@bupt.edu.cn>; 3 May 2021 18:10:32 +0200
Date: Mon, 3 May 2021 09:10:25 -0700
From: Jakub Kicinski <kubakici@wp.pl>
To: Yan Xinyu <sdlyyxy@bupt.edu.cn>
Cc: kvalo@codeaurora.org, davem@davemloft.net, matthias.bgg@gmail.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mt7601u: Add support for Baidu Nuomi dongle
Message-ID: <20210503091025.64797075@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210503084735.78974-1-sdlyyxy@bupt.edu.cn>
References: <20210503084735.78974-1-sdlyyxy@bupt.edu.cn>
MIME-Version: 1.0
X-WP-MailID: 16ae4f722a5b67e65c97582037b71b81
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [oQLj]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_091041_613293_F34AC18B 
X-CRM114-Status: UNSURE (   4.79  )
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

On Mon,  3 May 2021 16:47:35 +0800 Yan Xinyu wrote:
> Add VID/PID for Baidu Nuomi USB WiFi dongle
> 
> Signed-off-by: Yan Xinyu <sdlyyxy@bupt.edu.cn>

Acked-by: Jakub Kicinski <kuba@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
