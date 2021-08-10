Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F82C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 13:53:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E231160C51
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 13:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E231160C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdkhM+OawapqWOdoV37CV6LSzNdA3WmI2sxPfKBrJyM=; b=HBzOci+bXXiftc
	KzBlLUVu7TkNvtrLL1pZ+VYMWl5rwP9XCedqGfkJ7PcgB6dTfqHVfXzPirN1lfoK87WQFFnWD6rrQ
	+Q/1Lnr4hoZbEWwLd7veBQJgwOUWxZMcqet4PiuiVM80EajTzutbHOzeypc7rlYKZKqXaPjTaJW35
	s2E97kZx8Ve0G1iImIqOXTrefdgSuRxD6mSGbu4cI6n1xblrFdDi/jDXUo/qE6ZSkNSuxTfwVC+dn
	vsPyhhHWOuDHkFcJJDTpMJLMGCPyvTEKJoKIhxnZ8A4B1cf3gkItUxQtNuZj8vBGsI4TAs+kbJp8K
	H87RhPDxLR4ONqafwm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDSBg-0043OK-N9; Tue, 10 Aug 2021 13:53:00 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDSBb-0043Mh-LI; Tue, 10 Aug 2021 13:52:59 +0000
Received: by mail-io1-f42.google.com with SMTP id r72so18213377iod.6;
 Tue, 10 Aug 2021 06:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=n0pQptOPLSLX5QIJ3YjoYTw0YmHkHPJHCW1Ja2cSyMo=;
 b=KxqpN3KUwHwxZsk+ABicoWJ1UwqINYKRR8vqoTicIFnc0lDZNHvv7hdMw0CiR3qp++
 eh2u+K34HTQ6N+QpG1GlO6tDDVf+SF9kBiBp9WLLTQW2ZewqUJQcmAz/8N/vDETpL4AK
 NEAlclBU640UxeIoYbz6V7VFeTEMLXdoHDgUAiCCL3YFYKJW7wHJfNuzTBbUGPHIp8Jw
 nFQQH6IVbqir+9fP6ZFZpeGewvHqVZeFTlicKG1MZ4//gYkbvctkStV/T4cVt+6hSkgt
 oQPXU1rKouYTyzJVZB++FJH/Wf39SPeKdp0ipbDLbNWn8X4JaZJ1dtpsT82UVt/Ww+0D
 Vxtw==
X-Gm-Message-State: AOAM5326fkMhxakQ3Ha+KUIGqu4gD3DakrFpg3DEWUqeWa3pcrKlaP5h
 AcWmDUDLzmQJoGJvlN8VVg==
X-Google-Smtp-Source: ABdhPJxbfBYGw8RHYSAjad8JbTAHBSwUTqo3bLN+N1qARLZk4PyFRs8m9FCgFlBHdl8i3mVv/aeDHw==
X-Received: by 2002:a6b:f813:: with SMTP id o19mr315560ioh.49.1628603574396;
 Tue, 10 Aug 2021 06:52:54 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id e12sm1423228ilc.16.2021.08.10.06.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 06:52:53 -0700 (PDT)
Received: (nullmailer pid 1500790 invoked by uid 1000);
 Tue, 10 Aug 2021 13:52:51 -0000
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Tomasz Figa <tfiga@google.com>, linux-media@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 George Sun <george.sun@mediatek.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>
In-Reply-To: <20210810083047.16693-14-yunfei.dong@mediatek.com>
References: <20210810083047.16693-1-yunfei.dong@mediatek.com>
 <20210810083047.16693-14-yunfei.dong@mediatek.com>
Subject: Re: [PATCH v4,
 13/15] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for
 mt8192
Date: Tue, 10 Aug 2021 07:52:51 -0600
Message-Id: <1628603571.555258.1500789.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_065255_744379_9233210A 
X-CRM114-Status: GOOD (  13.91  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 10 Aug 2021 16:30:45 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Change-Id: I2c482fa6c0a91b5fc4f1950dd563cbc4d6c35da1
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v4: fix yaml file check fail
> ---
>  .../media/mediatek,vcodec-comp-decoder.yaml   | 172 ++++++++++++++++++
>  1 file changed, 172 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/media/mediatek,vcodec-comp-decoder.yaml#
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dts:22:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
   22 |         #include <dt-bindings/clock/mt8192-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1419: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1515305

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
