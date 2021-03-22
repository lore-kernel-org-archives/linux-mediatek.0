Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C699C433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 06:34:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E20A96196B
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 06:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E20A96196B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Twobn6fSo+30S1pLldNxUjp2eK8ZeiCvuAIrJyepck4=; b=crTOK3to1LYU1K2TeB5hoxxyZZ
	UNE2W5R3TAsrinqJzjL/hRQP5Z0x0Q54EhngJkOgsKhwqeyIimCl265egbBEygcOdZ6+SS19e7UF8
	77dplp3GKIwZ76BoAIWVytazfvGiO65FIsZXbBcR58roq3jGV81M+6Hfp13C3sMia17zDjSN38J+B
	NftzJS2KpF212qKP+6RSVNtXM+0upplUeVlrdNoKToWUoIL2DlSJYcmn1B2RejrrS4id8R17gxFqx
	A71ICVWfi3H+OoRszY3e4hXVHO1jm9u9CNDSdLadxG8qPtkdnxoqX5iDcUoF2H22T4pwPUjny+5ZQ
	PoxBejDw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOE8f-00B1m1-Su; Mon, 22 Mar 2021 06:34:09 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOE8S-00B1hw-S0; Mon, 22 Mar 2021 06:33:58 +0000
Received: by mail-qk1-x736.google.com with SMTP id g15so9539000qkl.4;
 Sun, 21 Mar 2021 23:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aMT9e9sXdarjd/tWbYJpfTGyoS9GYb67cpZF9NVE1QA=;
 b=oSOcPMIA/8KBiYfyxap5Nkz+Ffz8+boq4NGiivuVLzHOIAPZyljEEBFiR+O5hgeL65
 6Q4UD59KmRQsuTITTYj8jFPjH/5T2J23ZH3fKaPq4Y2ZJu3K5LL4LXal562GtPEIwep1
 rCNBy9UQKhJ8TY7Snuie/XGs3j/ZNKhJM3QTnjQwdLZxuV+5ABB32alP6fwerpW1b5BM
 qHpUsud1xPqUowahS0MyfuqAh9Q6MVQ/o7+ykVt5Wzdyhk9Rtizk4jhsgd5eTbcc2Ee9
 n7yrViKNsb8I62UZBEHl4ynvDRcDAg2AhpvNSv0EOFABX+bPMIWACmyibGQoASfwUZZb
 PbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aMT9e9sXdarjd/tWbYJpfTGyoS9GYb67cpZF9NVE1QA=;
 b=MN8ldPAmzVngFBGF6z1z0Bs6xCghX7WDG/ogDx33YP4wYcbmhYN9BePr/Nk5pXfosV
 FfMWRb6nETQAmI23w82uG0kcoiZbLkqsV82lQkJfTVJL5G5YukwJEYqwp/6bv2Cc8D8I
 xLur/JIZkid56NepXMcEr1myu9f+ouStjsIsc4h9t6eY1mdbi7MQ8quDuBHX8gzhuHNZ
 nWX5hifhHov3b5jnMlg/o00fKSWjHAPOzssCqm7WKYCVRz0nAtOUL/cgvdx7WY+rdyFL
 1vl51riD/tHqtIMHxrLvARqNbL2xb99ON+vsmsLQhARJA9LZisE+zkaKPu7OqhNeVKOP
 zlxg==
X-Gm-Message-State: AOAM532Yo7TLXyX5XllhqPbr6CYcBYXq579ahtxI91jkfPIubmjvgPMO
 kzt5x/GC9HurdMlZ7zcAky8=
X-Google-Smtp-Source: ABdhPJzGrYCV2DbduDKOyH7Z5Vq04R2W3trl/1O2/kBRToGzC3C9smbHaa+dqRLkc59510W8+D10IA==
X-Received: by 2002:a37:9a05:: with SMTP id c5mr9358037qke.16.1616394834074;
 Sun, 21 Mar 2021 23:33:54 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.40])
 by smtp.gmail.com with ESMTPSA id c5sm10461969qkg.105.2021.03.21.23.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 23:33:53 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: rdunlap@infradead.org,
	Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] net: ethernet: Fix a typo
Date: Mon, 22 Mar 2021 12:03:39 +0530
Message-Id: <20210322063339.3489799-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_063357_162705_304A23D8 
X-CRM114-Status: GOOD (  10.66  )
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


s/datastruture/"data structure"/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index fd3cec8f06ba..79c9c6bd2e4f 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -908,7 +908,7 @@ struct mtk_eth {
  * @id:			The number of the MAC
  * @interface:		Interface mode kept for detecting change in hw settings
  * @of_node:		Our devicetree node
- * @hw:			Backpointer to our main datastruture
+ * @hw:			Backpointer to our main data structure
  * @hw_stats:		Packet statistics counter
  */
 struct mtk_mac {
--
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
