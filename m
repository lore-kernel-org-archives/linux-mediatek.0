Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2C3C5AC7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 03:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Rxym6s8p5fdNkShVSkwaV8afJle+IJgpasiGsN9DyY=; b=jbLuONxmlgwpsbZVO/Uh2gd01T
	j4rkmvFEMVz69WXrui5KQpYtt6+a5siKzQSAeJq01INB/1HsN2IM8e9cGlV1rqm2VOQY52eOH0833
	ney4izo6u3I0rlmQkZxEPyrr0ubmaeS8u0UrSl8nJWGIfsZSLIZhT1CxqK7Q2OQr3qRKC6A6L5hpc
	FoaS6em1MucaknvTi9caVuWPEIOgae/dNJ4UITM2HuE6udWnv3WN/+zubGU9LOfWfUSujtZHnvRVA
	4WfFZfDZSoNt4qoAxv1Y2ehWrrJgiNmqigo+cDGSFnAB22jx9VSOZsH3JgVT6vstY4iurA939NDdg
	7RYQ7tww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsBC5-000000071po-1CB3;
	Fri, 07 Aug 2026 03:24:25 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsBC2-000000071p3-3i5t
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 03:24:24 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-8111c0c7561so36481607b3.3
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 20:24:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786073061; cv=none;
        d=google.com; s=arc-20260327;
        b=bPUdeV3aCa9AbFVCn/BzujvO+6vE4pRkIJpwcsEKOhmd+ky5hN+mr2V6oymihQkXL/
         7Jwkqne4t7iitFVzmmyEB//5WYAnTVplXOcxiEwc1gWHk07tfCxpw/5rG6ZAhwOSJlED
         UfiTu8w521qKdJ4mKIR+EyRkXaHS0mJCcbiTxmE46b4Oi+Jdetv6HhDScwUUPNKNIWq8
         fyLPZ6zowpP/gYY1cTPQSiCkWWOSAgTqkoWmgs+AwNtaYXdOLekl0GLMrFfiud1RcsYd
         fz2YG2OekBkAhEUlnJQKG2TsDRULdPNDYNa2I7gAu1QTNoiX5zeXzg5koFVKwoE8/Ekb
         UJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Rxym6s8p5fdNkShVSkwaV8afJle+IJgpasiGsN9DyY=;
        fh=WxglpJxoYCjyygwRTK0XwoDjrx9M6IyuN9s1kNxBtqw=;
        b=hKrbiaSRFX9rrLhBLMes/x1OoykX7hSm3xmBw4rE2qqrv1dGB3I8ffe/J7SPVEEzeJ
         8G5Gufkq+71rfv2F1GNJAFuxnIRtj8U0Ezht0qPWgV0klpfcFFmCx1WGdxruf1t0+3Tp
         j/u3vCHeVKQh93PQiBGo9zb34Spz20Q1MVIRqPOq1HZQ1+3s+6gcR2LXgfkn/AMWLeK/
         V1bHBuri7BRGTcC701BXNs6SU0iEC6/N18ueW0zMI69VnqOzf+jpkoeRlmFgk3wZwMlZ
         lq7Ql4v5pvmShUHcXFAONDUwNN8kAmzaK4qRzqLq62dJAqHUMcW92pd23zgLu1Lqj4Yx
         dHMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786073061; x=1786677861; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Rxym6s8p5fdNkShVSkwaV8afJle+IJgpasiGsN9DyY=;
        b=Hn3WTJQNuFphWLJxFRnZt/qT8qzTgtEOYOv7PTdyspic7X2RcYIkX1wqbaNDlWyXmx
         Arbe+Be28lasp1aXHESSp8uica12wk2J/p88f76CLQIbdszAu8gCGOUmTRVmBOr7+0if
         f4pSPxGHPg9kE5nvi7Cf1+inqAWgUSdZsTg8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786073061; x=1786677861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Rxym6s8p5fdNkShVSkwaV8afJle+IJgpasiGsN9DyY=;
        b=KHJcVMfDFBFcZ1KdYzuwAcYGO+vVRHvFVKEc6uGZ0qk2BInx7zC6sX/4mfATHWxV88
         eaM2fViDDemfh0G7R0ENQGWzzEFWhmwSXsbu4lS+oBOPDqaZbExuZW9CiuqtpojkZntU
         el9HddI3bmBc+W0X2qC41jO3eBsfJ6N7s/ppRnLN4jaxLjxju9NCBDx4d6B2L0OT9qi9
         wiTv+mxJgXHvvR0QfyNRfP9KaoJQWGezv4VGTlec19oA+MHyHYknu8jhoc+f1kn8xjZv
         VY/JmcBO9QAZHzylx356pDSVOKDsrKwKAF+ebgb5mrLVSu7eGn8Ja2gBt0P/EOYvLo3v
         y93w==
X-Forwarded-Encrypted: i=1; AHgh+RqM726fMXMmk13fCTC9Dtdsl3x3a4SDtyAveWSukhyvxOqJVKNQOms9kzuahElnRRPz6unuonFMNJyPRIdJxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWYyPPb4zPpev05kUzvU1oYx6unsnl9Wl+FyCk5gAuoc2tUa+j
	Kw1CPY+y6VlIvG0IPtM7NEQ1Kr+bKgAJkhYHgzXbyEy4hJNDoZtEz18kLwNR7F2k2a+pr8EkFcn
	wgjBtwRrAykt8Gcf3dVMCGZnxhFM46eZxkwQcsbou
X-Gm-Gg: AR+sD10vmgJl/5e2sDOtEshjRTXFG0WoV7QSEyoahRkBFBL0++YHoKqZEWOpAROfOFx
	ySQ3uR5PkVP3MuXkBO4MgmFwtkAfaC6+0HJVq+nZWqfEL7OfAryFXWV7wMeFSd9oIOA7tDAuOEK
	SejvxbI6KjHcUbU+h3/3tj1uvcUTk45uhhilyxE8ZKjnoOu8fFcyAgmK0VN27YG+k9JEV0Dymq5
	35WlyHIPE+w5z8zLf/ZZkjEC0KGqgH6TUEI4PLnFwOWUmCXa8euc4eFgZRq6kO1W21W2xPgxvw7
	OQctbEMToaubATJaKzF/lCluJ1TW1tL17JXQGEyAzKhNZtjKZffSw6mWG3ZvVg9+9k+hnsXlLYG
	Mbw2JyUk7eQ==
X-Received: by 2002:a05:690c:3192:b0:821:1013:b420 with SMTP id
 00721157ae682-8211013b613mr61043287b3.2.1786073060720; Thu, 06 Aug 2026
 20:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260806165334.7328-1-ansuelsmth@gmail.com>
In-Reply-To: <20260806165334.7328-1-ansuelsmth@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Aug 2026 11:24:09 +0800
X-Gm-Features: AUfX_mzUdOGgxWn32vBMs4t6vRLtbHLODUQScOwpqh6tGHGYlgOK1wG3cJKPIgA
Message-ID: <CAGXv+5HrDw8GWb9zp1AaQU9UW+0FGcr7jOV2jt_zi_2KgfgBqA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support + clock
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_202422_963717_46162850 
X-CRM114-Status: GOOD (  22.99  )
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

On Fri, Aug 7, 2026 at 12:53=E2=80=AFAM Christian Marangi <ansuelsmth@gmail=
.com> wrote:
> This small series introduce support for 2-lanes mode for Airoha AN7581

Just a nitpick, but I would probably name this something else, like
"cross-controller lane-bonding mode" or "lane stealing"? PCIe already
has 2x lanes as a standard feature, so this naming is a bit confusing.
It's not like dual-LVDS display in which LVDS is only a single lane.


ChenYu

> SoC. This is needed for correctly functionality of Eagle WiFi Card
> normally attached to this SoC that require a 2-line PCIe card to
> correctly work (and give the proper performance)
>
> The first 2 patch address a limitation of the PCIe implementation
> where the PERSTOUT reset were indirectly asserted and deasserted
> all at the same time (for all the 3 PCIe card) with PCIe
> enable and disable.
> The 2 patch address this and introduce correct reset to control
> reset line for the relevant PCIe line.
>
> The last 2 patch add additional logic and support to assert
> and deassert the PERSTOUT and also apply the required configuration
> for 2-lanes mode.
>
> 2-lanes mode is implemented in DT by adding the required property
> and by defining the "num-lanes" to 2.
>
> Changes v5:
> - Address formal comments from Bjorn
> - Drop clk patch (handled in separate series)
> - Add reference to clk changes
> Changes v4:
> - Improve DT split patch (drop unneeded property)
> - Handle power_down PERSTOUT
> Changes v3:
> - Add Ack from Krzysztof
> - Improve commit description of PCIe patch
> - Use pcie->num_lanes instead of possible uninit variable num_lanes
> Changes v2:
> - Address typo regs -> reg in Documentation
> - Address typo lan -> lane in Documentation
> - Apply a suggested fix from Airoha for PCIe MUX configuration
>   before PHY init
> - Parse secondary reg in probe
> - Add missing reset_status handling for inverted bits
> - Move SCU to local handling in power_up
> - Add check for max num-lanes for EN7581
>
> Christian Marangi (2):
>   dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
>     2-lanes
>   PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581
>
>  .../bindings/pci/airoha,en7581-pcie.yaml      | 244 ++++++++++++++++++
>  .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
>  drivers/pci/controller/pcie-mediatek-gen3.c   | 106 ++++++--
>  3 files changed, 338 insertions(+), 89 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-p=
cie.yaml
>
> --
> 2.53.0
>
>

