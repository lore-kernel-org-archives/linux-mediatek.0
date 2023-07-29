Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCB7C001DC
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jul 2023 11:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Cc:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JTdjEAe71b0Sk07G41NM9kDWo3D+urjxVcYP9X65Ar0=; b=hbE6WUTcIHgtbYEZBQKPqPRGdW
	BL5u7CW03kBCw3n05fGxZv3CJD6YV+9xSus8crJjNsQUTSpB13t1VoQGJSMyUb5yTX/U2pSwn9aIF
	cRUPIS2yfbK4dL5EtfFn7/+KNiJtQa07Vrtxkb2WoBcrnXx/bEwNyANgHp1Jv0IrtT2TafC+5L+Bw
	Nkpq1wOrs9HoniklPlolwm45Qduz3uajsFHZE3TQLAJ2SErujhDNbtFBtimCljHmtraOWWzcUqTUL
	ynJx3OCre4r0FSoVzFprtlH46QeywcVqH6oUWewZ8aTZe8weVpvR2bsJTkltTSTF2FVOaXVDMDUwd
	qntqi8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPiOK-007KW9-28;
	Sat, 29 Jul 2023 11:45:48 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPiOG-007KV0-2P;
	Sat, 29 Jul 2023 11:45:46 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fe216edaf7so1699392e87.0;
        Sat, 29 Jul 2023 04:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690631141; x=1691235941;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTdjEAe71b0Sk07G41NM9kDWo3D+urjxVcYP9X65Ar0=;
        b=qWf/cMdNQbJBbhcE+oqfUd9x9O06ioP77uX9/y0QYHkY18AqbcIp8MYq8khu4qAOKF
         DyDxL/clZ+NDPQ63i6KetnFhZLauDHI7l4+WWSZ12H+VrtRSYNky0yrjNXDgvxgPYV4k
         SrXvyYXBiEA0iKnU0e34S3J/o1SVHQcuOnfs/OqdJeXBc3i4mjuh48nLu23PGbEyAoJQ
         O8/80DDOt7KrkwVbrCpU7d6ZK3NzuXoGLGeAwO453xCGdIK6vuo9km5SQfMw0D0efPwS
         qQ2vBjvYzr+IMe2shf4hCWOtW6lTWcCuOQz7m30SR0Bw8QoWqlTMQakwUD/56uczRQaO
         oAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690631141; x=1691235941;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JTdjEAe71b0Sk07G41NM9kDWo3D+urjxVcYP9X65Ar0=;
        b=engsHaqyMxUNuBhvqBlUMXuXok3WYk8lT6V1BnDAwkd8TJMAKTG7OgonG9TRPq3ItI
         4hguK/qnUR5yuIDqOCs0WpOzn2yY1XYrORbZIf3GJYpkjPOsiSlB0FHBOWPsbfGplX9I
         2BSKIkHgT5B4fj6b2GFikl+De1CH+5LCcq9MJRQAfPGaaPeE3FMMQCVfHl5Eg0Qw9BqR
         uKkHVo7XylDVn3DS69DZOl0e3OEjtvOIG6pahDtmNiz9cnzWmjQL9lrg4ElIqv2CHtTM
         jHxHbgeAw+3CjSXjxBb0WNYd/jC9Q1E70bOfMv8IG8at6g5V2DawN9nyXwyebHTRiymW
         1Zdg==
X-Gm-Message-State: ABy/qLZXxh+vSXZv9pmI0biO/2SDBL/fWOyWWEGVrYcGrAn9e142SHSR
	WQd0N3uJorolmtYkP+k/OOc=
X-Google-Smtp-Source: APBJJlG5pD/pDB2nRa75Z5e/lowSCoQHTY9YWpEMCI2NangfuzIZVkFVC3q39LjL9P6fu9vW8zTH2A==
X-Received: by 2002:ac2:5f48:0:b0:4fb:8938:48ab with SMTP id 8-20020ac25f48000000b004fb893848abmr1798657lfz.16.1690631141361;
        Sat, 29 Jul 2023 04:45:41 -0700 (PDT)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id q25-20020ac25299000000b004fbb1f7352csm1190079lfm.72.2023.07.29.04.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jul 2023 04:45:41 -0700 (PDT)
Message-ID: <2a4da319-a78a-7cb1-6f18-f59180de779f@gmail.com>
Date: Sat, 29 Jul 2023 13:45:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Network Development <netdev@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-mips@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: MediaTek Frame Engine Ethernet: does it need any resets?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_044544_826723_AEBA7CC3 
X-CRM114-Status: UNSURE (   8.97  )
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

Hi,

I'm trying to understand MediaTek's Ethernet controller resets.

I noticed there is sth fishy when checking dts files. See following
errors:

arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000: resets: [[2, 6], [2, 23]] is too short
         From schema: Documentation/devicetree/bindings/net/mediatek,net.yaml
arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000: reset-names:1: 'gmac' was expected
         From schema: Documentation/devicetree/bindings/net/mediatek,net.yaml
arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000: reset-names: ['fe', 'eth'] is too short
         From schema: Documentation/devicetree/bindings/net/mediatek,net.yaml
arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000: Unevaluated properties are not allowed ('reset-names', 'resets' were unexpected)
         From schema: Documentation/devicetree/bindings/net/mediatek,net.yaml


1. Binding mediatek,net.yaml
It says that when present, there must be 3 resets: fe, gmac, ppe

2. mt7621.dtsi
It specifies 2 resets: fe, eth

3. mt7622.dtsi
It doesn't specify any resets

4. mt7629.dtsi
It doesn't specify any resets

5. drivers/net/ethernet/mediatek/
I don't see any reset_control_* code at all


Can someone help me what's the actual case with resets? Are they needed?
Are they used?

