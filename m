Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C9DC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 08:45:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B59E207CD
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 08:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B59E207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dO3q6/CbiPYAr8O/05sWZz2qisvzYODOJ8K14hcuAo4=; b=0uCnbL7siBhCaHP1sgDILjexS8
	JPBtXKxocEi4DzUsDHNlAG9c68nmkFCkHJFClUi4TxNmB7EUwkgcDRRX5C2dhV1YBDNyZpgrBQYg6
	hD90nMBjt/YOqNxNBNAS1ZyYBYM/rvlEAfXvJje9c3LH0XZNWrYK07hQjLwj8FzZ+y9W4x5bC5ZpM
	wi7RewvhCRqjpBpOJvP6yhTkSe+Q2uWoiZtgTyLxcThYbbCJrdULU87ThQOtwzPDt7nm7kGI5PjkO
	2FVX5l4kwbW06eknzSboB1sG1iq3CgqQGufIdbdedHzgnPtl9e4bHDVGFfI1w2BFFhP5RMGnuQ/UG
	hpIVVIqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krzlm-0007bK-5f; Wed, 23 Dec 2020 08:45:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krzle-0007YC-SX; Wed, 23 Dec 2020 08:45:12 +0000
X-UUID: 38cfc93734774d23a4000277a4bc5a37-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=XLVKnpMwscYuHI8mI53QgPLHfAb8fqR5J8W8uFGW9IQ=; 
 b=XQh3ZMYNWw4haZCNE39ib8e44/xK8pSkbfDDrt0S2E+LOFN1/YkvFF/7hvXnLple1JBU9vIktLWFjNPmkg98Udu4SZSn5qe0uTbSI/UQ01is7PzPMOt3lRLAHKjE3EDttdS7vpW5tM9tfd9wWqYRP+si3L/jeE/OhOb6FcZotmo=;
X-UUID: 38cfc93734774d23a4000277a4bc5a37-20201223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1701819798; Wed, 23 Dec 2020 00:45:05 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 00:45:01 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 16:44:59 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Dec 2020 16:44:59 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>
Subject: [PATCH v1 0/2] arm64: Support devapc on MediaTek MT6779 platform
Date: Wed, 23 Dec 2020 16:44:50 +0800
Message-ID: <1608713092-26952-1-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: E55EF3BCC1D3543E29E3A994920BF510B092B2B41B1AD44441134DE25061BF842000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_034511_182712_FA0132E4 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 Hanks Chen <Hanks.Chen@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Neal Liu <neal.liu@mediatek.com>,
 Jackson-kt Chang <Jackson-kt.Chang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series adds DEVAPC (Device Access Permission Control) support on MediaTek MT6779 SoC platform.

*** BLURB HERE ***

Neal Liu (2):
  arm64: dts: mt6779: Support devapc
  arm64: configs: Support DEVAPC on MediaTek platforms

 arch/arm64/boot/dts/mediatek/mt6779.dtsi | 8 ++++++++
 arch/arm64/configs/defconfig             | 1 +
 2 files changed, 9 insertions(+)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
