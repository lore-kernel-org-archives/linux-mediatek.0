Return-Path: <SRS0=tlsQ=F6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC9CC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Dec 2020 00:17:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C00D221E2
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Dec 2020 00:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C00D221E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bbitk4N9Mgv7cjoqgjlseu1WGXJqHpMHh3Ws6zaEJtc=; b=ztyge4MPwJWpZvulkeaP+DXYg
	8XasqvT3XQ24exKosHLaUSlLv5rYzfjXVCFyUC4rpG9zHhkMR6IiAEZMInU/kPiBT19Lacgp0Emyl
	rlwtzbb5hb33vJlG5qNb3sMv8vw3Y9/4peBFE21d7mHQbi3HzIka5mrrvXyp2ouMDWiUQz8N16yGr
	bl/lNdsP80Vz5uahUunNgD8t+2Unv1KkO7c9bYtTS0J+Wtqyd+KSzPPmLunFJ2IeibirpIbl5qm+l
	oGnTnHRyzpunUmfJX3Ved3shyscdCAZiHAWQYRbCh5UWqsWGV2rfIcqpfMj4YgSfJLijCRFx54mKK
	LgHwWN+Bg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksxGU-0003Jf-OH; Sat, 26 Dec 2020 00:16:58 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksxGS-0003Hu-Dw; Sat, 26 Dec 2020 00:16:57 +0000
Received: by mail-oo1-f53.google.com with SMTP id x23so1133365oop.1;
 Fri, 25 Dec 2020 16:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zOHx7r8bUBdtp0nmUurNuEgdm3BgirvRBP8EZaKtUo8=;
 b=pLGxD93sRTX40oIDSxMXXHXR9nJ1gX1Zu0pJIGD4QF7HySJVQ6fTGKl52X/KrKPuFQ
 pX7InZQzh1urVmV0SzDTrZ+UPwyIyYW4eGg3NvI0lnnd+rKe9WygFZ/OuqcYTBPy8G/q
 qB1B44fjk7TVV9tKjygLiEfszeIdhndmdmivFGUSyqP3ZtJAgzJ2HKTG8fjbmv2p1efK
 rd6wD+QsLPcNB/enCS7EiUhTScFy4EhBfeswQ22lpcHaz/B5xUpUwN96EgH7wKFhclIg
 ljMqvtrfluST7PYcZTZrOpVszDWptihHNCnS1/5SgmcCu5c+hMo/epgy1cuV2xFNDPfN
 4Ivg==
X-Gm-Message-State: AOAM532s9WSq2l2z6vUHhrcpVq+TL6ykiSU1hQGaHxAOMLydsaoJSmtF
 IxGpg3eVivKMpzdyA/IhCg==
X-Google-Smtp-Source: ABdhPJzmiUegrby/ih3TTnHOVg6dB9Qgxi/9GJxGsOTIVe68coS6CJWRwWQF/j1vMvrKvrGuzp09Cw==
X-Received: by 2002:a4a:a88a:: with SMTP id q10mr25045349oom.27.1608941813745; 
 Fri, 25 Dec 2020 16:16:53 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id r204sm8272186oif.0.2020.12.25.16.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 16:16:53 -0800 (PST)
Received: (nullmailer pid 1641376 invoked by uid 1000);
 Sat, 26 Dec 2020 00:16:49 -0000
Date: Fri, 25 Dec 2020 17:16:49 -0700
From: Rob Herring <robh@kernel.org>
To: Nick Fan <Nick.Fan@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: Convert Arm Mali Valhall GPU to DT schema
Message-ID: <20201226001649.GA1641257@robh.at.kernel.org>
References: <20201224123119.26504-1-Nick.Fan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201224123119.26504-1-Nick.Fan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201225_191656_500371_9E158234 
X-CRM114-Status: GOOD (  13.60  )
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 24 Dec 2020 20:31:18 +0800, Nick Fan wrote:
> Convert the Arm Valhall GPU binding to DT schema format.
> 
> Define a compatible string for the Mali Valhall GPU
> for Mediatek's SoC platform.
> 
> Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
> ---
>  .../bindings/gpu/arm,mali-valhall.yaml        | 252 ++++++++++++++++++
>  1 file changed, 252 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/gpu/arm,mali-valhall.yaml#

See https://patchwork.ozlabs.org/patch/1420519

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
