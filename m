Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7585DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 08:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:In-Reply-To:References:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKnLztvVW6F490xrJW9Rm+HbNy2lt5F9hUPllWHVNso=; b=ITO/pqS/JOf7lchTyRH88qkkoP
	qtzl2FBs/kHuCtuqCh+uHJbzN2RglW/CLYikYNGxJDUOje++XaCgxJyPhieBXSMjydYF8BOtFvn2O
	Zn80Sqx229nAMIU/NEF+9usS2mDWrMaEieovzSPh9l6tm1aDkzjbgm402TyI1BrVZ5f98bNaLwFSO
	JHJIW+mFjSlz2uO4X+pwltvhwoPa44BUqOXGYL6nQV9G12f3ikrxmYb0AwESv+ggdE6wwgUoHDlYq
	F1ucB8M6bm/RmoYHwwvQ6npydYytnGmeTp/ybSJNtXyLhjj5Uh+WfLM5RGrk++9f2SbwgZ1Aw9Zs8
	QsBfui8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Bqn-003a36-AP; Fri, 01 Jul 2022 08:18:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Bqb-003ZxB-4o; Fri, 01 Jul 2022 08:17:54 +0000
X-UUID: e5439b7b47cc40edad58ddfec76d008d-20220701
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:a622ce0f-2e1c-4074-a780-b707bce9e82f,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:dd282663-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e5439b7b47cc40edad58ddfec76d008d-20220701
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1838045848; Fri, 01 Jul 2022 01:17:43 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 1 Jul 2022 15:37:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 1 Jul 2022 15:37:06 +0800
Message-ID: <10ed0b2a78baa88f7fd1d466036c98de2f6d8e29.camel@mediatek.com>
Subject: RE: pull request: linux-firmware: Create Mediatek MT8186 SCP
 firmware
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: <allen-kh.cheng@mediatek.com>, <yunfei.dong@mediatek.com>,
	<shawnku@google.com>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-remoteproc@vger.kernel.org>,
	<rongchang@google.com>, <hsinyi@chromium.org>, <tinghan.shen@mediatek.com>
Date: Fri, 1 Jul 2022 15:37:06 +0800
References: <b4392c845d0af4e0e9d06493078c8af9dc39e237.camel@mediatek.com>
In-Reply-To: <b4392c845d0af4e0e9d06493078c8af9dc39e237.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_011753_214159_5CC4ACF4 
X-CRM114-Status: UNSURE (   9.49  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


I am sorry, there are some mistakes in CC list.

Regards,
Allen

-----Original Message-----
From: allen-kh.cheng <allen-kh.cheng@mediatek.com> 
Sent: Friday, July 1, 2022 2:32 PM
To: linux-firmware@kernel.org
Cc: Yunfei Dong (董云飞) <Yunfei.Dong@mediatek.com>; ";
shawnku"@google.com
Subject: pull request: linux-firmware: Create Mediatek MT8186 SCP
firmware

Hi maintianers,

Add a new SCP firmware for MediaTek MT8186.
Thank you!

Regards,
Allen

---

The following changes since commit
9ed4d42c51aca99d70adc6738d7ea55c5e897835:

  amdgpu: update Yellow Carp VCN firmware (2022-06-22 06:28:03 -0400)

are available in the Git repository at:

  https://github.com/kuanhsuncheng/linux-firmware-scp v0.0.6

for you to fetch changes up to
1c8b6c3dddf751f5f786bdd3440aa3ce238ab808:

  mediatek: Add SCP firmware for MT8186 (2022-07-01 14:20:06 +0800)

----------------------------------------------------------------
Allen-kh Cheng (1):
      mediatek: Add SCP firmware for MT8186

 WHENCE                  |   2 ++
 mediatek/mt8186/scp.img | Bin 0 -> 416960 bytes
 2 files changed, 2 insertions(+)
 create mode 100644 mediatek/mt8186/scp.img


