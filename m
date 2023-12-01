Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F29C07E97
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrXeJCOZU94KQ8Syrv+ycNUnPJ6C8ul1595e0ScPViA=; b=GYUVcgz5cvpKpPTFCY0OWPTh91
	sJsXz3lt9PbOD3EuiW7L72UgFCt5Sl+ldJxdB1tjrknIcnGSimSD9Js2fbdmQK3zbitVAtLdR5TH6
	cmYuF2mXsSDrSbgIAc2bn2avJ1tlM6trtAB3x2ED+mQP6s7yI8ZOrv/F4bCyW4LNERoPDaMWwsZff
	5aQEuVSgsYnoykLLgiVWX21Y3171KmUHSh/rMVVVYAY4s4Ard+lPaeLSVcHLqg2o4yV8BbunhHZ0z
	HMF+v9pIaOJ3oU9IW03QnwHM/3M7xejbOFxgKkp2YklRxKqaXkamJFnQq47hUKKh1pllKq3K+twa7
	hbI6/Ahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8zQs-00D32N-16;
	Fri, 01 Dec 2023 09:03:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8zQo-00D30o-2X;
	Fri, 01 Dec 2023 09:03:32 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BB6816607355;
	Fri,  1 Dec 2023 09:03:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701421409;
	bh=Gj9rw14US1N62TlR7bkVl3va+Y5iopHKH+jD5td5RB8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iHgq5kfzLC6WFvV56C6MLEo88pVB3IRTw8DsPyFeI0GmGC/r7n3YnIgOlaaKCFOH0
	 qjLO0UEEFzcFroQqywP2tef/wTCvdPOjuXpgc3d7jaTa3kG8Dtda1Q+K29y0KioS3h
	 KjY+mTok/5dmstXHBL6uPMzKAL1uwGNp3TZLs9jTD6N9aJNmo0D/IlhOF3QXqOJhbB
	 Sdp/WhhI/wIBDhDht3ln0PjtlW8heA7SHYJm3wUD1oFvj5cK/UbOJczBLJkv8SmUFD
	 cSUkGul+nwK3u5OvvsEriqqH3jEYk9YDh97G8pr5nj2RGaw8g7qAIF6ltkzUvP0q0q
	 QWJxC+99TZFhA==
Message-ID: <62810181-cfa8-4e2e-b2be-c3c9bf9e3bf9@collabora.com>
Date: Fri, 1 Dec 2023 10:03:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: mt6358: Drop bogus "regulator-fixed"
 compatible properties
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231130074032.913511-1-wenst@chromium.org>
 <20231130074032.913511-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231130074032.913511-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_010330_954902_661CF518 
X-CRM114-Status: UNSURE (   7.68  )
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

Il 30/11/23 08:40, Chen-Yu Tsai ha scritto:
> Whether a regulator under the MT6358 PMIC is a fixed regulator or not is
> derived from the node name. Compatible string properties are not used.
> This causes validation errors after the regulator binding is converted
> to DT schema.
> 
> Drop the bogus "regulator-fixed" compatible properties from the PMIC's
> regulator sub-nodes.
> 
> Fixes: 9f8872221674 ("arm64: dts: mt6358: add PMIC MT6358 related nodes")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



