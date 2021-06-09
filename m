Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51CAC48BCD
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 11:31:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 903B061364
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 11:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 903B061364
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5V8nQg6N9L3OlXzQlwcy8KKyIpsbsG4UnWA0UN71pjk=; b=i89MyOj1UmLeRt
	6Ck9zysiVUE34bCMjaGBn6fz7cqfhySvokexxuDFxEqfV6ajJN0Sowx7La1eDdH8t/aolFm3kjzio
	oOVtOq6CSAknaVM5oNS36k5R0ILpw49MIF9YFNtVxN22+JzQLy04hU/ZE8NdC6zcqWLjl9VRmfDGJ
	eyLE+ICOpBEAbXW+BMtI7fKdmC8REnXRj3N5/JmlfFkTV4gBVmum16haM4yJEI4emgY24HbqvxK2u
	eLbCkYB1D8PJzbZt1DeEEat351YtG1pfQ5eLxkbSmjFo+ztZrtMkJZHdDYJPqhD6oyQXkzqtT4dUp
	xNc8kY7oJ6efhzDiLmPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqwQj-00DL4Y-WC; Wed, 09 Jun 2021 11:31:30 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqwFx-00DHIx-KF; Wed, 09 Jun 2021 11:20:24 +0000
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 19DE7219E6;
 Wed,  9 Jun 2021 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623237620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hk665B6tEfCs3+xiggyrmaaBVgfZTuKVzd+3pkK7Ryg=;
 b=0riftsnENuEtlKaO45VfMLILTW7CVsIiXdx49o3MHlH7Q+EKEz+QeJkuwWMGzAEhU6UHHH
 3ts3WOmOU4iussIVGweeahprcgL7L9c+tNdjKY5Dk6n3NaNwC28S1xW4RjYy+UmH7VLOjH
 k2GIcXr/JV10H9i/R8LvGdlonJJ8RMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623237620;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hk665B6tEfCs3+xiggyrmaaBVgfZTuKVzd+3pkK7Ryg=;
 b=Wcvg3bkzQ+lyHvS1B+AJdv/5DCMi0f2Em4b89mhyz0mHV8DFPdA7XrbwOT44PzMYlcG3sD
 mYqnz4K5nYFXyzDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 74EFE11A98;
 Wed,  9 Jun 2021 11:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623237620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hk665B6tEfCs3+xiggyrmaaBVgfZTuKVzd+3pkK7Ryg=;
 b=0riftsnENuEtlKaO45VfMLILTW7CVsIiXdx49o3MHlH7Q+EKEz+QeJkuwWMGzAEhU6UHHH
 3ts3WOmOU4iussIVGweeahprcgL7L9c+tNdjKY5Dk6n3NaNwC28S1xW4RjYy+UmH7VLOjH
 k2GIcXr/JV10H9i/R8LvGdlonJJ8RMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623237620;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hk665B6tEfCs3+xiggyrmaaBVgfZTuKVzd+3pkK7Ryg=;
 b=Wcvg3bkzQ+lyHvS1B+AJdv/5DCMi0f2Em4b89mhyz0mHV8DFPdA7XrbwOT44PzMYlcG3sD
 mYqnz4K5nYFXyzDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id SIS9G/OjwGBTUgAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Jun 2021 11:20:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@canonical.com, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, robdclark@gmail.com,
 sean@poorly.run, airlied@redhat.com, kraxel@redhat.com, hjc@rock-chips.com,
 heiko@sntech.de, oleksandr_andrushchenko@epam.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 9/9] drm: Update documentation and TODO of gem_prime_mmap hook
Date: Wed,  9 Jun 2021 13:20:12 +0200
Message-Id: <20210609112012.10019-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609112012.10019-1-tzimmermann@suse.de>
References: <20210609112012.10019-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_042021_872530_03F09A69 
X-CRM114-Status: GOOD (  11.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The hook gem_prime_mmap in struct drm_driver is deprecated. Document
the new requirements.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/todo.rst | 11 -----------
 include/drm/drm_drv.h      | 11 +++++++----
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 12e61869939e..50ad731d579b 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -268,17 +268,6 @@ Contact: Daniel Vetter
 
 Level: Intermediate
 
-Clean up mmap forwarding
-------------------------
-
-A lot of drivers forward gem mmap calls to dma-buf mmap for imported buffers.
-And also a lot of them forward dma-buf mmap to the gem mmap implementations.
-There's drm_gem_prime_mmap() for this now, but still needs to be rolled out.
-
-Contact: Daniel Vetter
-
-Level: Intermediate
-
 Generic fbdev defio support
 ---------------------------
 
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index b439ae1921b8..40d93a52cf7a 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -385,11 +385,14 @@ struct drm_driver {
 	 * mmap hook for GEM drivers, used to implement dma-buf mmap in the
 	 * PRIME helpers.
 	 *
-	 * FIXME: There's way too much duplication going on here, and also moved
-	 * to &drm_gem_object_funcs.
+	 * This hook only exists for historical reasons. Drivers must use
+	 * drm_gem_prime_mmap() to implement it.
+	 *
+	 * FIXME: Convert all drivers to implement mmap in struct
+	 * &drm_gem_object_funcs and inline drm_gem_prime_mmap() into
+	 * its callers. This hook should be removed afterwards.
 	 */
-	int (*gem_prime_mmap)(struct drm_gem_object *obj,
-				struct vm_area_struct *vma);
+	int (*gem_prime_mmap)(struct drm_gem_object *obj, struct vm_area_struct *vma);
 
 	/**
 	 * @dumb_create:
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
