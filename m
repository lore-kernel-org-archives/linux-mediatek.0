Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D68C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 15:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dImyyYt/fJc1c8/UHf2weRseYb46i1XjiNtcVekQVIQ=; b=HlvXIsBSZ5Mf9y
	YvCnkFyGShgW3BqWQdTNaacsktpq/D82AMa6xldfQIgUXK8VVodc5nBTWW0F2Ka/kQzmwBdVVVXA2
	b2xmJY2Rk2squeW6fPYmqJzu00QyY/sqXg57DI5mdWsfPbX0DiYU1Bble7fSon18Hy4yHRfA3gMLs
	Ex1e+bhTg9/zux/tzyNr0p1NRP/utj5S4uUUVR31P6pc7gsxV+sVepU6ZWmgpxWCzOFydE1tiD/9W
	esEQPlE3bEZWI+hr3K5J8kM8zgaHw9fm+cq41Oi2/rhGR1pX61R5IvC9OubW7m9yd8ymkPnKlZf02
	TAOqS6hmSuHEifYgpl7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no4yl-00F0Fc-KE; Mon, 09 May 2022 15:07:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no4x1-00Ez8f-6I; Mon, 09 May 2022 15:05:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 9355F1F441A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652108725;
 bh=jwx7aoAOlo/IJzWJjPvpl/xGpjbHcHsD07r0sZmj1yw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n/4nJIvMOj5TT2NzwztqbxeysgjE5CI478h4wmebsMpDRzoIVTxsDchO+oiTYWCiI
 Bzg4sk/GWak+7NvQQ42YzSfavD5nj0lANWuukpPi+bepSoaSP78RTUbh/uZB1XC4kN
 aLQld3NcAGSH55Sc67tAAZBAmAJybBE6JktNuTKhLRJgJNHeqW9q7jKCbGT+tTZ9Wg
 CdoTa1kCmp49YK82c/w4GWdbvHVh3ctGY54Yx421gzvUqlEKfPi0Zl83OtvsqsQak1
 RaPU151VNrRhR2Aoe+NfL8U/7vR+VMqVvc/jqe8JsKUyzuojOiE0Ma5Pw2MTWcOCOY
 nuW65r2mHlW3A==
Date: Mon, 9 May 2022 11:05:17 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: remoteproc: mediatek: Make l1tcm reg
 exclusive to mt819x
Message-ID: <20220509150517.ij5lev2mlcem2epx@notapiano>
References: <20220506213226.257859-1-nfraprado@collabora.com>
 <20220506213226.257859-2-nfraprado@collabora.com>
 <CA+Px+wXQjys8xvTSSJkLXoGp4yQnANbKWBtfuxiYi0UX6DH0jw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Px+wXQjys8xvTSSJkLXoGp4yQnANbKWBtfuxiYi0UX6DH0jw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_080531_492167_4F8C18B3 
X-CRM114-Status: GOOD (  12.05  )
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

On Mon, May 09, 2022 at 10:27:18AM +0800, Tzung-Bi Shih wrote:
> On Sat, May 7, 2022 at 5:32 AM N=EDcolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          enum:
> > +            - mediatek,mt8192-scp
> > +            - mediatek,mt8195-scp
> > +    then:
> > +      properties:
> > +        reg:
> > +          minItems: 3
> > +          maxItems: 3
> > +        reg-names:
> > +          items:
> > +            - const: sram
> > +            - const: cfg
> > +            - const: l1tcm
> =

> "l1tcm" should be optional.  Does it make more sense by using "minItems: =
2"?

Hi Tzung-Bi,

thank you for the information. I did notice from the driver code that l1tcm=
 was
treated as optional for mt8192, but since I wasn't sure if that was intende=
d, I
kept it as required for the mt8192/mt8195 binding, since making it optional
later wouldn't break the ABI, but the opposite would.

But yes, since it is indeed optional for those platforms, I will lower minI=
tems
to 2 for them in the next version.

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
