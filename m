Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C526EC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Feb 2022 07:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gv2E4k4jnfT//nvcC8p+sxyjqBgAr7+aO1Uvm2tjvsU=; b=D8SmGdNtqq7rG1
	9LWmxCSGEhIQtUezW1FU+rAq8tbevs/A6M0awENMWXJ4hqLNMGIvGWiVii0drfDUNBYqGBMhIysvB
	ZnkZXOzIhIlEsrp/JqazEaoSiA4dOhpg/B+Z5+8l+MijEMBKSc8p7dFZCnUvByYUpTyELdaoaKxyS
	b0w9as9mpBN5ez/yKMUTqEMdUNdTAkN5OGRZ2z2huttbGj6yo7Zq9NTG+0ggbRcQ2td0MvXVhEDex
	Qjwg2qztAfwS0o7zzKR/SKauVdUSO1DoZURueIyjKQLHtibhDHfojMWDNemfcmVar3zu/z0IpkBLf
	N7BHy2kFR+xIaQsESHWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nImgH-009XWk-8v; Sat, 12 Feb 2022 07:18:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nImg9-009XW7-2a; Sat, 12 Feb 2022 07:18:50 +0000
X-UUID: 4d25daad191b440aa273fafb86fa03e5-20220212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tsGCWjf1wzWY4q3HvFAliCfBaWVtjHRUuXB7wBPd/yk=; 
 b=M3eAbx7Hshef11clTiy8Jn+WcbwFMz6AwTHhgJu40+0FCYuKSXwRu5nKuEiRb2EAQZwYgpJuCZWYFzfXDSb3NltT0g0glykaDfZ+VpQi8HK1pQ85ek6YnMdtqhH+Ha9Qfo1FyvbT4o+XgbbRzMsLsPFiW40+EbOG1j27RuNhBR0=;
X-UUID: 4d25daad191b440aa273fafb86fa03e5-20220212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1466552158; Sat, 12 Feb 2022 00:18:36 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Feb 2022 23:18:35 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 12 Feb 2022 15:18:21 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Feb 2022 15:18:20 +0800
Message-ID: <a78063ad99eb8f4a380d9133f310963d2a0dac7a.camel@mediatek.com>
Subject: Re: [PATCH 00/15] ASoC: mediatek: Add support for MT8186 SoC
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <perex@perex.cz>, <p.zabel@pengutronix.de>,
 <geert+renesas@glider.be>, <trevor.wu@mediatek.com>, <tzungbi@google.com>,
 <zhangqilong3@huawei.com>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Sat, 12 Feb 2022 15:18:20 +0800
In-Reply-To: <YgaLUNQXnGsZHuXQ@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <YgaLUNQXnGsZHuXQ@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_231846_528087_56D55009 
X-CRM114-Status: GOOD (  13.45  )
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

On Fri, 2022-02-11 at 16:14 +0000, Mark Brown wrote:
> On Fri, Feb 11, 2022 at 06:38:03PM +0800, Jiaxin Yu wrote:
> > This series of patches adds support for Mediatek AFE of MT8186 Soc.
> > Patches are based on broonie tree "for-next" branch.
> 
> This all looks basically good, there are some issues which I've
> highlighted on the patches but like I kept on saying they're all
> fairly
> small and hopefully easy to address - there's no big structural
> problems
> or anything that I noticed.

Thank you for helping to review my submitted patches.
I will go through your comments carefully and fix them.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
