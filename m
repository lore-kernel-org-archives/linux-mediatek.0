Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DC6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 11:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17yOt6kR7rf051GOS3/2BFk5eNQpH/k0EApRyvjs4yk=; b=PV3XltaDDC5pMp
	7MRHl00H46aRFsiRBAMwlBPzrxxzL6VH3cbktHbtSK7ZDwpl4tgQ+rF8vd0ZbnnFnbTbvzQ7vjCe5
	u4IxBkCjnPWWdROCD8Qy9segC0iPad7QyVGlkUlb1qwe+8A2JsMz+QjWhj9yn4up5Tq5zjPr0BlcE
	zbDMLNq54t2l4ckRX/9tqpx1vGN/Dqa+DYi7tZVffd2poDfLmD3kQISc/23fMr0ZMPXaVt1vq8SC4
	9g4G3iOjH5Le5oSp8i0g00t6Nm4p+MFwNN24Nu7edonCacfmjKrNgKUI3umTcFV3HKj1vk6Phqffn
	sT1KSG1aUVBqhF3hXYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOeE7-00Bsnt-7O; Mon, 28 Feb 2022 11:30:03 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOdtn-00BigC-CW; Mon, 28 Feb 2022 11:09:07 +0000
Received: by mail-ej1-x630.google.com with SMTP id p14so23947737ejf.11;
 Mon, 28 Feb 2022 03:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ewSqtxWpAEouzx42J3KLaoNJ3zRCYps/nc7KO/73VjI=;
 b=NJzfXKcN7hL1Nl33p4E04eSCSKXsmXm0guAXz3+luhQpanQnRU99MCp2hnFUKYaL+B
 1x361O+pkC4o39HmFVweecOA5EyrbgRoo6hBpKoe+ZK3uwuMgKcjXUUzcyKnqq4Ihz7Y
 0pE7mGFU6qwm5nlEaQI6CtIcQNt/P0yiVszOfwFWGIKlTpST4oUB8Axjb2KGdfFCf6oM
 BF7gos7RIFK+C7zFe1BBqWlnyj9ABXdIe2RTMFKfzCdWuqPXqav1BQyfcB8KfJDsFPFC
 rwx0y6HLf2zquaEOFfVg855ZoIJbHt3hF+DdFMjnEF9CZ4aqYu3RYVbCj5tslcC60Xqy
 JDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ewSqtxWpAEouzx42J3KLaoNJ3zRCYps/nc7KO/73VjI=;
 b=QQhn0KvLGe93RRorV+Z0zE0yWLbQePpNbM1KHrJIHQmNDh3TgNfNWfJElpdsNwoI4F
 /PZ3kVfsS3Sy1BjHAcPwf26mCixw9KTNZ7aK45HQ1RCXryxq18jPvTnkk+2H0IqiWMn+
 APmTN1/Y1R76NmWApo5+LpzvL3L2eIySA4qP8rXY6N/3MZOmvGq6NZZDNEE1LUGv1XV5
 ULJSXBVGlgS3ByYaQ7Sk/VLSgFf++4S3pkJp41SCqsua7anAajJa6FRdf/M5gaBz9e0Q
 aXGEBord1Z1l28GDAgacpNVrc7kkNVma1ZZHi3wWOXWGL8GnYqFaO1Qr8rU2x5C5QpUV
 cjbQ==
X-Gm-Message-State: AOAM531/OA12ZJGW9ZsQY1gva7+NqN1tfzyyij3SNTzzgUWK4qqQNxT2
 8Ln50KoGcz6biIUdNw9l+cA=
X-Google-Smtp-Source: ABdhPJzNtnbGg8Nz3uHKd7Xw6L7mCtzAWYaq4yun9pZXXpwsqc9NwfSvsBrijeUqxIoEXwfdb0F3Mg==
X-Received: by 2002:a17:906:26da:b0:6d6:da2e:d338 with SMTP id
 u26-20020a17090626da00b006d6da2ed338mr451651ejc.700.1646046541112; 
 Mon, 28 Feb 2022 03:09:01 -0800 (PST)
Received: from localhost.localdomain (dhcp-077-250-038-153.chello.nl.
 [77.250.38.153]) by smtp.googlemail.com with ESMTPSA id
 z22-20020a17090655d600b006d229436793sm4209049ejp.223.2022.02.28.03.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 03:09:00 -0800 (PST)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jakob Koschel <jakobkoschel@gmail.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Arnd Bergman <arnd@arndb.de>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kees Cook <keescook@chromium.org>, Mike Rapoport <rppt@kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 "Brian Johannesmeyer" <bjohannesmeyer@gmail.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Dan Carpenter <dan.carpenter@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Nathan Chancellor <nathan@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sgx@vger.kernel.org,
 drbd-dev@lists.linbit.com, linux-block@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 bcm-kernel-feedback-list@broadcom.com, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kvm@vger.kernel.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, v9fs-developer@lists.sourceforge.net,
 tipc-discussion@lists.sourceforge.net, alsa-devel@alsa-project.org
Subject: [PATCH 5/6] treewide: remove dereference of list iterator after loop
 body
Date: Mon, 28 Feb 2022 12:08:21 +0100
Message-Id: <20220228110822.491923-6-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228110822.491923-1-jakobkoschel@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_030903_556257_45A5FE3C 
X-CRM114-Status: GOOD (  19.28  )
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

The list iterator variable will be a bogus pointer if no break was hit.
Dereferencing it could load *any* out-of-bounds/undefined value
making it unsafe to use that in the comparision to determine if the
specific element was found.

This is fixed by using a separate list iterator variable for the loop
and only setting the original variable if a suitable element was found.
Then determing if the element was found is simply checking if the
variable is set.

Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 11 +++++++----
 drivers/scsi/wd719x.c                          | 12 ++++++++----
 fs/f2fs/segment.c                              |  9 ++++++---
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
index 57199be082fd..c56cd9e59a66 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -471,20 +471,23 @@ nvkm_pstate_new(struct nvkm_clk *clk, int idx)
 static int
 nvkm_clk_ustate_update(struct nvkm_clk *clk, int req)
 {
-	struct nvkm_pstate *pstate;
+	struct nvkm_pstate *pstate = NULL;
+	struct nvkm_pstate *tmp;
 	int i = 0;

 	if (!clk->allow_reclock)
 		return -ENOSYS;

 	if (req != -1 && req != -2) {
-		list_for_each_entry(pstate, &clk->states, head) {
-			if (pstate->pstate == req)
+		list_for_each_entry(tmp, &clk->states, head) {
+			if (tmp->pstate == req) {
+				pstate = tmp;
 				break;
+			}
 			i++;
 		}

-		if (pstate->pstate != req)
+		if (!pstate)
 			return -EINVAL;
 		req = i;
 	}
diff --git a/drivers/scsi/wd719x.c b/drivers/scsi/wd719x.c
index 1a7947554581..be270ed8e00d 100644
--- a/drivers/scsi/wd719x.c
+++ b/drivers/scsi/wd719x.c
@@ -684,11 +684,15 @@ static irqreturn_t wd719x_interrupt(int irq, void *dev_id)
 	case WD719X_INT_SPIDERFAILED:
 		/* was the cmd completed a direct or SCB command? */
 		if (regs.bytes.OPC == WD719X_CMD_PROCESS_SCB) {
-			struct wd719x_scb *scb;
-			list_for_each_entry(scb, &wd->active_scbs, list)
-				if (SCB_out == scb->phys)
+			struct wd719x_scb *scb = NULL;
+			struct wd719x_scb *tmp;
+
+			list_for_each_entry(tmp, &wd->active_scbs, list)
+				if (SCB_out == tmp->phys) {
+					scb = tmp;
 					break;
-			if (SCB_out == scb->phys)
+				}
+			if (scb)
 				wd719x_interrupt_SCB(wd, regs, scb);
 			else
 				dev_err(&wd->pdev->dev, "card returned invalid SCB pointer\n");
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1dabc8244083..a3684385e04a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -356,16 +356,19 @@ void f2fs_drop_inmem_page(struct inode *inode, struct page *page)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct list_head *head = &fi->inmem_pages;
 	struct inmem_pages *cur = NULL;
+	struct inmem_pages *tmp;

 	f2fs_bug_on(sbi, !page_private_atomic(page));

 	mutex_lock(&fi->inmem_lock);
-	list_for_each_entry(cur, head, list) {
-		if (cur->page == page)
+	list_for_each_entry(tmp, head, list) {
+		if (tmp->page == page) {
+			cur = tmp;
 			break;
+		}
 	}

-	f2fs_bug_on(sbi, list_empty(head) || cur->page != page);
+	f2fs_bug_on(sbi, !cur);
 	list_del(&cur->list);
 	mutex_unlock(&fi->inmem_lock);

--
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
