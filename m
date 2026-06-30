Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1192C43327
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3SLRCeShC2U5Lb0rTb1U6hkwISYxR1k50UcKsPQ0QE=; b=G7JIWbcDghjjpLYEpCCRMHAlKo
	aVrpdhotT6v4C/uD0fdpwR5PQqCJ5xtQ2nM5LU70+44QuEqJaQ/dTuxIDOiN26/OklOFhx0W0coT1
	hpnfGrou7Lsa0ZWLTRUTCrPxi66/jcMeKxnwoJt9kkN6CJHYy13eoMLtTi66xzNyljgtmcTItOQ5c
	C/vAbsBqTSCb5kPetadcFeB/WUmDtkepbhu7cte3MWmqt3Ndu2Y59SjPTLt9dd2/Cc4GDV1+8AtS0
	jimKs5DrzvYUoTxZd6I9XOGtgJe5bCfZKoLEvq5bJvpEic8kv48Ftn2CE84tnef1LaUfiCsl7yP2P
	fymeysRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSQH-0000000G36r-3MTx;
	Tue, 30 Jun 2026 06:58:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSQ9-0000000G2zv-00eb
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=K3SLRCeShC2U5Lb0rTb1U6hkwISYxR1k50UcKsPQ0QE=; b=YjgXCjYnL7FmcRxp/2AsfqBpTu
	CP348R/Hvpgas8Gfdtn21X8BbAdKgln4wbzmvQczDBnbixvllnDc5/TCg1kAbL+TvK484GC5sheNA
	/1MfsG0lmI2PpG4pK4YZYZWI9p16yTqH8xD94cwaD3mFPn9Wo2hCbsDPIx/uv/zNAjubtrNoFnLYR
	O+UN4IU7H1BRqBeiLGsZuAOP/eezS7QvxJhVag+5OmtQ1lKmjUyfCmsLwTIHv4VGiZxSWTknYeqbB
	UBtL7NxyMNn2iXfQZvUEj/mUrllY8tlADZ9qGUGK8BzJsHuPzwh7InoK3r7WFth2SWqnoJn8PbV7h
	XzhdTHIw==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weSPz-00000001aG5-43dV
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:58:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-46db1eb3100so458105f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782802683; x=1783407483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3SLRCeShC2U5Lb0rTb1U6hkwISYxR1k50UcKsPQ0QE=;
        b=rDv67gfTy6y5mz1fu3ughc8DTwSxwU42RBaLVy+IF4ZRxtJIO3Zvz7fOvDOFtVPSaE
         68qZK+zVGvwDSW90V0T3VisNmxfiqu8LAvvSDWgN7K7BI9adIls0sUlIV1uESJVLeOSk
         uvYyPL6AOlaslklQWH3OBgvEvcl1JkSh5WNYAxIOkP55gOHIZ9KCoS3VK9UcptV5vl7e
         /aKNvfsiSgrunXA3cosrNzxU5Mw8gDlsFlVvw9AtU7OMMNJ6ctakECmvQ1be+RtJpw+w
         jvC+A7sTzFoX5Z35cqEu0bHams/M8ZrafVCUa/MqtdYVPPjXdUxnPJybQIWrlEgLN/eT
         Qc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782802683; x=1783407483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K3SLRCeShC2U5Lb0rTb1U6hkwISYxR1k50UcKsPQ0QE=;
        b=fzjIbRoDvJN8gOBeztelyH0YIdq/yg+8/zgU0cZfa6sQya3b+TkjrNS6udScmAG1KK
         QtqRP3s9Pjl+4UTvVry7UrBEKbZhHMdHJgQbQ9dqkfAZ+aXvHYh8kWXW69gfMMV+MUTT
         OTsKLw2gcjgQKCUojztO5U4kvHqgnoeqeWwHN/jOWjT5UYZfJjhJODV5gLmTGXRhUuyR
         yyJgrAy+6oi4suV5tUC59aBqA+iD2+SH9aQ3LbnspuCaChN2/AHpQ3hMMBUuZdF8E3eR
         Uy3IYAVS27L0GfjWf+ASGXHbGdLfN+Bc5sbIrJ3XWL7YW+3bMsPF6Unp/S9tPLjZuifY
         nPeA==
X-Forwarded-Encrypted: i=1; AHgh+RoikC+TXhwHseLwIHCl5RGBsBFfbQGu/5VV9faG/VCWF41/oalL16fkE1cyAqMi7NeyJVFd5HUzWu/TvUsbfA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9FqP6S4Yfq+wedMu3I+N2MwxY5oNSCywd2IJGe283lf7Igs90
	bKi+hqQpoQlIxGdvs3sYRaVZtAL2yueHSqlzQkQGWBkx6IpISuFw5tdK
X-Gm-Gg: AfdE7cnJ8nW3VdLZiQ76AZzwQPK9h59EAI1QnLkbcIw5+fyhGopHcG3V0Pi5lRYXfDo
	7u+GgKmiHm/UC/NkCWI9o4Z54iw5fqaqijNTwnBeVmaVInxiAo4an+D8qNiM5cBRruYKx8sR23L
	BKKzyn3w8nZyABaIuK9shzPLXTzCRmhmV0h778iEZUks/JuyD1fqR/kFnQ5XvYbGmeVChAP/tLD
	NBT5wHZsZfbvW3UDj60CRBiSYf2O9OboBwctJTPpv4C633o3as9idCCR0gnfeAH8Fe98BS/eyC8
	twlgf5YEkJZ1UNaHtj4Lk1RPRwlMuwuuGuWyN+Ol2OgbFmrzVNw1yGzVlLgEBIsTT8jOyIxQtDJ
	lXxOiuGU6rsNg5HaLQ3eOSHn4AWzbow5sqGS47/IXtpgq7j6pdSRm9jHnPr4fTFWTJdg3hIj1De
	fT+qxKmPM=
X-Received: by 2002:a05:6000:2c03:b0:476:135a:1349 with SMTP id ffacd0b85a97d-476135a1477mr139610f8f.6.1782802682657;
        Mon, 29 Jun 2026 23:58:02 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm4570949f8f.19.2026.06.29.23.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:58:02 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	razor@blackwall.org,
	idosch@nvidia.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bridge@lists.linux.dev,
	coreteam@netfilter.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	rchen14b@gmail.com,
	lorenzo@kernel.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH 4/5] netfilter: nf_flow_table_path: handle DEV_PATH_MTK_WDMA in path info
Date: Tue, 30 Jun 2026 08:57:34 +0200
Message-ID: <20260630065735.3341614-5-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630065735.3341614-1-pawlik.dan@gmail.com>
References: <20260630065735.3341614-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_075809_441939_006FA7A0 
X-CRM114-Status: GOOD (  10.83  )
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

From: Ryan Chen <rchen14b@gmail.com>

Without this change, nft_dev_path_info() hits the default -ENOENT path
for WiFi bridge offload via WDMA on MT7996. When a bridged flow goes
through the MT7996 WiFi device, the DEV_PATH_MTK_WDMA step does not set
h_source, causing the PPE entry to receive a zero source MAC and packets
to stall in both software fastpath and hardware path.

Based on a MediaTek SDK patch by Bo-Cun Chen <bc-bocun.chen@mediatek.com>.
Signed-off-by: Ryan Chen <rchen14b@gmail.com>
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 net/netfilter/nf_flow_table_path.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_table_path.c
index 6c470854127f..580aa1db3cb4 100644
--- a/net/netfilter/nf_flow_table_path.c
+++ b/net/netfilter/nf_flow_table_path.c
@@ -219,6 +219,10 @@ static int nft_dev_path_info(const struct net_device_path_stack *stack,
 			}
 			info->xmit_type = FLOW_OFFLOAD_XMIT_DIRECT;
 			break;
+		case DEV_PATH_MTK_WDMA:
+			if (is_zero_ether_addr(info->h_source))
+				memcpy(info->h_source, path->dev->dev_addr, ETH_ALEN);
+			break;
 		default:
 			return -1;
 		}
-- 
2.54.0


