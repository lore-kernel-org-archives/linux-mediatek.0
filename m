Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E00BCCD18D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fi+Ibc7By9oY9iEdzVxUNdJ9YZJZCzKUdP1fhBnC29k=; b=RlFcxtSlh+ILMlxGU1fazdoCr3
	MglgFZZEcl4e1e7F+JSXXDSKf5j9sfpUr8No68ywY0DUJO+2owZK2s8ieaes9fv3kDBuzfiO4tDx6
	DckhNCK5oaiM4pRv9vHpufPpeyHO94WMbHBVqYth/u3VTlR/zY2KTOdnlAeMPXtou+GFmyKBJsL5g
	vbQLFKzJO4BzMwXaR8BvEuyHUPazjJAPkWTuPtHUPJOlm+nRJrS1Ak+q7fkXQ/f3ozTWA637aHA/c
	WyskIH1bzTsq8vM1Py/wVtO1W46rOHUU3TZ1FxRt6eAk/rsy3+RoIgFBuS1FLhwE/QOximpddxiZf
	c2rRffmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JYp-0000000DOrf-24cz;
	Mon, 13 Oct 2025 14:30:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JYn-0000000DOpC-23r9;
	Mon, 13 Oct 2025 14:30:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C8924541C;
	Mon, 13 Oct 2025 14:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B723C4CEE7;
	Mon, 13 Oct 2025 14:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760365801;
	bh=zI9bFSUeY3dtnEd65ff1VHq7zZSXobEN1YFQJ+AIM20=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O+2jrUVF6R6K0l/0SyCj2ZE3aQPZY4WLSRiT8IpegNQqKHrXhhxzyw9kXy2pH9ba2
	 idtZaEfytKl3kI5haLyxvgn2G8SYEs5umbAXQDff8Aihvg9YN/z4iFOTM3U8+f4GSH
	 gA/CHiZa/jV4dYZYdrH6nARaKiwqZkpg4aaeHrFIy2OGfYtAalOZ6p9wONQ1xGQUUc
	 j+QMbQp2C/1XXmPgBSHxJKBqeLVQ1pxUOLsTRVyL+SqAtNwSB+pDtQo/t5QMzFMEns
	 eHOI7VF86MO92sWtEQJE8QFYaWTysiNnuHBbwB5H3Bv22COdHZOMCjVgHS4Ws5Z3ZS
	 ew0kZX5GDrbcQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 13 Oct 2025 16:29:42 +0200
Subject: [PATCH net-next 2/2] net: airoha: Add get_link ethtool callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-airoha-ethtool-improvements-v1-2-fdd1c6fc9be1@kernel.org>
References: <20251013-airoha-ethtool-improvements-v1-0-fdd1c6fc9be1@kernel.org>
In-Reply-To: <20251013-airoha-ethtool-improvements-v1-0-fdd1c6fc9be1@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_073001_571882_D83B63F8 
X-CRM114-Status: UNSURE (   7.80  )
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

Set get_link ethtool callback to ethtool_op_get_link routine.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 2fe1f39558b80926439cc2f765eb5057464dd76e..6effdda64380bf72ce3c5b6b2f551f560f2ee097 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2770,6 +2770,7 @@ static const struct ethtool_ops airoha_ethtool_ops = {
 	.get_drvinfo		= airoha_ethtool_get_drvinfo,
 	.get_eth_mac_stats      = airoha_ethtool_get_mac_stats,
 	.get_rmon_stats		= airoha_ethtool_get_rmon_stats,
+	.get_link		= ethtool_op_get_link,
 };
 
 static int airoha_metadata_dst_alloc(struct airoha_gdm_port *port)

-- 
2.51.0


