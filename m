Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF22CD4851
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 09:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWN7gkxjFiGZ3cV0OWHAWJ+8N9Pyp+YRIV9vOKGoCOQ=; b=rAO6OVpZmTuhP7LiQ7YLVLLZ3A
	ERUE9Qp4icvcQIGhAmCQNs9xgGQ7mKzGLgkeifhQLDAXqPwQqkA7mxlmmIORSssfkrMbfUad8SaOa
	WvYlS6T7xPORMnbOWaBVr/Qzok0GLvp+LX8elMLsa/K2i4udfMzXOaycdRo+VK7Dc5t+mlhRL2le4
	DgQSMX1gYDQWzuaoglI/X7cruWnT50vwRuKB1FMnA7p267A39dAtvxQJVLwqPFehDusUscMS4ihqD
	JJhwORy3qEaofCooY6aic3C8zKBDSJDARQJcLOG3QQBDBhV5HG3AuHssn4A3FMyMbV6pzn7zzSZq3
	sVVwS0vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoR9-00000007onR-2380;
	Fri, 15 May 2026 09:02:27 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoR4-00000007oiK-1NPz
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 09:02:23 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c80167f56cdso3820619a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835741; x=1779440541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWN7gkxjFiGZ3cV0OWHAWJ+8N9Pyp+YRIV9vOKGoCOQ=;
        b=Cpb88G5kGlVEE08QRbHDGlilnO3bKWCC07UNwEgd5FAd8zPphfuFBQeQHIDbI3OpnD
         js/FjzMZWr7b7dXHzw3WOnVPTt0OM7/eVUHfkh6CSn3ALPco7L+5I9EPvV+j4DGX6Sw+
         ItG9Nchjh69u6vbDX0kj2tN2fLjeDyIgQ6e2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835741; x=1779440541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CWN7gkxjFiGZ3cV0OWHAWJ+8N9Pyp+YRIV9vOKGoCOQ=;
        b=KRxq7qPrpK7tCoLVY9+82Kne2/mVpop6oKMRrgz9phW/TqX8iMzVRYR63sqXJhUj6s
         mQpC3FzSNtCZtKiYCAeV5YXoLr4SQSveS8TfKdvbfSEI9DBLkB4mih5xmGYh4kd9qKcC
         5229+CeB+lJSQ8F1PaFyPLKNCllr1hC6oMzYrZVFYye5lU5CcMIx/zl25SNhnpooBuYm
         b4iKqz8xSxw8uRmzX5SIYkA+OGEAuQGlDpOfCY7Iwbe3mebEyT/8cQZ0+Z0kPILsJ/xI
         8t968M9BnkrQLegRwNH/q2JW52Oiq0f98hUYAPmVP5B/2ehTa7w6OWKiSdxLYWjQR+O6
         RCIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jr3bUjCDCz/XCcysBNkN6HYpKXYLDHiVoPHwujBC8DeDCd7LhxizlH+wnkhLMRWa0ranJolzETvYyDXHVyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaCHkgjwXU3IvTpY1gAe0RJdKugUYY1YB/K9nbFY4LpIOqDC4V
	fQ86fiVoydSKPex5tNbr+uI0Th0eo2Url99vUVtGwqys4Q9r2bQ8S1SFs/PcShZmiQ==
X-Gm-Gg: Acq92OFGa575b4P9Es79rMlUurzT1BpNKA04W6y4IsfnVfxxYwu1iJCoLReJknhzgeA
	w0Nz0/GgnhBTmi8jr8yUxwTNGw0/f8wrmZtrOR/TkZQuwBWa7qzmfBK+FKmooulFAAzRzS6xdDR
	JOpQTRDZtDr4bBrebVgdBzGJIi7BHZuyeLgVD4p+ptPjRg3a6thj/b/6xKKmeUbXWMjFCh5nWCd
	ZTHvO3a2efE8m46RueYCwWcerU3NQz+lW/2VhYGt9BAMnr1C/UHUbm8VuKqlcbOnJknkS4d4C2H
	PJfK40/bpjtuVjNIIMhc+DQLJj7V152GQOrzr4PUXAqclqknpU6oM9VSurthrZ5ESGMEmWtxA6H
	83kc0Nopi6LeDmsHfoDSLH8mGVIb7aKFduzf34MAq7XXx6vF6t0AIeoPcEMrVqeYEITxxO9av03
	+Y41sE5k84lr1OvhjPksZJej7RYi/UGnpJJqFC84MgEIO0Zr11TjcD2yHAzFFpCmcNNpseuzzSj
	boI0IVCMJJosxwagEw=
X-Received: by 2002:a17:90b:5203:b0:35f:b288:8e4c with SMTP id 98e67ed59e1d1-36951a6722fmr2708708a91.15.1778835741437;
        Fri, 15 May 2026 02:02:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:21 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 04/12] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Fri, 15 May 2026 17:01:40 +0800
Message-ID: <20260515090149.3169406-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_020222_369609_E9828C4C 
X-CRM114-Status: GOOD (  13.71  )
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

The addition of power sequencing descriptor handling in the USB hub code
requires dealing with deferred probing from pwrseq_get(). The power
sequencing provider may not yet be available when the USB hub probes.

Return the actual error code from hub_configure() when it fails, so that
the driver core can notice the deferred probe request.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/usb/core/hub.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 24960ba9caa9..90ea597d42ae 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1998,14 +1998,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		usb_set_interface(hdev, 0, 0);
 	}
 
-	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret >= 0) {
 		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
 
 		return 0;
 	}
 
 	hub_disconnect(intf);
-	return -ENODEV;
+	return ret;
 }
 
 static int
-- 
2.54.0.563.g4f69b47b94-goog


