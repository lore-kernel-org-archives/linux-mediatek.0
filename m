Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EB1C5472E
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 10:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCMHxzrRAUFzpSiPm8CMwi63rbNv1pA6fVNc4IEznk8=; b=qVktAZE9AEf2zmmXUQqV6RWbWu
	0f43rztmbTMSei27bbFBKpVzmfOrA8Op8DN+6ZM6FiyR9eLjaFDMSCDzkmDSc/uDNuMC80GzgyS3n
	5/KPo2JcaZ2FIqdNhv5pRMjqU9IEmgQm8b0EhNh1lo6QoEDQhbkrOkyJSZ6SIiAe+XriHFlFYzK0u
	u1HXSe4uxVnU6OCn3FcVPY0bVCWVLzi+B7iXAT8He0KzIJH8whR75n75CEAaCgAasd+ORms7UDJUI
	64DWkoe4/9MhJIXBzJ0VoMYZ00idSCadI21mJ6KGQaRwqE4py6ZKdHgDymDm5SJJrhAvmm+HV6xOQ
	ncUUskYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWfu-00000006rWN-33J3;
	Mon, 26 Aug 2024 10:10:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWdT-00000006qff-1qN2
	for linux-mediatek@bombadil.infradead.org;
	Mon, 26 Aug 2024 10:07:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bCMHxzrRAUFzpSiPm8CMwi63rbNv1pA6fVNc4IEznk8=; b=hxLsuOQdYgT/8E79CaB5HVmm6N
	x6cfbH9vU4FDRs/YPpqVQR/nOE8RBoBGe9j3RQiVGwY1QiWJVGURor/nHbonHUuNzgoW215DiDhCn
	GcqJOVCD1ihGtfsQRtFnvzcOMuj2EJ9qQl9E90S0XXVmVOhW+lvjcqP0FIn5ERDWAmL2pQc/k66Aq
	FhFp6jPqPb8VvnPy1/If7eP517DMeMrNLy2fTuGPMPtzkvrEaCOQNmLlrjRAX62e7OBGSXq/PG5yX
	ixuJ1RWZT01GxGgzurbcLBYEZwuGaPDXjJ29S0iu7ceXTW0iADMcs+HpMfh+rxlEZ6v1WV6lYtOsu
	hE53w7fg==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWdO-0000000Ad6g-2Ixu
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Aug 2024 10:07:42 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37308a2ea55so167556f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Aug 2024 03:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724666855; x=1725271655; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCMHxzrRAUFzpSiPm8CMwi63rbNv1pA6fVNc4IEznk8=;
        b=gtgH6CLVVOdpB+DtyVQzwn6yw+ujnmw08vAEKNGhrpCqzoYOTcgXlnQMYRN2L5tuiV
         7Vow7fLZMdxSCuKhQvKE97jbmISbe/1w+Ro3wFC4hbDLjN91mbdFal48NPBKIteM+8Ov
         GIj18503EH2iHh4bhGljvEVKCQpW8NuyK19bYYrUK74gBsYmQ+IYrpw40Ejg/s2S6LM+
         M5ph7lUTWuIJB/kbGjmBYMRzs4NAt/a2K5H6MacP+FaHj80EYKuUiSR+kMzfrvveM1IA
         NepUmaywFf84lBw8rkNX1qAZBBxcgeP6WNhmSlbHssyuwI33cFloGt+2MGvlCOBel5VE
         BssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724666855; x=1725271655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCMHxzrRAUFzpSiPm8CMwi63rbNv1pA6fVNc4IEznk8=;
        b=f1pWiuuvesIIvNSl3BFuCeTovAzaUghxVd/sdo9LxS1k/zUtrMHnHa9mPB+sVjE2jC
         d5bc58bKfi8poxUWq7mN0kduSnDirnqrxr/dLKTKGs8GFEApiBKAGGrH2Xd0yVf/1L2s
         R/WO/xzByq/97J1eABSOnUhkXE4ZpczaeCKSVY/Z/N26gfrHXSZJKg1o4EefTuHlES7h
         ocMr8NgttuQs9++Q78g3OhFhh0y8sL6JONJt1fPw8PpRDL0A/RRzZY+vv2gcF2vpLrl4
         lLeStxyuau1lBxr+0w4BFQza0JI+c1liAQLwaM6tDy9oErbGwrkoR5/j8WR+qjFDnvMB
         TTFw==
X-Forwarded-Encrypted: i=1; AJvYcCWMYSmZjGoXuRJ9oF7krlQp6v1+mte9uCbZhdqw6npam3L82l4tF3eBeietQbNWVs52uHN7tizBNJJCMHYfTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5DthNqGq1h4fonkYUwFydIQafWpkF8qdJlua/ViwhrTQRPqLT
	FC7XeUGm0oNohxYlBlufhoI65A1xPvmXCH1bBIXHyF1sH04K8z5sAxI1I20+JZY=
X-Google-Smtp-Source: AGHT+IGDbjrb2B74Avky6eGU3oCwj+LoFI4qsrsHH0Pjzz9kol++o/r/gWi6qLtWjpZvcSj6QuH++Q==
X-Received: by 2002:a05:6000:4024:b0:368:654:932b with SMTP id ffacd0b85a97d-37311869b4fmr3577298f8f.4.1724666855475;
        Mon, 26 Aug 2024 03:07:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110009sm10324821f8f.18.2024.08.26.03.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:07:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 Aug 2024 12:07:18 +0200
Subject: [PATCH 02/11] phy: broadcom: brcm-sata: Simplify with scoped for
 each OF child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-phy-of-node-scope-v1-2-5b4d82582644@linaro.org>
References: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
In-Reply-To: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2420;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ConX1xoV1bzBjN+wlA70XCF5X6wLZIQ8hExvfXnxdUA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzFPaAeuDX82FFSM9E7GPDKBAAJHUMIGLxCR53
 Wk0I4/gdS6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsxT2gAKCRDBN2bmhouD
 1z/GD/4rnKh987w+rowE9WN5LMMk5lpIXrTDF1Oo6JkEirJ25CDRj2sQ92va/oAOeJhejh8xGla
 HlDBqPx+EXsaGhdf/ylIGJVhazNv0+uzaqTYc+gMkmRSFf+TWrYJY2bIeFYgOTcyhwizbUws4vm
 ASegTAtFMOWoeirXz+AehNgShieLrrYGKAm7JSGi+scXFZgQ/xn93v1TZ/M02QWkHcE//iGoroO
 fRm14dbzPmlc30IAvCpwkvr6G27AnlapPXqu2jK7cQzuNxsJ7IW/Wm7qP47DPGBnEdQdN2+FoWb
 ZlGBn8VA/dC1UqxtSxrkK93jlaDZgaFosf2E8qdjsUp5Tz0ylLt796ANXnnrIJchpjOcvgCo6BO
 pJlaTZLh3NSnh/MgaUkuiRV618lQAG+FLxOkqfOoCEkmPhg87S9ueikASenGqVYYhPafvWySuwk
 BS6/0kVFjq/UyGFUJuwtccMe1syDjg6utm3UzHgby8rU7IzwDg69lMPs06674gQ60SItOjDMEiz
 /z3dkObv88z1C6n8YUmcXrSsZhUDaFRS/7uX6rwCWB3CzyjyAcsUOmUcwRkbGzE9xfN1QUGVB69
 RdpwSzoIaQ5SqXhUuKz0q64uI6bSb0/Dc+nzAflvSdqqcLQ+zEHNdfLLE3KONoxjrMLCzZESSXx
 dDK+gMmEU2nLPxg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_110738_939889_BE7D3EDF 
X-CRM114-Status: GOOD (  14.44  )
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

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/broadcom/phy-brcm-sata.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/broadcom/phy-brcm-sata.c b/drivers/phy/broadcom/phy-brcm-sata.c
index ed9e18791ec9..228100357054 100644
--- a/drivers/phy/broadcom/phy-brcm-sata.c
+++ b/drivers/phy/broadcom/phy-brcm-sata.c
@@ -751,11 +751,11 @@ static int brcm_sata_phy_probe(struct platform_device *pdev)
 {
 	const char *rxaeq_mode;
 	struct device *dev = &pdev->dev;
-	struct device_node *dn = dev->of_node, *child;
+	struct device_node *dn = dev->of_node;
 	const struct of_device_id *of_id;
 	struct brcm_sata_phy *priv;
 	struct phy_provider *provider;
-	int ret, count = 0;
+	int count = 0;
 
 	if (of_get_child_count(dn) == 0)
 		return -ENODEV;
@@ -782,26 +782,23 @@ static int brcm_sata_phy_probe(struct platform_device *pdev)
 			return PTR_ERR(priv->ctrl_base);
 	}
 
-	for_each_available_child_of_node(dn, child) {
+	for_each_available_child_of_node_scoped(dn, child) {
 		unsigned int id;
 		struct brcm_sata_port *port;
 
 		if (of_property_read_u32(child, "reg", &id)) {
 			dev_err(dev, "missing reg property in node %pOFn\n",
 					child);
-			ret = -EINVAL;
-			goto put_child;
+			return -EINVAL;
 		}
 
 		if (id >= MAX_PORTS) {
 			dev_err(dev, "invalid reg: %u\n", id);
-			ret = -EINVAL;
-			goto put_child;
+			return -EINVAL;
 		}
 		if (priv->phys[id].phy) {
 			dev_err(dev, "already registered port %u\n", id);
-			ret = -EINVAL;
-			goto put_child;
+			return -EINVAL;
 		}
 
 		port = &priv->phys[id];
@@ -822,8 +819,7 @@ static int brcm_sata_phy_probe(struct platform_device *pdev)
 		port->ssc_en = of_property_read_bool(child, "brcm,enable-ssc");
 		if (IS_ERR(port->phy)) {
 			dev_err(dev, "failed to create PHY\n");
-			ret = PTR_ERR(port->phy);
-			goto put_child;
+			return PTR_ERR(port->phy);
 		}
 
 		phy_set_drvdata(port->phy, port);
@@ -839,9 +835,6 @@ static int brcm_sata_phy_probe(struct platform_device *pdev)
 	dev_info(dev, "registered %d port(s)\n", count);
 
 	return 0;
-put_child:
-	of_node_put(child);
-	return ret;
 }
 
 static struct platform_driver brcm_sata_phy_driver = {

-- 
2.43.0


