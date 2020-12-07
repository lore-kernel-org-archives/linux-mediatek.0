Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACDF2C4361B
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 22:59:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D8D9239EC
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 22:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D8D9239EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2MRN63277q2vEut5BGmLvG4Zg5feD2R7WmkBJfIxuD4=; b=Zo4Srh7f8uFcTsafih4XyaIoG
	NRXxtaSAkuheHj1jxMiE3AXprCF6Vuqt381LkJTv8OS4SERHYerrZNL7J4yj2y3pIVR6ClgPPS92B
	GkIkm3lQBRb8i8nXcprTF98ws9gwvzvyeSEaRrgzLgiHSEqr4fJ/b4f3b0qSxPBLWQIw2RLb+uDi9
	1QM8Q3MPAUWEi1mb71CN5PYNkxYcAN4wi41zWDhCLwimESLAb97YR7W6z9P4sbRu8yWCRRmEDa4NT
	hPIVrLjkhIxoJP8N2DPo58Yf9yH1s5k7Q3150DxP+KhaP9ppzBuVllEXSFsWKcJMjJH5e0LFPMaHt
	CU8+sKfpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmPTs-00083P-Ti; Mon, 07 Dec 2020 22:59:44 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmPTr-000828-3T; Mon, 07 Dec 2020 22:59:44 +0000
Received: by mail-ot1-f66.google.com with SMTP id b62so14177242otc.5;
 Mon, 07 Dec 2020 14:59:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ryKCDDAkk+LV0sbl1XJFzvGmfw+a/jMbuTJ6LeZrxos=;
 b=h40yzyzoZQ1pBqzOsVsRBg6+DaaAZifXHvHdhWXiIWvK5LSGeVAZa68hOP7/QB//zf
 odQQM8rFxVeIRpxQrUtMflgshmACdXE1lscDc58hfUVCT9V0R3laExOboXuHWiqVxmLU
 yGFmnyaADmGePzcGNBQX48WM8vY8TT+Ed5HvswAqwYHk5nDSkprgjT7Sk5wjkmInIUgR
 uf7QXtD9m8mLOfOJv6ds0G4MYVCLeg0eu/JVdhFtxtWXZxATBXd8IEgKQxIk6//22Omn
 DDpJQuhNOb8tHa6muL6qA4lsrsyt9/Vh4NwJFiSVXOKhroFF8OwSbpywMcMiHe9qstL/
 X31g==
X-Gm-Message-State: AOAM531sQ4SYtChKP/Xi0+/pkUlfWXj1IybNlYiXfV/nlqzBzmW1k8nZ
 /doSWRqiDdiyMrYz9ikslA==
X-Google-Smtp-Source: ABdhPJy2UBAeXVe2clCBgV3IV5LD9Vpm36/ML8hriGF/63dM/VNU5ZdbvxkVSr6vw82vbgIGBslvqg==
X-Received: by 2002:a9d:7394:: with SMTP id j20mr9731736otk.229.1607381981912; 
 Mon, 07 Dec 2020 14:59:41 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f67sm2971797otb.60.2020.12.07.14.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 14:59:40 -0800 (PST)
Received: (nullmailer pid 1005800 invoked by uid 1000);
 Mon, 07 Dec 2020 22:59:39 -0000
Date: Mon, 7 Dec 2020 16:59:39 -0600
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 4/5] dt-bindings: devapc: add the required property
 'additionalProperties'
Message-ID: <20201207225939.GA1005697@robh.at.kernel.org>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
 <20201204093813.1275-5-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204093813.1275-5-thunder.leizhen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_175943_210389_337B984A 
X-CRM114-Status: GOOD (  12.80  )
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
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mateusz Holenko <mholenko@antmicro.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
 Rob Herring <robh+dt@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Karol Gugala <kgugala@antmicro.com>,
 linux-serial <linux-serial@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 04 Dec 2020 17:38:12 +0800, Zhen Lei wrote:
> When I do dt_binding_check for any YAML file, below wanring is always
> reported:
> 
> xxx/soc/mediatek/devapc.yaml: 'additionalProperties' is a required property
> xxx/soc/mediatek/devapc.yaml: ignoring, error in schema:
> warning: no schema found in file: xxx/soc/mediatek/devapc.yaml
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/devapc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
