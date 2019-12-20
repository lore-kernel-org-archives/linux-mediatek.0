Return-Path: <SRS0=AkNb=2K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB923C2D0D1
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 03:36:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3388724682
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 03:36:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gXr8x0U1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="l2ELMJOB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3388724682
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjK0goFL3haykv/x+nZaLgb6ZddQLG2F6jURmwIujnk=; b=gXr8x0U1soOZDX
	Sn6qjJQJOXWSwZUZwvuFNFicoBHNFMjYPzHC9uCL10KrhRHtlBL8XsaUu3LsM1uVBnTei0ekWXg+Z
	Pz0CwJSfOhuLxkkVsMaRMk2gTh3p5tDC6Nt4JuE8EmOanzrHrYsS0O1NgV5890wifbkR+hmYwPIFx
	MQhIvvfdwxBXbV5FQw0zWvwBgZwW89edlw7Au7wP7oWhzRAH87EdKb/Nyb2LUsNp13TFybV4Ze+dN
	86xW9DWtmLiCHid86yxTqjKxtWW7NgZV3MATAjPrKFRyUKjMtywjD3+N+Uqv5Hf0+mefWDcV+qJZn
	oxsMjw5LyOEduOVtslUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii95i-0000fD-O3; Fri, 20 Dec 2019 03:36:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii95g-0000eG-AM; Fri, 20 Dec 2019 03:36:37 +0000
X-UUID: 46d727b6afc1400d840f44dfd2178f0c-20191219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=b3BvJEb+vzVbaT4+/7UIh98dwFNwj/jxNR863LYiVIU=; 
 b=l2ELMJOB4mMfTnYMA0CZpPtB2eudOKMht9/o3XcfuX2e+fDTN3hrHUo++ErjDPXSkqhZr5Yi0GehudKI3bW05+ZBtBAFVMlhLkIKPJyZYYaxGjKKVeCDO4jMX/uwAegIyS2/WUx4BSuWvgiSZwniunIDML5PEx7ApjaonNRP2qs=;
X-UUID: 46d727b6afc1400d840f44dfd2178f0c-20191219
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1695137931; Thu, 19 Dec 2019 19:36:34 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Dec 2019 19:30:42 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Dec 2019 11:29:46 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 20 Dec 2019 11:30:26 +0800
Message-ID: <1576812619.8410.8.camel@mtksdaap41>
Subject: Re: [PATCH v10 05/12] soc: mediatek: Add multiple step bus
 protection control
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 20 Dec 2019 11:30:19 +0800
In-Reply-To: <CANMq1KAB9vTDY+d1ktmAtxCGMYqc_C9-SzLzOkLyBmgLz39KYQ@mail.gmail.com>
References: <1576657848-14711-1-git-send-email-weiyi.lu@mediatek.com>
 <1576657848-14711-6-git-send-email-weiyi.lu@mediatek.com>
 <CANMq1KAB9vTDY+d1ktmAtxCGMYqc_C9-SzLzOkLyBmgLz39KYQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_193636_363301_E1376265 
X-CRM114-Status: GOOD (  10.62  )
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
Cc: Rob Herring <robh@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Fan Chen <fan.chen@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2019-12-19 at 11:51 +0800, Nicolas Boichat wrote:
> On Wed, Dec 18, 2019 at 4:31 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> >
> > Both MT8183 & MT6765 have more control steps of bus protection
> > than previous project. And there add more bus protection registers
> > reside at infracfg & smi-common. Also add new APIs for multiple
> > step bus protection control with more customized arguments.
> >
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ...
> > diff --git a/include/linux/soc/mediatek/scpsys-ext.h b/include/linux/soc/mediatek/scpsys-ext.h
> 
> Will this include file be used by anything other than
> drivers/soc/mediatek/scpsys*.c? If so I think you should keep it in
> drivers/soc/mediatek/ instead.
> 

No. And I'll move it under drivers/soc/mediatek/

> I also still had a comment in v9 about clr_mask, otherwise this looks ok.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
