Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CEEC7618E
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 09:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaXLftvxjCBeC906n/at9r2xXYG41ZOrYJY1BY3wajs=; b=ahGpFXlspVSygqwoiO0WKufKY0
	ZwwTeYeOQHfSd2zLrv9z59UdHfdIT/i91mWsaasdA7irW2/xaYp0QeW+1YeYRwMaucbu5OqEnAqMx
	qWRKuts4ZtZeoevcwQeV6no0WcC5DwIcr/IfqRVvSEg/amAHQTMfsGGj+0/lEF7PAt02HdZQq5lda
	0OoyyxMAUpRJieLsqoXBhFonfIBUG9gXlkowdh+qFQQ622BdwkEOYujTHnWe/6IXTjlJPnF554NGp
	aG8nBA3MNWi9kZLxi1X3N/86b17mYvydBABz4+/4ahN/zzTSuKmHxy2JtnEmE2N3GmGVwuQMsr3Ll
	WfZpOj8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqsgL-00Fppd-2x;
	Mon, 24 Apr 2023 09:40:25 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqsgJ-00Fpnc-1U
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Apr 2023 09:40:24 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-772b550b8f0so2959715241.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Apr 2023 02:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682329221; x=1684921221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaXLftvxjCBeC906n/at9r2xXYG41ZOrYJY1BY3wajs=;
        b=N+qMDfTgvmyDHwiwdSgAKqD/8b+FZZIt/1CN9rv43TUa/sFm80RtpPh1TR7QmdzQo4
         /cjKZbr/HE89ruu0up/r+ccgBVet7v+8dafpPnnobAJH3x548T57//lSSc/UQQssAaXk
         NzSZbL0n1/slaXx5AXAF8O7UcwjIWvN2sRbF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682329221; x=1684921221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EaXLftvxjCBeC906n/at9r2xXYG41ZOrYJY1BY3wajs=;
        b=PxKW8HtBBY6byO8qLrfA3mQCsrqS4EdTVF2JUjlXusS6LO78bqWWugnYH6qMybP++H
         eRMqUhERIOD3RwQDXI3z0sZAkYyZ2uv2L+JiHBqbn6T7cpczvSTh8lCNSwk1C/YAaBwM
         zD/Rtb45DE3PfcSS1F1Oenr3ygP8irnB3prvRK7XRsKd0NcLza7y5UhRigVoDZ4x692i
         Wvx30EwRs0SppgZYiqqGdEGIODx31Hw5hr4NISNU3GfT8tZTzbD0cF3p7TRJQGb1VUr/
         cRethkB9ca20vMLcieNIakyCqizx8dxVxFSsX9/wRfc1TCUgg3xBDFjdBOOtMCViCC8z
         QWvA==
X-Gm-Message-State: AAQBX9f/LQkV6ayuqqef2Nf2AH8qpsDV+d9PDUIkDk08cfsb0PVo7KEW
	vI46xEA1qE8Fa0ZWVbzlHIi7BQOtVvJV66cii8DhRA==
X-Google-Smtp-Source: AKy350YxdbDyEjTzriRuO2TWblbu0fAwk4xyw2DQQkDDUJffTyUmd9G/ij8d63XVVHL46wq3+f/VaG6UpDJg+FmEYF4=
X-Received: by 2002:a67:eb4d:0:b0:42c:9732:d17f with SMTP id
 x13-20020a67eb4d000000b0042c9732d17fmr5911119vso.1.1682329221452; Mon, 24 Apr
 2023 02:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com>
 <20230420094433.42794-6-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GJroyKkj8oZw+BQxiUkiGCb-RBOxnKRkURQz5T6=EvNQ@mail.gmail.com> <eb78450a-1eed-f914-58be-ee18d85a2d62@collabora.com>
In-Reply-To: <eb78450a-1eed-f914-58be-ee18d85a2d62@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Apr 2023 17:40:10 +0800
Message-ID: <CAGXv+5E5Ei9YffWQednLcmWBr2eXfsfjXBFRzxKJd+=O290xdQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: mediatek: cherry-tomato-r1: Enable NVMe
 PCI-Express port
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_024023_527148_47B35376 
X-CRM114-Status: GOOD (  24.82  )
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

On Mon, Apr 24, 2023 at 4:13=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 21/04/23 09:59, Chen-Yu Tsai ha scritto:
> > On Thu, Apr 20, 2023 at 5:45=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> On Tomato rev1 the PCIe0 controller is used for NVMe storage.
> >
> > This was slightly confusing for me. AFAIK rev1 is not an actual Tomato
> > device. It should be the prototype board, which is the original Cherry
> > reference design by Google [1].
> >
> > There is an actual Cherry derived device that has NVMe, though it's und=
er
> > another brand and another name.
> >
>
> If revision 1 is not an actual Tomato device, and you can confirm that it=
 is
> the prototype board... I can send a commit to entirely drop R1 as having =
it
> upstream would be of no use at all.

From what I gathered from my colleagues, revision 1 was a Tomato prototype,
and also the second Cherry prototype board. There shouldn't be any of these
out in the wild.

FTR, the production version of Tomato is revision 4. Rev 2 and rev 3
engineering samples are available to partners, but otherwise limited.

ChenYu

> Cheers,
> Angelo
>
> > ChenYu
> >
> > [1] Much like Kukui & Jacuzzi (MT8183), and Asurada (MT8192) are the
> >      reference designs.  I don't think we ever upstream the reference
> >      boards because they don't really end up in the hands of people
> >      outside of the project, and the ones we do have tend to be quite
> >      beaten up or no longer working due to extensive testing.
> >
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@c=
ollabora.com>
> >> ---
> >>   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts =
b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> >> index 2d5e8f371b6d..11fc83ddf236 100644
> >> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> >> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> >> @@ -20,6 +20,13 @@ &sound {
> >>          model =3D "mt8195_r1019_5682";
> >>   };
> >>
> >> +&pcie0 {
> >> +       status =3D "okay";
> >> +
> >> +       pinctrl-names =3D "default";
> >> +       pinctrl-0 =3D <&pcie0_pins_default>;
> >> +};
> >> +
> >>   &ts_10 {
> >>          status =3D "okay";
> >>   };
> >> --
> >> 2.40.0
> >>
> >>
>

