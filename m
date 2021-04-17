Return-Path: <SRS0=E/q6=JO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E314C433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 07:29:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0C8C611AF
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 07:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0C8C611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/m3LqXB1cLwjwowIbOYwS9kojOmparD948OQUMcrVUo=; b=F1HPF1Fxz609VYANs4N2Yczfd2
	DuqalB1GBcgX/vGqPJNMAGRQjiAepLxbdu2oQv2N2TH70eIRdJHxjLMlUHYqW/yKpUhBzn/gM8m9b
	FInV6A8NfM/wFkOd/W38teyj/GpWXnYPzeu6LYVvlg5nrq9wrYop9I98okzoBfxfCsUQOAxi7mU8W
	L9qX2rlGqhVT9mfMe4uADbnFuuyZMqOlJyGhsYFGqZAnnFBQoyJiNsN8JvdW6MoTc6eAUI4ClCFwr
	ZaqJn7ZmKp3iUL9Ec6ryu9SEI4nqSK8yxpD9u1RvYVIWt2tdZskC5hsclKMXJUonmUsknCRNpsGX1
	XDyrZ0oA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXfOW-004fYw-Aa; Sat, 17 Apr 2021 07:29:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXfOH-004fXY-7L; Sat, 17 Apr 2021 07:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Rh+LLyuUC21RXq9XkEfu7UxePoJYFAfS/R5i3+yiN0Q=; b=UF6dR8BK/gvGhzndjtlrSmOiY8
 3+CMYgrToUAPMbSCmJeY0KFYTA6E4R+biKPOnulx3tUySFYDJfTjitRpu6E6szaTqksqZOnmTC55E
 knxFyX1Tae4FD8RoJN/+JDAEdydMYysufpShGWy+sPLFx055/a4vdgjgr7mg0IZQjo6LPrpxuB2Kj
 rHAkYTlkcPR3c95RyXJywYNrxrTJhNQvDCGlyDeH7q+TJeZpybZ0k/PEP49Zn/6wLAhi6nvHsT5jt
 Jk2Gyy6A4NpSYZFF1d+6F5jFqPw13+i7dxm8i1mANhG4Yjn9sBq0xy1B1Q7hLwwhrtIYiu762Orrt
 EjBIwlNA==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXfOE-009v9g-PA; Sat, 17 Apr 2021 07:29:16 +0000
Received: by mail-pg1-x52b.google.com with SMTP id z16so20677087pga.1;
 Sat, 17 Apr 2021 00:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rh+LLyuUC21RXq9XkEfu7UxePoJYFAfS/R5i3+yiN0Q=;
 b=iVJmcFdZElVJ0EKUFNmO1njWxmViHa4WdBL2LMETXZ5WIpnYw7CfQsYalBwktpcMMy
 gbtBsAUrdBdhZd0tjEziYUD1ep4LwiOr5Q4hxr7QVjA14eiAIeQcylklfyPHGuXr8Vgo
 UrApGFC472p97VeERD+LNJccD1eInp4HAJzfqP68d52DA1V5iXQSZBnu0/4iaVLTNntI
 GyQcd1WPeyZWUGS4Qoiikg1QI4ta35z5rff5FkDAxQYkzCbb85+tuUXbdjxKmqR9Kdma
 4VJNtYnH/5teEg70XsTXmqwqn2tLoDr+VYQhnLpblWE2CubQ27CdG62hx3FQmZi42yVk
 wZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rh+LLyuUC21RXq9XkEfu7UxePoJYFAfS/R5i3+yiN0Q=;
 b=IypZkwUXkZq9YekbggheALlfMIm4d+aWG4StOQOkgQ5/DSTlt1J2KygerYiD4v2szO
 HpgO9Dro53QtUK7N1jl9MBtgMki5KoY4odzijowQhIDn/n2xImIteSbbGo0bHsO3xYKy
 Z5ILdbJYzPifeW6ZmA1HviLZVlzZNB64pQ/ctlbVvZ66rO0tjpgVr/j67SuH4SfGw3hO
 aZ1nNJGuPideM2t2KNUL5DzH1NOrLWaUjmzDM01rQngtXFMqoiMVLRmMCfcJBYHdckyU
 wj6kWQtwYGrm1qgE92ZmGagRN1q04iGQRP+AruQyXj9rK2XwzsQSdv9vPduaA/LQ0Dzw
 yr8Q==
X-Gm-Message-State: AOAM53337rrDIL3WkaUFiugDrk5+H8IiaPMuP6+nZPHQnKoTM9cnpwP2
 W/n2WfsrTJipdE3SVeQXhYE=
X-Google-Smtp-Source: ABdhPJyX5O5Y7rZAeFbAE5I2m5OdbcRi0PgfKsEPGOCc3ns6NqxQGWMZA08UHuCSwwLHsmiO4OTO5w==
X-Received: by 2002:a65:5b85:: with SMTP id i5mr2406337pgr.269.1618644553283; 
 Sat, 17 Apr 2021 00:29:13 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id a7sm6125860pfg.65.2021.04.17.00.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 00:29:12 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Alex Ryabchenko <d3adme4t@gmail.com>
Subject: [PATCH v2 net-next] net: ethernet: mediatek: fix a typo bug in flow
 offloading
Date: Sat, 17 Apr 2021 15:29:04 +0800
Message-Id: <20210417072905.207032-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210417_002914_865040_2BCB59EF 
X-CRM114-Status: GOOD (  12.51  )
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

Issue was traffic problems after a while with increased ping times if
flow offload is active. It turns out that key_offset with cookie is
needed in rhashtable_params but was re-assigned to head_offset.
Fix the assignment.

Fixes: 502e84e2382d ("net: ethernet: mtk_eth_soc: add flow offloading support")
Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
v1 -> v2:
  Refined commit message according to Frank.

 drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index 4975106fbc42..f47f319f3ae0 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -43,7 +43,7 @@ struct mtk_flow_entry {
 
 static const struct rhashtable_params mtk_flow_ht_params = {
 	.head_offset = offsetof(struct mtk_flow_entry, node),
-	.head_offset = offsetof(struct mtk_flow_entry, cookie),
+	.key_offset = offsetof(struct mtk_flow_entry, cookie),
 	.key_len = sizeof(unsigned long),
 	.automatic_shrinking = true,
 };
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
