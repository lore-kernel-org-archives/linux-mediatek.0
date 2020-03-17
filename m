Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D67C10F29
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 06:56:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D65DC205ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 06:56:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lzZPAL72";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="tdBd3JXM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D65DC205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B24PN8xuCv2khLnfVtPjI8pgM2nkCnGuW/2uqYvVF60=; b=lzZPAL72+P4Ewl
	sx3lrQpG0FPcXeVqThn8N85aJI/7JnBGgmLkx5J7oHog9JOYbTvlDiGsqEsyLxW/cBHc3iAAWm5E3
	+1igBpcVo3XfXF97UkEVwNlfLlgfbxuv4eNUDTT9sFwMf+qM1ksB56CVLQUT4y2aqPkWF3cTdmDmZ
	o3sCiZAbu9IdD/LWfEJdXROgWaLbGe4xSjncnx4UZXgzwsuDEUwiv+g/7TR4RqmwoItfbQqyEglsi
	ref3GW7WPz/yw2CAfBAF207kGbeR9gwGP0xqFQZsOueMNVmzJy/QTHCkA0Bp6oTSfnxVC1wZKleOo
	UYA8yDP82dClvslUtQ1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jE69C-0005ds-4N; Tue, 17 Mar 2020 06:56:18 +0000
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jE682-0003XY-C8
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 06:55:11 +0000
Received: by mail-qv1-xf4a.google.com with SMTP id ev8so11497172qvb.1
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Mar 2020 23:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Vz8Rl+tO3s2Fvzy9mMmth3PcVEenCGW3CyqKGLCsJ9M=;
 b=tdBd3JXMEOE0YT+L7rwOPZHaK8kRVwY4smj7X3+QwEyDXEwn7tlhTF4Ytp0NC86X6q
 fT+BVMQpi67m9Q7lWDaj5yz1NykcSCPNpGQVIgCGqBeH1Z3YwPU9zQxS2D9ZnXph+o+9
 hQBq1hYrgu7RWtKAszJvhlM964Knk9Pwoh/q+j+w4Kvxg0e3dKq1Mkb9+356AB/d/H7h
 iAD7OzZ0QrCyxEdaBvXRTCqKVt8QlI4DQXlT6N+Mz+wM845Q62Q3guDM61RAa9rg7bzG
 /LgCZAZbkmbfP7IiHAyTZtQ6S9+jLL1Ghvq0dxxWFL35GKxD7ldotwJLihuEfRF9jzU2
 dnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Vz8Rl+tO3s2Fvzy9mMmth3PcVEenCGW3CyqKGLCsJ9M=;
 b=ZG+LK1KqNxreBbsVEwpp97Bf4+Fs8/axYHOkeB2J+zaQ3AqX8SKn9l/J4yF/7fR8Rc
 cduu7bXXIN/Oun+snysNlaxfnY3mBDzRVuYOi+Yn0DB6eV7gAFbAHoeLrtEcciYxzlne
 mSyeQUoMdYqKefBkAByJnfDEkRnEthqt51xplBk4YLhk28Bjg9VjW+KDesj+AxxDEVbd
 g08jChXoqw1nzqkGbS7jtj60CLKp3ZpH7Oif6KFqNuG5/dbiqS2/vB2k1lPTcvEHTATl
 0snlu/+vf/gfxf0aWvGhP/qzNrSSvfZPNRUrZpq8ByuAr6fL9btvhMWJw8QV9OfVDJfH
 QM7A==
X-Gm-Message-State: ANhLgQ1LotQqdYBi/WNAOnh8kDk14lD6vBXl0vMqousiRccceyCafCNE
 MWFsS2VtW1B6VuySqxaRd5fyHcSDRFtfBgc=
X-Google-Smtp-Source: ADFU+vslXcTXZHxFbul+vKyVDDYbE109vB2qzmfCtTVliZ++Zd5h8tOc4jJH81ED+tXuc5j8cMzPwT/wJ2uvyfk=
X-Received: by 2002:ac8:5193:: with SMTP id c19mr3907270qtn.204.1584428101406; 
 Mon, 16 Mar 2020 23:55:01 -0700 (PDT)
Date: Mon, 16 Mar 2020 23:54:47 -0700
In-Reply-To: <20200317065452.236670-1-saravanak@google.com>
Message-Id: <20200317065452.236670-2-saravanak@google.com>
Mime-Version: 1.0
References: <20200317065452.236670-1-saravanak@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v1 1/6] driver core: Remove the link if there is no driver
 with AUTO flag
From: Saravana Kannan <saravanak@google.com>
To: stable@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_235506_466884_12467254 
X-CRM114-Status: GOOD (  10.36  )
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
Cc: Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yong Wu <yong.wu@mediatek.com>

DL_FLAG_AUTOREMOVE_CONSUMER/SUPPLIER means "Remove the link
automatically on consumer/supplier driver unbind", that means we should
remove whole the device_link when there is no this driver no matter what
the ref_count of the link is.

CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
(cherry picked from commit 0fe6f7874d467456da6f6a221dd92499a3ab1780)
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 742bc60e9cca..b354fdd7ce75 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -546,7 +546,7 @@ static void __device_links_no_driver(struct device *dev)
 			continue;
 
 		if (link->flags & DL_FLAG_AUTOREMOVE_CONSUMER)
-			kref_put(&link->kref, __device_link_del);
+			__device_link_del(&link->kref);
 		else if (link->status != DL_STATE_SUPPLIER_UNBIND)
 			WRITE_ONCE(link->status, DL_STATE_AVAILABLE);
 	}
@@ -591,7 +591,7 @@ void device_links_driver_cleanup(struct device *dev)
 		 */
 		if (link->status == DL_STATE_SUPPLIER_UNBIND &&
 		    link->flags & DL_FLAG_AUTOREMOVE_SUPPLIER)
-			kref_put(&link->kref, __device_link_del);
+			__device_link_del(&link->kref);
 
 		WRITE_ONCE(link->status, DL_STATE_DORMANT);
 	}
-- 
2.25.1.481.gfbce0eb801-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
