Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF01DC77B7F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 May 2023 16:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sP1s3TyTNR2xaheXB5ulgxT8TwPE9wVNHMHH4x9e/js=; b=os5IAtcowl+x1/G24/kS/5pdIg
	8eWAyNw6QXcvQZtk+rQMlfScrN60j0kjDJIq+xUvxj9VJXe79eqxFWBT3NMZzR6I9O4FiTJRfMNz7
	0QSau0y2q1Fa4nqenkjoYiX8zAG3jf5SPXU9rhQgrk58w+1Pgw7p5GKxtGOvjLD4Es3Ke+z50IdhN
	oYLolcvWGfQIdvn22kh1lqMuBQEPIA7seWzO4syTiP9NUKfB3ZKULi2rektDZkDTrnTAfXzW+cnK5
	FTQCqNGSYXvuzNZ3fqcoOc7iWndNdYkyfDsuwiQYw0ck3hMXcgXXBLHspje2H6kojjrqx8wpZvJpX
	MYg2kdoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyEg7-00HWjU-0W;
	Sun, 14 May 2023 16:34:35 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyEg1-00HWhy-0F;
	Sun, 14 May 2023 16:34:33 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pyEfh-00070J-22;
	Sun, 14 May 2023 16:34:09 +0000
Date: Sun, 14 May 2023 18:32:15 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Simon Horman <simon.horman@corigine.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Bo Jiao <bo.jiao@mediatek.com>,
	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	MeiChia Chiu <MeiChia.Chiu@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Wang Yufen <wangyufen@huawei.com>, Lorenz Brun <lorenz@brun.one>
Subject: Re: [PATCH] wifi: mt76: mt7915: add support for MT7981
Message-ID: <ZGENDwGXkuhrCGFY@pidgin.makrotopia.org>
References: <ZF-SN-sElZB_g_bA@pidgin.makrotopia.org>
 <ZGD192iDcUqoUwo3@corigine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGD192iDcUqoUwo3@corigine.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_093429_134939_B7E7A865 
X-CRM114-Status: GOOD (  23.06  )
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

Hi Simon,

thank you for reviewing!

On Sun, May 14, 2023 at 04:53:43PM +0200, Simon Horman wrote:
> On Sat, May 13, 2023 at 03:35:51PM +0200, Daniel Golle wrote:
> > From: Alexander Couzens <lynxis@fe80.eu>
> > 
> > Add support for the MediaTek MT7981 SoC which is similar to the MT7986
> > but with a newer IP cores and only 2x ARM Cortex-A53 instead of 4x.
> > Unlike MT7986 the MT7981 can only connect a single wireless frontend,
> > usually MT7976 is used for DBDC.
> > 
> > Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> ...
> 
> > @@ -489,7 +516,10 @@ static int mt7986_wmac_adie_patch_7976(struct mt7915_dev *dev, u8 adie)
> >  		rg_xo_01 = 0x1d59080f;
> >  		rg_xo_03 = 0x34c00fe0;
> >  	} else {
> > -		rg_xo_01 = 0x1959f80f;
> > +		if (is_mt7981(&dev->mt76))
> > +			rg_xo_01 = 0x1959c80f;
> > +		else if (is_mt7986(&dev->mt76))
> > +			rg_xo_01 = 0x1959f80f;
> 
> Hi Daniel,
> 
> 		rg_xo_01 will be used uninitialised below if we get here
> 		and neither of the conditions above are true.
> 
> 		Can this occur?

No, it cannot occur. Either of is_mt7981() or is_mt7986() will return
true, as the driver is bound via one of the two compatibles
'mediatek,mt7986-wmac' or newly added 'mediatek,mt7981-wmac'.
Based on that the match_data is either 0x7986 or 0x7981, which is then
used as chip_id, which is used by the is_mt7981() and is_mt7986()
functions.

> 
> >  		rg_xo_03 = 0x34d00fe0;
> >  	}
> >  
> 
> ...
> 

