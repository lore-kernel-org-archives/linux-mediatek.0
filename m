Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECCCC43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRv90qFqU2a0K+pYyATTHQRQ7A0Z3yoLXaJNbxqKJ4c=; b=fClA9yynr9Y2ycSVJqCGVvj7Bx
	fevm9K3IeCOyVs46lxwrRZi7qFEmbr5oJoQS7kIiLQ/702eFQ2f0Ax2MJybdaUQ263T+K6SXNiqB4
	qG1UO9F9Yv1bM0TuN4tGLKQVgiXzb/o6oXiMNXVGeIxk/iGXYvaLJBVA1IvtwvfXtjguIsEW84Q1b
	QMbJEvolrBuKGZsP3u/JIfEj3upvsAzMsSOov5Duly2t1D4Xl9MeAeyz2FFEQaxpC6RgTMHgUsVw+
	JjdY9cg5GEQGZutD88fSwpl+n3x3yS4kuU/5dEMzSDanGQtlKahxhn3PdELL1Kno7uxJL8oCyPlIt
	0P1Zb59g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbh1-00000006lkn-1gnv;
	Fri, 03 Jul 2026 11:04:23 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgy-00000006lgX-43cc
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:04:22 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c9bd2f8bf7so16666925ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076660; x=1783681460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRv90qFqU2a0K+pYyATTHQRQ7A0Z3yoLXaJNbxqKJ4c=;
        b=dObW5vVLXSNrYlSQb0LswrssNvk7h3ntRlMPSj/SJ4nZNFgJOt1wVRJI6NnHP+lR5T
         +La1SRswKQfdKa08QR/mven4a4aHXFIc50viZ/R1hMJFsDhBHUX4wYgDWNaEV4cHGwnm
         bklQxAkbDgC3LzFLmyQBXaj8vGWmAKijKcQbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076660; x=1783681460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KRv90qFqU2a0K+pYyATTHQRQ7A0Z3yoLXaJNbxqKJ4c=;
        b=kP80I4HEcqY1gkz188+0FKJM0nGMkbkDx0xpcwUFacXXXNhRhpkA2W8jnOeq4K4H+/
         Cw34FXmNjY0vUjJK/dmMpCynBHLhAvktnUDr8QLFaCavERMKTPBhmnlQvcdsT1NXU+Pt
         hmNi3mBAXcN1q/ldCGwvXr36MM+4d3z/8DjHWVeFolpzuN7FOLqVVapIF74YnmgSP3KC
         ppf1z1smXh5biexCUcDUxEWAbMxOQrAWu9qRydLQ0PaGRGFGmDv/qFdYTAVmxiYo0TX5
         En8xBYCINefEYkNkns3Ac/epoWc6AIzhuFDYRYpO+DNKY4kifLqn/pz46AoIhBZ2ZEyM
         6Ohw==
X-Forwarded-Encrypted: i=1; AHgh+RrH7CcocHTerOkkEUj7FwaJ5dVOvHSsKp3SohwtBVE45HJacI3tfscvgVJY6+4HcPr3L+M3YQSzXl9z7naRRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNXtmSfrMCd/8Vo68/Der6mq9qttVrpZatCsJqAMZpYTQQyX73
	zezqVvYT7ttYMP4h0pSadCDmp5rY1uEUude2qcK+uPp3EIJKOrujh+fwxzZ3sLU2OA==
X-Gm-Gg: AfdE7cn1oL8xPwIelBBdN9baxyciB64EZtSxMM0B8VPw1P7LT6x2zleemriW9TbuNDz
	AMaChRivFawuoh+McqO7i62TFClp4bI1pAvSl9dU6i/cA0j4Rhg3HJyB7mS9hv0tBh9CvngJMLb
	pGdl35TJ9+zKVBOmLYx9QZOdEYxS19nXJpj2c1UOfFwYunlRJPRSWHH/UkdF+1WtV5UxTykNk/h
	GEMr5KXBL5DOIWj4YBaIMcA31HNoy5bnmNHdxkbabqWZbYWFGg2uK1EWX1avi99SvnGk3C1uGbp
	8FcrELCx0pIIX+a/QcbVv/uJQhHVNdIZdK2R5YDC9XDj3G+JmQ2KCbLWGx73sZO3hgs7UX/S15j
	KBKX54PVGqpe8RO8f8j1Zl1HqYbNWCvHt6jCZ+I6WNrseUU+ohjnA+YEIgoCDdKeZvBOnRXLls0
	kSMFpk/mfp4nxbcoP1UfXiJohoInIlqx4UPKj10WridWvrsbHpNynW+Q1oEVwTpWbIzQtdnOBDR
	o1n+tT9
X-Received: by 2002:a17:902:d4c3:b0:2c9:d584:49bc with SMTP id d9443c01a7336-2cacaa911b2mr39932695ad.3.1783076659705;
        Fri, 03 Jul 2026 04:04:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:19 -0700 (PDT)
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
Subject: [PATCH v3 10/13] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Fri,  3 Jul 2026 19:03:11 +0800
Message-ID: <20260703110317.1283411-11-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040421_018636_A7A19892 
X-CRM114-Status: GOOD (  14.22  )
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
Changes since v2:
- Use device_match_of_node()
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index c8ee6df42b81..16a47f76e7ce 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -175,9 +175,18 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	 * parent matches the OF node of 'dev'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		/* USB port devices are tied to the port nodes. */
+		struct device_node *remote_port __free(device_node) =
+				of_graph_get_remote_port(endpoint);
+
+		if (remote_port && device_match_of_node(dev, remote_port))
+			return PWRSEQ_MATCH_OK;
+
+		/* Try the remote port parent for other types. */
 		struct device_node *remote __free(device_node) =
 				of_graph_get_remote_port_parent(endpoint);
-		if (remote && (remote == dev_of_node(dev)))
+
+		if (remote && device_match_of_node(dev, remote))
 			return PWRSEQ_MATCH_OK;
 	}
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


