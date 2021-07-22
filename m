Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAB5C63793
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 09:30:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC0666120C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 09:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC0666120C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1/yzRLiujEU/HRbwMM+Npqvo89Se9u0Em/9qkeIK2oE=; b=JyiMBnv2bq9ybX
	aDSg1BlXpM5MI+3MyUHJIyyLSJMbC22ciFxUBJc2Voba1eRH7Dg8nnQlAoTRH3gpqAt1CCwdk+tr2
	z6Ll5kDol829HUByz/QNWve9atKhaEeSeGpHaIDhhcOr4jID4QU0CHg128VgHUqOWVZB9ISiNhgnn
	zUkhz3yYsTXZXgvWqJqXP/SL5l2IZ100xI9iJ4sb+Ttxuf8BVgfYpbik8ti6Spoh/sVbKLYw9xgvK
	amw75eumAHZHziJe6Isbi5F0erDgh3KnQ2hrE9Au0JnQDVgonY+zsJO2ieGK0H62hGsg/RSIkW2kj
	M9ybAXavRUV05ttxe9nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6V2O-000uBH-7i; Thu, 22 Jul 2021 09:30:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6UyZ-000slN-2e; Thu, 22 Jul 2021 09:26:46 +0000
X-UUID: 34887a27842048eb9cfe5bfbdb4ff4d5-20210722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=k5xc4gBJ0PPQvSZbnq7VcSIk8QZ67kph1vyEnvb/3X0=; 
 b=QIowHWuEkdSXF6Nx56xs0SPSnin7ypAJhjJxBTfsUJVW0e3XnNSs6q0lAaJ0S3XiRWZNMcLYktqWZ+5rS5EOkWLKCPGf9GydCXFPczaAZgmFkQUOUkFBSiqrTz2cOG7NO/m6H2m4cOp1bsUpM/gndnnyE6EcDPLc0MUixtfStrY=;
X-UUID: 34887a27842048eb9cfe5bfbdb4ff4d5-20210722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1228716917; Thu, 22 Jul 2021 02:26:36 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 02:26:35 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 17:26:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Jul 2021 17:26:27 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Fabien Parent
 <fparent@baylibre.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>, Jitao
 shi <jitao.shi@mediatek.com>, <fshao@chromium.org>, <nancy.lin@mediatek.com>, 
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v1 0/5] add mt8195 SoC DRM binding
Date: Thu, 22 Jul 2021 17:26:19 +0800
Message-ID: <20210722092624.14401-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_022643_215969_593406AB 
X-CRM114-Status: UNSURE (   9.66  )
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

Add mt8195 SoC DRM binding
1. Due to the 2 display hardware path in mt8195 SoC, we need to add vdosys0
   and vdosys1 into mmsys binding document.
2. DSC and MERGE is used in vdosys0, so we need to add DSC binding file
   and additional MERGE description into original disp binding document.

jason-jh.lin (5):
  dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
  dt-bindings: mediatek: display: Change format to yaml
  dt-bindings: mediatek: display: add MERGE additional description
  dt-bindings: mediatek: add mediatek,dsc.yaml for mt8195 SoC binding
  dt-bindings: mediatek: display: add mt8195 SoC binding

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   2 +
 .../display/mediatek/mediatek,disp.txt        | 219 ---------
 .../display/mediatek/mediatek,disp.yaml       | 464 ++++++++++++++++++
 .../display/mediatek/mediatek,dsc.yaml        |  73 +++
 4 files changed, 539 insertions(+), 219 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
