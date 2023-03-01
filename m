Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DC4C64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 04:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28yKfwjO/0s4rJfe6O0bQSgJmZe5IPEVZaGiHKCxTg4=; b=17naBQOkmrDYrvvztIDtrvqH+Q
	s0RmnBu19lbsavlNFAnKBVcP8e0dMQeURhClFDbjuIrT7avOMSY9CtyMScPZzdt/nkmhNqZXaDQ7Y
	0HEGoHG1RpMGpyG5VQQPmxoEM8MupxIvGtxe3+j25qH9ZhEl0bB6wyH1zqEpAOhUZt9Ts3pmDJv5c
	PQQ/3m6iLqBwWJxz8ex5mC6y0LVR/1qWXEH2GFN+/CfDVlAm2Zqxq72jN9V7Innc7TkAR1KALVfU5
	1hrQN6tki9bZz1wosNPrGekvCs2HH7L6v/wAcYjf4eKgizJeLj0tSGz1a8J4ZEQB/nm8bvNhB+saB
	9gqFXmkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXEEi-00F6SX-BC; Wed, 01 Mar 2023 04:38:40 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXEEY-00F6QQ-N9
	for linux-mediatek@lists.infradead.org; Wed, 01 Mar 2023 04:38:31 +0000
Received: by mail-vs1-xe29.google.com with SMTP id s1so17975670vsk.5
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Feb 2023 20:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28yKfwjO/0s4rJfe6O0bQSgJmZe5IPEVZaGiHKCxTg4=;
        b=ltkNxU1yuA7SsUdnMUKFZgbgRjVolNxel8F30fl8qwMT2mZ1gkbagUUvp7KPIZb9Aq
         cqKY6RXZOfPn7rsWN+BPGfLphSlLwzpHvF67QeDuAvB4SvFJml65XJaT2vWDSQN1afSo
         AZ1zD+02Au1E68OYq07MYfZvCt1TE1R5m7iGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28yKfwjO/0s4rJfe6O0bQSgJmZe5IPEVZaGiHKCxTg4=;
        b=tZ50l1/jmKHu2rjUJQ7AYEUQXqTLJVYgSUZbOGzTJ2unStL97VJ4xDXX2xZzqpDMB5
         u/0dy5l0hTf1YEuhzmJpgQhkDTFUE+mrJpTZdSOk6i8gjd8hpFgF2fVF3RRA/zszY1oC
         2AWJV7BSrxaxixraHqCUgtSU45z2vohmmk6exRJwUoEmSNVE2tU1Xob1imDlaDC7Ents
         vtqGFa/ydHqm1avZxObtSx8FxAtxlZSwztMDNq+hBh42umSFt6YohCb9a24RhpFTmJf2
         7lPRGd1fgDHJX6ujKnN8ePhHFJoz90ANgHpiEz97ZjJQaLa37MFRZulsryVsV4//O/Wj
         4Vjw==
X-Gm-Message-State: AO0yUKWTsly9NtnmQDuSQiwcp3H2Z06SZtdBs1ioX3oByyT/OHLqFaCe
	SVhva99Bqhfs2BYheghfTErIUulN4LJjpmGApn5YUw==
X-Google-Smtp-Source: AK7set91+2QnXMA/l4LPBLXs/2Khip/xRn9a22mox+dUKEcVere1J9qIQiz8Gao6UOQmlxbGnEkxjEAOVVyl6273gFk=
X-Received: by 2002:a67:a641:0:b0:411:c62b:6bf0 with SMTP id
 r1-20020a67a641000000b00411c62b6bf0mr3655682vsh.3.1677645507920; Tue, 28 Feb
 2023 20:38:27 -0800 (PST)
MIME-Version: 1.0
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com> <20230228104741.717819-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228104741.717819-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 1 Mar 2023 12:38:16 +0800
Message-ID: <CAGXv+5HB-0XYw-vs97fbFu6nXWOOJzCf=rK31aL_ecC04vkq0Q@mail.gmail.com>
Subject: Re: [PATCH v3 02/18] arm64: dts: mediatek: mt8183-kukui: Override
 vgpu/vsram_gpu constraints
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_203830_757850_EA934BE5 
X-CRM114-Status: UNSURE (   7.53  )
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

On Tue, Feb 28, 2023 at 6:47=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Override the PMIC-default voltage constraints for VGPU and VSRAM_GPU
> with the platform specific vmin/vmax for the highest possible SoC
> binning.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

