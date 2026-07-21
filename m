Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1A2C44529
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 06:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=; b=Qwpdm5JpA+by4uQq4iV7Iz+ipu
	Hw7QoH9ilDBFtW4tgtw97KiSXGBhDFEF5IT5hvvcIg2w6ZH6WS8cHOcT9m2sVNJGJ0EmQgrZ6FuqR
	/ktYHUni3Rs1+fyV6xZccq6hIC7Fe5aoLUVSoWyuA1pqcOorxU6JWgAxrYTB1Q+ewqWXhusT5WM6B
	COPGBYXlzQp+82S7jhEaDegSK5+ziNCcgoLOc/hvvdjRx07d0nhcNGVE5pbM63ElMU+61HKAP6AX7
	Kgx0LvhPcxIhvfxtVHjPSctQ52hNUevbuuGNcAdy+ISoXZ6qQ7lZN20LQdxMot+Wg1jJZ6n/Akrpb
	NiZCAd/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4OL-00000008b66-3zuy;
	Tue, 21 Jul 2026 06:55:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4O9-00000008asv-3edk
	for linux-mediatek@bombadil.infradead.org;
	Tue, 21 Jul 2026 06:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=; b=NtfITr5f1+oDqC0uCiSX5KuiSz
	y8azvxZ4T2I2W+19AzsxP4vWTDy8zLj7Gon1DLPtHasbijCbU58RDwTuCGvFuv656Q1oQfmMlosYY
	82DytE+QxWoAjgqVtgklLmQgnO+7uUq2F6rDyevYE7C0cVsYeKjqOqAzIQ4KDf9HodirTptCICG0d
	RV4Z46Hyg7biyyuZ9w6W2ohXriZEpKnacCsEz1DlCeeetdx1i8hKYFn4HtM9FElqnRxQHOBzOwyUl
	rekL9Af6GJmfkxOrAu49AYLvVCP17X4QPKPobYuZY6bdB2/KnDbIkRBYJNo6ZJ13n20PG4NT0z6iN
	jTlMfLiw==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wm4O6-0000000HGXs-3Rcq
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 06:55:36 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cca0c5799eso86501345ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 23:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616932; x=1785221732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=;
        b=FJlPbw8s+BVMTJhomgykXnhbuih1GoTR8MSxacoAUvDSZ0obpTwmQZEgEIiCbboU8m
         BEwLHUll02/PYO3vmqyLXuIaQx+lti2fZOSxqirp2jUG07AvpMPtx3OFzHPUug72PoAK
         IJeNaBJ0jWWFE9IIOeeh9/4bKv23RAckoSvrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616932; x=1785221732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=;
        b=kxps4ykSTQdmRSJHdPmOZTb9ZeSd98ZzaSg+Y6/uexi7t6rjRIFPpM2bQ2+0dGdlfG
         86AgEbMS2kWRhNh5C6crp5w7xPQWOwtIM/X/9PC6JvpYoYLo/b+/x15lW2vBjVc1WGii
         sgj7hcp9/QtwyX9M3i2yvq0LwNyJwFdnvBuvqzr27/Qhx/Y7XfzeQa4bf6FMYFJj/zFh
         CT1xf0D8n6+GIN6vj2WszFYcDgkWX4qNU3sEIuKEinP4FrYPCntJcs+64+qiWxnTJT6Q
         +E3j/jE0zdkHuamlATdkoMRRTdB/2hi3rh5R9Hwqh1ua8LhgJx6YtN7ONQWXvCcZKL47
         fNNw==
X-Forwarded-Encrypted: i=1; AHgh+RqK5KodGLe5t/gZZ1xN0thICGBOogpsYCKgcSmk1pIRxilmpUC6VIUaIjVYXYeNdsfgFpJIbpwJus8N0OIlyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVYxvmd8Jwa8MUitWNejUQdw3ch7LD/Z6N3LjDmlR13TEHyBtL
	X53y9DwCCUmhlNKLxEfPuMIrWc258hLmSDKYUpjosN0sidhMSOMgmfUHX1tNITsR5w==
X-Gm-Gg: AR+sD110EWM2omTvzz+C6LYIo/AjgNNeIrgl9fa4fqHEs+MqT/xvlmJt+WnQx9BspOK
	+eF9hj7pfz8/hP1M8Lu+UpOCSFfHm6cOq2328iHTbQ6F+XiRVZHmabyQa7YoWWFbscB/vEpTHHm
	Yssx5DF54FYBiC5ls3MDUtfmqtwzTBCDNQS9/dUn02zW2+iz1FL7fvTa5/tXV3OAUpemSbhbJ0S
	umvR+44FCx3jaDLQMQ/lFNNuXfprhxEKGTQTbGIzEFvS326jtk2Kdvu82tlu0yy4z3lIHGXdorx
	n469CVi8ok4K7M8lmk0KzujGzsZuLLE8PKgvjToHKiOgJZSp1qFUgPIspvQoYuBwb9saX6gQuPR
	ynyf9eiYK7ipKLh+G9vvlbfabXthD3rXTfNe1mYiehhcBDa6HHp6q/gyKDgQvjY/OYqWPDrj5f8
	yLHwOE8gHLGkF/YQf9HgIP/Mwcgr4oq9oiHgoLW/O2buWKuoYrDUE0jgDbYoc=
X-Received: by 2002:a17:903:2287:b0:2c9:c517:d070 with SMTP id d9443c01a7336-2cf348366bfmr176522085ad.3.1784616932321;
        Mon, 20 Jul 2026 23:55:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:31 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v6 12/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Tue, 21 Jul 2026 14:54:07 +0800
Message-ID: <20260721065413.2306137-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_075535_074848_5AC110B4 
X-CRM114-Status: GOOD (  15.17  )
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

A USB hub can have multiple ports, and this driver needs to
differentiate which port is being matched to. The USB hub driver now
associates the "port" node with the usb_port device, so here we can
use the remote "port" node to check for a match. Then fall back to
the remote device node for the other connection types.

Also rewrite the existing "remote == dev_of_node(dev)" with
device_match_of_node() for consistency.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Dropped blank line between __free() variable declaration and
  subsequent use of the variable in conditional

Changes since v3:
- Drop redundant device node validity check; device_match_of_node()
  does it internally

Changes since v2:
- Use device_match_of_node()
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 83fe6a1396bc..691cad0a6dd0 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -175,9 +175,16 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	 * parent matches the OF node of 'dev'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		/* USB port devices are tied to the port nodes. */
+		struct device_node *remote_port __free(device_node) =
+				of_graph_get_remote_port(endpoint);
+		if (device_match_of_node(dev, remote_port))
+			return PWRSEQ_MATCH_OK;
+
+		/* Try the remote port parent for other types. */
 		struct device_node *remote __free(device_node) =
 				of_graph_get_remote_port_parent(endpoint);
-		if (remote && (remote == dev_of_node(dev)))
+		if (device_match_of_node(dev, remote))
 			return PWRSEQ_MATCH_OK;
 	}
 
-- 
2.55.0.229.g6434b31f56-goog


