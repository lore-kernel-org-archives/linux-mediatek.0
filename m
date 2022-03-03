Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B55CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 04:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kiq2N+b5Oxx9SdwCWC6LOeaBpLlNDzU7QNpH2KmQftM=; b=a6BhaUVsBnGWf0
	v7EnV7fOw3nPt7kYC5WdX16+yNZ4izznNNeICYfrbMoFKazsUqqsMWd+OiiUV0CgUTc5zao8DvWRI
	b4EqV6D+ISPJL1CoAt8ztEEbA+21kYi8a1BuurvVqWOx1sdnWVTqL53MzYqnE0TjxT/szr+awfFF0
	ZsRwC5r8Dk09s8Dpb3+V5k7TwV8egi1ooVkhVKEpoogP5zFRFR6o6qd/Sp/Ig1n7ddZkvh3yMrwTc
	t9NLxNcn8SpptI1A6eY7nH+K2PFaOdKFi5Z2OcJshQBTAW6QZ8uJ0shgf/VWWjqPRtM2mLPg6TWDB
	3LTyC/qlkpj+MCFBK0jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPd89-005BhU-GI; Thu, 03 Mar 2022 04:31:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPd7x-005Bfk-RM; Thu, 03 Mar 2022 04:31:47 +0000
X-UUID: 4710dd30364149c9b738cd14849d9bae-20220302
X-UUID: 4710dd30364149c9b738cd14849d9bae-20220302
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2092508965; Wed, 02 Mar 2022 21:31:41 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Mar 2022 20:31:39 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Mar 2022 12:31:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Mar 2022 12:31:31 +0800
Message-ID: <469ca28d06f8ced11b3853c0bc39b0f9eb6e11f8.camel@mediatek.com>
Subject: Re: [PATCH v15 03/12] dt-bindings: display: mediatek: disp: split
 each block to individual yaml
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 3 Mar 2022 12:31:31 +0800
In-Reply-To: <CAL_JsqLU0m9C1OPdiBPTkofB4sfiAeUPbFHp0w8caWyP4XPOEw@mail.gmail.com>
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
 <20220126071932.32615-4-jason-jh.lin@mediatek.com>
 <CAAOTY__K_0sp6+VdL0yi=wF9wA_uag4HKqK3ST7uySdkzfCHBA@mail.gmail.com>
 <CAAOTY__Xz0Pu30tmUrNJ=Nji=03Xv_3Qw526_hT-zELME36Bxw@mail.gmail.com>
 <CAL_JsqLU0m9C1OPdiBPTkofB4sfiAeUPbFHp0w8caWyP4XPOEw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_203145_944183_4359B3D4 
X-CRM114-Status: GOOD (  14.08  )
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
Cc: David Airlie <airlied@linux.ie>, singo.chang@mediatek.com, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nancy Lin <nancy.lin@mediatek.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Moudy Ho <moudy.ho@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob,

Thanks for the reviews.

On Wed, 2022-03-02 at 18:00 -0600, Rob Herring wrote:
> On Mon, Feb 7, 2022 at 5:07 PM Chun-Kuang Hu <chunkuang.hu@kernel.org
> > wrote:
> > 
> > OK, it seems no one has comment on this patch, so
> 
> No comment because the patch was not in PW. That's most likely due to
> this:
> 
> Subject: [PATCH v15 03/12] dt-bindings: display: mediatek: disp:
> split
> each block to individual yaml
> Date: Wed, 26 Jan 2022 15:19:23 +0800 [thread overview]
> Message-ID: <20220126071932.32615-4-jason-jh.lin@mediatek.com> (raw)
> In-Reply-To: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
> 
> [-- Warning: decoded text below may be mangled, UTF-8 assumed --]
> [-- Attachment #1: Type: text/plain; charset="y", Size: 50916 bytes
> --]
> 
> "y" is not a valid charset. This is caused when git-send-email asks
> for the encoding and you answer 'y' rather than <enter>.
> 
> Rob
-- 

Thanks for making me realize the problem.
I'll always use <enter> in the future.

Regards,
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
