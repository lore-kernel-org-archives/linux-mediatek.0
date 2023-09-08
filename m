Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CC5EE57CB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 06:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wpl/wrF03hm1k33VtCn3Pp91tnDEn9HNqN0mbE6woR8=; b=yY4u2YV0qH60egv74n3/8+ihHS
	qAiT4qF+UIxVPupqOqYtiFIoNEqXTP2jpvYZ5McJQ6MCH8z+xgtcIFFZAdccfn+Ls+w2e9prfAM4m
	3esk6BZ/ZcosdyzmC4W/PiNS/TBJCO6adz8WCGRf0P88KDx2q4P2TqRoZ6DLV+PDVcn/DD88JTUY8
	7fOZFGmMpMFV95DWHUvv2kVzzZcbfsPrgEhhgwZ8v/4/kmZnse+PobzshWNUK+0/ucOGjwKYhOFPw
	iKqpD3a/flDfnj+8i2D+S2fTJ/ET+8k4c0JaEjfyFViyAeeRvixw/gutmCjfwIrR7+3XnOZmM9hY9
	h3/U9oCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeUsC-00D9xL-33;
	Fri, 08 Sep 2023 06:21:44 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeUsA-00D9wQ-1o;
	Fri, 08 Sep 2023 06:21:43 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-1bf1876ef69so3930365ad.1;
        Thu, 07 Sep 2023 23:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694154102; x=1694758902; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wpl/wrF03hm1k33VtCn3Pp91tnDEn9HNqN0mbE6woR8=;
        b=s4QfhIbpSFlifbqJHO3LYJ9ueqMSe+41zj7Na/h1ifalMgorimP+Y/yDTBAPmgS1g6
         OriTnHfOvxksfimNEqljj6srOfV9HKEPRCiLJwcgjkXHT4qzmNODFqldmhgOdFYmYQs/
         fBHfyjrN8VVGgrPRzkyQT+WUrmqngBcmbHQ1zmtBk2Rb5/wvTSybrG9AwCrvo1DOHtvf
         1zkNrRaHrcKI2hrYPpCyp/uQF+6LSsuBQfHs0SIF7JvExByo2KUhRTs+U1VLALXSfiXg
         v4nSuNbPseKVqBTsn4M5oXPn/zCZ1k533K82I0oG750tH2Mr5gzqX5zogvbn7LQF6Sta
         qBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694154102; x=1694758902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wpl/wrF03hm1k33VtCn3Pp91tnDEn9HNqN0mbE6woR8=;
        b=a+/xGBwwsEceiUxquCeZ8IS5xFG4o+8hwcapP5oPv+dmOuDLwOHLUp/6O+sMiydwfp
         uoUXtXd3+JP8EpXvZMiSrH4ReROAXgQi6rMHRFJ3TZpQzPmH1NJp9fiI3OComL00CThq
         aABoj2jIGqhzTDr+/4VyVJk4HWAJm6v8Q2riGCyZq1RlmO/muZZ7BTPLL3FNyeO/VOFe
         wK980DRhOw1CcyPf+7+VHhctyDEF+jKRyf+1VhBVi5Tl0Rw4Aw4z+SBVum3pgxRrGaCH
         prh3jVW69vLCwMAQe4u8931fnmistYDmhTVSJ0o3+1kNy75c5AqjuUveCsvDgxywJcm0
         yGLQ==
X-Gm-Message-State: AOJu0YwG6kU7y2Fedyml/8Y8QmCQxxenY/oECMwjOkewTUxxlQqFhV0s
	E/pplx8sFT+T5YeOgid7XHU=
X-Google-Smtp-Source: AGHT+IEqN3LuOZvVGW/cDz1gygxDQXajdyrBxp5NvEo7QNyxpkquntuPCrDtubFkejvWG2NvFCobKg==
X-Received: by 2002:a17:902:e54b:b0:1bb:d7d4:e2b with SMTP id n11-20020a170902e54b00b001bbd7d40e2bmr1895592plf.0.1694154101997;
        Thu, 07 Sep 2023 23:21:41 -0700 (PDT)
Received: from hbh25y.mshome.net ([103.114.158.1])
        by smtp.gmail.com with ESMTPSA id l7-20020a170902f68700b001b8c6890623sm768620plg.7.2023.09.07.23.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 23:21:41 -0700 (PDT)
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
Subject: [PATCH v2 3/3] net: ethernet: mtk_eth_soc: fix possible NULL pointer dereference in mtk_hwlro_get_fdir_all()
Date: Fri,  8 Sep 2023 14:19:50 +0800
Message-Id: <20230908061950.20287-4-hbh25y@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230908061950.20287-1-hbh25y@gmail.com>
References: <20230908061950.20287-1-hbh25y@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_232142_600512_8555162B 
X-CRM114-Status: GOOD (  11.22  )
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

	v2: drop the brackets.

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 6ad42e3b488f..2372ce8c2580 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2994,6 +2994,9 @@ static int mtk_hwlro_get_fdir_all(struct net_device *dev,
 	int i;
 
 	for (i = 0; i < MTK_MAX_LRO_IP_CNT; i++) {
+		if (cnt == cmd->rule_cnt)
+			return -EMSGSIZE;
+
 		if (mac->hwlro_ip[i]) {
 			rule_locs[cnt] = i;
 			cnt++;
-- 
2.34.1


