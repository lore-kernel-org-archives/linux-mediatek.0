Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38403C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 15:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7owReWjASXGziDrkgmqzFFT5SPg7O6DYqec//E6+M20=; b=OqK2ZNad7trXTX
	oYO5ciIb5QEWo57d7rlaX4BJRxGy1mbkoQuNgOFBSgJFO3y4DW1Ab/LCaRy0vxhdyX2MibE4zDhod
	ljge5UIHN/sB0oq0sxcmsAOYJ2MfhIZkMua2d1t+S0uOh2Q+yJ7gEgzgZytRcktLLDkflQPPJhkAk
	6oEK9uZFmF0f8RTPaMbvyMojlzxAg/GFF1nGNzOPJ25b9728xTiJyhKDPTjEfbq3skU/3Ok2pIhLr
	uvTK8cyp00uPJj91ZWmIM6SJXq7zF9ucR5t++fH/1z8mzT3adQDub9GLnp3HprCUyLm26qLoyMsoU
	cLRwPzVW7StYCQ5Z4wkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMWgH-00A1fE-OH; Tue, 22 Feb 2022 15:02:21 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMWdw-00A08a-7t
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 14:59:58 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EEEF94003C
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 14:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645541994;
 bh=Yp6ZDVV8RuEvdp6hHMI16oZzyQVBXO+fcxhml4rBHaw=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=o5MumoPmVx9eifQXg9bgd4trY37BCmk2Et/4nt4biXGfl2vYeiQ920u+3O9POqs5q
 DwcG5mCi0gD/1S29WAb7ygn0Rfdzyp+3b3Qe9U+qxPU3DKBFhF5wp0wE4/yvYNq6nM
 jA4VGbbQuuA/WI0s+RZukm/csCoGcq7sBgVLSFKAov7zDtsEvNl7rm6NZkAh36xbrQ
 aRcTYFlg5OGXI7J6UisaI1Rl6+acHPzWdc/wzm0BxUq2fwKmiJDx6vwUMn5xO8oGTu
 ufWq9LvHigi8aShOoWIQ0Tz33ios0LwetV/zcz87klEGYg+fHoGdnHsyvp+Q0cNLYx
 VPC+4etmU9RJg==
Received: by mail-ej1-f69.google.com with SMTP id
 13-20020a170906328d00b006982d0888a4so5826727ejw.9
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 06:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yp6ZDVV8RuEvdp6hHMI16oZzyQVBXO+fcxhml4rBHaw=;
 b=0aHDhxtTC55+IfP9kjcVMiMMCZ1hoiQ1yQ0sdfJ1c13u/2eLmgCxwlgbh0p5d5Ezpq
 f+JA9rliRlNQSEVPAl/H+6Vg3HR4qyboEuNs/fb5ewZ9QxBRzzs9KLUfcZhIUNnz9sQN
 NwdswEUGuD4CpGypn11S5ag0nlrx657B+sLeIvNT4gx2YB7y/u16f2ChUm1OMUBtjkNW
 zJl3c8SJ4EBq877O3NZs5dlIbxEOSI0rhqnCUgCyR8LhC02Wow4N806qBZmLAH1ycanY
 SE31bljjUfGyZWXcC4vAtfOdB5Od6SZQpwfhfe5ynONZ1oQVkhcu3DDkkqVPIMSSXsyU
 yh/w==
X-Gm-Message-State: AOAM530HcuWUr/HZRSTcAnmhKuWaYvobhhrV8F1EFz+cjA1HySoSs3o+
 jSR1xhr5HNE892TYZCQpRG9nrZMJZBpZVutKwnBOZCv8y9+TdhiAkFRPhI5U4iwfCnJgyFJxnDv
 yJNkompdijHjrOqV+NaM8Vx+wXEgi4ee5tx+JRYxAKZiRLBwrOQ==
X-Received: by 2002:a17:906:8299:b0:6cf:3847:284b with SMTP id
 h25-20020a170906829900b006cf3847284bmr19368260ejx.682.1645541994350; 
 Tue, 22 Feb 2022 06:59:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+ToxX03cNeq8vGzKfuUoRQ0zvi1K010zfig8ivZ8cYm8EVedSW9bVloWqWHnEbvwuSlDU2A==
X-Received: by 2002:a17:906:8299:b0:6cf:3847:284b with SMTP id
 h25-20020a170906829900b006cf3847284bmr19368246ejx.682.1645541994125; 
 Tue, 22 Feb 2022 06:59:54 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:59:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Yaniv Gardi <ygardi@codeaurora.org>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 09/15] scsi: ufs: deprecate 'freq-table-hz' property
Date: Tue, 22 Feb 2022 15:58:48 +0100
Message-Id: <20220222145854.358646-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_065956_444317_4DFAB585 
X-CRM114-Status: GOOD (  13.59  )
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

The 'freq-table-hz' is not correct in DT schema, because '-hz' suffix
defines uint32 type, not an array.  Therefore deprecate 'freq-table-hz'
and use 'freq-table' instead.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/scsi/ufs/ufshcd-pltfrm.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
index 87975d1a21c8..2b192477d158 100644
--- a/drivers/scsi/ufs/ufshcd-pltfrm.c
+++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
@@ -47,8 +47,9 @@ static int ufshcd_parse_clock_info(struct ufs_hba *hba)
 	if (cnt <= 0)
 		goto out;
 
-	if (!of_get_property(np, "freq-table-hz", &len)) {
-		dev_info(dev, "freq-table-hz property not specified\n");
+	if (!of_get_property(np, "freq-table", &len) ||
+	    !of_get_property(np, "freq-table-hz", &len)) {
+		dev_info(dev, "freq-table property not specified\n");
 		goto out;
 	}
 
@@ -57,7 +58,7 @@ static int ufshcd_parse_clock_info(struct ufs_hba *hba)
 
 	sz = len / sizeof(*clkfreq);
 	if (sz != 2 * cnt) {
-		dev_err(dev, "%s len mismatch\n", "freq-table-hz");
+		dev_err(dev, "%s len mismatch\n", "freq-table");
 		ret = -EINVAL;
 		goto out;
 	}
@@ -69,12 +70,16 @@ static int ufshcd_parse_clock_info(struct ufs_hba *hba)
 		goto out;
 	}
 
-	ret = of_property_read_u32_array(np, "freq-table-hz",
+	ret = of_property_read_u32_array(np, "freq-table",
 			clkfreq, sz);
 	if (ret && (ret != -EINVAL)) {
-		dev_err(dev, "%s: error reading array %d\n",
-				"freq-table-hz", ret);
-		return ret;
+		ret = of_property_read_u32_array(np, "freq-table-hz",
+						 clkfreq, sz);
+		if (ret && (ret != -EINVAL)) {
+			dev_err(dev, "%s: error reading array %d\n",
+				"freq-table", ret);
+			return ret;
+		}
 	}
 
 	for (i = 0; i < sz; i += 2) {
@@ -99,7 +104,7 @@ static int ufshcd_parse_clock_info(struct ufs_hba *hba)
 
 		if (!strcmp(name, "ref_clk"))
 			clki->keep_link_active = true;
-		dev_dbg(dev, "%s: min %u max %u name %s\n", "freq-table-hz",
+		dev_dbg(dev, "%s: min %u max %u name %s\n", "freq-table",
 				clki->min_freq, clki->max_freq, clki->name);
 		list_add_tail(&clki->list, &hba->clk_list_head);
 	}
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
