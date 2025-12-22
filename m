Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149AEE6ADFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Dec 2025 20:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbxaNpLxFAH3dqMAl+p1IRk5i2JFW/cXOJCZG2bLHVQ=; b=zArwnXarWYmHPhkSx+KRRunpi6
	w5PoUJOgGQ7dT6hY/QyVSIZmyKc8eRJW7CCnx65WwfSoemMbHZJzcWJCqWedsLqTKToVzTT3JZLWV
	xjhAtg7ruXIy7eqLNdwF//TPqRWWDJJ2SCLoqtXpNsSRjH4DAaqdSLI5nYUl+ZYyRJmB4YX6jBU1r
	gXDRIyCKT59RZP7SOjDupM9l5eWkAXaP3jzLoFUYqpO4UELtQhnlmPCorCYu6c37nTECBynpftKvD
	Hlz+1yHSx9cItHZ6lXaxkQ3vz9C6byEk5KHFj9qBDTILoMOfHPRQlwYGK/hp/9zsRSH4lyWdEiX6f
	s/5FnSdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXmov-0000000E9dp-3XsI;
	Mon, 22 Dec 2025 20:47:57 +0000
Received: from mail-10630.protonmail.ch ([79.135.106.30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXmot-0000000E9d5-1LzM
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Dec 2025 20:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1766436472; x=1766695672;
	bh=rbxaNpLxFAH3dqMAl+p1IRk5i2JFW/cXOJCZG2bLHVQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MLK8f6kFrt4HaO27kUwVilQF/dtxIh+J/vyaqkpzIGDx9Zt6VU5EGUiBVJTkuGxmm
	 WKAl9fPWKpZOn7aVb9GHPp8SqCHsuSI5BfevxaoHXGlJ1s1Z5hlB2kzCArnQ9Ao4PI
	 ilYuyrKXH2s2YvfSMrVUeOtwd+MD6B0qbwrVJ/bmUcBkIjrGtytFZX1c90H3HkQCho
	 nwu+5Hq1d8xVLnzv1jElb9z5ji2bMdRFLmZ64vzapurn4aEmNG/UvSMv0tCObMsiys
	 y2QibfvqWHdubaTGSIYHFYZ8lXSGh9vBYHyIzGk9Mm1Iy1/yUrklUkPxWLgYT08vZr
	 BnRkP9YawosbA==
Date: Mon, 22 Dec 2025 20:47:44 +0000
To: Harry Austen <hpausten@protonmail.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: fix buffer overflow bug
Message-ID: <DF51GPM5N848.3L90OHP3XRWTV@protonmail.com>
In-Reply-To: <20251222180437.1938-1-hpausten@protonmail.com>
References: <20251222180437.1938-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 7cbfe6dc198c2829d8087c095262b79223caa22b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_124755_535002_30CA9C0A 
X-CRM114-Status: UNSURE (   4.45  )
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

On Mon Dec 22, 2025 at 6:05 PM GMT, Harry Austen wrote:
> Prevents attempting to read an extra byte from the origin string.
...

Ah, my apologies. There appear to be a bunch of emails about this bug alrea=
dy.
And an existing patch [1], which has already been reviewed. Please ignore m=
y
patch.

Apologies for the noise,
Harry

[1]: https://lore.kernel.org/all/20251205161202.48409-1-mikhail.v.gavrilov@=
gmail.com/


