Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF7EC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 17:02:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2AE8224B1
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 17:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2AE8224B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/46qpLEAniAMQ+l31Hi1XkxezC035NKZHU2uThxEveU=; b=hou+QhsWago2IH9ABqIp4JaNdo
	Tr9yP+XPMlYJUtjU+2DKwEAh+kkmTpHLi0b3ZYTENFpdO4kvkKMCQ2b1EYKFTun9nIMQ1kXvjadIZ
	MUx1XYLAKzRPe2zoks1la7lQi3gSa+3yIB/LNP+x1qnyCsqWyKNDwkksZyG7eg64a7ja2VpKzez3o
	GNQpqelfn10WVKX6dmyHE4thc2G5YP+BSt3udegYwAbk1tjRrdCZGYS+j5+lLy7A/SKAAvVGdBvqL
	cUBE/P9zuke9Zo0k9FNlkmT1LG0R8ue7aNrWiFvmQLt8GdQppc5N1Hf/xBVkUDSqPvY2RKbeMIX3t
	nD2U8fVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksU01-0002y2-MY; Thu, 24 Dec 2020 17:02:01 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksTzu-0002x5-Op; Thu, 24 Dec 2020 17:01:55 +0000
Received: by mail-ot1-f43.google.com with SMTP id 11so2221880oty.9;
 Thu, 24 Dec 2020 09:01:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=yQ+jkFqkeNW0g6dJlToG9rqzV65Dab1jDC5D6aio4ug=;
 b=k9T1fK27Ge3YrK9nKDgiTj86rIvQKfpfFAU/GOgPLiU2nCD0vfAdVEIpfk+nZptUTL
 Ws6NGW440bedggkYJMMwxH/GHHRv1C5vFBPefZgrC7D1Vgrr7keyorSeJ6uj2+eHlrR/
 wGSn8byQlWi35c6w6jAjmu2QkEvPghpzEOj2CjYE6MSwXPc9xd4qZM/7u13ozcjrjjvD
 Eh6M0Y0J6AG5Xp56Zh6sHk5eK/b5CHcUryH70bfyyPFvYdqlAklax7H/jptC9HKfAhHr
 L8VSPV/clP1CfAVOHx1pHWjpZ8GcqMTMbxkft8AgXLU8sw8YF5zY5EH15GCV+Q3zd6eV
 sHIQ==
X-Gm-Message-State: AOAM530Pyi2yWLXifvh6zzva9f6teGe0FplSC5PogJbmHuo0UGupIrgG
 ZE0fn8jxA4gKBwAYwOR3VA==
X-Google-Smtp-Source: ABdhPJxjl8zgjJFFzzINq/VqWXTjo+1x0o/d2ybTE3Qvx2dNR11lKFEb1xRLDizL01CKwjn5zJzOpA==
X-Received: by 2002:a9d:f66:: with SMTP id 93mr22677948ott.289.1608829314107; 
 Thu, 24 Dec 2020 09:01:54 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id g12sm6917426oos.8.2020.12.24.09.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 09:01:53 -0800 (PST)
Received: (nullmailer pid 2966453 invoked by uid 1000);
 Thu, 24 Dec 2020 17:01:45 -0000
From: Rob Herring <robh@kernel.org>
To: Henry Chen <henryc.chen@mediatek.com>
In-Reply-To: <1608790134-27425-2-git-send-email-henryc.chen@mediatek.com>
References: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
 <1608790134-27425-2-git-send-email-henryc.chen@mediatek.com>
Subject: Re: [PATCH V6 01/13] dt-bindings: soc: Add dvfsrc driver bindings
Date: Thu, 24 Dec 2020 10:01:45 -0700
Message-Id: <1608829305.386312.2966452.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_120154_833741_7912C372 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Arvin Wang <arvin.wang@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>,
 Ryan Case <ryandcase@chromium.org>, Georgi Djakov <georgi.djakov@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 24 Dec 2020 14:08:42 +0800, Henry Chen wrote:
> Document the binding for enabling dvfsrc on MediaTek SoC.
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/dvfsrc.yaml   | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/soc/mediatek/dvfsrc.example.dts:19:18: fatal error: dt-bindings/soc/mtk,dvfsrc.h: No such file or directory
   19 |         #include <dt-bindings/soc/mtk,dvfsrc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/soc/mediatek/dvfsrc.example.dt.yaml] Error 1
make: *** [Makefile:1370: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1420382

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
