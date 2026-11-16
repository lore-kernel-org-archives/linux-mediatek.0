Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EFE606A329
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 11:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Np32oUfQ;
	dkim=temperror header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.a=rsa-sha256 header.s=dkim header.b=6QG+SVo3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+Gulw9rQwCgMfpqxWvGwqpn6aChNo0sF9Qf6gDE7Ap4=; b=Np32oUfQjrpJWH5FHVSj15a+aq
	vefBu1MbgDEc1oV/9eLm/gGijpiRCETpyP7PicbK1ul6iq5eprdd6jZD+9DOgjPjU4R5hs8UBqxCr
	M+eF3h9Cfo/0wNxxpQi3VJc8d7nNRiosQI325tQdWwBONsKh43vMRme3AaieHOoNdJtA2/jOD4cfJ
	cTCC+ezKUemmH9cfwmCxV9LtLUYJyCpbE9l4l0W9JBIvNUxHVJKp/Tzc1ea3h3jvFE8HL6XXIuNyG
	LJ2ldYLAXPecaF6V/Rg6EXgcDOxIKZZnL4atmgsxG3a9Q4oPxncGptyXG/9VZZIIBMjT6sXdnjeSY
	XxLByq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvEc-00000002Evw-0zlK;
	Mon, 16 Nov 2026 11:50:54 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvEV-00000002EtH-32Y6;
	Mon, 16 Nov 2026 11:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=+Gulw9rQwC
	gMfpqxWvGwqpn6aChNo0sF9Qf6gDE7Ap4=; b=6QG+SVo3+dvCTkPl539gPwdwCu
	cpeCtg6aCHqPWmLhZ3L9trsWYfoXr595MnbBE11oyc0k9NbauhLFD3aDxqDgHz5H
	hd2rVIR+LGIXUpKGA5SLWUWsyQU+mf/spTlFUHctTK7iGRLITq0U+c9tBpX7oXdX
	9jQGWqGsrrBBVfMdQ=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.41])
	by hzbj-edu-front-2.icoremail.net (Coremail) with UTF8SMTPA id BLQMCkB2vwQF7vpqZ6S3AQ--.3956S2;
	Mon, 16 Nov 2026 19:50:31 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <mbrugger@suse.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 0/2] wifi: mt76: mt7615: fix RX parsing on the USB transport
Date: Mon, 16 Nov 2026 19:50:26 +0800
Message-Id: <20261116115028.2766-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: BLQMCkB2vwQF7vpqZ6S3AQ--.3956S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWDZF1UZF4UXw1ktFW8WFg_yoWfWwbE9r
	1fJrn3Kw1xGrs7Kr43tr4jqryrK393AFyfZr4FqFWavrZ7ArZ8WFn2qrs8Zr4fua1Iyrnr
	tanFy3sxZFnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbf8YjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x0
	82IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGw
	Av7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48J
	M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8ZiSPUUUUU==
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAgUTD2r5zUi2hAAEs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_035048_913353_5D009589 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two independent fixes for the mt7615 RX path:

- mt7615_queue_rx_skb() walks the TXS entries up to skb->len, which
  describes the whole packet including paged fragments. Frames
  delivered by the USB transport can be fragmented, so the parser can
  run past the linear part of the skb and read outside of the skb head
  allocation.

- mt7615_get_status_freq_info() dereferences the configured channel
  although received frames may be processed before mac80211 assigned
  one, which crashes with a NULL pointer dereference.

An equivalent fix for the first issue in mt7925 was posted separately.


YuanZhe Liu (2):
  wifi: mt76: mt7615: fix out-of-bounds read in mt7615_mac_add_txs
  wifi: mt76: mt7615: fix NULL pointer dereference in
    mt7615_get_status_freq_info

 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.34.1


