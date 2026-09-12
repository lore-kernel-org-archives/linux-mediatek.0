Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD55C79FB6
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2026 06:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEwlHUG6xxFLN3/abf2x6jxnqPKYyOou3o3CHkkGDKs=; b=MbLgDOe7iCRwEP8ov7u1M1pHQC
	6TsVUjVyavA3TH9xmWorEFdfPXv7pI4EA4pwRYgGrbu3IHBsYfjia00n10nWE9V4r7F/m4OVS0olu
	xsiOu7Ly73Nl2ij+zRD4vK3mQUozzD4vx1PKm0GwiSuvLL7oQcsomH2MIlnBAmx18aPVul6OJ/Nhz
	GLKYVS0RIwSslHQsRppAZWZ5CkXyeT/gPoBfLtbbOwYdL/om5VAIbQUKWQXvPK1JTXIto/vIPk+wa
	dVJFE4E7fRPE6y/OQdGSG1aPbs3Wqjr/oPlhppazkB9Pl00srQfGutlRhJaqkoMXu6I32xN8siqpN
	rEaSjIyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HQ8-00000000aHx-2ZeU;
	Sat, 12 Sep 2026 06:41:04 +0000
Received: from mail-oo2-x0b.google.com ([2607:f8b0:4864:31::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HQ5-00000000aDs-02Nv
	for linux-mediatek@lists.infradead.org;
	Sat, 12 Sep 2026 06:41:02 +0000
Received: by mail-oo2-x0b.google.com with SMTP id 46e09a7af769-8049bae1780so510847a34.0
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Sep 2026 23:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789195260; x=1789800060; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEwlHUG6xxFLN3/abf2x6jxnqPKYyOou3o3CHkkGDKs=;
        b=hIrteSE9PTAE6Uy6/mTvGn8pSsj6kLGykLVHAK3hExIYmEiPYV4p8N8cYDRlI8tpXg
         zhbwi5E3VnSPQ4eZvwnkqb8NqETmS4+N09Kuu1o0Ltw7Bh0pQFqc1s1Vhuho3EBLF+FK
         gCD8yRaAIUKAgOW0Pi6To6/w2FPFQMwhgX/YXnSBxNhA9OTNv9dZp0crwmsl/0bNbbRe
         JbXMoZpuaVfELlgJPim0impkWiAzXWLbnimcPkRLcN3kn/bJ7L5owR4lqJovVLp+MCtV
         US6ha/c04cQMWOAjbs+omtLC63pKq33dx6395PQO/SFeAvxzeQvBiAzpsu6Pv2KQbSkv
         EfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789195260; x=1789800060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEwlHUG6xxFLN3/abf2x6jxnqPKYyOou3o3CHkkGDKs=;
        b=Dhn5453YeirzAwtTpDGTA5vqE5v6PqJHVefrIcB8H381jjexPM7PMRddmc+m6Q45ot
         cm6VAexYWz+IfDIYQXf+giXUAEadApes+LNeJ8bABjeoAKPo03ziuLYG4E6jLf0PLkTz
         0cbAbyNybd8JyH5ldosmjhSphF4q0bnR5QM0gsImQtIFvq+e7aH7eza8MmQ8bVE82zvo
         p7KVnT0YRbe+yez2tpy/4Z6+PQ0VbZ61nIeN1TXY706K71CTRMPw8ulT4AT1TFtbM2SX
         Y+jTIoflC9fk0y7xlPTIKKL15Ek1npjtU50ZmJk03rVPYHHN70OxQwOCZB97n5LmXsFM
         215g==
X-Forwarded-Encrypted: i=1; AKwUvBzgwN8k4RJsl4/lYHgWU7svASNSMsY31vYuiC7peeuZa7cUrOYKzWgrgEvIpcjYC0iXLxFMunKc+a0LSQ0Wfw==@lists.infradead.org
X-Gm-Message-State: AFuF++nJmcdUSzkDIKUzzhYLpYKNsyGqJCS3dCor6pSqigE7i04uB+xB
	SJvdIbrMoLL1DxyL1FwaoB5czt9G2nZyaThcaFAWpqvHdvQNHacDMp6D
X-Gm-Gg: AYBFou2n0MqG1IHD96MonWd4CMXz+Z6BgoI9Jzlv0dWHYqqeVDjau+l77hTLd/nKvy8
	e482QO+aiNlYBjGgM9viBruDYpxxGLgJ72kTxxBfyvnDhs+7oM0O2FkO5gconxckvzw5Jihloh2
	hhyLrVHDgncIrQy38mgnQHymUvZym5kyVgEzvvXFfOvUblPwnt1tp6Tw7UIOuMDaRraBoc57Zk6
	PrHeXe6ire6MAmvtnOh2Nlt8sFtTOiwFWfKK9eEB5RRxxFapbLs78tbd7rGWUM+0yz0uP/BmyEL
	aEVXoJDKtOrCcwN9Mpvvus/uXxAjDQitH4wrSB0LOHwYyT/E4p1+mLQAK6lhP/JHIwMj7gL5RoR
	iULDCcsXENuI1O6oVYei+IGQgudctirkQ+pwLlh9wAjiXXy8xQhu5seVd3nhQ+nU358b4fZ/e/z
	iY5mxnyW/v0giJl9qNIkOhtxC+EMl8b3V6lIhfozETwRBuV1oj/Do7HMSyh8WqCaNOFZw=
X-Received: by 2002:a05:6830:aca:b0:7dc:c749:ade3 with SMTP id 46e09a7af769-803fec021afmr5824842a34.3.1789195260056;
        Fri, 11 Sep 2026 23:41:00 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f670ec82sm4932735a34.20.2026.09.11.23.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:40:58 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sat, 12 Sep 2026 01:40:38 -0500
Subject: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
In-Reply-To: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789195251; l=1440;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Ql7C35Wo0Afw/TL/lX4BfvZeI5ogoZo8Mi0/Jvy5M00=;
 b=5WZnSsxv7VZ//QziiPqa/hfbDelv6xL9htaBXcHAb3pfvm74cL65FXg1wRmpJjS+un+7XrxzR
 0b1Eg+HGMxLDS2ChLkM0XQoGJWSx9crrUYJwUWFswZOuImDIHOPypUz
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_234101_063678_811FB24B 
X-CRM114-Status: GOOD (  12.54  )
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

All eight PLLs in mt6795's pllfhs[] have pcwbits = 21, so the FHCTL DDS
field is bits 20:0, but _FH() declares .dds_mask = GENMASK(21, 0). As on
MT8173, new_dds from mtk_pll_calc_values() is always 21-bit, so admitting
bit 21 of FHCTL_MON into the poll in hopping_hw_flow() can only make it
time out. The same mask feeds the CON1 write-back and fhctl_set_ssc_regs().

Unlike MT8173 this path has a user: mt6795-sony-xperia-m5.dts switches
FHCTL on for mainpll, mpll and msdcpll, with SSC.

Found by inspection while fixing MT8173. I have no MT6795 hardware, so
this one is untested.

Fixes: f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping through FHCTL")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 123d5d7fea85..ff01cfefc31f 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -79,7 +79,7 @@ enum fh_pll_id {
 			.fh_id = _fhid,					\
 			.fh_ver = FHCTL_PLLFH_V1,			\
 			.fhx_offset = _offset,				\
-			.dds_mask = GENMASK(21, 0),			\
+			.dds_mask = GENMASK(20, 0),			\
 			.slope0_value = _slope,				\
 			.slope1_value = _slope,				\
 			.sfstrx_en = BIT(2),				\

-- 
2.55.0


