Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4D7EB8FA5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5mkTCP1wwaR9YuY5H6Ulmq36vtFFoJH9HnExkyxKpno=; b=E/7Wk/y7Bs/xojpuNaUIlVitBg
	K859DacYlngHtBeXTPFkNcqQds0j10rx5jxpg8FZGxnO0JDrhj25b8SPAIuaQUVxxqsoayoRUbYuP
	l5G+K4iumu4kLc2QA+1g4X/xfcxfGvVuipIxme0sVzNkOGvDKWyCNM+UguIIOwrVy7OWjFfrjQY/n
	z0n48b8wKMLDRqaTomSU0W4kFovnOl48lT/2fTfowV6R9Ov23bA9J0j/66uFgMUH7TfxMZ4ZZ8Sig
	DO1Z9mGvG2xBH0X9D07olJ4MBbfwjSPIXD598Jss6FAY3Yk3r3NetX5F97AHJhlNFM+GIrU1IU7V5
	umnpPknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoje-007td9-0V;
	Wed, 06 Sep 2023 09:22:06 +0000
Received: from mail-pj1-f65.google.com ([209.85.216.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoja-007taw-0O;
	Wed, 06 Sep 2023 09:22:03 +0000
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-2684e225a6cso553933a91.1;
        Wed, 06 Sep 2023 02:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693992118; x=1694596918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5mkTCP1wwaR9YuY5H6Ulmq36vtFFoJH9HnExkyxKpno=;
        b=VgdrWh88TgFDfk1fX+u9j5jA0LdvLlnEQOBEI/UDswxXOBDY8+ftcZpx0FAgvrV5gH
         uUmSMZRBaJu+06ZMFxWM4QfziOE/2HwbWVRbn1VHjV8nZntL17/ZG9qIql0Jd2GKOSeV
         BPd/4UleYibXg6EXWPhMSQOdqPXSd/Mc0V1Ub95c5NIBqiHlQdXm9E17lsACbGZA3dmT
         1cfqXqInw7xCfped6wEHK7ZzGeQGzYojtok1WG83e7SBnxPUEPKOqMW56NxVCm8xh8Pj
         1Io0xtRdoqHeDDvfDqzHnyEu2Pzw4MOzx9eW1Tpm7kXPZZYfNLod7nl2PyFV2vxWJkr5
         oukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693992118; x=1694596918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mkTCP1wwaR9YuY5H6Ulmq36vtFFoJH9HnExkyxKpno=;
        b=SoRW8IMjzKRCsE4tvsgKxQBUZdI90OczFEZjR9xbihztV+WrFIENQjzJlHnI3nrpfE
         J7unbv5loUyTzLn0NfYXpegfKXPtH1lirKN7fcA7OkHOXwZUixbTJtHkk61rHQNSwhV3
         ko2XSaZKrh0na/IuGjuQfKVzr2uhYijBpNFLCaaKvLxWfWbCMeoiSoeB9P55+8TY/OPh
         MnilK2C6J/46pq/xtfNHwoiH0DQpu77inY+J2yYYN+rLq8lLCgFY17yy7S4jJjMOiV3G
         RkHAAJ+oYFMPFPPX/jfqd98iwluUT2mY6mQK6OIs7mX2jIBlKVULY7CWTMt6nfthtyTR
         f1FA==
X-Gm-Message-State: AOJu0Yzvfqh2ZZo9/NMT1aoJxMgFS1/VfdV79BoRACAq9uz9NpBov50i
	O6y6MPMCfap2J8VXQkDyUlo=
X-Google-Smtp-Source: AGHT+IGumS01xDzHXnzIBN0/ozMrBV2bEocZTQWgT9l9f/ywNuBPFlMEot9zOWbNCsaAOm4ZDvXC+A==
X-Received: by 2002:a17:90a:1050:b0:26b:5fad:e71c with SMTP id y16-20020a17090a105000b0026b5fade71cmr13211092pjd.2.1693992118570;
        Wed, 06 Sep 2023 02:21:58 -0700 (PDT)
Received: from hbh25y.mshome.net ([103.114.158.1])
        by smtp.gmail.com with ESMTPSA id ft15-20020a17090b0f8f00b002684b837d88sm10679242pjb.14.2023.09.06.02.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 02:21:57 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: justin.chen@broadcom.com,
	florian.fainelli@broadcom.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mw@semihalf.com,
	linux@armlinux.org.uk,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	maxime.chevallier@bootlin.com,
	nelson.chang@mediatek.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Hangyu Hua <hbh25y@gmail.com>
Subject: [PATCH 0/3] Fix possible OOB write when using rule_buf 
Date: Wed,  6 Sep 2023 17:21:04 +0800
Message-Id: <20230906092107.19063-1-hbh25y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_022202_182136_FA1F5005 
X-CRM114-Status: UNSURE (   7.09  )
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

ADD bounds checks in bcmasp_netfilt_get_all_active and 
mvpp2_ethtool_get_rxnfc and mtk_hwlro_get_fdir_all when
using rule_buf from ethtool_get_rxnfc.

Hangyu Hua (3):
  net: ethernet: bcmasp: fix possible OOB write in
    bcmasp_netfilt_get_all_active()
  net: ethernet: mvpp2_main: fix possible OOB write in
    mvpp2_ethtool_get_rxnfc()
  net: ethernet: mtk_eth_soc: fix possible NULL pointer dereference in
    mtk_hwlro_get_fdir_all()

 drivers/net/ethernet/broadcom/asp2/bcmasp.c     | 3 +++
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c | 5 +++++
 drivers/net/ethernet/mediatek/mtk_eth_soc.c     | 4 ++++
 3 files changed, 12 insertions(+)

-- 
2.34.1


