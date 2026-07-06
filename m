Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAC9C43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 23:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gcBgjqeSOfuptOO3Y+Jfj7CL+AEDlaiqctCql/yUeXE=; b=YzTBpO7d/qFM9VE7TdVCDYNIX7
	kBrN+xd2u6D8zOQf1AfxmUU2+Tzs8soRAKbofs6K4trVq6Qm0TrvdBML1YOD1Mbe5PNGp3+WbFc1K
	vDgRD9/c2zeFXXaKo48ba/T7w+G0Vkixf4OC97lHOi+mxXSbHljxgw0+DI07zB5WaKneNzpEbP2Vx
	qfGPqwIHjMZDCjBYpYcRXEqhklL4yH3bfrNj8D2cIx/RoyAWH9PK+867flUk4ueSSwevf7IC+czLE
	JG0L1aVhDcDDf0hHWfbCAjaKGO5E+MwZsi6TbkDsWscGBKvATYw2fNTP0diBpz2YOSMhEdtbdw/J/
	CGf1d3vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgskN-0000000DnRe-2QEQ;
	Mon, 06 Jul 2026 23:29:07 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgskK-0000000DnQu-3KME
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 23:29:06 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-8efcfdb2b43so26608276d6.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 16:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783380543; x=1783985343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gcBgjqeSOfuptOO3Y+Jfj7CL+AEDlaiqctCql/yUeXE=;
        b=jGUA/qzsWQUYhXfHBoJSAs8MD+xWujQLDaEnpL4wO69Inu0V8wF+V8v/6Sefx7vdK7
         7AFA7lCUiUpf0Z628EEFlLeMOATxjXxrY5F0hIUCGTzVhqVYH5P1DKnk29lQasbBCSOH
         OFzertDGWkY0bAwXHL+8L+ZbnKslB2AzwztSRYGq3cGnZKTB6ze3vzpCZE60/jYtoixo
         6wZoAxiM8AeL8Jmi+Qi6Y5q0/DQL77A0/M/cIrg/A28BsB8gvOav101IqMErhRMcoPB8
         Lo/4NggTMToQi3Bm+5MU127Gxcy9y9sl7CUNnf6vczRGvHyL3D4cem0SWbd3uhsMEBMz
         wcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783380543; x=1783985343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcBgjqeSOfuptOO3Y+Jfj7CL+AEDlaiqctCql/yUeXE=;
        b=c7ia95i0bBqIyBT8R4rtDO7cVq4wjvbVWrcUzc2a9y3+lbX7I3GfzIj9CQOK7aHru3
         8iilh47MSgm97X5KoBJ555A078Wk6xFvN2gcsiWFqsngXavdfzXsn4uuFAS0i5PE259t
         uqDg8lKZlDIYvzT+ijnMoBQG7LaEYINeQ7IEcCQlpXMRTiH4pwS9HOvEUZguB7vArjr1
         XW33pPoC2QWY6vuyIluNTSuD+sxkkXhXZVz7GzPB/2vmMxinmgmZCM30G6U17BhwKlLQ
         C+Y+LhhHUc7vWDhm+e/PYuc1XgIt1JKfP7lnwf8SF4UzG57BlJ2rnxYEkQHJDUbBczR/
         s6xQ==
X-Forwarded-Encrypted: i=1; AHgh+RrsbwwTmwIK/bv7vFQgyy2tL6oGN05aMN1BnhpO5oxeUObxpPRS02lwZTWYF3VdHCfN4Dp32TyfeuS/WYllvg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe0HlQnvg1lbo7d9Us1HfIYYa5uaZNyqjo7Q05r/5em4sHYyWw
	iIQOpViJV5G0Y31dJVhbbdk1cI7vistuWpWxs8hxqyvUIcoGcnjGyIfg
X-Gm-Gg: AfdE7cnTzF5ZoD3WHFNqReEx+7G9Khl2uvFW9AES8REddU4r988jEYqOdX0S8eeO4xc
	41vWWdk+6VA7dyKScz0+4YFimJLzJuSD9zth60i/8jL1VTG3jvIHHzvC7ibFklpOqMJKqleZ+PL
	EOvf9r+QjWJkdK+ObRtfq/p2wQQRGbeiBBqf8Yx8KfzE7832LJvx9PKZnfvXT0DfMvfaDI+dBg1
	PBnqLwHd+oViFblHV9po5PQwH9mxSlbB3BwMYp3XsAxcL2JmvtM+i0sODdX5rAAH2v3yVr6iZ6x
	CbBPAn/uSYihezwvLUN7lPVzLhY39gmjOPhCIIZ/n+hKIaxaa7oztjjNAAW6plxNO9zQi0P/ZCG
	lUl+P5h4/sMNm2e2C9rO4ETdO/xvlSdR5vW3TdcWRqnRktBdBpkuVTLIoAm87bG27NTAXYHCF2G
	BSPG7mzCw0qx7P+KdJzIn3MB8hBwRySS7SvOGQk0hZt3qsEhNhLSEJeNreFIOnsVC5Js/XnGxRf
	2LYU0tiKLYfSYmFV710
X-Received: by 2002:a05:6214:5701:b0:8f0:11df:c80d with SMTP id 6a1803df08f44-8fcb56c8c27mr39823556d6.42.1783380542597;
        Mon, 06 Jul 2026 16:29:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f471de83f8sm148902706d6.33.2026.07.06.16.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 16:29:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv2 wireless] wifi: mt76: fix MAC address for non OF pcie cards
Date: Mon,  6 Jul 2026 16:28:57 -0700
Message-ID: <20260706232857.807044-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_162904_841608_5CAAE5D8 
X-CRM114-Status: GOOD (  11.21  )
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

If seems the check for err is wrong as the proper macaddr gets written
to from the EEPROM itself. Meaning checking err from of_get_mac_address is
wrong as the proper macaddr has been written by this point.

Reported-by: Klara Modin <klarasmodin@gmail.com>
Closes: https://lore.kernel.org/all/ajRmlyx_AEGybykL@soda.int.kasm.eu/
Reported-by: Tobias Klausmann <klausman@schwarzvogel.de>
Closes:
https://lore.kernel.org/linux-wireless/30a90714-02d8-45f2-a7f1-4cfe0627d50b@skade.local/
Fixes: 31ee1582717e ("wifi: mt76: fix of_get_mac_address error handling")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Tested-by: Tobias Klausmann <klausman@schwarzvogel.de>
Tested-by: Klara Modin <klarasmodin@gmail.com>
---
 v2: add extra tags and target wireless
 drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index b99d7452800f..afdb73661866 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -181,7 +181,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
 	if (err == -EPROBE_DEFER)
 		return err;
 
-	if (err) {
+	if (!is_valid_ether_addr(phy->macaddr)) {
 		eth_random_addr(phy->macaddr);
 		dev_info(dev->dev,
 			 "Invalid MAC address, using random address %pM\n",
-- 
2.55.0


