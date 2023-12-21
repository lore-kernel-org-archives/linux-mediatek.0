Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75068C46CD2
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 17:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98M74nhAlWRaas2QkAu79IUVtawo3FNvyeA6Kc4g2mM=; b=2e/QEItE7y0jqJfNsxNkK005iR
	qe+YTKJZJhO2RRhioiEeRg6p3GawR5wC/lWB6KxQ6LrIkamXkQCNDoEZY2M7XqeURnisaB50I6y2Q
	CkjX4AJTlD42ezV/3gmxWwENn5mF3eedzBWBQpXP7eff7C+ft31UjiYqVgf4d4x49TFC0g42zfgEh
	aeSoyEHl5UL1HQMJPPlz52D1qLBQGsH6qFEJH159KniXJ+gtWfe3OjPUJ8miG13cZPG9PKn31PvwS
	9FiERd57J+uNoawJCWg5bwgv6kzM3Tiw/FEYBVXTsdhHKN6XFa7iKFT9P4WWvEpX41aDWZe1dvQv7
	YxVrMceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGMeP-003bcG-1O;
	Thu, 21 Dec 2023 17:16:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGMeK-003bbA-2L;
	Thu, 21 Dec 2023 17:15:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 094DF6186A;
	Thu, 21 Dec 2023 17:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE46C433D9;
	Thu, 21 Dec 2023 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703178955;
	bh=+zyXRn20w9EQZVYWIlgPBatlUpErpGuSEmHVNzCBnRY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dxK+bMpOr3ZXrqtkX+4I99FHLCgwz2ydUpLgWFDG3z4xLnkjRUe0I26qTX3UDcHbt
	 qCgjDqoNpQjQsLXwM920syDLXffV6ZNPlMmdtSm36vCw5lelSeI4VBkZFDvthQG5SR
	 0gakYzUj4rGQYYx/LHd+j6lj3A064Hcczgo54upcUXEYJtZZEMCRe4G9Cr2uaqqn+l
	 z0+m5d13TotrYyQO1NHo+Zc4HnnTgEd7LGpUku4e5LFd9NFK2yCFxHJC363mo5e+13
	 Ry6RutvhKDvkCAzeC8WtaU3+a9dxErBNAf5/lMUn7LaIIUA78ATe1H6MQEitixTbbN
	 1q/FztPwybVqw==
From: Vinod Koul <vkoul@kernel.org>
To: bvanassche@acm.org, mani@kernel.org, adrian.hunter@intel.com, 
 beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com, 
 martin.petersen@oracle.com, Can Guo <quic_cang@quicinc.com>
Cc: linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <1701520577-31163-1-git-send-email-quic_cang@quicinc.com>
References: <1701520577-31163-1-git-send-email-quic_cang@quicinc.com>
Subject: Re: (subset) [PATCH v8 00/10] Enable HS-G5 support on SM8550
Message-Id: <170317895067.712473.11493486832134923013.b4-ty@kernel.org>
Date: Thu, 21 Dec 2023 22:45:50 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_091558_381649_98265119 
X-CRM114-Status: UNSURE (   6.79  )
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


On Sat, 02 Dec 2023 04:36:06 -0800, Can Guo wrote:
> This series enables HS-G5 support on SM8550.
> 
> This series is rebased on below changes from Mani -
> https://patchwork.kernel.org/project/linux-scsi/patch/20230908145329.154024-1-manivannan.sadhasivam@linaro.org/
> https://patchwork.kernel.org/project/linux-scsi/patch/20230908145329.154024-2-manivannan.sadhasivam@linaro.org/
> 
> This series is tested on below HW combinations -
> SM8550 MTP + UFS4.0
> SM8550 QRD + UFS3.1
> SM8450 MTP + UFS3.1 (for regression test)
> SM8350 MTP + UFS3.1 (for regression test)
> 
> [...]

Applied, thanks!

[09/10] phy: qualcomm: phy-qcom-qmp-ufs: Rectify SM8550 UFS HS-G4 PHY Settings
        commit: 5301b7a04040b0a6191856c765146e0a9ab88ebc
[10/10] phy: qualcomm: phy-qcom-qmp-ufs: Add High Speed Gear 5 support for SM8550
        (no commit info)

Best regards,
-- 
~Vinod



