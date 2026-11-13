Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809CC606A89C
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 20:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ISxDZf3a;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LyRs6kPv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6cKcdP6ZFsbUpqGoJa0cKoc76Hw0duCjesAc2W0YCc0=; b=ISxDZf3aCsCb2b
	D/9z0/Kv8zQLvA5q9vjwWxLBQF+JvDR365WKNBOoy+PQrNNDqpwsXOxI9i/R/l+I6efyCCiAkyaZn
	QzOpE5wz6EfJZB/LhbkdCGvF4pBN+b5MX0/4AO2NavNJAhJasacM3b32AidwKKVNndGN4x70n1zQl
	88v5fXmUE8Nx/4pVIOLT5akR+ik/rOY5uLpCA7EroGZjRC3TcNX79WQ/X/Rf44YcF+nTuP5AaFdIB
	NTIRRqdpNcQp7x8M+F0Xj0NHBZI+8htRD4BTfGvKj2BH9dKqVCz3YrH8X60wxPWFK+y/ptqLygp71
	YOYZF7qky+ZncwB3zqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxzS-0000000ER4t-0XIU;
	Fri, 13 Nov 2026 20:35:18 +0000
Received: from mail-oi2-x08.google.com ([2607:f8b0:4864:32::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxzO-0000000ER1p-0d5B
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 20:35:16 +0000
Received: by mail-oi2-x08.google.com with SMTP id 5614622812f47-5187c752f46so586252b6e.1
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 12:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602113; x=1795206913; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6cKcdP6ZFsbUpqGoJa0cKoc76Hw0duCjesAc2W0YCc0=;
        b=LyRs6kPvtSIUGgAa39N9aOuOimmS8wJslshu5NdVde3aROvX7/SiFc86gGHSNmSAWd
         LkonCMGRl+CjgJXOZBnfA4O111agfoJ+Iz607+8Ba88RJV/lyMP+gHGmHvzB0f1rtltO
         BNnBsm7QKPO6Md/TlkVg8ANW76cMpG2bVEzV95q6grrr0dll5nchbYMe43tlrs42zQ1x
         50PW9RLmVeLoE1I0yC+MgPg9jAUhGFZFioUpI2uOKviy22zFiA2rLWxOh8VVAFN6iDvw
         wBECDuRjSxI17TP6EIlJPEjI33VlvT8yJYGuhaf3nICZZ8LW8IAaiwqwFGCGnK+SACeg
         7pUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602113; x=1795206913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6cKcdP6ZFsbUpqGoJa0cKoc76Hw0duCjesAc2W0YCc0=;
        b=gB1TgkHf8c8xS2IJYgXwyikSmMK3dGHOLHULlXvdNXIx+5FrM76yGnFpmDowojsxBL
         cF89w1Nnzw671YrPquTNDUffWs9lQB7OoSGU84hnGzfXA4x/Jv2WnBmE3R/MxvHVv6ps
         iWHCTZrRwabe5jh3FoxuFD63apa2kh3io28x15K5kLV+Jj5N14CqM+U4hr1+W+06G9x7
         E4QOibaXLKMiqcFRlicz/qV8gLGZys1E9ru1v5TDzfjLQcKkowA7lGS/hOAGHD2GwNxm
         Z8ns6SCtI997qJme1iWo+HibmejdqEsltx7Xt/oE5n9DUcr1GPItVZlYUsdIK7h3gV/7
         ymWA==
X-Forwarded-Encrypted: i=1; AL+hErHw0jL6Pg1l9DseIs4dpKqU2gZbtfeigMx2hgCIFcf8rGq85C/y27p54EzPCpmh88cITEkqjEYNfceuMfUgYw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+8aUkVyCxtzhOo/FLpDyBiCely8PHtNOocJeJnWlql9oY+XCzi
	PVGCWUsf6gY12nwXYdSoxRopoXDy5qv6MaWACty85wLZCK6DlcHEpOBf8mHjfcm+3SaSAQ==
X-Gm-Gg: AYBFou1g67KE21pNpqUqxAKSeHzeii3zIOmbHs3Re+/cZSetkoFHYCKya4SfuskMSrK
	4huw5jBgfXSXMpDfUkGZC9woQ87U/KNhGt52lJvDB2g1/Jr08yUtq2F8lrr7gVlxjp7QsdSeShO
	TISsAQKboHklw+mot4ft+V+zP3dTyZHrSpaAziQ/Ww0NldKqoDuz1+uynqqjdrtzTRapZ+BfuXr
	vaANEW0MJskaSB+dnVEw1CVzCHeCKUvGBJZXb4KdcDcQxtrKomhoh881HeoQ4w3Agh94z+5/+in
	TRwbJ9tbCg9e0vHCNVfK8ueFt4Zw1mQ465NNmc7QnlzcYane0QGghjEdH+4vG2dI9DXyoIPPEHl
	TZS+2xgROxKXwq4ORBnTeDl1o39E1DTJlOnPFzKOR4OdOidA9LBQcvRnGAcbWBwUDwjcjdnCWRb
	GCY7m0Vhz//98cXPaD6pP0Yd29yS4q8C7T+dEFH2dVawgrBc6BlA8XG0azBZjO2Em3gCh/eVuE9
	5rYar+W4xJL/rkAH28aCaUEIy1RTLrusOM/ezdpjyv+maTaU9MDNaTcNVlIGYTFDCFw13z8N5AV
	01mfudxGwKBfNziD8Imq4DAT/yi5RIQPi4f9hiZ8Gbbv7rKdSwRnUm0pDRJOpAuxX85h/Vvb9qn
	a1rQfrKjJ0DxpFFI8I6g=
X-Received: by 2002:a05:6808:10cd:b0:4ed:7045:d3bc with SMTP id 5614622812f47-56e641d6c13mr3204181b6e.32.1794602113421;
        Fri, 13 Nov 2026 12:35:13 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm2712225b6e.13.2026.11.13.12.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:35:13 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 13 Nov 2026 14:34:55 -0600
Subject: [PATCH RESEND 1/2] clk: mediatek: mt8173: fix the FHCTL DDS mask
 width
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-mt8173-fix-dds-mask-width-v1-1-c8d1e3288df9@gmail.com>
References: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
In-Reply-To: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794602109; l=1762;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=+CADWjqc22AUSeVeKeNbBWk6vnVbnoxXOpZ/q/waG+w=;
 b=iLQXE6+fT67k/1+QXFmsj0CBbRIh+BBShAboAlWwKdNv6JETp70VldtQbm1fwLYVRqDFJsRNd
 EbaohlTqIw/A4R5rO4Jb0oapwZN+1s1+IeGmBrmEnDmvq7F1aGrFtC+
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_123515_277721_C3896772 
X-CRM114-Status: GOOD (  12.75  )
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

MT8173's hoppable PLLs have pcwbits = 21, so the FHCTL DDS field is bits
20:0, but FH() declares .dds_mask = GENMASK(21, 0). Bit 21 of FHCTL_MON is
a status bit that comes up once a hop has settled, and new_dds from
mtk_pll_calc_values() is always 21-bit, so the poll in hopping_hw_flow()
never matches and every hop runs to the 1000 us timeout. The PLL does reach
the requested rate and clk_change_rate() discards the error, so the cost is
1 ms of atomic polling plus a warning and a register dump on each rate
change.

Six MMPLL rate changes on an Amazon Fire HD 10 (2017) all time out with
GENMASK(21, 0), MON reading the requested DDS with bit 21 set, and all pass
with GENMASK(20, 0).

mt8186, mt8192 and mt8195 share the constant but are correct, as their
hoppable PLLs really are 22-bit. mt6795 is fixed in the next patch.

Fixes: 45a5cbe05d1f ("clk: mediatek: mt8173: Add support for frequency hopping through FHCTL")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..327240cd34fb 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -100,7 +100,7 @@ enum fh_pll_id {
 			.fh_id = _fhid,					\
 			.fh_ver = FHCTL_PLLFH_V1,			\
 			.fhx_offset = _offset,				\
-			.dds_mask = GENMASK(21, 0),			\
+			.dds_mask = GENMASK(20, 0),			\
 			.slope0_value = 0x6003c97,			\
 			.slope1_value = 0x6003c97,			\
 			.sfstrx_en = BIT(2),				\

-- 
2.56.0


