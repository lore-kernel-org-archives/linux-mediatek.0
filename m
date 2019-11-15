Return-Path: <SRS0=MjbJ=ZH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A572AC43215
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Nov 2019 05:33:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 778072072D
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Nov 2019 05:33:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qTmqh55H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="p/0M+qb3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 778072072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDbwzFCZdfbduYU1i4Yjw2Z1oway2h8aZieIF3bCELo=; b=qTmqh55HzGxYmc
	50QiOhkwA9NGWN2vbHYiNIjG3k6vFBZKFNOK45Kv8pnzv7LsxS8OkTToJ10GoFsNKOo70Ns5QLhFz
	vy64MMapdzEkiPB1y5ejnRXnhADWd2ZiZ+DtYtSvMLsTyM4BjB4nhpGFlkgaz38DmNZQiPFM23GJY
	v41D7TAcHGPjZbqOfSukeLO336l0gGZixiE2k0urmBPm9Om8cFWK/ofh/xHxPMTkycAvFN8lGsKg1
	OHKjXMZp8/tLnfwr5Dhtk1jfEVHvB9oXfCLUK+xf3ZVdB64WHLzZKFB8pF2F40K3jPwgl6xFD5ccn
	EMMRCsq9CvZCK5cOXSYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVUEn-0002qW-Tx; Fri, 15 Nov 2019 05:33:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVUEf-0002iK-Kn
 for linux-mediatek@lists.infradead.org; Fri, 15 Nov 2019 05:33:34 +0000
X-UUID: dcb6dcca020045d4bb33f473dddfca2c-20191114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gmCzP92C7G4qxYX2rnqn8wBdFvNJ/rhP3o6A+8fl2G0=; 
 b=p/0M+qb3eDhRKvkPjf5KIXIhey3RDqBLvm4wVRzwdzGedrLCWcssIEsRW6WoO67jYIwIRQluHTe6fZxFykUyTtlzesNJ0CJsw8krIMCdlyc4spEWGIVDSawR6179YjCF4zV2P86Y2ZW2IDmenHgTTjfrkYibawnOqp+EL76wJoU=;
X-UUID: dcb6dcca020045d4bb33f473dddfca2c-20191114
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <eason.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 892533983; Thu, 14 Nov 2019 21:33:26 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 14 Nov 2019 21:33:22 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 15 Nov 2019 13:33:19 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 15 Nov 2019 13:33:20 +0800
Message-ID: <1573796002.14232.14.camel@mtkswgap22>
Subject: Re: [PATCH] ASoC: mediatek: common: refine mtk_afe_fe_hw_params
From: Eason Yen <eason.yen@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Fri, 15 Nov 2019 13:33:22 +0800
In-Reply-To: <20191112173409.GI5195@sirena.co.uk>
References: <1573532538-30602-1-git-send-email-eason.yen@mediatek.com>
 <1573532538-30602-2-git-send-email-eason.yen@mediatek.com>
 <20191112173409.GI5195@sirena.co.uk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 86CE66E82027474A9B0B7FFEFCC7979862667C6949F3058B7B4509A9EF0DCEB82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_213333_693979_62ECC141 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, jiaxin.yu@mediatek.com,
 chipeng.chang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Mark,

 
On Tue, 2019-11-12 at 17:34 +0000, Mark Brown wrote:
> On Tue, Nov 12, 2019 at 12:22:18PM +0800, Eason Yen wrote:
...
> 
> It'd be better to split these two into separate patches, they're two
> separate things.  Ideally the refactoring should just be simple code
> motion.  Right now the patch is a bit difficult to follow.
> 

Ok, I will separate this patch soon.


> >  static int mtk_regmap_update_bits(struct regmap *map, int reg,
> > -			   unsigned int mask,
> > -			   unsigned int val, int shift)
> > +				  unsigned int mask,
> > +				  unsigned int val, int shift)
> >  {
> >  	if (reg < 0 || WARN_ON_ONCE(shift < 0))
> >  		return 0;
> 
> This is an unrelated indentation change?

Yes, it is an alignment that to match open parenthesis.

> 
> > +	dev_info(afe->dev, "%s(), %s, ch %d, rate %d, fmt %d, dma_addr %pad, dma_area %p, dma_bytes 0x%zx\n",
> > +		 __func__, memif->data->name,
> > +		 channels, rate, format,
> > +		 &substream->runtime->dma_addr,
> > +		 substream->runtime->dma_area,
> > +		 substream->runtime->dma_bytes);
> 
> This is going to get noisy, dev_dbg at most please.

Ok, thanks for your suggestion.


Regards,
Eason
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
