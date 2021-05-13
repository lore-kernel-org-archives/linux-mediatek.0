Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D40FC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 01:54:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0DD3613F6
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 01:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0DD3613F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ee
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yRxgN5OUEa7EFY/cQ0ib7kTXPK8nZ+WBUX9jKXg8aUc=; b=KV1BwwhsMVWb/lZW91qbYUo69
	BAkDXLTIl7xTEnh5JQO91tnACt4ET1g/n5Ax826NJTon0FvTyQxRWWnty2fUTEPwHhDC2djOqxj/5
	njmsRIF8HuTOR+IOEmUcE4S0nbwOJ2YuBYUqLigcB184nlTbcIYdAPbDlPdTluCnlHpRUs287iMtC
	m0XDHjveLfkOxBlrM6DkgTBSbA77Ex7mlwzTdmKJms+73JvapXGyfoimYi58e94bMAPhgFHkkBp2x
	hqrEeAV97ad3+dEwqPGtE/NVXZQaLnmQDL3a2CF014cl0aT53GPakUe0Df2ZuEdYJeWGpqUbDER75
	7i0nsyveQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh0Y0-004Qj5-DH; Thu, 13 May 2021 01:53:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh0Xx-004Qif-Ge
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 01:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=34VzXed8Kgnel45ijfIuHRVvR2WQNHxzGVweg14wlj8=; b=HzmYc6ZV8XJsY+XFx9Xe4sDyQ+
 vuK2jQ9Q7P+Qb7nGnxddakMCWCeimu1efuuiqhdunl4dTDRAvi+IqZ2ltEiu1TAObiiJW+6hPMgod
 wdGjg9I++oFwDPNyLh8UmTqkvA44AyO2b5TbMbahyCmIiCbMa2m68Md81f9NThzOb6D0C7VciApbS
 WonoYzxW6Ypoehea6H9xbDKlsmarv8guZitvDWJ6RVEr8YeClEvhVIulPoy8l/OFF0d52OHKwIk9D
 fMNG5CZpNmAakgZZZC8fJo0n01UHs7XuhjmKyF1oBra5/f1LLWYZNreXgAsciO3FDXGR/qlFmQdh8
 wZYdrmfA==;
Received: from eu-shark2.inbox.eu ([195.216.236.82])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh0Xu-00Axk6-Ug
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 01:53:52 +0000
Received: from eu-shark2.inbox.eu (localhost [127.0.0.1])
 by eu-shark2-out.inbox.eu (Postfix) with ESMTP id 7004D1E0072D;
 Thu, 13 May 2021 04:53:49 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1620870829; bh=pb32XrLr2f8ZsH/s6jvd/OiiD3RMHBuJn7UkoYGE4U0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=tjGbfW5Rv+VuOmm1qj+wGU1A82+PtfGxr+Pl1mLWZ5hJ9OFPkRIwNEjuCTQCoEPC4
 M9op0lxs+po/a+rfEe5o2zeSHarWI8d59zAysRjywTV5jw1LftfpijJJF4UG0sn7/O
 beRXJ/sYFtbW72fyXcUuPSkIh9bjbEwEUkVG/1dU=
Received: from localhost (localhost [127.0.0.1])
 by eu-shark2-in.inbox.eu (Postfix) with ESMTP id 559BA1E006FB;
 Thu, 13 May 2021 04:53:49 +0300 (EEST)
Received: from eu-shark2.inbox.eu ([127.0.0.1])
 by localhost (eu-shark2.inbox.eu [127.0.0.1]) (spamfilter, port 35)
 with ESMTP id vtwWD3FOazRc; Thu, 13 May 2021 04:53:49 +0300 (EEST)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark2-in.inbox.eu (Postfix) with ESMTP id 2588D1E0072D;
 Thu, 13 May 2021 04:53:49 +0300 (EEST)
Received: from localhost.localdomain (unknown [134.19.185.34])
 (Authenticated sender: arzamas-16@mail.ee)
 by mail.inbox.eu (Postfix) with ESMTPA id 14F0C1BE00D4;
 Thu, 13 May 2021 04:35:21 +0300 (EEST)
From: Boris Lysov <arzamas-16@mail.ee>
To: matthias.bgg@gmail.com,
	linux@roeck-us.net,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/3] dt-bindings: watchdog: mediatek: add support for
 mt6577 SoC
Date: Thu, 13 May 2021 04:35:14 +0300
Message-Id: <20210513013515.31329-3-arzamas-16@mail.ee>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210513013515.31329-1-arzamas-16@mail.ee>
References: <20210513013515.31329-1-arzamas-16@mail.ee>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: +d1m6vZSeEqpi1uoRXnWAQIzrDYrL+Dg557a3RxamGX7ODCFdk0TUxSr7hJ7DSP4og==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_185351_169196_27434572 
X-CRM114-Status: UNSURE (   6.38  )
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

Add support for Mediatek mt6577 SoC to device tree binding
documentation.

Signed-off-by: Boris Lysov <arzamas-16@mail.ee>
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index e36ba60de829..f5a5404523a3 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -5,6 +5,7 @@ Required properties:
 - compatible should contain:
 	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
 	"mediatek,mt2712-wdt": for MT2712
+	"mediatek,mt6577-wdt": for MT6577
 	"mediatek,mt6589-wdt": for MT6589
 	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
 	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
