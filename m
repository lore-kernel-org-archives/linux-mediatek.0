Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881D7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 01:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6ZCB6ZQJnirr6i6ekX4oVzFi1s3r652BW/8KAXX1XGA=; b=gIHJHQb/ZsaXJl
	TfHpe2/HWEpTxDMx3zpfb6zQ1qXCuZVD+ZMUgjqCpgB6a0VE8hNRRFFSvHYg6RISTYRG8TdSzNBpV
	1vN+HPibBQr9yT+74SD/9HgvgWYm3mxjFTwQDq1f9sGvZNYOX3zc4Y022zxXWPMmFIPSw2Q/AXUHr
	9gnF7kayk0picelmY8zZfJ6ioVhYLg8kTcUiS41TiKb+WNROO84SNU+1zWKjF7VKfg6DaOptBVNge
	VvX0r3DI0nPvpav+MtxiQ4YPj1HjF+LuqNYHHdcLAnouxp0tTqO5F1luimkkaPu/YshCP5crVaSWd
	ffaO3uemHcDYqP7gSX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOr6u-00EZ3L-9Q; Tue, 01 Mar 2022 01:15:28 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOr6i-00EZ1O-Cd; Tue, 01 Mar 2022 01:15:17 +0000
Received: by mail-pf1-x42e.google.com with SMTP id p8so12692997pfh.8;
 Mon, 28 Feb 2022 17:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L2N3D8QoxsO13zBELM1/Sh7gQDfV1csfU7R3EV5hbjg=;
 b=jAjr++urMjFqZOxqosIYjxZh6gr09ljDTG1GcyPszajT6UIGE90xMe7xV6+f55PGi2
 IMZc9keMiMgldlUik5lDaR5dXJ6eR6XabNDMP4QrBWxFqO6U05csb0Eq4VwPwwMdugLZ
 hs5LLsgh16882JU1xpHVR9sOMA9kyhfptrn1G4t6Z2Ett1i7nLbnvqZXc5Ylv1IvPl3F
 7+Rrb9YLS9Tcxfp4JCQXWZHFYkRp+G/Wgt/rXfO3bUMP0WsA22q6kHoTZYP96a3jfeWA
 Itp3CWib/DQ0QNjvpEhkCT5wlCDekPqamgzuSQS8NGJFuTfWcedAtb1HeLbGPF5TY3Fu
 adUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L2N3D8QoxsO13zBELM1/Sh7gQDfV1csfU7R3EV5hbjg=;
 b=6nVgw3MLYYi7CzVs1BeknTs/XssoUSu3Q3UB3dQSm7IxXnanmcrqbCZLRHqg+ve91C
 5r1hWIHZyOAayYcQUEM8rPJjxGzByImN6TG1Eln2fiGjmm0/tUjrzuj3ag7ksaCTym/G
 ZVG8lWWUkVWs91rRaethW/EoltsExeYfWXk1w5dudVSGAB5WCLsvcHgTkYecoeEr1IkJ
 ilQIM82rM4E+eipsYiGjHrT4CVlp2TaOQF6d+uscS8ICjoIVkrO9ESyM66Maad7Ndjtm
 vvAxp9jmi5f6IvFxW/xtQWKRp6aJ3OdnDvmkRd5+zcVvniWS9OJeHcYyjoX1qoaU6Ijz
 Pqeg==
X-Gm-Message-State: AOAM531Ldg6Tr3Nsegxhz3qoQ4+aw6z88MgCspxXx9ye5p/y0SC01gdj
 /IQXm1JLVeQVK5V4o7FnvQ0=
X-Google-Smtp-Source: ABdhPJxuSyD3s5Dsiwi+BWQ5j4La3ZVUYFJ1aYPfrdAjAX1pB8xBzusNoaInIh8eZ6Dix6xZPtQqTQ==
X-Received: by 2002:a63:3e45:0:b0:378:c5a9:abd1 with SMTP id
 l66-20020a633e45000000b00378c5a9abd1mr3770459pga.25.1646097314412; 
 Mon, 28 Feb 2022 17:15:14 -0800 (PST)
Received: from z640-arch.lan ([2602:61:739f:8300::9d4])
 by smtp.gmail.com with ESMTPSA id
 z23-20020aa79597000000b004e1bf2f5818sm15568633pfj.87.2022.02.28.17.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 17:15:14 -0800 (PST)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: John Crispin <john@phrozen.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: ralink: mt7621: use bitwise NOT instead of logical
Date: Mon, 28 Feb 2022 17:15:07 -0800
Message-Id: <20220301011507.15494-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_171516_457110_3AD5510B 
X-CRM114-Status: GOOD (  10.62  )
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

It was the intention to reverse the bits, not make them all zero by
using logical NOT operator.

Fixes: cc19db8b312a ("MIPS: ralink: mt7621: do memory detection on KSEG1")
Suggested-by: Chuanhong Guo <gch981213@gmail.com>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 arch/mips/ralink/mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index 12c8808e0dea..fb0565bc34fd 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -69,7 +69,7 @@ static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
 	__raw_writel(MT7621_MEM_TEST_PATTERN, dm);
 	if (__raw_readl(dm) != __raw_readl(dm + size))
 		return false;
-	__raw_writel(!MT7621_MEM_TEST_PATTERN, dm);
+	__raw_writel(~MT7621_MEM_TEST_PATTERN, dm);
 	return __raw_readl(dm) == __raw_readl(dm + size);
 }
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
