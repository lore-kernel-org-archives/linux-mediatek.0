Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C319FF4612A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2026 14:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=; b=aVLuClwq3W/eLAIIL7WZ/7f0vA
	y77q/45AKB1IiRzqOMamKt0tPuKN8+KMZfnitgn/IeptxKT37ZOnZIVXhXbvmhI2Oueig5t+9dW7u
	tiNu+EFJt6/rjQddtUsfEOxYdIr25THzygQsn5Mz+VnYS6zcWO8eqfXXdkssPf+za2cBe4xcrLbtY
	sJmnbxYdePwpSO3TXB8bAPG5QcR5BQKBdKjpmau6isrQha1aLO1Dyk7il3JzH+ly5IIgEJzfdeR/x
	PiHD0bMzEr0+J8Tk5vP1QQ1Uo0gf+HLkG7/rb2SN2Uk3Ku4uzk5jd20vwXB6isa0tNLgsZbMAmrAE
	cJdLekxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4gHt-0000000Gvwr-3JDw;
	Mon, 23 Mar 2026 14:29:49 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4gHr-0000000GvwC-26Uq
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Mar 2026 14:29:48 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b982b0889d8so31846766b.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 07:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774276185; cv=none;
        d=google.com; s=arc-20240605;
        b=iBlFdNI/sKOqi0YdpZQkKa+GWKkkduBzCXdxJJTZoRNa8eARXRk7JSsw320ynutEdD
         4vq8aUqyZSmxUi5/cREcTJ9KBDb16kIZLZ5MuUUkW+gqvmUfHwFcoTTzEUpTPnjJ0ncC
         q1U+bEpWU9oZac3SIaDpPQ1gLjMxOABOR4DCBLccvaL66+XHtw/PFClE1j/ps58CLQJR
         /priwB/6PFGMzUIS5IPHDdFJ+BS1B/N+nua6bkV+ZId4P8x6nyb1egYYPXgWtsLQos7W
         FLXSyu8NtoG20PKsziH9C8IdeAz3rFuqBAOW29lTQ/VoToP0kITeSGxUQD/8I29kknXJ
         4Fww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=;
        fh=oF60GoNMR7arjyZ1AD0mcgE24jezBQTFLHiTWCCT0ao=;
        b=k6h1/siuuxmCr+E4cGQpn0RYLS5qk5sZWSvXES5sm1XgKV4MFmqsdJtjdl7hPUkrN0
         34rcJi0qyxZkxlmWEI0ynIHvzW3KpNVh+CBuuA16zV81uuCghHNo5WBZex+PBr8sr02K
         ouGKYQxKx6PbCBgk+Z/RS+2Hr2A0k0Q4VhiCA8cFgnylA3K/MLwi5OXdoT4+/5ZftZM4
         xPiRpuIkbraRv3UC+EJj1MyzHyS8REM8XR9hhfEN3Y7o4FHvY4A4dAUGCgvd12yT8Jme
         AY5M+a2S8ML3FukBglMiO3ThWwF33Cb3SZrqfZS6CIpRUrdfxignuO5o5I6kUw9xnrpM
         uMIA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774276185; x=1774880985; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=;
        b=fPSECC+MV4ZKoyJykv07BqbhSXOnKhnm/Zkf7f/SIcbA5zI0Swk/fb9N6FMZsSkfjn
         B7dh5GLQILr3TCK7PwQKPaUt3sp3FkkcdgAyQTQJOdY5w4iY/UqYTa59HwFRJbNH8wYs
         uAOAgNW7CWRDcz9kg8GHjvQ/zPAKE5RibrwrikR673pYwn+wItf2YrQQ3451pBxdpTv+
         L2VAKuNuldIru/JHMHm4RBsw/0jVN7UnxSRMjldWFfrobKZXAI/63VOF2yrZmUBY0aXx
         DLsxVPlg8RysKQYMZvmRurhEsSHbKkpqtzDK7Vzu73d7D4ahgRUAabW4fhIQHhHXhLAe
         L4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276185; x=1774880985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=;
        b=ClKShj1bKcKtbt4qI92r6akg9RjE+nVVblJp6BiJQxn51BxxbHSBbkpaKlcXLbFwRQ
         iwnW0FMT++CUfidWfd8/hYZn2SwAhYltHb5KAzNKbiu1PYbPKszFhh3OS6KGAmbrnMGL
         QCHIYsnWHH3JOs6kQj24FU7xzJG7f+IM/MkYtrVPo+FN/pRSnx0XFqJr7zaM4s4LzL3w
         dxQ2aYuUQX488Bqjb3ksPJYDxNwgcZYVbFjgOaNzZ9nubJj5zbbZ9GA0/zLnXuamih+a
         I/69OeFte0wS1L0c3m1fuutkOkjBbgrEPn7CmnktMaqsMfv+deza/+MzZKsoFcmBdnLr
         qCHg==
X-Forwarded-Encrypted: i=1; AJvYcCUFTurgNG43hoJQFMUCiawyETA0HjX9chWOpbpy8dgKvhxPPMqpirfUrwl26q0Oq0cd8WINPFw2AgEl8LPJfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwigEGRBorNRchYIeh3ziLqMLs2BOjjW2wIdTDpLB4XmB5DK1QI
	1xfL2GCSg9me1LbwZly4vbkhQPn6ZEm+xtjfVwOX2bQ8Mmmm8BJYPCbKfK6fnFDxlGVCqTezIHV
	kTu89SD23fGeYnlOwg7wDs/D5hDhk9QP+/bQxpu5n1A==
X-Gm-Gg: ATEYQzzwQ3EUo2yLlY8oBDyDqefc8WqenWts76T2UahKF5PeFbDSo181FNavKReDW5B
	xNzG0ivrAMnnBFkAX1xzTlVMKcVVz+a1O/MS3de3BVmxtqEV9i8uynf1gABv5tJ3TwUZCumZ3cU
	OeU4iH3bI5Yd3buJj8D/mi2RTxBmhnMxoj3s3am6gmbCX9OoPUJIPuYM8HMpj7fuk4I3WESITuv
	VH+0PmZo68wihRBuXyFq/9sHDSHerib5k62VelydKX0Ae/HepVk/Itg5wv5K/CJWC28nakbNicb
	S/tCkLliunFwd2CLm1OQPAEcy9osyiuIRQwLWOnxmg==
X-Received: by 2002:a17:907:a18b:b0:b98:2b20:6680 with SMTP id
 a640c23a62f3a-b982ee95138mr577158566b.0.1774276185012; Mon, 23 Mar 2026
 07:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 23 Mar 2026 08:29:33 -0600
X-Gm-Features: AQROBzDAtL1nQ4PFq47to0a6JE1kiVHOZBw70rBZKtJtzPk95r669W13VmBQzzg
Message-ID: <CANLsYkxVRDd941sVq9rdn_O0eDbDcVctPpKTACVi5vfYhzgYKQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] ASoC / rpmsg / remoteproc / soc: qcom: Constify
 buffer passed to send functions
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_072947_574481_E52A4C01 
X-CRM114-Status: GOOD (  16.96  )
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

On Tue, 17 Mar 2026 at 06:37, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> This got acks from Mathieu (remoteproc) and Mark (audio), so can we
> funnel everything via Qualcomm remoteproc tree?
>

I'm good with that.

> Dependencies / merging
> ======================
> Entire patchset is one logical chain, all further patches depend on
> previous ones, thus everything should be taken via same tree or shared
> between trees with tags.  Probably everything should go via ASoC with
> necessary acks.
>
> Changes in v3:
> - Subject fixes (Angelo)
> - Tags
> - Link to v2: https://patch.msgid.link/20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com
>
> Changes in v2:
> - New patch #5: media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
> - Rebase, add acks.
> - Link to v1: https://patch.msgid.link/20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com
>
> Description
> ===========
> The remoteproc and rpmsg send-like functions should not modify data
> being sent, so buffer should be marked as pointer to const.  This is not
> only self-documenting code but actually increases the actual safety and
> clearly documents who is the owner of passed buffer.
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (5):
>       remoteproc: mtk_scp_ipi: Constify buffer passed to scp_ipi_send()
>       remoteproc: mtk_scp: Constify buffer passed to scp_send_ipi()
>       rpmsg: Constify buffer passed to send API
>       ASoC: qcom:: Constify GPR packet being send over GPR interface
>       media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
>
>  .../media/platform/mediatek/mdp3/mtk-mdp3-vpu.c    |  2 +-
>  drivers/remoteproc/mtk_scp.c                       |  2 +-
>  drivers/remoteproc/mtk_scp_ipi.c                   |  2 +-
>  drivers/rpmsg/mtk_rpmsg.c                          |  4 ++--
>  drivers/rpmsg/qcom_glink_native.c                  | 13 +++++++-----
>  drivers/rpmsg/qcom_smd.c                           | 10 +++++----
>  drivers/rpmsg/rpmsg_core.c                         |  8 ++++----
>  drivers/rpmsg/rpmsg_internal.h                     |  8 ++++----
>  drivers/rpmsg/virtio_rpmsg_bus.c                   | 24 ++++++++++++----------
>  drivers/soc/qcom/apr.c                             |  8 ++++----
>  include/linux/remoteproc/mtk_scp.h                 |  2 +-
>  include/linux/rpmsg.h                              | 17 +++++++--------
>  include/linux/rpmsg/mtk_rpmsg.h                    |  2 +-
>  include/linux/soc/qcom/apr.h                       |  4 ++--
>  sound/soc/qcom/qdsp6/audioreach.c                  |  6 +++---
>  sound/soc/qcom/qdsp6/audioreach.h                  |  4 ++--
>  sound/soc/qcom/qdsp6/q6apm.c                       |  3 ++-
>  sound/soc/qcom/qdsp6/q6apm.h                       |  2 +-
>  18 files changed, 65 insertions(+), 56 deletions(-)
> ---
> base-commit: 2360a9a195d2eae6f7d0cac2cbe920ae8a06c54f
> change-id: 20251130-rpmsg-send-const-ae216a1fbd8f
>
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>

