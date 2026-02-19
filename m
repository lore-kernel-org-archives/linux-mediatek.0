Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D4DC531CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 21:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrC+PLfTea68FI9Rr5zEv0pamcCsfXyApvn8rTrZCCo=; b=jNZ58VZD1W+PoYquiWYj59i4ut
	DowCBR+aQuxSlsz1iCDdaExMnlUYSDD4X7h6dPhKaR1ii0u1TICZQdO0TeoHt6l9/Fv8agsLlwYPm
	kuzN4bRFHLouudSdsy8OiIwcmXXkcD3RTYWw3yZ5rNJZI5TKphWVnSJ2rA/pYBTIvZPfRYYD1KmGZ
	y0OCjsvmLrGYoLlV/x7SsojLPYLDM1FJphCPQciLrrCRrOrEwtl53a5PDH5qY5NXG8Zt78CNEtnhI
	S5LdglxfeoZlv9kwcbesIRMOftYXLpOXt/bbOBROGRSyoKjUXA68sOc4mRjqrSEO7MwoYjEbEY59b
	TmQakPEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBIS-0000000C4tG-0SMt;
	Thu, 19 Feb 2026 21:10:52 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBIN-0000000C4sP-1T4U
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 21:10:50 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-40ee9b945d5so848088fac.0
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Feb 2026 13:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771535446; x=1772140246; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UrC+PLfTea68FI9Rr5zEv0pamcCsfXyApvn8rTrZCCo=;
        b=3EYnr8mOgVvHb46qXFssXL+GPVN/amazawbjjnaduUYVGp0GIwKampzcNflirA5wz4
         OEjBKdDRu27TX9Xds08OA3VDTZOY9wp3SCLMyd0dlwpVQq2V43UlRhLfczA1vG2ashrH
         8fDKsA8UncvsnS4yjQtA2uDFZ7ZSy8r8stSs5em5OHH6YagpFqgbKnCmUT8grTLIVQXW
         ounqKQRLzHnI+e0930TtI7AjegjCnKljrYM9ftYnQw6ITmDvsATlPksURqMjQJJQ7ljc
         fU2HQasZTbTv7LSMhrqAEY8Oj5PL2JgzRj/2R3epJwpZRG70tVH5f19C+Jp3n+12hhYy
         sD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771535446; x=1772140246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UrC+PLfTea68FI9Rr5zEv0pamcCsfXyApvn8rTrZCCo=;
        b=nS5exWv9Rhv1c36qCJmKaluLx0pnOK5qasPKac20CR6IKMj0dbZxhvdqFh62czr9mB
         0o50AaZ9ZRkWKIslzkKEDGcARO6mLs78vVtM4FZBXsfRYv37jA22rg9CSNNZ+h7GcPhp
         ATJVNe0ONHGm4O4F58nafV+70t0hcR/u4MxrLbn1AEp4NZpvJYRuVSi1QtU4wC4S8yut
         cflJew2kF5xw78OOST4rSY0Yop9N6zhSTMe9Phfm1vtL6ljxLt9OK95ITAk2dtvxZiqA
         bJcQkAfpdEF/HDRdarpbEJMMagdTIgQhdr2zRV32D+M1jZt80tEJLFkP9kEpO3y21DR/
         rmXw==
X-Forwarded-Encrypted: i=1; AJvYcCUyVb5AMRbbHOm5xmOGS2KDVqtDaqf/lNdo1nu+EPk2vt5W4VAQDhn6fRSWOGM9el4JSlOoIqnvXKDU+JD2IQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq0NbXkg9U7rGd/CU+8xd67YemUQksVgKkzGYX7vxv3XzaJmOB
	gNTxDDCoqDODkrJNCSjoLPA6An5f3qlHkHNojiqeAFSpavtEhD4Dpo/B6hVnTMqCDQE=
X-Gm-Gg: AZuq6aKh0Gy3LDjMNWtYf02tFxjcsTxgx1zMyD35YIOnuYVCIy71tMNmHrlV5YnzylP
	fz5Fk6z0vqcL+PUqzrhbvtRiCiLKIlyRZKrPJnPmXiCiIcC+jlpg4pn6eZ99Si0J1fEOrSdDBVd
	549zDDcB7FBqh486j34GZxD54xYgyFlT4RERLX+B+rAYrPodrZINfyKOvTbHR4SD6SSZtxo784p
	LtBA1ml3CZBIDPmZoaZcJJci5tE9d/SYGgp1fEMzwDlFr223sPWFkMPhfYmeFY3l0UaCL+cPvl+
	8J3WOVv8gDMWa+7CZW2XyR+RbNh9m7nqL49kvh1JihEKIkiBT5fzGdCT5BvoB0iNZi7gfDb1MtM
	xihjFsU5c7Z07XR9WBIC9SoN6Hoi3wxIUeCr9ueBZUVWrsxNMkZjiHAFmlVqpHSOnjQoJK9umPO
	7Vx0axxVLu5F2/kdbLVDDUTX+xvYTWtHQhNp1qWvygPyrnY17Tvggc8lX+5zHauJL6PoOYoQ==
X-Received: by 2002:a05:6870:4596:b0:40a:5a07:3598 with SMTP id 586e51a60fabf-4152913c255mr4207227fac.36.1771535446056;
        Thu, 19 Feb 2026 13:10:46 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d4c1:bce:26a1:c903? ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40ee06756easm22066534fac.13.2026.02.19.13.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:10:45 -0800 (PST)
Message-ID: <e0b39f90-f4a4-46c5-90ff-54a261c075b4@baylibre.com>
Date: Thu, 19 Feb 2026 15:10:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/18] clk: mediatek: Add MT8189 vlpckgen clock support
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
 <20260202062840.342707-6-irving-ch.lin@mediatek.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260202062840.342707-6-irving-ch.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_131047_420993_094ED16F 
X-CRM114-Status: GOOD (  10.08  )
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

On 2/2/26 12:28 AM, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Add support for the MT8189 vlpckgen clock controller, which provides
> muxes and dividers for clock selection in vlp domain for other IP blocks.
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> ---

...

> +static const struct mtk_gate vlp_ck_clks[] = {
> +	GATE_VLP_CK(CLK_VLP_CK_VADSYS_VLP_26M_EN, "vlp_vadsys_vlp_26m", "clk26m", 1),

In mediatek,mt8189-clk.h, we have:

#define CLK_VLP_CK_VADSYS_VLP_26M_EN			24
#define CLK_VLP_CK_SEJ_13M_EN				25
#define CLK_VLP_CK_SEJ_26M_EN				26
#define CLK_VLP_CK_FMIPI_CSI_UP26M_CK_EN		27

Are we missing the middle two clocks here?

Or should the be omitted from the header file?

> +	GATE_VLP_CK_FLAGS(CLK_VLP_CK_FMIPI_CSI_UP26M_CK_EN, "VLP_fmipi_csi_up26m",
> +			  "osc_d10", 11, CLK_IS_CRITICAL),
> +};
> +

