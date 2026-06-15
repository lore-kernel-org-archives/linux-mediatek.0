Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FD9CD98E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 12:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXgYtHMie+RmyUB/eHjMs9ZC08mgVE4IJMBwQnvw2Cw=; b=m6C1L9QRm0Oetsi+E5gKegGzH4
	KfY0VuM/PVnXvWCtrZS61XPLVRxIbw4ugQSbSNa/RcYIxS0rHUI+zqVGBX4jETrOesC5uvwm9U1iX
	fGL9KrFRpBdgJh07qHINaqq+P8nNTq+cbcKybr2e1Gzm3xXp0xnxKCGRNnQsWETGIQ+G7Dte6y4K/
	Er7A3DPPnQ5oqw+cW0W/bgv3mfwJdpQ7uHisZhAwrl9L5qfE6fHMl0ZkVSIdev7Wz/r02p11mFlR6
	6R77fO9t4Dtf8xiVLThUH93tJf/h+/2Zv61OsTuMDEtOYxdR5m9P2Fa86aaPw5GYNBm0aQWzWs5aH
	VLSetuGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6bq-0000000EDmM-11jA;
	Mon, 15 Jun 2026 12:40:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6bm-0000000EDlV-3VuO;
	Mon, 15 Jun 2026 12:40:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F150160154;
	Mon, 15 Jun 2026 12:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E321F000E9;
	Mon, 15 Jun 2026 12:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781527205;
	bh=bXgYtHMie+RmyUB/eHjMs9ZC08mgVE4IJMBwQnvw2Cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uk6/+ac9bmrBWbFhSZ+B/KE5aTp+V0Qmzpt/aG/tVpfj4uIpHUrBb9kv6JOQej7zt
	 11mZCYa0ZURJo+xjl/yUZwtGe08aN02lV+vjAiBWJRQQ3A7QeFxNvmwMkA1PV87Vf9
	 1nOOYGxUokROnlKZcH1dPvW+g3ude16KEhcJ+vOzsBLRtcMf6paXP+PEENHFGimEAE
	 M3455QgBJHctAxJA28j5tG6WPp+CNQIwNL3HITPRNOfu5/v9/akTNVO4SkqgxgrsoH
	 Ilf6WByrDIiSKNRQ4J85ComfAy2nsz9/yfP22G34w3Ioy/35jn/LXQ3G+pVShh1OIL
	 GAGpd4EswiI9Q==
Date: Mon, 15 Jun 2026 13:40:01 +0100
From: Simon Horman <horms@kernel.org>
To: "Wayen.Yan" <win847@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: airoha: Fix skb->priority underflow in
 airoha_dev_select_queue()
Message-ID: <20260615124001.GK712698@horms.kernel.org>
References: <6a2de8c5.2c570c9e.53b1a.0e1b@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a2de8c5.2c570c9e.53b1a.0e1b@mx.google.com>
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

On Sun, Jun 14, 2026 at 07:30:54AM +0800, Wayen.Yan wrote:
> In airoha_dev_select_queue(), the expression:
> 
>   queue = (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES;
> 
> implicitly converts to unsigned arithmetic: when skb->priority is 0
> (the default for unclassified traffic), (0u - 1u) wraps to UINT_MAX,
> and UINT_MAX % 8 = 7, routing default best-effort packets to the
> highest-priority QoS queue. This causes QoS inversion where the
> majority of traffic on a PON gateway starves actual high-priority
> flows (VoIP, gaming, etc.).
> 
> Fix by guarding the subtraction: when priority is 0, map to queue 0
> (lowest priority), otherwise apply the original (priority - 1) % 8
> mapping.
> 
> Fixes: 2b288b81560b ("net: airoha: Introduce ndo_select_queue callback")
> Signed-off-by: Wayen <win847@gmail.com>

Our CI guessed incorrectly that this was for the net-next tree,
where it doesn't apply cleanly.

Please post a v2 targeting the net tree like this:

Subject: [PATCH net v2] ...

I suggest including Lorenzo's Acked-by tag.

For more information, please see:
https://docs.kernel.org/process/maintainer-netdev.html

...

-- 
pw-bot: changes-requested

