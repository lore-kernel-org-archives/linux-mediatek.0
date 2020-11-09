Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA94C8300A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:15:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B30BA22202
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:14:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ad3rslpD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Y1Yb2fKe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B30BA22202
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YsGXvaehezuvvEgQ5OOdguDMQfxUPy9m8yY5zGrk1h8=; b=Ad3rslpDCmqlntm0+wjA2bihJp
	plic30OO74d6d3dlcyYrv0nwuLlvSIpRv5d4zaZA2KtnQ+krjer9yOQ/Yvl/urvlSdlUQ7xMt3qSW
	/st74QkchvhlklrK+EpRgrBsoMxtuKyp+jBuQsnsNybUMjPzf7HyaO7SmlYfV9jjoiYuIw8MdsuXd
	M3f2sDmUKy0wnlk+bMce9cNTD66gNkJ9LmhJq94WmP3PLnj9uOSvbDGV2iPaWjpqc8tp0ULOznanE
	fLMNaAKeAzuoupRRAEhjpgJcJ4ECru68KWekn+T1HC8IsbYhAAiEP+oBF4n3RZXwih/oNnWja6Xj3
	saT0rKTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbwhR-0006tA-Sd; Mon, 09 Nov 2020 02:14:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbwh0-0006f7-54; Mon, 09 Nov 2020 02:14:04 +0000
X-UUID: 08ac7ae3dd524cb28c862089b44eb01e-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=QKYXBw3xj3qXNRxnbKjODyTeTt27HBcwJuuhlnsqFP0=; 
 b=Y1Yb2fKerY5SlFSeLmmT5ahXGORU9ZhEkFk4AA8kWzMhUyz4SPyzzoTPpki594gQ1Fe1fi5yN+KcIMLzBAXYI+TfqY6SuW/IhZpjhCyBscNA0NsRTBd1l0mgZzM42gk/um3SAT29CzZbzV9x7IU6YiHNIwmNVNfgEJ5M5ZOSIPE=;
X-UUID: 08ac7ae3dd524cb28c862089b44eb01e-20201108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1170792525; Sun, 08 Nov 2020 18:13:58 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 18:13:37 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:13:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Nov 2020 10:13:30 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2 00/13] Clean up the pll_en_bit from en_mask on all the
 MediaTek clock drivers 
Date: Mon, 9 Nov 2020 10:13:15 +0800
Message-ID: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_211402_388797_7B7B627B 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series is based on v5.10-rc1 and
[v5,07/24] clk: mediatek: Fix asymmetrical PLL enable and disable control[1] in Mediatek MT8192 clock support series

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/1604887429-29445-8-git-send-email-weiyi.lu@mediatek.com/

change since v1:
- add patch for MT8167

Weiyi Lu (13):
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT2701
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT2712
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT6765
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT6779
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT6797
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT7622
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT7629
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT8135
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT8167
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT8173
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT8183
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT8516
  clk: mediatek: use en_mask as a pure div_en_mask

 drivers/clk/mediatek/clk-mt2701.c | 26 +++++++++++++-------------
 drivers/clk/mediatek/clk-mt2712.c | 30 +++++++++++++++---------------
 drivers/clk/mediatek/clk-mt6765.c | 20 ++++++++++----------
 drivers/clk/mediatek/clk-mt6779.c | 24 ++++++++++++------------
 drivers/clk/mediatek/clk-mt6797.c | 20 ++++++++++----------
 drivers/clk/mediatek/clk-mt7622.c | 18 +++++++++---------
 drivers/clk/mediatek/clk-mt7629.c | 12 ++++++------
 drivers/clk/mediatek/clk-mt8135.c | 20 ++++++++++----------
 drivers/clk/mediatek/clk-mt8167.c | 16 ++++++++--------
 drivers/clk/mediatek/clk-mt8173.c | 28 ++++++++++++++--------------
 drivers/clk/mediatek/clk-mt8183.c | 22 +++++++++++-----------
 drivers/clk/mediatek/clk-mt8516.c | 12 ++++++------
 drivers/clk/mediatek/clk-pll.c    | 12 ++++--------
 13 files changed, 128 insertions(+), 132 deletions(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
