Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E3EC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 22:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwMwCnWQlAuywGhrGiFgA27josOl6UvEgGpiYfWXGVo=; b=CfU2+gMZKAELcAT4a7coUppwL3
	qKQyCg5a6U7mi53WaaqiCxyaw9F0Qh74j3r4iBW4CxUFkobgcmTBYKnln82VmBKEWbXkJrewiJqNK
	8t0SOH9biVfry9nS5f3ozhJVT41M7pflV2GWbp20qCAAsSP9z3lozbW1dNw8oIEVV049vIUB9msiT
	AwkiGpok36p4RJqcZaL0orKnQert7UKGVpVfbUqPeVrzcCzMVF81AmwvJgB8cWQRA4HqROGxHfVsC
	5U1QT2JyGOU9jhrKNuwe42X/8rMfOnX78AN3+w/I3femaZDCrg4oRrbajvUWOZsceZbySQd9jS3/B
	56ykCbkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0rv1-00BMnj-AA; Thu, 01 Dec 2022 22:20:35 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0rnt-00BLXh-1n; Thu, 01 Dec 2022 22:13:14 +0000
Received: by mail-ot1-f52.google.com with SMTP id p8-20020a056830130800b0066bb73cf3bcso1856487otq.11;
        Thu, 01 Dec 2022 14:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwMwCnWQlAuywGhrGiFgA27josOl6UvEgGpiYfWXGVo=;
        b=cdfVjIEE5sw604Y08JNh9Q0YeRPSZTNoETBjixDWHSZz+eZavofbJKwJPyyjdixa5B
         xAgEcomxxVTxjXCaasLiWQwfNhwnB4fjcx1Az5+z6pqOKXwG9Yxi1xpzTUm133MRXdPa
         yiamdU5smBwhRMDqZFRJ2dHnrOH1XkxcxkUDbKibX5I+cnaeaqtz5WzD8mhFrJ5vC1si
         PPqNIM9F2xgzsWTzk6648i9Fv4jPV10I3DFBvDXk6qE0PAq9pc7MoPj90f1KFhykOHXA
         Z6erEaDF69FkjRzuN+0/Yb/s07EKF6C2E8NzArgCil8BjNITu1DCyBb4oYqBX/A8hoFL
         kB8A==
X-Gm-Message-State: ANoB5pm/ZGJjxwpXMQJmu8JqHS9EmQgrtiHLkdh9HmLogIgwaXGoXJrs
	6CnjtouS9p7saCHJdSh+7w==
X-Google-Smtp-Source: AA0mqf6qnGCyPpu8ZDDQyAlodGCvcJQ/PCX60COl4++AlaSdXWwBZZtqAACnPpeZMYP6rl1o9Tw32A==
X-Received: by 2002:a9d:69:0:b0:66e:976:193f with SMTP id 96-20020a9d0069000000b0066e0976193fmr23732052ota.214.1669932791886;
        Thu, 01 Dec 2022 14:13:11 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q23-20020a05683022d700b0066e7b30a98bsm719976otc.2.2022.12.01.14.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 14:13:11 -0800 (PST)
Received: (nullmailer pid 1538568 invoked by uid 1000);
	Thu, 01 Dec 2022 22:13:10 -0000
Date: Thu, 1 Dec 2022 16:13:10 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Vincent Knecht <vincent.knecht@mailoo.org>, Nikita Travkin <nikitos.tr@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Andrew Davis <afd@ti.com>, Gene Chen <gene_chen@richtek.com>, Bjorn Andersson <andersson@kernel.org>, ChiYuan Huang <cy_huang@richtek.com>, Luca Weiss <luca@z3ntu.xyz>, Neil Brown <neilb@suse.de>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 6/6] dt-bindings: leds: ti,tca6507: correct Neil's name
Message-ID: <20221201221310.GA1518960-robh@kernel.org>
References: <20221127204058.57111-1-krzysztof.kozlowski@linaro.org>
 <20221127204058.57111-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221127204058.57111-7-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_141313_112707_EB4DCB03 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

On Sun, Nov 27, 2022 at 09:40:58PM +0100, Krzysztof Kozlowski wrote:
> scripts/get_maintainers.pl is confused when name and family name are
> without space:
> 
>   $ scripts/get_maintainer.pl -f Documentation/devicetree/bindings/leds/ti,tca6507.yaml
>   - NeilBrown <neilb@suse.de> (in file)

I'm pretty sure it is correct as-is.

We should fix get_maintainers.pl so all the one name celebrities can be 
maintainers.

Rob

