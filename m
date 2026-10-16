Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4921ECCA464
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2026 09:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4WIaVmgxMJzlsaERAlBqwLuDwVcuzfSzsQMDWtKV3E=; b=LNPWEErdEtmLbVa9936MjD8fHc
	GLyPqkiunWsZPXVOgxyLCgbeqRIKLpRuyw1A9msk9ONs/MqluaTWwu4pQTv2A8GsDOqsLawSwMQ96
	+hQ/iT5rVwGnkivAhJTXJyhusn7fJ4/pK87OrDzkk0mqp809l12VDZk+IP/5s581fzH/QYXqRo1hb
	bb3mjXczBbAD/4M8j8nMyxQg+hOabhT4oqsf2T5DygjJUXG3ENL8atw7/q0T8CJvX6W8KrryywHsp
	KpkljgjcmJJHjMoqahzAF9odGuWc+o1t4OzHEEK7FhyruvV4ZecJZYTnx6S3fOUrQORHTq+FbZZeM
	zpqif39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHe5o-00000002SZA-1Hmi;
	Fri, 16 Oct 2026 09:19:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHe5m-00000002SYu-3EMi;
	Fri, 16 Oct 2026 09:19:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A94560018;
	Fri, 16 Oct 2026 09:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 179381F000C4;
	Fri, 16 Oct 2026 09:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792142349;
	bh=R4WIaVmgxMJzlsaERAlBqwLuDwVcuzfSzsQMDWtKV3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R7mT5XDP+2oPGJhvdpCOK/511QiGEeN7bLMU3Bip4mljZXwdc3HKRiTwWMfFBmVz2
	 9vtGszLeSkIP/MK3fmyTqmi9cKVNnR2QRVx9DbbTAMadPNqehqRznEwf6+9Sp+IJVg
	 MpWw6qZ6dXuE8EBoHojDeqR5oZ27QVLUq3W+KuTxMJxenDFAx0PqyETroc4qYnxmwA
	 GY1Xm+55yGbsADcEO4rubxIdYoEpU60CAaSyMnJV0Df1ApkkyJpak2t1mmfrr8EGdf
	 At5nB8yiKDM+y9VEX9Hd6sAZwMqyXD2lsDLGrDSAtQU9mws+pJVi3bRKbJjxqKely6
	 tbfGRUPorGlGw==
From: netdev-bot+sinfo@kernel.org
To: Zhi-Jun You <hujy652@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v5 0/5] net: ethernet: mtk_wed: misc fixes
Date: Fri, 16 Oct 2026 09:19:08 +0000
Message-ID: <179214234859.408196.13768026652794039093@kernel.org>
In-Reply-To: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
References: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
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

