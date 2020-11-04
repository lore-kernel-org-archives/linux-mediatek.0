Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BFAC00A89
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 03:41:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C17A2072E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 03:41:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u3qBkONW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Pw0h+0Rz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="bvF6fIPU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C17A2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o/H0dri38QRbpyIn8Fn0zLZHPFU2rj23jzUttnOhFz0=; b=u3qBkONW9qfQ3Gettiy6XhEFVJ
	FuklGxLVTKCVWLwkRCG56I7NxioN8yZRto2iisIVQgGjTipH53Sjan/qw9M7mrVcTYkgbhC0t6vca
	MaGwbMKwRcW1S5T53+uxuG/GXb10tM9nhInLChQ5+D6DvLNfRpGOXR2rQX/zgrafgtEoENZ07/z1J
	oMPbaPUHQvbsokorNWJHc601PlPUeNyptxtJKKv4Vjo+Cwinw2cDlIiXsvDvRCLmsNqcaReczzJ5M
	zVl+mgZYbHwcZNP0DFxGRCp0bqefZoFGwtHiLdNP6Rzw15mnW0Qqy7YxZuqpfdC0BwH/6/Tc1pIvy
	ZSbjX4uQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaW8s-0002oc-6n; Thu, 05 Nov 2020 03:40:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW8e-0002bw-Fr
 for linux-mediatek@merlin.infradead.org; Thu, 05 Nov 2020 03:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
 Mime-Version:Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=1vvOIzzfmOs0O6boLgQK9QNpOZbt5lBlooJwBHQhT2U=; b=Pw0h+0Rz0bbeoBrJ3w/EiJ0I6j
 QhKgDJe6UY5fPDffr4429sXkPxIzYz7LlJmMVXvPLxtfNyH29pM/064gfMLHXNmJKgggrB1ejFVHQ
 63KOTgozoTiO7LNQJXmOqNFCYsxmWvzL2Ua/LCFaE8BtU3Elp31teMFQCIHQjT6ayr42kY+iEDrgS
 y+dFlfBVIMGOLHFymlx7iv2rowAbWAu0g2DcnPAQ9x9xVE18IQtfqLeJQuVjB2X6mEHKiqG7PzgAE
 UiezgMo+7ThsmN2A+S3vdnddqsu2smtzgPStKs3ZCXK0+COOyNyYEjc2tmnyZ4sBsctk71mKgCaJP
 GdqsSZTA==;
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaPoo-0007PR-Gr
 for linux-mediatek@lists.infradead.org; Wed, 04 Nov 2020 20:55:50 +0000
Received: by mail-qk1-x74a.google.com with SMTP id x85so14361996qka.14
 for <linux-mediatek@lists.infradead.org>; Wed, 04 Nov 2020 12:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=1vvOIzzfmOs0O6boLgQK9QNpOZbt5lBlooJwBHQhT2U=;
 b=bvF6fIPUbNIKp5s4CtTfORtAp5l1OKNI4nKmWbsX6aWHKS6Yax7ujaaXtsdlJpo3Jf
 aqfy7yTTW5RAseOqz2BQr09o51I3eJzNB3gjQR6DBkxo+6a6l+A8+cf+/iRn0dcg18uG
 SiBUUVb60h8yvRCGiHgt3wce3p4SCvvpRITyCWnlklQ+MUvhvwoPcxpVXYZk/YiO5oHE
 4gmMrMJ/OXDyjsc4av62Onm9qD0hB3GjRn6F3ret02NwDHUbUR/1q5aunjP0R3V4RCOE
 MdzOdVlekLshx3xAbFSRlYzdKhNd5SMVy60PERKPxPa5+kA+9VBh0gq2xxPDn5kjpGGV
 M7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=1vvOIzzfmOs0O6boLgQK9QNpOZbt5lBlooJwBHQhT2U=;
 b=aaIRJvnvQ7M/spDRUpuIYPtHbso/j8CTR5BaNk37N6mCDagmI6ZrdlltJQP/DeOzm0
 T0rtYDNOZEhpu0LwwTiriag4U1QQ1b5cUAlfN3IW0lI8+6k+YkbsQcrzV5GB87DGtAUl
 dNfMTC2xjHKftfTuExAbBK2tJKLhux+R4sjGtVfUCW4q3o5pWb7qkz9Ep5AHBZG6BQJ/
 aV0lXgfESVtjf/o2XWTFQSbEMS95wB3+HhxyftN8mYD80u7npNYzmjVLLBntg7WuHEOn
 fz0ZsRYYTkHhndiEM1RKwuU4KuislhYQChDy47XyVTM89ONMWJHNC2Rt+ktQ6ESjEQto
 gUkg==
X-Gm-Message-State: AOAM533E/if76NbXKIFSLP14wyNTlw5NZgVYHmhZtFDzmOUSbTRMPPz0
 Z3AhQNUQW0ZWn5KExoF1ZNLKxm56tZs8me4=
X-Google-Smtp-Source: ABdhPJymkmTSF+HbRfB0kB1CFQgNV32Z56346vaDarmeDSDCTjhVagDmiPFft1q3oP266O0KB74jlyQAQdzga40=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:7220:84ff:fe09:fedc])
 (user=saravanak job=sendgmr) by 2002:a0c:9c47:: with SMTP id
 w7mr34820545qve.59.1604523275590; Wed, 04 Nov 2020 12:54:35 -0800 (PST)
Date: Wed,  4 Nov 2020 12:54:30 -0800
Message-Id: <20201104205431.3795207-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH v1 1/2] driver core: Fix lockdep warning on wfs_lock
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_205546_887511_B809D5F0 
X-CRM114-Status: GOOD (  10.44  )
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
Cc: Saravana Kannan <saravanak@google.com>, Cheng-Jui.Wang@mediatek.com,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 linux-mediatek@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There's a potential deadlock with the following cycle:
wfs_lock --> device_links_lock --> kn->count

Fix this by simply dropping the lock around a list_empty() check that's
just exported to a sysfs file. The sysfs file output is an instantaneous
check anyway and the lock doesn't really add any protection.

Lockdep log:

[   48.808132]
[   48.808132] the existing dependency chain (in reverse order) is:
[   48.809069]
[   48.809069] -> #2 (kn->count){++++}:
[   48.809707]        __kernfs_remove.llvm.7860393000964815146+0x2d4/0x460
[   48.810537]        kernfs_remove_by_name_ns+0x54/0x9c
[   48.811171]        sysfs_remove_file_ns+0x18/0x24
[   48.811762]        device_del+0x2b8/0x5a8
[   48.812269]        __device_link_del+0x98/0xb8
[   48.812829]        device_links_driver_bound+0x210/0x2d8
[   48.813496]        driver_bound+0x44/0xf8
[   48.814000]        really_probe+0x340/0x6e0
[   48.814526]        driver_probe_device+0xb8/0x100
[   48.815117]        device_driver_attach+0x78/0xb8
[   48.815708]        __driver_attach+0xe0/0x194
[   48.816255]        bus_for_each_dev+0xa8/0x11c
[   48.816816]        driver_attach+0x24/0x30
[   48.817331]        bus_add_driver+0x100/0x1e0
[   48.817880]        driver_register+0x78/0x114
[   48.818427]        __platform_driver_register+0x44/0x50
[   48.819089]        0xffffffdbb3227038
[   48.819551]        do_one_initcall+0xd8/0x1e0
[   48.820099]        do_init_module+0xd8/0x298
[   48.820636]        load_module+0x3afc/0x44c8
[   48.821173]        __arm64_sys_finit_module+0xbc/0xf0
[   48.821807]        el0_svc_common+0xbc/0x1d0
[   48.822344]        el0_svc_handler+0x74/0x98
[   48.822882]        el0_svc+0x8/0xc
[   48.823310]
[   48.823310] -> #1 (device_links_lock){+.+.}:
[   48.824036]        __mutex_lock_common+0xe0/0xe44
[   48.824626]        mutex_lock_nested+0x28/0x34
[   48.825185]        device_link_add+0xd4/0x4ec
[   48.825734]        of_link_to_suppliers+0x158/0x204
[   48.826347]        of_fwnode_add_links+0x50/0x64
[   48.826928]        device_link_add_missing_supplier_links+0x90/0x11c
[   48.827725]        fw_devlink_resume+0x58/0x130
[   48.828296]        of_platform_default_populate_init+0xb4/0xd0
[   48.829030]        do_one_initcall+0xd8/0x1e0
[   48.829578]        do_initcall_level+0xb8/0xcc
[   48.830137]        do_basic_setup+0x60/0x7c
[   48.830662]        kernel_init_freeable+0x128/0x1ac
[   48.831275]        kernel_init+0x18/0x29c
[   48.831781]        ret_from_fork+0x10/0x18
[   48.832297]
[   48.832297] -> #0 (wfs_lock){+.+.}:
[   48.832922]        __lock_acquire+0xe04/0x2e20
[   48.833480]        lock_acquire+0xbc/0xec
[   48.833984]        __mutex_lock_common+0xe0/0xe44
[   48.834577]        mutex_lock_nested+0x28/0x34
[   48.835136]        waiting_for_supplier_show+0x3c/0x98
[   48.835781]        dev_attr_show+0x48/0xb4
[   48.836295]        sysfs_kf_seq_show+0xe8/0x184
[   48.836864]        kernfs_seq_show+0x48/0x8c
[   48.837401]        seq_read+0x1c8/0x600
[   48.837884]        kernfs_fop_read+0x68/0x204
[   48.838431]        __vfs_read+0x60/0x214
[   48.838925]        vfs_read+0xbc/0x15c
[   48.839397]        ksys_read+0x78/0xe4
[   48.839869]        __arm64_sys_read+0x1c/0x28
[   48.840416]        el0_svc_common+0xbc/0x1d0
[   48.840953]        el0_svc_handler+0x74/0x98
[   48.841490]        el0_svc+0x8/0xc
[   48.841917]
[   48.841917] other info that might help us debug this:
[   48.841917]
[   48.842920] Chain exists of:
[   48.842920]   wfs_lock --> device_links_lock --> kn->count
[   48.842920]
[   48.844152]  Possible unsafe locking scenario:
[   48.844152]
[   48.844895]        CPU0                    CPU1
[   48.845463]        ----                    ----
[   48.846032]   lock(kn->count);
[   48.846417]                                lock(device_links_lock);
[   48.847203]                                lock(kn->count);
[   48.847902]   lock(wfs_lock);
[   48.848276]
[   48.848276]  *** DEADLOCK ***

Reported-by: Cheng-Jui.Wang@mediatek.com
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 78114ddac755..df35b3206286 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1064,10 +1064,8 @@ static ssize_t waiting_for_supplier_show(struct device *dev,
 	bool val;
 
 	device_lock(dev);
-	mutex_lock(&wfs_lock);
 	val = !list_empty(&dev->links.needs_suppliers)
 	      && dev->links.need_for_probe;
-	mutex_unlock(&wfs_lock);
 	device_unlock(dev);
 	return sysfs_emit(buf, "%u\n", val);
 }
-- 
2.29.1.341.ge80a0c044ae-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
