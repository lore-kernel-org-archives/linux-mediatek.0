Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DEBAC4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 11:50:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 404E86102A
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 11:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 404E86102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23ODyJy7WxdCpGxsyDmXxGVElyaQZDoDFs21viSgm3U=; b=nQXx6g+xmoruDJ
	+esS7jfogXUL/YaP1bc/WPFTvqIboki9yK5iY5u/Fhm6ka7dr2/hgc8nvJAtnGpQ2QwcKKr45hTD4
	KiZ4t1T7Gkubbc8OTx3D85SbrGBgyEncDxl3MhXt5SyrbEVm11I2iRH0dEsdSqw+4iuaBzZKJIXmA
	symfP7aFgIZLZRi89zff/n4CPVM1iByvAOgVezERkNUd8KyVZbpJoKtfL/ixuT/7OVMI1EpUiICbm
	yVkivMiw1kGnS4qNZqtSKMEzwAMGAbKZ92txg0j8s8YE62svDi+EJSrWwkS038TQpDAtFA86BE0Mb
	XHJ/2MyWADBTlbByMe4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw1OR-00AV9Q-9N; Wed, 23 Jun 2021 11:50:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw1OO-00AV7e-DN; Wed, 23 Jun 2021 11:50:06 +0000
X-UUID: c78e6f84082a448f829953b6cb098a4b-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=znacS/esURZaDdED3pMjLiMoU/06zZgZw2s8b3JcdjY=; 
 b=U3f6uKCChIKL2F41gG7dDjHmmWn921aR9iuVWwIWy+E9KZPrTgVGgsyARsG1kNmdj0Fn6KhIn7moAmVNqtTu9R8tf/IjtmjzrO65H/P+69AKDYuVfWicNW7eVTl1DtXETj/7Ddk4EwXAzRWW6fMEbk/mjMG9CEtNMwTm10fzgDk=;
X-UUID: c78e6f84082a448f829953b6cb098a4b-20210623
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 191166698; Wed, 23 Jun 2021 04:49:59 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 04:49:57 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 19:49:54 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 19:49:53 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Felix Fietkau <nbd@nbd.name>, John Crispin
 <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>
CC: <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <bpf@vger.kernel.org>,
 <wsd_upstream@mediatek.com>, <chao.song@mediatek.com>,
 <zhuoliang.zhang@mediatek.com>, <kuohong.wang@mediatek.com>, Rocco Yue
 <rocco.yue@mediatek.com>
Subject: [PATCH 3/4] net: dev_is_mac_header_xmit() return false for
 ARPHRD_PUREIP
Date: Wed, 23 Jun 2021 19:34:51 +0800
Message-ID: <20210623113452.5671-3-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210623113452.5671-1-rocco.yue@mediatek.com>
References: <20210623113452.5671-1-rocco.yue@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_045005_119430_A781E969 
X-CRM114-Status: UNSURE (   9.95  )
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

the incoming/outgoing packets on that pure ip interface do
not have an ethernet header. So adding ARPHRD_PUREIP to the
dev_is_mac_header_xmit() make the function return false, and
__bpf_redirect() checks this boolean to determine whether to
prefix an ethernet header.

Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
---
 include/linux/if_arp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/if_arp.h b/include/linux/if_arp.h
index bf5c5f32c65e..0dc7af11c463 100644
--- a/include/linux/if_arp.h
+++ b/include/linux/if_arp.h
@@ -51,6 +51,7 @@ static inline bool dev_is_mac_header_xmit(const struct net_device *dev)
 	case ARPHRD_VOID:
 	case ARPHRD_NONE:
 	case ARPHRD_RAWIP:
+	case ARPHRD_PUREIP:
 		return false;
 	default:
 		return true;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
