Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E28AEE57D8
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 07:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72dFAJSGUagOoS+KoRkKv9gdaS3fHJdzDdjwkMM9wZc=; b=FpfugE0Z2MHoh5jISLOYRNUMLF
	vCrpx4skoujo71wRgJKv6Q/J6FAEQsoppcUw7UR8XanZzd6ccZg7e5WhQIIpeELHL7lv9BcrSCGAC
	PzcLtv1vmaszeknSHrgW1DKMolubn5YH0XAhBMwwCPHpbRCw7PsZrMjxZoFZwqT3vmKdUT6zgE0bM
	TYSA87QPtBeP73q7VSzd565bBs07JT8WpflXKmAiQDYvG9OO+Zi2E4KukKc7KL9KWUFvZ1pB7oVYS
	+g4KoekttZjTnw+tJnTsKoG39idnwYtn2Vu2j0Q/UmM5zoRo1gbhQTArw4prL1EvpcFUToCVIbFLc
	ix/FwO1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeVeT-00DDux-07;
	Fri, 08 Sep 2023 07:11:37 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeVeQ-00DDtk-0S
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Sep 2023 07:11:35 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-57325fcd970so1073079eaf.1
        for <linux-mediatek@lists.infradead.org>; Fri, 08 Sep 2023 00:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1694157092; x=1694761892; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72dFAJSGUagOoS+KoRkKv9gdaS3fHJdzDdjwkMM9wZc=;
        b=DKr2zTL3xiDc+rKY1WEAMpMhDBnCH+0L5CemnmY8cLroR2q+zNyqtAza3i4v5VBKlI
         YLHNepqUTjbYZIRaDKwDlZALqxFWLDXZUVfIRGm1gFBSurbDOdqU/rxIWeCPTT0GJfFo
         u/iYJHNompcc3auk2gvzqkJ9JQRGfS7aeuEq5Ek+U34+u9UZq7iz70FWchTvdM9uXJFp
         wq0XGjebs0BB8vtpM8p2q0UUWDCqm+xdNZZ7QCQYbR6kcjURzBP8FEi2tHvKuHMytGrm
         SK0x2pkNp74FavBt7Ao69Hb+cs/LnAjeR+CKnHRdUFLBNElIY6M0I1CfhmddZfHMhVJ0
         3AGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694157092; x=1694761892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72dFAJSGUagOoS+KoRkKv9gdaS3fHJdzDdjwkMM9wZc=;
        b=UT9rPqZzPmP3VZAtLv75bQuKtgl51rr3dTjr+3jLOENGbYk9TwjFwmwi5kRGIVF1Bt
         9XUYu3+rkC+IMgYib+BOm3WqentZMxZ1UfHyV7kaic1+jDieUjTdHS890VxBKxnEveKz
         JEtSY8QaJsLKYRNZWSz20bCpBOQ94kVGdxULD6FXiou3Y9rcPbyiNtNhD3oZIcMRbFJV
         Moq6+y/d05cPRDx/psMuAulr/tSg9Sthu2HN6wrvPlPlRGIAh8dN+SAtKwRrT/d8GfOX
         OQIzbK7O8asVeSaISXgDtT3ERC2T9Q3M4xh9fNExnmkH3gJ4ZIE2327xm9nW3w9n3YeX
         N5Hg==
X-Gm-Message-State: AOJu0YxNY2hg18yD262iXYfK1y6FSZ5wrDlyrtJf6fHrHRFwUqz2Ym55
	eX6jg6l+9EjMqpYDbXpcDj6ACAg8BVvrsBMGcXFybg==
X-Google-Smtp-Source: AGHT+IHh32vWOCqQk/yQ9vH2Sb0yomFK9N4t9UhZFg7t2QpHtDnkNUivzN5mBR/6w4hKnCmTQPTcpXSzn8v85vYLPUk=
X-Received: by 2002:a4a:6251:0:b0:570:c0c3:8319 with SMTP id
 y17-20020a4a6251000000b00570c0c38319mr1805993oog.3.1694157092101; Fri, 08 Sep
 2023 00:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230908061950.20287-1-hbh25y@gmail.com> <20230908061950.20287-3-hbh25y@gmail.com>
In-Reply-To: <20230908061950.20287-3-hbh25y@gmail.com>
From: Marcin Wojtas <mw@semihalf.com>
Date: Fri, 8 Sep 2023 09:11:20 +0200
Message-ID: <CAPv3WKe3=RDzcp60KdX8Ew8DF=E1Uqgjr1LWQXsgiOdNuDTxSg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] net: ethernet: mvpp2_main: fix possible OOB write
 in mvpp2_ethtool_get_rxnfc()
To: Hangyu Hua <hbh25y@gmail.com>
Cc: justin.chen@broadcom.com, florian.fainelli@broadcom.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux@armlinux.org.uk, nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com, 
	Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, maxime.chevallier@bootlin.com, 
	nelson.chang@mediatek.com, bcm-kernel-feedback-list@broadcom.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_001134_181235_ECA2126F 
X-CRM114-Status: GOOD (  13.32  )
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

pt., 8 wrz 2023 o 08:21 Hangyu Hua <hbh25y@gmail.com> napisa=C5=82(a):
>
> rules is allocated in ethtool_get_rxnfc and the size is determined by
> rule_cnt from user space. So rule_cnt needs to be check before using
> rules to avoid OOB writing or NULL pointer dereference.
>
> Fixes: 90b509b39ac9 ("net: mvpp2: cls: Add Classification offload support=
")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
>  drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/ne=
t/ethernet/marvell/mvpp2/mvpp2_main.c
> index eb74ccddb440..21c3f9b015c8 100644
> --- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> +++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> @@ -5586,6 +5586,11 @@ static int mvpp2_ethtool_get_rxnfc(struct net_devi=
ce *dev,
>                 break;
>         case ETHTOOL_GRXCLSRLALL:
>                 for (i =3D 0; i < MVPP2_N_RFS_ENTRIES_PER_FLOW; i++) {
> +                       if (loc =3D=3D info->rule_cnt) {
> +                               ret =3D -EMSGSIZE;
> +                               break;
> +                       }
> +
>                         if (port->rfs_rules[i])
>                                 rules[loc++] =3D i;
>                 }

Reviewed-by: Marcin Wojtas <mw@semihalf.com>

Thanks,
Marcin

