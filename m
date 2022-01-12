Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46735C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 00:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HANda1U2nHV+F/rYOTnmeLPlZ05iuFooI4fL7LS2+ec=; b=bYclkgHEb5dauP
	qE8sBazgYqNn8oL3cfn1bMcLeEJBhb/RW02hEDp9nwvaHp0fy+HdwGK+ikKZO0N0eXJM8FqXtmCIS
	JBVQ7LVb1Qmi7m7cGqmAk9BOhhpvgsfx4citiB1er7qEyCm/9V205TOPeE/qsSC77buKdMc9maAoM
	CSo+rTSjw64v/7tYwJf8BHUbafkJSHRRA322BjBd8gMAgyl/G5s+i8CaJKghUrkWRXqVTq/65yjzL
	yuSO4mwMTFUL7iBCZSTMMfBL25hYzLugu76wllWOCbLMJyHeV9HVGGCZFp0WmZ0OOhhojrUWFTc6L
	BBMaUOiQsCaHuMovqjhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7RUD-000WzR-98; Wed, 12 Jan 2022 00:27:33 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7RUA-000Wya-BT
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 00:27:31 +0000
Received: by mail-ot1-x32d.google.com with SMTP id
 s21-20020a05683004d500b0058f585672efso751121otd.3
 for <linux-mediatek@lists.infradead.org>; Tue, 11 Jan 2022 16:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=WqByNvxB5TcaW37Y3dlNFQ4WDapy73RgUbY3JV8R/nQ=;
 b=Pcoj/iXfbGJfWcIvlDjYxDGNtQ6l6QyPoulOtlEiTUr5+rwykzE32gle+eyWjLEf6V
 aDFqeAnq8m+llM+znbg/GvewwRMzWDJ9fZn1pun7dzKyqxWdaTlIDaXWKJWNQKSElAsL
 Rp0PxAx2y4y6/mfKf/CHzr6gVSbkSXFUA6qxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=WqByNvxB5TcaW37Y3dlNFQ4WDapy73RgUbY3JV8R/nQ=;
 b=mmk+aO7esJ00fTzcBJkQ86+rxX27GTEVzW3ecpAdFqyk4YNb04x6FlYg1F8xGEiISO
 yxhWyG6oszhxbxBLSYQjam7EhrzGKiQEbA8PmlDkwsvzkZLVLWZk+gqJHMRtqO9FImIa
 T07/8N/CGmF2KTd+6dCo+33m/sWd/i2gBDjElhrgFgVs+N+LRHfN0nQkuYBEqLlXJ6gt
 p3qGEzyrsQHfA9do90rBtm9Mi/Hssng4lH0C7e6aTGl0vTs1LKuXbl+vGxuW8gh2uGNU
 uPjC+ufz5ebXXfvEQhlcgy2K5a0kCPKvM+0CYNG4ITrEX3vK4zanKDQrSqTdp51opc4H
 QYVA==
X-Gm-Message-State: AOAM530rUCVIpM6vkVD3r9BOhdM7SktKAI/xFFMYRqeKFeJ12WYdusim
 8Iiz/G3zwbVSYyFlhpO/2I7LWsVt0BPLGbQU1vHL8Q==
X-Google-Smtp-Source: ABdhPJxMczP+5jJCLefJZ3uSBIgyN09xnry//vRiu7iBKwt4wRbi9Gfl3WZkmpKPRfcVfBsVXDB2sCr3tXuwJ4WGhuA=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr5053528ota.126.1641947248080; 
 Tue, 11 Jan 2022 16:27:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Jan 2022 16:27:27 -0800
MIME-Version: 1.0
In-Reply-To: <1a3b368eb891ca55c33265397cffab0b9f128737.camel@mediatek.com>
References: <20220106214556.2461363-1-swboyd@chromium.org>
 <20220106214556.2461363-26-swboyd@chromium.org>
 <1a3b368eb891ca55c33265397cffab0b9f128737.camel@mediatek.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 11 Jan 2022 16:27:27 -0800
Message-ID: <CAE-0n53Y3WRy4_QvUm9k9wjjWV7adMDQcK_+1ji4+W25SSeGwg@mail.gmail.com>
Subject: Re: [PATCH v5 25/32] iommu/mtk: Migrate to aggregate driver
To: Yong Wu <yong.wu@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Russell King <rmk+kernel@arm.linux.org.uk>, 
 Saravana Kannan <saravanak@google.com>, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_162730_453756_46B7D916 
X-CRM114-Status: GOOD (  27.63  )
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

Quoting Yong Wu (2022-01-11 04:22:23)
> Hi Stephen,
>
> Thanks for helping update here.
>
> On Thu, 2022-01-06 at 13:45 -0800, Stephen Boyd wrote:
> > Use an aggregate driver instead of component ops so that we can get
> > proper driver probe ordering of the aggregate device with respect to
> > all
> > the component devices that make up the aggregate device.
> >
> > Cc: Yong Wu <yong.wu@mediatek.com>
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> > Cc: Saravana Kannan <saravanak@google.com>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>
> When I test this on mt8195 which have two IOMMU HWs(calling
> component_aggregate_regsiter twice), it will abort like this. Then what
> should we do if we have two instances?
>

Thanks for testing it out. We can't register the struct driver more than
once but this driver is calling the component_aggregate_register()
function from the driver probe and there are two devices bound to the
mtk-iommu driver so we try to register it more than once. Sigh!

I see a couple options. One is to do a deep copy of the driver structure
and change the driver name. Then it's a one to one relationship between
device and driver. That's not very great because it leaves around junk
so it should probably be avoided.

Another option is to reference count the driver registration calls when
component_aggregate_register() is called multiple times. Then we would
only register the driver once and keep it pinned until the last
unregister call is made, but still remove devices that are created for
the match table.

Can you try the attached patch? It is based on the next version of this
patch series so the include part of the patch may not apply cleanly.

---8<---
diff --git a/drivers/base/component.c b/drivers/base/component.c
index 64ad7478c67a..97f253a41bdf 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -492,15 +492,30 @@ static struct aggregate_device
*__aggregate_find(struct device *parent)
 	return dev ? to_aggregate_device(dev) : NULL;
 }

+static DEFINE_MUTEX(aggregate_mutex);
+
 static int aggregate_driver_register(struct aggregate_driver *adrv)
 {
-	adrv->driver.bus = &aggregate_bus_type;
-	return driver_register(&adrv->driver);
+	int ret = 0;
+
+	mutex_lock(&aggregate_mutex);
+	if (!refcount_inc_not_zero(&adrv->count)) {
+		adrv->driver.bus = &aggregate_bus_type;
+		ret = driver_register(&adrv->driver);
+		if (!ret)
+			refcount_inc(&adrv->count);
+	}
+	mutex_unlock(&aggregate_mutex);
+
+	return ret;
 }

 static void aggregate_driver_unregister(struct aggregate_driver *adrv)
 {
-	driver_unregister(&adrv->driver);
+	if (refcount_dec_and_mutex_lock(&adrv->count, &aggregate_mutex)) {
+		driver_unregister(&adrv->driver);
+		mutex_unlock(&aggregate_mutex);
+	}
 }

 static struct aggregate_device *aggregate_device_add(struct device *parent,
diff --git a/include/linux/component.h b/include/linux/component.h
index 53d81203c095..b061341938aa 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -4,6 +4,7 @@

 #include <linux/stddef.h>
 #include <linux/device.h>
+#include <linux/refcount.h>

 struct aggregate_device;

@@ -66,6 +67,7 @@ struct device *aggregate_device_parent(const struct
aggregate_device *adev);

 /**
  * struct aggregate_driver - Aggregate driver (made up of other drivers)
+ * @count: driver registration refcount
  * @driver: device driver
  */
 struct aggregate_driver {
@@ -101,6 +103,7 @@ struct aggregate_driver {
 	 */
 	void (*shutdown)(struct aggregate_device *adev);

+	refcount_t		count;
 	struct device_driver	driver;
 };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
