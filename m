Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0154C282EC
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Mar 2025 22:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoiB0OKzQ2IpugVfhu9Zqd80FxTVvUiXPucC5eFwf0w=; b=WNIbqbHsam3fWsr8on3ShZzWaZ
	Pb1Q5yvKS68j9DimBp5mBm0Uw3K8Qxs9JOOlyLPB1nyPfNNMH6ynr9kzgELCCwiMH2GlY1eUWiw9j
	yYUgrWi02eAYG/1D57/TSJzrXTW9s/C8GtvP8m5PB03LfW5kV5b6WN1CL3vDH+4iJ9hnFwMrKtQg/
	yr3Q+yZzcrE6nvdkIDYXD409yDRkbX2kbHinEZcba22NHH2Uh7eDkCn+eYhKaPqm6s6JV+0tqLW+V
	/tjMPPeEHWLqqTFxIfazG74KTMaDniOj5YnzfxnRK7h1OWrk9tt5TAbQQQIXxb0M88I7ioiFckkar
	aa8End9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tufWU-00000007GUv-0c6V;
	Tue, 18 Mar 2025 22:34:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufOz-00000007Fh1-0Pyb
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Mar 2025 22:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742336831;
	bh=AkpgKvUarThusXyGYaY2RATeVpD4WCSAnra8Rvx0+NU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KRiR6TtUG1HRk8lhBBofJc6fOCxRIHWmsChLfwIDvYl7Fcz1L05wxxs4pRoLl4MGA
	 4m5+AbHq3uBpP7qbuULHm7tma0K1PwyJsdTWU2LFVas08ulPYl9VXIi77iJJ9UEfWY
	 vpXEUPq0BH4A2Y60sv3O5j+r6UVI+A0sA4VcLC7qlM3XVpzjIlZBEj8brtVITMjhVf
	 pyfZ1KqFdQs6bYT0uc7lZploQJ6t1ZRafNAcvGlcnEr7pA7BsoGKOhhD/1vQUkLaeZ
	 3qgVUPMTmHwwRmpuuc3WlstAg3B9S2Dr6BrHfdIB/3aeyEw6rA8383Rl2WmM9U/wKA
	 L0c31YkDq5+kA==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3168617E0FCC;
	Tue, 18 Mar 2025 23:27:09 +0100 (CET)
Date: Tue, 18 Mar 2025 19:27:07 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jason Chen <Jason-ch.Chen@mediatek.com>
Subject: Re: [PATCH] mediatek: Add MT8188 SCP firmware
Message-ID: <2f7b538f-c868-4f7b-8fe5-cec2227996a5@notapiano>
References: <20250318094809.3540043-1-moudy.ho@mediatek.com>
 <20250318094809.3540043-2-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250318094809.3540043-2-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_152713_311153_6CF0FA68 
X-CRM114-Status: GOOD (  11.84  )
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

On Tue, Mar 18, 2025 at 05:47:19PM +0800, Moudy Ho wrote:
> System Control Processor is an RISC-V processor in MediaTek MT8188 SoC.
> It supports vedio encode/decode, MDP and CrOS EC host command.
> 
> Internal version: geralt_scp_v2.0.27749-b012b17bb
> Release version: v2.0.27749
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  mediatek/mt8188/scp.img | Bin 0 -> 636548 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 mediatek/mt8188/scp.img
> 
> diff --git a/mediatek/mt8188/scp.img b/mediatek/mt8188/scp.img
> new file mode 100644
> index 0000000000000000000000000000000000000000..d7d7b1818b76b599fafbfc53e05dc3016e1cbb28

Hi Moudy,

This firmware fails to load when using the dual core SCP DT description [1]:

  [   79.494105] remoteproc remoteproc0: powering up scp
  [   79.496217] remoteproc remoteproc0: Booting fw image mediatek/mt8188/scp.img, size 636548
  [   79.497298] platform 10500000.scp: IPI buf addr 0x000ffb40
  [   79.498013] platform 10500000.scp: IPI buffer does not fit in SRAM.

Please submit the firmware that works with the dual-core SCP description.

Thanks,
Nícolas

[1] https://lore.kernel.org/all/20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com

