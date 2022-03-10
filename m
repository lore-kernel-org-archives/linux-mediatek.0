Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3C1C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 09:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m8axL4Nt/5wyxR6x3vbGkBHJDGdMA1AAkwKEBc9TlNE=; b=ePvLJvMD4leZpW
	IxiQuLz3xAnPxthlVDi3F4RVjIj/xfTnf80bNANgfk4Ill56BAc0qICbudf4J1brt+IqB4eQdmk+E
	5ycW6hX4etuCjPnh8bi5vXv+n7LzpKrQwCf3adkijzwRLVNntwvHDi68iaJR4UsQWMT5AOZIPLblB
	71pMy2yMW5siqSdUUPpz8djiWYsGGucAlchLVUl3TYZCNIDBpQ1KCquBbw0SYZb+u+hveTY1oH+qz
	3QcB76rvvxqmFk2/q+DEz7mjcBRjsFOQ1Kx5zQTLS91YAxr9oufczLZmefqLkR/W8EOOAveG0KXzq
	oqP+Q0LkBCrgY97NGTIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSFYV-00CEvu-Vk; Thu, 10 Mar 2022 09:58:00 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSFVl-00CDay-Jq
 for linux-mediatek@lists.infradead.org; Thu, 10 Mar 2022 09:55:11 +0000
Received: from smtpclient.apple (p5b3d2183.dip0.t-ipconnect.de [91.61.33.131])
 by mail.holtmann.org (Postfix) with ESMTPSA id 40891CECD8;
 Thu, 10 Mar 2022 10:55:04 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH 1/3] Bluetooth: btmtkuart: rely on BT_MTK module
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <f0167a9631fd0b392490311825ff0f826c054bc1.1646783737.git.objelf@gmail.com>
Date: Thu, 10 Mar 2022 10:55:03 +0100
Cc: Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <A29B0681-F83F-4509-895B-427A467D07DC@holtmann.org>
References: <f0167a9631fd0b392490311825ff0f826c054bc1.1646783737.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_015509_877674_189B0F2E 
X-CRM114-Status: UNSURE (   8.15  )
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

Hi Sean,

> Rely on btmtk module to reduce duplicated code
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> drivers/bluetooth/Kconfig     |   1 +
> drivers/bluetooth/btmtk.c     |   1 +
> drivers/bluetooth/btmtk.h     |   1 +
> drivers/bluetooth/btmtkuart.c | 184 +++++-----------------------------
> 4 files changed, 29 insertions(+), 158 deletions(-)

all 3 patches have been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
