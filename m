Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0960C43463
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 20:51:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1681206A2
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 20:51:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u25sisDY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5aGYz+r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1681206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=73vKohgpNAGJMQJSshbBnTbYBQGzdaGywKNUcBL/ogM=; b=u25sisDY/qBVBTpj53YNA22bb
	M8eWyvNhkP5S0JCCLKSOb0JL2l+k8p7O3fzzhBHTbttAllnNjjyN7mYO9szVXVPhFQo55qNk2Z/zT
	uf1vwkvtTsyOitpVQ+EHYTwhyaL3oPVkPp9/4IkLYWw3xIIkeIzClLo1dzZxO1XZ7mj4u8Vl+HlyR
	iJES8pTgSzSb1k35xRULwqMDgtsaIxPmYgo0iwoc2x8POW7lMyVD/TMCzf2vAOQ+cvlO9BDCIxDly
	bxLAG0cU0VJP413bAS+peGFdFb7X8yhqZ+rJfXN+tw3PVcSYKY0z7MVcgoI+OKAwp88PbHnB/iXhX
	V8lqPqYeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJNLO-0002s6-UN; Fri, 18 Sep 2020 20:50:59 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJNLJ-0002ph-5B; Fri, 18 Sep 2020 20:50:54 +0000
Received: by mail-oi1-x22e.google.com with SMTP id c13so8598547oiy.6;
 Fri, 18 Sep 2020 13:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LQBTYd/i7TL56jJTVQHkU8FPXDKYu/R4V8hCfAPSzJo=;
 b=r5aGYz+rFyzfIoItLLPRg0TWqJvXc782/dbNt7PSwOTmfECPgbPftiexIoJkmFTXtY
 vK4UuJdscGwkJgnTX/t8tlx9Z7Q/eOVC0jbIuSuj/58XQV9sWNdOS+A82CTSgiMta/u7
 uWQ/AYufjXogcJQpODpjD2prPYEWNCRPkks3c2V8pRp4Vv1LgYC+cVsE+kJPPCw0FBj7
 U3e2A6CFjMd12j5aCHGLnlMRvVRHngzVR0UYL7Y7dNZk8OYyal5IYSmOiSEQuNazDCAR
 Qh+MUj5CCTduEz3ESmgu6tb6KIFSCO6DgMyIbu4nv4eveg7nFsKcRcOce2Ou2wCbVKqy
 bBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LQBTYd/i7TL56jJTVQHkU8FPXDKYu/R4V8hCfAPSzJo=;
 b=rJAaZDZWUUbyN2fDP37tn/lUHuq//6MQMYSMFDD9frL6FGwQoYT4IUtpDH5N8TAGbX
 MysOyLuderopeeuPCALGRwIiiqzYRjGpd8IQzA/YKYFYJpXOU9ARiBj5l84F2n/ZUPH1
 donmxOOXzSslBM0ToX4aJCMQqguRgjn/rBsnASeb2x5RXUb96zw0jLnezFtxFNK/QMuS
 MLZK9W1521A5V3MQCD9HRf/ZS3/i961svXg8dVHwUechZyFhA5jXXxUu+/yRmN7Lu8Kj
 7T97dOxS0EMsnRJj5zvaO3YDHmpjKLkoo8fF9X/73VlnJJjfweZnekePr0fDql+ekdNs
 uRDg==
X-Gm-Message-State: AOAM532ZO86K5uoWtMZSXM1xAwADpBNZj0ztahL8PjOSRfu04qHcOGiR
 ND+PtAPGyVyrM2/CWgMc1hKLHpbdhX8YBd+Svi0=
X-Google-Smtp-Source: ABdhPJwLFCTn89gsNeMXFYjEgZOXfTDO437610Y8/ZpvSrOdjvvz3QGyVx9hb5/bIum5U6OkxJE/NlABUGT6UuwFT+0=
X-Received: by 2002:aca:5b45:: with SMTP id p66mr11082126oib.39.1600462249606; 
 Fri, 18 Sep 2020 13:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
 <20200910172826.3074357-4-enric.balletbo@collabora.com>
 <CAOwMV_z9OBpNqStCH+HEcwAK-TwPVeMH4LwJbp78T1P=t9bEKg@mail.gmail.com>
In-Reply-To: <CAOwMV_z9OBpNqStCH+HEcwAK-TwPVeMH4LwJbp78T1P=t9bEKg@mail.gmail.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 18 Sep 2020 22:50:37 +0200
Message-ID: <CAFqH_535GA6nFGKTu4wms1FGySfdrJPeZOf0tuFzaYwVwQuucg@mail.gmail.com>
Subject: Re: [PATCH 03/12] arm64: dts: mediatek: Add mt8173 power domain
 controller
To: Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_165053_210835_36909104 
X-CRM114-Status: GOOD (  11.13  )
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
Cc: DTML <devicetree@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Weiyi Lu <weiyi.lu@mediatek.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Fabien,

Thank you to look at this.

Missatge de Fabien Parent <fparent@baylibre.com> del dia dv., 18 de
set. 2020 a les 22:24:
>
> Hi Enric,
>
> > -               scpsys: power-controller@10006000 {
> > -                       compatible = "mediatek,mt8173-scpsys";
> > -                       #power-domain-cells = <1>;
>
> This change generates a lot of warning when compiling the MT8173 device-trees.
>
> Warning (power_domains_property): /soc/mutex@14020000: Missing
> property '#power-domain-cells' in node /soc/syscon@10006000 or bad
> phandle (referred from power-domains[0])

I think that there is a mistake in that patch #power-domain-cells =
<1>; should not be removed. Anyway, I talked with Matthias and I'm
going to redefine this part as doesn't really match with the hardware.
We're thinking on something like this:

scpsys: syscon@10006000 {
     compatible = "mediatek,mtk-scpsys", "syscon";
      reg = ...

     power-controller {
           compatible = "mediatek,mt8173-power-controller";
           #power-domain-cells = <1>;

           <- the list of domains ->

Thanks,
  Enric

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
