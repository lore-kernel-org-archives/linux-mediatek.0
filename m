Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00015C27C4F
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Jun 2024 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kdcreUxt3em3AD6YvcpNiMBlzrbyIyl8nuxvmtGXEdY=; b=Z3eL+Tp5r4Fjf/aV8zm9w18ZMG
	8gL3XcGWapIwHPLASAVQAYHKGt9FQjfOrimAHgDjoIJw06lKYGPXkTrNlqxCiypFw8PlGT3t6KVee
	X3miN/T269o6BkyGVBDp4XQhf5QmXG87fefF+f1afeS0aKSm6Yk1mIfcUdmLUNloK3290kyPnr56x
	8w41HTjW8UqDU61UpmZIb+i/seGA707tuJIc9HyheVn13XSiNOBdhVkLyXaitE3zFrSubYasDVZri
	yopKjZsqe2Kd9PE/1mu48GMnmr79ymi4YFIcwwsQnwFnQejTzrz2PN5GPFDsVmg+loTVT65LbdXgq
	KFtkDH4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLRNP-0000000EVYP-2Txb;
	Sun, 23 Jun 2024 17:51:43 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLRNJ-0000000EVXA-0wOw;
	Sun, 23 Jun 2024 17:51:38 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-52cdf579dd2so1079068e87.3;
        Sun, 23 Jun 2024 10:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719165095; x=1719769895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kdcreUxt3em3AD6YvcpNiMBlzrbyIyl8nuxvmtGXEdY=;
        b=H1EfdUmUYh3v4ztMXzqaQmy1KS+qEhMqPIFMShofDxXl1gPpzlXoiFEboU8RRILFY7
         m3tX4rtYaCCdfAPN/6RbXU87jHk0eCfPbAc5GQgKJn9FGmM6j45f8MjPjjyhtn074DQV
         tpJJNaVQu6jVKNaIO7yrByDY3hyq0ZU0Tb2C6OBd0lBGc2yjfg1XDSrSZXHEDnKH5RqC
         +azMSIleWcgowgLlKExFg+JFm+Mk0t87c2A9ubCai9RNLgI0216rEkvtHKBqd0Qvp3Cp
         ePeT5ZvM4g0bHzyU/7VnQnqh0MAczjh5KjFu65/By3MnWQgf/Fx9baBqZ/AYaapbHxYZ
         xgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719165095; x=1719769895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdcreUxt3em3AD6YvcpNiMBlzrbyIyl8nuxvmtGXEdY=;
        b=ubmZzmMqaEG9EqGhhoo1jQJ94rl3YnAlnk1Pay+G0quZhoSBEQr+ohxfeA5ulBvRuC
         QHcuYQ9H460dGQyfCyXDgNuNi5rAuyaM3ubbL+GhfGPjPFHEOg4PubgFm73YrAGWvVSx
         dm52LadFAnWBPgC3vIzNPxpJS5SrUWGWm430gvrscVjoIfKXoBuPlMapOjSgFQBtA1rH
         r16XloTZKCHWHZpPZiDUEGWcpEZp5q93TzecIrh25SWSSda1j0oxYEsuB0N9aDDnCla9
         JcK8f5Lvw+PbmIFh2St2SvdOqDOlW4rWOlCadbskPSD3n8P+RWsk3oZXntwNoxxYft0Y
         IKcA==
X-Forwarded-Encrypted: i=1; AJvYcCUIuNOfSZVq7BMUE9W7Q6vYitf+5z8D+OaeFeFuPLEDeXoNzYo8XGsWGocEBmax+s9fGvdgIZhTel+QgSQwKFDs2WdUTAl9tzPejwQi8TH+laFlpxrzzjAxgNQMRlqbP0t3TRFNCvzRZtlsmSOY30dpTAMX2+sZQJ8=
X-Gm-Message-State: AOJu0YxrihK9SxbUOrxi8srFrB3VQXhRdYKou7cDShYZmxMor0OJEiuf
	sqxQ60ffhYuiVDhlxXBBOtMW5RVQd1CLZeE4r6OLsPYGRB/7cDvs
X-Google-Smtp-Source: AGHT+IEDs9kn2GAQdZwBasIOD1+F5HhqKnWQ7Vdp3GVBS7E9o1Z9R3kZ5rqtaCh9WMX65Fh4ViDg4g==
X-Received: by 2002:a05:6512:2147:b0:52b:bee3:dcc6 with SMTP id 2adb3069b0e04-52cdf820929mr2018737e87.51.1719165094428;
        Sun, 23 Jun 2024 10:51:34 -0700 (PDT)
Received: from yifee.lan (IGLD-84-229-253-201.inter.net.il. [84.229.253.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817a9667sm106010095e9.15.2024.06.23.10.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 10:51:34 -0700 (PDT)
From: Elad Yifee <eladwf@gmail.com>
To: 
Cc: eladwf@gmail.com,
	daniel@makrotopia.org,
	Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next] net: ethernet: mtk_eth_soc: ppe: prevent ppe update for non-mtk devices
Date: Sun, 23 Jun 2024 20:51:09 +0300
Message-ID: <20240623175113.24437-1-eladwf@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_105137_285964_0CE53F3E 
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

Introduce an additional validation to ensure that the PPE index
is modified exclusively for mtk_eth ingress devices.
This primarily addresses the issue related
to WED operation with multiple PPEs.

Fixes: dee4dd10c79a ("net: ethernet: mtk_eth_soc: ppe: add support for multiple PPEs")
Signed-off-by: Elad Yifee <eladwf@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index f80af73d0a1b..f20bb390df3a 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -266,7 +266,7 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
 		flow_rule_match_meta(rule, &match);
 		if (mtk_is_netsys_v2_or_greater(eth)) {
 			idev = __dev_get_by_index(&init_net, match.key->ingress_ifindex);
-			if (idev) {
+			if (idev && idev->netdev_ops == eth->netdev[0]->netdev_ops) {
 				struct mtk_mac *mac = netdev_priv(idev);
 
 				if (WARN_ON(mac->ppe_idx >= eth->soc->ppe_num))
-- 
2.45.1


