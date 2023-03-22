Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC84C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 06:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RX0SeXk95xfA7fzhyTC54j4JA6MuPQPWNc9h5Ft+JK0=; b=DT6ZWED+9jphqGwTQEWr5RoCKD
	xACIHMRdZTmyrn0MjZQ956TtvWThTaer6DPaIgDAlnvWGkNH+/YyiNxi/9FCnjJdvVCzc4Jcwkke1
	O22fSqvjrGYX2ZXoG7Nm6HO5I6+LLNl/XpxReIEgR4hLtVuRya69PIMWc0BIfRx067kk/mPmCJEgj
	DkrepEuPDL/6xRXeWiTkc+aR+nUZDIZIObgx6T4vRUWkXsllZGIJIEk7tSfrZY2pGhBTX/8NZE+92
	W5rbdspO/ejy7WPdc73AebBmDZpVPXU0vF1ZxnS+QODVnnLbLB7rJ9EaMHF5IFxFcmTGO3rUZMRvq
	Fm9rubsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pesIp-00Ew64-2h;
	Wed, 22 Mar 2023 06:50:31 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pesIn-00Ew4w-00
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Mar 2023 06:50:30 +0000
Received: by mail-vs1-xe29.google.com with SMTP id h27so2163768vsa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Mar 2023 23:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679467826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RX0SeXk95xfA7fzhyTC54j4JA6MuPQPWNc9h5Ft+JK0=;
        b=OUM2ebTToWE+DLYciLsZanPss0L92kIhxEtZFHjXnSNa3EY+rxceuEZEBNqeCL+42c
         I5zKDOyWs6WvdW1uiGRAEIrvNNd9i53Qq1TK0wyP8GNTFafEDdrImfPmDXDAPRgOVvQF
         DYHPVNcAuZFRMSZlB3rHCkWtSAjJJKY+8wbBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679467826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RX0SeXk95xfA7fzhyTC54j4JA6MuPQPWNc9h5Ft+JK0=;
        b=2RWc2LmcbIqKhV2v0cO5Wb9i2BQRNVQqIWrMhmzRvmCaBYja7u2Q1Oxym1twoDvWRU
         32ip78S2eVu4IDKNOU0QHdumjdPqEVqHSwbeHgTsoODQq9Rq/Us3LPOIMv4ikQsecHhG
         lWZqzzxwNz8rVBW2vMJAHfqc3j+NAVQ2BNiu18niCyoh5JPhGB6ikNtnqgGgunSW6ulW
         JQjF2LZBpz3RFhrt5a7aygtkArThQgS94SfV+YQvv84uuYXdAMfIYpHS7tKLd/c+eSjh
         eaksaqwkepDzUtxvd5ECwToluR3c9Fow36pNjcVXJWqjmfZyc94OQVNUIe1eqXins2Qm
         nFhA==
X-Gm-Message-State: AO0yUKWB7bG2oBTkJp4VvVLJ7Y25OqVDilO3g2Lf8KSENYLony4r0uJS
	t7iuyydl9sgaOk2p4+yzH6jXTs/RfgXyOF5W9Vk0rw==
X-Google-Smtp-Source: AK7set8Ms11ZJJDrulLLbKmxZz5jY9ehpCROWxJN3/SBLOsC8jNk+PkF2io6QogN9ANBqmnLQL6MAMBbwXz/1TJuBOU=
X-Received: by 2002:a05:6102:3e09:b0:421:c4a3:b607 with SMTP id
 j9-20020a0561023e0900b00421c4a3b607mr1041896vsv.3.1679467826251; Tue, 21 Mar
 2023 23:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230317060917.15175-1-allen-kh.cheng@mediatek.com> <20230317060917.15175-6-allen-kh.cheng@mediatek.com>
In-Reply-To: <20230317060917.15175-6-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Mar 2023 14:50:15 +0800
Message-ID: <CAGXv+5FkCuuV5nZ-_7Kf9cgodVcjfOhjvj3+T7xPqc4RuenHEQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] arm64: dts: mediatek: mt8186: Add audio controller node
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, hsinyi@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_235029_039669_0AE2D20D 
X-CRM114-Status: UNSURE (   9.73  )
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

On Fri, Mar 17, 2023 at 2:10=E2=80=AFPM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> Add audio controller node for MT8186 SoC.
>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi | 62 ++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)

This patch is already merged in v6.1-rc1.

