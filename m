Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BCCC54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 03:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lEXUBFRQRamXHA1KTyZBS3QBLnZ3z3zGas0T/X/92HY=; b=q5L6Z1VynA+6T795+PF8gss5Yl
	YfTYIz+T9O29mriaZFBPQJozNw1o2qnK20PravnS8ixP8K0Ockagh1AuHadTIg5POfsivYPJqddo7
	fiQVLIX+pL1J4/cF9Kl1HD2KmLo9c3M3X/dbGJveC1WP5cgu2OcGXZO3Z4fSEsXxJU0vVU6BUSAm8
	KPdc60ZS0aVcbs5MtohIOXhfSQwgSagU5Iy9U+wTcFpCmDj6sBoNAT1c+tLF5MYxOadxwyD5v7xTa
	ImYvtHxURiKX3uadYoWlTv5oBX5a3i4TYR04Pm1Dllzii3D7vdjfFeitVKP6DeaYAJW49+fbRS7Vw
	aMnGTLOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ2PX-006S9T-K1; Fri, 16 Sep 2022 03:53:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ2PV-006S8d-0s
	for linux-mediatek@lists.infradead.org; Fri, 16 Sep 2022 03:53:02 +0000
X-UUID: 3963ac3cbbaa4098ad9acb9eb2e901a0-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=lEXUBFRQRamXHA1KTyZBS3QBLnZ3z3zGas0T/X/92HY=;
	b=lNu8Drg9XWK5m1VzjzMGnYsOzTBo9f1HEkWyqS1oIykJb83TtAzqmWQNpjBa4Pmxo+I5SipC+svVxcufcgGKMOhdKEvcWQfRrNPv4RMIXm/XsZC4Zv1Ks89Lz8VhLt58K5h5S7zkKll5uSgt/hIWxH6o+EgRB82AsTFJ0ug5Ctw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:aa8937ba-167d-4419-8ed6-79a925bb78e2,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:48cad85d-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3963ac3cbbaa4098ad9acb9eb2e901a0-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1434122679; Thu, 15 Sep 2022 20:52:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 16 Sep 2022 11:22:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 16 Sep 2022 11:22:20 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <chunxu.li@mediatek.com>,
	<allen-kh.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
Subject: [PULL linux-firmware] Update mediatek mt81xx SOF firmware
Date: Fri, 16 Sep 2022 11:21:46 +0800
Message-ID: <20220916032146.17774-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_205301_084387_6CA147CC 
X-CRM114-Status: UNSURE (   9.42  )
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

Hi maintainers,

This pull request adds new MediatekTek MT8195 SOF firmware and 
updates MT8186 SOF firmware.

Please let me know if there is any problem.

Best regards,
TingHan

---

The following changes since commit f09bebf31b0590bdc875d7236aa705279510cfd0:

  amdgpu: update yellow carp DMCUB firmware (2022-09-13 08:02:23 -0400)

are available in the Git repository at:

  https://github.com/tinghan-shen/linux_fw_scp mtk-20220915

for you to fetch changes up to 78cff08a90dff21fe6f5f2f961d12604bd125e95:

  mediatek: Add new mt8195 SOF firmware (2022-09-16 10:42:01 +0800)

----------------------------------------------------------------
Tinghan Shen (2):
      mediatek: Update mt8186 SOF firmware
      mediatek: Add new mt8195 SOF firmware

 WHENCE                                                                                      |  11 ++++++++---
 mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg}           | Bin
 .../sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} | Bin 16191 -> 16191 bytes
 mediatek/sof/sof-mt8186.ldc                                                                 | Bin 0 -> 48436 bytes
 mediatek/sof/sof-mt8186.ri                                                                  | Bin 128712 -> 128712 bytes
 mediatek/sof/sof-mt8195.ldc                                                                 | Bin 0 -> 40568 bytes
 mediatek/sof/sof-mt8195.ri                                                                  | Bin 0 -> 100740 bytes
 7 files changed, 8 insertions(+), 3 deletions(-)
 rename mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg} (100%)
 rename mediatek/{sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} (86%)
 create mode 100644 mediatek/sof/sof-mt8186.ldc
 create mode 100644 mediatek/sof/sof-mt8195.ldc
 create mode 100644 mediatek/sof/sof-mt8195.ri


