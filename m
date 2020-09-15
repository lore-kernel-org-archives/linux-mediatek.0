Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3509FC43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 12:45:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE14B206A5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 12:45:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g8VTUAGG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q1VROlQW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE14B206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A3YtGKnnvL9VxiaA4HQKQNwwnJHAiMzBqLvGnTPmndA=; b=g8VTUAGGsDtnManNGl+EGtlVC
	EH7uSgaGC93tpW/MJWD8bO+aoItlGJ4O65bggoOpYNAB2iL+SI1RWr1xV6CJKGuXPhvB7Y+wSPoTR
	IXoAMF1iJViRarzmo5lIWRb1YEoW/S4G7vn5LdQvnPNu0m7hX6PlEBPbj15+X+kDC9/5Bonbx3XdD
	4m4j/MnKvZPjNSJmSt+1lnDIe68hQfM0eCAluDOiwW3PJZ9TxuXUWKgtfMYIRiv3PengwwOR6Nkuw
	TBE4n8KsggRQn+SPBoc2zfaK1zqNgYfwWEVMx8r16Dc5DU8Ua2yCBFSCAeqdEoY5MNsmRg9k3b0kq
	Ny/f2gkiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIAKm-0002fy-7v; Tue, 15 Sep 2020 12:45:20 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIAKd-0002c8-S2
 for linux-mediatek@lists.infradead.org; Tue, 15 Sep 2020 12:45:13 +0000
Received: by mail-wr1-x441.google.com with SMTP id a17so3165191wrn.6
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2020 05:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=prgbbLEwgblX++DIA6lSNe0xZAiKfHZki6I+StVAnLE=;
 b=Q1VROlQWfmlbZeeOVVji/0iVuQbrzHv3LyXlzJKB/jZyIl7jlwtq83iMQNIuBTtIDU
 mMJrv6XDPjLmOFIIlreqHabqlek6mVxO/yH3LCwl6pXubX3sxPWzQx+BTKkXXjULprxE
 a9hVqPQTocex/KOq6CV5LbnS1W7amLkZEXuFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=prgbbLEwgblX++DIA6lSNe0xZAiKfHZki6I+StVAnLE=;
 b=OQKjfXfEn4udZaC1R1BLX+TVdDjFDSfxhNFhmU3hMiAvMVZMHK38D0t8pcb2cNjJc9
 UH7TyydXDbFYff8XU4D4/EsR0Mhp3HB929TQ0GwFBu9CyU4kdlN3ayq/QsLDi4AF4T2D
 xBokCEpPy9LbPfQWQiIUTyAJpGzAj8xNw83cCDEJJjVVXAUgScPMGSiPZOPQcprWXaN9
 ahqt9CuD45QlxVco6RIs44o1vF3zitqsaEXfCGqGBb6rwAZtTF/uNWqWnNK35HorVuTK
 X1EpALxdigUalyFfSFDU+4uIp4a9jdphcvaP6QyXniG7zFBoyoU+H7gHQeNNusJ9qL6U
 AQ+g==
X-Gm-Message-State: AOAM532jdTs60kwvnyulAfPV7mtuPZn02wx9m/4FsvDHJ7R9oCGsR7Er
 jr0wxm5sd8xkRSK+aFfcKQ/bStY6qroLqhEFQ/z3dA==
X-Google-Smtp-Source: ABdhPJywvAYnO/cUJA6n7jjsXdnAk2rhTKdrXd0MShhk2rxfYd1+ycLgavEuhL4DeOkvtc7FxftmCne4Gau4Rvcai7s=
X-Received: by 2002:a5d:510d:: with SMTP id s13mr21605335wrt.177.1600173908051; 
 Tue, 15 Sep 2020 05:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <20200914174812.GA4125843@bogus>
In-Reply-To: <20200914174812.GA4125843@bogus>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 15 Sep 2020 20:44:37 +0800
Message-ID: <CAFv8NwLb4zKqc8BbRq5_B4PnGR+BAMZa2RpB0qjLez921j-diA@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_084511_954220_2B93F698 
X-CRM114-Status: GOOD (  16.63  )
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
Cc: Taniya Das <tdas@codeaurora.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, Dylan Reid <dgreid@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Srinivasa Rao <srivasam@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 15, 2020 at 1:48 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, 14 Sep 2020 16:06:18 +0800, Cheng-Yi Chiang wrote:
> > Add devicetree bindings documentation file for sc7180 sound card.
> >
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >  .../bindings/sound/qcom,sc7180.yaml           | 130 ++++++++++++++++++
> >  1 file changed, 130 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> >
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.
>

Hi Rob,
There was a change between v9 and v10 on compatible string so I did
not add your Reviewed-by.
Now it is "qcom,sc7180-sndcard-rt5682-m98357-1mic" following Stephan's
comment in

https://patchwork.kernel.org/comment/23608881/

to make compatible string more specific to board configuration.
I only add the note to the cover letter. Sorry the cover letter became
too long to follow.
I will add the note in patch mail itself for future changes.
Thanks for taking a look again.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
