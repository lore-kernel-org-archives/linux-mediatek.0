Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D26606A31B
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2026 13:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rvHWSiwO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OQfioJOB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b680pKzQa13v0eIR/DWLULm8zwErDKH5uvrOsGuOoiQ=; b=rvHWSiwOpuZfnR
	GsvdqyxiatFiuK6bL0Aw2ef/Z8wWu8lGO10g2c/SFvFJI7nZYlX/EFZzDtQDVtD1zPJsF/KbOamQl
	ggl1s8JhIJbpfioNlTC1/nTbv0/sgtxbTDmQIJJEVSMnwHOvU7z6dOW3+HJcgCIykuln5O+V/MNsP
	Ss1KVQjwrbmmHBdYyqSVwRhJCr2ts6KOZtCfE4/8fwLkfKc/yZ+cnKhJcDraX7CkAQIOkj+ULjNk2
	40AGJup/hu27jU+isqZhShBeySGDUowEmsJdgdx05mjegvB2U7FEYNhEfaCb8H/U/xVZbDsU52ClX
	Z+tQ+0Ot3XhmAeuu+New==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKbe8-00000000DGa-0E7Y;
	Sat, 24 Oct 2026 13:18:52 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKbe6-00000000DFz-2dR5
	for linux-mediatek@lists.infradead.org;
	Sat, 24 Oct 2026 13:18:51 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c4697404c2bso215602766b.2
        for <linux-mediatek@lists.infradead.org>; Sat, 24 Oct 2026 06:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792847929; x=1793452729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b680pKzQa13v0eIR/DWLULm8zwErDKH5uvrOsGuOoiQ=;
        b=OQfioJOBCyEIjMs0Uis/xd0+PwbqWsiN8A3FGK4p49QpyNyf09zF7thBp+7jTy5OQo
         y6ka7i2f7YtMsvG8YimkOJn0J+viyc2p2JmB2DC/GVP+7OGDzBTDCOUHGuOW+u2bIRUS
         VTRy5pMk1ez+Qv3iXyvdP+YYExys36SOuBL3YpBLy2RzVMIzdLzIf7WoCBfkZkx59FEU
         0TRiA8/Iqczr/4qUoVQP9MvAg3acxeTOA69EJWsnQr+ou8FNOY89eYxyZUWp0ebEO9jD
         ov5Bdy9IpxwrQfPrdiUcHUapERuDofopWLdLOGcUQuJI4XhH+C7bKlEB3dhh0yaqJmAK
         AoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792847929; x=1793452729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b680pKzQa13v0eIR/DWLULm8zwErDKH5uvrOsGuOoiQ=;
        b=lW+f87ue8+zf7hY5gNO/pQ8pD6qRoUw10N3bw5QbO9vpCmLjrouXUKdLDa6LQ8W87S
         ooYiHhRYmTB/jRDm/F3/uUYVZq9BsZhame5iJuKpWA2P2/mO60XoX3UJ3EWXMaG7EcbF
         4S5zSiVKNSxJJjrLg7M2EIuSvWgj02Lj+Zv50niB6w6VED+PVHQI48Y0swRrrAV3YdUD
         utnScMzfujGuZvIQ96miCaLArQYdYcTBVfO5EnAeL3fDoxf+Js8f/HDfvvKK9sWEFEKG
         q06U1L1b9iQAxYadBaEzCo9ScZWzPxzNSxwq+jDevsSfkYWCA0IVa7r+vgw5c6xQFSPT
         4qgQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5trp0dAlSThXI49pIkk+QGAo4Nr8o3kQlHGr6ikCHo2AwPB0IuDEkbA2d63U8xL0CtUvik3W7QT72YtAKbQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLfW9aBy3qMkvDnVzrIF3pmxSVD6+XJrhfrNLDkkQUFUauGmZHv
	WKXVOGDO71VJFS4P+C4EswUq/gg/usyutTjnmNFkYLMVEjx3+ekNDWQv
X-Gm-Gg: AYBFou2lVcj3MelmJCnuZKETchkpp/FLCdco7bWnx3eGLIJpSiavwkINjYCCSFSyOsB
	nlVnFA4jYFK7e28RainzbeqeScEikGhNi6kHK7MvaX70dWBpIJqfcsNYLBMe9uA62k8so7F2b1z
	yLCgdNO3O2+6Pv1YBU3PadIolc+a6uCUWJemVcEpxwq53OERC7/b79MTQm9Pp6N5+JTPCmv0DVb
	P7Kbb0sKnX7jnVVCzqLsyUZ+Cjvq+RMeI9N5gofAjeDM18Yam3RG07F8hNnPFy16Em7PrCTpmj5
	9xo6FVDzMt3Yg/z3XEc7GQRqebxcfA/leNjQtYHyDsygLVh//8k9b5McRTC07ClnZBRLpKzTDQM
	souziZbLOG0Hp1t9ht80Rtd8HCzTjvbu+Jnqw5e10XkFiNXBQ2DLjYfsCDuQEDN0M3FR8asWMVP
	7BzQKWk+Ul1JD85uMZBzpjAQgDKjxFpwvSOCnIox1AmfOAj1Em4dsoBpKQ6VM42zN4wZ2ATXz0l
	NosPRT0nIC2r0V6itQ8KK69cqHfpg4g5ars9Y6VH9BB/qeddoQ0YVRPQB8aQU48DdyfFVW0
X-Received: by 2002:a17:907:2d91:b0:c41:c106:9772 with SMTP id a640c23a62f3a-c46bdac60eamr203215066b.1.1792847928479;
        Sat, 24 Oct 2026 06:18:48 -0700 (PDT)
Received: from localhost.localdomain ([185.65.135.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd6276d8sm87306666b.41.2026.10.24.06.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:18:47 -0700 (PDT)
From: Hedi Ben Hamida <hedihamida096@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Hedi Ben Hamida <hedihamida096@gmail.com>
Subject: [PATCH v2 2/2] wifi: mt76: mt7921: reset on HIF resume timeout
Date: Sat, 24 Oct 2026 09:16:53 -0400
Message-ID: <20261024131715.64435-3-hedihamida096@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024131715.64435-1-hedihamida096@gmail.com>
References: <20261024131715.64435-1-hedihamida096@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_061850_682594_84C90819 
X-CRM114-Status: GOOD (  12.50  )
X-Spam-Score: -1.9 (-)
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

On some MT7922 firmware the HIF_CTRL resume command does not return a
response after D3, so mt7921_pci_resume() returns -ETIMEDOUT and the
PM core reports the resume as failed:

  mt7921e 0000:03:00.0: Message 00020007 (seq 6) timeout
  mt7921e 0000:03:00.0: PM: dpm_run_callback(): pci_pm_resume returns -110

The driver already resets the device on this error, and the reset
restores it. Treat the timeout as recovered after queueing the reset
and return success, so the PM core does not mark the resume as failed.

Tested on MEDIATEK MT7922 (14c3:7922) on kernel 6.12.113: suspend/resume
no longer returns -110 and Wi-Fi recovers; hibernate/resume still works.

Cc: stable@vger.kernel.org
Signed-off-by: Hedi Ben Hamida <hedihamida096@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 00532b29f..dce88fcc7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -597,6 +597,14 @@ static int _mt7921_pci_resume(struct device *device, bool restore)
 		mt76_connac_mcu_set_deep_sleep(&dev->mt76, false);
 
 	err = mt76_connac_mcu_set_hif_suspend(mdev, false, true);
+	if (err == -ETIMEDOUT) {
+		/* Firmware may not reply after D3; the reset recovers it. */
+		dev_warn(dev->mt76.dev,
+			 "HIF resume timed out, resetting\n");
+		pm->suspended = false;
+		mt792x_reset(&dev->mt76);
+		return 0;
+	}
 	if (err < 0)
 		goto failed;
 
-- 
2.47.3


