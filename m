Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02962C00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Aug 2022 18:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcQlkqf3w+uIY1hqigVt5yrj9Rka522hQZXJqkKj/Yo=; b=CcoRZh0GOhi8pM3ViYZjscLjpi
	/bNPnb+xOUZu772/FfnH/g5XgDZr+lTD6kAkF46T9O9LZZWEzGOmqRiw9bkCrlBjYtNtyJy5ztF05
	fkF5O1p/LRi9m+3hw+jPRV3jbas6/2JtGeUwDVpyicMlAv2EuWA4teKlR98Dr0FhI/etF2Ux/+JXf
	AnTCu7TnXHy8f7WXXqTZmkCswjIyIC7D622GF3nEmv4pMA70a5KNDooqQeqkxKq+H/fYIElQ9JJol
	4QYAogiKjeAuHEICrhrJLxmgDCorSNQHxmYdVae+I0ab9VXWtTbY0DiAeZMHiz0/QzEFbp3XBm1kJ
	JfLIb9Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLqP2-00Ditx-PR; Wed, 10 Aug 2022 18:26:00 +0000
Received: from mail-il1-f169.google.com ([209.85.166.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLqOM-00DiYn-1x; Wed, 10 Aug 2022 18:25:21 +0000
Received: by mail-il1-f169.google.com with SMTP id l9so8739065ilq.1;
        Wed, 10 Aug 2022 11:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=LcQlkqf3w+uIY1hqigVt5yrj9Rka522hQZXJqkKj/Yo=;
        b=UIEJktmvVY2k6emHRTxPw3KEklqKJCORmuxVL5ys7HINXBaM4G20fDm5KK8I2r9JEM
         tNtR6T6X/ozdsaimiVbjT+Q2ngvcAc6qeU1C/orJHdsBt7rFgpbvJezxoEmSAMGID4tL
         0x7qNP3UmZZ+yZxkis89ikMEbZwbYVSMQVVfsiyqkITlDl9SmWfLfoWPFtymT3UkvYhg
         phIlldfhgq+pjaGFyXaxvNk9Lrt0cFf09uVU1kVFDLjaZe2OAaPUKk9LZcBZz8d8XAI6
         3huemsbRfIFF6aF57U+1D3NLhOICgkbY+jGf8oJ0Y3JBXE3O6ZNSRCfme8YWielhJlc8
         UenA==
X-Gm-Message-State: ACgBeo1xzg0TGDY8LF2jTMs9lpcduPwEO0vFY1SUQCw8peEpFEMHZskj
	MISILbEUNYKRfjesgGg3AA==
X-Google-Smtp-Source: AA6agR6jsK6nG3HUQzekRN9Nqy2jzQ7PkAEWz/oZpXSHCY0PiPtK7n6zQ5qeD1OMCuoI795SMDoP8Q==
X-Received: by 2002:a92:cd89:0:b0:2de:553f:bd9d with SMTP id r9-20020a92cd89000000b002de553fbd9dmr12977061ilb.179.1660155914296;
        Wed, 10 Aug 2022 11:25:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x13-20020a056638160d00b0034347c6183esm555507jas.92.2022.08.10.11.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 11:25:13 -0700 (PDT)
Received: (nullmailer pid 286879 invoked by uid 1000);
	Wed, 10 Aug 2022 18:25:11 -0000
Date: Wed, 10 Aug 2022 12:25:11 -0600
From: Rob Herring <robh@kernel.org>
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: rui.zhang@intel.com, rex-bc.chen@mediatek.com, daniel.lezcano@linaro.org, amitk@kernel.org, mka@chromium.org, linux-kernel@vger.kernel.org, abailon@baylibre.com, p.zabel@pengutronix.de, matthias.bgg@gmail.com, linux-pm@vger.kernel.org, rafael@kernel.org, khilman@baylibre.com, fan.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, louis.yu@mediatek.com, james.lo@mediatek.com
Subject: Re: [PATCH v8 2/6] dt-bindings: thermal: Add binding document for
 LVTS thermal controllers
Message-ID: <20220810182511.GE200295-robh@kernel.org>
References: <20220726135506.485108-1-bchihi@baylibre.com>
 <20220726135506.485108-3-bchihi@baylibre.com>
 <1658866142.328871.782232.nullmailer@robh.at.kernel.org>
 <CAGuA+opZSoWLZ62tZMdA1GoUe7N9K8DV19AUAophCQpr6rNH9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGuA+opZSoWLZ62tZMdA1GoUe7N9K8DV19AUAophCQpr6rNH9Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_112518_139677_0FE61355 
X-CRM114-Status: GOOD (  23.80  )
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

On Fri, Jul 29, 2022 at 05:15:01PM +0200, Balsam CHIHI wrote:
> On Tue, Jul 26, 2022 at 10:09 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, 26 Jul 2022 15:55:02 +0200, Balsam CHIHI wrote:
> > > This patch adds dt-binding documents for mt8192 and mt8195 thermal controllers.
> > >
> > > Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> > > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > > ---
> > >  .../thermal/mediatek,mt8192-lvts.yaml         | 73 ++++++++++++++++++
> > >  .../thermal/mediatek,mt8195-lvts.yaml         | 75 +++++++++++++++++++
> > >  2 files changed, 148 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.yaml
> > >
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Error: Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.example.dts:32.36-37 syntax error
> > FATAL ERROR: Unable to parse input tree
> > make[1]: *** [scripts/Makefile.lib:383: Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.example.dtb] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [Makefile:1404: dt_binding_check] Error 2
> >
> > doc reference errors (make refcheckdocs):
> >
> > See https://patchwork.ozlabs.org/patch/
> >
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> >
> > pip3 install dtschema --upgrade
> >
> > Please check and re-submit.
> >
> 
> Hello Rob,
> 
> This error only appear when I apply my series directly on top of linux-5.19.rc8.
> But, when I apply the other two series that mine depends on,
> 
> https://patchwork.kernel.org/project/linux-pm/cover/20220722200007.1839356-1-daniel.lezcano@linexp.org/
> https://patchwork.kernel.org/project/linux-mediatek/cover/20220523093346.28493-1-rex-bc.chen@mediatek.com/

How was I supposed to know that if you don't document that in the patch?
 
> and run "dt_binding_check" again against my YAML file, it does not
> print the error you found above.
> Would you check it, please?

No. Resend after rc1 and checks will be based on that.

Rob

