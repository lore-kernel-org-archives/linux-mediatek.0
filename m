Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A61C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 02:45:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E634520936
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 02:45:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L3c0z+5T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cBquiHz0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E634520936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7XM7n6fdihxRL8+SAJr+7Pk9dV/fgb/7QrnhnLyjIMc=; b=L3c0z+5TeqI/f/zngNyM9esZr
	VbQ+2D7ZstccW2u7UwkTMJAkqw72yIDv02ieAKEJPPp/3RcArAjj/Jgyp5End3equ6XI9DQ+JIvQA
	cDUdUOJcmSQkBCHreNMFE13tqmt0J4GcuZkEgH57nn+2GW9e0BR2noZtyIe/iBeBlzRXStaR6PkU4
	qobSRJGZd96IL15lJ5XfE9FsTVvKhJSzV+uadjcPFE+wd3/LXii8LyA5CE72rl6whrjYiXQXXBjfn
	h+CQlw3p/GevZPmBcROXn25EjZj2S7P8a8k9egviUfJjKGG7Y1ztNmSFJWRr3X8xOpytQhhOLvW8h
	9fyUN8dYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFq6Y-0008Un-S8; Wed, 09 Sep 2020 02:45:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFq6R-0008Sk-UB; Wed, 09 Sep 2020 02:44:58 +0000
X-UUID: a89a3d6d442d4f26852a3d718e684443-20200908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KnlunEIZPJSAevHwEXlWcgiUgHwh3n6Mc+pcg4rLANE=; 
 b=cBquiHz0epDUS0Vkcb2xmaLJMoow8PRtHX0wa0rC2s+uCZSiWBdbDY+hgE+nnZCfvhCrPdBuzTIOItUwCSp8gd+dP5f/ZuATOGsaBXRvk/b95U8Tl0M+r9s0PGPtfnct7v2XHeZeWSRoXWm7dHvYQ910fSFXl599yuNMAW0AOPI=;
X-UUID: a89a3d6d442d4f26852a3d718e684443-20200908
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1382334192; Tue, 08 Sep 2020 18:44:49 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 19:44:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 10:44:45 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Sep 2020 10:44:45 +0800
Message-ID: <1599619486.8380.0.camel@mtksdaap41>
Subject: Re: [PATCH v2 1/2] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 9 Sep 2020 10:44:46 +0800
In-Reply-To: <20200908204950.GA893759@bogus>
References: <1598006677-7953-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1598006677-7953-2-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20200908204950.GA893759@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_224456_164239_3634C08B 
X-CRM114-Status: GOOD (  14.36  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, 2020-09-08 at 14:49 -0600, Rob Herring wrote:
> On Fri, Aug 21, 2020 at 06:44:36PM +0800, Hsin-Hsiung Wang wrote:
> > This adds documentation for the SPMI controller found on Mediatek SoCs.
> > 
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> >  .../devicetree/bindings/spmi/spmi-mtk-pmif.txt     | 33 ++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/spmi/spmi-mtk-pmif.txt
> 
> Bindings are in DT schema format now. Please convert this.
> 
> Rob

Thanks, I will update it with correct format in next patch.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
