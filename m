Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57974C43217
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 11:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkMHENyFsh6/3SjkSTuYRYMbHc7R5XzWBBCbrwJgYhc=; b=TY2Aybk/CFG7YLeeIEB7PD3sw0
	xdHNacJvIiCTRfFJunlFmXa1qCXQsKibzVoRoFhpHMlp+rsQfTzsIMLFtsZTiumk7LODe9oc4vumt
	m7TQi2fhFWD3ksGxtaJSHckghhMp0HPfYTXzXc2aeiXM6Du2K4JLuVG8f+rWn9nhpI8ljcHQ2qyFR
	8QdfVMnCUMrwF8HkLSCeZyV+NlqSw+uCRT4LJxtpCvpG4HuQEqqxvpPcYC+Z3vFZqMp35Vsk+r10C
	OxQxR23I6EP+WhBQDc2ChyPzIynoK7b083ABkSjyFP1XBClvO7y97p80RMi1lNEULvNU1qkAjGJKC
	vPpZAiyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olU6b-00EIpM-6m; Thu, 20 Oct 2022 11:52:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olSwP-00Deky-Hh; Thu, 20 Oct 2022 10:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YkMHENyFsh6/3SjkSTuYRYMbHc7R5XzWBBCbrwJgYhc=; b=A5ZnJ6LVs+PZuJ1vg4dNnI/z+7
	9FqwFOhcx75oKOI6q6NXYZmm070QvRpGI8xMImrtDmB5pZBpbgUN2wEdJlY7FbvVG632d1wSplPqZ
	FdoZn6uDad9MYEobwYI3Qnu1T2fbOgsmX3/gf1kRajrDwmgbj86ZK0tJXyaeeRDrPom0JSVzUC6rf
	pcTfWiwnMKg/liSvbaMTkVXDFveCOEB2+LC84QA3PMtSGxK+uh6xSZ/1XpQRgNbf8sUjk4cATyKVr
	OLWcjQ6qiOOMHCnm29x8nyOvIpXD8pWiQ74tDk3Q5eXVDUvjwJFck/SfwnYxDGs053acdmlkhriyM
	6ODcwXdA==;
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olSwH-0050bt-NZ; Thu, 20 Oct 2022 10:38:17 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E11901FA90;
	Thu, 20 Oct 2022 10:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1666262282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkMHENyFsh6/3SjkSTuYRYMbHc7R5XzWBBCbrwJgYhc=;
	b=1iiK5H3VCq2QZPD9I6TaLe5/dMWlIhalrt5djJ2luVVaxnv1fAuIh/hwuw6a3/WNyh20Zx
	q30hl/TTc5vv9pZ08LkTAQW5UIo5mgzBkMj6j3gzxw0Alyq38w6Ako/4EdwH437ov9gCMb
	69LE0q28P52yd357VRsNAHoJ7rSH73s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1666262282;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkMHENyFsh6/3SjkSTuYRYMbHc7R5XzWBBCbrwJgYhc=;
	b=x46APQL1svgGc11HQOHFEs8osVroEdR2Ae3IDMhH3RiyBUJNS8G/LmoWWl6MsmYBLslbim
	A0NNGlzosuhEQTBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 720DE13AF5;
	Thu, 20 Oct 2022 10:38:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aMgYGwolUWPPYwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 20 Oct 2022 10:38:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	javierm@redhat.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	etnaviv@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 11/21] drm/fb-helper: Cleanup include statements in header file
Date: Thu, 20 Oct 2022 12:37:45 +0200
Message-Id: <20221020103755.24058-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221020103755.24058-1-tzimmermann@suse.de>
References: <20221020103755.24058-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_113814_146712_6B228F13 
X-CRM114-Status: UNSURE (   8.23  )
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

Only include what we have to.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/drm/drm_fb_helper.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index fddd0d1af6891..e923089522896 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -32,11 +32,9 @@
 
 struct drm_fb_helper;
 
-#include <drm/drm_client.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_device.h>
 #include <linux/fb.h>
-#include <linux/kgdb.h>
+
+#include <drm/drm_client.h>
 
 enum mode_set_atomic {
 	LEAVE_ATOMIC_MODE_SET,
-- 
2.38.0


