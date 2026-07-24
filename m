Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE00C531FA
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 08:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=; b=FwDUPc74FAV3rsYRjgMXSP2fCt
	ZKbP0u7QUzK2XdPLv3e1Y/s8/efMs8YXuOuXMzOG3KCPrBiv4h+XONeWSSt6Iq96wPOJvKllooEWd
	WLCrjv2xZsc93rEEiTU99gJe5FVxI+WN1K1BVG2L4C5MwkapMslgm49tD8TuXyWQX3sIkj1lSoCJi
	vxo7mWHlt+ekNoC4RKtzIXhRGqEU217NfNFn7RZjwcQEn0/1tcBBLXQdhG1dgyd3mF2hzrHErR3fg
	JcUOque3s44hHy/kuNzZ+BH7qhFevwMmi9IYTWOW5S3XIPp7I7P6Q5WrY4KMEih/vN8q6aXvOpQkb
	rVHZ5H9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBX7-0000000FrUc-1F6I;
	Fri, 24 Jul 2026 08:45:29 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWl-0000000FrBS-0wdS
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 08:45:08 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38e041ea211so163017a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 01:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882706; x=1785487506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=;
        b=NK66/fXHx69BPjeZ18FyseIj+dmHD5IAtx6EZRaKG/RFHaDUir1aP87Cqt+NvMtTeV
         v3+ZFzCuzpeueMQEFdKFQgm97kyLXkkKgu7BZ7lH1TrcPm4M3KRZc8Jy1ZNh1I/2UGJO
         DtpP88xtMmalS0ilapvscfvHvWw+kBqH3A1hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882706; x=1785487506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=;
        b=r3sHmoLbOmsaTOOyc3lvYgRxDP009riMvg5qi1LEsoq5QKiZJBCBORrrRUcPeNVpzS
         k/6FSPHS3IASUqawIsbx6kW1tqMLSmpuaxJlr46beBFUwPObNTIeoyPzZXZ04QTYasoJ
         N9UiAv1d43JjjDPqnBm37BaeCSJhOJKQ8qpHPM3r02NoaGmEmWBGH2Ss6ZSEy4pLfcjH
         sqhesC3dk7U+EHpkyCMLCmluEtvgpuywWRW7fYrGneD9l55IxgZIDUEYu6ojLQbDSQOH
         1mYSxWN7n4izbbPPPIVialYMt9eh+B45B8tf/MzEPnXyt8mqaLazF4nR6jnPDeo4Vn/9
         dv9A==
X-Forwarded-Encrypted: i=1; AHgh+RpYnGmrI/vlUNtOYU/6XnVBrtvDeTG+r0HmOnb04qu4zHW89E5xXvcTzOergNZG1lHXcLe4MtZol1dpFbYReQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXioZ3QQiFEMUmxBqj7JhoHKj3g/q+BEbrSWk9bXDYbPt7y4dL
	THJkQCxgDgKQP/BdSv0BLDXftULxScSOZ4aYBz7Nl1Mwfv1oPo9hgxgpRxUOxf4G5A==
X-Gm-Gg: AR+sD12vPLRB9jVxmfVLcqGCHY/5VMzEhghh4S9URzmZp7hWIptSv9rtzjYPFn3z37o
	PZQXKx0JmzV1O5WnngA5HrRTN73Wz0COg4Wp5zc9pLbrwJ6z/YszLPCiRqpPe4L9sJdfRCCfE46
	46MNRyMMD+aBZR6sHtayruVxHBIfcxq7GJbPScPLDXJbffBzcm8W3CdEgquKjrj4XKykLuI0L8t
	Hgggnfu0Cm5fWP96GeDccMl7A9cDFQw7iMyV/zGFhL+iI7ZTghFf1L/kpkLRKE3a+L/6x/XBezz
	7eTXS+NCBcRynFWVjRzNAQP6t1Fs3XpS6UVqmCfyQNnk7g/Th9zWJDEbHtnjEkogtD9+gfKNQ0s
	gvLXva2mYhTZHnk0lgfLd6/PYAqnwneH/nThmHsQYOTEZVC1lXynHKILHQuAFf0pKo7CVcwXHJ2
	pOg4J3iPWIwZib3j17npifZEWmZY1eiFpZbaOUjAeYhNVXlhZ/erVjofkYqo4=
X-Received: by 2002:a17:90b:5687:b0:387:e0bb:57f8 with SMTP id 98e67ed59e1d1-38ec6a9d77bmr7085311a91.41.1784882706348;
        Fri, 24 Jul 2026 01:45:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:45:05 -0700 (PDT)
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
Subject: [PATCH v7 12/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Fri, 24 Jul 2026 16:43:21 +0800
Message-ID: <20260724084328.3943997-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014507_281375_84C27A8C 
X-CRM114-Status: GOOD (  14.48  )
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


