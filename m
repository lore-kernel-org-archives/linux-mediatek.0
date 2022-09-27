Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF75C07E9D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 02:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+q13yZDqENXy1FOydXcSZraRyY3jub7Y3xr4iCyUYY=; b=TwEbie9hlTYFpXXzfQWgpYLzas
	crB//k97ifNcAOjEO6SdNiPggoHcKNtXZ9uJjiwmI/Jq+Ug81xqvSjW7s7uI6e39MnsERJXzQ4Iwn
	NQ2ZFOMYq1gFFnvXfDYkdXNCybZ2SqGjYXnxP4OBJYz4vw+v3Sm+m8RCvuMxrlffXDl05skIdtH5q
	a9s+afCqqXcMn8yEsy2YKBQ56G+woQgGkUY5qYvE9vQvOj4+ivwf1doZLPP85mYLcpHlvjNdiUkyQ
	C1ps43arvuCls5SKjLvVmtPBzyjDgp4dIQ948WdNfBPDWi93tEtaAMGAyk0mYzTp+eM5wMmMd1ims
	j5+raGPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od06u-007pSE-5n; Tue, 27 Sep 2022 02:14:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od06g-007pRq-Ia
	for linux-mediatek@lists.infradead.org; Tue, 27 Sep 2022 02:14:11 +0000
X-UUID: 55e7a6bc09d442bfb3694c4a2a06a739-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=V+q13yZDqENXy1FOydXcSZraRyY3jub7Y3xr4iCyUYY=;
	b=lpcVUtI8sKtAEMVRt/IdRKgdQqk42+pQheFmUYqauZazSNs16lXJBjGnqsjdN0BIIZhC7WfavDLdKMKqOTHDDIENAKLEYMwhAZvfpwFtVEzy3aZKgb0q9AqbABwHw9WDgag50ntOhqVPhqQmgzvrrflbDLpJv8q0zCV2Dl77q+M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:e230ba86-0780-4aa0-a4af-5b6a2a39ed9d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.11,REQID:e230ba86-0780-4aa0-a4af-5b6a2a39ed9d,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:39a5ff1,CLOUDID:b98d28a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:220926222724XZJW1LIF,BulkQuantity:65,Recheck:0,SF:28|17|19|48,TC:nil
	,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 55e7a6bc09d442bfb3694c4a2a06a739-20220926
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1879025398; Mon, 26 Sep 2022 19:13:44 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Sep 2022 10:12:43 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 27 Sep 2022 10:12:43 +0800
Message-ID: <668c8e070faa138d5a2bf345f65a27fab908842f.camel@mediatek.com>
Subject: Re: [PULL v2 linux-firmware] Update mediatek mt81xx SOF firmware
From: TingHan Shen <tinghan.shen@mediatek.com>
To: Josh Boyer <jwboyer@kernel.org>
CC: <linux-firmware@kernel.org>, <linux-mediatek@lists.infradead.org>,
	<chunxu.li@mediatek.com>, <allen-kh.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>
Date: Tue, 27 Sep 2022 10:12:43 +0800
In-Reply-To: <CA+5PVA60ODTEZPoYqPMqjxu_ARxFLmeHie11McQUAx95+bXwFw@mail.gmail.com>
References: <835f393df9cc985fe5b815bc6eeaf06ab4d07192.camel@mediatek.com>
	 <CA+5PVA60ODTEZPoYqPMqjxu_ARxFLmeHie11McQUAx95+bXwFw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_191358_648311_3500D2A5 
X-CRM114-Status: GOOD (  24.91  )
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

On Mon, 2022-09-26 at 10:27 -0400, Josh Boyer wrote:
> On Fri, Sep 16, 2022 at 4:35 AM TingHan Shen <tinghan.shen@mediatek.com> wrote:
> > 
> > Hi maintainers,
> > 
> > This pull request adds new MediatekTek MT8195 SOF firmware and
> > updates MT8186 SOF firmware.
> > 
> > Please let me know if there is any problem.
> > 
> > Best regards,
> > TingHan
> > 
> > --
> > 
> > The following changes since commit f09bebf31b0590bdc875d7236aa705279510cfd0:
> > 
> >   amdgpu: update yellow carp DMCUB firmware (2022-09-13 08:02:23 -0400)
> > 
> > are available in the Git repository at:
> > 
> >   https://urldefense.com/v3/__https://github.com/tinghan-shen/linux_fw_scp__;!!CTRNKA9wMg0ARbw!zqfFVP7tWlJ3XFU-l8fMAh36-BXt04WguMdj2WJq4tCdMxoKl0Ikb3chkJ9nzBB0I0Q$  mtk-20220915
> > 
> > for you to fetch changes up to 3e08c58f8af488c41573c4a64a261e3b3f35849b:
> > 
> >   mediatek: Add new mt8195 SOF firmware (2022-09-16 16:19:11 +0800)
> > 
> > ----------------------------------------------------------------
> > Tinghan Shen (2):
> >       mediatek: Update mt8186 SOF firmware
> >       mediatek: Add new mt8195 SOF firmware
> > 
> >  WHENCE                                                                                      |  11 ++++++++---
> >  mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg}           | Bin
> >  mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg                                  | Bin 0 -> 20895 bytes
> >  .../sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} | Bin 16191 -> 16191 bytes
> 
> This fails check_whence.py:
> 
> [jwboyer@vader linux-firmware]$ ./check_whence.py
> E: mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg not
> listed in WHENCE
> [jwboyer@vader linux-firmware]$
> 
> Can you fix it up please?
> 
> josh
> 
> >  mediatek/sof/sof-mt8186.ldc                                                                 | Bin 0 -> 48436 bytes
> >  mediatek/sof/sof-mt8186.ri                                                                  | Bin 128712 -> 128712 bytes
> >  mediatek/sof/sof-mt8195.ldc                                                                 | Bin 0 -> 40568 bytes
> >  mediatek/sof/sof-mt8195.ri                                                                  | Bin 0 -> 100740 bytes
> >  8 files changed, 8 insertions(+), 3 deletions(-)
> >  rename mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg} (100%)
> >  create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg
> >  rename mediatek/{sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} (86%)
> >  create mode 100644 mediatek/sof/sof-mt8186.ldc
> >  create mode 100644 mediatek/sof/sof-mt8195.ldc
> >  create mode 100644 mediatek/sof/sof-mt8195.ri
> > 

Hi josh,

I forgot to update the WHENCE after added the file.
I'm sorry, and following is the udpated PR.

Best regards,
TingHan

--

The following changes since commit 126b56964ff8714657eb51a28cc07a31629e603d:

  Merge branch 'guc_70.5.1_huc_nover' of git://anongit.freedesktop.org/drm/drm-firmware (2022-09-26 10:30:08 -0400)

are available in the Git repository at:

  https://github.com/tinghan-shen/linux_fw_scp mtk-20220915

for you to fetch changes up to daee413cb1a49ce87d237247dbdfcea405ee3b99:

  mediatek: Add new mt8195 SOF firmware (2022-09-27 10:03:00 +0800)

----------------------------------------------------------------
Tinghan Shen (2):
      mediatek: Update mt8186 SOF firmware to v0.2.1
      mediatek: Add new mt8195 SOF firmware

 WHENCE                                                                                                |  12 +++++++++---
 mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg}                     | Bin
 mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg                                            | Bin 0 -> 20895 bytes
 mediatek/{sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} | Bin 16191 -> 16191 bytes
 mediatek/sof/sof-mt8186.ldc                                                                           | Bin 0 -> 48436 bytes
 mediatek/sof/sof-mt8186.ri                                                                            | Bin 128712 -> 128712 bytes
 mediatek/sof/sof-mt8195.ldc                                                                           | Bin 0 -> 40568 bytes
 mediatek/sof/sof-mt8195.ri                                                                            | Bin 0 -> 100740 bytes
 8 files changed, 9 insertions(+), 3 deletions(-)
 rename mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg} (100%)
 create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg
 rename mediatek/{sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} (86%)
 create mode 100644 mediatek/sof/sof-mt8186.ldc
 create mode 100644 mediatek/sof/sof-mt8195.ldc
 create mode 100644 mediatek/sof/sof-mt8195.ri




