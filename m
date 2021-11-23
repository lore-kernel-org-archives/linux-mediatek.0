Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2519C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 03:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rev0yMHhuEFigW7Ku3HVBSp/adSOFk6/q2DC5+64qWA=; b=kZa/inFrvd+hAz
	wGr/ONJHTDWjlJLNHzBx10HkNpSO0+Z0IiYaI/Sa2E5VugwnK39BpERNrqVnajzRDfHPHO291K4Hq
	Y/vczU0s44Wa1eR07Sl0DesMcHF0Ge1Aj6eEytTsEKkWEYq/tOi2MpiK2fFjKZtTt9dIlapQBrsPW
	l1/n8PHjvzPWYCyvPLhR7m1PIUKzQsJLAdCuTcDhtixgZ9glj6sKk4j3vThngYj1GZLUxRvo9rp4b
	LC0Ji4E2JMl/2s2QbJNrI4ZpZr92OY9zZC+K+pgHS/WmtdO9NO5JZtQQ3Gnxdo5gfbo2UTNchMxkM
	ew/YdMoqVonUc/UZtKYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpMP1-000iyn-46; Tue, 23 Nov 2021 03:23:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpMOo-000iwz-HR; Tue, 23 Nov 2021 03:23:15 +0000
X-UUID: 404978232dfa4b3eb6df05290fca0569-20211122
X-UUID: 404978232dfa4b3eb6df05290fca0569-20211122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1734952031; Mon, 22 Nov 2021 20:23:08 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Nov 2021 19:13:06 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 23 Nov 2021 11:12:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Nov 2021 11:12:58 +0800
Message-ID: <a42fb446e7afa3c7838d95bd3aded5e872354bc8.camel@mediatek.com>
Subject: Re: [PATCH v8 5/7] dt-binding: mt8183: add Mediatek MDP3 dt-bindings
From: moudy ho <moudy.ho@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Jernej
 Skrabec" <jernej.skrabec@siol.net>, Maoguang Meng
 <maoguang.meng@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <tfiga@chromium.org>, <drinkcat@chromium.org>, <acourbot@chromium.org>,
 <pihsun@chromium.org>, <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <randy.wu@mediatek.com>,
 <srv_heupstream@mediatek.com>, <hsinyi@google.com>, jason-jh.lin
 <jason-jh.lin@mediatek.com>
Date: Tue, 23 Nov 2021 11:12:58 +0800
In-Reply-To: <YWrfUo73+UegMKYP@robh.at.kernel.org>
References: <20211015123832.17914-1-moudy.ho@mediatek.com>
 <20211015123832.17914-6-moudy.ho@mediatek.com>
 <YWrfUo73+UegMKYP@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_192314_595942_18077BCA 
X-CRM114-Status: GOOD (  16.80  )
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

On Sat, 2021-10-16 at 09:18 -0500, Rob Herring wrote:
> On Fri, Oct 15, 2021 at 08:38:30PM +0800, Moudy Ho wrote:
> > This patch adds DT binding document for Media Data Path 3 (MDP3)
> > a unit in multimedia system used for scaling and color format
> > convert.
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > ---
> >  .../bindings/arm/mediatek/mediatek,ccorr.yaml |  59 +++++
> >  .../bindings/arm/mediatek/mediatek,rdma.yaml  | 211
> > ++++++++++++++++++
> >  .../bindings/arm/mediatek/mediatek,wdma.yaml  |  70 ++++++
> 
> These belong in a functional directory, not 'arm'.
> 

Hi Matthias,

We tried to integrate the common components of DRM & MDP3 into the same
binding files and move them to the "bindings/arm/mediatek" directory,
but it did not meet the requirements.
Is it appropriate for us to change the path to "bindings/soc/mediatek",
or do you have other suggestions?

Thanks & Regards,
Moudy Ho

> >  .../bindings/media/mediatek,mdp3-rsz.yaml     |  68 ++++++
> >  .../bindings/media/mediatek,mdp3-wrot.yaml    |  70 ++++++
> >  5 files changed, 478 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/arm/mediatek/mediatek,rdma.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml

(snip)

> 
> Fix this.
> 
> Similar comments on the rest...
> 
> Rob
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
