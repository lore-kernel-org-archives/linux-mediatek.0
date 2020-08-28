Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 875EFC433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 05:51:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53A1E208CA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 05:51:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uJv1RBgo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="E0IUHuWu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53A1E208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sVLr7wNIn1P/tCVa0gU5vgMfRU4AOu4QNWAUnjMNjmg=; b=uJv1RBgoM5KsMTsWSqxj1FXnrV
	BdNdzp+oNuOlUB9/jR8WChJpQAdzCid7hZI/PbrDlvhzBOYBXY1sXJGyFlSFqbbo8Tpuakp2HD+O1
	h387hELSbR4wGBQYg3mtr+IKQjjAektO0kH0RF7Ae/kHkm5p3yEZyqXP7uTo/152EWGsRceTGfRWQ
	BVbmM62ld8LzBjIPhDZS/rmWYbL2Bpc7bnc6muojZHDUWvXwCrgIOa6Qg+mIW+wDWupNfibLzdFy1
	0uqPwOK9DbcJo2ihm2GbsPFrRWPujT58qJ3QWx4GrSu+TM0uZyKebWMAu9+jnJBoXEh4hhk9PkaQ2
	/oz4rTyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBXIH-00056M-QQ; Fri, 28 Aug 2020 05:51:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBXIE-00055x-Og; Fri, 28 Aug 2020 05:51:20 +0000
X-UUID: d99b162caa154c77a7cc885498a7cc73-20200827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=DsL7JdMQSOP11JNFHpjfppGikrqv3U4BccKwJYOaIIU=; 
 b=E0IUHuWuLPw5ApkLG+SVqyr6XYxFH/DHJy4Vyk7jYJ/79udTlts5trKDcol8aYXJes2K7edtgWQwa+6iK8NEjD3Rq0Ry6IT5AJJPTqFDe1WXQCRAREUWxFXTJOTVDeBhhZm+FBhCENX/wjnc45tAZ/pNW1jDquKFlhST9B4yuiA=;
X-UUID: d99b162caa154c77a7cc885498a7cc73-20200827
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <freddy.hsin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 989248338; Thu, 27 Aug 2020 21:51:13 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Aug 2020 22:41:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Aug 2020 13:40:56 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 28 Aug 2020 13:40:58 +0800
From: Freddy Hsin <freddy.hsin@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 0/1] Remove redundant condition for MTK_TIMER 
Date: Fri, 28 Aug 2020 13:40:55 +0800
Message-ID: <1598593256-6719-1-git-send-email-freddy.hsin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_015119_008600_7D3D300B 
X-CRM114-Status: GOOD (  12.26  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Saravana Kannan <saravanak@google.com>, wsd_upstream@mediatek.com,
 kuohong.wang@mediatek.com, chang-an.chen@mediatek.com,
 Baolin Wang <baolin.wang7@gmail.com>, stanley.chu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Remove the redundant condition of MTK_TIMER because the driver
can work on MTK platform normally, so COMPILE_TEST is no longer
needed for development purpose

Freddy Hsin (1):
  timer: mt6873: remove COMPILE_TEST condition for MTK timer

 drivers/clocksource/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
