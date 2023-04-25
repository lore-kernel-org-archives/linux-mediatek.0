Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17B6C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 11:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ynfAkeFX9c4haFlIH8rjLILNLDWXZve/Fuy+x2osLE=; b=ud/cNuCRa/rrcjwui4JWSjRd63
	DF1tQn++us8MnbyhyVenun9ckMGa7zwCZk41XU2cxN2lCHTaDgtwt0E0OMueafYAF/3QLZoHhRM6q
	/8LhRnY6Av5IqJzC9iPFYpVZW5EyWIGIsg033Tq8puNs/zJVR6HPlwqzOpyCnjiaiEqScEFjtVSi9
	g1z5dNlMdHYqAM6Vr51cHmurL8jtyF+7OY6ZuTOQS9FnK0L1DJzFTvuT63D7PGIDZF6ILmq0qn5rC
	qtR67RhSyhRz/iJ+ZX2AIInNrVnH8o75lomNQ6RuqJV6moxQTAKgqKwMLUoLwm3QZtIrb5WnerPvj
	BVaQ9inw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prHDb-0010Ku-2c;
	Tue, 25 Apr 2023 11:52:23 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prHDY-0010Jj-1E
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 11:52:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-2f7c281a015so3424734f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 04:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682423535; x=1685015535;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ynfAkeFX9c4haFlIH8rjLILNLDWXZve/Fuy+x2osLE=;
        b=udOp2foTMQVRgEFYvPui0UXPktfpmgf9DnmHlYw28zFZpUt4aRefOBlXkfsJSNS1Rv
         m7vNfkWjflKoLxkvDrs2qvRd4hxhXnUu5tOuNjtDFxG/C5hdyExewyNfldOgEe8eGZGz
         WjTjQKqOTXd9HU3tBla6kSCcCkBkXayQNNOvajSISxhHsQ+PDm+mxipncRwkTL25ZWXW
         FD6FmNW2LhM8HXyrG3SC7kakHbzutytO1dACL8Q7tOi77/OzHhMLu6X8Fk1Vp+R3w2bA
         E23sOM0BpsOTRt7EVnrHjFhLU9J690tU9u9GZc72oBCzWUWGUe1UNPLuu2B7EJG4pvmW
         QhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682423535; x=1685015535;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ynfAkeFX9c4haFlIH8rjLILNLDWXZve/Fuy+x2osLE=;
        b=RHr8FXbjpITT3hMmlWZTMu/EOEBzA7UckWNxsPh0WgZP7SVBXhiWJyIVufLejvNkkl
         0uVPmQ1R4UNempbBd45zgOSRQ3VHa9SPoclWKwL5Sh4lJUkgg+VeGuB3Bq9uhWtJIXYW
         TvKe/B1JUiozasg6321mlol9syaLQoJ1RXm3QKo+4u4/5mLh/BxjjEBi1yMaHpXSxlma
         UCzKVeDmdXHe4RJivScMIy0H7r1ZqWnsYUApasixxUc3A2kWaG7BQ5TB6eYhCVv7pWZ4
         EXGRnulhRZPcc3HhhHns+KhiRHcsRGeaWevzpBPDZ7f9HIMWcjrHWli1ztIwNR8J14fM
         g1eg==
X-Gm-Message-State: AAQBX9ddkgV0u4lS4V8NBv34L1iB8GTirON+bWql1lkULU8sL+pcT0QY
	simgfZ2xYQ5blCKcVEf+7Xc8tA==
X-Google-Smtp-Source: AKy350YKmxiieIO+e/m8YrSHDxSa31rJy03V8/Gu3qee+b4TvG7KAopUN9dSLHD5NOyEXf8np1sQbA==
X-Received: by 2002:a5d:6d4d:0:b0:2ef:c0cf:c72b with SMTP id k13-20020a5d6d4d000000b002efc0cfc72bmr12109033wri.29.1682423534889;
        Tue, 25 Apr 2023 04:52:14 -0700 (PDT)
Received: from [10.101.1.6] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a18-20020a056000101200b002e61e002943sm12948461wrx.116.2023.04.25.04.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 04:52:14 -0700 (PDT)
Message-ID: <5657cc31-b547-a48f-d090-68ca240a4076@baylibre.com>
Date: Tue, 25 Apr 2023 13:52:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 4/4] arm64: dts: mediatek: cherry: Enable PCI-Express
 ports for WiFi
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>
References: <20230424112523.1436926-1-angelogioacchino.delregno@collabora.com>
 <20230424112523.1436926-5-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230424112523.1436926-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_045220_419487_BC3DDE08 
X-CRM114-Status: UNSURE (   7.79  )
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

On 24/04/2023 13:25, AngeloGioacchino Del Regno wrote:
> On the Cherry platform, a MT7621 WiFi+Bluetooth combo is connected
> over PCI-Express (for WiFi) and USB (for BT): enable the PCIe ports
> to enable enumerating this chip.
> 
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
> Tested-by: Chen-Yu Tsai<wenst@chromium.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alexandre


