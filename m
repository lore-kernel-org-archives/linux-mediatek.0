Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB0CC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:06:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95A0A610FC
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95A0A610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t9dJAnIX2kVM2S7S6uZ82g7irJIUrKVmR/oLPw/ou0w=; b=rOOWcimJXpQLPx
	Ky/Y8IhzfNbEf/spyO3lpemdJD8fL6jELBiiLOhzeBBg9Cirwkah34kGlcM9oEj6KaXUtzqgStdoc
	ZtQ0r6196WxVevpoHUK8GoM4RMAvpKpsKZPo+NScCraTGs+T2fYt/aErUATi2c5jKZOfRnw9bFqCR
	CnDbiVdoDvgEqdeIkJj6iv/NnGA/ZuAiNrOwVB23kinmFGTMgF2+wkF2nHFeH7mcaTZQo91NOgqLA
	T8w6kzyHLaLD9BVNged72yiyA5TrR6Pcf4054bopAWOU/b0TeuVlY2XZX19uKcjlU/RJT0Szdroao
	eNSkxc66yzb/WLhWwXSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBr7J-00BSFE-Gw; Fri, 06 Aug 2021 04:05:53 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBr75-00BSDN-6W; Fri, 06 Aug 2021 04:05:41 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so14950873pjb.2; 
 Thu, 05 Aug 2021 21:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8xTUSIk0PEm8dgw5EgzCWiooT9Ptt7rnMynSDDHrUL4=;
 b=P9QyDwPfaCBusnlXTuu8jpSN8khInXlLCQ/da6NCgEyS3nN+rpE75pUJmpr4/XwEMv
 aErgvi+ExObcztUeWzsK4JDkhIoDldjw8/RLiiNFPwlFk3XrV4IYne/UmWpGRRgu74Q9
 xyUYCgY39kEhZep5et8zywvCTZ4Nh3hyVEkppRQuY/igndPb30C30qHWBuZZSSonNlm2
 6QAF397lUIAqDlg9Di+bOhvCOtOcOJhcMShMwto4tOykNPjdNAktEd09F+0wbgUOKMGM
 5T7DCvODfVxCfTZavL+NbxOwDa9EUIiDY4QJBLj9n3+66jvOmYyqrFAOuFjh19QhF29Y
 x1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8xTUSIk0PEm8dgw5EgzCWiooT9Ptt7rnMynSDDHrUL4=;
 b=OiU1mLSKACwGuxb+17hIVZTAPGQdBUn6GpGBl0CfHTubni4x8KiJFGCiCZUUsmYcLa
 Yuj0FvyP9Ksf9xjHDJLbuWTW+4vbO3EWP5zGXOn01d/iTlhKICwSedIhWZA6fE6BC4R3
 A/JHeOBKGeKddns4P22wUNGQkw0WCisKoUpdw7pD/ZPxgC5gyO3PDJyyw1H94e5Og25Z
 6ilHTBMkmUOY/5Hfl+Fu0Q4vjykftul1qHeV9QUOW5/7NY5Lz8lk/23WFrmDbKR3QLdT
 K/Xi55oaJVgBI0ACeKQ6/Cn0xYGsPnZM4U4HLuld3q38k7PA/Urn19dF5QI/JAhylCtw
 a3ZA==
X-Gm-Message-State: AOAM5302JNs0RHtzjTReK0Yv5iHnhGoR6blTMzVA3lnghxq+SeoRrwEM
 OE++vAkgzZjq+IU63FzHbdU=
X-Google-Smtp-Source: ABdhPJy2+Gv/lUqLi0cu47cWtSKJ+epXlw5mBn6fJYrYzFKdgAssRpEufHv2GHAmie5Vs+J8jK4bLg==
X-Received: by 2002:a63:5619:: with SMTP id k25mr286282pgb.92.1628222738170;
 Thu, 05 Aug 2021 21:05:38 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id 186sm8597505pfg.11.2021.08.05.21.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 21:05:37 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net] net: dsa: mt7530: add the missing RxUnicast MIB counter
Date: Fri,  6 Aug 2021 12:05:27 +0800
Message-Id: <20210806040528.735606-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_210539_301287_BC8B6CBB 
X-CRM114-Status: UNSURE (   8.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the missing RxUnicast counter.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/dsa/mt7530.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 385e169080d9..9d7c52172af5 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -47,6 +47,7 @@ static const struct mt7530_mib_desc mt7530_mib[] = {
 	MIB_DESC(2, 0x48, "TxBytes"),
 	MIB_DESC(1, 0x60, "RxDrop"),
 	MIB_DESC(1, 0x64, "RxFiltering"),
+	MIB_DESC(1, 0x68, "RxUnicast"),
 	MIB_DESC(1, 0x6c, "RxMulticast"),
 	MIB_DESC(1, 0x70, "RxBroadcast"),
 	MIB_DESC(1, 0x74, "RxAlignErr"),
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
