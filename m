Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23442D25042
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 07:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtRi6MFrPdl+19+cK1e/kxjINMsNs/Hr2ADMl8wY1zQ=; b=Gq9wix8ujZSkyzr4DgyCGT4VIx
	5/Zs94MFEJ0bqfe8Xl4r/cvkNAfRSJD5BuVjNgvMgJgt788mpVPrrjLiq3LkCNV3DZ/bhdADnH9Qv
	OBhIQcCH4ucNZs4gGaqI13n9WHCLAW/1ctXJQwdADr5ld7Ih2iSr3upP9PZGgw7wEX+KwpaIf4obQ
	5Es7IH6O0W1UYzv0G1/jjEOGFlhOt6WBWMJFYMtoQbEEdJxE0PqUnLo6TZRCVyhoigG03/yg7reCM
	VsCtbE/0U5M+KtQwHTusHDY5503iBo5FUrt+UmbIsw6CWkXFowDPJobIgS30qt96fC0fPiz6aT4b3
	jh+EVZ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCXU-00000004ud9-08ie;
	Mon, 12 Jan 2026 07:40:36 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCXR-00000004ubl-3UUz
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 07:40:34 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-59b7b27ebf2so3201800e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Jan 2026 23:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768203632; x=1768808432; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtRi6MFrPdl+19+cK1e/kxjINMsNs/Hr2ADMl8wY1zQ=;
        b=STLUmzsS+LieYt3GJzijK2whMSIgNHTVQSXOyaDlXc+HUka6IFeWRu/gWFf0xhmLBL
         5R9qawgqzIW8gTbG2aRtYJFFAYJB2GgSJ97IBQTft6tx2VljkR4luOpAlLFeD1G86I3U
         jQI+8nOfw3i31SvDMiP+mWorIYVg4avEGZdT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203632; x=1768808432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JtRi6MFrPdl+19+cK1e/kxjINMsNs/Hr2ADMl8wY1zQ=;
        b=VtvDGwF9ddItKOzUFrBajjUgZzlgXrjVZ7fT2tSLfIVM5il63jrnBFB9ql8vDBuCo6
         r/lZsq+1OF+th5giNr8DJSnJbIIUK2H1GR2+q9OO5YZrkM+pw+fIFWfJNVfKxjzxR8/I
         W2lC0Q/ptMc3KRUr+dflqSzD6PN/g0usoAm6HXJgKqmkvNxhh1kUQRlHCnC+NupVJnIl
         2OL22nGY4HMIxcscaDhvkrJxcK6zv5EOOQO8qbxiNZsWCUYXErFQf/c3+f0XxL/qIMdu
         70PbcvYtksMgEV/j1ZKg2BEKnBr4TLA/oEeehzHEHQHdgDDHJGH4PePyq6Ihk/A9sQG7
         jZBQ==
X-Gm-Message-State: AOJu0Yxb5jGhfpnPoazifBpuChabw87dRw+3xarCBHnw0bGOEHTlErDo
	7+krT3koIbL9DKNYTKYupI6z/22ehPXTq2p0mLu2VJI1TLiH3BWh8QEReO3YeswR5trC4Fna3ub
	/Uc7f7It2w2nzofKNVok4QicCqy9HBE4GiyzyUf8E
X-Gm-Gg: AY/fxX5h5lhIgwbe6Yz/IAUFqpzt7lYqa7BSjUfMSgShpxfRSh/aSEwZPNFaCe+nFt5
	vTpxyDMmCf8Rwca+4Tsb+EuGuvx9U/8qlm8W8AxrOvELYr3qzDYzUicqFPNvufOf7HBSFzOeb7j
	H+Y+zArrP6dyIkX/kLKvb2L1YaU1QfQX9XaAchHzcQj065PFTdiR1DRgm7qG16g5pzHc5LowYVA
	E+/R5BcFBj0XlFw0mDoP1f7ZipUpe1tk/s4FhFGiGVA9f9CsOUuzPAfb3gSffuQ+IHvSeqVGCIZ
	Z0t7mdYF3gCOS0GHOIAdCG6d
X-Google-Smtp-Source: AGHT+IFlCspDZCPT9FMQStGT61bv+dAucJwKR5nac26W67Y6fKeZtDHqcvUx1A1+f7pEcKY9oNXx2pViJv8f4miGw+8=
X-Received: by 2002:ac2:4e01:0:b0:595:91dc:72a5 with SMTP id
 2adb3069b0e04-59b6f03b941mr5675948e87.40.1768203631712; Sun, 11 Jan 2026
 23:40:31 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-10-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:40:20 +0800
X-Gm-Features: AZwV_Qh7fVNNMWj4l5kX9MHDq3r_XLplwxlkLkGSZaHxXqk6sxgyDlZM2EC7dDU
Message-ID: <CAGXv+5HEFEYhKFuxx+tozMxyJsey-0GHgHR2zMZOfNWYj25U0Q@mail.gmail.com>
Subject: Re: [PATCH 09/11] arm64: dts: mediatek: mt8173-elm: Remove regulators
 from thermal node
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_234033_878669_5647D2C4 
X-CRM114-Status: GOOD (  11.93  )
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The only reason to have a regulator in the thermal node is to keep
> the CPU cores up while reading temperatures, but this is incorrect
> because the AUXADC Thermal IP doesn't need any regulators to work,
> at all.
>
> Since the thermal node was inherited only for adding vregs, remove
> it entirely.
> This change is safe also because, among other things, the actual
> driver never used those regulators anyway.
>
> This also fixes a dtbs_check warning.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

