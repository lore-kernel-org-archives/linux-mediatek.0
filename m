Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A4DC432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 08:20:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A61DD60F51
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 08:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A61DD60F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rTzUBn6UuKBjfUtdGq7hl3FMqV57CgdhYwthJLf4v98=; b=4K8u8IKgTkj8/h
	xhx3dPNJkkjdXHyoDw30+YZD0R58SX0zMhXDyUhbG0DdEtDZM4gasRgngpIwMmEltzULIaR0EfsDx
	RN6uVcZ6fKrzWPIiFvz18TuIroEyNV2gXHLZZzVXXIg7iSGPjl1cvABtmYO6qft0PLwmPmIik3UsY
	YugGT1wSqZtSklMh9AobwCribMD/sX8eIib4JrRW/w7s8ofz32utD9SS063FigUaDB0BIJYr1Xxkv
	GCGoxpqVQ0MbDekdME6U48a7Lcgxm68nhdXRcJdnIKP84q0D3mAlvaGkyHLlud9oG7oFRdkXxZbSd
	+el5zBYi/Hm6yno4Igcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7vqp-00A9wG-O3; Mon, 26 Jul 2021 08:20:39 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7vqY-00A9rG-Qf
 for linux-mediatek@lists.infradead.org; Mon, 26 Jul 2021 08:20:24 +0000
Received: by mail-lf1-x12f.google.com with SMTP id f18so13954063lfu.10
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 01:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=91yXb1VgXd5JhIW1bX57GkCbuisDS0fNOG8Fkd81qLY=;
 b=FygJv0Sm71wlNsHO+sqMNccJlsftKpOA/wgSG/X15ho9In3iyj7q2bEnSLlCtjD12L
 N/M7zXxrwMCTf3a4UtmdqGojLPb9b7WaJOnty8rww0ORl+tzW8hTdRfEpfRm/BmXKpG4
 yCuxashLUeZU1hZS4DgXeoD2PStAB022xLxYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=91yXb1VgXd5JhIW1bX57GkCbuisDS0fNOG8Fkd81qLY=;
 b=ZmwoIu2T5o0MxqjwsWgIeVgOXMUBNibIHcxd8X8VtozZXwZ8JcsRim7fzEDcNeB3fy
 csJ9/y2LFEPEm5xIGTlBLwBXS4QInNEMYDBU2t5Ppq5C+B/ukS1K1c39NCUTqe/Hs/1S
 ZREufQSyeu7B2eMfEJpNMwA2fW6VI9wCc82Qa3F5UHXJLCmKmT0DbrqO5xkafO50Q932
 JMQbG0xAUExVKpxbn6R1QNOecdGItRxhpu/jK+N6tKlEIZ7g4ywOSkOsNG+oYQxLLwQ6
 Sf0OSlCzb9KZTWGCwAp7AKh4TzH4ok0TFjiSf9w4ZlysZKxdqtB13C8tYIgPV7+48VmX
 /Uxg==
X-Gm-Message-State: AOAM530CEQBnJpwsbO9R0FdikKONr2/WCVsLRK4C0nS2Az1qC5yanOZG
 YFxOVvSE+IIPKmkDnuvTTTyb/sX30B3HQIYgHzuTkle8BRceK99d
X-Google-Smtp-Source: ABdhPJwfbJe3IIQsY3UXhqvOx83qo8udghPA/zhl6SSU23YZpe1JFdaeLb5Lxi5GlOdmAKbpunqhPBD06JXT87jgpNk=
X-Received: by 2002:a19:f00c:: with SMTP id p12mr12028038lfc.647.1627287620624; 
 Mon, 26 Jul 2021 01:20:20 -0700 (PDT)
MIME-Version: 1.0
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Jul 2021 16:20:09 +0800
Message-ID: <CAGXv+5Ev4QU72cMqMW7sA=dijzh7-DCsfHY+Lmqd36uzg_7Nww@mail.gmail.com>
Subject: arm64: dts: mt8183: Incorrect mediatek,pull-*-adv values
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fabien Parent <fparent@baylibre.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_012022_897716_0D7B3ACC 
X-CRM114-Status: UNSURE (   6.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

I was looking at MTK pinctrl stuff upstream, and it seems there are a few
`mediatek,pull-*-adv` entries that have invalid values:

arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
mediatek,pull-down-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
mediatek,pull-down-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
mediatek,pull-down-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
mediatek,pull-up-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
mediatek,pull-down-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
mediatek,pull-up-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
mediatek,pull-down-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
 mediatek,pull-down-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
 mediatek,pull-down-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
 mediatek,pull-down-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
 mediatek,pull-up-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
 mediatek,pull-down-adv = <10>;
arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
 mediatek,pull-up-adv = <10>;

According to the bindings, the values should 0~3. <10> is probably a
incorrect attempt at using binary representation, which is wrong. This
probably leads to the pull-up/down getting disabled or ignored.

Cound people still working on these two devices take a look?


Regards
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
