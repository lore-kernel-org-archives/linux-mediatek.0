Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A6EECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 12:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w1u1QjgfZ0N9sUT1Wc6TvU2kFDl3IhIVmb6A0VsNvkI=; b=vhHy9npmVo0GimgBNyXfPqnjR2
	7BejHjg7El8qYjhvWPvZnBAHBCYAN2GY2RO2fKapnF1gVyz4vCuBGOnawopD8atL9ihD80/9ujV7l
	cD59QH/FKduNfoN47Flgx+o5IlCNly9AAzOVszrYtQjrnDf/UzaBz0ciVdJAJIryEdThIFjWcM6kx
	I1cBk+jcrYc4LwoCURdYYwm09s53pv2Y2bK3VlM2zMtedYsb0k+aqE9nhsMUeKW8zwC4mryZMuy44
	vmZ07Pgga8u/SJ8LlRzlxBosjOwPEq/EwWmXyq9OSIBVxZhaeECZY8Pf543NxN2C4TyPOLttzsEKj
	EuhVokJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYRMM-00H7jH-Ub; Wed, 14 Sep 2022 12:19:18 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYRMB-00H77u-8e; Wed, 14 Sep 2022 12:19:08 +0000
Received: by mail-pj1-x102f.google.com with SMTP id o23so13116561pji.4;
        Wed, 14 Sep 2022 05:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=w1u1QjgfZ0N9sUT1Wc6TvU2kFDl3IhIVmb6A0VsNvkI=;
        b=hr/iMAUXe3d/YBk7uEmQUV4szBmzI4eJ6qlNO1hTZ5p/lVw9COZgEpBbCAVvmHt8Ck
         Ay0z6wAbj2flZSQEWv7hvx0OqD02MXK+lJS9KwzXrAkBt6apy3g9qyXvYjkCdLzMqVwN
         vbPK2kx6kyC4q3bdoeIIQOgUPMFHwSMuvw9+SIc4CzFquGWCWLRlaT1E3H128ldEAgHg
         VVtNHi/TNDPstbDNSgO8qhBrKjWeocYRFgA5DhWh7nt6M/FGzhPr4aGqQhYB2+JjMKB1
         /nF5Ts8VshdzLKGvd/+Py5j8Cj3pA+3m5GIeH2G4dDymvpIJtGQrwd6/TpkoCiN+vQ32
         Z9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=w1u1QjgfZ0N9sUT1Wc6TvU2kFDl3IhIVmb6A0VsNvkI=;
        b=NHWhlVwAqwcWeKhzBCS0q2GWD/hZNbEnpAk5e432+6rMrbG1vqw1bOTYNCRGt2jPHX
         Rbq7CKBQDKdlWMOrx4W51SxNOwClkYC9ieCdZjZf4p5BW4gwZOZjp9sBbiSiiKLMNEVc
         kWI90Ng433KlpeUfdaElTrVKlhaa8i3spjyCsHvvQE9vl1AsiNTBfbWpfTAYFwdgc3kI
         Dj1+KowZnbzNE28+nunhL9n+JIA1ONPNn0i0Orr651bh40UQqRY5B2JbB/TwLpNa5ufn
         y216zk9bZvia/0QRqe1XKZA90zU6xIzNS/kaiFCc7Zkv78RvVN7Wv56plMutDEmJr2z6
         ewHw==
X-Gm-Message-State: ACrzQf1ITYT6tTlLZkj20wDSdk+ugpKLiZb+lUw/pREUKKgyl8G/s1mu
	XjoAI+HbL5bS4GW9DRjlPyY=
X-Google-Smtp-Source: AMsMyM4sICcuIL9HdwoRkkEzyRd5zQpiv5IEkYNBp2LxG8TS3Tw3nh/DMyF+q4aySWwCKMo7B2X6CQ==
X-Received: by 2002:a17:90a:b305:b0:203:d59:6ff5 with SMTP id d5-20020a17090ab30500b002030d596ff5mr4503332pjr.166.1663157944270;
        Wed, 14 Sep 2022 05:19:04 -0700 (PDT)
Received: from localhost.localdomain (1-171-4-145.dynamic-ip.hinet.net. [1.171.4.145])
        by smtp.gmail.com with ESMTPSA id c15-20020a631c0f000000b0041a6638b357sm3844176pgc.72.2022.09.14.05.19.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Sep 2022 05:19:03 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: lee@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Cc: cy_huang@richtek.com,
	chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: mfd: mt6370: fix the indentation in the example
Date: Wed, 14 Sep 2022 20:18:56 +0800
Message-Id: <1663157936-5010-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_051907_337439_B04F802D 
X-CRM114-Status: GOOD (  11.74  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

Fix the indentation in the binding example. There're two redudant space
charactors need to be removed.

Fixes: 76f52f815f1a ("dt-bindings: mfd: Add MediaTek MT6370")
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Since v2:
- Add Fixes tag in commit message

---
 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
index 410e2d4..250484d 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
@@ -119,7 +119,7 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
 
-        pmic@34 {
+      pmic@34 {
         compatible = "mediatek,mt6370";
         reg = <0x34>;
         wakeup-source;
-- 
2.7.4


