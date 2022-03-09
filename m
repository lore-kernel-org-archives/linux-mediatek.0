Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A30EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 03:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zN3LgYB83NEwlA9CeFbGym8RPiDWoK3+tL42WAWVGFI=; b=bu0AOtlw9eWw6W
	zkNDXNUWhrayvZlu03JZIzTmXQ0qAAqMumNKRF+U4VR7hI7+zZvsE30VYQrb+hUXJpX5gH6j33ruP
	DFYWRiQWK5QyMWH1V6mh64KI83o/8ht7BZoEKn/OyF80Vbr+ZywQ6uWoEiwOCDkpgoocLtqvChOdf
	UjVsD5h4tLdTVUT16Aj/9HIGLTnmZ2wC8nf6kepq8IUWNttY8nD4P69jUW3W8H262oIba4jnAC7ge
	MjB/2GzWfKSgQFuTXJT+H/aD5GWAhlLm9pkd3NX4nJsj/Dn1xadcLcxY+K8PMZ1s0s494NwsXAWl8
	66rnXkejaTpwKQB9P4kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRmdA-0072nD-Vd; Wed, 09 Mar 2022 03:04:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRmd7-0072mk-Nn; Wed, 09 Mar 2022 03:04:52 +0000
X-UUID: 72ab3725736b4ccbb701805e93be2888-20220308
X-UUID: 72ab3725736b4ccbb701805e93be2888-20220308
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1970820045; Tue, 08 Mar 2022 20:04:34 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Mar 2022 19:04:32 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Mar 2022 11:04:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Mar 2022 11:04:31 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <lukas.bulwahn@gmail.com>
CC: <bin.liu@mediatek.com>, <kernel-janitors@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <mchehab@kernel.org>
Subject: Re: [PATCH RFC] MAINTAINERS: drop unreachable contact for MEDIATEK
 JPEG DRIVER
Date: Wed, 9 Mar 2022 11:04:31 +0800
Message-ID: <20220309030431.31247-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220308114300.12502-1-lukas.bulwahn@gmail.com>
References: <20220308114300.12502-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_190449_803334_08781FDB 
X-CRM114-Status: GOOD (  10.49  )
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

Hi Lukas,

> After sending a patch to Rick Chang, the mediatek mail server responded:
> 
>   ** Message not delivered **
> 
>   Your message couldn't be delivered to rick.chang@mediatek.com because
>   the remote server is misconfigured. See technical details below for more
>   information.
> 
>   The response from the remote server was:
>   550 Relaying mail to rick.chang@mediatek.com is not allowed
> 
> So, drop Rick Chang from the MEDIATEK JPEG DRIVER section.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

I confirmed that Rick Chang has left Mediatek, so it is ok to remove his name.

Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
