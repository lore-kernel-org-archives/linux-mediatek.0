Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAEC606A31E
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0vK93ylg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DzfcOxX/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-Type
	:References:In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nO5pNbEMq4ckZkkDrDFMXKAQltbx+d+gHgPNIH42jTs=; b=0vK93ylgEaB7+ZgeZ4FMr7xK5A
	ZbMRzJaTXYleUQV5l6yHLN2a1RS+OHv+5nV2FNFF8oXELVLY1mzM3cVcmctJB8mku52kp4Rd80Mh0
	waFIwJKXYAYby/RK54yCjiaB3lESv9t/1a4kzq5nI4E2Z+q2Sv8+F+QK/7TzTPxcBMtl7awfX0bXM
	kP+Lt0mKMxivWCK3lyAbFor2OtP2oukVPploJyJwzE2u+0h3vg+p+JHhQe/y02BYXWPYEY6sh8elv
	dA8G50qwnUX3JpgjROZcbAGQqjGDbMWmHtL30sF6zEcKpY27tOiHTS7cSahxPkXE0GNvd1pcEYytj
	gc7e9ZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvxf-0000000GG0L-1EXn;
	Fri, 27 Nov 2026 13:25:59 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvxZ-0000000GFxx-0yud
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 13:25:54 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so3268760b3a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2026 05:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785952; x=1796390752; darn=lists.infradead.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nO5pNbEMq4ckZkkDrDFMXKAQltbx+d+gHgPNIH42jTs=;
        b=DzfcOxX/W881F4yj8sbArRKMl91jHnqngFg/GNEqmnVJpSwdw3YTwQK9T5YkcIR4oM
         cpCXJDlB0sps3YSuOiAF1bO/Af0WK6cb/2bv6gSe1wQ7S4k47yOezaFb16UPSiMbWrcL
         2ZNMqtI0le69hpLedHynevvN0CXFuh8xVeqkFBYadHcP7EfUTg2epnOp1KoPqNIAgW9j
         NIAizzctSLPUVH+/vX6tyghRcxa6O+93l59lLs5gZx0pwNQdWov4qwIPwMHYhLSVgM15
         q+mfCHto0bts8r1DerjjAsmfUeLf1m3vHwRvYKdWziQw9gzAxNNw6bd1UqjbHles6dLS
         lqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785952; x=1796390752;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nO5pNbEMq4ckZkkDrDFMXKAQltbx+d+gHgPNIH42jTs=;
        b=gExgL0+DC8jG63Gmg0cnJMJo0UOiEfoPjjYmV8zOjP5jVhF9lDiqabTY3tANV+lM8N
         P0aNQPF5ISNoeJsE0/Qkscd/KT39x6SsNXDs+mHm/o8E89ipwxled5lG2oHnTLQjCOfs
         QG3nh3O0dB7M0Fx44lKG7Qfo98EsnkTPUhs9ElxwUUMQwdJcuR1UtRjRmynUWKzt6U8b
         +FC8byOpRLrygTQLDk7qzrIMIwrD/EZAeP82AZsuXBjVj7dbXr2A7eod5k9k1rR2acRj
         MybZsvs0lIsIK8MDx6IIeiztZ3PN15LLwgnAu2Ec+Tn2bxMnPvoeBwI5f/pMtmkMYy6h
         yljw==
X-Forwarded-Encrypted: i=1; AL+hErGsCdfh8HcEClLqd62uY7iO+pssHioweW98TDZKHKi4wrtBN9BHOIJtL3/aCpHC1PV9+1W28gEmImjW1sGU8Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Q559HYm2UIp3cXd1m14hDGnnmimcM/wbJ5rshwcBGmGVwwyir
	ZcYCHyefeEsi6F0wpJGTORTzfevD5lL/iK0tKBnqFZjMVznKEKkjwLkfmBIWmKYmaT0PXA==
X-Gm-Gg: AZFdTZckfPDrCuzFIfUx/yVGlqTMr0U0+Bs8G1W5nFCu4Y2eMdHLPpHp7kTiqQwuE7H
	HOE9LGjhOorgGVNxFTgkyGaUs6Txu+IA51fDLd/wUlhJotdJrfGV7ErfOn1qM6FHBcyGeyfCCQ1
	lRL2H57abl5/CTGi9lKymcK+w53HaNFSbCd+M4J3pRbnF3aYsz3p/btltc1BFpqZBGWIIzjMwBH
	RyMbirg3IzeRDCfyvfyvCdB7Qw7xnApHHJvR35+peJIjk4M3hI3q9JN92MrpRlzyJZFHJTzAVsY
	qMk9fyhlrmPxwGKof748CQfN1huGv21ZnY+JnmlGNc3VY26LDcrIvfgnQIrUjaYaySSxqw6R0sk
	TkvroSKP5imoS/KhQsG2J+Psy9znppQTJQbEBPFr7AawS6vOkHEcauHWPMlxUc+i2e3LGET2KLJ
	XTKHdNND3yN06Sp+bp+jl1tuLA228/IMxZklFRaNt0t3xkY/82OLSfR6rwdwc0kIrglayH+bIWP
	Ao6mfMaG1XRsoSUM5fU/0MEYF0RCGgRBxFnCwWoWujbSz4UiJA8kuMG6PJtQKLWHelY2DoA9eIf
	CCmsQpGv8NiwiTm1kEVJJdNes6Ek8JjefGqNR5zknSwRY1dso06+m1SEYzdeOnjfmR7joCX9wj7
	9
X-Received: by 2002:a05:6a00:18a0:b0:8a0:76ea:36e0 with SMTP id d2e1a72fcca58-8c87cc45db1mr21594130b3a.40.1795785952316;
        Fri, 27 Nov 2026 05:25:52 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87344058bsm12383725b3a.41.2026.11.27.05.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:25:51 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Peter Wang <peter.wang@mediatek.com>
Cc: martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 louisalexis.eyraud@collabora.com, linux-scsi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] scsi: ufs: mediatek: allow clock scaling when
 ufs_fde is absent
In-Reply-To: <484a58e10c4bc9cde24ef731a4bd3051b9decac6.camel@mediatek.com>
References: <20261126031008.27506-1-iasnezhkov@gmail.com>
 <20261126031008.27506-3-iasnezhkov@gmail.com>
 <7b7d94ab4283b82aec13eae3f9c1d2e77873d88f.camel@mediatek.com>
 <179574184161.52486.4990124402659702610@gmail.com>
 <484a58e10c4bc9cde24ef731a4bd3051b9decac6.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 21:25:47 +0800
Message-ID: <179578594781.39039.17064629203450675282@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_052553_277416_E925F0C3 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 2.2 (++)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,CTE_8BIT_MISMATCH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Hi Peter,

Thank you for clarifying — and I apologize for missing
ufs_mtk_fix_clock_scaling() (commit 86a678a25108) in my previous reply.

1. Why ufs_sel_max_src / ufs_sel_min_src were set in our MT6789 DT:
   We initially hit this on an older Android 6.12/6.18 tree whose
   ufs-mediatek.c predated commit 86a678a25108 ("scsi: ufs: host:
   mediatek: Fine-tune clock scaling"). In that local DT we added
   ufs_sel_max_src (msdcpll_d2, 192 MHz) and ufs_sel_min_src
   (tck_26m_mx9, 26 MHz) to idle the ufs_sel mux at 26 MHz on a
   small-battery handheld.

   Re-checking mainline, you are completely right about MT6789:
   ufs_mtk_fix_clock_scaling() clears UFSHCD_CAP_CLK_SCALING whenever
   wspecversion < 0x0400 and calls _ufs_mtk_clk_scale(hba, false). So an
   upstream MT6789 DT should not define ufs_sel_max_src / ufs_sel_min_src
   (otherwise mainline would permanently drop ufs_sel to ufs_sel_min_src).

2. What behavior clock scaling changed in power mode on HS-G3:
   None — because ufs-mediatek does not implement .freq_to_gear_speed,
   ufshcd_scale_gear() uses the legacy path and only lowers gear when
   hba->pwr_info.gear_{tx,rx} > hba->clk_scaling.min_gear (UFS_HS_G4).
   At HS-G3 (gear 3 < 4), new_pwr_info stays identical to hba->pwr_info
   (and saved_pwr_info is also HS-G3 on scale-up), so
   ufshcd_config_pwr_mode(..., UFSHCD_PMC_POLICY_DONT_FORCE) does not
   issue any UIC power-mode change; only the ufs_sel clock mux switched
   between 26 MHz and 192 MHz (plus ufs_mtk_scale_perf() PM QoS).

3. For mainline Patch 2/3 itself:
   Even without MT6789, commit 5e5976f5242d ("scsi: ufs: host: mediatek:
   Support FDE (AES) clock scaling") left an inconsistency in mainline:
   ufs_mtk_is_clk_scale_ready() only checks ufs_sel, ufs_sel_max_src, and
   ufs_sel_min_src, and _ufs_mtk_clk_scale() already gates all FDE clock
   operations behind clk_fde_scale (mclk->ufs_fde_max_clki &&
   mclk->ufs_fde_min_clki), yet line 2065 still returns early on
   `if (!clki || !fde_clki)`.

   As a result, on any platform whose DT provides ufs_sel{,_max_src,_min_src}
   without ufs_fde — including a UFS 4.0 host without FDE scaling, or a
   UFS 4.0-capable SoC attached to a UFS < 4.0 device where
   ufs_mtk_fix_clock_scaling() or suspend/resume calls _ufs_mtk_clk_scale()
   to switch ufs_sel and update dvfsrc-vcore — _ufs_mtk_clk_scale()
   silently becomes a no-op.

Should ufs_fde remain optional as ufs_mtk_is_clk_scale_ready() and
clk_fde_scale indicate? If so, I will update Patch 2/3's commit message
in v3 to describe the mainline 5e5976f5242d mismatch cleanly (dropping
the misleading MT6789 example) and carry your Reviewed-by tags on
Patches 1/3 and 3/3. Or if ufs_fde is intended to be mandatory whenever
clock scaling is enabled, please let me know and I can adjust accordingly.

Best regards,
Ilia

