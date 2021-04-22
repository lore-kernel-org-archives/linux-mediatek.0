Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64441C43460
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:11:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF6176144A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF6176144A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oiYXuSIz6Y39MhgpXsbW+Jal5Pnve/1nulMUr87HlNs=; b=lIIyhltZvxolv+gQODpGppxgL
	kcFz5EceIxXsS/9DwU9Tg3aQAvv4RpeeRncI7fAH6slRxFt1MrMdrO+WPPwgrfNNJHcVIY6qwfUjH
	quQkAzkmstaF23/iBW1n9Kz6IAztB29IOdQp9krCev4EdMNmUEYS3Xb9AeN5VuQuBrlBxsvr3KbUm
	vZ6YdQq50ZeJCDXDBDLa5eNwqYL7GAA/edS869QHvSQ5c4cPSjeXtkTbjDYaufq/i8oBNomXF3ev/
	rKZhXrEMfRwa+uv8diAAAjpQfuYXsJeoTh2fUiSVwA3Lhgr27snvXEvnDuSHOLS6zzGPaGUrivWJl
	/3X4Q9Ciw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQfq-00Flas-FD; Thu, 22 Apr 2021 04:10:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQet-00FlQB-98; Thu, 22 Apr 2021 04:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=HlVoF4WBd28mr16LsVXI69/qoWczDKwnY5ulmKa3JqU=; b=cXe0S/JG5cIRNSx0WNK2Tyz/DB
 q2sJ4b6vPfnzhzZ44dEBggGliZWm1rM9YBCwJ15MrFL8TLgoSfvM6nKVCJLkFD840K9C7G2SaoZBE
 9EjfsMi/1PQeXs3CfBsHUzbJjvl/jGTux0c+sUxbEz1F1vWnTEHvBSHpiQ1peSFUmjmJ2c/GnwgaU
 NrpDgunIuFMbflBa1d4ngXK0yW6q0nLPS8snxeK4i8/8alWC6LWzdf/m2HQX6LRkjJRLAexywpdsL
 CGoHRilL/vYcrf2ypyNWttRT/bJr5CV6ZFGXtuOQo6SBh+3Srk36RNVI0BVA24BhMz7Jz0uSJWEFx
 6ewC3fWQ==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQeq-00DLdC-R0; Thu, 22 Apr 2021 04:09:42 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso240283pjn.0; 
 Wed, 21 Apr 2021 21:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HlVoF4WBd28mr16LsVXI69/qoWczDKwnY5ulmKa3JqU=;
 b=KCCRAcZRH2q9WePwudcJa7IRn0oj+Hd4SYQlaLwHq3erd6z/UEgaXA0VjZeMEqrIb+
 Q8X+3nvCXsOfPr8nkzGciE8Qer9C3ZMOgUtKoqsebyt8sVkU+sCble0rLFQs7N4yi4uB
 3/VeMjw44NhnRdpvm0GZ/15WBaCM4nf97qah/8NLY+JDxPvVxFma5tF2CQNpPXLCc2Lk
 FNY3+3OziJcva+chnYgwMTneBff5PLp257aFpmSb/HEDus3rUrw8XZ+UASTZcppghyVa
 +97lDFhnWmWG9icoVNkz6om+a07b07Ai1W4qQX0M4NuJd+o07N/spwuzwN+9qdSoae3e
 qtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HlVoF4WBd28mr16LsVXI69/qoWczDKwnY5ulmKa3JqU=;
 b=UVbxAhkkGcv95l3bdjTVnSAu+mvnSNxKmiOneYl+YnrFzxVS7c6xOxWPj4/xr7sq1x
 v6ECqRm04GRuSrcUK68XKDCgmEY1T0QJ2D0BcYqYWyHmokpVIZh2a5c5xyuCXi9t6gCA
 BWBXNwpxgijNLKlj9TWuclNNHkxmXMacxtGhZRIE9WeMnvcufCARAL6K2FgNocnbo3lq
 kRLJI70ktQ//7To7cqu13YYYDEV46lK7/usF6pWplFUjIUEl5m8Nr1uRBpLq18IlylMK
 /La1mBEGhbJQmUmYyBhfUTwwBO7MlnwBqLDaRhVXo4FIoIyzp8cWS5gmKtJHa63NU6zK
 ll0g==
X-Gm-Message-State: AOAM530cXKl7hvD40rz5zlLbox1rz2IONJuzKuLNfrUTtoaZVloV+wPv
 N6t/RiBJ9kGN2wy2AeSIrTY=
X-Google-Smtp-Source: ABdhPJwm/HPuAW+zUXQgRnrXd/od7i7maE9NkKmpXPunzRtlbKEr3GPxchy0RmpvN8P7icTmsyIBTA==
X-Received: by 2002:a17:902:7788:b029:e9:11:5334 with SMTP id
 o8-20020a1709027788b02900e900115334mr1405530pll.70.1619064580121; 
 Wed, 21 Apr 2021 21:09:40 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id i17sm635354pfd.84.2021.04.21.21.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 21:09:39 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next 03/14] net: ethernet: mtk_eth_soc: fix build_skb
 cleanup
Date: Wed, 21 Apr 2021 21:09:03 -0700
Message-Id: <20210422040914.47788-4-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_210940_890627_2AB671C9 
X-CRM114-Status: GOOD (  12.12  )
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

In case build_skb fails, call skb_free_frag on the correct pointer. Also
update the DMA structures with the new mapping before exiting, because
the mapping was successful

Suggested-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 540003f3fcb8..07daa5de8bec 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1304,9 +1304,9 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		/* receive data */
 		skb = build_skb(data, ring->frag_size);
 		if (unlikely(!skb)) {
-			skb_free_frag(new_data);
+			skb_free_frag(data);
 			netdev->stats.rx_dropped++;
-			goto release_desc;
+			goto skip_rx;
 		}
 		skb_reserve(skb, NET_SKB_PAD + NET_IP_ALIGN);
 
@@ -1326,6 +1326,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		skb_record_rx_queue(skb, 0);
 		napi_gro_receive(napi, skb);
 
+skip_rx:
 		ring->data[idx] = new_data;
 		rxd->rxd1 = (unsigned int)dma_addr;
 
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
