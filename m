Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6EDC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 09:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xaTSHNPT9R07asRlacIBQdzrxwzzpDrDRwD8UYGiT2s=; b=gIRcWe3OnB/Vnn
	oNiczFXxIGNXafG5EDks7IR/kfMj78qTvahTy4FlevueWSHzRlcUaTkY6XrDngO11u2fS8E5Azrjw
	WokMLC4dsd4hQ2awtzclCUTagQqdZE9TNhdX9AZ3eJHVrC6b5zmmYaOnNtCvm7qqvxT9q6sBigfJN
	8a1gdffEfNFbcfj1Uycz23iSAHWwISYwz4WccBBE6DxtsYQaGicEyIyoSX1I7oAxofnM5kPAebqai
	9OaUhOgYv9oAjB1oixE5uf6vMi8HI/vGqiyfrXUxDnjXYq1d/izEPHI0jcrC7dAH/w9uPABxi9c0d
	30UksjLslTNGifExah6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpSRB-001YQQ-9V; Tue, 23 Nov 2021 09:50:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpSR9-001YPT-Fd; Tue, 23 Nov 2021 09:50:04 +0000
X-UUID: 031bc7d3ccd04356b1003a69d3cd75f4-20211123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=eK8cNyw7sAT+aeXPMqxaBd/3F94Dku6ahUx4FSXj9aE=; 
 b=rGK3uz95OVIl5bMVczCheemocfss6rK5W3/FpyrEYRG4CYAQqx1mr1s+noPBZ71YDT/sdC3hfBpr0JWcWvwBBE9SAJ8+/q+JenX82uF02nBjBJBNCzTld7r4kOvA3Q677JVjJ0eIW0YtLCLs3rfDeDgNpRozlcwMHupiEv/nHuE=;
X-UUID: 031bc7d3ccd04356b1003a69d3cd75f4-20211123
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 148885430; Tue, 23 Nov 2021 02:50:00 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Nov 2021 01:49:59 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 23 Nov 2021 17:49:58 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Nov 2021 17:49:57 +0800
Message-ID: <a0eddcc82cf4fc28eb96d7cb37cf1ad4252d39c3.camel@mediatek.com>
Subject: Re: [PATCH] ASoC: mt8192: remove unnecessary CONFIG_PM
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
CC: <broonie@kernel.org>, <matthias.bgg@gmail.com>,
 <alsa-devel@alsa-project.org>, kernel test robot <lkp@intel.com>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Date: Tue, 23 Nov 2021 17:49:57 +0800
In-Reply-To: <CA+Px+wWeV=9DF7wdSyjaZKS=XCJjri1Dmpf-kfNVZOqm5fV33w@mail.gmail.com>
References: <20211122164644.19442-1-jiaxin.yu@mediatek.com>
 <20211122164644.19442-2-jiaxin.yu@mediatek.com>
 <CA+Px+wWeV=9DF7wdSyjaZKS=XCJjri1Dmpf-kfNVZOqm5fV33w@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_015003_546831_57CA315E 
X-CRM114-Status: UNSURE (   9.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2021-11-23 at 11:12 +0800, Tzung-Bi Shih wrote:
> On Tue, Nov 23, 2021 at 12:48 AM Jiaxin Yu <jiaxin.yu@mediatek.com>
> wrote:
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> 
> Acked-by: Tzung-Bi Shih <tzungbi@google.com>
> 
> Could you also submit another series for the cleanup?
> 
> At least for sound/soc/mediatek/:
> $ rg --files-with-matches CONFIG_PM sound/soc/mediatek/
> sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
> sound/soc/mediatek/mt8173/mt8173-rt5650.c
> sound/soc/mediatek/mt8173/mt8173-max98090.c
> sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
> sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
> sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
> sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
> sound/soc/mediatek/mt8183/mt8183-afe-pcm.c

Hi Tzung-Bi,

Ok, I will remove them from sound/soc/mediatek folder in PATCH v2.
Thank you for reminding.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
