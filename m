Return-Path: <SRS0=5o2P=BZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4451AC433E1
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 17:28:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1430623B18
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 17:28:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bD4JWuCf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cf7RFWDW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1430623B18
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/Htp7MyCiMsKYYOHRKZgoM8Ew9Iq04RjBtJ7C1ewqAY=; b=bD4JWuCfV84q7otwqNXTkKlbM
	S+VgjP1nKXoVoEpTqUFMeJ87n4bg6lYYzkm5TWFgoMs2TGD8DMEJjpwpX5AjCcAp3YylXzD+ehlsg
	CC27HMSDks++UzWecgxs3QMlVWrlMJYquAqmO6P1tEW65Qhhv9JQSpoNZ8GS/Wq47+KdBH42Y4fMe
	dRBoQTDHkZLcwir/drjrm6i1SWs6Q5zmGWF/sJVqTofDEG7EjFc1rmdFRFxrYp5kotwsDjb0qOOOW
	MJs9qaSWo3Y65omjLhEikUnN40nJIOzpUjDZRaBzEsZtTBov7gn81nOf21E8JAQiGEDlC95jH5Iw9
	ufj+uUqjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6zyZ-0000V9-UX; Sat, 15 Aug 2020 17:28:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6zyW-0000Tf-Rm; Sat, 15 Aug 2020 17:28:13 +0000
X-UUID: 71819bdf7ee948ec8b129ca3e6cb8b6b-20200815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Tb6/rrU+Whgc4JVZQ17Em6fT1xwjS1hWvPGz2ZfXBbs=; 
 b=cf7RFWDWSZMnqMTyJVZzZquy2TgM7pNMTxoke84RGmj6aPAvk9PSs/7yssnC97kTK/O7O2RNwDWHpuGK9NB0qP6ok71yiOpEV/A23ZeD83x2rQjWHReJcgEyGEDwkatgKM9ZG7L7z2gzRSaOd/2BqvM76giFJZLw8Og6ZsVJATo=;
X-UUID: 71819bdf7ee948ec8b129ca3e6cb8b6b-20200815
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 180338782; Sat, 15 Aug 2020 09:28:08 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 15 Aug 2020 10:28:06 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 16 Aug 2020 01:28:01 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 16 Aug 2020 01:28:00 +0800
Message-ID: <1597512421.23246.74.camel@mhfsdcap03>
Subject: Re: [PATCH v3 1/2] WIP: ASoC: mediatek: mt6359: add codec driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>, <tzungbi@google.com>
Date: Sun, 16 Aug 2020 01:27:01 +0800
In-Reply-To: <20200814160115.GC4783@sirena.org.uk>
References: <1597401954-28388-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597401954-28388-2-git-send-email-jiaxin.yu@mediatek.com>
 <20200814160115.GC4783@sirena.org.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F4E5B18A5807A6EABCAC7321F18334F47F255F5F43AA401E0D7E4B88DE8CF31D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200815_132813_115805_508EAB78 
X-CRM114-Status: GOOD (  14.01  )
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
Cc: alsa-devel@alsa-project.org, shane.chien@mediatek.com,
 howie.huang@mediatek.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 eason.yen@mediatek.com, matthias.bgg@gmail.com, Bicycle.Tsai@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-08-14 at 17:01 +0100, Mark Brown wrote:
> On Fri, Aug 14, 2020 at 06:45:53PM +0800, Jiaxin Yu wrote:
> 
> This looks mostly good, a couple of very small things:
> 
> > +	ret = regulator_enable(priv->avdd_reg);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "%s(), failed to enable regulator!\n",
> > +			__func__);
> > +		return ret;
> > +	}
> 
> You need a remove() function to undo this enable.
> 

Ok, I will add a remove() function to do regulator_disable() and
snd_soc_unregister_component().

> > +	dev_info(&pdev->dev, "%s(), dev name %s\n",
> > +		 __func__, dev_name(&pdev->dev));
> 
> This isn't really adding anything, just remove it - it's not reading
> info from the hardware or anything.

Yes, it was unnecessary, removed it in PATCH v4.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
