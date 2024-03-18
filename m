Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0027EC54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 21:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oN3ajsjXsAF9HfH4yepxydlxom6CmZW2+KuqWPApvOc=; b=JCXlMo744e2vS2bn+IgAaeOeh8
	XmmH1RAHr287598/m+sgCMzqSRRexVmqNRmDFBZVQcDn7vypCPphj+8/PLM/xRhKIY/72oKZhfuD8
	GvsNrRn9xSNxAaITTQ9SvgsQl/Y/qt3wAKP79I5BjyFXW1LVZLo256154XYMjNwinDGnxv6GR4gWY
	MXoQpW9XU6lDjsStSaEd3Ar1EnU1THogrSg5Aqd27+bCcu6gupIJk2v+3rQ8gclvZ1ae/esojCBrQ
	exna3MWZfSoYI/96CU2TYTJ25cTRkB4QyX4m1nfT3gryMGW7yUKDfjtWiD6BEBVOEjfLvIT2PxpXl
	wBeo3HCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKeo-0000000AEyZ-2fyK;
	Mon, 18 Mar 2024 21:36:34 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKek-0000000AEvJ-1JsF
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Mar 2024 21:36:32 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-68ee2c0a237so35827666d6.1
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Mar 2024 14:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710797784; x=1711402584; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oN3ajsjXsAF9HfH4yepxydlxom6CmZW2+KuqWPApvOc=;
        b=M6gFFGFx21pKN/0Zx30g6pDYIWmui8q/6G0e5vM6TESZH6vrdnwviaPnrvo/SLPSI0
         z7hZ0G7a2B7oVOZZyVBZb7M/QurzWN0b+5NaupAvklJCBGL40CxaZQLnLaMNHWflvus8
         ixPD6zAU8M1wTSMy1+3hhIxnGbXaIhpzgLEjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710797784; x=1711402584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oN3ajsjXsAF9HfH4yepxydlxom6CmZW2+KuqWPApvOc=;
        b=eBA6TDEC2+6ZAWxXyaOPT8rJidqSgXuIAM/6vGIBNsK8M/7FpDHmJCSWzrT/0Sr0xk
         Op1uOFaRQm1LB4jutBV77LTapXfrkBFEVD+37BWMFz/TRLjoMNvlWWjTwBLyRq26ELIi
         BHIyXIeaGeB1AsAmX9Lz3hI4CzSblkVLlS7acrGHwJW6bY/rtgzjtqxq2Msfk0Aaxvb5
         1r5n/Lyecszs0xaKdjHbrVFh4Lbv0BO7X/8sHK3XXmLTuWg/JFjZfJpLw6V/i63Giowf
         JSIp2Ow0dI2k3TacHByBbi/4ZcWw2l2G9nD23AiSDU5t47G3mx3nu2RH1vFoy652pcdQ
         f26g==
X-Forwarded-Encrypted: i=1; AJvYcCW0craNMWu9eic19pMsEQTiMEqa5mavtmwPpJbxPUka3FfmOhuFf962ap07DaUkNwODeKqXohi3WhtOaEtbfPXW0TqOsTsIAE7E/cYis12Rf/9B
X-Gm-Message-State: AOJu0YzG8nWafhALIAYnQEpc0kNtQi8fApPdqprsTPteYJ3mSQun+1uR
	EvYtzMJJXvZhlzBHG9b4mCWfLjLSApCAPDpclvOCW/tPORvxSBbiuBOTogtlDFuFHqJJiRUy24E
	=
X-Google-Smtp-Source: AGHT+IHwTROqCP9yvhNgc0JQqbJvPBaAG1VX5yZYsC1dajLdVs3jrHJXuDsGyPZojyPJk7y1AJ2N2w==
X-Received: by 2002:a0c:aad8:0:b0:690:abbe:b13d with SMTP id g24-20020a0caad8000000b00690abbeb13dmr1301728qvb.19.1710797784007;
        Mon, 18 Mar 2024 14:36:24 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id g4-20020a0cf844000000b006915face0easm5526026qvo.70.2024.03.18.14.36.22
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 14:36:23 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-42ee0c326e8so77711cf.0
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Mar 2024 14:36:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVAOsrjTZ1Xrr45ZkwzRAmdBRsYVMOqcS3BXoDRwPsi/yDgK8Cxhi6K2trkUREceqDFkgiWzkf3USNVdjVsQOiuHgYXtAZ15BjiTX0f/UauiVg
X-Received: by 2002:a05:622a:50e:b0:430:b590:e88c with SMTP id
 l14-20020a05622a050e00b00430b590e88cmr111577qtx.6.1710797782513; Mon, 18 Mar
 2024 14:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com>
 <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org> <20240316-germinate-browsing-6865db3a44d7@spud>
 <20240316-herring-skies-6ee1d4a9c0d2@spud>
In-Reply-To: <20240316-herring-skies-6ee1d4a9c0d2@spud>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Mar 2024 14:36:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZB9Dqsw6+2WBdWxaQVA9NgK_W2n0okBOU0haDMSogPw@mail.gmail.com>
Message-ID: <CAD=FV=VZB9Dqsw6+2WBdWxaQVA9NgK_W2n0okBOU0haDMSogPw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: qcom: Update DT bindings for multiple DT
To: Conor Dooley <conor@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, Amrit Anand <quic_amrianan@quicinc.com>, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, kernel@quicinc.com, peter.griffin@linaro.org, 
	linux-riscv@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, Simon Glass <sjg@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_143630_548439_75F86A7D 
X-CRM114-Status: GOOD (  29.66  )
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

Hi,

On Sat, Mar 16, 2024 at 9:51=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sat, Mar 16, 2024 at 04:20:03PM +0000, Conor Dooley wrote:
> > On Thu, Mar 14, 2024 at 02:20:38PM +0000, Caleb Connolly wrote:
> > > On 14/03/2024 12:11, Amrit Anand wrote:
> > > 2. A top level board-id property that isn't namespaced implies that i=
t
> > > isn't vendor specific, but the proposed implementation doesn't even
> > > pretend to be vendor agnostic.
> >
> > I pointed out previously that the Chromebook guys had some similar
> > issues with dtb selection when the OEM varies parts but there does not
> > seem to be any of them on CC here.
>
> That's maybe a bit harsh of me actually, I see that there's a
> chrome-platform address on CC, but I don't know if that's gonna reach
> the guys that work on these devices (Chen-Yu Tsai and Doug Anderson in
> particular).

Thanks for the CC. Yeah, I don't watch the "chrome-platform" list
myself, though maybe I should...

The Chromebook boot flow and how we've handled this so far is
documented in the kernel [1]. This method is what we've been using
(with slight modifications over the years) since the earlier ARM
Chromebooks and is, I believe, supported in both the depthcharge
loader (used in Chromebooks) and also in U-Boot, though it's possible
(?) that the U-Boot rules might vary ever so slightly. I haven't tried
using U-Boot to boot a Chromebook in years.

The current way things work for Chromebooks involves a heavy amount of
duplication. We bundle an entire "DTB" for every relevant
board/rev/sku combination even though many of those DTBs are 99% the
same as the other ones. The DTBs have been relatively small and we
compress them so this hasn't been a massive deal, but it's always been
on the TODO list to come up with a scheme to use DT overlays. We've
also talked about bundling a device tree that has the superset of
components and then using an in-kernel driver to set the status of
some components to okay and there is some overlap there in the
possible way to represent board variants. I think Chen-Yu is going to
talk about a few of these topics next month at EOSS [2].

In terms of looking at your specific proposal, it's definitely trying
to factor in a lot more things than the current one that Chromebooks
use. The Chromebook model was "simple" enough that we could just
leverage the compatible string, though the way we leverage it has
ended up controversial over the years. Yours is definitely too
complicated to work the same way. It seems like device tree overlays
would be a better fit? I'm not an expert so maybe this is already
solved somewhere, but I'd imagine the hard part is getting everyone to
agree on how to specify stuff in the DT overlay that allows the
bootloader to know whether to overlay it or not...

[1] https://docs.kernel.org/arch/arm/google/chromebook-boot-flow.html
[2] https://eoss24.sched.com/event/1aBGe/second-source-component-probing-on=
-device-tree-platforms-chen-yu-tsai-google-llc

