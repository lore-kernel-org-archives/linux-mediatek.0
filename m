Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290B0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 14:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VW8XYYZih3noYqWD0jAOw/zs/zqrve4tTX7cG34SKpg=; b=qeeMObBC+a6kQ1
	mc7qbkxWY3fALSs0xzFB7nQLGuIi7KO5m79QXVTBNAcQOL7yc2ctfVWbGThKGOyN6pJPch86iZWsX
	lMBjH7UOliSYL2VzIzmCxWl0Tvsfu7Uq+u4PwllH0o080YoM8/mFdSAnbaQFK6L/BY3MjsNyicDks
	nUpvIJqiUxR1n/fB04ey+XWVH4EM6ab0C13O6dB/5nhUxY80CqD/AN9ZfEIg0z+RnPZPPsS7wK3Oa
	2gX4IMvBJ9WGxImXKaLGq+qi2nJUXRLiddrtts/14gM/4fWFV8CbepsLrz/X5hpmebHVIPVOQGRef
	rPTqsHQMIp3UQtyHMQyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqbuW-008Pyv-Hj; Mon, 16 May 2022 14:41:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqbuK-008Puy-V8; Mon, 16 May 2022 14:41:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 674151F42330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652712069;
 bh=8BYTLgL7DNJMJHGxPDAPccqtEpDPhR7Z3zFk1UgBjIc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fsXq9RO5eqw/T8yDtZ9lIbJ1TmFcfGOYBVOnvXCQYo0FpkwjkzWr5K+eQFZnBaOml
 fCBWcoMOeljiNkSas8UyyJqbj9Vz4AXbYnjHK4NwYb5+78oRZ08JyAVGl7QauMJhrU
 IgX+OQu/IdZFaguIkyeI51Ze64t86HjO4TtIScPoxQMA7fzBFejhchi6hmCthMzN9I
 Qfv3Zp8wjs2O+E4uYet8U58e1c4I/HZowCndnSyi2NyVXe2RAfZA8FEHinx9g55Ayd
 h7sA3v5xQYcifDGKTfi9yXTQdqcF8tkMoAFWlG8uAYxFsL9PL5dENowgbelKhL5X2j
 TzGD5vVwGGNtw==
Date: Mon, 16 May 2022 10:41:04 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
 Tzung-Bi Shih <tzungbi@google.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: remoteproc: mediatek: Make l1tcm reg
 exclusive to mt819x
Message-ID: <20220516144104.yvy2a2lncdcgznu6@notapiano>
References: <20220511195452.871897-1-nfraprado@collabora.com>
 <20220511195452.871897-2-nfraprado@collabora.com>
 <30978e5a-18ef-3ea2-8df3-3ced50f44bfc@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30978e5a-18ef-3ea2-8df3-3ced50f44bfc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_074113_168177_CDC64BF8 
X-CRM114-Status: GOOD (  11.31  )
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

On Fri, May 13, 2022 at 10:15:51AM +0200, Krzysztof Kozlowski wrote:
> On 11/05/2022 21:54, N=EDcolas F. R. A. Prado wrote:
> =

> Thank you for your patch. There is something to discuss/improve.
> =

> >  =

> > -if:
> > -  properties:
> > -    compatible:
> > -      enum:
> > -        - mediatek,mt8183-scp
> > -        - mediatek,mt8192-scp
> > -then:
> > -  required:
> > -    - clocks
> > -    - clock-names
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          enum:
> > +            - mediatek,mt8183-scp
> > +            - mediatek,mt8192-scp
> > +    then:
> > +      required:
> > +        - clocks
> > +        - clock-names
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          enum:
> > +            - mediatek,mt8183-scp
> > +            - mediatek,mt8186-scp
> > +    then:
> > +      properties:
> > +        reg:
> > +          maxItems: 2
> > +        reg-names:
> > +          maxItems: 2
> =

> Isn't l1tcm required on mt819x? Now it is left optional.

Hi Krzysztof,

actually l1tcm is optional for mt819x, as commented by Tzung-Bi on v4 [1]. =
So
that change was intended.

Thanks,
N=EDcolas

[1] https://lore.kernel.org/all/CA+Px+wXQjys8xvTSSJkLXoGp4yQnANbKWBtfuxiYi0=
UX6DH0jw@mail.gmail.com/

> =

> =

> Best regards,
> Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
