Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE51C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 11:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AsxOcajZ7gYxW17W0Pj55YOWQAyg0/24La7iNV21scc=; b=k+7ToCz1JD9pg7DGVbeZMhps28
	pGqqcxIPWhSSiE4wC5DHqP3hDaY1dItQ6HDZ3eDIzyskINcWMBIOV5Y0sB0+qNjs+Yf/4Rek/u8MX
	+5QUkmGf1de4Ho2KydNLGFHa4Lh2KngrggH6Gd3muNkX+fGwxvk8yJKnMyDJ4equIO+cmjlIxE+zV
	CwLYvyWuGusVEyNkUVpfchIwBBRO/bS2e1W3OEcSgYHYjU+iNBpTzuDpP1HECk+Xzf4JG83oEzoYc
	n2bpB0Mh8R7shxtKfrDozdvUl7CY/6ls0Sonqg/JDWQQqRtgHS4ZZdP2JX6ej+L0nzT8XGFHZRaKp
	+3X69WkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQU6-0000000H15D-0E1x;
	Wed, 08 Jul 2026 11:30:34 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQU4-0000000H14K-0Vib
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 11:30:33 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cae1a3a744so4366265ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 04:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783510231; x=1784115031; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AsxOcajZ7gYxW17W0Pj55YOWQAyg0/24La7iNV21scc=;
        b=FX7PMMKXGJ5id5aL0OOmd53Y3I3xcFrJJDBeY3avVLiOH0xWTf9u2hE6j34cQLkrsd
         2wYkPUT3XyfHERJjc2jbYKITeByluFlMWqZmZaDHJ+ta/0CMZo/BrvylKQWzdwjvx4XR
         uw7Tt0rYj0Qh/B0wNZtdoACq3jtkxtI72ZgaH/JvOhqj13mBiuJMZ+skO39AuNIfOPTi
         ey+PqXAOBzYT4r6HuWfO+JeMfquJm4h4hlgrA1k3ORn+q23pZ0M3WHlyILpz+Qibdk5k
         RVQHPPC+BcNYxLHwd/fAjoE2lhiUk/Yk1wTI7m+vRjZgXYepEe/ebw1cgI4CSseM6afP
         qYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510231; x=1784115031;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AsxOcajZ7gYxW17W0Pj55YOWQAyg0/24La7iNV21scc=;
        b=aAIecv5BAJ+mmj8oZ7g2S01ISfXwM5dxejRuSzv4xxZCqqpmvJqBIjo8JJT6y82RAo
         68B6ztFwaOr+QB6mhR7evY7b5zoI5cFyFUecXPh/MXjSdDB/3PP0fPpGu/NvxOzHULvh
         /FmXUS331vcU0M+JZbblqZ3hOW7IvvHB2OTLMoxmNmWPwsPzbIJX2OXutY04uTtMviCt
         PNEr1bPegnxTU14WMBWOyKK+UrQS0NkfeWO1l7LT8ilO0QLBAi34y9AWVUMkXXMIXz7m
         liTOE5s69URjJODnM8j2DlczhgQD6obq4SPtMY3XbwPIvn/j3EVxfr7kcVFYmuJQbWYK
         +dtg==
X-Forwarded-Encrypted: i=1; AHgh+RrRPpzLY1qAjRSWW7rFqxfhSfCglI+j/YWJj/hc1cdBT6ojgp2hVMrpUpJeuuhSocUK5pfM59VVP/5vjSIg5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmxxcLmwfBja1aDfeHWU2AjZLx74tfpxXnpoxLospqQicCPmu/
	gchKiGDCPnBZswQspBVn1NpNMtEAeDlf3zvDarDPWVyYa7IpJY2O8Yyl
X-Gm-Gg: AfdE7cmwH3zTMBTb8RCr6oM785arYLV4iTl2Caj64gYsuBMnf57pq635lag5zxn+/Jc
	JlxSGMk6UBB2E14uEQVGEYE9c7ohp+nQUZFEXZEsEKHWNf+UVXRkJoX4YoBH6GG0l0rJgVCHF1I
	hOCe+bi6YiC48nWSK9krYidUe6GK9Oe2g5LTXV+Ezj6gPZ1dMuIVr5F8pV5Mm7hdBJiDa32SFKR
	SFxDcbP0Tb8IvX6anBnfZDjZDtKx0zHTSg8UDcUs85KZYFEWwek/j7VuohSOYWceQNHzB2LQY/u
	dlHc8sbwi8RKJnsz0GjdJP1FXu43XPrB8mmUhJT8FqHWtmrxrDMQ1kNUlhE29aVB53t6HPAaOb4
	A0e28q8a6XOJVocQGw7EA7wM5E2vnL3YacxGngUOSuAuO+xevgLBOgMLX273nTmGQQa8vpkeX1P
	OQLrn20w==
X-Received: by 2002:a17:903:1aae:b0:2ca:ecfa:1308 with SMTP id d9443c01a7336-2ccea396a45mr22556175ad.20.1783510230507;
        Wed, 08 Jul 2026 04:30:30 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb877sm26691105ad.14.2026.07.08.04.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:30:30 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: airoha: Fix potential use-after-free in airoha_ppe_deinit()
Date: Wed, 8 Jul 2026 19:16:16 +0800
Message-ID: <178351022574.97989.6880403520276841703@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_043032_158715_39E5664F 
X-CRM114-Status: UNSURE (   9.36  )
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

airoha_ppe_deinit() replaces the NPU pointer with NULL via
rcu_replace_pointer() but does not wait for existing RCU readers
to exit before calling ppe_deinit() and airoha_npu_put(). This can
cause a use-after-free if a reader in an RCU read-side critical
section still holds a reference to the NPU when it is freed.

The init path (airoha_ppe_init) already calls synchronize_rcu()
after rcu_assign_pointer(), but the deinit path introduced in
commit 6abcf751bc08 ("net: airoha: Fix schedule while atomic in
airoha_ppe_deinit()") omitted the matching barrier when switching
from rcu_read_lock()/rcu_dereference() to rcu_replace_pointer().

Add synchronize_rcu() before ppe_deinit() to ensure all existing
RCU readers have completed before the NPU resources are released.

Fixes: 6abcf751bc084804a9e5b3051442e8a2ce67f48a ("net: airoha: Fix schedule while atomic in airoha_ppe_deinit()")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index e7c78293002a..f6396925722d 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1659,6 +1659,7 @@ void airoha_ppe_deinit(struct airoha_eth *eth)
 	npu = rcu_replace_pointer(eth->npu, NULL,
 				  lockdep_is_held(&flow_offload_mutex));
 	if (npu) {
+		synchronize_rcu();
 		npu->ops.ppe_deinit(npu);
 		airoha_npu_put(npu);
 	}
-- 
2.51.0



