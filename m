Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CA3C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 13:49:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A001460F93
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 13:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A001460F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRccbv7zI05ML4xAWBO6J7JzL9AwAxbiAQ8q61RYM1A=; b=Sixy74PS2/7EQK
	4afr6alWfoiUv3gk4C+6zTQcgwP0yXy7LKRX+JII312JbEpb+9VUdeqaSmJyvDssADqO2zP1LxXUd
	bPpuAPcklfwdZji7Tkrb/jc/vmy9UZD1T3VlhYvr0sUco2PWWrkg9PWy8iPksmmbjmgAR7+Rix+My
	fkyhpCWWxtJcKRY4p+CsubxeRxPS18zgl7B9kr5q6KzdutfBsJa2fz1yJVvN7nuQVlOHIK9EqnJOv
	tyZw587vohXcLOph01iAAaRyi/Ad7oZoPqbUj7OeOqHAoQfA1bmvwCAVgNSrrQYrA9Li5s/qQkZmw
	YaxU+xeJkW5b9agfRcTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlWvs-00AeAL-2i; Fri, 12 Nov 2021 13:49:32 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlWvL-00Adt4-RO; Fri, 12 Nov 2021 13:49:02 +0000
Received: by mail-oi1-f181.google.com with SMTP id t19so18035030oij.1;
 Fri, 12 Nov 2021 05:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=TC2M+mU+A5z9HrDX9S9GZXSmeMTv6gFjkiYKXqPqtKU=;
 b=qm8R0ZP0iMiHPyU7MVVlvBUNi4qFZgszVdMM9a6gfrsLiRP394M3F6hfwDPEk0b+bt
 /TWisZ/wqbs/15NyUAfRGkl/jMVs+bNv9bCizs3njuKUwgx5eO11lCj2Q2n1E+7yRq/P
 +/Jh0csMkbs5oVmcj9O4fpaN5iU4AZTS8+pJDnYpu5DoH0ZbMnTOjS5I5WjqSjNvfx4D
 BBI5Gu6gGvDRB5BQP47h12/ly9BC803FrI6xN9XnEH5aKKNV1lat6MOPkTj/NxdPo0c3
 77aSxiNrtbUTAFlH2nwzCoK0acSfiptDIN7YXORVhxe8KMb2xUrXruhPHNtsa3pPLtFh
 rfEg==
X-Gm-Message-State: AOAM532BPtkuDk/iAdZxpUpkct7nh/Xv0G40wuvA+LPcMpBJ1YFAV/r0
 Z1ItDPMZ8XCig6rKJtUdMw==
X-Google-Smtp-Source: ABdhPJyqLCyeEGS/my0wi5TWURD/69mMXlwnqhbDUdTjRdhY68jF3ugams1WHnb2/8Hlm26KL1Qd8w==
X-Received: by 2002:aca:5c82:: with SMTP id
 q124mr27682430oib.113.1636724930650; 
 Fri, 12 Nov 2021 05:48:50 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q12sm1172983otl.66.2021.11.12.05.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 05:48:50 -0800 (PST)
Received: (nullmailer pid 2463371 invoked by uid 1000);
 Fri, 12 Nov 2021 13:48:37 -0000
From: Rob Herring <robh@kernel.org>
To: James Lo <james.lo@mediatek.com>
Cc: srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20211112055410.21418-2-james.lo@mediatek.com>
References: <20211112055410.21418-1-james.lo@mediatek.com>
 <20211112055410.21418-2-james.lo@mediatek.com>
Subject: Re: [RESEND,
 v14 1/3] dt-bindings: spmi: modify the constraint of reg property
Date: Fri, 12 Nov 2021 07:48:37 -0600
Message-Id: <1636724917.135780.2463370.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_054859_947723_0CEF7F23 
X-CRM114-Status: GOOD (  13.75  )
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

On Fri, 12 Nov 2021 13:54:08 +0800, James Lo wrote:
> The constraint of reg may larger than 1, so we modify to
> 'minItem: 1' and 'maxItem: 2'.
> And adds documentation for the SPMI controller found on
> Mediatek SoCs.
> 
> Merge [RESEND,v13,2/4] into [RESEND,v13,1/4] for fix yaml
> error.
> [RESEND,v13,1/4] :
> dt-bindings: spmi: modify the constraint of reg property
> [RESEND,v13,2/4] :
> dt-bindings: spmi: document binding for the Mediatek SPMI
> controller
> 
> Signed-off-by: James Lo <james.lo@mediatek.com>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 76 +++++++++++++++++++
>  .../devicetree/bindings/spmi/spmi.yaml        |  3 +-
>  2 files changed, 78 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1554153


spmi@1c40000: reg: [[29622272, 4352], [31457280, 33554432], [65011712, 1048576], [66060288, 655360], [29401088, 155648]] is too long
	arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dt.yaml

spmi@200f000: reg: [[33615872, 4096], [37748736, 4194304], [46137344, 4194304], [58720256, 2097152], [33595392, 8448]] is too long
	arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dt.yaml

spmi@200f000: reg: [[33615872, 4096], [37748736, 8388608], [46137344, 8388608], [58720256, 2097152], [33595392, 8448]] is too long
	arch/arm64/boot/dts/qcom/qcs404-evb-1000.dt.yaml
	arch/arm64/boot/dts/qcom/qcs404-evb-4000.dt.yaml

spmi@800f000: reg: [[134279168, 4096], [138412032, 16777216], [155189248, 16777216], [171966464, 2228224], [134258688, 12288]] is too long
	arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dt.yaml
	arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dt.yaml
	arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dt.yaml
	arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dt.yaml
	arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dt.yaml
	arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dt.yaml
	arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dt.yaml

spmi@c440000: #address-cells:0:0: 2 was expected
	arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7280-idp2.dt.yaml
	arch/arm64/boot/dts/qcom/sc7280-idp.dt.yaml

spmi@c440000: reg: [[0, 205783040, 0, 4352], [0, 207618048, 0, 33554432], [0, 241172480, 0, 1048576], [0, 242221056, 0, 655360], [0, 205561856, 0, 155648]] is too long
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sa8155p-adp.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7280-idp2.dt.yaml
	arch/arm64/boot/dts/qcom/sc7280-idp.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dt.yaml
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml
	arch/arm64/boot/dts/qcom/sm8350-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8350-mtp.dt.yaml

spmi@c440000: #size-cells:0:0: 0 was expected
	arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7280-idp2.dt.yaml
	arch/arm64/boot/dts/qcom/sc7280-idp.dt.yaml

spmi@fc4c0000: reg: [[4232900608, 4096], [4232884224, 4096], [4232880128, 4096]] is too long
	arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dt.yaml
	arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dt.yaml
	arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dt.yaml
	arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dt.yaml

spmi@fc4cf000: reg: [[4232900608, 4096], [4232884224, 4096], [4232880128, 4096]] is too long
	arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml
	arch/arm/boot/dts/qcom-apq8084-ifc6540.dt.yaml
	arch/arm/boot/dts/qcom-apq8084-mtp.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
