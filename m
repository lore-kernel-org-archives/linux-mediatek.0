Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEFCC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 13:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qh2A1bMofLXY9EckQ9m0aUR4i/TbAWKFfPpRn/L/3ng=; b=QwZxIQsrVjxZ/T
	PVk/StcrcsWWphAYK2w+jQBC1XfSeP6ilTL6rtFb4+OGkQ1Ft1WyygSaWnuvmhowCn8lvshEMOq39
	d1R+x4IxW8/6vjJD5VA/gJm/682rwPGqW/6zLDcRUN59j4OXQ9F12i23MweTTYJciImPxrEqKq7fa
	lnpRq5vVYuKcRBqdcC+jdNj/4h6825pP2PH0G1Kteyi0zpd2GvptqlbKsR+a7FYpVQvNaAhfVQvxV
	50OHtqa7xxtunHC1TRVLoNUYqWCCEZ43dcDzcGHhjfbSPDBJXzO24YAVst/nvDJ+EHnh+8L/1FMFP
	vsdTlBxUvhtn6/UxXIsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrjr-00EVnI-Et; Wed, 23 Feb 2022 13:31:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrjd-00EVl6-VH; Wed, 23 Feb 2022 13:31:15 +0000
X-UUID: 1e84cdd9945946ca857ca33a5e6f7769-20220223
X-UUID: 1e84cdd9945946ca857ca33a5e6f7769-20220223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 252869411; Wed, 23 Feb 2022 06:31:05 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 05:21:03 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Feb 2022 21:21:01 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Feb 2022 21:21:01 +0800
Message-ID: <3a713726fe4a9b42c38ea398de935aa9b0ef50f8.camel@mediatek.com>
Subject: Re: [PATCH v2 00/23] Add driver nodes for MT8192 SoC
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, --to=Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, "Ryder
 Lee" <ryder.lee@kernel.org>
Date: Wed, 23 Feb 2022 21:21:01 +0800
In-Reply-To: <CAGXv+5EHLi0TpZaZq3rbOZeUjiFA_0t3QwZtjSLPZEe_zFO6XA@mail.gmail.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <CAGXv+5EHLi0TpZaZq3rbOZeUjiFA_0t3QwZtjSLPZEe_zFO6XA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_053114_048334_DA069BC5 
X-CRM114-Status: GOOD (  21.12  )
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

On Tue, 2022-02-22 at 11:21 +0800, Chen-Yu Tsai wrote:
> On Fri, Feb 18, 2022 at 5:16 PM Allen-KH Cheng
> <allen-kh.cheng@mediatek.com> wrote:
> > 
> > This series are based on tag: next-20220216, linux-next/master
> > and apply the below patchs
> > 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20220207094024.22674-1-allen-kh.cheng@mediatek.com/__;!!CTRNKA9wMg0ARbw!zMCLHB01ZObC6n6oHu5dE6SiAH_IkDBQhvydry6a_5p-mLTx841Cgy8VVZKPfXBIXpT76w$
> >  
> 
> It would make things easier if you incorporated the above patch into
> this
> series when you send v3.
> 
> ChenYu
> 

Hi ChenYu,

It's good to me. I will add this in v3. Thanks.

Allen
> > 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20220217135620.10559-1-allen-kh.cheng@mediatek.com/__;!!CTRNKA9wMg0ARbw!zMCLHB01ZObC6n6oHu5dE6SiAH_IkDBQhvydry6a_5p-mLTx841Cgy8VVZKPfXDBU4qenA$
> >  
> > 
> > There some patches are missed in PATCH v1.
> > I resend series again and also add display related nodes in PATCH
> > v2.
> > 
> > changes since v1:
> > - add usb-phy node for xhci node
> > - move infracfg_rst patch in front of PCIe patch
> > - add display nodes, i2c aliases and pwm node.
> > 
> > Allen-KH Cheng (23):
> >   arm64: dts: mt8192: Add power domains controller
> >   arm64: dts: mt8192: Add pwrap node
> >   arm64: dts: mt8192: Add spmi node
> >   arm64: dts: mt8192: Add gce node
> >   arm64: dts: mt8192: Add SCP node
> >   arm64: dts: mt8192: Add usb-phy node
> >   arm64: dts: mt8192: Add xhci node
> >   arm64: dts: mt8192: Add audio-related nodes
> >   arm64: dts: mt8192: Add infracfg_rst node
> >   arm64: dts: mt8192: Add PCIe node
> >   arm64: dts: mt8192: Correct nor_flash status of mt8192
> >   arm64: dts: mt8192: Add efuse node
> >   arm64: dts: mt8192: Add mmc device nodes
> >   arm64: dts: mt8192: Add mipi_tx node
> >   arm64: dts: mt8192: Add m4u and smi nodes
> >   arm64: dts: mt8192: Add H264 venc device node
> >   arm64: dts: mt8192: Add vcodec lat and core nodes
> >   arm64: dts: mt8192: Add dpi node
> >   arm64: dts: mt8192: Add i2c aliases
> >   arm64: dts: mt8192: Add display nodes
> >   arm64: dts: mt8192: Add dsi node
> >   arm64: dts: mt8192: Add gce info for display nodes
> >   arm64: dts: mt8192: Add pwm node
> > 
> >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 1000
> > +++++++++++++++++++++-
> >  1 file changed, 989 insertions(+), 11 deletions(-)
> > 
> > --
> > 2.18.0
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
