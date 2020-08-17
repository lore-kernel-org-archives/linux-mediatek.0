Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B72C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 21:19:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D25620674
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 21:19:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RSotT6qI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D25620674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=koqTW0KuiWZZIILbmTAJyJ4sRXCCU8Ax0cOYJzioYc8=; b=RSotT6qIDlX9lXnTOlHvtqOk/
	qXoDELaifR7Ut+vn9HnzXR8gSQvK0Sjk68B99jyObLOv8Ti01Qe60GCjdM6yjEbfo9RiAD5ZtH+/P
	021w61sR/IDo6mGsUm/NnGFs0Wp7+WOuN4GYRGNI6Mxc8m+EMxq4erTAjLMfh8WzLou5NhhOz4JJ8
	HWgmJm5TMqYH8yJYR1wuTR2wCV9UKIl/VXjAFLSvhHJ2H01V5MF23ZrEg/nzG8N+SzT31cHNYF3GE
	6b+/qaVtuX+5eJumNzS1H8+8/7cAmjoylFOXEa/qvbYEtgO7PqYfpfXbtXwOE+l1J3H71PbD1EUbL
	9l0gm2gGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7mWv-0003Zx-Pu; Mon, 17 Aug 2020 21:18:58 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7mWr-0003Yj-Hp; Mon, 17 Aug 2020 21:18:54 +0000
Received: by mail-il1-f195.google.com with SMTP id 77so15781792ilc.5;
 Mon, 17 Aug 2020 14:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=geakMjJ0wC5hy5d3euSCjFu1HAbmBgNytwcQ+UliUsk=;
 b=Ciht3oFk1BVUx4T5sMJekrMHI7A0L3FE+T2A9HSabCjmFmoIv5HAM2I8BWpTSnQ1ew
 8mt0TZVRVypvk1VjA3RrraWFA61UBsR1j/Amycy8FvqQ7Pisx27+ky+rVqZVofTbbN8c
 Y7CRfNnnTp76YOSievLXUDRXnYpkISAWfthHFyaWnio/pxP6anhPRcFxemRfkAryuwZd
 jpfDB2OUXq0cPmQX5iYoge7lR7fy95Z19KUk+sj/dR0wP6cnV76M/38U34tzixkfbseT
 HKgIx/LY6AkKorx/f5tp+E5zx8DaBpD3JzRLJjUSj5WNWjgOxSpRe1LjluyCZwPbiEx5
 IlpA==
X-Gm-Message-State: AOAM5311QFaBKw2ogTJjBREP1FrJ7YhWcDgNExaRsAo2JEw5+xs//pRK
 fPfwiExdPGzBq8cZJLWd3g==
X-Google-Smtp-Source: ABdhPJzgYo1j7hVzM+6ZhuRDNmWl1GrhNDq9PAyoWLoOxviTDWJK7503lqqSnTedMJ9QvkwK4yUYKA==
X-Received: by 2002:a92:cbc1:: with SMTP id s1mr10494025ilq.248.1597699132910; 
 Mon, 17 Aug 2020 14:18:52 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id s3sm9759604iol.49.2020.08.17.14.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 14:18:52 -0700 (PDT)
Received: (nullmailer pid 1580937 invoked by uid 1000);
 Mon, 17 Aug 2020 21:18:51 -0000
Date: Mon, 17 Aug 2020 15:18:51 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH 2/3] regulator: bindings: Add document for MT6315 regulator
Message-ID: <20200817211851.GA1579018@bogus>
References: <1596445047-2975-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1596445047-2975-3-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596445047-2975-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_171853_601465_294FE60A 
X-CRM114-Status: GOOD (  12.33  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Aug 03, 2020 at 04:57:26PM +0800, Hsin-Hsiung Wang wrote:
> Add device tree binding information for mt6315 regulator driver.
> Example bindings for mt6315 are added.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../bindings/regulator/mt6315-regulator.txt        | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6315-regulator.txt

Bindings should be DT schema format now.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
