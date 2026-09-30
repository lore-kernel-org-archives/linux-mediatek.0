Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4456ACA5FBB
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2026 07:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=UgSqtgkzy5dVt1sQd0G70n0Kkl
	fwkmbqpnsZcc0FS1AtbnoQcWFX84TIt5hnjtrdFSYdjiVDYZC8hklB5LNhksiU5u8WUd0fpYvfQva
	l6qQOXHhmkpJN13b6uhxgduMhOxRqA4GF8994jNmpTuDSQbst09NZ1hsMlQJO5+ReNSQP3RZkrbI3
	sYDQnbI1gFMj4Bx00ySDjNirUYbp/6Q79VYzrDoGLAxWM5rSkgjwfAzyWSChFUl8PkrBkFGBMH+IE
	QvKT6fcWGnG92blRPHGOk7gazrDHu4zP7NVBfRaBwWiHP13e85CBzu+jlCt950aPXuvHop1w1Xlbz
	npX0jmLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoM5-00000005E7q-0Mxv;
	Wed, 30 Sep 2026 07:03:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoM3-00000005E7Q-2uXE;
	Wed, 30 Sep 2026 07:03:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E3B2601DE;
	Wed, 30 Sep 2026 07:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4801F000FF;
	Wed, 30 Sep 2026 07:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790751830;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ESuU3Kha9CwkCEgTOA/6gCYu+o1mhp0SJw0SK+wDues2zrZhw97CFFM+k7/kkNQIZ
	 peta3pNuoDqhGn6s/G/askT2Y/rp+LCah0NOXwW/T0gkGL8dcQ0a33tPmS+6XjnzRx
	 BUqPGm08DRGKnYtImlaZ3fSVneo21F8iP2Q/d9Y+tcbm3vUfUgyaX8ua6rzL0yLGn/
	 8blPL9Hdt1N8u4JzzoVdQBM2/HYy6tGwg8cfS1uSSVm0nSmGxlcJdslhO7nUeuHwYR
	 eXM4V/y90VNCzpjDxgy1Zlhm31xEHHU117Vr04p80N/E5Wex0o632ybd2lvG6apuPV
	 MjuwSkRLeMtiA==
From: netdev-bot+sinfo@kernel.org
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Leto Liu =?utf-8?b?KOWImOa2myk=?= <Leto.Liu@airoha.com>
Subject: Re: [PATCH net v6] net: airoha: Add retry mechanism to
 airoha_qdma_set_trtcm_param()
Date: Wed, 30 Sep 2026 07:03:49 +0000
Message-ID: <179075182973.31693.9923122035627324820@kernel.org>
In-Reply-To: <20260930065855.46171-1-ansuelsmth@gmail.com>
References: <20260930065855.46171-1-ansuelsmth@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by code inspection). If it was triggered please include
   the symptoms, like the stack trace or error messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

