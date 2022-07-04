Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641B1C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 09:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5VHdR4YDUju3uswt1uV4mKu0wktMPR9S/W1vsZtPlk=; b=hZ5gwHpOK5LaAfTkjbvszZQsY5
	rcWgcVQVSEqTR1f3li16IpqTGbnio7HK/IPU0hKbwrGcyVRz98mIGrbWIvO85dMhR/4UQcY/usrnv
	TCEcvoT83pG42nLYhNsYzw9yacJFSa/ricbdGESSw5br7cQoiDUUU4D7OzPKUCJMYwaiFXXk67P4G
	ySlUvl25yqgZyHIZMyFPPdatbUueiwlILzLvlx0n6rHu7TLaZqjcYF3TVHN6crqK1gljnbwY+45pt
	KMDo+U7Z9fVn7p/pkpEYDXmXr6rOJpXjNT7aF8QpCQxuZgmEYfeGy5iEDnknNfTopCeuDSkEW0r8n
	szbTj1SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ImR-006dcO-JL; Mon, 04 Jul 2022 09:54:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ImF-006dTf-NS; Mon, 04 Jul 2022 09:54:00 +0000
X-UUID: 1c7adb3becd34bc7ae038669853b65b1-20220704
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:e0ef5748-4b81-41b9-8796-7aebf6958782,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:c8097e86-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 1c7adb3becd34bc7ae038669853b65b1-20220704
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 251422552; Mon, 04 Jul 2022 02:53:51 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 4 Jul 2022 17:03:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 4 Jul 2022 17:03:12 +0800
Message-ID: <cff17eda03125c7b144f934ebc633458b09d4d40.camel@mediatek.com>
Subject: Re: [PATCH v2 1/1] remoteproc: mediatek: enable cache for mt8186 SCP
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Bjorn Andersson
	<bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-remoteproc@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 4 Jul 2022 17:03:12 +0800
In-Reply-To: <20220701121229.22756-2-allen-kh.cheng@mediatek.com>
References: <20220701121229.22756-1-allen-kh.cheng@mediatek.com>
	 <20220701121229.22756-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_025359_813484_2F58FA57 
X-CRM114-Status: GOOD (  13.19  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2022-07-01 at 20:12 +0800, Allen-KH Cheng wrote:
> This patch is for enableing cache in SCP. There is not enough space
> on the SRAM of SCP. We need to run programs in DRAM. The DRAM power
> and latency is much larger than SRAM, so cache is used to mitigate
> the negative effects for performance. we set SCP registers for cache
> size before loading SCP FW. (8KB+8KB) and also adjust ipi_buf_offset
> in SRAM from 0x7bdb0 to 0x3BDB0 for enableing cache.
> 
> This patch was tested on MediaTek mt8186.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> 

Test scp boot and scp ipc ok.

Tested-by: TingHan Shen <tinghan.shen@mediatek.com>


