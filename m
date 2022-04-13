Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD2DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 03:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DuyigrIxKTABkjvkKhd/LoME5HjOdaEfRbA9JlWyRbQ=; b=XUfS7iLFtEPQ1A
	Ryr7+KAco4GbP+vD4iOnKgPsk1J9JHyPhLVXpYDr/XMmmdg8Tm5Qd7Qaf4sBSKL7JNG18VQW1/TNj
	hIeS2t0rGn5aRRQf3LTsi5rFaxVrxyGT8L4Wb5Ln6881gHJs6S54lpowoZSOC8KFJ25ibFcTwVZDy
	MFyd40/I589BrcJ/G5SAQXFsDVoBao1mNj2HdrDO3N/zVteO7SLM/8Gnw6AfjWTbDbk4hwinzxmu1
	efx6GA6e2QrFhNubuouaLIrHAWedZg/XvVmfyLeA0RU2Dl2qtXgXV/jY5Xc3g/0QFadx50m98cwLH
	eX1QVHfGXeuJ9SHbUXsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neTua-00Gb4o-Cs; Wed, 13 Apr 2022 03:43:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neTuV-00Gb3z-MK; Wed, 13 Apr 2022 03:43:17 +0000
X-UUID: 04f3202c4ab3449ca24f9a14e77e97a5-20220412
X-UUID: 04f3202c4ab3449ca24f9a14e77e97a5-20220412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1627108217; Tue, 12 Apr 2022 20:43:07 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 20:33:48 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 13 Apr 2022 11:33:47 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Apr 2022 11:33:47 +0800
Message-ID: <aba056b08ed834edca7811ea00b957df748703a6.camel@mediatek.com>
Subject: Re: [PATCH] spi: spi-mtk-nor: initialize spi controller after resume
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Mark Brown <broonie@kernel.org>, <ikjn@chromium.org>,
 <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-spi@vger.kernel.org>
Date: Wed, 13 Apr 2022 11:33:47 +0800
In-Reply-To: <164979303551.449574.9303978009033918270.b4-ty@kernel.org>
References: <20220412115743.22641-1-allen-kh.cheng@mediatek.com>
 <164979303551.449574.9303978009033918270.b4-ty@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_204315_777939_4691755E 
X-CRM114-Status: GOOD (  20.63  )
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

Hi Mark,

On Tue, 2022-04-12 at 20:50 +0100, Mark Brown wrote:
> On Tue, 12 Apr 2022 19:57:43 +0800, Allen-KH Cheng wrote:
> > After system resumes, the registers of nor controller are
> > initialized with default values. The nor controller will
> > not function properly.
> > 
> > To handle both issues above, we add mtk_nor_init() in
> > mtk_nor_resume after pm_runtime_force_resume().
> > 
> > [...]
> 
> Applied to
> 
>    
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git__;!!CTRNKA9wMg0ARbw!yMeMfZ19NoVygn0D8jzp0BcX0t6mWOG9BHPtCkD4VW8I24y8h9ZJKA7R-g5XFhDiXJnnCz0t18TJC-73vXyYW0m8CQ$
>   for-next
> 
> Thanks!
> 
> [1/1] spi: spi-mtk-nor: initialize spi controller after resume
>       commit: 317c2045618cc1f8d38beb8c93a7bdb6ad8638c6
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

Sorry, There is one issue I want to correct in commit message.

"To handle both issues [etc]" should become something like:
"Solve this issue by reinitializing the registers right after resuming
the controller"

Do you mind help me modify commit message? or I can send a new PATCH to
correst this.

I apologize for any inconvenience caused.

Thanks,
Allen



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
