Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1B8C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 12:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZCWnvoQpWw2M2cMVVX42H2RjUEcef3PYAPbbWP1lNNo=; b=0SmehfC6M92im6cOtWElzuh7Ct
	7ZTJNSk1FH5tdzVioC4677Es06ZnrOweCim2dCiSwoqwtPmFyjw+NSvlbFL8VS1TtxLDIQN388TDg
	qxCSoJWuqscvxaiLUm4Kf5vDL59VvQKYP3HZ/tTCdpTQ+jg9fQOg7qEK9jATMvx/UPNGzG5G6Ppbe
	ZfEAp4KXP+q6j/RE597eslR9+l0c9wMtSECroM+wJ49wVWThIOL6WAYvaQnos5+Y1FIIctHAgUUrw
	DoLGFvVoXy2DtCBWrnfUtHMvNPrT+uykmJ4Qg4Nc+f/+b0igPGsxY7JNMDpcBz6Dgw6oXImCZk9Ij
	ShXpIezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMTPp-003WSP-7O; Mon, 30 Jan 2023 12:37:41 +0000
Received: from e10edge.fintech.ru ([195.54.195.159] helo=exchange.fintech.ru)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMTPL-003WPY-4l
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 12:37:13 +0000
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 30 Jan
 2023 15:37:01 +0300
Received: from localhost (10.0.253.157) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 30 Jan
 2023 15:37:00 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Felix Fietkau
	<nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	<linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alexey Khoroshilov" <khoroshilov@ispras.ru>, <lvc-project@linuxtesting.org>
Subject: [PATCH 5.10 0/1] mt76: fix mt7615_init_tx_queues() return value
Date: Mon, 30 Jan 2023 04:36:54 -0800
Message-ID: <20230130123655.86339-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.253.157]
X-ClientProxiedBy: Ex16-01.fintech.ru (10.0.10.18) To Ex16-01.fintech.ru
 (10.0.10.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_043711_217687_711D69E8 
X-CRM114-Status: UNSURE (   4.70  )
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

Fix mt7615_init_tx_queues() so that it returns result value of final call
to mt7615_init_tx_queue() instead of default 0. Otherwise, failure in
mt7615_init_tx_queue() is not tracked by the parent function. The patch
can be cleanly applied to the 5.10 branch.

This issue is addressed in b671da33d1c5 upstream. I decided to refrain
from backporting it whole for now.

