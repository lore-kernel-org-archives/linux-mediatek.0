Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA77CA5FE6
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2026 18:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P6evII+OYGy4KorzI0D9PG9Yw6wuZMZhhjBM6jWvrVQ=; b=jqzjaeCLpwyRwZH9VmW1+6wazj
	ak8V00K/giLjMNjbos4bq9iHp7ZxIlHMx2u8JF0dX17cFm+Y1c4s/db0H2lglpcSKD9Mi2x3VDG/a
	ZgHL1mR6kXpLkL0qDKyEZ2O+YCmiJt7Bk15h1cBLxTVoVlzJe/8Y8I/ky2yV6RCcdhIwFNEcHL0e9
	YqtzYS37Q471wuLhJid45xe5mgYd+Q5/YyFVStwth+0hJrQ8r9ABkBQNE1vBzYBO30B/AEGivc+Bl
	pyvBK7AnuHHRorR9DRvsB6uAIPrmlAYQuamBHhSrQV7PTEgdsCKi8N5oLeQ/WJ2/tutvf+wr0IfO2
	6Bvyx/tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDRGF-0000000FBSF-3mkr;
	Sun, 04 Oct 2026 18:48:35 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDRGC-0000000FBR9-2xIr
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Oct 2026 18:48:34 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-3282db206d3so4074840eec.0
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Oct 2026 11:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791139711; x=1791744511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P6evII+OYGy4KorzI0D9PG9Yw6wuZMZhhjBM6jWvrVQ=;
        b=MCfN7MErIuup0HyYSVcbaYa1nj0dyV4WqiMjcz0YM/6R28nqajvGvMv6YBWTufWJ+K
         L71Akhf7ogKrJLke+wUB24m4sqLJl2dQv/ztfCWJu5MfdMhTEBKTAyRkW0h2DtoJO4w2
         BnEexTFHYEg7UwJva0K2HAq+PdP0GvZXyfkItbOZF2QdA2HMCqeN1Q0XozrgERDEGm0J
         HnFDOe4Wo2ZFwimSBshmCrsxcrpyslk7k+KxsW/+DdRwmIMTlsJ1oyTV2QwQ/4F2JSxA
         vwZdlEGgJyBA+zyOWHu+oNxK7D0Xa1QRXrv2tjgQviw0ZsIBydLz8B9Uq6HmCgzg9dRQ
         9k8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791139711; x=1791744511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6evII+OYGy4KorzI0D9PG9Yw6wuZMZhhjBM6jWvrVQ=;
        b=hb9riICx1uoX4d44rEBcXx+t6ABwgnCPNZT1WbHH0zXS8nBMD835XCFnniobFh57ca
         PpVIoki+22rVcT3uaDUlZSnS7ILhObnKcCdDjDSxZTwVh7ZEOgaRHcvFrQe7o1tHMbwL
         /UDUr6mdNoniFk0nW/YRknOg/zKvGQxnDDysNcFXidKr+k7ClAPxBesRVMzsl3iH9nlK
         vd5B4E2GrL4ZSI+BxFvUNrFC/Z7Zr/QMho4j4k7r8hMLpmhbDSbBu75InJxqlfV2Oq6Z
         QVbO+DyheWUBptmg8ICYMYyIFBIpvxRHI7MYTasVvDrUTyd3VaideYEPuWOikGkf9Py0
         IzPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlzyC/WoaBN5Ar3f41KxkjY0o/JPrf5etz0erTPlmnfCTMHIejltC55bgNkIqFujmjUzF3fQ+qZY17O5xhOQ==@lists.infradead.org
X-Gm-Message-State: AFuF++ma0n3GXCpQVpIT8KaNcl8pF6dtRkYDq8rp0QpJ/XS4xlutAnD5
	xOgfqf5BSR53OBJ/wIvl+aWe7QkEVkyXJ3aIae69kLi92heg0kSMBLUC
X-Gm-Gg: AYBFou2o6IXQYWUmE6Lblo2HmHyBveeRB/up0qtdKKiIAP4OZJ08rTaKth/+W5qqGiZ
	BAYgJWR+5Lmu08Q6zn17N8ECXgzJDRWv52kq40O9cDxBKqGOLfzG1tnbm34kFHka7LAbWDyxQni
	5YOtUBWs2BZCw/5N0pArqyQYxkAN89vXhDvFfn+OHubpXCmpOfdBzuwGCHbyUtiphtg6DKWKnib
	I3IF7sOZkm/co6uOki4q2KvpiBNDuflKbMR3G1bk3kzPM7sYjZnInXp7dGlX+5MpyYwYxrNOQ2u
	XJEdkVuJCBTnkPNHpt5abcqKATSO6c88reKrPAj/rgRL95TWomtmqlqUJeBplbkIJDrz+Uzy3yL
	BSsuyLw8A0GbvvTUflTviJan2Z2Ixt4PfEaYXpp+3YAcwjorjVoowEz4tw3BbyGmITpFGZ2goNq
	BYDb0NAQzXM37hm5UXoc2Vc6CIYcWvjUwsHfsoEkDZknQ9RkfaXjFKphyYVdn4LT9Ix+H8DJvn0
	koRQwJJHAMPMWc0F4AUVN5obvBC4NhRysGPv6l/KXE6tDA/6dj2wPNP3a+VpsTKcCEBU5U8H7IC
	7RvL8OJmOvW7dYxqGdpZEHRjZGQxIfLgRh5webTOrC43Sv9H
X-Received: by 2002:a05:693c:41c7:10b0:351:13b4:9c59 with SMTP id 5a478bee46e88-35113b49cb0mr6822345eec.2.1791139710731;
        Sun, 04 Oct 2026 11:48:30 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351270204e0sm7754374eec.1.2026.10.04.11.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 11:48:30 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] mips: ralink: mt7621: avoid casting away __iomem in wraparound test
Date: Sun,  4 Oct 2026 11:48:28 -0700
Message-ID: <20261004184828.31284-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_114832_755241_2D41CAD7 
X-CRM114-Status: GOOD (  10.44  )
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

CPHYSADDR() casts its argument to an integer, which strips the __iomem
annotation from dm and triggers a sparse warning. Compute the physical
address from detect_magic directly. The result is unchanged since the
sum never exceeds the 512MB KSEG mask.

Fixes: 4ddaf88aadd3 ("mips: ralink: mt7621: add missing __iomem")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610041411.uJXWXF8i-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ralink/mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index ae7b8cfedd5f..2d10c74b13c1 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -65,7 +65,7 @@ static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
 {
 	void __iomem *dm = (void __iomem *)KSEG1ADDR(&detect_magic);
 
-	if (CPHYSADDR(dm + size) >= MT7621_LOWMEM_MAX_SIZE)
+	if (CPHYSADDR(&detect_magic) + size >= MT7621_LOWMEM_MAX_SIZE)
 		return true;
 	__raw_writel(MT7621_MEM_TEST_PATTERN, dm);
 	if (__raw_readl(dm) != __raw_readl(dm + size))
-- 
2.56.0


