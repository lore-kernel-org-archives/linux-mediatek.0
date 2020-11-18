Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2CFC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 03:27:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF77524695
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 03:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TZCmxFD6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uJj7O8VB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF77524695
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SnZfUejO/Kah70WqKbC97DKjmuraD1Rm1HBMcA2yo1A=; b=TZCmxFD6n+ZzcRWyZ58T+JJXK
	QPxg6ewIV5KGa308S/WLd796LUCZE/jy9Z6pF+SVj6M516SmNFdEwDek1iowDedh+dCosm8EVG3Bh
	vD1tlKgYxE7uZdcu+YCvrq3lvbQIktjgHJnvt85naxPlcuAA8DpCfHZJ/Lxe+SPLxx5fpVzvfAczi
	a1xUxlkrpf/9/lcaLD11tcifLxq/eHSUc+T0bHrYHGER/s03FU3XZqjnaQ20hr2GSWWTijvT6ZAez
	AW4G0ejduAWZ5Jc+iLIj2MwuGIMqY35L3U3iebyb2s/wLgOEXDmM2UqgivS7zgEqF6aJ45UkUCP7K
	OPWyEoJbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfE7j-0007lR-Ii; Wed, 18 Nov 2020 03:27:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfE7g-0007jz-Cf; Wed, 18 Nov 2020 03:27:09 +0000
X-UUID: 664ab064e7794e2db7cbcd4a90c5dbd1-20201117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=rVcqz6XUTMam5Rpds84b/f/9khQeZe+z1fGfOnsNnj0=; 
 b=uJj7O8VBaWuZG+jsiOSgFdaJfvgnPrhqDliQrIVbjJ4j5ATy3t4MoJEOS91EUHNyOw867NNgNEittQRiYhbs9QEUMaIpMgcITugGKI5i1gjvqXChROHTk0S8nXaoTuVLzhZKYUGnHmCXQM7tugYC373CdT4Q55EGDn4bG9gIx0Y=;
X-UUID: 664ab064e7794e2db7cbcd4a90c5dbd1-20201117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 173023410; Tue, 17 Nov 2020 19:27:00 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Nov 2020 19:26:58 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 18 Nov 2020 11:26:55 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Nov 2020 11:26:54 +0800
Message-ID: <1605670015.11864.5.camel@mhfsdcap03>
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Add optional cqe off properties
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 18 Nov 2020 11:26:55 +0800
In-Reply-To: <20201116192801.GA1991505@bogus>
References: <20201112075208.28183-1-wenbin.mei@mediatek.com>
 <20201112075208.28183-2-wenbin.mei@mediatek.com>
 <20201116192801.GA1991505@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E0983558C713B21671019A4B5CB7E2E62F2D4A278694AFAB10C6DD3BE75DF4EE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_222708_561920_71922F6E 
X-CRM114-Status: GOOD (  19.20  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Bradley Bolen <bradleybolen@gmail.com>,
 srv_heupstream@mediatek.com, Baolin Wang <baolin.wang@linaro.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, irq-linux@rere.qmqm.pl,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Ludovic Barre <ludovic.barre@st.com>,
 Krishna Konda <kkonda@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-11-16 at 13:28 -0600, Rob Herring wrote:
> On Thu, Nov 12, 2020 at 03:52:06PM +0800, Wenbin Mei wrote:
> > Add optional properties for cqe hosts which are used to set cqe off
> > during suspend flow.
> > 
> > Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> > index b96da0c7f819..457c9a84b988 100644
> > --- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> > @@ -164,6 +164,13 @@ properties:
> >      description:
> >        enable SDIO IRQ signalling on this interface
> >  
> > +  cqe-off-in-suspend:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      After suspend, the mmc host is powered off by HW, and bring CQE register
> > +      to default state, so we add the flag to re-init CQE register after resume
> > +      back.
> 
> The driver change is before suspend, but this says on resume...
> 
> In any case, this should be implied by the SoC specific compatible.
> 
Thanks for your reply, I will drop this patchset, and resend another
patchset for this issue.
> > +
> >    full-pwr-cycle:
> >      $ref: /schemas/types.yaml#/definitions/flag
> >      description:
> > -- 
> > 2.18.0
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
