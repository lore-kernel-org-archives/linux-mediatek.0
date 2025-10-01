Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E6DCCA470
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Oct 2025 03:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbDGpgTcV4nPy99Bde42+h9SYqbXF4/JT7azRtjchCw=; b=sOzS+1C0iTBoEBwcOxbh6dq4a3
	rit5BNPS00H0e0EMcnRt2BLe9KAL6ere1YNqsEZHW6XRCyflvr3DqfgSwlHJqRm7O2jWW2R6Iek0J
	x7byOOHR64O1r1BD79GvEypoAt9HGfwa/GHBduhku4ln4CWG7BCHqsJV10XCMGjJa4luSR4k/iEE3
	E9JSakpOHrOKE95NlzYISOt/QATo+DSotvLz3w181v6y91/WP/pKeb1Gsb1gzN16P/RHFuKhqmKeo
	owz7Zs6iPqsIvXWxU+sdnyGFcZv8xlAgD93z9QV+dL+ArB1ZzTQR+H+OKYTCnvZWTstW7sjYojwbm
	PkZwsbvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3npf-00000006eEY-12Yq;
	Wed, 01 Oct 2025 03:48:47 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3npb-00000006eDg-2MfZ
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Oct 2025 03:48:45 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-57b7c83cc78so569455e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Sep 2025 20:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759290521; x=1759895321; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbDGpgTcV4nPy99Bde42+h9SYqbXF4/JT7azRtjchCw=;
        b=GpqFjlOs595FPqbvcrq0r7UsUlKw03NvM28ysbC+d6kMMshw8sgYoR7nm8iE0iv4xN
         LV0hyy0wudqU3pdVbeZxDNlyJPLqC3FNr/5O1HWzgMpvwvXLYsr5kXdtPXI/RXz/6DWa
         4eTK3pndoGHI/1ar9YZZYBUZDbRyJYTHes5vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759290521; x=1759895321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbDGpgTcV4nPy99Bde42+h9SYqbXF4/JT7azRtjchCw=;
        b=SIh9tMklnJ/zs3lGSmBOkctiXgVPc6i+aY1kFXtsvmY5jkid3Y/990yJCXxRf+QhJI
         9PsFBX1UcsfnJEq1lzdQceIhg64LJsqphiBDpr/nShzZeSgo0to56Ku6aw8JP6K4Ra8I
         djluqsB8rNzOY4K/niqNGPjOeUG/+B6jfetrehw4crrf6rsE460YZHvaMC9QCTWFbWqK
         eoRDDZK9uoBQ8nJDSAjIN5qPWRIj1yv3KAa+NA4uQPsJalo9ZBt3cgMQLdUDlSAaRdL9
         zjQAeDojqICzvV835kRZYBRhNIAii3tcgQi+okdytVO1gKPAejuubWhXJ7g2nR5fB69e
         W4oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw51h9OtCXw7g/PLM33byzEojy+kxHMKRgAcRL+gnoOyI3VyGzrwegYsEHHvND2DM2p9jeHgZCqYW2IgfE2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg9ibs9qor7IeMvMnS8u5qWS6S0cdFb0BN5nXOoLJFHAmQ1c6/
	ZvFqb7x9Irg1mXNUkSPHKIUXExFEx6BpE3im6Lx30vrdXcundUpsdC6bKFgHJQ9juaFb7xT2vyd
	1LCYcbXFqgaT8eZ9BnpFDOc7304iiEytuVmrJbIF/
X-Gm-Gg: ASbGncuKX7DbIMAJ8yBnt8wL6k/oC60wrerApnmmNtK14D3tIz2/3nkjOyQO3IqsOAV
	C6zBEujPkTtEsoV1lGt3DlDz0L6bAVP5S9WdDDDx9OWUGO1lo0cu8eLikOCnVmMFaIbnYG3UKhA
	iRZzD3TbQvfIHfhE1KsFkkFA0GaEtRq7GvnAO7aOQDdin3O0i7/uwqDVzxx5oQhZzh4Hh42qss3
	uPBVRri7glSv6qDAaGiay1Hj3y4fHiCCm0mNZYtcjPznGtxQfppGGL+icpB4w==
X-Google-Smtp-Source: AGHT+IEt27GdUNuEil1oCZ0SLhwUHChkXL8gmJhktqVVplGqcGKrSSp67qADibM4PY5Cnx6ufacc+rJwkmcCX3eGhbM=
X-Received: by 2002:a05:6512:6181:b0:577:a108:93ca with SMTP id
 2adb3069b0e04-58984e225bbmr1821361e87.28.1759290520880; Tue, 30 Sep 2025
 20:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
In-Reply-To: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 1 Oct 2025 11:48:30 +0800
X-Gm-Features: AS18NWDDl3OS7A4mcJKeQv_2tDSls1y22vmY0gN81pxraCtuEd9IP-mkQAX3bNg
Message-ID: <CAGXv+5FQSETv62FS32=eadBWwZPB_ShaJ3_P0cksnL=sdBwkFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add board-id support for multiple DT selection
To: Amrit Anand <quic_amrianan@quicinc.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, kernel@quicinc.com, peter.griffin@linaro.org, 
	caleb.connolly@linaro.org, linux-riscv@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_204843_807294_2715ED06 
X-CRM114-Status: GOOD (  24.42  )
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

Hi Amrit,

On Thu, Mar 14, 2024 at 8:13=E2=80=AFPM Amrit Anand <quic_amrianan@quicinc.=
com> wrote:
>
> The software packages are shipped with multiple device tree blobs support=
ing
> multiple boards. For instance, suppose we have 3 SoC, each with 4 boards =
supported,
> along with 2 PMIC support for each case which would lead to total of 24 D=
TB files.
> Along with these configurations, OEMs may also add certain additional boa=
rd variants.
> Hence, a mechanism is required to pick the correct DTB for the board on w=
hich the
> software package is deployed. Introduce a unique property for adding boar=
d identifiers
> to device trees. Here, board-id property provides a mechanism for Qualcom=
m based
> bootloaders to select the appropriate DTB.
>
> Isn't that what the compatible property is for?
> -----------------------------------------------
> The compatible property can be used for board matching, but requires
> bootloaders and/or firmware to maintain a database of possible strings
> to match against or have complex compatible string parsing and matching.
> Compatible string matching becomes complicated when there are multiple
> versions of the same board. It becomes difficult for the device tree
> selection mechanism to recognize the right DTB to pick, with minor
> differences in compatible strings.

I plan to revisit this topic, and also include device tree overlay selectio=
n,
at Plumbers this year. I was wondering if there was any progress or changes
on your end?

Thanks
ChenYu

> The solution proposed here is simpler to implement and doesn't require th=
e need
> to update bootloader for every new board.
>
> How is this better than Qualcomm's qcom,msm-id/qcom,board-id?
> -------------------------------------------------------------
> Qualcomm's qcom,msm-id/qcom,board-id are not scalable for other distingui=
shing
> features as we need to add a new property every time. Board-id property p=
rovide
> a solution that the bootloader can use to select appropriate device tree.=
 Board-id
> encapsulates soc, board, pmic and oem identifiers. Qualcomm based bootloa=
der can use
> these key-value pairs to uniquely identify the device tree. This solution=
 scales well
> for cases where additional identifiers would be needed for device tree se=
lection
> criteria. Adding a new tuple in "board-id" along with "board-id-type" wil=
l help support it.
>
> Changes in V2:
>  - Based on comment on V1 related to challenges on designing common bootl=
oader for all
>    the vendors, where different vendors can have different representation=
 of board-id
>    and the best and exact match logic can also be different for different=
 vendors, moving
>    the board-id definition in qcom specific binding.
>  - Adding support for board IDs for all the boards that are in kernel.org=
.
>  - Adding Qualcomm bootloader best/exact match logic for multi DT selecti=
on.
>  - Keeping list of other vendors in CC for comment/awareness related to t=
his requirement
>  - Link to V1: https://lore.kernel.org/all/1705749649-4708-1-git-send-ema=
il-quic_amrianan@quicinc.com/
>
> Amrit Anand (2):
>   dt-bindings: arm: qcom: Update Devicetree identifiers
>   dt-bindings: qcom: Update DT bindings for multiple DT
>
>  Documentation/devicetree/bindings/arm/qcom.yaml | 90 +++++++++++++++++++=
++++++
>  include/dt-bindings/arm/qcom,ids.h              | 86 +++++++++++++++++++=
+---
>  2 files changed, 167 insertions(+), 9 deletions(-)
>
> --
> 2.7.4
>
>

