Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8C8606A33C
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 14:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fsorHMfV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jXRNeYSD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=; b=fsorHMfVGpiLt7SERFlYfan5zq
	AdkZCbF+6QiEKCygEf2kvsfnnrmsSyCAba5mgqGVXA6NCSIOjwfaCAolj7H6ufazLzoOmgUin5xFD
	JblK/JmqON5RFDJJkRMZs78vKwSFEyKDbQFbx+f3HHbZVHFbuIp+04WKsrwTppVF0QDIW4dDinZB4
	81MN/sQSD4BnDuAR0LESfp/d2rP02GEWS+zLhHv1NAK7zLSUQlpR2GdjN21JWpm+n5i7Uhvuw8fOc
	6cGVGbD84fCb6GWt+ANfZlz5OVgtSHt4b85RltbNWjEgks6gLvPv22cmszO9uOTqrNXvpSrQ8Fsn8
	NJyzANyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhIu-0000000EoLK-0ZFE;
	Sat, 07 Nov 2026 14:22:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhIs-0000000EoKY-0cFw;
	Sat, 07 Nov 2026 14:21:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5942E601EA;
	Sat,  7 Nov 2026 14:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F37E1F0089F;
	Sat,  7 Nov 2026 14:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794061317;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jXRNeYSD1UFTW+NzGat54yHQg16hpMnjBsqYjThBrrtvQyodflqHQeRKKA7W1RcZH
	 ALzByAeQiF62jKTemPxWK/EV7tJu4Ug+IoU3xITxOvOXWpxblr/TilmjeqsbWPFV/Z
	 DbaPxKh8rC376o04cjJlZ27+7fxdXsaWTOjuR47TpE4pD+gyYyn51uWNgCjguPHMJ1
	 N9566qdk+Ts3qOVOJpIi1yduyno6I1Umw6R+4gCprK4S0IDR1yIRb3dPt6gbkSAcVY
	 VPtt2WQ8v8N9UNuVfFstevm2w3t+fYpdu4gQLY0mNZa3oAfgsxw8oCf2YidKp2m/AP
	 os8f0QVy/bOfw==
From: netdev-bot+sinfo@kernel.org
To: Xia Yan <yanxia@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yanqing Wang <ot_yanqing.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 yana06070@163.com
Subject: Re: [PATCH net-next] net: ethernet: mtk-star-emac: fix device_node
 leak in mtk_star_probe()
Date: Sat, 07 Nov 2026 14:21:55 +0000
Message-ID: <179406131565.488859.1019307996230359534@kernel.org>
In-Reply-To: <1794061182000.57993.3986467551914992480@cmss.chinamobile.com>
References: <1794061182000.57993.3986467551914992480@cmss.chinamobile.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

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

