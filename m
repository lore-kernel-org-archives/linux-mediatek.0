Return-Path: <SRS0=MHhQ=2R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DF8C2D0CE
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2019 13:58:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36E7D20740
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2019 13:58:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jLnHPDNI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KiTbL4gf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36E7D20740
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=obpW44nq9YL5m6iTePdMkfX7XiTRlm5CjOPeXyrlkww=; b=jLnHPDNIjZ9U6p
	Ba5VBnQJIBlLGuOFO5MgpjAgMZfePeFnm+C7/66LPHuqHGPrZ53hNHjagSvgppTKfuIqX3dZdWLCV
	MgCIbPToakduAj6HjtxCPQNpnVVajjSXKCrETExe/BgyuyPoYVCibiJ2QwN1zO996315Vi21DNW4M
	1ctwODtGfjO6o5nr/l3kF7T1YgAwIi4ZrCR0vZCht3tXEFU+GmH4XzQn3ILcCHg9nlPMJWSUBl+fw
	4e++SrbOmkE0HCjfSEy6bwKj7jfJ8Bkg2JqzXVUr5JR2ZzjmYAqSQ/2gd+v6AyC8nYOYIPEFyp823
	gCHi53eTcVPPyu8qu05A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikq8X-0007Bv-6c; Fri, 27 Dec 2019 13:58:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikq7x-0006id-R0; Fri, 27 Dec 2019 13:58:07 +0000
X-UUID: bd27fef384b044a6a28af14293b57287-20191227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=zxFjs37a4JVQyDKWRkH0qB5qA58VffYtge7brAy5zSY=; 
 b=KiTbL4gfrY9BDxpCj05pmgi/0iUGPfCurIJEOUlE+v0HVw7+xNUU/bGVAxHpfXeWfBJaD2w1Yy7oWcka/f/Q/19xJ8lDevRckuQ6DmtQ8Vpcr4h+c2E8win/PDSJtTpsM4zuQ2evdN5jbd1GiiJZGVkts7SE8wJnpZ7f0omGpQc=;
X-UUID: bd27fef384b044a6a28af14293b57287-20191227
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.liang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1766450066; Fri, 27 Dec 2019 05:57:58 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Dec 2019 05:58:07 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Dec 2019 21:57:28 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 27 Dec 2019 21:58:11 +0800
From: Yong Liang <yong.liang@mediatek.com>
To: <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
 <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>
Subject: [PATCH v2 0/2] Add watchdog node and dt-binding
Date: Fri, 27 Dec 2019 21:56:52 +0800
Message-ID: <20191227135654.3165-1-yong.liang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: A24E59AE89A62C3D995B00D33BCDE509C7B8544A5EBC59D96E50ECB8625021D62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_055805_875777_5FD19DC7 
X-CRM114-Status: UNSURE (   5.94  )
X-CRM114-Notice: Please train this message.
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
Cc: "yong.liang" <yong.liang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "yong.liang" <yong.liang@mediatek.com>

1. Include mt8183-reset.h and add reset-cells in infracfg
2. Add watchdog device node.
3. Add watchdog dt-binding

Signed-off-by: yong.liang <yong.liang@mediatek.com>

yong.liang (2):
  amr64: dts: modify mt8183.dtsi
  dt-bindings: mt8183: Add watchdog dt-binding

 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi               | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
