Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C950CD342F
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2026 04:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G8dG7m6dGz7quI2IVG777qTbZeQGQjj17FebKN4BjmE=; b=M7WDadWYCDuXXHrKgN9Mu43aS0
	UpnNQWeSw7VRggzZhErwywKi7qeE3oSsdoytATV6H7/TVxYKYa3ZkcF3ROLBpskTbUJLe91uQyE01
	/sIXTQPbiTTK1GJnKpMi/DQ4sDbcG6I9Ga5t17gtwI41nPkrBSx5UtW3TNdln01ELHi+oCqofH6+I
	SDbdskjEX8YPCIYBbghCfZ/V4mAXrxaJMcL9CiUdoP3HHFaA8mN1Fy87eETAqYQrsohsYN4WFH1T/
	B2vP6iIpJEpf437gcKrCXJIcB3oTbRfdX3/TNdItpNTuzLF6vQcDc+rZ3KetQ6ZJ47OAwLpI7m4e/
	wIOUTsXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLCoU-00000005WpR-29Yg;
	Fri, 08 May 2026 04:27:46 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLCoR-00000005Wo0-1TUW
	for linux-mediatek@lists.infradead.org;
	Fri, 08 May 2026 04:27:44 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ab077e3f32so7583785ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2026 21:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778214462; x=1778819262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G8dG7m6dGz7quI2IVG777qTbZeQGQjj17FebKN4BjmE=;
        b=sigFbTqKEJObqhN9H7qqX61G3yxm46lnh+1rUXDFzCcyHP2C1bVOhKG1AMO+aVc4h2
         At2CY7caiBnxRFKOFmPNMQOqv1PIk9qQq/saxWE33t4qVslgtCWeKSyxfICHNzQ9XEQp
         3ZkCyawurALU/w8h+vlKJPrr1rM/B0WKDVj4gAQmx7hWJQ/AUKdsnRXrSyrCr7bLqU/I
         TefkxLZAKHhtDXPVcztAC2ul0O/gwNtIoMKdpTdfdcrL5uZ2Mo2JDYF+yK49uWFmYtgn
         r0Lk4cX36QVp7c7p/8vNmeVLPWrVxGNCVAR8kMuH1RIr1LrLKpYZaeoXpsdHqJNM0nRp
         +eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778214462; x=1778819262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8dG7m6dGz7quI2IVG777qTbZeQGQjj17FebKN4BjmE=;
        b=cT0RXEl5HFzlslYVZ8BFEl5RLMjOeDDfXe1H6aatjqTENUicrtGT1omANkQuBtQr3l
         djiH9s/N9J3brDZjw0wyvpI67JxIp+jnNyuhJP5g4hoRjLWjQrGdyMmYLZoYV/tXQAFP
         ZHcZ0zBYlbGkkUSxH0mSozNfjZh5MLKTX9qwkLqQgVcBvPixZsnCwRgtQRdgfPr6iZcE
         uwVlaR3SD40R2ky0QG4HscwxHuMzPoLvtKhCQMBUhkSKTvk++QNXK+wk7jhKiCJUKsI9
         BDarcAFC23sIqc2Az2RclHj4jp+NEHarVtWRkuI44hc5PKXWmz+pTqNOYgTpS86MdS9g
         Awvg==
X-Forwarded-Encrypted: i=1; AFNElJ+AQXEI5ZexYBFXGqJBwUNCuKoGPn1jtgCINlUETJgADnxdyeVqSiIivEldvphEPVdDqMiUZEB/33BjqX4YJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUBxkz3wtLwMdjmmfm5FBkK7dtEYmSH5n97fLkLhxr7/GqkFTV
	pKei3XmF1ouhF4yLK5vjruQ4jUxyEOlnsX8Cw49KvOvBhN2jj5hJF8A6ZAahc0+s
X-Gm-Gg: Acq92OFhm8roG9M0iew8tHDJ9dWDvd7F1QJc6yBcIXJxlhOti/EzjRMS5t5RGSeNyCG
	sBOmgfYI3AiOQfrWxON8NNs4Oy8wFkEEvHnvGi8vwoYxXtJGreFbGKlEDnLqG/iMqVTIo7Wo0dr
	H+JwlFa6NSlB81Aq/rk8JD87dwZX5z72jQK43HznCcAoD/KeyzhUgoUU8JC361codrLcwmJ/Tcp
	9KNfJx0dtVW5M+GQf77Fx6plR48qM7tud2WLYtFoeSQeBkb4vQgY+tJqmO+PjXGldQXvNXc6mL8
	vG6BGgUBFRPRyh4dLt/s3EtAmR0wFcRuvgSP0actN6wCLE2MPNTlLGIXns7UFjp1GgXKek3OzyY
	+0XJNipoMyxW55SeO06aIERIPFF8qGgy4AUbj7jtqcyYJhcqy6GmQjy/y/Nm1zZevC1B+8Pvj9q
	XeFNu08MPIMjlj3RcYSwSuhFUp6Y0O6sspcoqvnbtXPFA6fMvyYX9xp/NKj1W+bKnnOw6ecJ3G/
	iwEEemRyx8juG8IMOqMT8vaxkZ3vVnc1+9Fe64mz8G46Q==
X-Received: by 2002:a17:902:e54e:b0:2ba:4eee:6c1e with SMTP id d9443c01a7336-2ba78e40c8fmr113612765ad.15.1778214461560;
        Thu, 07 May 2026 21:27:41 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eac3afsm5346695ad.71.2026.05.07.21.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 21:27:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] mips: ralink: mt7621: add missing __iomem
Date: Thu,  7 May 2026 21:27:24 -0700
Message-ID: <20260508042724.1719688-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_212743_382269_732647E2 
X-CRM114-Status: UNSURE (   9.76  )
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

raw_readl and writel calls expect pointers annotated with __iomem.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild/202211060456.cnV6IK6G-lkp@intel.com/
Fixes: cc19db8b312a ("MIPS: ralink: mt7621: do memory detection on KSEG1")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ralink/mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index a4bdda8541c0..ae7b8cfedd5f 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -63,7 +63,7 @@ phys_addr_t mips_cpc_default_phys_base(void)
 
 static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
 {
-	void *dm = (void *)KSEG1ADDR(&detect_magic);
+	void __iomem *dm = (void __iomem *)KSEG1ADDR(&detect_magic);
 
 	if (CPHYSADDR(dm + size) >= MT7621_LOWMEM_MAX_SIZE)
 		return true;
-- 
2.54.0


