Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FCBC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 07:19:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09EF8613A9
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 07:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09EF8613A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fJLc4tIjm07jlwwb1RlGkApHSz26EdXNpvBI5JuG4Gs=; b=oKtULDfE+5zCjTLrKonPNZ2MTY
	s2+u2dGEDkoteiyuPw0LWa+svhe5/qlQMFInsCjYnSJK94DB006hv10z3fkJO1MjjOBlPjp3XDybX
	ud95BEf6srHvlzuYqtn3awf9zUdFvzZoC27qkETGbB31bSk5DEwNBgktvWRY8K7WGSeqdUbUsVNKA
	11cbvmDz2ZIPKqKH7aetBmwoZrMtnvJeV+PZ94D4U+8HlSdZQJJuu987E+K2adRaq0TiNVcTmj7da
	9S2OlGlI1Sdb0yfHuurY58jz32Q7q57VADFp2poeV+hmo+XqWvCf53p9ebhyzw/BVwlF104ZiOa8D
	ZBGlbwyg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWZnX-00BoCl-06; Wed, 14 Apr 2021 07:18:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWZnI-00BoBA-W4; Wed, 14 Apr 2021 07:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=yxafOZjr3aMP4DeNb3I/slVAjBYMZ/kwCnH3iVp/t4E=; b=GoOLf4cR7JFKD6SoVBoXY8rn5Y
 fBRqf6UgQCfo+CWkRlb9p8AqgYaTsIi0e//DB0XhLuAKvmw3nM7kkdw9HnCD9Dgv9YVSPJoxAES+6
 SrzdURUJ8Wm+ZEbPWwiEHBqaI+9fi3XxgkzFAzLUhWORd4vWM+k9w7TyrTGHhXbvS6Zxx1x5Io+W6
 7L4Qou0/liH7IcaAy7EUks3ujFZW1ajJEnqUEH+cnVWM3ok4X0UPMvC3fox+roUUqAtm/xRnUWuOn
 s54UIU1rumyJY6TNjEp9TXDl0hWkRqEABHc9FHsrNWT6yl8kRQl6qrUL95Mb4pTBQIE2gTcIBoceP
 XBmlgQgw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWZnF-007Z58-Hb; Wed, 14 Apr 2021 07:18:34 +0000
X-UUID: 88205c7b05924f97a67928045f218447-20210414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=yxafOZjr3aMP4DeNb3I/slVAjBYMZ/kwCnH3iVp/t4E=; 
 b=cOXZahJ3xqrzXIGJIH94GA5ImIpxbXmk+y17TjIUY1YhzXWz56GkZ6r7BCWcT10WON1Kd/rxjqGSsmyeQ0SpvEbCdhhuxbvTXUG69sDxusWlEdoajffCGnwmV2gPOBBXXmFfOdmD1U3x1o4fTfXYeAufBovn4H1KTG0FhGgtRkI=;
X-UUID: 88205c7b05924f97a67928045f218447-20210414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yz.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 555703320; Wed, 14 Apr 2021 00:18:28 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 00:18:26 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 15:18:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 14 Apr 2021 15:18:17 +0800
From: <Yz.Wu@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Seiya Wang <seiya.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Ryan Wu <Yz.Wu@mediatek.com>
Subject: [PATCH v5 0/2] Add Mediatek Efuse Device Node for MT8192 SoC
Date: Wed, 14 Apr 2021 15:17:47 +0800
Message-ID: <1618384669-30070-1-git-send-email-Yz.Wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4C53F4EF08B6449ACA368C13CBF9431EFCD3E84CA088F6F4E24B34B705A35E732000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_001833_611598_D1EB41CC 
X-CRM114-Status: UNSURE (   7.77  )
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

From: Ryan Wu <Yz.Wu@mediatek.com>

This patch adds efuse to read via NVMEM.

Ryan Wu (2):
  dt-bindings: nvmem: mediatek: add support for MediaTek mt8192 SoC
  arm64: dts: mt8192: add eFuse support for MT8192 SoC

 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 1 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi              | 5 +++++
 2 files changed, 6 insertions(+)

-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
