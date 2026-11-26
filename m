Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8934606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QpkhpAZT;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Fd6XlyI/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VKh3LRPiqL+qmHvwynO0AT4XxatCBMljpCiYwmyf2vw=; b=QpkhpAZT27n7QCf33bAIjp/7Jh
	PJLVsKnU0LurHlsD0BNYYMn60oAXhwyB2FCaNm7jAG1+OerDA5KRc6tJ/WeH5Lnz/1j0y4/XFZuSM
	k1yNj1uyvKvpBFSKaLQNI9tuUFfjJNnhpPAtCjnDKDrO7Rw6NvSinUOTQtG5WKN/DL8vaNHMKxGdU
	+KgyrMi2SiE8veymmLyE18DnpUa28b36BURvgX59AOEgHRVdzH4GQ79e07ZsI/HWuSVaE6f/IS2lB
	cCh89MTpPeT4fVZ797heH+R3fp3sUIdlesT/i4VobMSfMg6HNSJ0VLUhBuVE1onIV730J7e7m6anR
	3NFuo7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUoZ-0000000COEl-2UbC;
	Thu, 26 Nov 2026 08:26:47 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUo7-0000000CNuv-2mdI;
	Thu, 26 Nov 2026 08:26:20 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5617268fc;
	Thu, 26 Nov 2026 16:26:04 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: angelogioacchino.delregno@collabora.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	matthias.bgg@gmail.com,
	wenst@chromium.org,
	drinkcat@chromium.org,
	weiyi.lu@mediatek.com,
	msp@baylibre.com,
	fparent@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] clk: mediatek: Unregister apmixedsys clocks on unbind
Date: Thu, 26 Nov 2026 16:26:03 +0800
Message-ID: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa216f637c803a1kunm4b0c20ce3c29ce
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaH0xMVkkYHx4fGE1PH0lJTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=Fd6XlyI/YzbJb7sHYEK/rZAxAwNyTs1vVyeCAcaNDO79fJ9fLQDvJj387CJnRkXFdWxMeON8g+cFFbXF5rnF8CGCIwWH6uF51WKVxyIVmCM5TGtVOZmK22ZlHcyAQtStfpBEmugQ7Kq/YXv4NhtCeaJ8c5Ivu9M8ubKHIXi7VUo=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=VKh3LRPiqL+qmHvwynO0AT4XxatCBMljpCiYwmyf2vw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_002619_893796_FCB0603A 
X-CRM114-Status: UNSURE (   2.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pair apmixedsys clock registration with removal on four MediaTek SoCs.

Guangshuo Li (4):
  clk: mediatek: mt8167: Unregister apmixedsys clocks on unbind
  clk: mediatek: mt8183: Unregister apmixedsys clocks on unbind
  clk: mediatek: mt8365: Unregister apmixedsys clocks on unbind
  clk: mediatek: mt8516: Unregister apmixedsys clocks on unbind

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5

