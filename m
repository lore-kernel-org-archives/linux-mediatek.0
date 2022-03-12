Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39088C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Mar 2022 13:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfdQnZRnGouXEduS5WFM9T19kJkO/viUizj36vS7pgU=; b=PHLV0WUyVcZ5Xg
	zDLpKp15ZGsK0oZ0Vy+/qe+vU/eIzfm8RYOryeJAfNcOZYmv+CZkxRGCubxX/v3inyp/vA2+49FFU
	EjgWXJmT6JjP0lUQcwZXikpkaHkjksMAjnsfht3KIfklWFRVmMDPFS60oJBj90az+g8EL35eabzkD
	sDkEcell+LkRralYqYAa+uU919JmTjnTVtB59fLd4zPjfvRhssPn7gR6ONF9yXTUYdFjIf0A+0s/v
	INB4jtk4FIlikyWhTifqnWhPWgHEkt4+PKXIji3vIKjAFzaPFCGXJpPkcClcN8QhXNFqtQK7Y0/4r
	xO1JcGphWv/aqerrtdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nT1tL-001NoU-HL; Sat, 12 Mar 2022 13:34:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nT1qh-001MjZ-8I; Sat, 12 Mar 2022 13:32:00 +0000
X-UUID: 67ce0bc273464142b27662ec9abd918d-20220312
X-UUID: 67ce0bc273464142b27662ec9abd918d-20220312
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1357530332; Sat, 12 Mar 2022 06:31:53 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Mar 2022 05:31:51 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 12 Mar 2022 21:31:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Mar 2022 21:31:43 +0800
Message-ID: <bb5737baf5c7430ccc40d7cfeaa1bc1a7c8890af.camel@mediatek.com>
Subject: Re: [PATCH 2/5] dt-bindings: mediatek: mt8195: add reset property
From: Trevor Wu <trevor.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <aaronyu@google.com>, <yc.hung@mediatek.com>
Date: Sat, 12 Mar 2022 21:31:43 +0800
In-Reply-To: <Yip3z3XoarN8TeMn@robh.at.kernel.org>
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
 <20220308072435.22460-3-trevor.wu@mediatek.com>
 <Yip3z3XoarN8TeMn@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220312_053159_316670_B5752206 
X-CRM114-Status: GOOD (  12.21  )
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

On Thu, 2022-03-10 at 16:12 -0600, Rob Herring wrote:
> On Tue, Mar 08, 2022 at 03:24:32PM +0800, Trevor Wu wrote:
> > Add required properties "resets" and "reset_names", which are used
> > to
> > specify audiosys hw reset for mt8195 afe driver.
> 
> The subject needs to be more specific and indicate this applies to
> ASoC 
> and mt8195-afe-pcm. Try to write subjects that could only ever
> appear 
> once as you can never make the same change twice.
> 
> Rob

Hi Rob,

Thanks for your suggestion.
I will revise the subject to "ASoC: dt-bindings: mediatek: mt8195-afe-
pcm: add reset property" in v2.

Thanks,
Trevor


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
