Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44651C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 09:55:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 046B560F45
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 09:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 046B560F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BTOni7+JsPmXF+oAm6QSIUeqfGH74A+BsObQoQnnobQ=; b=dVwouMUCdDvhfY
	jrVKehNNA/Obj5h+Fs+scQzesyghtvSf5yVJSgMlc306zI83RFIQSztFg3NajFJRaAw5w5pwgxXaD
	M27Cb7DApSS8J2fhfdtATWZWjt1YA8dZNgU9GLOiBxPHBaPfBp0EU/M2Z4GoY7IHbt/ydANK4O3jX
	bU/pvVr1cEs+ORucvXPo60PhGQMeHwzqlVdcpNfFUTKiaXJR1zYYJBQWHeacGF8JCzO5axavgaVbP
	4KQLTbaGDAflabdT8MOVLVazVMpYXomBnyg4tSLjbufVAfeEAqhgZasToh3Di3RzZ6qA74ipAIMvl
	DrMaBziiQ8cR+1blp/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8gHR-000Hbe-IE; Wed, 28 Jul 2021 09:55:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8gHP-000Hax-50; Wed, 28 Jul 2021 09:55:12 +0000
X-UUID: 5949e68c5a4b48b3a422b115dc5bc034-20210728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=njdViCSnJIZsUzxhd8A/2Y75ptO5ZEGEbRoDKT8U7bw=; 
 b=lXyXlWBz0YNJqlEgyQMRnUVBvYDPIICCFX9hH72N0eB30jDdaD9O1Qpzz7zE648mWto64mM0LtlvmKIcpHAbRerutcv0gKDGi3bnQzjhiwfrL0Fmbjb4U8xT3KRQQ0bexe8Qo6oiJR+yAjjFv+A/QvUqc1s5Y595JMPCVK0GpHw=;
X-UUID: 5949e68c5a4b48b3a422b115dc5bc034-20210728
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1739416780; Wed, 28 Jul 2021 02:55:08 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 02:45:06 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 17:44:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 28 Jul 2021 17:44:59 +0800
From: <yee.lee@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <nicholas.Tang@mediatek.com>, <Kuan-Ying.lee@mediatek.com>,
 <chinwen.chang@mediatek.com>, Yee Lee <yee.lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH 0/1] arm64/cpufeature: Add an option for mte support
Date: Wed, 28 Jul 2021 17:42:57 +0800
Message-ID: <20210728094302.9949-1-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_025511_249550_67555939 
X-CRM114-Status: GOOD (  11.25  )
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

From: Yee Lee <yee.lee@mediatek.com>

Arm64 introduced mte to enforce memory protection but also increased
the system requirements, such as the additional tag memory and the
firmware control complexity. For the case of products with limited 
resouce or low-power environment, the requirements to support mte 
is unlikely reached. Hence, a solution for low-end devices is 
necessary. 

This patch Add an option for mte support. An parameter from system
is used to indicate its states for all requirements. If not, mte
is disabled both in kernel and userspace. 

=== Test ===
QEMU5.2 + mte

passed cmdline : "arm64_mte_not_support"
boot log:
...(skip)
[    0.000000] CPU features: detected: Memory Tagging Extension
[    0.000000] CPU features: detected: Spectre-v2
[    0.000000] CPU features: detected: Spectre-v4
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] CPU features: MTE is disabled since system does not support.

Yee Lee (1):
  arm64/cpufeature: Add option to disable mte support

 arch/arm64/include/asm/cpufeature.h |  4 +++-
 arch/arm64/kernel/cpufeature.c      | 13 +++++++++++++
 arch/arm64/kernel/image-vars.h      |  3 +++
 3 files changed, 19 insertions(+), 1 deletion(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
