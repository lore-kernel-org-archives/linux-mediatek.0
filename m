Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0BCC54EBC
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 11:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HYCg2fGXGMv6OIXRvH46DWoYYb10bN8C4MjQ2KkURLo=; b=XDu3w1pdFGe5oLDYzYERbQI8+L
	DJC6tiZWgZotxUgP3V8Z9Cj+AB+90yf45EsL9P007poLXCXwms8tuGryih+DaohTEh18mOiOv2kgX
	g8FKWdj6mChWD2viajxb/VQCenGG9dn7X5wgGpViJ7UY/wvt0pYlT38nWpL2OzVS+mSZFI3H4yEnm
	PFQ7UOzgNTImnpB5Jb/408pqN8iAx0PqQLMTGzfSKx3iaafWmqbUiXkrM0zMeZZb8CcCx3sp9sIYP
	jj/2HQ+5X3vatIXzAojwRHRN6yPj8mj0R655dJRgUAvZ7QJ5E1qEHKjde09tVczslmVGpV8kvXfTp
	Lv2HW7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFwF2-00Ew53-D3; Thu, 12 Jan 2023 11:59:32 +0000
Received: from e10edge.fintech.ru ([195.54.195.159] helo=exchange.fintech.ru)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFwEs-00Ew0p-K1
	for linux-mediatek@lists.infradead.org; Thu, 12 Jan 2023 11:59:27 +0000
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 12 Jan
 2023 14:58:59 +0300
Received: from localhost (10.0.253.157) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 12 Jan
 2023 14:58:58 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Felix Fietkau
	<nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>,
	<linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alexey Khoroshilov" <khoroshilov@ispras.ru>, <lvc-project@linuxtesting.org>
Subject: [PATCH 5.10 0/1] mt76: move mt76_init_tx_queue in common code
Date: Thu, 12 Jan 2023 03:58:49 -0800
Message-ID: <20230112115850.9208-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.253.157]
X-ClientProxiedBy: Ex16-01.fintech.ru (10.0.10.18) To Ex16-01.fintech.ru
 (10.0.10.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_035922_823472_9251F53E 
X-CRM114-Status: UNSURE (   4.86  )
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

Svace has identified unchecked return value of mt7615_init_tx_queue
function in 5.10 branch, even though it makes sense to track it
instead. This issue is fixed in upstream version by Lorenzo's patch.

The same patch can be cleanly applied to the 5.10 branch.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

