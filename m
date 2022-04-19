Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B43C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 01:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d8d+Os9Hxq6TJ0DDqkZVG8qU3smZJoUQUuOMe0pRtUs=; b=vynsWKqsKmcdvZ
	vZKjaeWwy1Tbmi8uTNW0GNaacWsl/u++aknlK1Yn1csZ5jmjE996lD0WevmaaB9CeYKEphOx0Lju/
	jjhFy4ewA1/w+OXiig3uV8M5bmCt57m95Kc2s2SLGfuQNLrxj1T9XnHn+kChXcH7Qn4QzOIqf0RNv
	T2Nc3qoSZyux8lG76JxiJMEPL0NHTMeqYAlCkV9ak3VGduF+Q0iG6WVKSXDcmppX+qdn/5PB/BQC6
	jdTccgBlfYP04qS9dt9gwL6dJa7hzoxYoDU/tNWBfwTk329A2p2hO6jpUVtIX54DWXrG7pr/whprY
	fdIko2arxzPCtB2rVvwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngd4S-0015bJ-Bm; Tue, 19 Apr 2022 01:54:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngd4N-0015Yi-Lf; Tue, 19 Apr 2022 01:54:21 +0000
X-UUID: 9a0f719e98a949e29c429b29ab2a82b2-20220418
X-UUID: 9a0f719e98a949e29c429b29ab2a82b2-20220418
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 48838511; Mon, 18 Apr 2022 18:54:01 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Apr 2022 18:53:59 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 19 Apr 2022 09:53:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Apr 2022 09:53:46 +0800
Message-ID: <b518577296cb24749c6b76a6209c7e95b84e8ac0.camel@mediatek.com>
Subject: Re: [PATCH v18 02/10] dt-bindings: arm: mediatek: mmsys: add mt8195
 SoC binding
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Rex-BC Chen =?UTF-8?Q?=28=E9=99=B3=E6=9F=8F=E8=BE=B0=29?=
 <Rex-BC.Chen@mediatek.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>
Date: Tue, 19 Apr 2022 09:53:46 +0800
In-Reply-To: <ff8a2ede-1489-0412-2425-3191f9fd9026@kernel.org>
References: <20220412103114.19922-1-jason-jh.lin@mediatek.com>
 <20220412103114.19922-3-jason-jh.lin@mediatek.com>
 <69dd1710a7f1c1715e079ece159fc527c7fecb4c.camel@mediatek.com>
 <ff8a2ede-1489-0412-2425-3191f9fd9026@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_185419_737242_D0BC07ED 
X-CRM114-Status: GOOD (  19.97  )
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

Hi Krzysztof,

Really appreciate your helpful information.
I hope we can figure out with IT soon.

Thank you very much!

Regards,
Jason-JH.Lin

On Mon, 2022-04-18 at 19:03 +0200, Krzysztof Kozlowski wrote:
> On 14/04/2022 05:11, Jason-JH Lin wrote:
> > Hello Rob, Krzysztof,
> > 
> > I found the dt-binding patches in this series never appeared in
> > devicetree-bindings patchwork and trigger the dt-binding check bot.
> > 
> > Do you know the reason for this?
> > Could you help me with this and let me know what should I do to
> > solve
> > this problem?
> 
> Hi,
> 
> All your emails end up regularly in my Gmail spam folder, similarly
> to
> emails from some other Mediatek people (e.g. Rex-BC Chen), so maybe
> that's the cause?
> 
> Why they end up in spam? I don't know, but it would be nice if you
> could
> work on this with your IT department. I know that corporate
> environments
> are tricky to change, but there is not much else to do. Google flags
> your emails always as spam.
> 
> You can see in the headers two DMARC failures:
> dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE)
> header.from=mediatek.com
> 
> Spamming 27 recipients is maybe another reason...
> 
> Best regards,
> Krzysztof
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
