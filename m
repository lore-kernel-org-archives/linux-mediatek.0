Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A20DC00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Aug 2022 13:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9CRG8RodOdNa8sKrD7vJYhPkQF90ZulAoME56gZSvc=; b=gSPG6DgcbwdPSjyX694dS9jQf/
	Qg56+is/ygeH/m1RsJQ63CRKwdBs0J7vExtLrrUqKLTcNDeUO8ljR7V9uPKCxjNki+Zf8EGci9+yk
	S3FCSFnqi24oyeeMbO79H+xRXOByeYspUwTcchollA0sGgTD3XWzUoGFQPPk2rw97F7SvAIFxa9Y4
	v21rnYXeYmstV6ED7XKW7FxkSJB/Zsw68ARWmY06SLFnlS0DwwHmFEkEWBqDV2kC1EqNxs+F3cDh3
	JFQbberx0bs8NLnAOC9PKHFyGK93+vGhzu7J/dW8ILRbjfqkeJzz2+v/ISVgNBPOHOpXGQN9eVmi7
	OhmYkPxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLlvT-00C58a-Ua; Wed, 10 Aug 2022 13:39:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLlvN-00C54E-OL; Wed, 10 Aug 2022 13:39:08 +0000
X-UUID: a2152f7d3ca54034a49d06656fd64b8a-20220810
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:52512461-677d-4f21-848d-36f0b1e1d47e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:f696effc-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a2152f7d3ca54034a49d06656fd64b8a-20220810
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1439663640; Wed, 10 Aug 2022 06:38:53 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 10 Aug 2022 20:58:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 10 Aug 2022 20:58:15 +0800
Message-ID: <6271732eb27824c5b841760243738ceb062f4c4a.camel@mediatek.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: mediatek: watchdog: Fix compatible
 fallbacks and example
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai
	<wenst@chromium.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, "Guenter
 Roeck" <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 10 Aug 2022 20:58:15 +0800
In-Reply-To: <20220808170355.c2ih3xwqxlddsal7@notapiano>
References: <20220721014845.19044-1-allen-kh.cheng@mediatek.com>
	 <20220721014845.19044-2-allen-kh.cheng@mediatek.com>
	 <CAGXv+5HXwVpaJPV-4Z6qw14xZzEkx_E7dVks6-GBa7bQyN8hCg@mail.gmail.com>
	 <5dac39d1-3b42-40e9-5693-0c127e8c689a@gmail.com>
	 <0fadcd9f50d49ecbb329e76a9ceb6ee689648955.camel@mediatek.com>
	 <20220808170355.c2ih3xwqxlddsal7@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_063906_392750_29517087 
X-CRM114-Status: GOOD (  61.95  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Nícolas,

On Mon, 2022-08-08 at 13:03 -0400, Nícolas F. R. A. Prado wrote:
> Hi,
> 
> On Wed, Aug 03, 2022 at 05:23:57PM +0800, Allen-KH Cheng wrote:
> > Hi Chen-Yu and Mathias,
> > 
> > Sincere apologies for the delayed response.
> > 
> > On Tue, 2022-08-02 at 13:04 +0200, Matthias Brugger wrote:
> > > 
> > > On 01/08/2022 11:29, Chen-Yu Tsai wrote:
> > > > On Thu, Jul 21, 2022 at 10:50 AM Allen-KH Cheng
> > > > <allen-kh.cheng@mediatek.com> wrote:
> > > > > 
> > > > > The watchdog timer of mt8186. mt8195 and mt7986 have their DT
> > > > > data.
> > > > > We should not use 'mediatek,mt6589-wdt' as fallback.
> > > > > 
> > > > > For mediatek,wdt example of mt8183, We remove
> > > > > mediatek,mt6589-wdt 
> > > > > fallback.
> > > > 
> > > > I think this needs some more information.
> > > > 
> > > > Right now on the kernel side, mt6589-wdt provides just watchdog
> > > > support.
> > > > The SoC-specific compatibles that are touched by this patch
> > > > provide
> > > > reset
> > > > controls in addition to the standard watchdog, which remains
> > > > the
> > > > same.
> > > > 
> > > > If that is the case, then the fallback compatibles are correct.
> > > > A
> > > > fallback
> > > > says that the new hardware is compatible with some older
> > > > hardware,
> > > > and
> > > > can be run with the driver supporting that older hardware,
> > > > likely
> > > > with
> > > > reduced functionality.
> > > > 
> > > 
> > > My understanding is, that we add a fallback because although at
> > > the
> > > time we 
> > > entered the compatible, the functionality of the device is the
> > > same
> > > as the 
> > > fallback. Nonetheless we add a compatible specific for the device
> > > in
> > > case in the 
> > > future we realize that the device has some functionality that is
> > > not
> > > and can not 
> > > be covered by the fallback.
> > > 
> > > This is the case here. Actually adding the fallback in the first
> > > place was 
> > > wrong, because the driver since ever supports the extra function
> > > for
> > > the device, 
> > > the reset.
> > > 
> > > So this is a mere cleanup of the binding to reflect what was
> > > always
> > > present in 
> > > the driver.
> > > 
> > > Regards,
> > > Matthias
> > > 
> > 
> > mt6589-wdt dosen't contains a reset control for other modules, like
> > chen-yu mention "mt6589-wdt provides just watchdog support."
> > 
> > For instance, there is a reset control in mt8195-wdt and we have a
> > DT
> > data to define its reset number of TOPRGU. I thought it's better
> > not
> > use mt6589-wdt as fallback.
> > 
> > Please let me know if this works and if you have any suggestions or
> > comments.
> 
> The only practical usecase that I can think of that relies on keeping
> the
> fallback compatibles is using the current DT with an older kernel
> that didn't
> yet support the specific watchdog compatibles. In this case, dropping
> the
> fallback compatibles would make the watchdog not work at all in such
> a kernel.
> 
> I'm not sure how relevant/common of a usecase that would be, but
> maybe it's
> worth considering given that the advantage of removing the fallback
> compatible
> is purely aesthetic?
> 
> Thanks,
> Nícolas
> 

Thanks for your comments.

I agree the advantage of patch is aesthetic. Since I also want to send
another "watchdog: Convert binding to YAML" PATCH, it's better let all
wdt compatibles in the binding match the contents of mtk_wdt_dt_ids in
drivers/watchdog/mtk_wdt.c

static const struct of_device_id mtk_wdt_dt_ids[] = {
	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
	{ .compatible = "mediatek,mt6589-wdt" },
	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
	{ .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
	{ /* sentinel */ }
};

We have "mediatek,mt8186-wdt" "mediatek,mt8195-wdt" and
"mediatek,mt7986-wdt" now and they have their DT data for the reset
control.

It's weird and unuseful to add "mediatek,mt6589-wdt" as fallback. 


Please kindly let me know if I missed anything

BRs,
Allen

> > 
> > Thanks,
> > Allen
> > 
> > > > As an example, if mt8195-wdt is backward compatible with
> > > > mt6589-
> > > > wdt,
> > > > then it should run as mt6589-wdt, and would just be missing new
> > > > functionality, in this case the reset controls.
> > > > 
> > > > So either mt6589-wdt also contains a reset control that is not
> > > > the
> > > > same
> > > > as the other newer chips, or has some other functionality that
> > > > the
> > > > other
> > > > chips contain, and justifies the removal of the fallback, or
> > > > this
> > > > patch
> > > > is incorrect. Note that mt2701-wdt and mt762*-wdt are still
> > > > listed
> > > > as
> > > > compatible with mt6589-wdt. So I think a better explanation is
> > > > required.
> > > > 
> > > > 
> > > > Regards
> > > > ChenYu
> > > > 
> > > > 
> > > > > Fixes:a45b408a020b("dt-bindings: watchdog: Add compatible for
> > > > > MediaTek MT8186")
> > > > > Fixes:b326f2c85f3d("dt-bindings: watchdog: Add compatible for
> > > > > Mediatek MT8195")
> > > > > Fixes:41e73feb1024("dt-bindings: watchdog: Add compatible for
> > > > > Mediatek MT7986")
> > > > > Fixes:f43f97a0fc0e("dt-bindings: mediatek: mt8183: Add
> > > > > #reset-
> > > > > cells")
> > > > > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > > > > Reviewed-by: AngeloGioacchino Del Regno <
> > > > > angelogioacchino.delregno@collabora.com>
> > > > > ---
> > > > >   Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 9
> > > > > ++++-----
> > > > >   1 file changed, 4 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/watchdog/mtk-
> > > > > wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-
> > > > > wdt.txt
> > > > > index 762c62e428ef..67ef991ec4cf 100644
> > > > > --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > > > > +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > > > > @@ -14,12 +14,12 @@ Required properties:
> > > > >          "mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for
> > > > > MT7622
> > > > >          "mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for
> > > > > MT7623
> > > > >          "mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for
> > > > > MT7629
> > > > > -       "mediatek,mt7986-wdt", "mediatek,mt6589-wdt": for
> > > > > MT7986
> > > > > +       "mediatek,mt7986-wdt": for MT7986
> > > > >          "mediatek,mt8183-wdt": for MT8183
> > > > > -       "mediatek,mt8186-wdt", "mediatek,mt6589-wdt": for
> > > > > MT8186
> > > > > +       "mediatek,mt8186-wdt": for MT8186
> > > > >          "mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for
> > > > > MT8516
> > > > >          "mediatek,mt8192-wdt": for MT8192
> > > > > -       "mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for
> > > > > MT8195
> > > > > +       "mediatek,mt8195-wdt": for MT8195
> > > > > 
> > > > >   - reg : Specifies base physical address and size of the
> > > > > registers.
> > > > > 
> > > > > @@ -32,8 +32,7 @@ Optional properties:
> > > > >   Example:
> > > > > 
> > > > >   watchdog: watchdog@10007000 {
> > > > > -       compatible = "mediatek,mt8183-wdt",
> > > > > -                    "mediatek,mt6589-wdt";
> > > > > +       compatible = "mediatek,mt8183-wdt";
> > > > >          mediatek,disable-extrst;
> > > > >          reg = <0 0x10007000 0 0x100>;
> > > > >          interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>;
> > > > > --
> > > > > 2.18.0
> > > > > 
> > > > > 
> > 
> > 


