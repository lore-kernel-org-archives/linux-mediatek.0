Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A931EB8FAD
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 09:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lxgSeotXhtluM5Y7Gic0yIlmVnTTGRsI6a6z+f7glM=; b=Tqs9HbHJqR4VYxG70KpdnkzTcQ
	/B4Ddl+z7K4/M9RKktDUAeRWEswoIVigERISSVNspvG6UYLD0tamCK1P36ZzPX1BVudRMSqeuw9MS
	ySvMIytgj9SvjB4Gmq1yzRqPBooihBOuo6iCs1zwU5CzrIvjcBaPJHq8RP/i0c2FW0WuNiaYlFZ/l
	N+EO9jc+MjcHeBDE43wxXnEMc+psE50emGRsRt5uzq0ix7Vk8M7nGjk3Pxg2K7LjSkUznhaCcr3FJ
	M/8TRvkPO5RiwwclO0WTt6sI2SXHetIsTjrNh65a/ZCD68PN2kplFo1HDGUr/lsmtWOvx5R5k4Hdt
	oVuq8jAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdok7-007tqm-10;
	Wed, 06 Sep 2023 09:22:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdok5-007tpi-2C;
	Wed, 06 Sep 2023 09:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4lxgSeotXhtluM5Y7Gic0yIlmVnTTGRsI6a6z+f7glM=; b=TlKThJehuHSlsqG40bs4lNVUxo
	50xVLae8rd7HpiSBYOls7+ARuFLsXGv9IZSkVM4U8dxXpAKAnLdYnCzXkVrKrfYVvqTDXao4shmNL
	w3SQkSgUq7xUjIX6Lw7RmWIVq9QHtAsXdVY+BWbqeH3WCn4wtniCTy7Z/yAdwBDrN+9gha/4cYpDL
	z2RETUCqaXN4mFRGtVBaK8quW2hqT5f+rbvaZYj86jrAMNWBuTgQGnje0pEs0tWbfpQ6DANlcP8vC
	+jNyjWt2RQVhy/7mQw64mRU74kxzdPjFGqTRF2Zkq3Mnii8J9Xqdz2TfcygtHDN20GYpybbzzI2I6
	+DfYcvtQ==;
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdok0-0010lh-0O;
	Wed, 06 Sep 2023 09:22:32 +0000
Received: by mail-io1-xd44.google.com with SMTP id ca18e2360f4ac-797ea09af91so4940239f.1;
        Wed, 06 Sep 2023 02:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693992147; x=1694596947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lxgSeotXhtluM5Y7Gic0yIlmVnTTGRsI6a6z+f7glM=;
        b=c/6CU5CkqGhGV/y7trn+/q1p0Zz4i+lVVT9Tuik0u3d7gIArp5TWh753Ae0V1KVium
         +vJpFLGcxV4sVFas+orsKjqcfHR1Z3jnUxxGx9JS0GNahIHA4wEE9KPJ9KC1IDhwpHPT
         /wn/L0MAh7sF+D9+9eZNMGyIQEvYNQ3mFLalFVX+M654fifW/eTs02h6XK8TU+TsCCtz
         sonr/wi9Dgs4OUMzei7yvAc04YQBAx8zVjPEsxlCCEWoTwprpRaKzwMoOa55K1wAfEgz
         TDYZ6T/B9yDaH/KN8dEarDLoAbMZTLb5oGq8IrNaWE4QurKTo0yU/naoH2iEcXm4Y/sO
         FMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693992147; x=1694596947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lxgSeotXhtluM5Y7Gic0yIlmVnTTGRsI6a6z+f7glM=;
        b=CAb2yyQLJIN2o5BESUfdlwovG4PsVs+UA4JUaxbPNmO0vYk6yM2VOqjyYEMZNh5gnd
         pNLaBlYi20YhmcyZ66GtTAF0/nCEvsCvvCLteeOFTFRfMjgYVfVhxxI9C21fNcIaXBYg
         gKj1vHmj4ILyLFdVZ9W14eQsUlKQiiac+yMPAs7Hyl1KaT59KiwT3NP/d4qk5LYCMNo0
         5JAhFOPQ4o4Gfdgqgfz2c0pYcO50p8u6CN9PTcRmGZQIsMzH5GaitQNv4JNxfgRP8hJ6
         Sjijy62C4gDMR1Vbw382t3Ervxz39hvSAFdeQni8+QPS+HyGMRxCfeaCmtumjBN7CTGy
         X9vw==
X-Gm-Message-State: AOJu0YznqsnJKIITl0ls1qjeXcRPVcQhaJf5FS+rnuFmVr9jVJt8dMJl
	+TIFOloyfubVB5qktvy1LT8=
X-Google-Smtp-Source: AGHT+IHgtjBcMfcAVv0cvr5pcx0KRu57NHijg05g6vWK0eh4cHfhCe88XtFsAw8hxKpJW3dkgMFv5g==
X-Received: by 2002:a05:6e02:216c:b0:34f:3b12:799e with SMTP id s12-20020a056e02216c00b0034f3b12799emr284714ilv.0.1693992147534;
        Wed, 06 Sep 2023 02:22:27 -0700 (PDT)
Received: from hbh25y.mshome.net ([103.114.158.1])
        by smtp.gmail.com with ESMTPSA id ft15-20020a17090b0f8f00b002684b837d88sm10679242pjb.14.2023.09.06.02.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 02:22:26 -0700 (PDT)
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
Subject: [PATCH 3/3] net: ethernet: mtk_eth_soc: fix possible NULL pointer dereference in mtk_hwlro_get_fdir_all()
Date: Wed,  6 Sep 2023 17:21:07 +0800
Message-Id: <20230906092107.19063-4-hbh25y@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230906092107.19063-1-hbh25y@gmail.com>
References: <20230906092107.19063-1-hbh25y@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_102229_927477_ACE592B0 
X-CRM114-Status: GOOD (  11.35  )
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

rule_locs is allocated in ethtool_get_rxnfc and the size is determined by
rule_cnt from user space. So rule_cnt needs to be check before using
rule_locs to avoid NULL pointer dereference.

Fixes: 7aab747e5563 ("net: ethernet: mediatek: add ethtool functions to configure RX flows of HW LRO")
Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 6ad42e3b488f..d91fc0483c50 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2994,6 +2994,10 @@ static int mtk_hwlro_get_fdir_all(struct net_device *dev,
 	int i;
 
 	for (i = 0; i < MTK_MAX_LRO_IP_CNT; i++) {
+		if (cnt == cmd->rule_cnt) {
+			return -EMSGSIZE;
+		}
+
 		if (mac->hwlro_ip[i]) {
 			rule_locs[cnt] = i;
 			cnt++;
-- 
2.34.1


