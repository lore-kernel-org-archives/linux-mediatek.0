Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD217C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 05:33:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D5436192F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 05:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D5436192F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IS/aHodaZ41YFvDq9Z4l+gyGi92JrVqq6V0U+pw4+j0=; b=BPUwNggalMKrqvmohRx4LTSJZH
	8ehclqZtH+usJiba4iOytVvV4ZdL/Y47nQT2LEo8LwePWK3oHCDkQAtn9sbJZ/HkKKZW5jEl2f3Tz
	kep59JOHO8hYtx8bR76JLr4AXporz9Ho1fwuM8LWPuFyvclceGzXOEXeT6idotlYT4usHJxN9qXZs
	ZzLywhPgyN2kOqbjv4fCBOWGDiNmcsT4HovG6LT/KJnQWYBGbvMt9Vj9knp4DqDn1IONN05oIMvN+
	k+wNoAMuJlltMhGsRXO1W+q1gbECH2yHGAscTzVhIsBTxObz7JJSTaknLPQDqXz+1GPncNLs206Op
	D6mJUTsQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR6zd-002kyM-NA; Tue, 30 Mar 2021 05:32:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR6zQ-002kve-2D; Tue, 30 Mar 2021 05:32:34 +0000
X-UUID: 146200fce9144004bd817a4bf2ad5d42-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=b//FVOj3P3Ir8d4A9I33ptA9CvDFO47DZ94QrsPpwPo=; 
 b=PWwkgAXkq9zbSaFRSZaTVgX/5hAT6Sri4ENhWCt5aRmhvfO/RZ1p5ESi1uYKSPAy4MFFAZbiHt2NkRVnwzhGu+G62ngxZ8N7TwJsoMJkint3Ex70G1sGYOwh3HKO+WtzDI6EsukD2nJc0nAfydiRu9hdxcBmrOzkNUNlmsv2/90=;
X-UUID: 146200fce9144004bd817a4bf2ad5d42-20210329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <pk.chi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2094966604; Mon, 29 Mar 2021 21:32:22 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 22:22:20 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Mar 2021 13:22:12 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 30 Mar 2021 13:22:12 +0800
From: Po-Kai Chi <pk.chi@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <wsd_upstream@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou
 <loda.chou@mediatek.com>, Po-Kai Chi <pk.chi@mediatek.com>
Subject: [PATCH v1] memory: mediatek: add DRAM controller driver
Date: Tue, 30 Mar 2021 13:22:07 +0800
Message-ID: <1617081731-7408-1-git-send-email-pk.chi@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_063232_548550_F49F5DD9 
X-CRM114-Status: UNSURE (   7.71  )
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

These patch series introduces the MediaTek DRAM controller driver (DRAMC)
on MT6779 SoC, and enables to be built as a module by default for the
ARM64 builds.

MediaTek DRAMC driver provides cross-platform features as below:
  - API provided to other kernel modules for querying DRAM type,
    rank count, rank size, channel count and mode register settings.
  - Sysfs interface used to pass DRAM mode register settings and current
    DRAM data rate to user-space for MediaTek ecosystem.

The API user includes MediaTek External Memory Interface (EMI) and
DVFS Resource Control (DVFSRC), which will be sent to mainline later.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
