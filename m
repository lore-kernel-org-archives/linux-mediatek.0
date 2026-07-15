Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D151C44507
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 08:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVHm6p5wN5KSAyn8QSBlqPHJusamsYORhaWsm3vPLUI=; b=RZWUMxolwmdP/OcaMnfTHbTJj1
	pI+p+JRuFyi6zdoo7cxUKfpkl9SaY5vtyQE2Q7ySlgXW/xqS76v3AWcO/qBTd/c2V2QoqMLoy1XlB
	1cF5d7eBtpKQHb7TYzCLxIbMfPh92FwVFd3WVuFEFUIagf1KcAzJD2pJ3IiqkoVHS3rSG28sVI8fr
	QF0Dox21rnGMwUkVuf0b2fQwhp+CEavapnEk7IhMebMN/CU0jGw75aaDoZDNP4MuAUnmFbKRDceSj
	Z7T0sJ4cwDUySc5bCIMkfITRMWuQiaclPemA6e/Z+DkZRNF06wiRdYviY5kllhDV6tw27/KKu7NiD
	kZxYUaIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOh-0000000EELG-45sm;
	Wed, 15 Jul 2026 08:55:20 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOd-0000000EEDU-3QyW
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 08:55:18 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c89636920a3so1084174a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105715; x=1784710515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVHm6p5wN5KSAyn8QSBlqPHJusamsYORhaWsm3vPLUI=;
        b=TdmYQff2sD3OYowbhckR1a24H9AS3f2MZDaV8Rdn65Z2Q9eKrP0JasAsIFpR5KAi6x
         ihXGgVGGsK+1ZuKiEzcg8VtwjPxl4B8VwCd17Byho1E7dij/mrBn+8Bptw/H1UYLXbYX
         3QMbgibmBETE2ZjGgkwoc7JaGpvd8UhWhQqgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105715; x=1784710515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVHm6p5wN5KSAyn8QSBlqPHJusamsYORhaWsm3vPLUI=;
        b=EGqq/w/wnw7A5SEX0UM7MSQX8Q4Mrt9kNiMmNBVhQhq2AjXvTBdLLVq+4MRGZhNR18
         DGWhCrjaXNvrNQS6b+U3jY8zXoIrQpbsXYxFrPoaYvkfGADOdMrM7xqHEYN9D5Kq0lwF
         T+a+WmAHbqfqgsfNZYxqqv0Q9e/8u/BtOrqTjcqaGmIofFTx6mCoTIp1QrNc3AsauSF/
         yoGUPIw8KbuOKjF0/EjjWp7IGcssDy6HkLXY+w35EPyRCGUq18WURIbCGPsFEg+x/vww
         /yn4DxJJ2YQBMtwEyHPGSIAJFJHTVA27WS0mthChjQZMVOKyAlFmzStF/WObWLbtvR+p
         XGBQ==
X-Forwarded-Encrypted: i=1; AHgh+RqnmRScFfFPGeED2sCvfl4iVL62Q1ZhsUFNItWYvqVNHKjwE16vfblZYu5iTFsI+0NyC1JjKABrbPDo+l86Og==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVlJgPJDbfoa5upfFkmL//OG8VMPOyfxar7eDPAKDYpVM3Mbif
	R+EreEtAnlRM6XO9QIDiZ3m5rmu5PfWMNNm8P6f8q/6UyO0mZcMTyTv5XgCNQ1iTnw==
X-Gm-Gg: AfdE7cmhvt2MX5of2Ppy1clFQzcEr0oAJ0IoLRnzhbE9qqf1fN4hkdTLldOrGR1ItbM
	LZ212TrXHrJIawt/E3pPqGl4rRtFLfbHwvVRG1gFJ3r1vEUdJGCFci3kMGotJBTpf0QEjRWYIuO
	lMnJXpZmast+dOmX4rVioYX7qoyilnoF3u/2gu8naulbzLg8S9lMBEoEuDetGrlXtzy+V4bbqVu
	zKWHsUIio/AUpae7psEvjnq1KbtvNnrwH2oPQO1Eqf3nE9ssEcxBrmq2A91zN/wfHL/R3LoeDv5
	sb714zOiMWs8+lkOPTh6sFOW4mm8sbPzUkQ/WU1UuFMljHzR577IPS8uCwPznVWOkJn+qSUbE69
	A3505YK60W1xNtp49fwWlkuDctJuLNmsOCe1TI8m82csGZ0wBZBP3Ad/I8ktVWtB6F5W0PSG8d9
	kVxp4lEvOCkzs0aE6ywRInejfqAdpMSFqQylMX9zk424moMPRpNIf5PYNwcMA9zXmXz2L39w==
X-Received: by 2002:a05:6a00:228e:b0:842:3aee:12c0 with SMTP id d2e1a72fcca58-8488960660emr14884802b3a.23.1784105714825;
        Wed, 15 Jul 2026 01:55:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:14 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v5 12/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Wed, 15 Jul 2026 16:53:42 +0800
Message-ID: <20260715085348.3457359-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015515_892002_5EDBAA14 
X-CRM114-Status: GOOD (  14.63  )
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
  subsequent use of the variable in conditional (Andy)

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
2.55.0.795.g602f6c329a-goog


