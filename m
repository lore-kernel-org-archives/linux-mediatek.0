Return-Path: <SRS0=W1mV=QC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F02C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 13:46:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C578261B01
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 13:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C578261B01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/kI8P07B+gWp+yQjgXzzdjL6gVbH8eEiRzW4Cyq4408=; b=kkSF1dvF7wU8U8
	U93b2L3IesuLo7p5Hm/9ZPxEuDZhYEPZYKhBUIf6CzLozMAq6Ky7Gh5UBuKkDX/uLKYgcSImjeaUd
	Xt+tUM7ImnBTQhmuR7cL31yFDHbUT4A7UtfbeBx7mdT0Y8Qa+0b9aq4QnxX+mam9u3cf9wvi0+K8L
	4zbYUEE3A0ByBdHNnciwptS4foO9+sX4A3FkqUW6LzklInuTAcCnBVS5tTE7X4fgIQ7h/4ztmC+UK
	aThfW0o/rGgjkBenSvp10QTktBG7iaj5pATHXDS08oo1rLHSd/MfQfmLSMi2PGchFaWZ8hs90G/Xf
	rH+AtTAfqOXGjabl9QMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmcJD-00Fjqd-4n; Mon, 15 Nov 2021 13:46:07 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmcFr-00FiSF-4q; Mon, 15 Nov 2021 13:42:40 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 h16-20020a9d7990000000b0055c7ae44dd2so27487328otm.10; 
 Mon, 15 Nov 2021 05:42:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=1XUBk5dND8WMgCnXdXyvWeYm6VJhK9ji7tENzoDG3gg=;
 b=FciwYX18KVx4KDjDsSMbEdVkAs3aUhIiTup+UjJgIfbPeH4e2MQu1aQOlfsHtjxOWV
 b+5kOWY+qzbxIs8WA4IgdTIxUNnTUQ/qPfMqscYKupLuaFFf2JmdSDDge5LFwkUK/fWS
 MCfO6PptjSQHuXDQvmWCjEjrHl/NefvC/lz2RGE8HHs1N4zFUv9KAfyh+qCnin0MGaWr
 Cy5MSMxVJWtSGEU65jEr+54Td/1WrfrtHAmVCuwh0IsyN43TycsriYB8w3f5JFDPk80S
 EceU/vDJuj0M+3hJaxo/hWctF/QDoyYLGzGCeU9LYLfrVgJoNp7dQOcWPFuJJzmZ3Yti
 u+lA==
X-Gm-Message-State: AOAM530lcytslzlVJfz44LirFqWxQRVkMWTF210xt7x94NbjVJobxNZZ
 8e9YAR1/ZqoiHZaohGxufARYDHkKRg==
X-Google-Smtp-Source: ABdhPJwjLQPGbiNHm2MtihChqN7jAyE1W7XudAKR26/0iCsaIZo9ezOTSDEjak404pOwjMT6GOth7A==
X-Received: by 2002:a05:6830:4a3:: with SMTP id
 l3mr27726777otd.229.1636983757695; 
 Mon, 15 Nov 2021 05:42:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 9sm3095876oij.16.2021.11.15.05.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 05:42:37 -0800 (PST)
Received: (nullmailer pid 595908 invoked by uid 1000);
 Mon, 15 Nov 2021 13:42:35 -0000
From: Rob Herring <robh@kernel.org>
To: James Lo <james.lo@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20211115042030.30293-3-james.lo@mediatek.com>
References: <20211115042030.30293-1-james.lo@mediatek.com>
 <20211115042030.30293-3-james.lo@mediatek.com>
Subject: Re: [PATCH v15 2/4] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
Date: Mon, 15 Nov 2021 07:42:35 -0600
Message-Id: <1636983755.172933.595907.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_054239_276090_FE21D1F8 
X-CRM114-Status: GOOD (  12.16  )
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

On Mon, 15 Nov 2021 12:20:28 +0800, James Lo wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: James Lo <james.lo@mediatek.com>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dt.yaml: spmi@10027000: reg: [[268595200, 3584], [268603392, 256]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/spmi.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dt.yaml: spmi@10027000: reg: [[268595200, 3584], [268603392, 256]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1555114

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
