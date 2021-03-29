Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70513C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:07:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8BC061987
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8BC061987
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GzZiijTDlDdy8rTJ1M408DiC0o0RCnL3gwmw77h9a3Q=; b=C8GHlFkJ+sC1o5aAcsOyt7aOgy
	r6hvtFkAxcOy6HSSsYpaXEHf6mfMptQq2lELxRH6nrQ14ps+p52kPppz6VNcXMJbO6xcRI2VAJrO0
	aSx0W53+NZzU7zVzs2Aw5v+1Edi1eqm33uUm+tbownhB/XpTvB3nGQ/CVq9fuQsXaA4fXIhJwS6cw
	ocWQ6/DyScUOTdVWpR+Lmm22NIYYQyTmGH2IBU/0OUP9da/6ACNRKcifuiXas2CjtO4YdhZgqbo3j
	RSKPGSq+NW3K2N72i0pHYVJrIzWjhuL1kBcC71727N7z4kKVtnJOugJuTmt2AwQfzzYgGzW8koCIs
	SqqnwEXw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0yD-001ptk-J6; Mon, 29 Mar 2021 23:06:53 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQtwl-000jtw-EH
 for linux-mediatek@lists.infradead.org; Mon, 29 Mar 2021 15:37:09 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:85ba:22ea:8b43:4375])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 485381F40F09;
 Mon, 29 Mar 2021 16:36:52 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: dafna.hirschfeld@collabora.com, kernel@collabora.com, dafna3@gmail.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, enric.balletbo@collabora.com,
 laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 0/3] drm/mediatek: Don't support hdmi connector creation
Date: Mon, 29 Mar 2021 17:36:29 +0200
Message-Id: <20210329153632.17559-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_163707_756612_0F2BB05A 
X-CRM114-Status: UNSURE (   9.15  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

commit f01195148967 ("drm/mediatek: mtk_dpi: Create connector for bridges")
broke the display support for elm device since mtk_dpi calls
drm_bridge_attach with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR
while mtk_hdmi does not yet support this flag.

These three patches fix that by adding support for DRM_BRIDGE_ATTACH_NO_CONNECTOR
in mtk_hdmi bridge attachment.

changes since v1:
1. split the first patch - now the first patch only moves the bridge ops to the atomic API
while the replacement of the field 'conn' with the field '*curr_conn' is done in a new third patch.
2. in the function 'get_eld' use the current conn only if 'enabled = true'.

Dafna Hirschfeld (3):
  drm/mediatek: Switch the hdmi bridge ops to the atomic versions
  drm/mediatek: Don't support hdmi connector creation
  drm/mediatek: in struct mtk_hdmi, replace conn field with curr_conn
    ptr

 drivers/gpu/drm/mediatek/mtk_hdmi.c | 171 ++++++++++++----------------
 1 file changed, 73 insertions(+), 98 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
