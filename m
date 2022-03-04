Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF5DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 05:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwkwYKR7ETTaJtDoIBDJwRkxYv+iWH2RrMkzN51iaQM=; b=Rh9lroafOPy5xn
	FjLlN70yyY+yM/VTeak6tB9WQAcvpxrHvg+/GrcfKokprZvt/0RPoW3NVXdAdn6CLpbUlqfB4jsek
	AfmkuHT5UiZ4Jtw7ZNcRm6LHgTSDUnqxQLsmQcM89qq6xte1jV/RMG4pZSWcGvO/ZXKBgPfjvC0FL
	ednFEbnQm45o6hsKvLbUawT1L4iI0zf/K35zlA2g8eB8EdUeNMfEa2vdqAKUzQqkKUmKXMdY1SBNg
	wcf6czNnYS0Qd3Yo2ZxeEqZwIfaWV05SAnYYSBFywIV5P/maLfRRwDqQ9tKzy0DM89YJxA2NFAdPZ
	L3WvmLRXEPMo1qspPXvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ0cf-008Y4Q-I3; Fri, 04 Mar 2022 05:37:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ0ca-008Y3Q-RA; Fri, 04 Mar 2022 05:36:59 +0000
X-UUID: 484ca2663cde4d22b9b1ed12bb0a6483-20220303
X-UUID: 484ca2663cde4d22b9b1ed12bb0a6483-20220303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1693054198; Thu, 03 Mar 2022 22:36:49 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Mar 2022 21:26:48 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 13:26:47 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Mar 2022 13:26:46 +0800
Message-ID: <c19b14ab9a8879fc50d8bcc87745da48491be373.camel@mediatek.com>
Subject: Re: [PATCH v15 00/12] Add Mediatek Soc DRM (vdosys0) support for
 mt8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 <singo.chang@mediatek.com>, Fabien Parent <fparent@baylibre.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, roy-cw.yeh <roy-cw.yeh@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, <devicetree@vger.kernel.org>, Moudy Ho
 <moudy.ho@mediatek.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 <nancy.lin@mediatek.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Date: Fri, 4 Mar 2022 13:26:46 +0800
In-Reply-To: <28098efc-1de1-b540-b1a3-bf7a92af9511@collabora.com>
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
 <CAL_Jsq+6k5EqouAO2Xm=GpBz3Pi-wfB-ixGwfyC+Y+qOrjUFTg@mail.gmail.com>
 <c103927d7dbc3217431c83dc22a44c656c561228.camel@mediatek.com>
 <28098efc-1de1-b540-b1a3-bf7a92af9511@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_213656_951186_EBC626FD 
X-CRM114-Status: GOOD (  24.06  )
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

Hi Angelo,

Because linux-next has applied these patches:

[v15,04/12] dt-bindings: display: mediatek: dsc: add yaml for mt8195
SoC binding
[v15,05/12] dt-bindings: display: mediatek: merge: add additional prop
for mt8195
[v15,06/12] dt-bindings: display: mediatek: add mt8195 SoC binding for
vdosys0
[v15,03/12] dt-bindings: display: mediatek: disp: split each block to
individual yaml


I'll rebase on the latest linux-next, and then send 1 path + 1 series:
[1] a fix up patch for all dt-schema error in each display dt-bindings
(If Rob wants me to split this patch into separate patches for each
file, then I'll resend it.)
[2] a series of remaining patches of this series


I would appreciate it if you would take the time to send [1] for me.
If you can help me to send [1], please let me know.
Thank you very much ;-) 


Regards,
Jason-JH.Lin

On Thu, 2022-03-03 at 10:31 +0100, AngeloGioacchino Del Regno wrote:
> Il 03/03/22 05:25, Jason-JH Lin ha scritto:
> > Hi Rob,
> > 
> > Thanks for the reviews.
> > 
> > On Wed, 2022-03-02 at 17:50 -0600, Rob Herring wrote:
> > > On Wed, Jan 26, 2022 at 1:19 AM jason-jh.lin <
> > > jason-jh.lin@mediatek.com> wrote:
> > > > 
> > 
> > [snip]
> > 
> 
> Hello Rob, Jason-JH,
> 
> I have just crafted a patch that fixes everything mentioned here,
> if it's easier like this, I can either send it for the maintainer(s)
> to apply on top, or squash in Jason-JH's original patch.
> 
> If you'd like to get my patch, though, I have one question:
> this is touching literally all of the YAML files that Jason-JH is
> introducing, so, should I send this as one patch per file (which
> would be
> something around 16 patches) or is just one fixing them all fine?
> 
> Cheers,
> Angelo
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!3tXE3T-t6I2GMILAOHpkTXhrLHwFAQtmhGqTBtKSY2SLWM2qBBMULlM17TtG6VwNR5yn$
>  
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
