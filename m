Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3056DC10F29
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 06:56:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBE01205ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 06:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HijsAi0v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Nab2iMTk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBE01205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Okna1JNyCkq05T6STMNxcoYwXRiDBi+BdIURAwPz+uU=; b=HijsAi0v4ICuMu
	gDzjhr9pELMdExHD8dgk9URO6nJ2kx0xXMuUKeZQkBSjieQVTRmkofmuCTT3ZtvMMxtQM0ZX5M2SY
	pU536GtzXDOmN8J3T8RPk5XLGm7wrYL6i5rObywXWFndWBjheqXjAUg1VdRLgts2Lu/LPMD8Er2av
	6WkWiurNUrF7EMlQFNs/HDsxTOZFnLjoMn8Jc5dpLeb8sCasPRqSKjBOba25HSDA6oPzxfZHIbV1E
	G7gXtAYw1EqUQvG1seBOOqOqJIA3AB7qW7FEcaZDLA1wtZ7Ikm4Er9aUcIYBxycVdU2ywN7uPHLAb
	mNGeKq08ggQj+eeDwQWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jE69D-0005fp-GY; Tue, 17 Mar 2020 06:56:19 +0000
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jE688-0004VQ-V1
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 06:55:15 +0000
Received: by mail-qv1-xf49.google.com with SMTP id j5so4345193qvo.18
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Mar 2020 23:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=7ngORi0qjHGKSTPYP6jqwB2CTxTKHni0v/JyFS4TsJY=;
 b=Nab2iMTktoEDgr02ucqDK9isAmOo4ipKNIJmcdWX9C+9c6ibZ0ACWVVDLKrmvFK2Nv
 +n/CdhwFe7D0fcDDF+KueDiskyTSirfZzgH7ApN17BUlo33WGiDWYQxSdr+88om+U7ug
 yLoYp18sCc0bH6o010hAp7CyOux2D4YkIDi5T36j6CpG9ul39ZcoEkPKPhqNjdZI5Hbq
 126yvaty609YLDursNVsFv1zTmvhwtCRCM5ONcqGkUz4vJt9r3XlTRWSa/0fb+rJO1Jk
 ZCqKS5PHRoyv6IVk7cQ1Tmnu4uXf0ZkfZkTpEZsAsodLYoQolYkSZVpKlgOncY4D208G
 e0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=7ngORi0qjHGKSTPYP6jqwB2CTxTKHni0v/JyFS4TsJY=;
 b=tOpqZRXSUXossSsjzbWbDPp9CPHS8NQsw7DkT2T925eChzgb72xYzE2wrG9MNowILf
 2QHV/d8qbYzqTeTb8cLK5B+g8n8P0z2MUWUw/e7Lu54sdCYgiLEx/Ka4FdU7AZwlmVhh
 BLiKQyHIv8d2avPj87nQDFnMw41A/TTMPwtH2ROjADEzvTxBI/DXXsfD1zUFUxcSsPl9
 BjlvmZrPjaU/MDGNVXErgPs+SrFJRDxA4Inlp5/9JAVeUVy3sK/6+39OwqaTNIyxpRL0
 T/QDpq3mzSE5bU2bVNKpU752H/y1gN2xmvAx+vQK7DtEpL9hQknizIg3a8VPpqQviucc
 oqoQ==
X-Gm-Message-State: ANhLgQ0ZoXru/Rmrz2ZSIa6ZrOY9vkXcxZRXVcqkjWK6xWccTEpaDu9E
 kCYrShDsqeP8h21ftvAN5bhJ9iQxovIzfvU=
X-Google-Smtp-Source: ADFU+vu6Q/y175df99s4giYR9vMy2KQkhva5yiVcjNt6xji0hnXCikbzl84Cs4t7LJdeoDn8q4XTKNSqQvCeU0w=
X-Received: by 2002:ac8:3003:: with SMTP id f3mr3817009qte.293.1584428111301; 
 Mon, 16 Mar 2020 23:55:11 -0700 (PDT)
Date: Mon, 16 Mar 2020 23:54:50 -0700
In-Reply-To: <20200317065452.236670-1-saravanak@google.com>
Message-Id: <20200317065452.236670-5-saravanak@google.com>
Mime-Version: 1.0
References: <20200317065452.236670-1-saravanak@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v1 4/6] driver core: Add device link flag
 DL_FLAG_AUTOPROBE_CONSUMER
From: Saravana Kannan <saravanak@google.com>
To: stable@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_235513_335819_21B91FA2 
X-CRM114-Status: GOOD (  15.60  )
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
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

Add a new device link flag, DL_FLAG_AUTOPROBE_CONSUMER, to request the
driver core to probe for a consumer driver automatically after binding
a driver to the supplier device on a persistent managed device link.

As unbinding the supplier driver on a managed device link causes the
consumer driver to be detached from its device automatically, this
flag provides a complementary mechanism which is needed to address
some "composite device" use cases.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
(cherry picked from commit e7dd40105aac9ba051e44ad711123bc53a5e4c71)
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 Documentation/driver-api/device_link.rst |  9 +++++++++
 drivers/base/core.c                      | 16 +++++++++++++++-
 drivers/base/dd.c                        |  2 +-
 include/linux/device.h                   |  3 +++
 4 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/device_link.rst b/Documentation/driver-api/device_link.rst
index e249e074a8d2..c764755121c7 100644
--- a/Documentation/driver-api/device_link.rst
+++ b/Documentation/driver-api/device_link.rst
@@ -94,6 +94,15 @@ Similarly, when the device link is added from supplier's ``->probe`` callback,
 ``DL_FLAG_AUTOREMOVE_SUPPLIER`` causes the device link to be automatically
 purged when the supplier fails to probe or later unbinds.
 
+If neither ``DL_FLAG_AUTOREMOVE_CONSUMER`` nor ``DL_FLAG_AUTOREMOVE_SUPPLIER``
+is set, ``DL_FLAG_AUTOPROBE_CONSUMER`` can be used to request the driver core
+to probe for a driver for the consumer driver on the link automatically after
+a driver has been bound to the supplier device.
+
+Note, however, that any combinations of ``DL_FLAG_AUTOREMOVE_CONSUMER``,
+``DL_FLAG_AUTOREMOVE_SUPPLIER`` or ``DL_FLAG_AUTOPROBE_CONSUMER`` with
+``DL_FLAG_STATELESS`` are invalid and cannot be used.
+
 Limitations
 ===========
 
diff --git a/drivers/base/core.c b/drivers/base/core.c
index d8273792950b..3495da13b18a 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -195,6 +195,12 @@ void device_pm_move_to_tail(struct device *dev)
  * the link will be maintained until one of the devices pointed to by it (either
  * the consumer or the supplier) is unregistered.
  *
+ * Also, if DL_FLAG_STATELESS, DL_FLAG_AUTOREMOVE_CONSUMER and
+ * DL_FLAG_AUTOREMOVE_SUPPLIER are not set in @flags (that is, a persistent
+ * managed device link is being added), the DL_FLAG_AUTOPROBE_CONSUMER flag can
+ * be used to request the driver core to automaticall probe for a consmer
+ * driver after successfully binding a driver to the supplier device.
+ *
  * The combination of DL_FLAG_STATELESS and either DL_FLAG_AUTOREMOVE_CONSUMER
  * or DL_FLAG_AUTOREMOVE_SUPPLIER set in @flags at the same time is invalid and
  * will cause NULL to be returned upfront.
@@ -215,7 +221,12 @@ struct device_link *device_link_add(struct device *consumer,
 
 	if (!consumer || !supplier ||
 	    (flags & DL_FLAG_STATELESS &&
-	     flags & (DL_FLAG_AUTOREMOVE_CONSUMER | DL_FLAG_AUTOREMOVE_SUPPLIER)))
+	     flags & (DL_FLAG_AUTOREMOVE_CONSUMER |
+		      DL_FLAG_AUTOREMOVE_SUPPLIER |
+		      DL_FLAG_AUTOPROBE_CONSUMER)) ||
+	    (flags & DL_FLAG_AUTOPROBE_CONSUMER &&
+	     flags & (DL_FLAG_AUTOREMOVE_CONSUMER |
+		      DL_FLAG_AUTOREMOVE_SUPPLIER)))
 		return NULL;
 
 	if (flags & DL_FLAG_PM_RUNTIME && flags & DL_FLAG_RPM_ACTIVE) {
@@ -576,6 +587,9 @@ void device_links_driver_bound(struct device *dev)
 
 		WARN_ON(link->status != DL_STATE_DORMANT);
 		WRITE_ONCE(link->status, DL_STATE_AVAILABLE);
+
+		if (link->flags & DL_FLAG_AUTOPROBE_CONSUMER)
+			driver_deferred_probe_add(link->consumer);
 	}
 
 	list_for_each_entry(link, &dev->links.suppliers, c_node) {
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 5f6416e6ba96..caaeb7910a04 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -116,7 +116,7 @@ static void deferred_probe_work_func(struct work_struct *work)
 }
 static DECLARE_WORK(deferred_probe_work, deferred_probe_work_func);
 
-static void driver_deferred_probe_add(struct device *dev)
+void driver_deferred_probe_add(struct device *dev)
 {
 	mutex_lock(&deferred_probe_mutex);
 	if (list_empty(&dev->p->deferred_probe)) {
diff --git a/include/linux/device.h b/include/linux/device.h
index c74ce473589a..7569cff2f4dc 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -339,6 +339,7 @@ struct device *driver_find_device(struct device_driver *drv,
 				  struct device *start, void *data,
 				  int (*match)(struct device *dev, void *data));
 
+void driver_deferred_probe_add(struct device *dev);
 int driver_deferred_probe_check_state(struct device *dev);
 
 /**
@@ -824,12 +825,14 @@ enum device_link_state {
  * PM_RUNTIME: If set, the runtime PM framework will use this link.
  * RPM_ACTIVE: Run pm_runtime_get_sync() on the supplier during link creation.
  * AUTOREMOVE_SUPPLIER: Remove the link automatically on supplier driver unbind.
+ * AUTOPROBE_CONSUMER: Probe consumer driver automatically after supplier binds.
  */
 #define DL_FLAG_STATELESS		BIT(0)
 #define DL_FLAG_AUTOREMOVE_CONSUMER	BIT(1)
 #define DL_FLAG_PM_RUNTIME		BIT(2)
 #define DL_FLAG_RPM_ACTIVE		BIT(3)
 #define DL_FLAG_AUTOREMOVE_SUPPLIER	BIT(4)
+#define DL_FLAG_AUTOPROBE_CONSUMER	BIT(5)
 
 /**
  * struct device_link - Device link representation.
-- 
2.25.1.481.gfbce0eb801-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
