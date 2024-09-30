Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38605CE8349
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=646jukxCbcni2FUMMWaWsxVCkrvJxyd8r/f3kspSL4o=; b=je2LklIGu+E4MI
	nvcn8NquIhqRDXi3qzIRjAr3PKl0nOm5ySuYMDeaA6iK0Xy3ienFoz30yXo5HF8Y/n08k6F1vfesT
	R7FDzwNaZqCrUkZ86qqfph6+KlSN3AwBdKRju+tA95uGYMCa8r3F6/6zYHYdkvoiqd3dp2Hig/F06
	l27rHpB0So39bTxUk6sq2pBfwtAnYHVDA616nvi1PdhXYHg1maObrvgSm/r++dwTIegMQtq03dTbs
	HTAujAelcDCzI4uqNGVrUkL5n13NsKB5HnXtFLTESKwQOIbyZLlhHP4WtFEFidyAEjnkB7MSUExh1
	np2UwHqCnxoHIJ/LI+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHBN-0000000HTpe-42G0;
	Mon, 30 Sep 2024 14:15:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFbW-0000000H4G7-3H97;
	Mon, 30 Sep 2024 12:34:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 759405C4673;
	Mon, 30 Sep 2024 12:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B452FC4CEC7;
	Mon, 30 Sep 2024 12:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727699657;
	bh=y6Yu/b1i8P5MR2s9bFPePt7VXpAuUQKY8kcEweB7Z5g=;
	h=From:Subject:Date:To:Cc:From;
	b=oVGcVkSzsbsFzodXo62dQvrktyuvCrI6Y2ywz/FJlsa+0WpvkcHf8UODRQ4pwogse
	 1r76HP4ZhPRi8riMpJntmI+sUQ3PI1Jc2u8Kl3qLZM0PSWmpMv0ZJQMniEJ6kNww3h
	 ifaKqWQ1/+nEk/S+o1sDF3oBqGOf5v81uVPtbGmwtcOaQOehnwvwtasidFNiYodQxi
	 u01keMnq4JIbujFuHXYfNJfByQzVkFw4bNXJerj6mXlqseP+72hFcqE4H8kHZwj0hT
	 fIv8WuGZpFkAnVQQjsSIwyEYrsAppzzqtFcoX5PklDPBB/lkruFm5fsmNWPxABIKxQ
	 G6qDwaJU5eNVw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/2] net: airoha: Fix PSE memory configuration
Date: Mon, 30 Sep 2024 14:33:47 +0200
Message-Id: <20240930-airoha-eth-pse-fix-v1-0-f41f2f35abb9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKua+mYC/x2MywqAIBAAf0X23IKvS/1KdBBbcy8qGhGI/550n
 IGZDo0qU4NNdKj0cOOcJqhFgI8uXYR8TgYttZWrNui45uiQ7oilEQZ+MRhplLEkvQ8ww1Jp6n+
 6H2N87jzY3GQAAAA=
To: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Simon Horman <horms@kernel.org>, upstream@airoha.com
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053418_917775_B07167D2 
X-CRM114-Status: UNSURE (   7.58  )
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

Align PSE memory configuration to vendor SDK.
Increase initial value of PSE reserved memory in
airoha_fe_pse_ports_init() by the value used for the second Packet
Processor Engine (PPE2).
Do not overwrite the default value for the number of PSE reserved pages
in airoha_fe_set_pse_oq_rsv().
Post this series to net-next since these are not issues visible to the
user.

---
Lorenzo Bianconi (2):
      net: airoha: read default PSE reserved pages value before updating
      net: airoha: fix PSE memory configuration in airoha_fe_pse_ports_init()

 drivers/net/ethernet/mediatek/airoha_eth.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)
---
base-commit: c824deb1a89755f70156b5cdaf569fca80698719
change-id: 20240923-airoha-eth-pse-fix-f303134e0ccf

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


