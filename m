Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A73C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 22:59:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB2A2239ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 22:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB2A2239ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mSYfIdMbb9RAmW5U5CSUfjB3slNdFqsLcypJ6R1L+mQ=; b=Xr//86Yx0EjAdLhVQHZdVln/+
	2TOEs/LE0NR7pdDDTgw7Qt6y3LeRUx4ztp4e2Wn58n3b77AKxv2PMmyI8soKUsbQsGh9N2GY2UCMf
	/Bw0+hwYbvvAqxG0KSrBfmrFCQH5NcGTsMYFy7BuijXAIgBshZrekIIimD7sdKhArUyTYKpKgqez7
	tlSi7KgZJ77izQgXGffIsqZyrDLHBZ3sf6zT4APrvX6PAtSGAjnhs0reUQ1v2ce+ih80xo1nYt/2v
	UbEMaOCuOH0aSDdSmsaLXynq+WDokWWQwMGsWb8XXtllFenJ0w/OLhJ4XLkhh3YrmQrsozMPyov8n
	DqRN2go/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmPTB-0007nt-LZ; Mon, 07 Dec 2020 22:59:01 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmPT9-0007nE-Jp; Mon, 07 Dec 2020 22:59:00 +0000
Received: by mail-oi1-f194.google.com with SMTP id l207so14466098oib.4;
 Mon, 07 Dec 2020 14:58:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dDAvG00SrOftyhEZu/9QMTjp5fmGYTX2yGfHUYcWWzY=;
 b=A3FlcLhcs6gMLywlheTjbwdFWE/wBVzE5PKeYqwyopLSpBjUFmb7ZLonrnPzFB4oFI
 9PTCWGmyJB5qUqoeYYDA2KMK9s12X2ab4lheafZ45JaBhlV8bXeVZ0EYzO0gC8/cnoXV
 bGu4a698QDSxPq90uL4qtcgQY0U9OeGDpSO0Hxx5gxrgXkcnvhKQnzLVTgfKPxs6c2Qc
 uibEfSOfJX5xM0DJsQ281oLIX6RrPEVF60FvcOznCZvSXxRJPbmoPvoLmxbJ+gOD10H3
 CQJi75Z9CSTm8OZsrvctZQ3LPgS7szqteo1QhhRBZm8PXnnjwaCKARSEmEyDciFqz9WJ
 7FGg==
X-Gm-Message-State: AOAM530vO/4nwImh0YbP7/OnhXjlb9Ysls4cgVgumD3WhSrY6MeOEG1o
 UNuXmz/Kfgps86XAMCf+EQ==
X-Google-Smtp-Source: ABdhPJx+ZRhYn1sd/H/ieyNhhCTI4YoNfNdq4GrSu3H1BIPquWZr7UzN5bnmTYDnd8/TDp6CMdWojg==
X-Received: by 2002:aca:bb43:: with SMTP id l64mr812393oif.52.1607381938769;
 Mon, 07 Dec 2020 14:58:58 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u141sm67076oie.46.2020.12.07.14.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 14:58:57 -0800 (PST)
Received: (nullmailer pid 1004451 invoked by uid 1000);
 Mon, 07 Dec 2020 22:58:56 -0000
Date: Mon, 7 Dec 2020 16:58:56 -0600
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 2/5] dt-bindings: serial: add the required property
 'additionalProperties'
Message-ID: <20201207225856.GA1004420@robh.at.kernel.org>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
 <20201204093813.1275-3-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204093813.1275-3-thunder.leizhen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_175859_676213_45CEFDBF 
X-CRM114-Status: GOOD (  12.79  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-serial <linux-serial@vger.kernel.org>,
 Mateusz Holenko <mholenko@antmicro.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
 Rob Herring <robh+dt@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Karol Gugala <kgugala@antmicro.com>, linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 04 Dec 2020 17:38:10 +0800, Zhen Lei wrote:
> When I do dt_binding_check for any YAML file, below wanring is always
> reported:
> 
> xxx/serial/litex,liteuart.yaml: 'additionalProperties' is a required property
> xxx/serial/litex,liteuart.yaml: ignoring, error in schema:
> warning: no schema found in file: xxx/serial/litex,liteuart.yaml
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/serial/litex,liteuart.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
