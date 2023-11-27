Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2AAC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 19:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r7mxqkkfz9EDoNiMKgQoFx2LrcegfaNSpCMA78jTXPw=; b=K6HfGPeQ14Rzl1/k5r9UGJZ7ZG
	sXqStpsxV30Wiw4nq6pqB1waw0irj0ZblIipq+GZWqSZy99A2DUjgRtd+43xJK0B2ZpWPuv7I6oJ0
	E7tIKHBQZllLDoLGf9fSPYih3yXLEgwVVGJnGPLBEfCWOcN2BsoNm+lFGrNJEY/Bw/jAFyHzRGz+h
	Xkc5P694DzOsjrlxCi7RzScgNDzR2lDZeL108LjCOMVXk8i7MCDPrhN4o0Mm2eL5Yep44aJFBzZ0d
	4U0PQi9QP2two8ha5CTjrPXnSa45x3Zx7a2T10rJXvyOGsuKP+fRz1R9z5JIn+2isz8UDNWXHEXMT
	uAUnrapQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7h44-003JoP-0P;
	Mon, 27 Nov 2023 19:14:40 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7h3z-003Jm1-15;
	Mon, 27 Nov 2023 19:14:37 +0000
Received: from francesco-nb.corp.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id BEC0A206D2;
	Mon, 27 Nov 2023 20:14:29 +0100 (CET)
From: Francesco Dolcini <francesco@dolcini.it>
To: Sean Wang <sean.wang@mediatek.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Amitkumar Karwar <amitkumar.karwar@nxp.com>,
	Neeraj Kale <neeraj.sanjaykale@nxp.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Subject: [PATCH v1 0/3] Bluetooth: fix recv_buf() return value
Date: Mon, 27 Nov 2023 20:14:05 +0100
Message-Id: <20231127191409.151254-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_111435_579214_96DADBD6 
X-CRM114-Status: UNSURE (   6.55  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Serdev recv_buf() callback is supposed to return the amount of bytes consumed, therefore an int in between 0 and count.

Do not return negative number in case of issue, just print an error and return count. This fixes a WARN in ttyport_receive_buf().

In addition to that a small cleanup patch is added on btnxpuart to remove a useless assignment.

Francesco Dolcini (3):
  Bluetooth: btnxpuart: fix recv_buf() return value
  Bluetooth: btmtkuart: fix recv_buf() return value
  Bluetooth: btnxpuart: remove useless assignment

 drivers/bluetooth/btmtkuart.c | 11 +++--------
 drivers/bluetooth/btnxpuart.c |  8 +++-----
 2 files changed, 6 insertions(+), 13 deletions(-)

-- 
2.25.1


