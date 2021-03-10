Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3388AC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 09:04:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 943FE64F2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 09:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 943FE64F2D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Uv+XkugVjj0q6/CiEhA4e2uLTHhpwn/50i7gpr7Euuw=; b=jWCXhXZgEe4J9QojC1z2nms1u
	NiBdmZh5s2CANQ9cp0s7pd8RnkR1u8OGeNYXQV1HwF1TmNpZ7Qkh2xGCWDEXY3+nzxQAufISqMRvl
	n4U6uOH1nRl5q8exf1ckYiFM6G6/Dsjv5cw+S+7bCmodgY8Dm4XmuECoN2Vf3WcaV6N9B3ZCic9Wc
	31fn9cN9wficgOEEmeDNmJJzTnYbHTNPYoutqA7QZPOU7/BVxvTnNDjyQ7Zq9uF1iA5uv7tAs93P8
	KfZpagBgM7KCz0RZc0L8WTt9F7AjYEwoGKE4pvPsiXPrR9kJOrH2gIfMpPEo6OgBS0mExdJ5c8YTS
	yjPHSnlEA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJulb-006OZD-6s; Wed, 10 Mar 2021 09:04:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJulT-006OXX-Vb
 for linux-mediatek@lists.infradead.org; Wed, 10 Mar 2021 09:04:29 +0000
X-UUID: 9de2fb2e02874fb18ea8450fa10f1e5e-20210310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SdbKNEFQj6KE5ljqlY4DgijhePB6jeycIgwGj26hkrs=; 
 b=OSypZczU+tVQt1VjGZtF8rB8AFyU2t1M2SSJcQDC/huBrk1njRnSQNXl762m2zu3yS9jgExy49Tvf6h+WmYQWsyqc2SNb6paCpR6FoWsS8x181ISwTZ4sdxM63RGbCGKo27DRIrt6aW13yB2RNPt+SSMvU7Ru4IsRRl6eAs0xJ4=;
X-UUID: 9de2fb2e02874fb18ea8450fa10f1e5e-20210310
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1987712512; Wed, 10 Mar 2021 01:04:13 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 00:54:53 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 16:54:50 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 10 Mar 2021 16:54:50 +0800
Message-ID: <1615366490.10387.0.camel@mtkswgap22>
Subject: Re: [kbuild] Re: [PATCH v2 1/2] mt76: mt7915: add missing
 capabilities for DBDC
From: Ryder Lee <ryder.lee@mediatek.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: <kbuild@lists.01.org>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, <lkp@intel.com>, <kbuild-all@lists.01.org>,
 Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Date: Wed, 10 Mar 2021 16:54:50 +0800
In-Reply-To: <20210310083018.GH21246@kadam>
References: <20210310083018.GH21246@kadam>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 52A78F482FCA1BF0DDF7F8DA1A1595CE86E8C0FD9664E8A8406C51CE7AFA5D132000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_090425_469984_FFF523BD 
X-CRM114-Status: UNSURE (   9.73  )
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

On Wed, 2021-03-10 at 11:30 +0300, Dan Carpenter wrote:
> Hi Ryder,
> 
> url:    https://github.com/0day-ci/linux/commits/Ryder-Lee/mt76-mt7915-add-missing-capabilities-for-DBDC/20210225-230323 
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next.git  master
> config: x86_64-randconfig-m001-20210309 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> drivers/net/wireless/mediatek/mt76/mt7915/init.c:353 mt7915_set_stream_vht_txbf_caps() error: potentially dereferencing uninitialized 'cap'.
> 
> vim +/cap +353 drivers/net/wireless/mediatek/mt76/mt7915/init.c
> 
> 00b2e16e006390 Ryder Lee 2020-05-12  344  void mt7915_set_stream_vht_txbf_caps(struct mt7915_phy *phy)
> 00b2e16e006390 Ryder Lee 2020-05-12  345  {
> 50a6fe79623e22 Ryder Lee 2021-02-25  346  	int nss;
> 50a6fe79623e22 Ryder Lee 2021-02-25  347  	u32 *cap;
> 50a6fe79623e22 Ryder Lee 2021-02-25  348  
> 50a6fe79623e22 Ryder Lee 2021-02-25  349  	if (!phy->mt76->cap.has_5ghz)
> 50a6fe79623e22 Ryder Lee 2021-02-25  350  		return;
> 50a6fe79623e22 Ryder Lee 2021-02-25  351  
> 50a6fe79623e22 Ryder Lee 2021-02-25  352  	nss = hweight8(phy->mt76->chainmask);
> 50a6fe79623e22 Ryder Lee 2021-02-25 @353  	*cap = &phy->mt76->sband_5g.sband.vht_cap.cap;
>                                                 ^^^^
> "cap" isn't initialized.

This has been fixed in v3
https://patchwork.kernel.org/project/linux-mediatek/patch/427ab5a2a79b8bbfa05225cfe4cfb55b3f143c8c.1614357346.git.ryder.lee@mediatek.com/

Ryder

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
