Return-Path: <SRS0=HKXf=25=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBF4C00523
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 06:42:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B15922077B
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 06:42:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xr68pn/f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IADYONrY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B15922077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EyQxneGwc8RXyzBAzK8Tw1iMTEGz+23ymXit6lo9xIE=; b=Xr68pn/fyjY238
	5wURqgNnHxAzb0YSLvJbX+K0ouGaSUP3yr286bVK3p4Hbqg24wawd4QU+xu6cdH/GoNFoE+kqaIvQ
	mLYrhvdNnOUELS2lM+hK1ujVImcwKGShKem2nNmg4gANvo4kdOeNa/2fTVi1b9+jBh648PqpDBNp6
	f8TWFP1flXb8A+jouRlqwnlltNijCnFMLUNsso5xpLIepMYlomdSjWc5OihqmAP/QQihzoya4puqO
	TBTt2KprIpVo7ez73zew5Xvy8nZOUsmK7hKk874T6TlmTYt4tXwmLPISAARtfXg654Mr8JvZnMzR4
	3C31dHd5yzZHe8DkBV5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip53I-0002cy-Ah; Wed, 08 Jan 2020 06:42:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip52C-0001UK-DC; Wed, 08 Jan 2020 06:41:42 +0000
X-UUID: 37e533df6f3d4ed6b243434bd13ff0c2-20200107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=kUH+CKXvuuCJ+JNqIK5cYBkD6I+QkoxV5z2ZPjtbIdw=; 
 b=IADYONrYkZQ/w7iaW6MPcF3js9vOzzIOX6UxzUAIoFmPDj5rkxumT1XOhfgfpq/GKK2a5u7/YHFWjk+PdUG4mxazZPzS8AtXOxM8tQJIa1mY1mnEsajyaLr5Jsc6dO75ee05GGpjU4fVWRLZ7B/yyIsy9+EhqDhfgkvG4CRgwOM=;
X-UUID: 37e533df6f3d4ed6b243434bd13ff0c2-20200107
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ming-fan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1233793181; Tue, 07 Jan 2020 22:41:35 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 Jan 2020 22:42:07 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 8 Jan 2020 14:41:05 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 8 Jan 2020 14:39:59 +0800
From: Ming-Fan Chen <ming-fan.chen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: memory: mtk-smi: Add bandwidth initial golden setting for MT6779
Date: Wed, 8 Jan 2020 14:41:27 +0800
Message-ID: <1578465691-30692-1-git-send-email-ming-fan.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_224140_478393_DFBD39CE 
X-CRM114-Status: UNSURE (   6.46  )
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
Cc: devicetree@vger.kernel.org, Joerg
 Roedel <jroedel@suse.de>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch add description, basic nodes, config_port and
bandwidth initial golden setting for MT6779 SMI both smi-larb and smi-common.
The setting make better performance of memory control for multimedia modules.

changelog since v2:
Add GALS for mt6779 in smi-common.txt
Split basic nodes and config_port support from initial golden setting patch
Define local variable from long to short
Merge writel_relaxed into one line
Remove SMI_LARB_SW_FLAG in smi-larb


Ming-Fan Chen (3):
  dt-bindings: mediatek: Add binding for MT6779 SMI
  memory: mtk-smi: Add basic support for MT6779
  memory: mtk-smi: Add bandwidth initial golden setting

 .../memory-controllers/mediatek,smi-common.txt     |    5 +-
 .../memory-controllers/mediatek,smi-larb.txt       |    3 +-
 drivers/memory/mtk-smi.c                           |  140 +++++++++++++++++++-
 3 files changed, 144 insertions(+), 4 deletions(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
