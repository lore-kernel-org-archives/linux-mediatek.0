Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAC4C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 13:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IlblvpnO7CSOWQj+7J4s/fz7C1yYlNNGDJxB7We2hA=; b=qQv36F1nvi84CAzcoyovMuitsn
	osHs7TIYSbnUtFsiboYzcPhogSDPJLGsAxx528moyOT5kAgnvlrTf13UHfzriW34c/EKQRvv88Wm3
	qJ/Z/hnot65L2hBk6iMXMnZ3NDhzy73nPsZfgawsCFvwzvU/4TSJF1Tm2CrAZ+Vdo+a1kfnhlOy9l
	s0Q1apHUAG5w2kNlRDezBljWc2bcsC/CXgY64S+gf5z4b+wyjtGa4K7SIt7dCTKw297Q9NPoDqFLH
	k84CzEXHs+EsHOs+RaB7+kF1AI4XzNpr4jKodqVW8xg36zoK1W0TrfauGgW1F03R0g34b3GJnK6d5
	fp9YbckA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Ay6-00FNxS-S2; Fri, 16 Dec 2022 13:41:42 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Axv-00FNru-Ey; Fri, 16 Dec 2022 13:41:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id ay40so1906905wmb.2;
        Fri, 16 Dec 2022 05:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1IlblvpnO7CSOWQj+7J4s/fz7C1yYlNNGDJxB7We2hA=;
        b=l5M1f0pOBkmHqIHK8QlDap356wn8I5JzUaV0DA9P2ir7oswCyW7K98S5QstlO2bGAO
         QSVxyLGF7cqizCMcK+EwqcbxSpDqOBVvzfoCOucsb143oIo3OnD8nsV4qKPa18NNxtXm
         cPtdg1GUzVvACSkBuvcC/2YJknHF/b4+TtKND5oF1ek2xIA176ps1DA+Uhmpe+THlH/S
         DVOswRJWaZyWzx0emEcHeSh9DEnvfW5FTF0pVwZC+Fj9bJAFPnUqtUElWvkdt5qUzr2Q
         +UyOKEkylE4CEXl1SEHWJz9khl5SpVh8anzRe+kYTMaJMB++B1LydNBC0z93wCkqBGE5
         yeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1IlblvpnO7CSOWQj+7J4s/fz7C1yYlNNGDJxB7We2hA=;
        b=Sz56j4le6Tq6CRjM7mGuwh1OClR5dPJuPTIz9GDv6iyT5XeBheyH1Pwrk1zOsyzb2r
         goZ9Uf8QC9amTmDVHsgQwb2yYHHzZn0HxgOSrPgzQ8SGdIxwWLITwJirFzuKDGA0/WVG
         fZZ2QwCkCpDFP09WgFhsWy2m0NpIJ2LX3G9wxjST1eY+wf69Sw844EnzTjZHAGhsCpn+
         JqJLzzzJXvJim+DE7ZojDY465aZ35KypUv1OHy+4A1owo1zxAj+mEqc1SqhRcXU9fiQt
         S6oDnwiltQoE/Xul+UUhrx3xVJnvRiU4pmREUw2S3u5o0+q9D4QbZ1Uy5oQMH65HScts
         Aaxw==
X-Gm-Message-State: ANoB5plwXNwoHe252+4hMLgHrO6DYRRV12ZYDZilbZkwyM2v2xwxY+r4
	KthWFNXkGTNcxMqfwFRk7fUFwdvbW/Mu8g==
X-Google-Smtp-Source: AA0mqf6CslQw0OazAvUOHIG5QEuLgxypZua22r4ikFgU6guOuUIoyPBwKBoc9MqvVUThoob2iDiW6A==
X-Received: by 2002:a05:600c:1ca8:b0:3cf:7dc1:f424 with SMTP id k40-20020a05600c1ca800b003cf7dc1f424mr26250843wms.3.1671198088868;
        Fri, 16 Dec 2022 05:41:28 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i12-20020a05600c354c00b003cfd64b6be1sm13227152wmq.27.2022.12.16.05.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 05:41:27 -0800 (PST)
Message-ID: <ece3a933-e278-fc7e-093a-4689d1c3bf3b@gmail.com>
Date: Fri, 16 Dec 2022 14:41:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/4] MT8195 Acer Tomato - Audio support
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, wenst@chromium.org
References: <20220922094908.41623-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220922094908.41623-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_054131_549724_57ABCFCA 
X-CRM114-Status: GOOD (  11.84  )
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

Whole series applied, thanks a lot.

Matthias

On 22/09/2022 11:49, AngeloGioacchino Del Regno wrote:
> This series enables full support for audio, with DSP, on the Cherry
> Chromebooks.
> Related ALSA UCM2 configuration was already merged in its upstream
> repository [1]: this is fully tested and working as-is since all of
> the required fixes for MT8195 SOF drivers were picked and are present
> since `next-20220908`.
> 
> [1]: https://github.com/alsa-project/alsa-ucm-conf/commit/a59c3b1a57de8eb424c4f754bb031265e856260e
> 
> ______________________________________
> _________ Platform overview: _________
> 
> What's still missing?
> 
> * Format:    feature  (location)
> *
> * MediaTek vcodec enc/dec (mt8195.dtsi only)
> * PCI-Express WiFi card (mt8195 and mt8195-cherry)
> * VDOSYS1 (mt8195.dtsi and mediatek-drm/mmsys drivers)
> * DP/eDP outputs for external/internal display (mt8195 and mt8195-cherry)
> * LVTS Thermal Sensors (mt8195.dtsi, driver is missing)
> * GPU support (clocks and mtk-regulator-coupler are awaiting for review/pick)
> 
> AngeloGioacchino Del Regno (4):
>    arm64: dts: mediatek: cherry: Add Audio Front End (AFE) support
>    arm64: dts: mediatek: cherry: Enable the Audio DSP for SOF
>    arm64: dts: mediatek: cherry: Add external codecs and speaker
>      amplifier
>    arm64: dts: mediatek: cherry: Add sound card configuration
> 
>   .../dts/mediatek/mt8195-cherry-tomato-r1.dts  |  10 ++
>   .../dts/mediatek/mt8195-cherry-tomato-r2.dts  |  10 ++
>   .../dts/mediatek/mt8195-cherry-tomato-r3.dts  |  10 ++
>   .../boot/dts/mediatek/mt8195-cherry.dtsi      | 109 ++++++++++++++++++
>   4 files changed, 139 insertions(+)
> 

