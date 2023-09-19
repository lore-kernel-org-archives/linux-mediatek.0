Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90123CD5BC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 14:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMykJCQlkdtke1jV1HRdImSUTkLSJsXVxgTZNCPIZuo=; b=3xT5YHtcL7xBd9ikVfKmSV6yDP
	T4qPjVWyc/vbInSJdRWUE9i97x7NHzR/xl4tSTPIXaarLeuTKo2wtMODMEi1uP5x94r16cS9+pRPZ
	PDjHfT/DDZrWWtIKFvrEFnri9gW+Ey1eRHvjRAgUZQ84VNjadciUYticn6M/R3liELJ9ioo6F/5GM
	ct3w6R9awhPQxVHcpB92/AKQf1HVddZT5OfYsaZuKSGl1Wgkw97v2b9iuhqJESJ+jXtZNyKOkSVn3
	MBiQkzRY3w4xcqc1gKxf81kF1cg7tBBdInq2v8JpZ/4CB18uy/IFXyFAOY3v9TsAqrcHBF00lPh53
	Z07SZTgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qibOE-000br2-0G;
	Tue, 19 Sep 2023 14:07:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qibO9-000bq3-0c
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 14:07:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695132458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMykJCQlkdtke1jV1HRdImSUTkLSJsXVxgTZNCPIZuo=;
	b=YdlW2ba2I7NSmtpcmE4N3hq/maXNiZLFdq+Cg32QtRTa94BkLSQODqyQIvBjMt1PJQL99p
	ayxKBu0imd7omdO52xm40kXbrsOK15yFJ/sxrfzgAQZ+vRX9kqrCUx0oyIaUqkigKhIzJD
	mh7tm8NTEMbkIsn+QxjwAjbpmAxsFI4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-i1qOushbN823mR0k4hiOig-1; Tue, 19 Sep 2023 10:07:37 -0400
X-MC-Unique: i1qOushbN823mR0k4hiOig-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9aa1e8d983aso131294966b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 07:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695132456; x=1695737256;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LMykJCQlkdtke1jV1HRdImSUTkLSJsXVxgTZNCPIZuo=;
        b=eFf6nH1JRTS5PmSYMW/y5XI61e03OMBjlrBhd8ZiQW8/2HvXPtr6cX1FGtQ8aUfZ+v
         3uZZIpDGKFr8hUUH+oeomXZpvMLVtaOpnJVQEFPEWj93iDdqHa4usH03+3c9wuhUk2BL
         FSIoHBqdTLbzpsdOIwBrPh2edOtl704IqbwaiA28TJ78I5emiSmXzTATVJYafP5b0FZm
         CX+1jvAHhqAUklsnvYLqfSdRO9lR4cdRl0o274wy1+XbhwO3pcQM5vgbUOC/PItO0f0D
         D0UAWPD1wPW6jU0BIzAP+mel/mpoolTSn2rFn9dDQk9jGH/MXIJ9G+p1OlCIvKTRf9MM
         x4Eg==
X-Gm-Message-State: AOJu0YzRfAqRZN7Soznf3AHaXGTHwz/wV9m7SJ+d1M4mm+nsbc0eRi9S
	SCx/gEGe1vX5gtV11/AVJ5vstxMbrTzGZjVbngzpUzuYM8nzwtJCWbZyiCxt3T43gD2re/8XVWT
	bQaZ7wIFyXsIZtOePbp7UX0HFZ8bW+3kh
X-Received: by 2002:a17:906:74ca:b0:9a1:eb67:c0d3 with SMTP id z10-20020a17090674ca00b009a1eb67c0d3mr10338002ejl.4.1695132456045;
        Tue, 19 Sep 2023 07:07:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENFS4cpAX8S6AwUFpq/x09AJbWBVQNwDPOx+C99DIJFQmc2UIwUgdKqqVnaAY0+5cwFRnW1g==
X-Received: by 2002:a17:906:74ca:b0:9a1:eb67:c0d3 with SMTP id z10-20020a17090674ca00b009a1eb67c0d3mr10337985ejl.4.1695132455690;
        Tue, 19 Sep 2023 07:07:35 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-241-221.dyn.eolo.it. [146.241.241.221])
        by smtp.gmail.com with ESMTPSA id fi8-20020a170906da0800b00997e00e78e6sm7851723ejb.112.2023.09.19.07.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 07:07:35 -0700 (PDT)
Message-ID: <6243f8f6b0e110ba48a9e6e974ea3de875857f49.camel@redhat.com>
Subject: Re: [PATCH v2 net-next 09/17] net: ethernet: mtk_wed: fix
 EXT_INT_STATUS_RX_FBUF definitions for MT7986 SoC
From: Paolo Abeni <pabeni@redhat.com>
To: Daniel Golle <daniel@makrotopia.org>, Lorenzo Bianconi
 <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, lorenzo.bianconi@redhat.com, nbd@nbd.name, 
 john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, 
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
 linux-mediatek@lists.infradead.org, sujuan.chen@mediatek.com,
 horms@kernel.org,  robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 devicetree@vger.kernel.org
Date: Tue, 19 Sep 2023 16:07:33 +0200
In-Reply-To: <ZQg2AxAIxkadOiIr@makrotopia.org>
References: <cover.1695032290.git.lorenzo@kernel.org>
	 <ebde071cc3cc9c35b00366c41912ee2f25e5282d.1695032291.git.lorenzo@kernel.org>
	 <ZQg2AxAIxkadOiIr@makrotopia.org>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_070741_333774_F88E40B1 
X-CRM114-Status: GOOD (  11.18  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2023-09-18 at 12:35 +0100, Daniel Golle wrote:
> On Mon, Sep 18, 2023 at 12:29:11PM +0200, Lorenzo Bianconi wrote:
> > Fix MTK_WED_EXT_INT_STATUS_RX_FBUF_LO_TH and
> > MTK_WED_EXT_INT_STATUS_RX_FBUF_HI_TH definitions for MT7986 (MT7986 is
> > the only SoC to use them).
>=20
> Afaik this applies also to MT7981 which is very similar to MT7986.

FTR, I read the above as this series is going to additionally
support/work fine with MT7981; no modification asked here, fine to be
merged.

Please scream loudly soon otherwise ;)

Thanks,

Paolo


