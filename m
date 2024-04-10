Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F09ACD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 09:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6XERnHnMwc1UPkJwA7M4dMe8kK/+Z7/oP46jzawayI=; b=qKDzw5tpGsIq8r7cAFpfWo1RNM
	+lHZFv3Z3ZBXklTB7ehnLLOndg3HC6BFtwiWVebs7ek1JfBeNWTtreUMByBD/nxSBLR6/wlva99S0
	Sa2uIUTH/l764kM3qpSbP+8fVljF1GqX0HPWG1FwtcYEGcdwJxafqcNAYIcvuHbIBNsWWZ5eRGLgW
	OqYzzquHZBDbm1cs7sKVSCw85N4yRailmRlQDIEjAEgpUDamNbMM32/0+XDk9NynWdAulGQYe89HE
	dcmmyNBlmdmy5023jxW7NsWejZkglhcNBFSdDj1wyB6sQ61SmKN1BySLa3OFjpR0H1MsGYtZkiYf9
	nmtLvmHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruU8c-000000067HF-3LUQ;
	Wed, 10 Apr 2024 09:21:02 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruU8Z-000000067F6-497L
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 09:21:01 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2d87450361fso56422031fa.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 02:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712740857; x=1713345657; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6XERnHnMwc1UPkJwA7M4dMe8kK/+Z7/oP46jzawayI=;
        b=njUwQQFD5qdo3bQiCIRGvokVMXmFe3QkL8f+enRH/QfpnUqalpOJYG9G5kN06Em9Eq
         KAB1ibl/Lk8dexfd/Dh23C8b0QJsn1au8ysLKFXw1x//ndfVlPQ33Eo/xd704pd4S/2u
         amyZWPiTS6I79vYu0FpEBpmolyqgIBjARviAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712740857; x=1713345657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6XERnHnMwc1UPkJwA7M4dMe8kK/+Z7/oP46jzawayI=;
        b=q3Mt152ixB+f8Z7ptGhhwb9M0t4A0EayWZtFb6/bzT6CUDl0QBQgNTnqMruqFH1u3c
         PDMcRtxsSXIa40uUnMmR9xGbr2mBSuhGY29tn4noagvs0uFQ8cgQySConMPNTwqSj6vQ
         jcLkxMWguBllLtFSF+WMY22SUreb4GGqYl0sSk64jAP3FH5wuTa8rc8G+wh4NYAh1gvh
         GlRlXcIIFo6+KLhpYpTs99QcaQRDsnUO046+WG6kBD5detuRdjNK5W+9aY5Y/JO/qn0s
         K6L6f6ws619g6/d7Ufri6JEbc7allYLItD13oqxDmRpFjcZN4PfrfRooIN62rIawj1UW
         5dIg==
X-Forwarded-Encrypted: i=1; AJvYcCUexO1eBW/asm2oyDLH5WMRaNQjnqnBs4Vwi8juo0da5J9XL1GKCqbOu3YeGI/HrVXDCg5R5O+kdNLonu5GBRXM+TQjh8OC4QyRePJJMNJbWru2
X-Gm-Message-State: AOJu0YxFBMv+mRpCoJfEVjVaFsSezV/DafHjwljilfYq3AMuJamlykhH
	SQHgmyJk+IPGPryiQrsDIrItjEqCL19cJwOUpfnZeacVVGSgXjNHeogZ1N9AnrUYbfnSdE7WAZ2
	56Vd3wkutOKzwXmfze+k2nQ2o836G/8BeoMi2
X-Google-Smtp-Source: AGHT+IFL6KPS7uL0x/EtSSqM+BxaTQB6YKxFAO4dVgt7h/JSlGs8pTFg9ELkmasVKscLtesWpTkQnSz+ws7ho1rA6oM=
X-Received: by 2002:a2e:9913:0:b0:2d8:2fea:2e4d with SMTP id
 v19-20020a2e9913000000b002d82fea2e4dmr1821870lji.2.1712740856858; Wed, 10 Apr
 2024 02:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240410084405.1389378-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240410084405.1389378-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 10 Apr 2024 17:20:45 +0800
Message-ID: <CAGXv+5FJM2_yr0dwD=FhaDi4FJzYn50=jY6fJsFnder2q7TKrw@mail.gmail.com>
Subject: Re: [PATCH] power: supply: mt6360_charger: Fix of_match for
 usb-otg-vbus regulator
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sre@kernel.org, matthias.bgg@gmail.com, mazziesaccount@gmail.com, 
	gene_chen@richtek.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_022100_069276_1EBF779F 
X-CRM114-Status: GOOD (  11.07  )
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

On Wed, Apr 10, 2024 at 4:44=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The of_match shall correspond to the name of the regulator subnode,
> or the deprecated `regulator-compatible` property must be used:
> failing to do so, the regulator won't probe (and the driver will
> as well not probe).
>
> Since the devicetree binding for this driver is actually correct
> and wants DTs to use the "usb-otg-vbus-regulator" subnode name,
> fix this driver by aligning the `of_match` string to what the DT
> binding wants.
>
> Fixes: 0402e8ebb8b8 ("power: supply: mt6360_charger: add MT6360 charger s=
upport")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

