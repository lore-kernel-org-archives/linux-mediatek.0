Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124F6C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 14:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c1XocZvVMNIYFJI6OFl8dxnbhcOkOxwh3QDZ6+s6UUs=; b=QelcqtL85E6PCD
	GIJusoEzwPnbg/bin0Qq4dNTY19RGTBxsza4R0wR8FUu0NOxi3R1UhwWu4rKxfH87qpfHWJhIQlme
	HNnkWbzomFoVTgm3q2m0zZnteM8n7ruRlrC1MHpsE4LV4oOw2exstJhu8QNisOngjpderQ0L/O24/
	7bYx3WlJJwXEaZv51mWpQC6fwFfWvpY1d1kkqwc+Ep9TITRUejS5m7Tpp+LMEEeScuwKUJcoil3ai
	DpNX1B2DCFRepJ84w+/VRiQjZeMweR5LsniIujxhIEye9gSjFGk1GsPeRBK7KUWF9ZkJWmlse/yfq
	0rOrlfGddDGayC3kFzXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZZ7o-00GDZs-7F; Wed, 30 Mar 2022 14:16:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZZ7l-00GDZQ-QW; Wed, 30 Mar 2022 14:16:39 +0000
X-UUID: 7f5fdc39a7144de6a99c7148d5d24410-20220330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=iZmcRH9cF03UH2iuV6rU+U9ZpelvCuJdV7SiMV4qQjU=; 
 b=fDhoSSGaKNO38ZXYPtOYCXmONNhPYTA3jP57G8x+q4OviDmjAHm/uIdKGMBcEa7lzbGXFg0Wte6hOJy1n0lrTQE7zudrWdo5w/hsjB6gk+j84RtUx1g9Np9lxekHm4JFjMSVfWgEaHBcPswEa0gOnb7MkrRZLKFfdOGsJEpe5ss=;
X-UUID: 7f5fdc39a7144de6a99c7148d5d24410-20220330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 64476808; Wed, 30 Mar 2022 07:16:28 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 07:06:26 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 30 Mar 2022 22:06:25 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Mar 2022 22:06:24 +0800
Message-ID: <61e9fb59448837cfc8e3ec862b711294bcb68872.camel@mediatek.com>
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
Date: Wed, 30 Mar 2022 22:06:24 +0800
In-Reply-To: <YkRNSoBKFvYYyZLu@sirena.org.uk>
References: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
 <20220324064511.10665-3-jiaxin.yu@mediatek.com>
 <20220329223002.uo7kiemopkh7ak4x@notapiano>
 <dee3fbb7c9f0c3e1f11143db1d6fc4381cab827f.camel@mediatek.com>
 <YkRNSoBKFvYYyZLu@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_071637_891677_E255A981 
X-CRM114-Status: GOOD (  12.66  )
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

On Wed, 2022-03-30 at 13:30 +0100, Mark Brown wrote:
> On Wed, Mar 30, 2022 at 10:33:06AM +0800, Jiaxin Yu wrote:
> 
> > "(Although I think this would technicallybreak the ABI?)"
> > ==> I can't understand this question, could you help explain it in
> > more
> > detail.
> 
> Making a previously optional property required means that systems
> that
> previously worked may stop working unless they update their DT, DTs
> may
> be distributed separately to the kernel and perhaps even baked into
> firmware or similar.

Hi Mark,

Thank you for your detailed answer. I should keep the driver's behavior
consistent with the description of dt-bindings. The "mediatek,hdmi-
codec" needs to be set as the required property. Is my understanding
right?

Thanks,
Jiaxin.Yu
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
