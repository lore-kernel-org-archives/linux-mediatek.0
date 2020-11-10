Return-Path: <SRS0=XLXJ=EQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A87CC388F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 16:01:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D7AE20678
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 16:00:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ifHwbY+g";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QR92xVnX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D7AE20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UHFEgE77M6kUf9wQC5BXqkpPHZkDtFvS8DRCuWOZq6c=; b=ifHwbY+gXg0DTJ5UvBPNUL4N3
	wybF4LAXocZwj0neoFj4MgNzjxsFXXkZiusto2eWf5wSoWjRjeuE+eg+H/Zl38SgLGh6MafH7dTh7
	a8EZMWsZFsE5altPZkczj1Ct57rvxX6CedKcSwlmnqBptOcOwMBzsb3tnrO9JfqJ7GK9NmVZ9/QSp
	EtloxQJTaw45E30+iXqSIcgRp+Q9IG7BsCudbeUVVa2hnGFbDpK0xywKS8MHkwDbvV7UaOAh0VF4V
	q9kTy7TH/Uqok8Q0ajdDmkjemwHCJsna+ezPOByR/sHriw1fcjmo9OMZVuAE/zMDPHpVS5LGIhMoS
	sMOVBT1VQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcW4h-0001Et-6H; Tue, 10 Nov 2020 16:00:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcW4b-0001DR-FM; Tue, 10 Nov 2020 16:00:46 +0000
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C6BCF2068D;
 Tue, 10 Nov 2020 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605024043;
 bh=RG/NgTihgLdA9a2pBThkDLJ4oix0s+fuIb+CdyGAfbg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QR92xVnXSCxFUy0PtEbfWxb/UOqBBHT49rUsGeTHi90eooMOWd1csrmBvfX3LMJxC
 ManaMQTY9nE1s5cbG0XZ6zKLMLBVT6GWu9S0U3+TyIFmb3TijPzKaKeeKsz3Z5vfmZ
 B0YQIVxrtWNFrr3kkiLIUUtwymQSMKRqaplWccGE=
Received: by mail-ot1-f48.google.com with SMTP id k3so12963701otp.12;
 Tue, 10 Nov 2020 08:00:43 -0800 (PST)
X-Gm-Message-State: AOAM532Hdyi9OI6qzlE3v7GUdNAKh/nMWnNHYG8NVW+eIfy+BDthUq/f
 jLuDhGmxBRW8T5okDLs3gvMyA5fDpG77n3uuvA==
X-Google-Smtp-Source: ABdhPJzha/4fhemzFLUDyArlzFbgeQPDzeNA2v1DrUvZ4YO4PLgq/Upa3Zm81wPaXlzdUSWTJ33FQAKGy+fnze9zuNw=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr13486984oti.107.1605024043019; 
 Tue, 10 Nov 2020 08:00:43 -0800 (PST)
MIME-Version: 1.0
References: <1604390378-23993-1-git-send-email-jiaxin.yu@mediatek.com>
 <1604390378-23993-8-git-send-email-jiaxin.yu@mediatek.com>
 <20201104185651.GB3946406@bogus>
In-Reply-To: <20201104185651.GB3946406@bogus>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 10 Nov 2020 10:00:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJAhWtK6G6vLt=H+PK3=JvDuY8JgP9+mdWuFbtFxONnCg@mail.gmail.com>
Message-ID: <CAL_JsqJAhWtK6G6vLt=H+PK3=JvDuY8JgP9+mdWuFbtFxONnCg@mail.gmail.com>
Subject: Re: [PATCH v4 7/9] dt-bindings: mediatek: mt8192: add audio afe
 document
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_110045_597533_FA234BFE 
X-CRM114-Status: GOOD (  18.00  )
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Bicycle.Tsai@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Shane Chien <shane.chien@mediatek.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Trevor.Wu@mediatek.com, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 4, 2020 at 12:56 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, 03 Nov 2020 15:59:36 +0800, Jiaxin Yu wrote:
> > This patch adds mt8192 audio afe document.
> >
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> > This patch depends on following series that has not been accepted:
> > https://patchwork.kernel.org/cover/11752231
> > (dt-bindings/clock/mt8192-clk.h is included in it.)
> > https://patchwork.kernel.org/patch/11755895
> > (dt-bindings/power/mt8192-power.h is included in it.)
> > https://lore.kernel.org/patchwork/patch/1321118
> > (dt-bindings/reset-controller/mt8192-resets.h is included in it.)
> >
> >  .../bindings/sound/mt8192-afe-pcm.yaml        | 100 ++++++++++++++++++
> >  1 file changed, 100 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> >
>
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml:10:4: [warning] wrong indentation: expected 2 but found 3 (indentation)
> ./Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml:15:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/sound/mt8192-afe-pcm.example.dts:19:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
>    19 |         #include <dt-bindings/clock/mt8192-clk.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now linux-next is broken because this dependency is not yet merged.
That needs to land soon or this be reverted.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
