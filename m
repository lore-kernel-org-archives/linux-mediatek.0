Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C46C77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 21:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAvkCDu3hruxgiOJqmE1sAlKDaRv3MBstRHxkz3IG9s=; b=IFuuil50j07tn/bHQ5Ru16N2yQ
	IQmqckQR3VevlGRg+sSRm2eHIJR5Rq/9wYP9+mKErdT6SZEKT7jdzpOAfJIDq1Z0hqtUTUfOPUHIn
	Sc6v73C3nQW5FK87mJhGV0HD2MbNZe0XJTdVP17R0ZwOUVFbSzx0AeF0NbF1oKOZSjxGjvQ9x8DeX
	PwlgUKOMWELNijmU776LFQmk43cKRcXXoTz5OUJyeKlqeMDHl6V7lScfjmXolVdu1hjnJFPNb4lWi
	w2WATtL5puyVgb94+D5+awi0CodziML1B1TTsgPva3zvjV7SOKlDYshoHk+1RjoPdxvktrdWgLgzC
	iPFsSkVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmiHh-004ROs-1h;
	Wed, 12 Apr 2023 21:45:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmiHg-004RON-2S;
	Wed, 12 Apr 2023 21:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iAvkCDu3hruxgiOJqmE1sAlKDaRv3MBstRHxkz3IG9s=; b=orHRdQ/Tjy1BkVg7VRFrLqlDcl
	YDT6IY4doZEpb+LgjzqPaSO2DOWpWd1nrqKh7BkrqtlF+ZNh2It8ChY1yB62+iWPYwEWVpfgQkfZl
	6qkbcUZ02EGDjc0AyL6qM5UigDFevKTK+6jjvbzNX6p76Gqa4YJgsTCWUf/3pTMfwSUNRE/vC/CmR
	YSjzw+oyCC5VI76MeRXeBGxG2Do05gehesQt9xAOA0+MtXf0vi+41XLKgV/zlaYQ3IUGnqwZFWkB/
	MK8tNnP9QdVzso/5Pk/9kYjxBkRpHmkiwfdBrErqHhgqwMhbVizC+iHpkeOg7IORcGb74lN4v2nlY
	W+ObpfYg==;
Received: from mail-oo1-f50.google.com ([209.85.161.50])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhdC-00E2MP-2P;
	Wed, 12 Apr 2023 21:04:21 +0000
Received: by mail-oo1-f50.google.com with SMTP id i10-20020a4ad68a000000b0053b8aa32089so1942035oot.5;
        Wed, 12 Apr 2023 14:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681333432; x=1683925432;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iAvkCDu3hruxgiOJqmE1sAlKDaRv3MBstRHxkz3IG9s=;
        b=YKPU7EROb01rOb1/3SiSYcJCfJEE7oQus8vEbQ/+lKqCUTzYHK4XDD/QgDfGJp58kD
         Y1tqdFP1sHnW3wgStk3Ev2UxtMkuspGPx+XvnycpssjL0hw7ASyzzN6mRlhosWahE8D0
         NzYp5g8qD58wp4WKUrKgBlyfV7uCL63OkXNulAUh2gLuaULfR+t7AFkDY87E8ukNzVNY
         4Wcf6913AWVO/hIScvBxuzwxTxJ86CqaKclzqJsZBKLJqSQV7bQAGSa1rwsvtGZNBrPM
         KFV/DfecS493iXHd8OsjJKuTtzcKVd3HUjvTTIh9vnFy7cWcONbQrZNIUN4n8TgmeCs9
         lWZg==
X-Gm-Message-State: AAQBX9dtjz2HKv80d/UiNAjojMZB2rlzytYp4IxDTjoBUUXKLTmDXh40
	tJjNdMnWQkyn8s/mZe7eJQ==
X-Google-Smtp-Source: AKy350Z5Q9mJ1edtUqGeVZax9s2dgjb2Rbg2T6w0rBrdB1GGVndSVyqgynTnqgRdU1HgIe3DZDxvJQ==
X-Received: by 2002:a4a:4153:0:b0:532:7281:93fc with SMTP id x80-20020a4a4153000000b00532728193fcmr8643020ooa.2.1681333431639;
        Wed, 12 Apr 2023 14:03:51 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o7-20020acad707000000b0038b0dd1c040sm7217626oig.3.2023.04.12.14.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 14:03:51 -0700 (PDT)
Received: (nullmailer pid 3200533 invoked by uid 1000);
	Wed, 12 Apr 2023 21:03:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: thierry.reding@gmail.com, linux-mediatek@lists.infradead.org, chunkuang.hu@kernel.org, u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org, vkoul@kernel.org, ck.hu@mediatek.com, xinlei.lee@mediatek.com, krzysztof.kozlowski+dt@linaro.org, p.zabel@pengutronix.de, dri-devel@lists.freedesktop.org, kishon@kernel.org, robh+dt@kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, daniel@ffwll.ch, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com, ~postmarketos/upstreaming@lists.sr.ht, airlied@gmail.com, chunfeng.yun@mediatek.com, matthias.bgg@gmail.com, houlong.wei@mediatek.com, jitao.shi@mediatek.com, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230412112739.160376-7-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-7-angelogioacchino.delregno@collabora.com>
Message-Id: <168133319361.3191144.6939545255340146019.robh@kernel.org>
Subject: Re: [PATCH 06/27] dt-bindings: display: mediatek: ovl: Add
 compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 16:03:44 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_220407_842611_8F3225DA 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Wed, 12 Apr 2023 13:27:18 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's OVL block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230412112739.160376-7-angelogioacchino.delregno@collabora.com


ovl@14007000: 'power-domains' is a required property
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb


