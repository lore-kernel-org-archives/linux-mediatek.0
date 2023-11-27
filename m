Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEEFC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 19:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exq4LVwpbJjU/dctBbOVPn9o5GckNL2iXNCjM5rt1yQ=; b=ZVjfAC83jGH+h0yvMszrBT0Wha
	/1ibV0ySdF0/aZSd6VR1pYieTyTQpWCYuyJ1VBbeD5QnfkP8os7JzOHXGfKPkx5+tfITrcKrUu7NZ
	jGbqPlEj+eG6GDrFeadE9olExISg7pWh+RqAkkpALBls2ZRMoHJ3oNINXx2xUxQ3ZgGJvesF5D+//
	ZlKWC+OzG2gOz/L1dK2F5kOpb/prMeq3phFiT5TEIRYjwNTioOjtPW4j+baPKqd/ak/TXeXA8sz0v
	5NNpAU62eTLAf5GQcK/TTtyRVhDHAyjF+md9cFZUXFfsGyUSijXwJNyFu4g6ib2qbYbR8+tn8Ancy
	du2qzZrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7hCV-003L96-1b;
	Mon, 27 Nov 2023 19:23:23 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7hCS-003L7b-18;
	Mon, 27 Nov 2023 19:23:21 +0000
Received: from francesco-nb.int.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 32EDF206D2;
	Mon, 27 Nov 2023 20:23:18 +0100 (CET)
Date: Mon, 27 Nov 2023 20:23:14 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Sean Wang <sean.wang@mediatek.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Amitkumar Karwar <amitkumar.karwar@nxp.com>,
	Neeraj Kale <neeraj.sanjaykale@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v1 0/3] Bluetooth: fix recv_buf() return value
Message-ID: <ZWTsoot/kAprNFz0@francesco-nb.int.toradex.com>
References: <20231127191409.151254-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127191409.151254-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_112320_555129_10F8D248 
X-CRM114-Status: UNSURE (   9.05  )
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

Hello Jiri,

On Mon, Nov 27, 2023 at 08:14:05PM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Serdev recv_buf() callback is supposed to return the amount of bytes
> consumed, therefore an int in between 0 and count.

I have also a patch ready to convert the return value of serdev
recv_buf() from int to size_t.

I would be inclined to wait for this series to go though first, given
that these are fixes, while the change from int to size_t is just a
cleanup to prevent future mistakes. Do you agree of would you do it
differently?

Francesco


