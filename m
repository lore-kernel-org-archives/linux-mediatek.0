Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91F5EB64DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORhvAA/496MMJtggR9mi3T/sluuS2ydk3cQHXnSCh3c=; b=HidFT4WA3/EQLQeMz7XcX4qypI
	0di3nOv8CEjej6m2nHm7G4tvO5SqaqlRzglNxbzE6SeYGEQqO4Zj+UJ7XgAsQb0wpz1mhbp1ldPbJ
	aa2ruanJyxPa4JIyznCgC8WIC0KwPMvZrRoGLrmQ+PMKnHaWS2CYD/nUdGzt5ez9SP3YUOrNfkXTx
	hxxdP411MtmmBk5zAsWy0deHXKFHCcTfPyLx+Cc3SeRyU9A+CFWyiebL8uQckV4Y4q2hLa/JqxW/O
	8OpUN0XphUYCGCkvWSkZ8lpn65tFQfzMH8QkHXXjSX9PKNNvo4VEh+wos0GYWD/slJd0/mi7+ZOjp
	5Te4a39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMltZ-00DR8l-1y;
	Fri, 21 Jul 2023 08:53:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMltW-00DR78-1e;
	Fri, 21 Jul 2023 08:53:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6190D6606FD8;
	Fri, 21 Jul 2023 09:53:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689929629;
	bh=lfQjN+0bzeNpjfaFx7yJbIo4ezDGeSh0p2XNZ9xwwz4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O600G5w7nJqUVqoros/i3dGBDw3jROy94Zwx+9aAzLkY5THYq7F/xjZwT3LclQTMP
	 jSwwdgzE2rmW8VN1rLo1/A3q77287WfMwv0n7EqFdPYocYP4sya9G0VjFTXItfBOOn
	 0guWDaMkG8xZtLRQMkYq/4Iy7zbMNDeQ9adbMB5qUBrDYeWqlgYw8lTrztFBntPP2b
	 rbXdpd9j1hnOE4/hQvfUDQMVpSx7MvOQny3wO6GHBh1CfzxDw/SYxKOLS/klq7Eyvn
	 DHV3fsoShCe4l5NEgwU0zZIPh1+Mib6mcOI9NehUk9hbpvZrxlkhivDtEkkauHk1/j
	 An2ZrpBhM76uw==
Message-ID: <176141a9-bcf2-d91f-0447-7a2aabd4b602@collabora.com>
Date: Fri, 21 Jul 2023 10:53:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v2 7/7] arm64: dts: mediatek: mt6358: Merge
 ldo_vcn33_* regulators
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230721082903.2038975-1-wenst@chromium.org>
 <20230721082903.2038975-8-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230721082903.2038975-8-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_015350_737518_2AB74E85 
X-CRM114-Status: GOOD (  12.34  )
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

Il 21/07/23 10:28, Chen-Yu Tsai ha scritto:
> The ldo_vcn33_bt and ldo_vcn33_wifi regulators are actually the same
> regulator, having the same voltage setting and output pin. There are
> simply two enable bits that are ORed together to enable the regulator.
> 
> Having two regulators representing the same output pin is misleading
> from a design matching standpoint, and also error-prone in driver
> implementations.
> 
> Now that the bindings have these two merged, merge them in the device
> tree as well. Neither vcn33 regulators are referenced in upstream
> device trees. As far as hardware designs go, none of the Chromebooks
> using MT8183 w/ MT6358 use this output.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



