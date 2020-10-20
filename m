Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D466C43457
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 02:34:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99CC7223BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 02:34:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I40crNNT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lNdYo+No"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99CC7223BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TwXyerPZiCnkcRhjqCX/BvHN8YbL4gPUksi0Ckq0wUo=; b=I40crNNTj7ubpwCDLXobS2B43
	IdSgHC0LRF3SJgEPPpanW/sMsaqaUjPrkVCdVpsS0BNbuXJe7I1eLi9kSG9bE/5LDv2fn/5QCYLWU
	cjviFmr9/WgdD1YGlfT0/fqC1ufO/53jNpu4GXUHIE8pVy/k8lBAh0YSLFCpLcJcWezfg+uROLAul
	9kRz1/c8XHYgKizabgGB1DZm5GdL6QfsWhS7+PkmJ7W74M3W1qG7r7GU+lyqi/6JiS6Zot+KEknfi
	qLslldnDAUtkSCofzBz5suqdIw86TT0ZTztXCFG5v+L8Y2wHKuTxwPPLuI1Id8RndOObDzx04UQC9
	rweFq7FVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUhTv-00034L-A1; Tue, 20 Oct 2020 02:34:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUhTt-00033O-3r; Tue, 20 Oct 2020 02:34:33 +0000
X-UUID: dbe9fc7dc9fd468682893c77f74e9058-20201019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GUA1hbpU/msavICMu4ZyZUeoilqfTnK1HnnKU2S01BA=; 
 b=lNdYo+NogUdsjYDTXcmU71GYt71aAd2j9xbMzUWIWwFdi/cuzBZeAwa7+sHFjzhf55Q9zQUI4dmBrE9HTEjxCYZ8Dq2J8FpXnbAhJVQaApmXag8S+JOmX2aaPjlxHqsn/Qz/likmejM72/SFsqGH/JhQ0+sR9QgV4BnqVOAlGvw=;
X-UUID: dbe9fc7dc9fd468682893c77f74e9058-20201019
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 924278572; Mon, 19 Oct 2020 18:34:24 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Oct 2020 19:34:22 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 20 Oct 2020 10:34:04 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Oct 2020 10:34:04 +0800
Message-ID: <1603161244.29336.142.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/8] dt-bindings: phy: convert phy-mtk-tphy.txt to
 YAML schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 20 Oct 2020 10:34:04 +0800
In-Reply-To: <20201016170552.GA1580710@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-2-chunfeng.yun@mediatek.com>
 <20201016170552.GA1580710@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 204DA36F181E521CDF8CC1E6221ACDE0FAA6F121DEDB71CF4B5AED7B259FEB042000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_223433_314406_19235791 
X-CRM114-Status: GOOD (  14.46  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, CK
 Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-16 at 12:05 -0500, Rob Herring wrote:
> On Tue, Oct 13, 2020 at 04:52:01PM +0800, Chunfeng Yun wrote:
> > Convert phy-mtk-tphy.txt to YAML schema mediatek,tphy.yaml
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: modify description and compatible
> > ---
> >  .../bindings/phy/mediatek,tphy.yaml           | 263 ++++++++++++++++++
> >  .../devicetree/bindings/phy/phy-mtk-tphy.txt  | 162 -----------
> >  2 files changed, 263 insertions(+), 162 deletions(-)
> >  create mode 100755 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> 
> Also, need to fix the mode.
Ok, thanks

> 
> >  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
