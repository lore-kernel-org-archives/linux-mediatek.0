Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E8AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 09:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EjwHwcIRcK4Q//J7qABKeB0iEmthjgaoyKIo4sTOGeE=; b=ZsRBZDGuoqGegt
	1Zo7dfociI8PbPK0EtjolAgEppK1I6pgOfIb061+cXbL22TtxeamWamRzkl8t8ZUWmBKPG9Sbke15
	ZEKyAnJ5E0nLZ7Upf452Awvapa320l5zNEKRcUnEjFt7Hxx3ggUgS3jqLY7zY62AGXDcCSPZxn9Rz
	TsHNcYr09rhiXPy8y0L/sWUAnH6H1WSnLKzBFnBDwfhBjHaKbAAbaO6RSTtzl/1LOILDH34CiMaCH
	JAMHuFtUhU0aqffFEvDo6eXHPhUtbb6S7MMKn1bD3JrfvirxG7Un34hA8NrL2puXvl8rKrwvRej0f
	4Wd9nFeC7H7eteEQvhJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMRNE-008j6e-OL; Tue, 22 Feb 2022 09:22:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMRNA-008j4c-QD; Tue, 22 Feb 2022 09:22:19 +0000
X-UUID: 6d395bda3fb042d98cfbc0643ebf452b-20220222
X-UUID: 6d395bda3fb042d98cfbc0643ebf452b-20220222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 983558847; Tue, 22 Feb 2022 02:22:09 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Feb 2022 01:18:06 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Feb 2022 17:18:05 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Feb 2022 17:18:05 +0800
Message-ID: <2d53a11e31a9b521fd18d78aafe42b94bfa74aec.camel@mediatek.com>
Subject: Re: [PATCH v9 2/3] dt-bindings: pinctrl: mt8195: Add
 mediatek,drive-strength-adv property
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, David Matlack
 <dmatlack@google.com>, Jing Zhang <jingzhangos@google.com>, Marc Zyngier
 <maz@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "Sean
 Wang" <sean.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>, <chunfeng.yun@mediatek.com>
Date: Tue, 22 Feb 2022 17:18:05 +0800
In-Reply-To: <CACRpkdZ194_7+mHauDPwMHG3TeGnp2ENdcSDjZnWny1X4YTT7w@mail.gmail.com>
References: <20220112114724.1953-1-tinghan.shen@mediatek.com>
 <20220112114724.1953-3-tinghan.shen@mediatek.com>
 <18f7a647-6153-6d38-dff1-727b9592b01e@gmail.com>
 <102ea6303dd16fdf9ec931d0a1845a93afe92545.camel@mediatek.com>
 <CACRpkdZ194_7+mHauDPwMHG3TeGnp2ENdcSDjZnWny1X4YTT7w@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_012216_868173_3E2757A9 
X-CRM114-Status: GOOD (  15.15  )
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

On Sun, 2022-01-30 at 01:38 +0100, Linus Walleij wrote:
> On Tue, Jan 25, 2022 at 7:21 AM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
> 
> > I want to send next version to update the CC list of this series, but I'm not sure
> > whether this will break the conversation between you and Linus.
> > 
> > Is it ok to send next version? or waiting the response?
> 
> Send a new version, I'll apply the v10 version!
> 
> Yours,
> Linus Walleij

Hi Linus,

The new version is available.


https://patchwork.kernel.org/project/linux-mediatek/patch/20220216113131.13145-3-tinghan.shen@mediatek.com/

v11 is rebased on 5.17-rc4 and it's the same as v10.


Best regards,
Tinghan
 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
