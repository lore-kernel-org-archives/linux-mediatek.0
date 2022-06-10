Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6AEC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 18:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBf8gEgndP2P6cSK+Qpz68QXSY4LK4tsFU7CnFfaRQg=; b=Ut+jHsfpCvvIzb
	tIodHd2T33LdFk7ypo4Iy3al+vrHDR+QtbSTCyvZBEn6+jMJsdGP3Lru/zrZJcgZ6gIgLdt3XQdDd
	Mpb+pJpi/idDn07TJAAYzE0JOU+naHodEvPJ6Zldk1SJrEUj32kaqpqFlv7GLmHpgpJ24WzLzulSB
	3V/0XqlKSqPcA5fuKhhQpKo0pYcfyrXo+3kL6lRPmyI6/+qK9wYnl35E5bkREdiR/RKKvgK4/kG8R
	dkxozioHb4fzvQPVkXb/i1OmFKOt3Zb2OQz2JwGIjFzWUNFybMH7HgZRyfGHSvWEng1GEPQvNYG5d
	AMZG5KzUtONAmnWECUaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzjEE-009KsZ-Fy; Fri, 10 Jun 2022 18:19:26 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzjEB-009KrA-G6; Fri, 10 Jun 2022 18:19:24 +0000
Received: by mail-io1-f45.google.com with SMTP id e80so4639550iof.3;
        Fri, 10 Jun 2022 11:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dUVF+4savVVo3Zk/eVEnxhnMTrHMPg1cr6NzLhj4vPE=;
        b=6xDzB9Zqx9r3eoYKTgFqjJWRqdpA60ajglwjv4y9IGPc5VF9eKNEMMBCabUf1XSVOr
         EKaznlEuI+UeMhXp47tBQ+LcVJmJyFiSew6mDuUzuPwtjfOhwuoXhtAqVJzFQ/4yTWS8
         jFjKpNvZkhqsOOWp5d0M9SrE8LgzrSDVMisks1EJ6dLRdBvmjEBRAODAyR/sHIeUkQJM
         yKvzSF8jrX8vI4aZJnAywfE9bVUppqn/G/QHqAJ2ak77CCkkUFHABn8q6Sn2/BoqnJ3J
         78UVmSRT4OzIkIUbaf+iW/deNsJzeDsGNdMqlUgCfF/lcTY4no2VwGL2OHctFFZefXxu
         yAVw==
X-Gm-Message-State: AOAM5339gVFxV/pRDZdjZiOX7q4nkLKzyewwIy/ijJAtTgxoz6ic046T
	qDy7uWEWFvOue86SeL5Khg==
X-Google-Smtp-Source: ABdhPJxNF8rT+2V+EVqFx6lCZs1qfmv2YXD719wGMasOLQ6Bqd8aEkKG60Ov+gx5p10DfI9FIfzDnQ==
X-Received: by 2002:a05:6602:168d:b0:669:8613:abd0 with SMTP id s13-20020a056602168d00b006698613abd0mr8616182iow.48.1654885159997;
        Fri, 10 Jun 2022 11:19:19 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id g23-20020a02bb97000000b0032e1e0ac289sm11301883jan.8.2022.06.10.11.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 11:19:19 -0700 (PDT)
Received: (nullmailer pid 1935336 invoked by uid 1000);
	Fri, 10 Jun 2022 18:19:17 -0000
Date: Fri, 10 Jun 2022 12:19:17 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mediatek@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: pinctrl: ralink: Fix 'enum' lists with
 duplicate entries
Message-ID: <20220610181917.GA1935073-robh@kernel.org>
References: <20220606212239.1360877-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220606212239.1360877-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_111923_576579_66346C1D 
X-CRM114-Status: GOOD (  11.81  )
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

On Mon, 06 Jun 2022 16:22:39 -0500, Rob Herring wrote:
> There's no reason to list the same value twice in an 'enum'. This was fixed
> treewide in commit c3b006819426 ("dt-bindings: Fix 'enum' lists with
> duplicate entries"), but this one got added in the merge window.
> 
> A meta-schema change will catch future cases.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../pinctrl/ralink,mt7620-pinctrl.yaml        | 26 +++++++++++-------
>  .../pinctrl/ralink,rt305x-pinctrl.yaml        | 27 +++++++++----------
>  2 files changed, 28 insertions(+), 25 deletions(-)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
