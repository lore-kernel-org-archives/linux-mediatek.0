Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39443C38145
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 05:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VxkkYAKOK2XzPhMeleSoHv9dfnfLWo93R/8AUyqQ6A=; b=O4/JGRk8dI3U4g0eRb2nbUHGm5
	2HMI+VAEPhb0r8D0yNNdYMLbsixgEztIAwNi4vusHR7vIkQvxV2PTWXoy7PvcZtxzBxlEe17alqv5
	X/1dibCwEiPxTdACzDzIw8QHDhXZ7ZqdltFH7RIdO7Je+E7bKDhamPVJt/PWHjh8gShSJ8Y45f+qQ
	dydZCzQbhox6WVDk5V0pvpnKRY7qwtzueyKamCrkWaIRnIWDjl64AYqZzx8K/m943wnhzLsMvFcLs
	n3zqxDrVb49mOihLhsjR+fskQKjbJAA3xJooY4PKUBSsde0HjL5yCupxg23/Z/g2ZzlsgFreLQXFi
	kP0XgJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW9yE-00GyfW-HG; Thu, 08 Sep 2022 05:20:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW9yB-00GyP9-GT
	for linux-mediatek@lists.infradead.org; Thu, 08 Sep 2022 05:20:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 60F2CB81F74;
	Thu,  8 Sep 2022 05:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0FD1C433D6;
	Thu,  8 Sep 2022 05:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662614452;
	bh=53tYFqA19tybgX8iU6hjZopXqwyUQ1EtA3BjNydkFYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R7pIo3+hTq36jqEGG+4MdHl90u/xDNCWVeVDPb9j2+d0QQp2+e65BwAHj2amv9Mm2
	 JQtaUTuWQjNrNuw6XqTnRUcCWXL3VhxHLsG4o4/MSx9OQMvQ/3rs24W3qzk9Hve/zl
	 nBzeY65nL2a2WQBC0amdzBUJSAXRZshpcsJWPghg=
Date: Thu, 8 Sep 2022 07:21:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: chen zhang <chenzhang@kylinos.cn>
Cc: chunfeng.yun@mediatek.com, chenzhang_0901@163.com,
	linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] usb: mtu3: Fix spelling typo in comments
Message-ID: <Yxl7yv9lEYI5ucnz@kroah.com>
References: <20220908033502.18013-1-chenzhang@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908033502.18013-1-chenzhang@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_222055_713214_14A37364 
X-CRM114-Status: GOOD (  11.68  )
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

On Thu, Sep 08, 2022 at 11:35:02AM +0800, chen zhang wrote:
> Fix spelling typo in comments.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: chen zhang <chenzhang@kylinos.cn>
> ---
> change for v2: add k2ci tool explain:
> K2ci (Kylin Continuous Integration) is a code pre-verification tool 
> independently developed by KylinSoft, which is used for ensuring the 
> code quality of code submission. K2ci includes the comment check tool
> notes_check.
> 
> This spelling typo was found using notes_check tool, which reported the following
> warning when check the v5.19 kernel release:
> 
> python3 notes_check.py 
> drivers/usb/mtu3/mtu3_qmu.c emtpy

This all needs to be in the changelog text, right?

thanks,

greg k-h

