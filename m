Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC030C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 01:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jymubqzyQ20Oo5gkiZh4M3e7IOV0wSz7F8nCc0wTeto=; b=J+3I1KTqW+qmVt
	x75kPEyCOxAuKU6BpRrWd334IzJRVxc04LVHT/X3S48tUv5ZdvrmBP8MnwriSC0DisvcLOOiMih4S
	/NOPJjYhyC2RQclRyVezu/y724NrCtl0K40igACYQwppetpV3lpbpP6VQk1mZ+/P27akd2gEQpvMB
	V9yKJyLwzloC9dUYB9Uzl9mr/EjgkExI7tqddzkzrSWMPiQ825ECLQ1olSG0rIxURzKAGbhZ2nRi2
	Rc50ZPzmtEeVyoTDniCzKnMjaoOO3VXALP8dxMIm2csvMgoE2FPimU0ipFCMb+MVZTFhXC21+7lMB
	NPqJrMwSWg6GxnykwUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDFkJ-0000ou-Fu; Fri, 28 Jan 2022 01:08:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDFfC-00HaYW-LH
 for linux-mediatek@lists.infradead.org; Fri, 28 Jan 2022 01:02:57 +0000
X-UUID: 3d585b8bcac544debb779ede42a3e12d-20220127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SfZt0gp/8viGWeJzyCXtzZEqpPBrY/99nwuzUimbE1U=; 
 b=HoiZjbtPTTMmmT1kkY08BTizL/PsTXLQNBGJk4rSy1TRz/22BfChLqmjTfHgzhc7lYIgCT7SQpqTT9lnHmMak8wCCduXFIRUdImgr0FBA4FPYp6wmRbEj1BhyFuEB6IMFmYDUI0Pc9BCfuC6emKGLfOKbu+DREUDvhi/jdm8e5w=;
X-UUID: 3d585b8bcac544debb779ede42a3e12d-20220127
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 840244364; Thu, 27 Jan 2022 18:02:48 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Jan 2022 17:02:47 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 28 Jan 2022 09:02:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 09:02:44 +0800
Message-ID: <c847fc0055557ac362305b2689caf14cd96a4fe0.camel@mediatek.com>
Subject: Re: [PATCH] spi: spi-mtk-nor: make some internal variables static
From: Guochun Mao <guochun.mao@mediatek.com>
To: Mark Brown <broonie@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Bin Zhang
 <bin.zhang@mediatek.com>,
 <project_global_chrome_upstream_group@mediatek.com>, kernel test robot
 <lkp@intel.com>, Bayi Cheng <bayi.cheng@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 28 Jan 2022 09:02:44 +0800
In-Reply-To: <164321141754.490431.3020669404541003433.b4-ty@kernel.org>
References: <20220126091159.27513-1-guochun.mao@mediatek.com>
 <164321141754.490431.3020669404541003433.b4-ty@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_170256_137583_C8151B20 
X-CRM114-Status: GOOD (  17.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Thank you very much.

BR,
Guochun


On Wed, 2022-01-26 at 15:36 +0000, Mark Brown wrote:
> On Wed, 26 Jan 2022 17:11:59 +0800, guochun.mao@mediatek.com wrote:
> > From: Guochun Mao <guochun.mao@mediatek.com>
> > 
> > Variables mtk_nor_caps_mt8173, mtk_nor_caps_mt8186 and
> > mtk_nor_caps_mt8192 are not declared.
> > Make them static.
> > 
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git
> for-next
> 
> Thanks!
> 
> [1/1] spi: spi-mtk-nor: make some internal variables static
>       commit: 474fc2e6395d62758e80b9ea65f61339296355fc
> 
> All being well this means that it will be integrated into the linux-
> next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual
> testing
> and review of the tree, please engage with people reporting problems
> and
> send followup patches addressing any issues that are reported if
> needed.
> 
> If any updates are required or you are submitting further changes
> they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when
> replying
> to this mail.
> 
> Thanks,
> Mark
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
