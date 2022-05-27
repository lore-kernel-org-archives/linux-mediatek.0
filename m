Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1D8C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 May 2022 19:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGmYhvveXk8nCxIbrjgt9+qlpzrVkOG2fE0g5mFDpRk=; b=PiMy4eKG4QJpYt
	8dSO1iTjFAaDJ2lawWRJXihAcTcPeoPflo2NAWEkKZchSgIv78uWPDMIfI+JjdPrM0EvQRjKivHIL
	v5llZj/J0Ee4XaR9n4uEESgaNhrW2rzbv+psvpT/fOyVRywwgFXfbwAtlWChb47EEqv3xSIu+bgVB
	zMkdKLJIl10g+O/W4korvlNPe8BH/ygEglxALaiISJNGJJFZAYamX5p3iEIH9feW1sUOZ6idKwJs0
	diIAzZc5ofXgqeivEkD5XP8oaTPc0lJEXvoewfKe4eEmYFhdHXLu7yMRrnJtWS4TIYQ1bNzXWlg9p
	EwjMRmooR0vpGDowCULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nufHj-000oqf-KM; Fri, 27 May 2022 19:06:07 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nufHV-000onf-CR; Fri, 27 May 2022 19:05:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nfraprado)
	with ESMTPSA id 6F81D1F464B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653678348;
	bh=xy2v0UW9OxkQlEpRbg1MC88ziJi3bs138+XfVpOrkC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mmjaRwBZTXfnPJGc8bg4toaoo7Nyy0vzqi4EoQOeXyw9L35qvzztiaTKc8D+3NEUo
	 kayJ4EY33oK3oAtrBrOS3xa++5ygl8StkJe0nOsqV/dlMCv6kE7PzCWHRFLNnJzgso
	 8GoqNYPkUfFT7ERTn3CO/vwimAsB3k6g/JBpKfALGev0HUY3dP3wUid8ss7xdZvham
	 py+/vV1fyzp7V/dx21pD7ADBHmbgZdS05Ve6cgbkDn8SLaeo+rWBgX7DaMKlyNsj4q
	 Vii7d9CB0XHlSckHEZBCSUBzrJfH82zot9PVCF+ZLll5iy2uzMFYbHnI0hxOQ4YXXX
	 nsKgtruVhfFNg==
Date: Fri, 27 May 2022 15:05:42 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Shane Chien <shane.chien@mediatek.com>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
Message-ID: <20220527190542.4jckyflvtkq4n7ie@notapiano>
References: <20220509205847.607076-1-nfraprado@collabora.com>
 <e8d854c0-e2a5-2382-4b54-c5e879170324@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8d854c0-e2a5-2382-4b54-c5e879170324@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_120553_592788_76AC2ACE 
X-CRM114-Status: GOOD (  28.81  )
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

On Thu, May 26, 2022 at 08:49:39AM +0200, Krzysztof Kozlowski wrote:
> On 09/05/2022 22:58, N=EDcolas F. R. A. Prado wrote:
> > The Mediatek AFE PCM controller for MT8192 allows two I2S interfaces to
> > share the same clock and act as a single interface with both input and
> > output. Add patterns for these properties in the dt-binding. The
> > property is split into two patterns in order to allow all valid
> > interface pairings.
> > =

> > Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> > =

> > ---
> > The series from v1 of this patch was merged although some changes were
> > still needed in this patch, so the v1 of this patch was reverted [1] and
> > this standalone commit addresses the feedback from v1 and readds the
> > property.
> > =

> > [1] https://lore.kernel.org/all/20220509185625.580811-1-nfraprado@colla=
bora.com
> > =

> > v1: https://lore.kernel.org/all/20220429203039.2207848-2-nfraprado@coll=
abora.com/
> > =

> > Changes in v2:
> > - Added "mediatek," prefix to property
> > - Rewrote and added more information to property description
> > - Split into two patterns to validate that output-input pairings are
> >   done
> > =

> >  .../bindings/sound/mt8192-afe-pcm.yaml           | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > =

> > diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yam=
l b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> > index 7a25bc9b8060..2abf43c6c2c3 100644
> > --- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> > +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> > @@ -54,6 +54,22 @@ properties:
> >        - const: aud_infra_clk
> >        - const: aud_infra_26m_clk
> >  =

> > +patternProperties:
> > +  "^mediatek,i2s[13579]-share$":
> > +    description:
> > +      Each I2S interface has a single data line, input if its index is=
 even or
> > +      output if the index is odd. An input and an output I2S interface=
 can be
> > +      used together as if they were a single I2S interface with both i=
nput and
> > +      output data lines by sharing the same clock. This property repre=
sents this
> > +      pairing. The value should be the name of the interface whose clo=
ck is
> > +      used, and the property name the other interface that depends on =
this
> > +      clock.
> > +    pattern: "^I2S[0268]$"
> > +
> > +  "^mediatek,i2s[0268]-share$":
> > +    description: Same as above.
> > +    pattern: "^I2S[13579]$"
> =

> Rob's question is still valid - why these are not phandles?

So, instead of having

	i2s9-share =3D "I2S8";

on the DT, you want us to have something like this:

        afe_i2s8: mediatek,i2s8 { };

        mediatek,i2s9 {
          mediatek,share-clock =3D <&afe_i2s8>;
        };

Or do you mean something else?

It seems like a lot more syntax to express the same thing (and the empty no=
de
seems awkward), but if that's the DT way, I can change it no problem.

> =

> In any case you miss $ref.

Indeed, sorry, I'll add it in next version.

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
