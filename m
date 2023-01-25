Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97F9C54EAA
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 15:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MK9Ce7LoyUpoHVdDI0Q6deRxLh9svgL/G7RdzcTDYaQ=; b=isTZCBZjfr9O+pZucFvdwGddNB
	UHPkZs0vGQGS3kHuUgdWIRri47Ng40bbkxkPO3jCmBuQllxnKFDaVkOqCV9jN4rB/Z9Lt8C6nvuK/
	b2OP8IUrtQeTars/aNhpaI6BtrZx9T0vdXLWK8BKTpLgEawJHEzVoFeZB1I08BnzJCq5juEXLj/L6
	DABP4eeKK13kSauFP20ZSe2yqB1puxCvOd+t0gvzOw58hv6M+EuGu/XkydMCA9lxWLJIqkFeiudKE
	XHwBmTyyb9r62/f7bh/8y6fFpDM5jIbx3AmKqcvnsbbAInw2XsRg72bMnQoIDXb8d3E/EUeo8AR1r
	9pupD2bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhTe-007lNV-C0; Wed, 25 Jan 2023 15:14:18 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhQz-007kEk-R9
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 15:11:35 +0000
Received: by mail-ed1-x52a.google.com with SMTP id y11so22060681edd.6
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 07:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MK9Ce7LoyUpoHVdDI0Q6deRxLh9svgL/G7RdzcTDYaQ=;
        b=LySUeIdtlIdpu5P4Kgo82re6kq4R6LXSHS8u8/LBIhHqCR82KIlhMlw5ymVaJpi70D
         S+3hcT5ACjyUAC7ydHn+LbSTc8PYmMxWqbMHJOJZd09rbrTyxpGMKOy/FJ6TwGwawUO3
         3gdBQg8cwgg+i7TwUr30ShHh8R9d3/c0tKmRTdBQ3UNP3FI2MQc0vwPloZMwM7C0R/y8
         QDY+Cmg+3Jvoa6OPYSJdPzf1T8dI0MVldCHrlCW3jW0UvO506xUDHdLpqow7PADPcDLJ
         a1uw6AJqUjW6Lqqxn0rDd+ilQCOzzhdDNxNQToiQPzqKUvFVHZQE1xQZ6FTnKxmmWNUi
         ZdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MK9Ce7LoyUpoHVdDI0Q6deRxLh9svgL/G7RdzcTDYaQ=;
        b=E7XbrDskw9zSxcJzyBG1D82RLJzMql57+2IOp0ASiHhKBGCMl771JDsbSEFk38xSgy
         v0ynkUaiRAtFTP44k9pjhbovatJYeLERFnLVp9s1FPBokeEuFlsNbcw3kHkrJHJSXphS
         dD+K2rXGSJVwiI1fmwFhm/RxC9UD5MRhw9SM3GncmQd3gW3cWSmQ23jN2kprI2M1Y0G4
         rsBeyRSbfYmWuEdF7V0FARQqvRuayvBYh63ZuVNcynwqeCH5yqOTniIGKNY6Y8c+S17H
         O7eZbWEscF1xXktGvgSqF2U9+o86DbbHLf0A3uOqBpm7JbadJCxOPJko6YbTEj9cmvY8
         PczQ==
X-Gm-Message-State: AO0yUKVw2gsPfggouD4oIZvCKFWcOsO+xIOOrFlLCg2f8lQzl1ItEzHD
	syafX7p9OojIEsrrHmDCzHZFiIhO5MuLQxlL0LWJHg==
X-Google-Smtp-Source: AK7set+/d6h1+icdov+3bpJCPxwXk9ybBiTH6QptRDsERwtuuR1OBU2F9WB1DSqGNVJB0APKd2JKhc35tLg6EYBsWtg=
X-Received: by 2002:a05:6402:d59:b0:4a0:90da:4653 with SMTP id
 ec25-20020a0564020d5900b004a090da4653mr768644edb.153.1674659489645; Wed, 25
 Jan 2023 07:11:29 -0800 (PST)
MIME-Version: 1.0
References: <20230124131717.128660-1-bchihi@baylibre.com> <20230124131717.128660-6-bchihi@baylibre.com>
 <80ce4ea3-6ebd-c249-45bd-a2f04343690b@collabora.com>
In-Reply-To: <80ce4ea3-6ebd-c249-45bd-a2f04343690b@collabora.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 25 Jan 2023 16:10:53 +0100
Message-ID: <CAGuA+opCcdbPbasadEFbKw1nSy-kbK3WzKG=wXn6dtzynjrY1Q@mail.gmail.com>
Subject: Re: [PATCH v11 5/6] arm64/dts/mt8195: Add thermal zones and thermal nodes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org, 
	rui.zhang@intel.com, matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org, 
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_071133_952343_D9645A26 
X-CRM114-Status: GOOD (  12.63  )
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

On Tue, Jan 24, 2023 at 4:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 24/01/23 14:17, bchihi@baylibre.com ha scritto:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > Add thermal zones and thermal nodes for the mt8195.
> >
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
>
> You should change the commit title to reflect the same syntax that you can find
> in a `git log --oneline arch/arm64/boot/dts/mediatek/`.
>
> arm64: dts: mediatek: mt8195: Add thermal zones and thermal nodes
>
> or
>
> arm64: dts: mt8195: Add thermal zones and thermal nodes
>

Hi Angelo,

Thank you for the review.
Should I resend with the fix?
Or you would fix it when applying it like Matthias did for "[PATCH v11
3/6] arm64/dts/mt8195: Add efuse node to mt8195"?

Best regards,
Balsam

>
> ...otherwise:
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>

