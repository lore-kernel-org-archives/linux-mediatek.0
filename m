Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5CDC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 10:40:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EB1260F58
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 10:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EB1260F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Te2sZfhiXSEEwXPI6hI0XjguoKP9/TJnpMZK3L7zv7Y=; b=E7uYaM8BlnIPfA
	AZHnpQjfGbBVMQbpqD2n0WR3b+rKMep+kvf+POLhmjA9P7iIhEYf3bgC/zwlNsYlkT4M89mw5A+vE
	vf+k5xPH0CS+BmUAEPYgsZAI+361W+IPY761x9eOfn/0MaHx7YirzCA8mQZsZr9cznp54BODOa4TT
	3YAm5JRp8XwLJH6kIJaXVP3O4Z82wTjUMSLU8iK6Pg3IAbOKO+gTRRWFRenBD4qiS5Qp1K6mUbb5c
	aGcA37VBexcxsqBQKfHcH1gGfhjfsNyfRwVUZSlB6C5NMeqQYuLvks0gk7L3a7CYm1VES8CqWzMRk
	IUmsWeDwFYqR74OLW8cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mArqc-0026Xt-MG; Tue, 03 Aug 2021 10:40:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mArpR-002669-G9; Tue, 03 Aug 2021 10:39:22 +0000
X-UUID: 323c9dde8e534c52aad21901815ea8fd-20210803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=KrhaIvAc4s785CpVaku9FT8o0+EDv00vlevNd28vE20=; 
 b=INrTGPTpkpX1aWGRia4WOA4bJ+5b8wnrZdZuOxCjqH1N7tDixqdDY4USKhBVVgR4D+K8Jh/8YUXPnrHAVOc+AsVw0Uvp8q6i2vrZWK35gjeeUMWnOU7disJkwbL3HBPC+fAD++Z3mzgSzvBo7aTO/sbWXKgG0KaPPiaosCy0+aU=;
X-UUID: 323c9dde8e534c52aad21901815ea8fd-20210803
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1499994056; Tue, 03 Aug 2021 03:39:18 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 03:39:16 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 18:39:15 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Aug 2021 18:39:14 +0800
From: Mason Zhang <Mason.Zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Laxman Dewangan <ldewangan@nvidia.com>, <linux-spi@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, "Mason
 Zhang" <Mason.Zhang@mediatek.com>
Subject: [PATCH v2 0/4] *** spi cs_timing restructure ***
Date: Tue, 3 Aug 2021 18:22:29 +0800
Message-ID: <20210803102228.2535-1-Mason.Zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_033921_608118_5DCFEB92 
X-CRM114-Status: GOOD (  10.18  )
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

Hello,
This patchset has restructure spi cs_timing, as we know spi core has
removed spi_set_cs_timing() API, it is a correct decision because it
asked spi devices to call it in one more time.
so we need find another way to support user set cs_timing. Actually,
spi_device set spi_delay for cs_timing is enough, and about how to
set cs_timing, just put it one the master driver.
We have test this patch in mediatek platform, it can compeletly meets
our needs.

Changed in v2:
  - fix tegra spi build err

Mason Zhang (4):
  spi: move cs spi_delay to spi_device
  spi: modify set_cs_timing parameter
  spi: mediatek: modify set_cs_timing callback
  spi: tegra114: Fix set_cs_timing param

 drivers/spi/spi-mt65xx.c   | 102 ++++++++++++++++++++-----------------
 drivers/spi/spi-tegra114.c |   8 +--
 drivers/spi/spi.c          |   6 +--
 include/linux/spi/spi.h    |  23 ++++-----
 4 files changed, 73 insertions(+), 66 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
