Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37AFC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Jan 2022 15:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XsEk3P+QFd0cEnXx5G6Oh1UAwUdcO70CqGH94B3Xfx8=; b=wLZDaEMTC6JG4a
	P/ZbAZBd1KP8hn7sAMxdMP4WrzJ3UUzgx71+m3pjNOD/3CdsL+e/7hUOmLQ+zbNNC0576NgJHct0j
	tcYe9/WeLqvEunH1efZuJMf2jxOKcoj0zvV+6cZamVYur7Y4T+4cjxbZoQRhaHiMGu1ek+KoNYVyX
	DruMrs3l5QyripaEZ2T2XbxRPMeRDxznOwtXN336Ibk70jEFCgAVKX9xgy8h05qxdnFXBwCny3PNp
	SFRUEB8FV558Lcc0K3G+ctPyUco7o16zl8QcBUFvnQJJx+DUkgATVImVbkj9JVt0LgLBu0VBPH9vk
	5f2yTjFKuMUXjsNPXDyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6Dyz-006cSA-A0; Sat, 08 Jan 2022 15:50:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6Dyw-006cQt-35
 for linux-mediatek@lists.infradead.org; Sat, 08 Jan 2022 15:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641657012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nutHqRyjAUxs0OigylRB1piW55HI8TWHHwTVtcKgRN8=;
 b=Evw1CQkKB9cjf3zl/AKIdleryT6GbFe0gnH6Pqrdy+/NC0msuSwC1RYHON8yzE/krH6sVo
 cIWixUj3sB4R0pKo7fMzwRK0GusA6MQEeYh9LoXYXOJQlI5RYOlzHV8rH1EtGbZ/cizj/b
 PE9T1OShLcsGUC6hssUFYMxPu61vGC8=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-_OmBtEGINzqqQkq8UPAHpg-1; Sat, 08 Jan 2022 10:50:09 -0500
X-MC-Unique: _OmBtEGINzqqQkq8UPAHpg-1
Received: by mail-oo1-f72.google.com with SMTP id
 o6-20020a4aa806000000b002dc224a8e7fso6133990oom.12
 for <linux-mediatek@lists.infradead.org>; Sat, 08 Jan 2022 07:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nutHqRyjAUxs0OigylRB1piW55HI8TWHHwTVtcKgRN8=;
 b=MgwPeX5WlmgTH1u+05qYIhHRSnlyauIwz7TUcQqyAhJyY+MvZTh/35AP/NkoRsSDtO
 urGNHFcOiyBedYYjh+ZykDYPn2t5bNsVqKjbRq23SKIZ75Ivz/P66yHzdyxnesuphxBC
 W1GjisziLvyuwm3mu3R2mDFEED/TwmZ7uaUNnkMp0igdZ9NHyFjfPfBUC+WIFUcEVV72
 7Fk9zLBnyUM+hIbB6ciPwUeVLFOyrMRUHlN/BP0pb+iBW/KAaT/eEoMwcjCQ/1lY+FWD
 e4hP8OV/EQ5jSobn9EmMIWaC8/PVNXKAZ9Dr8WtFX3+GWc3pPH89z/93ui1CBt4spts6
 v+7Q==
X-Gm-Message-State: AOAM533HE3Wo6cpeK77PdkuoazFtbPmfLfwlT2hO0S7bDazWCwZsOmg9
 GA0QtHHoIaVToqF/5qfQm6JemJCiGp2S3c6zCRGxuGX0rmT99/mfzwivjmNx3j5lgCGQtz7pn3K
 hrZpH157gEh2Emo9qZbWqzdYC3HkFicVm
X-Received: by 2002:a4a:d5d5:: with SMTP id a21mr43792299oot.43.1641657008670; 
 Sat, 08 Jan 2022 07:50:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDAnHZJpVjRqSRJBkvJ07yYIEgasx5S6n/t1vzZoDi6lprUw7Ku1TMowLE/zzd5lBQtwBZWg==
X-Received: by 2002:a4a:d5d5:: with SMTP id a21mr43792283oot.43.1641657008487; 
 Sat, 08 Jan 2022 07:50:08 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id q13sm384815otf.76.2022.01.08.07.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 07:50:08 -0800 (PST)
From: trix@redhat.com
To: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, linux@armlinux.org.uk, nathan@kernel.org,
 ndesaulniers@google.com, opensource@vdorst.com
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH] net: ethernet: mtk_eth_soc: fix error checking in
 mtk_mac_config()
Date: Sat,  8 Jan 2022 07:50:03 -0800
Message-Id: <20220108155003.3991055-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220108_075014_239292_F78AA84E 
X-CRM114-Status: GOOD (  11.14  )
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

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this problem
mtk_eth_soc.c:394:7: warning: Branch condition evaluates
  to a garbage value
                if (err)
                    ^~~

err is not initialized and only conditionally set.
Check err consistently with the rest of mtk_mac_config(),
after even possible setting.

Fixes: 7e538372694b ("net: ethernet: mediatek: Re-add support SGMII")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index b67b4323cff08..a27e548488584 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -385,14 +385,16 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 		       0 : mac->id;
 
 		/* Setup SGMIISYS with the determined property */
-		if (state->interface != PHY_INTERFACE_MODE_SGMII)
+		if (state->interface != PHY_INTERFACE_MODE_SGMII) {
 			err = mtk_sgmii_setup_mode_force(eth->sgmii, sid,
 							 state);
-		else if (phylink_autoneg_inband(mode))
+			if (err)
+				goto init_err;
+		} else if (phylink_autoneg_inband(mode)) {
 			err = mtk_sgmii_setup_mode_an(eth->sgmii, sid);
-
-		if (err)
-			goto init_err;
+			if (err)
+				goto init_err;
+		}
 
 		regmap_update_bits(eth->ethsys, ETHSYS_SYSCFG0,
 				   SYSCFG0_SGMII_MASK, val);
-- 
2.26.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
