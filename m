Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D29C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 21:41:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87781207FC
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 21:41:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zvQsr3IY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87781207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3vGswhyjArSXXo/C7KVpLTV+VsWM2wmjAfRhrjeVwog=; b=zvQsr3IYk0X9ju6f2l7el9Mxj
	RT9Q4jOP3YZ0/NuqIFn4YpntPhdCOxoagjcUU8Icj357Bta+X/LAdBCokPpVgJeNuLNjU/nR4x0Zh
	54QTuzakb5OiCKW1q0lBWyIiALUdjMtq6sc9MY9sGqIhOCz81OjBC8Jm5VAVTZ2l8iSq4pUVUbpXI
	9/JMcmxNdv756JdfCi5RNe9SsEeJfQu8R0opyJv6x5F1WZZi867Y1Pykb+g1RHBp8hb3PxwLzPOYU
	bInVZYNbPDMrRrwYhubYApSlPrkCKjtYGeG90OB0AJMly3kGUny9zxZOj69a7lrz1YetWierW7NWf
	2dcpVD/Zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2iCd-0002IM-3E; Mon, 03 Aug 2020 21:41:03 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2iCZ-0002HF-4q; Mon, 03 Aug 2020 21:41:00 +0000
Received: by mail-io1-f67.google.com with SMTP id s189so32875471iod.2;
 Mon, 03 Aug 2020 14:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+qbA17NBRX4DFVcCtce1OR443e452icdklfA8GxdqOQ=;
 b=HLHNzKGh+ZKjx72LZhzVb1DfpO7VDPNtPoQkaTfkWbmvn5TZPcgPvauJeI8KFj/Vnl
 rgnnjw/8GFlrV0Ye5OuB+TKS7HFVkWY7tICHH/refhgzgb62/TWYXwXdd33RqWh3GafF
 rJMKZrxMBOJoaeXyFtRL6oKpfO7lnlYFUKqO6zoVbQYEl0og2GoZnqJ629aE7H2x8vPr
 aykkdbR2onIuHYm1GzLQFBZqRdvs/uFGFW5aUMht8tuz81g+4WGN9kJVz4DiPJh4ee3a
 N/JQFZwoOoTX0tJR/Xk2R7ea4HB0k8PI0m+0CKzCceqPDeyud1b8PjUKZPr2zvorPp5/
 bHyQ==
X-Gm-Message-State: AOAM532nqGjf441l6Je++LMZ/NRhFHnnLBtiusKhx+jp2u44pZISuXhb
 lLUPDa+37S6f9x6R6cOlGA==
X-Google-Smtp-Source: ABdhPJzMH4Qu3dMzd0ErMEXWcCAy8F7OOarZCAV4Agm/rvfutcveskUC8SZEeVtMmVlFVM8iWoBOYw==
X-Received: by 2002:a5d:9d58:: with SMTP id k24mr1869658iok.107.1596490858430; 
 Mon, 03 Aug 2020 14:40:58 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id k204sm10853501iof.55.2020.08.03.14.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:40:57 -0700 (PDT)
Received: (nullmailer pid 3185405 invoked by uid 1000);
 Mon, 03 Aug 2020 21:40:54 -0000
Date: Mon, 3 Aug 2020 15:40:54 -0600
From: Rob Herring <robh@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: mt8192: add binding document
Message-ID: <20200803214054.GA3184946@bogus>
References: <20200801043303.32149-1-zhiyong.tao@mediatek.com>
 <20200801043303.32149-3-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200801043303.32149-3-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_174059_206457_01C983AF 
X-CRM114-Status: GOOD (  10.20  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 hongzhou.yang@mediatek.com, srv_heupstream@mediatek.com,
 chuanjia.liu@mediatek.com, seiya.wang@mediatek.com, erin.lo@mediatek.com,
 sean.wang@kernel.org, linux-kernel@vger.kernel.org, biao.huang@mediatek.com,
 sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 eddie.huang@mediatek.com, linux-gpio@vger.kernel.org, matthias.bgg@gmail.com,
 hui.liu@mediatek.com, jg_poxu@mediatek.com, sean.wang@mediatek.com,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 01 Aug 2020 12:33:02 +0800, Zhiyong Tao wrote:
> The commit adds mt8192 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:0: [0, 268455936, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:1: [0, 297926656, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:2: [0, 298909696, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:3: [0, 299040768, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:4: [0, 299106304, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:5: [0, 300023808, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:6: [0, 300351488, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:7: [0, 300548096, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:8: [0, 301072384, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:9: [0, 301137920, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:10: [0, 268480512, 0, 4096] is too long


See https://patchwork.ozlabs.org/patch/1339661

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
