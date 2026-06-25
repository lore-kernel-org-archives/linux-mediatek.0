Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977ABCDB479
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 00:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQz2XCBwRS8uLK6XBV7zSGPH2BY3UI9xhwr0H8YcNTM=; b=TbDmk2UUZ/aBGD+pim4WU6zvUq
	9oVy9FyDTBJM2Jnkl72vc4uR6XdYu69lU96CPZY04atJN17P4JrHgfvhiGgxHx+UgY9ux7U+Ls/2v
	GiKLKFsKHPUFNYnduWLCs0RZ4P+FD7nWK+L9ZnDZ8BG7Y0ScB2ESk6UkpCk+wG5nJYURs/ceU5DsZ
	kJA24iOE+b1e6+7HbGqR8guUxcgXkSk6cglmmQyAxrwXyDBYuc3QGuz+yPm5wXQ1lg2ghHxCTVt0o
	nyR2uG3mIHQBhQFQ3YpVeS5Mr4hx1W4i/4UPiSAek4ItE9Sb1W9RA5VvilUx2mUUiFnmnBfPNIlvl
	xk/jv3Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXek-00000008SGT-0VVu;
	Thu, 25 Jun 2026 00:09:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXei-00000008SGE-3FsY;
	Thu, 25 Jun 2026 00:09:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ACB4243F10;
	Thu, 25 Jun 2026 00:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78491F000E9;
	Thu, 25 Jun 2026 00:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782346159;
	bh=EQz2XCBwRS8uLK6XBV7zSGPH2BY3UI9xhwr0H8YcNTM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MpSBA7rI/ESXhoj9CFf1wpUgC6YJUA7qMDqhbRyBPAuDBK9Ia03yaI2I6ew/dbqJu
	 sss2bjJYZ3xFjU7SUn10PhUlBSTCkC3jZ+5d8+XWPcf0b0mTJ8YetSCIuQnV/4JhP8
	 P8IplKPYma/WqSQ3oTuKqFKsjQsjK4+ixeCCY7rVMaojpukWcsBA3hX2ffZ6pqF/TX
	 TQdn+BW6ED5QjuxjNwGZqtBFZ9TseAmoE+282nKTfiTlpipVnSkH6rqv9FJiNDXNaS
	 va5qPjm+KN3jX0XhZ+Py1CCPxU6lBx38jGoqyzWCGEln8G9SIirWiLNhXKj8/UXz2q
	 l6X96M/sVO7kA==
Date: Wed, 24 Jun 2026 17:09:17 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Cc: jackbb_wu@compal.com, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg
 <johannes@sipsolutions.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
 Shi-Wei Yeh <shi-wei.yeh@mediatek.com>, Minano Tseng
 <Minano.tseng@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Simon
 Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 0/7] net: wwan: t9xx: Add MediaTek T9XX WWAN driver
Message-ID: <20260624170917.09967c74@kernel.org>
In-Reply-To: <20260624-t9xx_driver_v1-v3-0-73ff03f60c48@compal.com>
References: <20260624-t9xx_driver_v1-v3-0-73ff03f60c48@compal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 24 Jun 2026 18:04:06 +0800 Jack Wu via B4 Relay wrote:
> T9XX is the PCIe host device driver for MediaTek's
> t900 modem. The driver uses the WWAN framework
> infrastructure to create the following control ports
> and network interfaces for data transactions.

Replying after a long delay and then immediately posting a new version
of patches is very bad. Don't bother replying and just put the comments
you had in the changelog of the new posting. Otherwise the discussion
may get split.

