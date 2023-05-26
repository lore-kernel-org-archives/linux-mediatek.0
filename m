Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06520C7EE23
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 06:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qi7D9mvtZvdngBJp97OBVBXhgpmVbWBZr97BGMtinqs=; b=gVmUWxi4jfFIyD3I3sFhHjVmOq
	5aW4HXhkEQs0atFCFPeb2lcwxLumk+TgBjq6STTuTB+2KkvDDL/zY1PsF/hTKY1ft3yBzRt8g9eeu
	0kAzuX2gJPKaPx4jMGPmnEvhmCn8gNcktygzqMl3jWsQe6031rens1lCwjkayqanwNdS5CU3DZmqB
	Qns85YTQ/Q3u4m4mpZvjKV0J9fKOI1VVjyhnKYn8wSbWoH9/YMR4xhrkYD/mC9Z0ZFGktcU3BYmpB
	r8trOootxHl77x8THGTyADngt3XBgOoYEyIVZ46etTAr0Y3kx1M3vigrz0InMN/dufd5LmL4NO3sl
	0+kICsWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Qj7-001DFZ-1M;
	Fri, 26 May 2023 06:15:01 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Qj4-001DEH-1v
	for linux-mediatek@lists.infradead.org;
	Fri, 26 May 2023 06:14:59 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-33af9b31ef3so1294705ab.1
        for <linux-mediatek@lists.infradead.org>; Thu, 25 May 2023 23:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685081696; x=1687673696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qi7D9mvtZvdngBJp97OBVBXhgpmVbWBZr97BGMtinqs=;
        b=QbEACKO6ccH3MPiTtpcel0oqQM6z5K91a36oAP+s6lVgt9JS7k2R2rLNudgD+8vzS0
         BL5tb90LqLRnR6QuqaSdn1pBpJqkYmBIYyQZVZMQf3KFXS64EY11ECCD5ix9XOmnyxIx
         mFJCF0niwZqWQOuQ+5gzcDnmOL+5ZwlFpqu6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685081696; x=1687673696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qi7D9mvtZvdngBJp97OBVBXhgpmVbWBZr97BGMtinqs=;
        b=XDNnAM/ZWwimv8B5MW1FeWZ9KHqAhERlW8HvWsNTsVD3GVtS4UBiBB8Fx1LiWG/ui5
         GMyhoj3y9Hn99vCpPETuONRJ7LOtmK11E2+UThYjIQcjuWjKJJw5DL5dESrtR33X5jaZ
         SBR4+h1YoiaDGSRxn+dpkJKT3ZzKSlXqXeOfUvQr8Rs8sY7xc58RXtqBldxc7YZIXYk5
         TAntwfW9n6vRRiV38UlMhKXx6LF4dZghtBenfAAZxVsgpipzwxHZJRaWOeebrFtpXeHS
         W2mqmq3DUO0Ic2ZeH3mHXE699hWpI6Zj2Sjt9IVpfQi/wDRTyVHUgfbS6CRTpb7cNpXT
         WRpw==
X-Gm-Message-State: AC+VfDzG9cnnrTsuqadm74aFqHh89QK+hDPYPauTJ3uG5MqN2SuxwUBC
	TuAWqoBnh/Amv1k1aiM4mzXAn7VuHh245em8AqDP6Q==
X-Google-Smtp-Source: ACHHUZ5FwfBds24ldh80wDy8EcOs+yRHNoW67/ghdIa4MVk9kkBlHtdpjIo0Co/rJ7v/ARevPx/+p9aV+PcNPIWm6O8=
X-Received: by 2002:a92:c00d:0:b0:331:1f0e:79b7 with SMTP id
 q13-20020a92c00d000000b003311f0e79b7mr822785ild.3.1685081696748; Thu, 25 May
 2023 23:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230417123956.926266-1-treapking@chromium.org> <CAD=FV=VoC2gK5MtBU9qhVxJwRRUGBMLT96UH7F+QKcmGEYo_sQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VoC2gK5MtBU9qhVxJwRRUGBMLT96UH7F+QKcmGEYo_sQ@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 26 May 2023 14:14:45 +0800
Message-ID: <CAEXTbpeGm4wt_FFGDawfxKo9L4dvFw++=WiiucWcaR39VFPfvQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8173: Power on panel regulator on boot
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_231458_632030_66312115 
X-CRM114-Status: GOOD (  13.94  )
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

Friendly ping on this patch.

Pin-yen

On Mon, Apr 17, 2023 at 9:32=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Apr 17, 2023 at 5:40=E2=80=AFAM Pin-yen Lin <treapking@chromium.o=
rg> wrote:
> >
> > Add "regulator-boot-on" to "panel_fixed_3v3" to save time on powering
> > the regulator during boot.  Also add "off-on-delay-us" to the node to
> > make sure the regulator never violates the panel timing requirements.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
> > ---
> >
> >  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

