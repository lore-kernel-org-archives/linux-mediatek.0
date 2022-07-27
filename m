Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5925C19F29
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMfKgfMggMNo3eihisQlQcnwku84/adCCeUBHxwgFgY=; b=Dp2e50d9FsCkyp8eqAmY7ZwTxR
	VKizQP3feJ1vcoj3y1zOOMWuIOoycuAcDSvka6rKXylx4rIjgVJ/yaguNkNUrF9bN7hz6zw+UF/rK
	6d2MuCSj1m6E7cAx1V/7WdRDFa+Wjj0H96OJ4x9y1DKAf13cjzDhsTlypDzhCAkd2tMne2WkZz2+z
	Pc5P5BUEihPZowh5chad788JVEc6CNytQakwvlYswPtUdEahNTgMkT+VIHk4fs699eT8Tdk8oguVJ
	H278+R+bW9JQFeb2EeP/8ZBtev0Nrr3TlEsLPVIb1U4sjMCY3XkdOafGTELQvy87PL2jBvc+ikAIR
	m8/s/eAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcwb-00BVQ4-12; Wed, 27 Jul 2022 09:03:05 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcwP-00BVEZ-08
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 09:02:54 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-31d85f82f0bso168141767b3.7
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Jul 2022 02:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lMfKgfMggMNo3eihisQlQcnwku84/adCCeUBHxwgFgY=;
        b=AVctTuCDLV66HgOOebgeRV0S1c8FJndDasQlXmmcLGkjwPJsXQhTimeMepc3Vj4wqO
         pdTiIh44L7gXx816XA0kVVCujErNu5wfVFJbs79Lin6dgfieUxrgLZjAxSpBt6TkOIU8
         eKjmpPmUdgob41bpl+2pj8RQEfmF2NdaPc95fauCu/bAWIKMgjWLsEcfPx5ZcLB7NpNt
         Fnk0ygntA2pshSJrbCspJh36vwLl61Q2ga4JTo5x9MBOQ8IWqkuZ98nV61I0Pfh6rFBl
         SDwDF/br+DhrVHUmzLqHoD9XbGuwyWKd1mc54eDSrIZZRBj8WXbRAya0F1q0kWusr2mD
         MoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lMfKgfMggMNo3eihisQlQcnwku84/adCCeUBHxwgFgY=;
        b=DKOk2yqE3kOgh9qZhMR7IHkgocDwgXl3rY+ZFAftRLJitGPWuPSb4wbBNG+vc9QNG8
         8qNpiUO4HZ1dRrV28x3C0VW5qYWA+fHSIBYUeDNJBeDeOzrLNBk37ic6m2aRJB7fXL5B
         B1WIszpj7AEzyNGaPxKvLKX63tT60ehPR0lx04vCqrj/mZMhs1MZHUkptvYTjQh9LTbe
         m+2+ls2rpo7wBpVtWnYnvi9dfIqg2PyIlLNUvfblz9WImlzbvr97KMo2Ok5KNjooEitl
         RAH2s//Mx+J8fX+yddies74a0m107iN9KN9UzfZEl+GaiomGhFoWey39N3Yk1us49iyR
         Ydrg==
X-Gm-Message-State: AJIora+f7ktaTVHVbmFQ8/uOo7IlDj6/UGsB3B0jig5s1ateFAHg+je+
	THZHstb3KZli0A4BeFfwjnaQOAvqhcF7QPwV1HZdCw==
X-Google-Smtp-Source: AGRyM1vHX+qKTMq6tfqznzj4BNItgMsLSP5R9D+chOdqP/40r06PtcoFkng2x2B+2afSmTdaPGf6uhJXJv31xOyY2sk=
X-Received: by 2002:a81:ad60:0:b0:31e:68a9:be1 with SMTP id
 l32-20020a81ad60000000b0031e68a90be1mr17834847ywk.244.1658912567588; Wed, 27
 Jul 2022 02:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220726135506.485108-1-bchihi@baylibre.com> <20220726135506.485108-3-bchihi@baylibre.com>
 <1658866142.328871.782232.nullmailer@robh.at.kernel.org>
In-Reply-To: <1658866142.328871.782232.nullmailer@robh.at.kernel.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 27 Jul 2022 11:02:11 +0200
Message-ID: <CAGuA+ooAHSvFAQC4mg7inOXO_bLvZv5Req=vm3PE6Pkjtf_vsA@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] dt-bindings: thermal: Add binding document for
 LVTS thermal controllers
To: Rob Herring <robh@kernel.org>
Cc: rui.zhang@intel.com, rex-bc.chen@mediatek.com, daniel.lezcano@linaro.org, 
	amitk@kernel.org, mka@chromium.org, linux-kernel@vger.kernel.org, 
	abailon@baylibre.com, robh+dt@kernel.org, p.zabel@pengutronix.de, 
	matthias.bgg@gmail.com, linux-pm@vger.kernel.org, rafael@kernel.org, 
	khilman@baylibre.com, fan.chen@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	louis.yu@mediatek.com, james.lo@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_020253_053560_C73D8257 
X-CRM114-Status: GOOD (  17.47  )
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

On Tue, Jul 26, 2022 at 10:09 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, 26 Jul 2022 15:55:02 +0200, Balsam CHIHI wrote:
> > This patch adds dt-binding documents for mt8192 and mt8195 thermal controllers.
> >
> > Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > ---
> >  .../thermal/mediatek,mt8192-lvts.yaml         | 73 ++++++++++++++++++
> >  .../thermal/mediatek,mt8195-lvts.yaml         | 75 +++++++++++++++++++
> >  2 files changed, 148 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml
> >  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.example.dts:32.36-37 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:383: Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1404: dt_binding_check] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>
Hello Rob,

Thank you for the feedback.
I'm updating my dt-bindings check tools, fixing, and I will resend ASPA.

Best regards,
Balsam.

