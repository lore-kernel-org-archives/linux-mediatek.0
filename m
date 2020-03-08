Return-Path: <SRS0=sXDt=4Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF412C18E5B
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Mar 2020 04:53:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 837C92072C
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Mar 2020 04:53:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YqA4eFPd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4Zj2xDS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 837C92072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=P9gwHpEtzHdrgOBU90nG9e3ZBmz/s6FJ/o1Mjj6eWgg=; b=YqA
	4eFPdNwkAJTAQhkOWyymtxgALYiCj1zSvu3jfoFvmu79tBkwWHjyM3GeLq6qeo8GrROa0W6a6zsv9
	Jkv5jjqg35s/VHuZKxsLXhWz0CaVHKNcJ5uup7TGKHXGhjTOZU7e71eftoYtJNEsqAezu0edBxCyN
	tq2pJRyRs7YbPxB8vUMFV6dg2qfO/2ED6Y18YxcHTV9ySGMR0b6vpw9FaeQ1QKmd2mXFYmhFHFsH/
	IMre9KNLqxQfff8JGoHMJs3OALJOSm2TSmx6sFXwnbBAn9zHWv2ztN3TComt9urOIQDXB7INZ+V3B
	+FNVcBBj4FaofoH5kKl2+WbiM5MbZZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAnvn-0004VI-8G; Sun, 08 Mar 2020 04:52:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAnvk-0004Uq-HI
 for linux-mediatek@lists.infradead.org; Sun, 08 Mar 2020 04:52:49 +0000
Received: from DESKTOP-GFFITBK.localdomain (220-133-90-194.HINET-IP.hinet.net
 [220.133.90.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D34712072C;
 Sun,  8 Mar 2020 04:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583643166;
 bh=07rLvQ0WqPhuHx8qZF5jp9yGE4CzHoiFnGAEnIVs0gk=;
 h=From:To:Cc:Subject:Date:From;
 b=m4Zj2xDSjTGoaTSoUSQs6A03ymGE8HVvObv62K525CY3HmsFNgl4Z5A1Z3iGevjsT
 3cvQw3NuBTLUhe8anoVra/G9i1NlTCFUwY9+9+xVVh5i7vPTNKqVNP1fNodUqNOee3
 YH8pFI7s90dQVQ01uqGxnnsCIIQp1kE86Fvz59fk=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] MAINTAINERS: Update Chun-Kuang Hu's email address
Date: Sun,  8 Mar 2020 12:52:01 +0800
Message-Id: <20200308045201.3163-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200307_205248_595079_023D6BED 
X-CRM114-Status: UNSURE (   7.62  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Update my email address to @kernel.org

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 38fe2f3f7b6f..dceaeebce52a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5607,7 +5607,7 @@ F:	include/uapi/drm/lima_drm.h
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 
 DRM DRIVERS FOR MEDIATEK
-M:	CK Hu <ck.hu@mediatek.com>
+M:	Chun-Kuang Hu <chunkuang.hu@kernel.org>
 M:	Philipp Zabel <p.zabel@pengutronix.de>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
