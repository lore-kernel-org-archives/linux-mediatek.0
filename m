Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D5BCD6E56
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2026 09:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XvO6AWWbrytQKUaTglHDoblgZaWUr8G3OaM5lLPMVTo=; b=SRcE3sGfbJzPM0UUk4xOQXJDHa
	s2XnDK/voJLNsoGgSPYYa1khOaEHOxT5HrCA/fEdnoCo2Qn1QCwKwuPyY+34ZcbVU2qBuP0YjNYJy
	/Y+UXmcuOyJWOd6lSZJuatTmdNlw9vljOOcZnMixvaKFpm6kESL0pYKlfTk7gLU2IkkMBIfKeBzgT
	kK9asHNCkbRTdgvRic7yUJnQw8TFLFGomcEjSv7lIowQWbmC1GvROa3JnvuEbCwKvVb7VOWN7JqHB
	x2ju8UpI0Xxc/u9vTHNwq0jPjWVl7SsjGmOcM2H/YbKDdIqOZcNq+3TUcdArYHCYq4YSYk54OOFeN
	tV+rGtlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyhx-0000000ASyh-2F59;
	Mon, 01 Jun 2026 09:13:17 +0000
Received: from chamillionaire.breakpoint.cc ([2a0a:51c0:0:237:300::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyhv-0000000ASwk-0U7A
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Jun 2026 09:13:17 +0000
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id CFCCC604DC; Mon, 01 Jun 2026 11:13:08 +0200 (CEST)
Date: Mon, 1 Jun 2026 11:13:08 +0200
From: Florian Westphal <fw@strlen.de>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Felix Fietkau <nbd@nbd.name>, Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org
Subject: Possible UaF bug in netdevice teardown path
Message-ID: <ah1NJMrJ5rEkQlJG@strlen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_021315_287635_2C419B2A 
X-CRM114-Status: UNSURE (   6.75  )
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

Another sashiko drive-by report. TL;DR, do you need to apply this
pattern in your driver?

-       metadata_dst_free(priv->md);
+       dst_release(&priv->md->dst);

Affects:
drivers/net/ethernet/airoha/airoha_eth.c
drivers/net/ethernet/intel/ice/ice_eswitch.c
drivers/net/ethernet/mediatek/mtk_eth_soc.c
drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec.c

Long version:
https://sashiko.dev/#/patchset/20260527135751.1031891-1-tristmd%40gmail.com

This isn't a bug introduced by this patch, but looking at this fix, do
other callers of metadata_dst_free() suffer from the same use-after-free
vulnerability?
In drivers like ice_eswitch and mlx5 MACsec, a metadata_dst is allocated
and references are taken on it via dst_hold() when packets are processed
(for example, via skb_dst_set()).
However, on their teardown paths, these drivers call metadata_dst_free(),
which unconditionally frees the memory without checking the reference count.
If packets holding these references are queued (like in a netem qdisc)
during teardown, does the memory get freed prematurely, causing a
use-after-free when the networking stack eventually calls dst_release()
on the dequeued packets?

