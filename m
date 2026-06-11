Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44D1CD98C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2026 23:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fij/oQvu/2UXmQt0RzKkHVGLvKBTwVHkKcJT+NiS0dg=; b=ArLs4Lt1Qjua47
	Qhat/qjHkx/AzyTiSXY/XJ6zU9mp1QWBiYctzHtTHfKboFpoDYaHfVeXNOZjqBxSX7l/hx/3Wpbl+
	K7sOdF7uBEOsQFSh62TTUbT4wy0J04fRvmfZk3RMsHZV2v+rq05+w9K+JTbhoP+Sfn6LFMJtggsGh
	VO+RAVcPk5cTNUImU/xvSjRZDtO5pnL1SzkGiICOhdTl6jhpoBpCUZU05MQ0mJbbkWyeeu10QRV8u
	v3Jwu7Vd/kaYwhIiCvGyR19H0Mk3m1RDZ06GedB/1/UvvW4iBa2K461XwZ/9u1Gd1DV4dUwCWy6Y0
	B8/jjAQ7PQR9UvOLZjug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXoZr-0000000AA9q-3OV1;
	Thu, 11 Jun 2026 23:12:47 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXoZn-0000000AA6O-3NMO
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jun 2026 23:12:45 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8423f1d8902so239832b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 16:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781219563; x=1781824363; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:subject:date:from
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fij/oQvu/2UXmQt0RzKkHVGLvKBTwVHkKcJT+NiS0dg=;
        b=YqsKgKnCes1bi3clZt4nh+XT/dspSawe1cKcKdnHp9CApbPWrM7lJDZIyyBhsJnMjX
         cm75szyAMx9YShvF4iyKtRPBI/cP6z8Gk9C824OH/S0ySdFwgM911pb19WXC26e7kSPt
         Ykt0l0rpeOP8jA/HI6EClw1MkTU5ScVzt1+vFDoYd8oArdG8+TWKutKA4qD1m8vpglxR
         u3hkRNQWX1FPX3jTYjXCm9+sPSArHxqLCbmvvNs+CElj/9cQTi8U5iOklYRb0Y8gxnTN
         GY2Bil1cqHeF8wIFALCiD4/oVXbp4cfwUE6KYbWfASVy3/D08JSnHKujygltdt+cIZCO
         pA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781219563; x=1781824363;
        h=cc:to:content-transfer-encoding:mime-version:subject:date:from
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fij/oQvu/2UXmQt0RzKkHVGLvKBTwVHkKcJT+NiS0dg=;
        b=Vmjz5t2BC7wFUBTjef7d3OncgltbSOvh3mMZuwJvdvXWsRugU9qslaUi+CdgxYw44B
         uyw2t8Ist9IOybfx1WC7HYm2vqJulY3x7dFSmLHre7xnxxT18KBLdu3APSYBSR7gOoq2
         CtCjE9M5ru04YPU03ye/C/aKAe1/K1QRAncFmG3vuSr9AL5hLbohvSKcwCYIXUwIkJKZ
         kzxTRMkYk0M+39SJ9WWI4Xl/YnaMMnY9OALFjapeooF/D1UkaCChCEtWdCzU2nKMP1RK
         ytB0trtlv90WfxRDVqW63HfVw49s0OPLujuPaX1kCYDchFRg/5sO8M7IOki/KeMZLiRX
         tn1g==
X-Forwarded-Encrypted: i=1; AFNElJ8HEMFQMbANkt/XimJFImgQ30+uR93LQTLNTb5EXBOHL0XCtIxhVWDgJqHEEtcc0tUNfZE8XHbt9pXaQFi0BQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfG6bDvVtwMS3P1a+J1l/2R2S+zQVC21DeOg6k6plkMwCd20v4
	21sB2vBEqlpMWpWdooPFvwzFtOEM0pPsy11SwVhWURIh1rB/u0gIL1GT
X-Gm-Gg: Acq92OHd1X7bhy8Lv7spdRO5FXwYGGfBiJyKtwF8cn19KwvQ+e6suuFo4XfLjosI+oW
	Gs+FAphEoZakxEMuzYc4OMaccrRw8vTpL9BDwjGVu99pTnwFIBzY7Kzk5kd/oyvoZmbP+9ws+ik
	EvrvDQNtpUU1kwaYEDhosMlTPygAreHD+SJyq4VhdiLzS+Tx+HwENDKru1+TZ+n8jTXfpxWSHz/
	r8cUeFWyJvUSKdvYKFzFVUsyZVi10nqXGtiR0VZEyVyWrRuQssJyfYH6kOiBdCDj5p4GUt7CRYJ
	EayMRsymP2AVT2klZ0uwhZHZzJjc5j17OJLdmZgK6PQ56wnUjxyYmVQPzcjtaT1bMJUxuXYaVQl
	CeNr5kzQsLK/c/n3h617DljXnyUfF/tTBgbTiZf7VZ+XN6whtVyrnXvNiYx1gHo45kh6BnzZ/qG
	bBq+E1FR7ppfPARBC/
X-Received: by 2002:a05:6a00:2351:b0:842:5712:c2c2 with SMTP id d2e1a72fcca58-8434ce5eaf1mr123505b3a.41.1781219562783;
        Thu, 11 Jun 2026 16:12:42 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd100esm199571b3a.34.2026.06.11.16.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 16:12:42 -0700 (PDT)
Message-ID: <6a2b40ea.4dd82583.3a5c46.e5a2@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Fri, 12 Jun 2026 07:09:56 +0800
Subject: [PATCH] net: airoha: Fix debugfs new-tuple display for IPv4 ROUTE
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_161243_869389_0BC0F5C1 
X-CRM114-Status: GOOD (  10.07  )
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

In airoha_ppe_debugfs_foe_show(), the second switch statement falls
through from PPE_PKT_TYPE_IPV4_HNAPT/DSLITE to PPE_PKT_TYPE_IPV4_ROUTE,
accessing hwe->ipv4.new_tuple for all three types. However, IPv4 ROUTE
(3-tuple) entries do not contain a valid new_tuple — this field is only
meaningful for NATted flows (HNAPT/DSLITE). For ROUTE entries, the
memory at the new_tuple offset holds routing information, not NAT data,
so displaying "new=" produces garbage output.

Split the fallthrough: display new_tuple only for HNAPT and DSLITE, and
add an explicit empty case for IPV4_ROUTE.

Fixes: 3fe15c640f38 ("net: airoha: Introduce PPE debugfs support")
Signed-off-by: Wayen.Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_ppe_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c b/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
index 0112c41..f9c12e7 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
@@ -121,8 +121,6 @@ static int airoha_ppe_debugfs_foe_show(struct seq_file *m, void *private,
 		case PPE_PKT_TYPE_IPV4_DSLITE:
 			src_port = &hwe->ipv4.new_tuple.src_port;
 			dest_port = &hwe->ipv4.new_tuple.dest_port;
-			fallthrough;
-		case PPE_PKT_TYPE_IPV4_ROUTE:
 			src_addr = &hwe->ipv4.new_tuple.src_ip;
 			dest_addr = &hwe->ipv4.new_tuple.dest_ip;
 			seq_puts(m, " new=");
@@ -130,6 +128,8 @@ static int airoha_ppe_debugfs_foe_show(struct seq_file *m, void *private,
 						       src_port, dest_port,
 						       ipv6);
 			break;
+		case PPE_PKT_TYPE_IPV4_ROUTE:
+			break;
 		default:
 			break;
 		}
-- 
2.51.0



