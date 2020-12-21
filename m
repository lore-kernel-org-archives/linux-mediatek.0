Return-Path: <SRS0=ptZs=FZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64941C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 06:11:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12CB722CBB
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 06:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12CB722CBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2vFWm7MKOIXG/hQCGjgOsqHTjpYeBYn/uz1Nu4DISCk=; b=Bf5M1RmbVXP4xyTdVTJPZJMQO1
	R6YmE336+oycdzLc5aIX8cF2auZMvQcDv7TphbxhBR+PTbw3yLlp5DojUXFWLDnOPo5frjqKG1MwR
	aOw2fHp6p8r9/ttQ/msYKaLhXqEGKUE44f9R+ZF2mYS1E7uphhct48gWwG5jJ7Dmb0H+8xxYV07o5
	OSYM0auk19ZF3ZbALbpIJi8KrsYcq3TxShA9XkiO5dMrQMWgdIVPlt95WcpmAUCYwKm82zQnTi5Ql
	gfvn3a7UqPYrht51uKs5o8mZ7Z+2dAOBzAfFFA9cxXTQ1a+4n+CKWtgFzY3OQIL5+6rfCOi7UfULm
	hkkFD4LQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krEPK-00070p-Ro; Mon, 21 Dec 2020 06:10:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krEPG-0006zz-LB; Mon, 21 Dec 2020 06:10:56 +0000
X-UUID: f458f270b7c24a8aac401ec3ec9711aa-20201220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=o0ex194/WjNhP9kegyfFzQoydl26GpXZ8z/YphIXHcQ=; 
 b=PjT7zglizWOX/WrsYlJ4XRAv2YQisaNQEyJWSq0ssDgpviPoUeKaIHgqC+2E20M31Od3GJfRVziRqH/wa+dSTkHC7c/JBeV2QNUP73Mv5dajpxrlYBXmRSaBYsxabTxngtU3SQ8YuhjIIyEh1LfSk5xmW+2ogwwXHAX0jh699pk=;
X-UUID: f458f270b7c24a8aac401ec3ec9711aa-20201220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yz.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 245265842; Sun, 20 Dec 2020 22:10:47 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Dec 2020 22:10:45 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Dec 2020 14:10:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 21 Dec 2020 14:10:43 +0800
From: <Yz.Wu@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 0/2] Add Mediatek Efuse Device Node for MT8192 SoC
Date: Mon, 21 Dec 2020 14:10:17 +0800
Message-ID: <20201221061018.18503-1-Yz.Wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: A90D87B2DF44468F3662D5C10CBCF828865D875462BFA64D939001BE60DEB8722000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_011055_465970_6050CE9B 
X-CRM114-Status: UNSURE (   9.32  )
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
Cc: devicetree@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Ryan Wu <Yz.Wu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Ryan Wu <Yz.Wu@mediatek.com>

This patch adds efuse to read via NVMEM.

Ryan Wu (2):
  dt-bindings: nvmem: mediatek: add support for MediaTek mt8192 SoC
  arm64: dts: mt8192: add eFuse support for MT8192 SoC

 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 1 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi              | 5 +++++
 2 files changed, 6 insertions(+)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
