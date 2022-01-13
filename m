Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38704C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 02:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RqzW369onNiRlOyPhgYp38cBgscWOzn4cW20YBBxM7w=; b=aT0xhEdAEHj4dx
	kjBm8vH+VRuQs0dTc2OFpY4hJVTb7fHXciZ3sNmM+5K/ygNaCd4HXxs4G+nN0J9U5W4nNLNGouzBK
	Y9P+90PQ3NQZfZhYjnYz6sOE+BFQY82TzSmI9q1J5nnRUQKWdmeZqD8OgNTY21n7CrO0IfbFqG+FL
	hqMbjI0PZGTNrB95xDUfEBKL+CthZXaxnS+vvkOOgWdWhbwl08Ra29m1PvYGzaMNc2tReyu/5bjTp
	gzuA/VLmj8AYVJBeFtHKMGhR8GXSHt7m1Ju+10Pu5lmHKkLAUpWeStY1avgD1ogmkSNdiyXeioI6r
	H6ImZVs1CRMfE1K/JWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7pk4-004HBL-9a; Thu, 13 Jan 2022 02:21:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7pjz-004HAh-7c; Thu, 13 Jan 2022 02:21:30 +0000
X-UUID: ca25d9ff6c364ebfba0d496eda28f813-20220112
X-UUID: ca25d9ff6c364ebfba0d496eda28f813-20220112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 302584258; Wed, 12 Jan 2022 19:21:22 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 18:17:23 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 10:17:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Jan 2022 10:17:21 +0800
Message-ID: <903a27d5d68dddb23b9ace2708689a55f22714e8.camel@mediatek.com>
Subject: Re: [PATCH v9 0/3] Add basic SoC support for mediatek mt8195
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>, <chunfeng.yun@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, "David
 Matlack" <dmatlack@google.com>, Jing Zhang <jingzhangos@google.com>, "Marc
 Zyngier" <maz@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>
Date: Thu, 13 Jan 2022 10:17:21 +0800
In-Reply-To: <e4f20498-3685-207f-2b94-0cb0ada725a4@oracle.com>
References: <20220112114724.1953-1-tinghan.shen@mediatek.com>
 <e4f20498-3685-207f-2b94-0cb0ada725a4@oracle.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_182127_309851_A7093223 
X-CRM114-Status: GOOD (  12.42  )
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

Hi Maciej,

On Wed, 2022-01-12 at 15:54 +0100, Maciej S. Szmigiero wrote:
> On 12.01.2022 12:47, Tinghan Shen wrote:
> > This series adds basic SoC support for Mediatek's SoC MT8195.
> 
> Nice patchset Tinghan, however I can't stop wondering why I was CCed
> on
> it (and Paolo and Sean, too) - this isn't KVM related at all.
> 
> scripts/get_maintainer.pl going wild?
> 
Thanks,
Maciej

I'm sorry. I just find out that the file pattern I used includes
unrelated files to this series.

I'll clean up the CC list at next version.

Best regards,
TingHan


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
