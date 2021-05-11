Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F19FC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:08:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E035761628
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E035761628
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B+FNpZDHWS7vsgp6OoVMlXVBjsLQm3A90R2V1QBMv7I=; b=g23qPYUyFHSCBKbI21qj7E1Bn
	nG324D//N5OFrryhezmMq2qeGccmbAcF2OQ4lCcgfbc3X/TJgmFtFJpLIhqqotYVWsZMXGP2QDxBW
	y+BErkmp4hQgoPxZJvXxhngzvIq+HDf0gm/NaFtD7/fFXmpltQ9lrOgBzADMdppmGRmLWXx35Xtp1
	rR4r/aE7D/17RJaiplB/urfRdUpYkqqWqp3leBO/xbjhUwauRdrfn5p1vXN+QUh5DAiMXJYxu7WGG
	oaMqLJ7vw48QsoG94TicNqQeVXCkdQMC+NKzKigun23AYSbR1jZ1DDYkRZnJ2VjL52YCjOoqTjjxj
	offL6LREw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgS7F-00Ha1K-CE; Tue, 11 May 2021 13:08:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgQY7-00H7zC-OK; Tue, 11 May 2021 11:27:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=E6/dGrrm9KjsRiyU1ioXFaNw8c7SKw33e9lCk656shc=; b=S1KrlEI0SXNf+4oTeQq93z9YuZ
 i8H/kUdgw1f+NmHG0l8WxMqpYdoGLIh7Fc6vP8ACZ+nmRmZ41Lr1LZ4BCjB+m9AwKTf9tpmJ7P3eR
 4mOBSVN61fx/ecTC1vkBGPsBj01dxJJoJRolJncc06dGlEm67DhZp1M4IJVG6ByQMkAzZ1ZL5Pfga
 yKnTr5EKQ85r/r8+Jdff9MyvU0iJFryJpK1CSY/pZgeNDjO5SslFfD49rjt8xq0kyj8pCkMaMX8J6
 k9JR3xbzSdPK1RBoXbEmQ1sAZPySTRnsyQreW8/M0F/vfuoia7UmiHVZtudQYfDLok8YqsTj8nqae
 EO3rdPIw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgQY5-009WFc-3p; Tue, 11 May 2021 11:27:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 09AC46186A;
 Tue, 11 May 2021 11:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620732456;
 bh=z4Xwx6G0EVHQsG2p959XEORObr8SXf7pV9nctlXNA38=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q/2hLnrRdI7yIpYKOlx6oYNX3+CUrXGqEwduRCO/0gpW+/1zXlDfWDQd4hzyuPwlF
 r0WLn9vJ8NiLkfS0W2s66gUqKvXxqtMnCA1NJXWI0oKoVP0BPusXiggYOrCMlyyY49
 M4ICG5kPKUA+bGELcVrFtq8yAIg5Cy1HkwpX7H2E=
Date: Tue, 11 May 2021 13:27:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Bixuan Cui <cuibixuan@huawei.com>, Eugeniu Rosca <erosca@de.adit-jv.com>,
 Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Tianping Fang <tianping.fang@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>
Subject: Re: [PATCH] usb: core: hub: fix race condition about TRSMRCY of resume
Message-ID: <YJpqJr/3XEIYrtko@kroah.com>
References: <20210511101522.34193-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210511101522.34193-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_042737_215575_2D9A06BB 
X-CRM114-Status: GOOD (  10.78  )
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

On Tue, May 11, 2021 at 06:15:22PM +0800, Chunfeng Yun wrote:
> This may happen if the port becomes resume status exactly
> when usb_port_resume() gets port status, it still need provide
> a TRSMCRY time before access the device.
> 
> Reported-by: Tianping Fang <tianping.fang@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/core/hub.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Does this need to go to any older/stable kernels?  If so, how far back?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
