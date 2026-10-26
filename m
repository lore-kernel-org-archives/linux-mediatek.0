Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AA0606A31D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 18:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rup96MAb;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I/MwlnWD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=K0dSi+SfJKu/Kug/ygTHayPfRWfFTV7dvh+nhItaXNc=; b=rup96MAbHmulFXdLqQdbbvjwAa
	UQauHO37oAjn7GRjUn65clID7pZizsusJUKLCL62DM4qthS2TaMol8B8sqiXoCBVvEN5gpsOz30TC
	dZwXJF0Oc+i7JFTzww9umxzzsXONPlEw0amC0qdYEbiEZuW7VYHuCIy8my7wQE/yhQ/J/h1l1NPRF
	S/GM5w+K2P82rwfeJrp5+6EaTlClWuymBPCIk/bzCCOD9VEh2B0UQcFaqmx5WfORer9XYeEiW57Ut
	sX4+Jz8cT69gJ/TatB31fguTDvuQWRY5ee1+UfSswYkDaxs2nIlxOVI2W0T98AtBsQ81kYNBZMbM+
	1oo3TgfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPix-0000000362Q-0EPt;
	Mon, 26 Oct 2026 18:47:11 +0000
Received: from mail-oo2-x0a.google.com ([2607:f8b0:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPiu-0000000361h-2jmx
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 18:47:09 +0000
Received: by mail-oo2-x0a.google.com with SMTP id 46e09a7af769-820ff812cd8so609992a34.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 11:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793040427; x=1793645227; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K0dSi+SfJKu/Kug/ygTHayPfRWfFTV7dvh+nhItaXNc=;
        b=I/MwlnWDI2+5nMUKHbXqu+Ic1Oxmn4x+izUY8uIgUQwZVjDfcDCSVul3wEIduIajIa
         Lh9WhTcT79/m0/cx5EKIavVT+f3vEzvGJ9MeuYOPaCQlwtd1B5IEn5ta4+oCEAEpXAHj
         Z9/p898YjWwialXMPzvJ5vCnoskCzMhDe0PFusBW2ff2w1N5v2Y3/JyrVI9bE5RKEphS
         sYUZ3gXXEIZC7/PXQo4vU0SETbZR6MP7giVlTwq9lQ3Uz4n0669PFcHDm9BQgu2LE8EN
         xTrrWAOCgiVEGJ/8oZSz80HAba8snZPEibif8FPcmVWjecehtIteuUNoM6LBU1XPt3zK
         SzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793040427; x=1793645227;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K0dSi+SfJKu/Kug/ygTHayPfRWfFTV7dvh+nhItaXNc=;
        b=0ZvNHSBV2KVpS1CQuxDyIo8/pwkm6/ezixbbWCSNySunr7XXYQRFFmvBDRadKCBmr7
         BJJfrrUFWzLxoJmImadNnlmwTkIOnpzDRXVBL3FTRAF8sI2t5Gd4GuWRpJ5W/Zb21hBM
         6PrJQqf3Aln90Xgceoj9gLm9kd05pSkssVaf/mp4CdTFopPYUeVSVKXqlJaotP1rry2S
         hqok2cfKygx2yKyM3CST4vV6p/bGaucQWAnxBQ8NvDuiPquKa6j5mDYwrMsAcTmiDncD
         e2MGFFySzuxhGfzoZDN2X7GFgYy20/DCne6DJPSFYd88p2/1srJReaNu/WfxmE1eSpA+
         iw7w==
X-Forwarded-Encrypted: i=1; AKwUvBy36qZ/a3p6b6dW6gBV7u47ibeMHFHPpJxBZueClo/BxLokNxcCne3AhK3dhTf6oyqJC+/0OjUMykGqhP7ksA==@lists.infradead.org
X-Gm-Message-State: AFq9FYI8cSycfMnThP97/ltvUBddUH6/xeAe1i1bHaP1wyblvwvjjb0E
	GHkhStLwTVrPYNcQTJanYt2fb7RdbrgUhvVxKZNOupmmAQHYtQEpc9Tg
X-Gm-Gg: AYBFou2Erc7RJkwoXfAxQB49/6vXEaI6r8bpHu78ReZ4mIZog1BeXvo0TDzv55VeR3o
	itijuGcGLxCD0mmBEeGlwaCpVmcvXnVyceSISf7H2BgRm2qFf3g0KioiucDCc9K7O45s2pgwWCv
	5+5GMj+lJvD/WNsW6TXl1btvu8bhu+slLv4kn2V7gD/Z8bixawsIzcjh8pu2EL1513Vha97Rg7S
	zYJt7BOrdhXOPgKlidZfAmfqRY9RRvkDrnJkb2YUe3Uh1e3k0h4O5nlRwyTrtJw8/iZhI5J2SbR
	llXUSGYgCGLNU6x9yDmnZXCreaLGFvbdmaR+VwysrNJ9hC/Aal4eAus8GgmyzArjpMyhHqj7lck
	LYpk5n3TSpSi7fgkDtwMKKiiFNKzVr6Ixmx64xYcu4KaR8UQ3ZACimPVTp8QfJNO70xQpJp420C
	o1fnCg4c7sxicG/qCE73VcCEx/0SCvX65rl9rmhA2Ookm5lC3HGZ/P0r4hI5OGTcDjaPcn/CJN6
	rZ45fvHyJ4kuAI03ElRjTOSDi/Z/H7PDWa2PKn2vBVToefNR1y0Gkq7XvMC/5U5oq9/qNlQeDAo
	/r6gLcTt8+xenMl40MzM2SdZCPc+wyLT/J/4SNcZruJz8Q==
X-Received: by 2002:a05:6830:7199:b0:7e9:5022:3639 with SMTP id 46e09a7af769-850fe7e59f0mr5417002a34.15.1793040427069;
        Mon, 26 Oct 2026 11:47:07 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb64a8c4sm9452605a34.15.2026.10.26.11.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:47:06 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 26 Oct 2026 13:47:05 -0500
Subject: [PATCH] hwrng: mtk - wait long enough for the next word
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-rbrue-sheldon-upstreaming-mtk-rng-timeout-v1-1-551b4b6b4f86@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3NWwrDIBAF0K3IfGcgSh/gVko/Yr0xQ6sJo4ZCy
 N4LPRs4B1WooJI3Byl2qbIW8sYOhl7LVBJYInlDbnQ3OzrLGrSD64JPXAv3rTbFlKUkzu3NWhI
 3yVh7Y8wuXOLV3kMADYY2xSzf//V4nucPzSaWZXsAAAA=
X-Change-ID: 20261021-rbrue-sheldon-upstreaming-mtk-rng-timeout-ef2b4d517bbe
To: Sean Wang <sean.wang@mediatek.com>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793040426; l=1620;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=IuMYyT08pr1KbGdmcYeCjFIAs9aPWMDDQq2g+dBxKsA=;
 b=BCpb00G2sXtwWwzQtszJ4RUJd1Ta33TQmQcTVF3zzAPw45ys60thfOxpVhdvg3QQhvsHJxJ9z
 6H7v43IoIqiBTpDoHSkWDe9HxC6IzvLm5WkBpWdBPuigVdYwpCdGc8M
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_114708_689816_4F5A8879 
X-CRM114-Status: GOOD (  12.01  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_rng_wait_ready() gives the generator 60 us to produce the next
32-bit word. On MT8695 it takes longer: timed over 1421 waits, the
median was 82 us, the 99th percentile 92 us and the longest 225 us. So
most waits time out. A read that fails on its first word returns -EIO,
which a read from /dev/hwrng after a short idle period does more often
than not, and longer reads come back short.

Raise the timeout to 1 ms. Generators that are faster still return as
soon as the word is ready. On MT8695, 20 reads after idle periods all
succeeded, and a 256 KiB read returned in full at the same 63 KB/s.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Found while bringing up mainline on the Amazon Fire TV Stick (3rd
generation, MT8695), whose RNG uses the mediatek,mt7623-rng compatible.
The board's devicetree is not upstream yet. The timings were taken with
a temporary print in mtk_rng_wait_ready().
---
 drivers/char/hw_random/mtk-rng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/mtk-rng.c b/drivers/char/hw_random/mtk-rng.c
index 1f9793010e6c..8e3c99e5db3b 100644
--- a/drivers/char/hw_random/mtk-rng.c
+++ b/drivers/char/hw_random/mtk-rng.c
@@ -25,7 +25,7 @@
 #define RNG_AUTOSUSPEND_TIMEOUT		100
 
 #define USEC_POLL			2
-#define TIMEOUT_POLL			60
+#define TIMEOUT_POLL			1000
 
 #define RNG_CTRL			0x00
 #define RNG_EN				BIT(0)

---
base-commit: 178aff4cf425b3fc51ff09c571fa1bfbc1eb8ea4
change-id: 20261021-rbrue-sheldon-upstreaming-mtk-rng-timeout-ef2b4d517bbe

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


