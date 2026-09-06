Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A53C79F85
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2026 10:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:MIME-Version:Subject:References:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2a5BfEqYhttT7XBrh1fm1JBPreZV4ALxhdug6Uz1BU=; b=whUdU7TjwE/irOLx46pBjwO4gC
	3w22PUy7ulUWfZYztbuD2pdf6bxWT7Tl8Qj4rqSHapserqS82VmhpgWf7l6dOHtmZKo4DWPlzx6AF
	jpeYJ0d0N/U2yl24JzjfB8riQPWImZT9Adz+tviYGnYfALBiDT7rEllz9Jw/wpa6ba93Xl5giZm0m
	UAObaQtn5Agq5fnN6RgRQLvS0m02G+vCYfUkVDPb5YdI9aebispa7cnhuIB+KIc8gjCPoci521qqy
	QB6nwrzbX3EDr8zGgt52Bm1JItLnyCQTs7ESfXdO74IYSEzbZcn/9DkXxAzdAb1HiVllwIHc/f/pG
	2lITorVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3AGo-00000004wnh-26JF;
	Sun, 06 Sep 2026 10:38:42 +0000
Received: from forward500b.mail.yandex.net ([178.154.239.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3AGk-00000004wmw-3KiM
	for linux-mediatek@lists.infradead.org;
	Sun, 06 Sep 2026 10:38:41 +0000
Received: from mail-nwsmtp-mxback-production-main-76.sas.yp-c.yandex.net (mail-nwsmtp-mxback-production-main-76.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:29c5:0:640:e1ff:0])
	by forward500b.mail.yandex.net (postfix) with ESMTPS id 6D728C0FCF;
	Sun, 06 Sep 2026 13:38:28 +0300 (MSK)
Received: from mail.yandex.ru (2a02:6b8:c23:f2f:0:640:d25:0 [2a02:6b8:c23:f2f:0:640:d25:0])
	by mail-nwsmtp-mxback-production-main-76.sas.yp-c.yandex.net (mxback) with HTTPS id 8cIxwmIw0W20-3r3Gvg2f;
	Sun, 06 Sep 2026 13:38:27 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail;
	t=1788691107; bh=V2a5BfEqYhttT7XBrh1fm1JBPreZV4ALxhdug6Uz1BU=;
	h=Message-Id:References:Date:Cc:Subject:In-Reply-To:To:From;
	b=p5sjvJg6FHLD0XsjQrdcAEglZ+9QvhBkzc4cWPqeTxO44AeeIwXDyeLD83gHqoO88
	 Vb+qLSyXnCElvTEBT9fIuf7YNL7CHtgH6FcqL7fplUCxkOdfR/rxcUe8tkJzJ4fmed
	 WmGIRBiS+SUviTthUQwvTtFwyJeKDGcWjKhmZ4aI=
Authentication-Results: mail-nwsmtp-mxback-production-main-76.sas.yp-c.yandex.net; dkim=pass header.i=@0upti.me
Received: by mail-sendbernar-production-main-85.sas.yp-c.yandex.net (sendbernar) with HTTPS id e2ef39f0168386ab0ed568b1a36d4f79;
	Sun, 06 Sep 2026 13:38:26 +0300
From: Ilya K <me@0upti.me>
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org
In-Reply-To: <2028561788553569@f088f4ec-f441-47a1-b7e4-75a1052aa4df>
References: <1767631788532094@64c4e675-cd08-4a74-816f-886742f9bfcd> <529a79bc-dab7-aa41-00bd-c47ecbefaa00@candelatech.com> <471221788538289@323ca970-5bd2-4c6b-b52d-2b863a718615> <3acf531c-bcc7-412b-b3bb-665069260e46@candelatech.com> <2028561788553569@f088f4ec-f441-47a1-b7e4-75a1052aa4df>
Subject: Re:[bug] Triple whammy of mt7996e bugs on 7.2+
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Sun, 06 Sep 2026 13:38:26 +0300
Message-Id: <2418461788691106@84aa39c5-f501-4e64-8418-6a8b6eb88e21>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_033839_059241_E1B66071 
X-CRM114-Status: UNSURE (   6.80  )
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

> This abomination is now booted on my hardware and I'll get back to you if it explodes again, which I'd expect to happen at some point
during the weekend at worst (and if it survives longer, that's already an improvement).

OK so it's been over a day with no explosions which is already better than its previous best. The question now I guess is: which one of the patches actually fixes it? And do the teardown paths still need fixing?

