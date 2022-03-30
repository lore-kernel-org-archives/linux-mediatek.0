Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A68C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 15:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEDOdrATwxFCcHpKf45uzsWWDqpa2w1GlzE2tm5nEcA=; b=L93eD1Rc7BfjwL
	lV7eG6Dc7wy+EtfgDng0jbuZzkEPfxAVAvZW8eCBWx4nVQSU9upcksBF2ak7bNK6BmlNxuXIZmlna
	QPk/x9CRPdnOFQ3jJf6zh2hsLzWwGZI1ji74T6OIl6JdwcvbzP/3UHZ1/hHAsObdVZilKwsQXZZGw
	k+nS/AZuomGih822jl6SRr97aTtwyqIb1GO1nM50to12kiUrYPMOoCT2jM0/p7qprHJkFEKl9ZCf3
	Bp1OW4plnsCRyF1tLaFiMrvcHs74KtrBefLNVFQRxGALMc3kAfxvXsp1nA+joLI1xnOdtkWgb59cu
	u69OW/t5OJemUfUSCgSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZagy-00GhgT-8m; Wed, 30 Mar 2022 15:57:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZaYk-00GeF4-JF; Wed, 30 Mar 2022 15:48:37 +0000
X-UUID: 88b550d38bf446e3b781d2f6a7c3fe17-20220330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xAKGY29RbJOblaDqNPp+LGJ5pdSkHKZag+GTRXgyQUo=; 
 b=BiX/BwpcgF81RxrUemhcLNQ9cQeTePp9n3/wV4qnKohQbq1z733jXV7GDzA6yp+zp4QG/uu8UtsBL/5u8hWy1BHNCDvH39uvw/v4c1Buy0EmQCCYXn3mQVdITf48GtT6agFmAsdlwSGc3qnAPB7ZyRz83ZBdhVtB/rK6iWmXOA0=;
X-UUID: 88b550d38bf446e3b781d2f6a7c3fe17-20220330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 866219814; Wed, 30 Mar 2022 08:48:29 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 08:48:03 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 30 Mar 2022 23:48:02 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Mar 2022 23:48:01 +0800
Message-ID: <734fbf254c64668856e987aafe9d7dfd3ec86941.camel@mediatek.com>
Subject: Re: [v7 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>,
 <robh+dt@kernel.org>, <tzungbi@google.com>,
 <angelogioacchino.delregno@collabora.com>, <aaronyu@google.com>,
 <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, <linmq006@gmail.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Tzung-Bi Shih
 <tzungbi@kernel.org>
Date: Wed, 30 Mar 2022 23:48:01 +0800
In-Reply-To: <YkRoC30JLDMeVi1B@sirena.org.uk>
References: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
 <20220324064511.10665-3-jiaxin.yu@mediatek.com>
 <20220329223002.uo7kiemopkh7ak4x@notapiano>
 <dee3fbb7c9f0c3e1f11143db1d6fc4381cab827f.camel@mediatek.com>
 <YkRNSoBKFvYYyZLu@sirena.org.uk>
 <61e9fb59448837cfc8e3ec862b711294bcb68872.camel@mediatek.com>
 <YkRoC30JLDMeVi1B@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_084836_088744_5D360588 
X-CRM114-Status: GOOD (  21.80  )
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

On Wed, 2022-03-30 at 15:24 +0100, Mark Brown wrote:
> On Wed, Mar 30, 2022 at 10:06:24PM +0800, Jiaxin Yu wrote:
> > On Wed, 2022-03-30 at 13:30 +0100, Mark Brown wrote:
> > > Making a previously optional property required means that systems
> > > that
> > > previously worked may stop working unless they update their DT,
> > > DTs
> > > may
> > > be distributed separately to the kernel and perhaps even baked
> > > into
> > > firmware or similar.
> > Thank you for your detailed answer. I should keep the driver's
> > behavior
> > consistent with the description of dt-bindings. The "mediatek,hdmi-
> > codec" needs to be set as the required property. Is my
> > understanding
> > right?
> 
> The binding document and code should match so if one is changed the
> other needs to be changed too.
> 
> In theory we should never change a previously optional property to
> required which would mean that the code should be updated to reflect
> the
> binding document, however sometimes the DT isn't actually used as a
> stable intereface by anything for a given property or device type so
> we
> can get away with changing things.

"however sometimes the DT isn't actually used as a stable intereface by
anything for a given property or device type so we can get away with
changing things."

Sorry, I don't understand the real idea of this description. Does it
mean that dt-bindings in this series don't need to be updated, but the
driver?
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
