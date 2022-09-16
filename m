Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1288ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLZIOkEjEyE+zAQv9v+Cv5xDRXAHppMKiS00s2v2zx8=; b=0pOI5n9oS4LCLmNtiSYeyRfY7T
	7lGdhZn9o10Hdd4W36I5trY4fexNJUAC+re9rhi8S9tLBDkOEdTe7YucykJi/bIWvfBT8IOe4+8RS
	6l9SC4sOi+Wyo1xZTJUnr/tvNfTHmqbo/87Em7u6PPk1VL4ukpQTAf8ouWufKN/ZrqwzVMo/V6tDa
	AnfPSbCEEi03ueihyUetMpYgTDmYk1K5djkUaxOm7n0u5bHTFX/yQIQoBt0x05oDbCrCLyZk0DB30
	IBY4uN3VwZ/nzJwlbaBHCcWIr1bEQYS2hc1qdJVRyVwI6yK8JWBcp4QUR3dScXIzQrlrWoq55EziL
	but7/L7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ6ZZ-00AwoO-K5; Fri, 16 Sep 2022 08:19:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ6XP-00AtmN-3v
	for linux-mediatek@lists.infradead.org; Fri, 16 Sep 2022 08:17:31 +0000
X-UUID: e1bd0930a9484e73b134d824e6d7f608-20220916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=MLZIOkEjEyE+zAQv9v+Cv5xDRXAHppMKiS00s2v2zx8=;
	b=NicPOOYROVvGBCJV4JsFCQdZweF+WgsDG3Huh1tmBvN3rpSOCyjzHERS638SjHnpNuwdEwBkmrMwbBNjQPqfuZ2gkFfDYB2/j1c+ac1UKouepX1Nr9FpDpKknoGwOLogaAZuDc2Syb03ABvpegyZhRZqk2bGBok1nm16rUxFu+c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:9633ead0-e2fc-481a-b4c1-dc2264c9a600,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:ffaaa2f6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e1bd0930a9484e73b134d824e6d7f608-20220916
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 590901927; Fri, 16 Sep 2022 01:17:21 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 16 Sep 2022 16:16:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Sep 2022 16:16:44 +0800
Message-ID: <2583b4850bb68c4d68a4f0a2131f900eb4c8c4c4.camel@mediatek.com>
Subject: Re: [PULL linux-firmware] Update mediatek mt81xx SOF firmware
From: TingHan Shen <tinghan.shen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <chunxu.li@mediatek.com>,
	<allen-kh.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 16 Sep 2022 16:16:43 +0800
In-Reply-To: <8b130b9c-1d86-46de-f4c8-1a9cdae45c45@collabora.com>
References: <20220916032146.17774-1-tinghan.shen@mediatek.com>
	 <8b130b9c-1d86-46de-f4c8-1a9cdae45c45@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_011727_258804_42CF9EAA 
X-CRM114-Status: GOOD (  19.19  )
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

On Fri, 2022-09-16 at 09:28 +0200, AngeloGioacchino Del Regno wrote:
> Il 16/09/22 05:21, Tinghan Shen ha scritto:
> > Hi maintainers,
> > 
> > This pull request adds new MediatekTek MT8195 SOF firmware and
> > updates MT8186 SOF firmware.
> > 
> > Please let me know if there is any problem.
> > 
> 
> TingHan, please, also add sof-mt8195-mt6359-rt1019-rt5682-dts.tplg as
> that's used by "google,tomato" (for more information, please check
> sound/soc/sof/mediatek/mt8195/mt8195.c).
> 
Hi Angelo,

ok, I'll update this PR.

Thanks,
TingHan



> Thanks,
> Angelo
> 
> > Best regards,
> > TingHan
> > 
> > ---
> > 
> > The following changes since commit f09bebf31b0590bdc875d7236aa705279510cfd0:
> > 
> >    amdgpu: update yellow carp DMCUB firmware (2022-09-13 08:02:23 -0400)
> > 
> > are available in the Git repository at:
> > 
> >    https://urldefense.com/v3/__https://github.com/tinghan-shen/linux_fw_scp__;!!CTRNKA9wMg0ARbw!zpAPF7ykmOeU8Bo8r1QtkNh24moDSk8fNvQn-Nh0JRetcsd-Lpc0IaQb5qbHCH5S9Hc$  mtk-20220915
> > 
> > for you to fetch changes up to 78cff08a90dff21fe6f5f2f961d12604bd125e95:
> > 
> >    mediatek: Add new mt8195 SOF firmware (2022-09-16 10:42:01 +0800)
> > 
> > ----------------------------------------------------------------
> > Tinghan Shen (2):
> >        mediatek: Update mt8186 SOF firmware
> >        mediatek: Add new mt8195 SOF firmware
> > 
> >   WHENCE                                                                                      |  11 ++++++++---
> >   mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg}           | Bin
> >   .../sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} | Bin 16191 -> 16191 bytes
> >   mediatek/sof/sof-mt8186.ldc                                                                 | Bin 0 -> 48436 bytes
> >   mediatek/sof/sof-mt8186.ri                                                                  | Bin 128712 -> 128712 bytes
> >   mediatek/sof/sof-mt8195.ldc                                                                 | Bin 0 -> 40568 bytes
> >   mediatek/sof/sof-mt8195.ri                                                                  | Bin 0 -> 100740 bytes
> >   7 files changed, 8 insertions(+), 3 deletions(-)
> >   rename mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg} (100%)
> >   rename mediatek/{sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} (86%)
> >   create mode 100644 mediatek/sof/sof-mt8186.ldc
> >   create mode 100644 mediatek/sof/sof-mt8195.ldc
> >   create mode 100644 mediatek/sof/sof-mt8195.ri
> > 
> 
> 



