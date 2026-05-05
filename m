Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782B8FF885A
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OCkbLWM0T7ihDsfGf8HM6rffZAvlpjoVa/cZRXt588I=; b=2LowFTsPC5iyqy
	DWDlTiFbEni3bGi2AStt6cJ7wBxOSub5DAQ/FJ0YN47GSYerV6GHZ6Uddhjy5TZyP5Epcr363UArM
	fi2dofPVN1ibE8JN5N9QZ616j/kKNJ7RzRcCsjbhL2wvWzljmdmyYNkgSNC/oe9a+EXq937R7k82f
	qLKtQQsI4LzMEZw+qXp8bHuho8apqzqPYMV00lA/Nw+NfDZR1kTvVuPdVH3z8Bw/5VOuRM/A7uTDe
	U5mKA/NrI5NACgjDYutsJJDGOyopUgmK63FOKBgERhXf2xntflDVZI1DRN6TZdrpCPhpnrwxfwVj3
	usF4qVad4+bzaT4rd7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCny-0000000FrZR-0OyH;
	Tue, 05 May 2026 10:15:06 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnu-0000000FrSP-2srM
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:15:03 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c80291e6237so1453377a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976102; x=1778580902; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCkbLWM0T7ihDsfGf8HM6rffZAvlpjoVa/cZRXt588I=;
        b=gyw6UPzhzyhvVdn5qoShOBYW9xKVsmjh4wMvZQOe04JQ+fpjz3sQvNNoBE3+t/1rvS
         nvZnzFia3OfA6CBHyxo32/lNeKW2mj0u8IJuh9HKSCWj8OyvjwAIVYgz2zgVJxgyy5Y7
         8kDz/txGEYkiCJ7FhP8sgI/F9+JLvJHMhtLbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976102; x=1778580902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OCkbLWM0T7ihDsfGf8HM6rffZAvlpjoVa/cZRXt588I=;
        b=PoaI8/GQy6SifPgYxBZ/DZx3uPWEiRedN5JIn56Dkq2qQ9mZnJZkcJWBG/Rt12Mwno
         T/6mTl4tREIdClJRvZ3/+iUbeT9qaqaBfy1Vyra/tGxEiPC2JzrUJSWz6N2LNngsSNBo
         IIiLDdOu6iff4gT8oVmXIy4Mkl2duwpp95+ytBNqGglQAWqPD8Qm8/rh26FbihXHQOeY
         b+LFK8C0hq8Tmw8nYCIexjmvRdmbr6RR6tbua+5LjropAR/mOD26ie2EDtax5pFGGojD
         6Xej3+OO/BXQfYxBT6hVnHTze5gURFVxDBZJugjAWmPqSy7nP0JaiA5NvtYQmfLEA1vT
         Bvbw==
X-Forwarded-Encrypted: i=1; AFNElJ8XQ8fMWzQsmm9as1z2lKKOGTzR9ZUdp3hIBA8fyEigrDyowiuEnLYD7yZG2+rjbDoYn6sUW2oi9ASFlGei4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIGZlb+V3qmLVbV2JbcSZ/fTpqmRQOU8NVkhm0MbT7jkXBTYjC
	NXqnVb1eYRTXB83pAkvMOBDg8v+Xa+HMEplhPDMln2FtK2I+blnXKzelI6AtLH/U8A==
X-Gm-Gg: AeBDies7/mwVSLOJOA5HQaZPzkNcGy6zPQvf9s7F76ISfO/AjxesghPQennwHEsIgX6
	ky4+uXgcEBMQQJHntq8IbXEEVbZSk8ozo0uf6P1+jQAoDYRM3r1bqnixKSk8xCy0iRKlIzsTIyC
	Izb4n7QZU8OYR97Y0oDUkRYown4WvjXiqGLpqii7XWw18kdcOfshM9DHaFkfIAv2WlvZlhIbl65
	GSaGEMYxk+h3+32n4rwdIWDd54LIPXIipJB+72SBV/7sk00MehRgn0rOX3C/ae2kbvaVOads+eV
	O/iCc4HcdQpn+SVqSB6vauVRGft6/DHCmf2yVCasddDIeRWJsUekrIRQDCmeGA0J8shMAyc9lH6
	DoaTZuDkSuGQYaHuIBhBPguuBHcUPxybpzupGuI2sen60xh+bJPQe/BoEETI1Cju1QbXzS8UJod
	Lgvt+pFCwEFUm2rtRKuF5Z9TiC4JRh6sE1GWoC1zmF57BcnBLDn6PVxAL6hDhKOGRXY81KGdqrb
	mym7dtgGl/BHUuCxxQ=
X-Received: by 2002:a05:6a20:a122:b0:3a3:3d95:507e with SMTP id adf61e73a8af0-3aa3b6279a1mr2621746637.28.1777976101728;
        Tue, 05 May 2026 03:15:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:15:00 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 15/16] arm64: dts: mediatek: mt8188-geralt: Add MT6359 PMIC supplies
Date: Tue,  5 May 2026 18:14:05 +0800
Message-ID: <20260505101408.1796563-16-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_031502_751250_5E823844 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MT6359 PMIC has a number of power inputs for its various buck and
LDO regulators. The binding recently gained property definitions for
them.

Add the supplies for the PMIC regulators to the common design dtsi file.

Reviewed-by: Fei Shao <fshao@chromium.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved supplies to top level PMIC node
---
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 8e423504ec05..d57e0eec676a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -1149,6 +1149,23 @@ pins-en-pp3300-wlan {
 
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+	vsys-smps-supply = <&pp4200_s5>;
+	vsys-vcore-supply = <&pp4200_s5>;
+	vsys-vgpu11-supply = <&pp4200_s5>;
+	vsys-vgpu12-supply = <&pp4200_s5>;
+	vsys-vpa-supply = <&pp4200_s5>;
+	vsys-vproc1-supply = <&pp4200_s5>;
+	vsys-vproc2-supply = <&pp4200_s5>;
+	vsys-vpu-supply = <&pp4200_s5>;
+	vsys-vs1-supply = <&pp4200_s5>;
+	vsys-vs2-supply = <&pp4200_s5>;
+	vsys-vmodem-supply = <&pp4200_s5>;
+	vsys-ldo1-supply = <&pp4200_s5>;
+	vsys-ldo2-supply = <&pp4200_s5>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
 };
 
 &postmask0_in {
-- 
2.54.0.545.g6539524ca2-goog


