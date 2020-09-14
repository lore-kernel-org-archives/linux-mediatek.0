Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F47C2BC11
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 05:01:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14E81208C7
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 05:01:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eSa8vgC+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KjZaVnVw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14E81208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EW8pOAVYX2my5hiyxc/P42eW3gPDNFERR0709utcHxA=; b=eSa8vgC+hRM09ZJPS8XO2erS2x
	+7/oyG+H50ZzkvqNvYwlaCeYXjF6RAJe+8aFAyhUNALfyi5/MuJafxNxzDuREWEPT/H77ziA7VVTz
	Hh/jidABIyZzYCgccd6HdeI+A2b4fvp3HDMnQlh5GCnZ9LcYMKeee1SyDRrfdeXdHrMGOzYKVIWH6
	bjNm5XwbEdLFXJceu8bU4onWeXG0OjBYI3mZ/FkLaXjnUTvk6ibohKI6orijfvTAanZc6QO27xxHa
	ma1L8J4sUvpj/l+xw1BpHtlWnyMtNFbY2VEnkyqEbGWCBRsUpVscttGeeZ1czB2aunCBhgARi+AZ1
	ZC0ZzOUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHgcE-0005Wm-9V; Mon, 14 Sep 2020 05:01:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHgc8-0005Ti-7u
 for linux-mediatek@lists.infradead.org; Mon, 14 Sep 2020 05:01:19 +0000
X-UUID: 7ccfd77e43824052874d2a8da24c466c-20200913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=y7J9twpVOC+9aQM50zQCULERXtYLnva5jEAZbeuXflc=; 
 b=KjZaVnVwv19PLTf3JI9AxWP/Em7ojvwRcpUwofpCsxpXMItASRws+s3rIOPsTL3u1WqB1F7ELjgVCaYLkjA+g36Y5Aoesw5pwp9FD3gUSt14jL3x1xDQl6bgzE+hHGxXCa+GIa2H4JgFk2NsbkeIlxkX9sYVsw9AY5WdRVTxIi8=;
X-UUID: 7ccfd77e43824052874d2a8da24c466c-20200913
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 145851321; Sun, 13 Sep 2020 21:01:09 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Sep 2020 22:01:08 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 13:00:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 14 Sep 2020 13:00:53 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <robh@kernel.org>, <mark.rutland@arm.com>,
 <chunfeng.yun@mediatek.com>, <yingjoe.chen@mediatek.com>, <kishon@ti.com>,
 <martin.petersen@oracle.com>, <avri.altman@wdc.com>,
 <alim.akhtar@samsung.com>, <pedrom.sousa@synopsys.com>
Subject: [PATCH v3 0/2] scsi: ufs-mediatek: Support performance mode for
 inline encryption engine
Date: Mon, 14 Sep 2020 13:00:50 +0800
Message-ID: <20200914050052.3974-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: B50865B5C0F509377B995F4AA3A5CBB12A52DFF2A2433CB0F43AFAD9473E04A12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_010116_469640_499598EE 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, henryc.chen@mediatek.com, jiajie.hao@mediatek.com,
 linux-mediatek@lists.infradead.org, liwei213@huawei.com,
 vivek.gautam@codeaurora.org, arvin.wang@mediatek.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 peter.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Martin, Rob, Avri,

This series adds high-performance mode support for MediaTek UFS inline encryption engine.
This feature is only required in specific platforms, i.e., MT8192 series.

Please help consider this patch set in kernel v5.10.

Thanks.

Changes since v2:
	- Specify required minimum vcore voltage in device tree instead of hard-coded.

Changes since v1:
	- Remove unnecessary printf.

Stanley Chu (2):
  scsi: ufs-mediatek: Support performance mode for inline encryption
    engine
  dt-bindings: ufs-mediatek: Add mt8192-ufshci compatible string

 .../devicetree/bindings/ufs/ufs-mediatek.txt  |   4 +-
 drivers/scsi/ufs/ufs-mediatek.c               | 176 +++++++++++++++++-
 drivers/scsi/ufs/ufs-mediatek.h               |  22 +++
 3 files changed, 195 insertions(+), 7 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
