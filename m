Return-Path: <SRS0=4tSC=Y7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C7CC5DF60
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 14:19:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 725FD2178F
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 14:19:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PS0rfuZL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 725FD2178F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dNyRYWgn+v+sPQNCYLH1R15T0srNhA6cUTIF33HiQ4=; b=PS0rfuZLVQHY/d
	oDu6w7yNRg/XtwnikQN4rZDa4I+a1syxnn8a/+j0uRb0qKyBRrwyY+3s6Gm7x0+xb9U1FCNC4CF6F
	r6VU0jwuTJmTJK9w9wl8KizATd+CMpi0+VBwQYnwyoLWuqn+tecrzHibX3HKBjlkIUq0UHPi8Stud
	fWyrl2KOpXvvUg9PLz4ImYnY+CjcmjgRZn3G+4keihY4ZnyCQy/QrOLMW6D4TW/u0QJqUMrW19FZ0
	0QnzkavXXZb5+jQ9IBxSoEDO801IrH1M9v28vctz9n8Ni+CuEAA5j1Dc7e6Nhj3+LXZESAHYp1DKk
	dteNCSSg1SG0YVXEK7sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSicz-00044b-DN; Thu, 07 Nov 2019 14:19:13 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSibH-0002Ok-T8; Thu, 07 Nov 2019 14:17:30 +0000
Received: from marcel-macpro.fritz.box (p5B3D2BA4.dip0.t-ipconnect.de
 [91.61.43.164])
 by mail.holtmann.org (Postfix) with ESMTPSA id 2A6C2CED08;
 Thu,  7 Nov 2019 15:26:23 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH] bluetooth: btmtksdio: add MODULE_DEVICE_TABLE()
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191107094610.22132-1-brgl@bgdev.pl>
Date: Thu, 7 Nov 2019 15:17:18 +0100
Message-Id: <D1FAA04C-681D-4832-AEDF-B4CE78FCA127@holtmann.org>
References: <20191107094610.22132-1-brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: Apple Mail (2.3601.0.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_061728_125027_079B186C 
X-CRM114-Status: UNSURE (   7.95  )
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
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-kernel@vger.kernel.org,
 Bluez mailing list <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bartosz,

> This adds the missing MODULE_DEVICE_TABLE() for SDIO IDs. While certain
> platforms using this driver indeed have HW issues causing problems if
> the module is loaded too early - this should be handled from user-space
> by blacklisting it or delaying the loading.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> drivers/bluetooth/btmtksdio.c | 1 +
> 1 file changed, 1 insertion(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
