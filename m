Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE0CC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 02:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glBWgfS+Z8AsJzCa0azp9rra0TmC5WFPpp9wbSwIysQ=; b=WtLTn1BdF85/ice9Ob5c8ZeVEn
	LJzA1T6vSabLVCOu79TGlgnJH3fBYve2fCiSqXQYcUrbOZfZ7GlxQs2qVfr80113lGQATMFdj5Ch+
	LoSb8dj/o3uvzfMREHIDO2lAwEUOPZQG6Ugif46QhKVdI0tV2xZkR99IAMWFCkPLwl66P1luQpAEi
	r8NVLsL/qDVS4UEuCDqYbrjGCOobqMG8a2yEFpc6Xiz0YO5cYgc71DeWb2gWpSeTefQI1GfYKQO8Z
	xrjl+7JFZNk/zgKe1ErHx2Se/HdIFYQbtqQhm0Z2FnaX5apWuT7/C9GeDQTd4/wvRntK8cSCNda7C
	cES0tJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV1ag-00EmMo-8W; Thu, 23 Feb 2023 02:44:14 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV1aW-00EmJ9-2R
	for linux-mediatek@lists.infradead.org; Thu, 23 Feb 2023 02:44:06 +0000
Received: by mail-vs1-xe33.google.com with SMTP id f31so12745275vsv.1
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Feb 2023 18:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=glBWgfS+Z8AsJzCa0azp9rra0TmC5WFPpp9wbSwIysQ=;
        b=TlXON0dnZS3i2VneFhuywAEetx5CXx1Yt7HMbvQ90/JuEusyf7pnz6RQIpVd7zC3o0
         n4VlSAzuWvRIT/CCUnkBdl+Zu47u8j1gifDeC4ygpLSlzXO4n8hRdHdU6zHPr8CNCmF6
         xYxOGJMOjTDNqwpbiTnDtDSQcydd71K1J0p4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glBWgfS+Z8AsJzCa0azp9rra0TmC5WFPpp9wbSwIysQ=;
        b=QEJkIJPiM+EyyxS1DMbsSutnGvMZIOysZ5tYbaxKdr/EB6PHGrnZtBQOJKfVqNChQ3
         sONdrE7ohKIwHAr0fDLXXinr6rZet9fQ5LAfP1uGSPljPBI9LBceq3aY2K+vXxqCOHrS
         O4awz/VdIxGzRc6IsJsrLbwQfCmBKB9WOqPtTUP6c/1SMOeT9byxtSXpGO+uFe2h+va6
         dbftWVzsYV59AGq+/316zCI89vJBttcjVBGijFA/YfXda2qXGi1npdBZnwUeojr0Mb1M
         YUnESMG2ub9du/Q1M3iHHL9onq5oBkYD+cVseLXHzTt9dqxmr7N7/GRWOe910EeMqy27
         W/mw==
X-Gm-Message-State: AO0yUKV+ETSbCPP2QMVzkPl/0ZqC1d9lseiTISRkl3zu5iiLUHWX4c/U
	wVdg2Is1ur7f2/d6klbKk5cYtQci+vxFMO12GTMhzw==
X-Google-Smtp-Source: AK7set9FQsaQ4wwwGwa1iJ35QZxS7z/tqpoggFV3jIIY4bRVdaLuYXMbSLMPdYFq5+nMU1dh82/hbSINPKYjn7/TdoE=
X-Received: by 2002:a05:6102:570b:b0:3fc:58d:f90f with SMTP id
 dg11-20020a056102570b00b003fc058df90fmr2241014vsb.60.1677120241810; Wed, 22
 Feb 2023 18:44:01 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
 <20230221153740.1620529-7-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Ed-5Nq0zNzCGzez3fnW2yxW7zFx9B6k58Y4yb8P+hvpw@mail.gmail.com> <88a3fa09-60cb-bb3c-c392-286efd983627@collabora.com>
In-Reply-To: <88a3fa09-60cb-bb3c-c392-286efd983627@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 23 Feb 2023 10:43:50 +0800
Message-ID: <CAGXv+5H3XMF7ov_WfNFA=HC0frD003MRdVuBOFiBvu8zxE_rwg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] dt-bindings: gpu: mali-bifrost: Add a compatible
 for MediaTek MT8186
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_184404_161779_FF19272F 
X-CRM114-Status: GOOD (  24.25  )
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

On Wed, Feb 22, 2023 at 5:13 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 22/02/23 09:37, Chen-Yu Tsai ha scritto:
> > On Tue, Feb 21, 2023 at 11:37 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Get GPU support on MT8186 by adding its compatible.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >> ---
> >>   Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> >> index be18b161959b..43a841d4e94d 100644
> >> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> >> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> >> @@ -15,6 +15,11 @@ properties:
> >>
> >>     compatible:
> >>       oneOf:
> >> +      - items:
> >> +          - enum:
> >> +              - mediatek,mt8186-mali
> >> +          - const: mediatek,mt8183b-mali
> >> +          - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> >
> > The MT8186 has Mali-G52 MC2 2EE, while the MT8183 has Mali-G72 MP3.
>
> Keeping in mind the obvious - which is that G52 and G72 are both Bifrost....
>
> > So we actually need a new entry with two power domains.
> >
>
> ...This is my node for MT8186:
>
>                 gpu: gpu@13040000 {
>                         compatible = "mediatek,mt8186-mali",
>                                      "mediatek,mt8183b-mali",
>                                      "arm,mali-bifrost";
>                         reg = <0 0x13040000 0 0x4000>;
>
>                         clocks = <&mfgsys CLK_MFG_BG3D>;
>                         interrupts = <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH 0>,
>                                      <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH 0>,
>                                      <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH 0>;
>                         interrupt-names = "job", "mmu", "gpu";
>                         power-domains = <&spm MT8186_POWER_DOMAIN_MFG1>,
>                                         <&spm MT8186_POWER_DOMAIN_MFG2>,
>                                         <&spm MT8186_POWER_DOMAIN_MFG3>;
>                         power-domain-names = "core0", "core1", "core2";
>
>                         /* Please ignore speedbin, that's for another time :-) */
>                         nvmem-cells = <&gpu_volt_bin>;
>                         nvmem-cell-names = "speed-bin";
>                         #cooling-cells = <2>;
>                 };
>
> There are three MFG power domains... MFG2 and MFG3 are parents of MFG1, on that
> I agree, but we can avoid adding a new entry just for MT8186 and use the MT8183-b
> one while still being technically correct.
>
> Besides, Mali G52 and Mali G72 are both Bifrost... so I don't think that this
> commit is incorrect. For the sake of simplicity, I would push on getting this
> one picked.

I'm aware. In case it wasn't obvious, Mali-G52 MC2 2EE has 2 cores, while
Mali-G72 MP3 has 3 cores. I think that is reason enough to do a new entry.
Otherwise you are describing power domains for 3 cores for a GPU that only
has two.

> Unless there are any real-strong opinions against...

Yes.

ChenYu

