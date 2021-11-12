Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5818C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 02:12:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C97F60E93
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 02:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C97F60E93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Re0i87Zw48ZsxHGgokrLsUNoVVyTbeX8XpPAP+68/j0=; b=LHvh0F6Bg+n/du
	ZCccnMNwiRcIHLayvrxR5Byiwh0taoU99ikRbRU+6rJbIvJkNGnk0UmAh/tU37K6iziVHJjdZtiE9
	PooGTVRz0EyLHpkn67OvmaQIxsJ4v7QHGm8CfH0GEVWZZRX3nqYMtlM/DTnUKiAr+mm4L05tKMbCc
	8akBZgoBY6gNT55+OaDooGxq/I7gyumPsoOVqga/kfr9bwdGl9SWmlZ+fwq6iYaaDqo7Zy5UtFYdU
	X3Dfhm81FrrCacS+NWi0pOIkWgYz/1DYIzurtQIyhkJO8lS0HR5xLdQrYylFDZFstWJ3HMWA7xYEN
	MaoMiWWR3QnX1ZbC9jcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlM34-009EWf-2f; Fri, 12 Nov 2021 02:12:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlM2m-009EUn-Gp; Fri, 12 Nov 2021 02:11:58 +0000
X-UUID: 6a6297328f4843be861fc46de814dfde-20211111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ufO+ZBf8QD7tWoExaa5T5GTQHOADopwfBVamDw5rnT8=; 
 b=CCtXfpKZmyHgTqGLYPLkzMuzL52fuRVJ9XdfPrLKTGzjde2hJul4hJKhPvZU9IJrtsBed69Ej7ej/yLA2XksRnVtlvu6/l9jNAd6/p+REufwnh9xd9Bn6/w8euq6eOBO6CF1bBwpsUJeG3kOLzh3D8SPSMAf9mskuBkOa2KcdGc=;
X-UUID: 6a6297328f4843be861fc46de814dfde-20211111
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 531803900; Thu, 11 Nov 2021 19:11:54 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Nov 2021 18:11:53 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 12 Nov 2021 10:11:51 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Nov 2021 10:11:50 +0800
Message-ID: <5500319817253c3f0c01064c363089d6b0c95d48.camel@mediatek.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: net: dwmac: Convert mediatek-dwmac
 to DT schema
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 "Jose Abreu" <joabreu@synopsys.com>, <srv_heupstream@mediatek.com>,
 <davem@davemloft.net>, <linux-arm-kernel@lists.infradead.org>,
 <macpaul.lin@mediatek.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, <linux-mediatek@lists.infradead.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Fri, 12 Nov 2021 10:11:50 +0800
In-Reply-To: <1636642646.918741.3774088.nullmailer@robh.at.kernel.org>
References: <20211111071214.21027-1-biao.huang@mediatek.com>
 <20211111071214.21027-5-biao.huang@mediatek.com>
 <1636642646.918741.3774088.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_181156_590550_95FE8A27 
X-CRM114-Status: GOOD (  18.54  )
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

Dear Rob,
	Thanks for your comments~

On Thu, 2021-11-11 at 08:57 -0600, Rob Herring wrote:
> On Thu, 11 Nov 2021 15:12:13 +0800, Biao Huang wrote:
> > Convert mediatek-dwmac to DT schema, and delete old mediatek-
> > dwmac.txt.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  .../bindings/net/mediatek-dwmac.txt           |  91 --------
> >  .../bindings/net/mediatek-dwmac.yaml          | 211
> > ++++++++++++++++++
> >  2 files changed, 211 insertions(+), 91 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-
> > dwmac.txt
> >  create mode 100644 Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for
> dtbs_check.
> This will change in the future.
> 
> Full log is available here: 
> https://patchwork.ozlabs.org/patch/1553803
> 
> 
> ethernet@1101c000: clock-names: ['axi', 'apb', 'mac_main', 'ptp_ref']
> is too short
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
> ethernet@1101c000: clocks: [[27, 34], [27, 37], [6, 154], [6, 155]]
> is too short
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
> ethernet@1101c000: compatible: ['mediatek,mt2712-gmac'] does not
> contain items matching the given schema
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
> ethernet@1101c000: compatible: 'oneOf' conditional failed, one must
> be fixed:
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
Yes, I should add a dts related patch to fix this issue in next send.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
