Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5087C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 15:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QLgtSIVpaLmKWrEM21z79PQT0f+qP3cLtnv0o0jL9M=; b=Fa9HQpTAI01tFi
	bJm+rv0zIdC1OXYK5bwyU0Hz64t9fm87Jy3crjhYRmIbJ5LcJ7MXijffzCTYo5k/aIPGj4YI9MzdQ
	rYv9j4uoo8Kt2SFJYc6+thEHr9GtYqtaqriFNPgOYZg1AlMXRgNlmNasiVHCps9xkajcl/7UfImOP
	ZFpqBCqlMTUIHUpvBsIgTQRKafa4k7O/ZWA+AqMQQbAGccdc77BBGfPFx67q5i3fU82wY9V2FT9Y3
	qubqPtQVo9WyMD67Yxuxvtnu1jADt2wyDNAa6kBACLGMzNrSlEg6yrhjnwIwMk7FsaRiJJm6d4niu
	U1E4qfeqocDDVo5nbfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7IrT-00GhFa-UB; Tue, 11 Jan 2022 15:14:59 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7IrQ-00GhEA-OE
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 15:14:58 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 s8-20020a0568301e0800b00590a1c8cc08so12981810otr.9
 for <linux-mediatek@lists.infradead.org>; Tue, 11 Jan 2022 07:14:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Jk0EX4IKmaccSFEtdG8EcUPH3oeVBCrwdq4GrAlYL0g=;
 b=8CWyqYiGs8a6Dau69c+/rn2y9cFi0iXhwun/UDqpfd400Xbnow0NA028aNidz2oDMF
 4uhdDxNeUZ+8kRJPsz1UuqEGo9utQXaH3pCbWJ64WLLVoXQ/FGlqJU99yaeno/NVTASk
 VSdNEDPQIQsLMGQd32IMR/84S09zcLKOw0RQQjUUPvoPh60AEe+fSn38704V/jdpsUwg
 WNM6HljWPQp3eIXkAzapblfa19hiP616FjlSYDT3Sp0rrxyufUgxBQ6jAigO9rZBU/IL
 qx1rywdWi2WS6+FBawvt834WS5qm4q8ynqZioB3idSnnCsH/HBCUSeRBQg+lSKOs9lP/
 ExxQ==
X-Gm-Message-State: AOAM5315GtE0Q5MdZn3SgRdwocg/Y66IizUmj7Z7/bYZRSnICfEMnjCq
 KNwZ5Fh/yCnhPAD0fmepIw==
X-Google-Smtp-Source: ABdhPJwBT4MR4rPnah6BCMtcj1OVOlsRfsANGrWSYKQQmx3Ag8CUMbEk9vVqEBF2AO8N1KqyF/KZ2w==
X-Received: by 2002:a05:6830:149a:: with SMTP id
 s26mr3550608otq.23.1641914094277; 
 Tue, 11 Jan 2022 07:14:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a28sm1682450oiy.4.2022.01.11.07.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 07:14:53 -0800 (PST)
Received: (nullmailer pid 2944758 invoked by uid 1000);
 Tue, 11 Jan 2022 15:14:49 -0000
From: Rob Herring <robh@kernel.org>
To: Bo Jiao <bo.jiao@mediatek.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, devicetree@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Peter Chiu <chui-hao.chiu@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Xing Song <xing.song@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>
In-Reply-To: <67eb9adaa2ed281cb6b8f3c74afc0cc7081f0f6b.1641901681.git.Bo.Jiao@mediatek.com>
References: <cover.1641901681.git.Bo.Jiao@mediatek.com>
 <67eb9adaa2ed281cb6b8f3c74afc0cc7081f0f6b.1641901681.git.Bo.Jiao@mediatek.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: net: wireless: mt76: document
 bindings for MT7986
Date: Tue, 11 Jan 2022 09:14:49 -0600
Message-Id: <1641914089.184254.2944757.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_071456_819355_01A1E30C 
X-CRM114-Status: GOOD (  13.16  )
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

On Tue, 11 Jan 2022 19:59:17 +0800, Bo Jiao wrote:
> From: Peter Chiu <chui-hao.chiu@mediatek.com>
> 
> Add an entry for MT7986 SoC.
> 
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/net/wireless/mediatek,mt76.yaml  | 29 +++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/net/wireless/mediatek,mt76.example.dts:131:18: fatal error: dt-bindings/reset/mt7986-resets.h: No such file or directory
  131 |         #include <dt-bindings/reset/mt7986-resets.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/net/wireless/mediatek,mt76.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1578404

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
