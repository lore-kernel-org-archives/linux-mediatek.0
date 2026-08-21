Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5897C5DF7D
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 08:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TU4uJHeueOdwiNcvNtR8y+Kb71SUpDkuCapRVkW68kY=; b=noTIA/lRvlKjPjwldGMufBNpNn
	54SAO4kAcMHCxJXq+QWMOSr1azeJG2MGwvhIemP5Hyf3j7EYntfYCyHdgiNhk3E6gl3Mal8ZIdpR/
	tECnxVrhyuYyxecPUWNH5wLCw4JB3h92WTO8XXkf4OLdL2L1HYbXLBocldjiEuT4JL7x1N/7Mua1E
	Vah2B3WKY+n9eE1CMMZ64LRQVJPT1oZnMgGUIf6EfQZ6urBTzc4piteiTo3Qylk8agsxe4Zgg/xxp
	PQTZXTKCb62cfptmrGy2pog59M4TRCFHLgrUHKyOS50Gy8c2EJ5WJt/hZkV0UyUngVVS6eaGDxKBv
	Ldq65bdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKSu-0000000CmsR-2tTS;
	Fri, 21 Aug 2026 08:19:04 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKSs-0000000Cmri-0NfW
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 08:19:03 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso1483182a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 01:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787300339; x=1787905139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TU4uJHeueOdwiNcvNtR8y+Kb71SUpDkuCapRVkW68kY=;
        b=rt8DIB74Pz4cGlkqlgGu0UyUT57pPv64itEUb48FnwFCIsUC+AZ4XmZibnaTpK472i
         Lac1p5koNArJXq6hPyquqDiC8sHCsQ7+VnzqI8M0dA9p0Rz6406/qBVNU5hhZ/h3OJL6
         4NeZotAm/AbMU5ZEAesEi0IZAB5M+vwJwmU+UZL6VPcpSR3n8RtiXfeY5IfJDTZ/2gyF
         stVPBb2j+66gloZNJYOXHlS1HYQ25FheWc6jd5nhgsw4mVM7vehfGXaJ+K5jsGObYEzt
         ALReVdSp2qJZ97fEsuw/gOz29O3mmjZKE7C8egt/KgB/ASurnOoqvwJuYA8vkal3rPbJ
         G7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787300339; x=1787905139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TU4uJHeueOdwiNcvNtR8y+Kb71SUpDkuCapRVkW68kY=;
        b=NGyu6tIVNzMWxmIRuHEZsP529o2FCXfOxyTypwHCkdKgWwYeR6pK63DmcfTkLLiLe4
         aRcpgVqGl2ySQ7vFrRFwCIzv4XP1F4eO28tHd5u9E/KkLa9TmSApcs3bJ9ZF9FioJUKo
         tGWg/RpPVEwLm1Rp+FlMwxyY73LUPigfpxlOCD7I/TuhnLVnb1saNNtIsGZ+2NMheYSR
         UvgsX7us8nORN6kk4PH9wj74Ujd7pdL7HZL7dRof1QHPLCWh/DE3flV66gRiG+i05+6e
         1lddUIYbGJSO1gDB+h1m+d1Ecnrzz3PSYKLY6fylIfMrUp1l+nlOWHAU+pOPpcV2Kjj9
         dsXA==
X-Forwarded-Encrypted: i=1; AHgh+Rrg0m096hzMaO3FuS1ULv1ywGAXEHoOF7YRhIi5NJMOCoF+j1g6qU7Hqo5y9TbFytZij0ZqTY50TuKKb9ebIA==@lists.infradead.org
X-Gm-Message-State: AFuF++nm2qtK7irmEjg6uzVUDK1At0Jphnsd+lPNMSa9cEKbqpHF6qOF
	07R77K+rQv94mlNI7Rbi1RJIXXWk0+RKUlMAE22muGCCoFyA+gyIdMTlvS3KatwouRta7TeV
X-Gm-Gg: AR+sD12zCvnJI+7Sz0LSpt5cl5gDUhL8X2NppjCrurhpELOq1VeQpOo8xYuevhf3vcb
	AoUiU72n5lImQo6hyMfG7UURvM7fzS1O0yqn+c+Zl1yX9woRcGg+yhKKGZ2OqmNbrBxsomdAk/V
	KazcSy6blNdjTQCWaw6tjPBOlHNh3I03S1mQNs3bmrnZRYXLWtxKTn5iXnhPiDA9xQ8zZFKxE7A
	PnkjlDt7IbxMq+fDeE4SDzFjtvvi15RgCkvxdzmXmMYVUCUPcjS6JiczTF2ttHu4STee9WgEtnF
	ysbjCcmRk+EDBogDKHyP/1qj3lWLtdW40Q53Tgme/YhuzTzTnaNPubdbK97CRMXWTw81DijWNEa
	eF3xGNWqAqFyt9FOWhxPS3trgCThTxD837q83AWcMwULau8opXLrI1q1X8H5ePvwuZ+TYqrjKZf
	tOySwK0cuAg588/1tm/625nr7pIN7LwACPrqV+2f0jt57xTgjqMPHCLH0cQWsCrJBxAG//uHAgC
	cSZb6qvT9ypxD3Vl9s9x9cs
X-Received: by 2002:a05:6402:3805:b0:6a1:1bea:8ea0 with SMTP id 4fb4d7f45d1cf-6a42f0f7634mr5394501a12.3.1787300338853;
        Fri, 21 Aug 2026 01:18:58 -0700 (PDT)
Received: from ca91a6afa0c8 ([31.7.57.58])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1780c9sm5238626a12.28.2026.08.21.01.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:18:58 -0700 (PDT)
From: Valera Kozlov <valera.kozlov19@gmail.com>
To: bmork@telenor.net
Cc: amadeus@jmu.edu.cn,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	shayne.chen@mediatek.com
Subject: Re: [PATCH 1/1] wifi: mt76: mt7996: fix mixed FEM check of mt7996 chipset
Date: Fri, 21 Aug 2026 11:18:30 +0300
Message-ID: <20260821081830.280417-1-valera.kozlov19@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87a4z9f7a5.fsf@miraculix.mork.no>
References: <87a4z9f7a5.fsf@miraculix.mork.no>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_011902_132343_77B44D7F 
X-CRM114-Status: UNSURE (   6.74  )
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

Device: ASUS ZenWiFi BT8 (RT-BE14000), MediaTek MT7988D SoC (tri-band,
dual PCIe hif/hif2). Confirmed empirically via extended TX PER testing
that adie_idx=1 is correct for this board (matches Chukun's patch),
consistent with a mixed-FEM design.

Readouts from the ADIE_ID registers:

root@bt8:~# echo 0x0f00002c >/sys/kernel/debug/ieee80211/phy0/mt76/regidx
root@bt8:~# grep . /sys/kernel/debug/ieee80211/phy0/mt76/rf_regval
0x79768a20
root@bt8:~# echo 0x1f00002c >/sys/kernel/debug/ieee80211/phy0/mt76/regidx
root@bt8:~# grep . /sys/kernel/debug/ieee80211/phy0/mt76/rf_regval
0x79778a10
root@bt8:~# echo 0x2f00002c >/sys/kernel/debug/ieee80211/phy0/mt76/regidx
root@bt8:~# grep . /sys/kernel/debug/ieee80211/phy0/mt76/rf_regval
0x79778a10

Note that band1/band2 (0x79778a10) match the EE4600 signature exactly
(needs adie_idx=1), but band0 (0x79768a20) differs from both Zyxel
devices reported so far (both show 0x79758a02 regardless of which
adie_idx they need). This is a third, distinct band0 signature -
suggests band0 alone may not reliably disambiguate the two cases,
since devices needing different adie_idx values can share it.

Happy to test further register dumps or a proposed fix on this
hardware if useful.

