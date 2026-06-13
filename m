Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B044CD98CE
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 00:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CAEQuq4z5dW0AnrothciojC8/CjIG+BXfxwJ5kTAGpw=; b=V6099ax2X9N8WCuSEzyplhi8ba
	dUQCyANcaVPkd75KCMJGYoMCKeVj7v3J3jdC4gzTEly08yLuUNqdRr2fi1qSZP5dHgklYn/MQolAf
	TgCi16Aob1pMI+lQzWsKTeVj2d050KcPwl4AUc3ZlUHIi2xo0ekTtEkEXMegdxvQzPrumCeNXcNbq
	16piheEmcb4FpFp4OBMAtxHHmBL9Hpt9DjJeNGnxm6DgtJ1IhzWNfTFdTF3ovMaeJfrmPzTfHbN9s
	kKj88h1bA+hMn8nip09aploiaG+nF4b0x4p/Z4LshaNZnd9x/0naDouIxIXNGu62sQg1SCo82lfqZ
	9Z2videg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCDS-0000000Bphy-0ygY;
	Sat, 13 Jun 2026 00:27:14 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCDP-0000000BpgT-2Ak2
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 00:27:12 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-36d9794d82aso949527a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2026 17:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781310430; x=1781915230; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAEQuq4z5dW0AnrothciojC8/CjIG+BXfxwJ5kTAGpw=;
        b=cHUWA9YjLn6pvu6Kau+aAVmY9d16ofK54tFvPlMKwstaYyUoECaQCTOV+qNLPDq40h
         74+F1nNtVRh1G7mRNTNqEUzajC7sxO8nX4nOS/KX9y0QmjAh0Gg6d2ZCiQ4NYSgdCkTx
         +gMBqkXr/FclE89xI5/o3OjkXZ52lrvct/8RFqAv9AblAKL008L52EWLSDhG1vUH45FE
         M1Tus7SsBrd6AE0e9JE+k1MLnzuyouKw3Gf7YhkW/kOzWZimkYagvfgXu0LxXovHPq+u
         pHs21W3eXotdNKwl+QAkUffTA2wpxSjDOC609Z9NeSMe1yNYlk26Ubg4AhHF89t9ooN2
         E9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310430; x=1781915230;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CAEQuq4z5dW0AnrothciojC8/CjIG+BXfxwJ5kTAGpw=;
        b=RVMwsQUSA4Iu3EylTlyjYu9hPMNBFAm6rxa+AKYxhIBvITlvngIY7kNr3ZkIWNLM7i
         oGDlla18HzPrVfnBTpPZapyfi/zUTBslRQCX4PURI4p1vaFibjEXJ26fUlBtweUkYfOb
         sA5oerGYiARXEyHPO6+59r/J3r3I7GNDb2KP+a1fM3P/DXhwqqJyM3B1n+/Q2Tsf48Jk
         fLDVu8Y6Jc/SlKLJ6csDluHccSKuMF61HeKr1pm9eDHqcyDCirLZk7fZffgAkAtPAJoo
         QEiMTIqNJx9hajPfYBoPLuVbiUNf+PwhTRz59pQ+2ShsrgAKbRVv43ioikwtUxDPHd26
         +aZg==
X-Forwarded-Encrypted: i=1; AFNElJ+ma+nYw9Bjc7HeAjTNKFOig22klVZS+cyNzLWWF9uwqiJfD0pXEdssl4V894PKQ4YRlfvYCt8LdVc/xz4bOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxL2pTQvaDrETURZU2ro3TOz/xo4mwLupMwiOMo0dJ0E6q+0yh
	n7iL9XBv2Hg5e+NrsM56ibIytlB11tct2CteRJyvghnGOhtJ1M9VjxdN
X-Gm-Gg: Acq92OHBb+3j/1Jc9Znl4MpqajtNturOzb01n5ybU2OO9supY+dkg04kHQ2mDiBDSum
	xFyCTGCfUbM/vUEsRpEC3e+TNdCa7LDCYCjl2EYvfVt+JEDurEWo+7n8e/TynneQIkgP4OgDLNa
	Qz4TLVEiSq33xiKwl05DIgWWSGTbaUrWwcK7UgTN/yVS8DxKoCZ4ojtAP0QX8No7bRO0Ttd+hxq
	LF91gtPCiHug12qJhPqi4uzuKkgPRvasdMNlBSfj4+zRey7QkA79B0Cfj+xutjKlQ0RfPMs3XKw
	koKawhpIiBEBGyaBh53GPhVT3bBm3bqbnt0JuGyti7usq09DPQaOW27/FqiFjgCpnWrwg5jEmTp
	i0tTTagZNQVUdtW6OH0nAbYac/oIjsEz+ksfkbqtsWgwBZcnCQ9VJPZjvmJuxv22NXGWJQzFNXL
	3QwrRitWqkilMfOO9XjE408kTGX00=
X-Received: by 2002:a17:90b:1b04:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-379ff644660mr5554949a91.0.1781310430554;
        Fri, 12 Jun 2026 17:27:10 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8ea7sm3441412a91.1.2026.06.12.17.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 17:27:10 -0700 (PDT)
Message-ID: <6a2ca3de.ad59c0a6.147df9.2ac1@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Sat, 13 Jun 2026 08:23:12 +0800
Subject: [PATCH] net: airoha: Fix always-true condition in PPE1 queue
 reservation loop
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_172711_563659_13DBD9E9 
X-CRM114-Status: GOOD (  10.09  )
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

In airoha_fe_pse_ports_init(), the inner condition for PPE1 queue
reservation is identical to the for-loop bound, making it always true
and the else branch dead code:

  for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_PPE1]; q++) {
      if (q < pse_port_num_queues[FE_PSE_PORT_PPE1])  /* always true */
          set RSV_PAGES;
      else
          set 0;  /* unreachable */
  }

The intended behavior is to reserve pages only for the first half of
the queues, matching the PPE2 implementation on line 334 which
correctly uses the /2 divisor. Fix the PPE1 condition accordingly.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Wayen.Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11..999f517 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -311,7 +311,7 @@ static void airoha_fe_pse_ports_init(struct airoha_eth *eth)
 					 PSE_QUEUE_RSV_PAGES);
 	/* PPE1 */
 	for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_PPE1]; q++) {
-		if (q < pse_port_num_queues[FE_PSE_PORT_PPE1])
+		if (q < pse_port_num_queues[FE_PSE_PORT_PPE1] / 2)
 			airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_PPE1, q,
 						 PSE_QUEUE_RSV_PAGES);
 		else
-- 
2.51.0



