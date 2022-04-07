Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBA0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 21:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KdqX9wKUnTMxndJJImcDLT5UB0XjOn6sx5810u7iHkI=; b=JyhVXLElWuHFKt
	eACfjw/8LJl4xgbAutqOH4jMHeqqLte3hpDMwzQuVw+xnbybaxXzXFQYzfJk3P+Vb5YsJUktaFpyN
	QxMAqN+PIUQ1sOAW5AA7SCsLy/9S0z/IFULQ7XycBiQ2MfE852Dax+srXmVX1XNS1ifk7+wlpYHQi
	m/1rZqwtXQFhdtpbmSb0B+vlpSV8gZxFzxgZxOHme4iDhyD0kq048OhTixPALugR9wOyXThkyqy2y
	0NlMXtw/iC8n3wgrDvvMgg7REEA5nRQ18asIJFOX9bfAzu2iCvwk4DYzXbTVUTp8KQuvDIoe6lDHQ
	Xq+j9Mrr7mAm0McfDHQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncZcO-00E7Q2-IR; Thu, 07 Apr 2022 21:24:40 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncZcD-00E7Nn-07; Thu, 07 Apr 2022 21:24:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 9D6F51F46A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649366665;
 bh=ZM2JW5hpiHTPcC5mYT0UabIz9BN1FEYm0emgVb8w8vQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LiryOxC+H+6BonxWrZ4+pNbcRKz86e6YgydNpcl43YPOLnyxpjUYiuoJfDqPbWNjP
 za8u8bpPBJ2SUcPe72Vh0zPerv8izJOtPuyw7OH62o+US/bHtLN2nWjGExklAJZa0O
 bn45EReCe/JewyiEtM9fqb8GTOeZuirZ3BEyzoZbSnk0Dw9ET+f7p7neAGzBslUxZu
 LiuamJvfs1iYdtbMoc+KagPnr+mPm1qTutqlk/ISg5k1/QqMJTQDK/yJekAndw4APh
 Ct6w5Zg6lWpsHRJalImfqOHkw9c3inpZsON6kjdmQHIRTNg2i7lOizfBqNpYmJRIUg
 Fl8PimTFnVqvA==
Date: Thu, 7 Apr 2022 17:24:20 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, robh+dt@kernel.org, tzungbi@google.com,
 angelogioacchino.delregno@collabora.com, aaronyu@google.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, linmq006@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v9 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <20220407212420.tncc576jo5iwaqk7@notapiano>
References: <20220406100514.11269-1-jiaxin.yu@mediatek.com>
 <20220406100514.11269-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220406100514.11269-3-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_142429_210382_0150D108 
X-CRM114-Status: GOOD (  10.06  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jiaxin,

On Wed, Apr 06, 2022 at 06:05:12PM +0800, Jiaxin Yu wrote:
> MT8192 platform will use rt1015 or rt1015p codec, so through the
> snd_soc_of_get_dai_link_codecs() to complete the configuration
> of dai_link's codecs.

Suggestion for the commit message:

As part of the refactoring to allow the same machine driver to be used for =
the
rt1015(p) and rt5682(s) codecs on the MT8192 platform, parse the rt1015(p)
codecs from the speaker-codecs property in the devicetree and wire them to =
the
I2S3 backend, instead of hardcoding the links and selecting through the
compatible.

> =

> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

- Tested on mt8192-asurada-spherion (rt1015p and rt5682). All audio paths s=
till
  work as previous to this refactor. And it's still possible to omit
  mediatek,hdmi-codec.

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
