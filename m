Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903E5C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 11:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEHvQfqJm6C1sspF6HFF9mFj/EvdycMkuxy9cfu0n8o=; b=cSFI8SS22mdfhV
	FzIcn9BheW91pifjtE8k2yJnbKJsKDRQBPhexofTWSdz4JjZhOsj3DhcH2KBeuo70tZHNgtJGYC71
	zKWfSkbBUG9OudKwkxKe6/Qi7YNwX90YapPmWGX6u2mUhnLsV80kTzjcUTXI6pW7RrR/t4Ph8b4+/
	/xpc86Wdk3XiXe6/Hw8nbtK1aWp1xN5gcOB+sYCPiNiqPMNAwCDHLWyy1ilCp69MIarC6qBOIWJoj
	tJVNWk4uA6Kan8QCrjmZcZ7K9mptu/jL0HwDziqtSl61A+kF9S1kjd1mcJ2iIO735a4jqz+Q1VqD/
	6ZKvfsvQ/xHXB19VobEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noO9Z-001bsI-2a; Tue, 10 May 2022 11:35:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noO7d-001axw-Ac; Tue, 10 May 2022 11:33:49 +0000
X-UUID: 0621e5f106914ae68f59dae3ba9baf22-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:a2fc1ed3-794f-4e2d-b9ad-b6a12c96c1a6, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:1a1be816-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 0621e5f106914ae68f59dae3ba9baf22-20220510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 278684540; Tue, 10 May 2022 04:33:41 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 04:23:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 May 2022 19:23:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 10 May 2022 19:23:49 +0800
Message-ID: <0181c505dd94c599b270f159ca93442a4afe1760.camel@mediatek.com>
Subject: Re: [PATCH v2] cpufreq: mediatek: Fix potential deadlock problem in
 mtk_cpufreq_set_target
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, Jiabing Wan <wanjiabing@vivo.com>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Jia-Wei Chang
 <jia-wei.chang@mediatek.com>, Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>, 
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 10 May 2022 19:23:49 +0800
In-Reply-To: <20220510092822.j3z6bydurg7x5bu4@vireshk-i7>
References: <20220510090531.12438-1-wanjiabing@vivo.com>
 <20220510091212.olrvvjlx4jtm7zw2@vireshk-i7>
 <49566544-e8f2-ef38-288e-fcd276d87d3b@vivo.com>
 <20220510092822.j3z6bydurg7x5bu4@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_043345_474762_994FE5C9 
X-CRM114-Status: GOOD (  18.16  )
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

On Tue, 2022-05-10 at 14:58 +0530, Viresh Kumar wrote:
> On 10-05-22, 17:23, Jiabing Wan wrote:
> > 
> > 
> > On 2022/5/10 17:12, Viresh Kumar wrote:
> > > On 10-05-22, 17:05, Wan Jiabing wrote:
> > > > Fix following coccichek error:
> > > > ./drivers/cpufreq/mediatek-cpufreq.c:199:2-8: preceding lock on
> > > > line
> > > > ./drivers/cpufreq/mediatek-cpufreq.c:208:2-8: preceding lock on
> > > > line
> > > > 
> > > > mutex_lock is acquired but not released before return.
> > > > Use 'goto out' to help releasing the mutex_lock.
> > > > 
> > > > Fixes: c210063b40ac ("cpufreq: mediatek: Add opp notification
> > > > support")
> > > > Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> > > 
> > > You should have added the review tag you received.
> > > 
> > > Applied. Thanks.
> > 
> > Oh, yes.  I would add the "Reviewed-by:" tag only if someone sends
> > this tag to me.
> 
> Didn't you get this ?
> 
> 
https://lore.kernel.org/linux-mediatek/304e7eefbb57e9c938737b64fbb515201c7944b8.camel@mediatek.com/
> 
> Rex, are you subscribed to LKML ? You can't send an email there
> without
> subscription. I don't see this email on LKML lore.
> 

Hello Viresh,

I am not sure what's the problem.
But I subscribed the linux-arm-kernel mailing list and linux-mediatek.

As for LKML, do you mean subscribe "List: linux-kernel;" in [1]?

[1]: http://vger.kernel.org/vger-lists.html

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
