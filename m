Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E083D606A332
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 03:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SOky+G6n;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rA63Gwu2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HZRrtyWyhDHM4W5ZPdUJtdgJ8QIlZ3J97mOSJfRbiTk=; b=SOky+G6nW9hG7cEjxU6PNRjgj4
	fjfnXuR/ejoLWdKutTyx/RWgO70f/3YTWX/4c1hoc15RYOOSQI+UnWMm/7mqKDz8Fg2aQqTY8i5UK
	Q329ZD2cAKZqa0VXTqzjpbIJppz9rii0ATc+w/yfyeKK0sImFnmSrwXo/N0nGLKGqKJfFP+vaL6ND
	ILEWXT2MIKIbNZWMZzmXqrD/5tCHVFHl4gfGpSYGoy5ykKbgp48SttnEjdB6qQyS9HKmMh48fbJRy
	P8CwuMdR/naUU+PoD52F8L4jY3EQ5wP0V1n7LcBhqdG8fwbMHlCD30cL8xDJVGC/H6gU1YVbVE84R
	fCD6kZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWDl-00000007cEN-2dpn;
	Wed, 18 Nov 2026 03:20:29 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWDh-00000007cBk-1MWI
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 03:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=rA63Gwu25zVlwyYdfnXl+dOH/KoqIaxHbydEmcGlAkHCUdvy4jwGSJUdHbeNwv01TbaaYbWW9xcpb
	 5cVXbrjR9qH4VQ2vpdQrpFyoKQHYIKbMqPwNCdzXDQbyH62TbAxT/1qKs+4tQ+gLecZpxgstc0nFGo
	 RU2UixKRpq9eEqOs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76afd197028b-10152;
	Wed, 18 Nov 2026 11:20:17 +0800 (CST)
X-RM-TRANSID: 2ee76afd197028b-10152
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56afd1970808-c73c4;
	Wed, 18 Nov 2026 11:20:17 +0800 (CST)
X-RM-TRANSID: 2ee56afd1970808-c73c4
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: peter.wang@mediatek.com,
	chaotian.jing@mediatek.com
Cc: chu.stanley@gmail.com,
	alim.akhtar@samsung.com,
	bvanassche@acm.org,
	stanley.chu@mediatek.com,
	sashiko-bot@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH v2 0/2] scsi: ufs-mediatek: fix va09 regulator lifecycle
Date: Wed, 18 Nov 2026 11:20:13 +0800
Message-ID: <20261118032015.974-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_192026_332835_8D9E7714 
X-CRM114-Status: UNSURE (   7.12  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is v2 of the va09 regulator reference fix.  Two issues surfaced
while reviewing the devm conversion (many thanks to the Sashiko AI
review of v1):

- the devm release alone would trip
  WARN_ON(regulator->enable_count) in _regulator_put() on unbind,
  because ufs_mtk_init() powers the M-PHY (and thus va09) on and
  nothing powers it off again on the way out;

- the M-PHY power-off path can leave host->mphy_powered_on set when
  regulator_disable() fails, so the next power-on bails out early
  and never restores the PHY (pre-existing).

Patch 1 keeps the devm conversion and adds an .exit callback which
balances the enable count before the devm release, in the same spirit
as the .exit callbacks of ufs-exynos and ufs-qcom.  Patch 2 fixes
the pre-existing state desync.

Changes in v2:
- 1/2: additionally add an .exit callback powering the M-PHY off so
  the va09 enable count is balanced before devm releases the
  regulator.  Without it, _regulator_put() would warn on every
  driver unbind (Sashiko AI review, [Medium]).
- 2/2: new patch fixing the mphy state desync when va09 disable
  fails (Sashiko AI review, [High], pre-existing).

Link: https://lore.kernel.org/r/20261118014234.424-1-laixiangwu@cmss.chinamobile.com

Xiangwu Lai (2):
  scsi: ufs-mediatek: use devm_regulator_get() for the va09 regulator
  scsi: ufs-mediatek: keep mphy state in sync when va09 disable fails

 drivers/ufs/host/ufs-mediatek.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

-- 
2.50.1.windows.1




