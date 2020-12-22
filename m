Return-Path: <SRS0=m1jb=F2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF17FC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 13:40:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 879C323105
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 13:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 879C323105
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fdNTvA8WeS5lFaSiOLWEHwF7PYSR2ZoQ95MCmDW4lpQ=; b=wDVWLI7Xu/mUUMM1xKjDykuHok
	kbIhWf7tGuvJnou/PlYhPqZfGlAdJs0z1ZsXTauVHESpCeM1UCOqysOtl4O/REVioNEFm6wm5RPWi
	9yJudqUnC0I3UyZ0SpWCGtA1niBaJXkhMeJ/mZ+yZFWHha4KIZZk0WJVhF70Z6onf7wqre+lAzU3n
	Szy2OsW6wzoiSxT2Qj4s7+/YqkdKyON5v7Q4rEpNASCQmKu+YFn5v+ZXwwgegs+IvndARmgC0ckWs
	1eyNZORcLC16kE3+ZTeDbwvuDkx0Gy/T+bmQJLXM4dlEDZqbNzylL+RjlQUKHqlvM6h6HQyQSovzJ
	jchxWLrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krhtv-0001Ss-0v; Tue, 22 Dec 2020 13:40:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krhts-0001Rb-B7; Tue, 22 Dec 2020 13:40:29 +0000
X-UUID: 2b35157724b44a89bb049419a7f54038-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6a/KDHc8lz2tmg1fPpbZfL7ONc1uYDwjiuWGE63ugTs=; 
 b=MKxSdhMnodR25l9T2mI33GUpn1wZ7uGDxSKmyhCKjK9f5lD35/wPAjY6qwbab/EFKj9aTIVDp4VeWSyaWtBkvCTKmdUPj0DQta7XbU3GY64OMwLPY8siXlGy9ZEDiu6g5msmMhDcLO9JX9V9f89pZHcTZPqYtLpYkMFT1IMLp4c=;
X-UUID: 2b35157724b44a89bb049419a7f54038-20201222
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1531901014; Tue, 22 Dec 2020 05:40:18 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 05:40:17 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 21:40:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Dec 2020 21:40:12 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 0/2] Add MediaTek MT8192 clock provider device nodes 
Date: Tue, 22 Dec 2020 21:40:12 +0800
Message-ID: <1608644414-17793-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_084028_633783_A59965C9 
X-CRM114-Status: UNSURE (   9.35  )
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
Cc: devicetree@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series is based on v5.10-rc1, MT8192 dts v6[1] and
MT8192 clock v6 series[2].

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=373899
[2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=405295

Weiyi Lu (2):
  arm64: dts: mediatek: Add mt8192 clock controllers
  arm64: dts: mediatek: Correct UART0 bus clock of MT8192

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 165 ++++++++++++++++++++++-
 1 file changed, 164 insertions(+), 1 deletion(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
