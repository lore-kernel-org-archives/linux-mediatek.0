Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5910CD98DE
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 08:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OS442Iy4WHxSdJHdZSOdZpr7Kbl6vNC1J8JNZ1Janxs=; b=Hxg1qxrmLrxnveIpVm92qEZ9z9
	2V0ix8/C5pK+kGHp9mefFK5ZBVFlye7r6pGypYGSNhSZ5+BhYbBhlz+7OXdG8aw1gKqjKWnrrvmPD
	42I9ASqkEqkdPFX6dixcbaFZ8HwYlwF6RgGhxvGT1mjP2iBwk8b+r+g7L/rqbeRxkLZG73VbGXlxX
	jWPUiB9WunVy3c+ld5dGQwXDjVPAU3U0kPa0QeaFSAYiUIc4H1hE11WQFxn+TmpnJGS4+R2Sv1g5H
	vn5gbFaGUG5UQtXsmZruu/hAaGtHNOaFHEPYmvi2PdSt30N9yOFbEeA6wb4rOiZPyyUlO8kHkCaz9
	QPMGGykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVi-0000000768j-3ZdH;
	Wed, 10 Jun 2026 08:42:06 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVf-0000000763j-3cOQ
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 08:42:05 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2bf22d29dabso43399225ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 01:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080923; x=1781685723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OS442Iy4WHxSdJHdZSOdZpr7Kbl6vNC1J8JNZ1Janxs=;
        b=OerIOtDy/ti+uRzOja0p4oV8MVzfKhi+pzytZUxzJjSg7NuGzrmyRrCyUxfFwP8HDf
         o2VlHt0yU2QipHAQr/uMG470Ly7f5TmPajRgnW4xk33/eydr5GOgVBl4pxpmMjJY1F35
         5kP0O2xRLsd7InUuJ22r6fl4Iv31vHHmZ6mmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080923; x=1781685723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OS442Iy4WHxSdJHdZSOdZpr7Kbl6vNC1J8JNZ1Janxs=;
        b=O/GgAZtTykG7ynTVyLnuhOGZj4w/Nv45vB/21mwhgyGQoD459zYj+HV4fSrjcILyaX
         yljDSob6ME1D3QL+iPlw0dxcVQB0VDNZ4382R+tMZOf7fGC9gTaVyaN19vJkcJli2/m2
         sU/lgszFkJ2G8voQvxoTtYni/xo3sl/XmXxqQmQFie2Pp2zHNGJuOEacF1X2i0lN5aq3
         2uo2yqBfLKvyXtqSWlCh/RRtJXdH/0zgm3XNIMU8U+iz+MnHHJ1u11s6ZVbJDuE/FA13
         hZMpH8OzZ9Rt1/zAFwf08mQLQncFAiNpH2c7mkDw0LEmEPNn2CH0cCYksPhR+gl4MR0i
         xn/g==
X-Forwarded-Encrypted: i=1; AFNElJ+9sVNxRdqmoi+0ygFiFmN0ubIo6op5pSbMtN1GpbzrQBppOif0r58kFL83KDUcIK2JX8JtpV2PcKaXRWdQCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk1SI8Yl/QuhAJ+W99+k9q8GoOiBUVlXNSQbSSMunzOhleJNd4
	/BQPJD7IgBMaqMqs3cEeK/d3v9KMaKibs7AQgRi/Uu1KURuYP8O6UQEDyZbylLFjYg==
X-Gm-Gg: Acq92OG+X/D8Wghzch8rkjz6/NbjXRtGVLHffJEKRTfcticV4xiSe9ZewXqy1n9lYVf
	cLuPTSR9TqjEwWu2GGIn9tq6w0TjMMrwY90kSGsX6BtOSg6/plG92CfPJ3xFlwlOPSh3BfEPM0Q
	7bqOZmEdoMX8QVLwliT81oTBTeZqXqa/JvAwyJqw1OOM3LVOnoCCp+Tdwl5P6ZoAqcMh9ts10mg
	jY4U3otDMQna4gNbjI8mMScsHwnnN+C5V6+TJY+fHhkGaPYrzF7LIXFDYmbeX1EIklNjqd+pUMZ
	fbeqd0BF3G1LCcoJM2NTZEBkY2ErMU/Kai8Y59GATqZ2ZoZ4hkNOHZxb/nY5EUiaOEGm5OzVdaI
	VY27aPnTpiFz4zMoG2OEN7mBZRxl6gxM4dfa8v92eEFNF4oYr9jDnWqpWJETrazOLteWvfmCRHI
	pNmNVWh8MnhF/GyokeBmCDrLahHrbwbj9MOJCZcdeFT7G5gS898uryaM4rshxtZL79BNV/BmP13
	9R9cVJjsTzmt/blaw==
X-Received: by 2002:a17:902:cecc:b0:2c2:9254:4c22 with SMTP id d9443c01a7336-2c2a1c66cbcmr79859165ad.17.1781080923157;
        Wed, 10 Jun 2026 01:42:03 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:42:02 -0700 (PDT)
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
Subject: [PATCH v2 10/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Wed, 10 Jun 2026 16:40:44 +0800
Message-ID: <20260610084053.2059858-11-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014203_946601_9E1573B4 
X-CRM114-Status: GOOD (  13.46  )
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index e82821655fc4..49293376956b 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -176,8 +176,17 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	 * parent matches the OF node of 'dev'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		/* USB port devices are tied to the port nodes. */
+		struct device_node *remote_port __free(device_node) =
+				of_graph_get_remote_port(endpoint);
+
+		if (remote_port && remote_port == dev_of_node(dev))
+			return PWRSEQ_MATCH_OK;
+
+		/* Try the remote port parent for other types. */
 		struct device_node *remote __free(device_node) =
 				of_graph_get_remote_port_parent(endpoint);
+
 		if (remote && (remote == dev_of_node(dev)))
 			return PWRSEQ_MATCH_OK;
 	}
-- 
2.54.0.1099.g489fc7bff1-goog


