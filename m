Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E122C982CD
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2026 06:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUm8IylK3V7lcVuZn2ulYwmszlPFrNkvTKkjAabL9nQ=; b=ec940Y8W65IeNbLyHHHZpPwZ2r
	EPwQxMQKNzJuXXWoRwqqX/ywO4wKjWTZjDNnHCD9HUpA197+op/f4oWgAIHopYvJc3WzKCLxAjzxl
	C4ES+ryaBUTG8RPSSQX/kNtWKZ7o64semn/eEAhp1cF5Btv/6k1sQqcLrA7TBo0Jdz4e4PJfzG1Bw
	H1d5hhhMkI7vMjB0zQ9K18g7JQpugx0JLgR3ZOdl7muKDdk1aCAlT8RmGKkg43uPkfHPpqMmJM8Wz
	Yeg0JeG29LnXLpjHQPfOCVar9ndIduBKYZMG/EQFPjvu94zPgwDjRXTWcfA3IbD2zfua+ue7KL9Hy
	OvIV4sWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x761m-0000000AjAK-3Ix8;
	Thu, 17 Sep 2026 06:55:26 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x761k-0000000Aj8N-3JEo
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Sep 2026 06:55:25 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so373400a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 23:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789628123; x=1790232923; darn=lists.infradead.org;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUm8IylK3V7lcVuZn2ulYwmszlPFrNkvTKkjAabL9nQ=;
        b=h0tYYA7jx01y+Usq1og4/cA8XT8HH0OUHslkRSP1h1QGndX1NjgTqRlyPGAnVReMRI
         C1aw7MpC8Q7ygitSzwtOuFI4sZzu/vDpMY6YWogV9r3Hd14XL9lDkLIbePySG6Ihi9dv
         K6ozY6eX4I+8XdDZAzGAeNimigqCxWLkGWPdz+nb7uQa4hxgcRfs7hsz1PuukUFYp/Xo
         pBxr4lPEgaJPX+iwvTibMJ2od2q/esnhO7+D+WWxoybcNTUrJWGTlAQSuOBGLo3H4xpf
         mfycc0WxV4DBS+bno90+yzhQuLl8H/tZbDeIQilTW+92kTQaJMdc6NxcUMyMySzcZSCV
         /VdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628123; x=1790232923;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CUm8IylK3V7lcVuZn2ulYwmszlPFrNkvTKkjAabL9nQ=;
        b=S9IfymTktvvzEfOLLTU35QaKCRVwm6mTaLXO3ZHerkIXrTG0fhAEIarAoSqGojRgoW
         6H8SxA843AQpDH7TZIqFmoN0C9o9IchcDiHbjkDoVC7c3BO2jQ+edZOIQEcJHvzYGclZ
         gt0XPNRjxYKnMbzBwHEOBjAZlVOEg0XwsJSnow8kBlYeO6ZW7IQlVU6wwQsTN+B0ljZ9
         RFc6Fbkq0gM1IZyMjlZx41thqd9XG5GRvYxdy8j4we1PG4PAdcANGCReQG6z6USG6qeL
         yP5KAE6Hhgi2SXgnsius3A9isIZGP7hAvYE18ocG4FBE8LiRlgWS4m2v5hOEdygushGq
         dKPg==
X-Forwarded-Encrypted: i=1; AKwUvBzI2vuu43txbAtEqDT5stPe0Xnn2/EozfvheUyFkGrwGseyiwfwPKVGMIqSaYzrOPYrutCOzU4W8sj24iOh3A==@lists.infradead.org
X-Gm-Message-State: AFuF++m2Vebj9/CLNPxEex0R4lYL2u1LGTfs/XTXX+Hj43mTnd92s+YM
	1V3+o6OKLWO14eKxcNTrc5xEgPj27ayk1ELgGeAWJQWSGjoosrQwwVyI
X-Gm-Gg: AYBFou1b7NgEF9p2lCZRxNhMLMSDG1J82vr9u/xpxOV2fTUeWDmHIm2qQHko8OCs5Cw
	RT6YPQwXJzLpMxkn8YvSbLXwfV0+fQSTtphtf+MwXY1HHWHz037+c+gb7JgVVp3yOM66Z2A/Zvm
	l4MBmvUdZAcb5NRRvROfjZH6ggkJkgncfuVsEOBp6TjgRGm/CvCZAdpOCHVFNpGjEwt0ELtk52t
	YyNBdhrhYTSUa6VkqAZwRA0qGAHQ1Q1Z2TjJG0azISoaG/nDH0O8a46bfHtytVTWC6pX1W821oY
	gf6qnTcr2U4WClabvFN+/DLjaGf2us7AbOxs+Rj9h7wNxYvOQ71ZDR2Fsc5k99Rtl5IJXEA03qA
	2rKRTdWKDIgkq51GEnNVhOmRm4nGnjMuK87jnPQPTO+3C/nf1uDdVMbubDKcBuWs+mZAxVaHGlc
	rFpU1OymZRyGrjvJlfrN+1btoRxxJ1SzXkYV2/74VEMsLwnx4lKG/k1vXM6BT2DW76/FNAIk7mU
	X8=
X-Received: by 2002:a17:90b:4ece:b0:39d:ba21:fd90 with SMTP id 98e67ed59e1d1-39e1e491176mr18804302a91.16.1789628123381;
        Wed, 16 Sep 2026 23:55:23 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35def1f2sm3334653a91.5.2026.09.16.23.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 23:55:23 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] net: mediatek: fix PPE resource leak on remove
Date: Thu, 17 Sep 2026 14:55:11 +0800
Message-ID: <178962811102.1264013.13698060411191875408@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
In-Reply-To: <20260916051618.2904439-1-lgs201920130244@gmail.com>
References: <20260916051618.2904439-1-lgs201920130244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_235524_846140_5C9F0B59 
X-CRM114-Status: GOOD (  11.78  )
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

Hi Guangshuo,

Thanks for the patch. Calling mtk_ppe_deinit() from the remove path is
the right direction, since the probe error path already tears PPE down
but the successful remove path currently does not.

However, I think the cleanup is still incomplete.

mtk_ppe_deinit() currently only destroys the per-PPE l2_flows
rhashtable:

    rhashtable_destroy(&eth->ppe[i]->l2_flows);

This only destroys the hash table itself. It does not free any entries
that may still be stored in it. In this driver, L2 offload entries are
struct mtk_flow_entry objects allocated by mtk_flow_offload_replace()
and inserted into eth->flow_table, and bridge/L2 entries are also
indexed from ppe->l2_flows via mtk_foe_entry_commit_l2().

There is also a lifetime mismatch for eth->flow_table:
mtk_eth_offload_init() initializes it, but I do not see a matching
destroy/free on the remove path.

So I think remove should first drain the offload flow entries, using the
same per-entry teardown as mtk_flow_offload_destroy():

    mtk_foe_entry_clear(...)
    mtk_wed_flow_remove(...) when needed
    kfree(entry)

and then destroy eth->flow_table and the per-PPE l2_flows tables.
rhashtable_free_and_destroy() with a small callback would probably fit
this better than plain rhashtable_destroy().

While touching mtk_ppe_deinit(), it would also be better to use continue
instead of return for missing PPE instances, so later PPE instances are
not skipped.

One more minor cleanup issue: mtk_ppe_debugfs_init() creates the ppe%d
debugfs directory, but the PPE teardown path does not remove it.

So I agree with the fix direction, but I think this should be respun as
a complete PPE/offload cleanup rather than only adding mtk_ppe_deinit()
to mtk_remove().

Thanks,
Wayen


