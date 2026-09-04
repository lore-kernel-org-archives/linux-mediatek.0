Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D9BC79F83
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 08:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1exL3htqf+GpZcCvUWENBQmRfzXhNWdoVzfZaiBanSc=; b=scCSfl1sTVIprfDmVTWHhVIrA3
	Qq/zdQ2APefna0uALuCxOeHwPLI13h00FJM/r4cYF2qxFXbJMVc+KGeLtAn3JgexqzJjkFske6WJM
	EnUVRGE0uPBd4B1KSta6Yodd8XWDuc68xs6uMghDg2OcY4X2iIz93g0Cm9IGNbEg+/tu/fows42BN
	fqKbuXHtjfPiUeXM6d03NkQbumCNzJSKQOk6SadDLXI1Ok/kNpgVIW91ejHHfNZFSa8Ho+MIlgXSC
	166IOYz8vKF3y8i5Xg/dO5oxbzyaVNEgPLWbBGUmVXMGUF5adbF4+I21FPOtQ2cAUJZGCw+YPzQ11
	hVyh4h1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PX7-00000001QZb-1fWm;
	Fri, 04 Sep 2026 08:44:25 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PX5-00000001QW5-1IeJ
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 08:44:24 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-382ef647e20so753289a91.1
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511463; x=1789116263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1exL3htqf+GpZcCvUWENBQmRfzXhNWdoVzfZaiBanSc=;
        b=kcQukRcEMBRMkNVgcMtAz4/ezIAjxRuwRVh5NubJsy6iL6potfjg/+9DrDzIRA5+T/
         9qJLNprXG5za37oWjPkUbBUf5apF1mwL61ZHEX6o6QdMfDs5Zx8Bqti2gn/9D9qtuHa0
         iqoeIx1A1FN9Wy+rAqtAa7DkTvJsSxFqcGI8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511463; x=1789116263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1exL3htqf+GpZcCvUWENBQmRfzXhNWdoVzfZaiBanSc=;
        b=MHiiE8i47hpi+7sOYjkZv4swDaiEKiVlawHe/XvKNKYDnBzyfdYnmPBHFws3eEp+NF
         eAxGSI5WXsf/WssBTg8FnUk6r8SAbx1bgxulMDFOZEawrTPNgitfxcEQ5lIs0HAz71Gf
         Exlg9UAUPaUtnPDOAuCTAcDAQ5B4p+18Tuhigjf+Qy8GsaVTbNr1PVn0kcax2ucBhByi
         53lqbSx/omyWoqkpQwKHdq5Ze4wdSph+k3o6ZG7O5FQO/azx4ADijYCCdI1eQozdCX6j
         PUEwvkyo1r3hlIKy8FFWyGdWtDoOAgx35Wfu2JZzXTEx/FYy9km5MgBRF484GPz+EdsK
         Yqvg==
X-Forwarded-Encrypted: i=1; AKwUvBxBHFzBMocF4gxw6KkH4YROC/8rQ63xxBUHPrBFNH1HIGjGnnEvrobcRKGtyNOjWG220mX/w/7ByDSyaBhATw==@lists.infradead.org
X-Gm-Message-State: AFuF++lQMeLdhaFtaIPD0SwnakV5FeiTEAnpXy34pbxUnV9+KzZBcKE/
	RdnTXUa4DNhHbn6M1qt+3IY6e9vk7Mcw9yD4sBNunossRlc0GVOG3NTXnLKbcPRo/Q==
X-Gm-Gg: AYBFou2YP7DgejC0KMx/rTtupJNvzEhWl85705gfZTCi4C0DZUCbeDPsEgTXkBNcW+N
	vmwIDxi/CNrvBkj+ExqjHVn2W0e3AvjIK/WeMc514JQb9Xwf6RYy/hgXxp240FuctAYsUD1pVam
	3dccZl+cH15rZzNFJjQ40XENdeybJUecD/Hzx2m8O5lJdfs1Q3RjnV6wjPSWpJRMG3IXCXifl0s
	Q6pA8VxJpct6s8pIKQaI076PcfRQ0mLhJyTmYCGKqJJSlXCHWCw9pSOWIcu0TSXghopOMKKZqUP
	Ax1FbXZgU1z+eapfGr96xdgdtVo9aR2Seq+glum2S4mr2XtrK59dICKEh1XZWUm01nrj173/28m
	Qyjan441zwiiJ1bCjA2rTnmyS+Hwyo6Mwx8Gqu/7KG1HdtQKebilTwtqJtjoJwJamO7SVtsTngV
	VIGIg3bdrb9oeVesrAvSToey0D4bRmUz+5smjTSipmjs2oQN2gCzkBPGfitfqmdgIqiCsHcY+/A
	8AETFAmeYZ8UD1FlB7dIHEf6kegrM6ZoeZjaMRy5gmu
X-Received: by 2002:a17:90a:d646:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39b26214798mr7405740a91.20.1788511462630;
        Fri, 04 Sep 2026 01:44:22 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:22 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
	Alan Stern <stern@rowland.harvard.edu>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v8 12/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Fri,  4 Sep 2026 16:41:51 +0800
Message-ID: <20260904084158.1341550-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014423_350874_5A0A5A35 
X-CRM114-Status: GOOD (  15.06  )
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
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
index de9848a9a9f1..43b2328a6661 100644
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
2.55.0.979.g7e5102b832-goog


