Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206D2CD98C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 08:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTomCA2OQTIcAcWrVI1pDKUJSWSpTuGc9xeNsAJVzUg=; b=ELIxb+DtpDo4lwGgSlpe/EAm//
	yCKvsnHKINLegzREAHk0EJa5TidxZDOPsLf9XEiz+aeYoLS3fZfV4qKEb2hvYV0/IpyHvfpWUML47
	kolgGJ0umiDkyxkkUI+wvIxujoiy9twy3qX5TKbKii5BLoQHDe2AlX5Jm3q0jrIT4oIJOCEZzAuxM
	ej79KRPw8hexBP6HSZ14YzmsDXbU7ROt4IxAyVaPi2Smr5lTRP2peR5Ii+iELUfLYhR5FCuR65t1Z
	B3ocyDsOErC44Kq91ytni2GlNYeO8HbnIlZKBe5UbKyL5Kw5e/o8Am7d7CkIKuhcNARiXZBieyUtB
	4cvTPQmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVM-000000075gR-0k0k;
	Wed, 10 Jun 2026 08:41:44 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVJ-000000075dy-3z2W
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 08:41:43 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso62698835ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 01:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080901; x=1781685701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTomCA2OQTIcAcWrVI1pDKUJSWSpTuGc9xeNsAJVzUg=;
        b=NxIqTs8aDBxLa1gFBmkBwAve4udKvOuJJkMShXO6pvqQp7CfD+E8FpYNsUVKTTQ3yr
         SEBviJP8ZxStIaBTg3qMGnlfb/jZrgnq5V7Qzf1ycn8OkQA2agmTYcQJJPXQWbAvcNb3
         OM/1LG9KyjaA9LkVgXKkQxNC79iOdtTW1NIeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080901; x=1781685701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DTomCA2OQTIcAcWrVI1pDKUJSWSpTuGc9xeNsAJVzUg=;
        b=G6e4QyEOP8JZpdauZw1+b0V3irlWQSRVBvEwyAqGZLRljr0ghngRZdYZJAu+6JrquN
         E1Vr5bjubI7uRAM7toJ63bNBxp/hMcx6IYdTBVBnxGm8TgawuYT7NMt6fp3FLXCGFDxb
         BrNBHpeTKsP9UM+kdLLYMqV81poid3X+D28sFZJ/BDBU1pkey0lKhRvtlt3yyqIOSKIZ
         ZASi7Rhv9o1DK+insV/oThFC1gMV6ebWvyZNmWIypciehyoCR5/6XUYiF3i+mKd4xKLE
         MxcNE+dtB08aPK9LSzASxFxXIFDKSM3Z7/EAv4IE30tVddc7UJfjU4rH/ONS/Gs74HE2
         D/Qg==
X-Forwarded-Encrypted: i=1; AFNElJ+UKNM0LtQAvRUm+VH7Jd4gMq7Iv7TGDdflD7Ftl4dxSnbX746lb1Uo3Jf85mPcKM0Sof0MJffOX5zlFBU1EA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yze1uUA1owBAXxebU8UhgMms/KJaqBCDGfAcS2dkBuQrpB4SGJ0
	CES10rBYyJxrvhahc3L6QA3Vu/Yc1HrIBW80AzPlW5drQxyz4IVCVSjj5he8/i8LkQ==
X-Gm-Gg: Acq92OEW2e70wM1dCzzfZwU7fUCX5FnpmiEGyKrzd82XhTsABXcniQ3lZ6alff/f1im
	OLenXwbsUYElZoUzqNrvQUYC1RrahkkJDioO+f/C3Q3oGD/+pAUvqIaUNH5uV3p/7EDvq4qXNOu
	Kytw5eCtjMefW6v80MsbPBSx6f8Y56Wigfq8jlQBJhjH0J1FPDAVi2lFdKEndQztUZ+fXHa8bKr
	ihG9g1DmNuAnfTI7tUrxHnDHuaLdVNEZRbR6/DJJU/u949U0kxuxvHTKFceNfsRfLyTYPtEJuB+
	hp1CBwqmKcdLhij3LfnWJLlhjcmbgFkhXlEMgFid98yObzZ4GvNd7XnhbOvEiqKbfaRzaPMIV7/
	iF6Fx9rwGwE2xCbKVtYsp+CRrMy3GiGBdl79yldUfijJxKTqrSu28cpYvzWkOe6I8WAkpnEO4ls
	8jfKjsazvmQ28NpB2el7o0DZc2VfxeYYbYShN5pm5twaq+Rpm+tXL9VvNJnboy74vW4VBzmuuLM
	I/p21owFg3zEWwQbg==
X-Received: by 2002:a17:903:46cf:b0:2c0:d91d:c3e8 with SMTP id d9443c01a7336-2c1e80cd78emr274569985ad.4.1781080901116;
        Wed, 10 Jun 2026 01:41:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 05/16] usb: hub: Associate port@ fwnode with USB port device
Date: Wed, 10 Jun 2026 16:40:39 +0800
Message-ID: <20260610084053.2059858-6-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014141_996875_96C7CDCE 
X-CRM114-Status: GOOD (  11.70  )
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

When a USB hub port is connected to a connector in a firmware node
graph, the port itself has a node in the graph.

Associate the port's firmware node with the USB port's device,
usb_port::dev. This is used in later changes for the M.2 slot power
sequencing provider to match against the requesting port.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/usb/core/port.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384c..1846eb1206a4 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -780,6 +780,8 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+	device_set_node(&port_dev->dev,
+			fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1));
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
-- 
2.54.0.1099.g489fc7bff1-goog


