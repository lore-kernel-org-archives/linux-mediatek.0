Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06030CD8CA8
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 10:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vWBjerCcdQYX1kqAzoQ1GBFmI7LAy21K3qYQTp/XVXQ=; b=2miGos1z3DqQ7S
	h8JKuFc8TCA/ew9Xjy2g0B6rJWlukK1fAmZu2Pq8AIAdErvtsdleP6Nmq7vdVT7MHQgkeUzOkIn3j
	j9HZQ746nXg9ejP81OeOprqUot4abVF7B3wbd8T3JxVYNqSmGYMOs3mbXb9RmtDmyz/xYwjsQzVkZ
	d/xgNc+OyUkvLuH6/XFtdI6SQYHeeAnnHpqHYlyZyafY4Z9XPRgdj9SJ30YP7djbfdpPdZf+3hQGS
	Qbx0bSYVKMTay1pVjagsb76MKoduyCdWReuqNSDueFNjmFbpm9KA0HwQoqPLDRmEAqvQAvx3s/nl1
	4cU8TUI3fs5am1qDf/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXzWZ-0000000Am1T-47uU;
	Fri, 12 Jun 2026 10:54:08 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXzWX-0000000Am0r-06Ib
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 10:54:06 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso7680205ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2026 03:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781261644; x=1781866444; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:subject:date:from
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vWBjerCcdQYX1kqAzoQ1GBFmI7LAy21K3qYQTp/XVXQ=;
        b=iPXTaEaaChKEVfyrlmrguFczOUGOcXv16ePV7YA6iDG8XO9xldpikAx+fQW5UaNucl
         kKdwPwRXz9Sf4vjx29Tz1AKEBX0qRkbYRMVCX4SkQvKt608Swb+ZbTAR2G25o3ih/SuV
         26xy/YF0dyB43qHlx56rLTr5MegIOy3EZ3WHucR/5G1jIH0mowVeeX2iHVPsAxiG6T+/
         DrbagsQDzL2m5MlP1qmivC90jmC+HQ9wAGeQ3uOyEbZUNQ5vDeepMPSy23WXGL2l2PZz
         NXLfeTsokrnErv5aLp8RSALrodBR1Lyix56RMqkH/1Si1iUa3qifsMBv1TRLUs4gWMqf
         YwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781261644; x=1781866444;
        h=cc:to:content-transfer-encoding:mime-version:subject:date:from
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWBjerCcdQYX1kqAzoQ1GBFmI7LAy21K3qYQTp/XVXQ=;
        b=Xkthw0kF+yNTyWRjhKV5f2tlUEMlNUHTwoq7xrf07P8fxOH/pNM1CJvfJlCaz/Hw1T
         z8MbD51rgrkdhNYmMsZECPUuNF9LlwaQgBZwGbblsVE1J7Aeg77sQf0HFXPRSJDIULSo
         BYrCcUqBbpLQMP/O/7f4YneuA8o3D8cIQ+ncy+2UgHwj1uI+/O9WSChc3kO03K9jsiT7
         G4Phh9IIbZRL+9K4cbB7q08nktcbzkfK66SGjcFDv6+iodZP6Lv6hHdqrPdXwFTk2RJo
         FvVWDo8YROLbLeJ46OAwSj3YWxcH2zLdTg9dQF90j/8k3TI9vjPJGecyydHWwJ2E67nM
         M2hA==
X-Forwarded-Encrypted: i=1; AFNElJ9gMCFlFn6AuWvysCPfhtnAXCvJj2Zdg+RSbpHIr9aqjApABjoFfKaYNBIFuLdbo1/93rspMm4kwh6a9Y4Zrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwouP52I2fMctl0ON5q7e6KyRSPNgZLEfj08X+qGk9vkvb3baZ6
	illtJZQF/RQYdP8erNpiXvnjXiwu6d1nsliFCr8mBoUy2whzQ1XqMsrI
X-Gm-Gg: Acq92OFnEm0q0zfZ9TEFvQ1Nxug1jjjqALcCr0si2fmMl1c18NYz9j0V4wEHXRqqNDY
	pJ7IH6AeBMvMAvbXvzbf3rLCppZBV4wbUuBxuGBuCuatM4liqKuaOJKVpENeCLL1x6wXqH/ZFYk
	dc9PDij5s6dOh6KZADwuzuXlf7ly3aGrug9216vb+EoqHJgx7eOvkR4qH/pcr5JulN/QNRNZpFb
	XnKv+SOUhl9AWP0eC/5upEZ0BtRZmxDSsp8O7qD6TWPwWUC8GTh8Ue5eQQ1i49Oo+Jroen//ULV
	CtrJhpjUXl2KSTHBUwnrBZ2t+X5lH6qB5D4e/pd6SqmNwcnC0Gf1d8h0RxhDoyp+LqwynULItFS
	B6lSQ0tVP45JKRHAZiQJ1JyaOLttdq7lZaB6hcOEyHcjrPo1vjBB2FJqu8dOFzBUJIHOIRZsUnJ
	af1IXGL45suLzwkyM5BB+4AIM3VRo=
X-Received: by 2002:a17:903:1aad:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c41050af58mr30846105ad.5.1781261643919;
        Fri, 12 Jun 2026 03:54:03 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ce89sm17909875ad.57.2026.06.12.03.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:54:03 -0700 (PDT)
Message-ID: <6a2be54b.ef98c1b2.3c3224.2ed8@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Fri, 12 Jun 2026 07:09:56 +0800
Subject: [PATCH v2] net: airoha: Fix debugfs new-tuple display for IPv4 ROUTE
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_035405_067584_E3C8F5F1 
X-CRM114-Status: UNSURE (   8.56  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In airoha_ppe_debugfs_foe_show(), the second switch statement falls
through from PPE_PKT_TYPE_IPV4_HNAPT/DSLITE to PPE_PKT_TYPE_IPV4_ROUTE,
accessing hwe->ipv4.new_tuple for all three types. However, IPv4 ROUTE
(3-tuple) entries do not contain a valid new_tuple — this field is only
meaningful for NATted flows (HNAPT/DSLITE). For ROUTE entries, the
memory at the new_tuple offset holds routing information, not NAT data,
so displaying "new=" produces garbage output.

Display new_tuple only for HNAPT and DSLITE, and let IPV4_ROUTE fall
through to the default case.

Fixes: 3fe15c640f38 ("net: airoha: Introduce PPE debugfs support")
Link: https://lore.kernel.org/netdev/6a2b40ea.4dd82583.3a5c46.e5a2@mx.google.com/
Signed-off-by: Wayen.Yan <win847@gmail.com>
- Drop redundant PPE_PKT_TYPE_IPV4_ROUTE case, let it fall to default
Changes in v2:

---
 drivers/net/ethernet/airoha/airoha_ppe_debugfs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c b/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
index 0112c41..e46a985 100644
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
-- 
2.51.0



