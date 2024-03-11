Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AF1C54E5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 10:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yg80zDLywGHSbEFzMab044PkmJoO+CN9L87YEoSAR1E=; b=CCBjvzGN3EEgX6CIWaqg9rZjCh
	w8TovRoCV8lWYGSAxw4YULG5pAh+Qc4xJZM9Vh1tm5rUOJ3ceTxSTbzT1OBDf+oNC3wG60x/tbpdc
	oGxlhCq3gjLxhroViG1DABAdSoJaa6oBi8cu7HpbUIcFqclbVzXMdzuD9423Lr3Ist4Su9SYKGKgh
	UyOoEjnnx7hkEuqZWBTBKh0WQNcD/otE9kJUEEycKcnT2HoGcDW9I5T8o1YdZ0zgPdk3LWPySZKU/
	0rG/f5+cQICd/6Royckd66ASN98+8AzU/D703ZSh3zAURv8R36SrJhYe/i7I4RC3tIs1siVwRVVcv
	5bIuWljg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjd9Y-000000018lT-0ZnI;
	Mon, 11 Mar 2024 10:45:08 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjd9U-000000018kI-2rT3;
	Mon, 11 Mar 2024 10:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710153902;
	bh=AYELuvmy1IHugw4HnM4ONirROKH+Pk7pIjRURZ1g4/s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=zeCPiw2NaTtpPrHbsVrCZtJJz0H/3f+tzrBmZBeX6ynqRj5bpIEBKF0UB2Kst9hr4
	 WQF3hylF9IJ5raWGfDj7LlwR/wF+jy/BIj/VI1zG4sm6+L5pgVW/ON3XMSDWMleLt4
	 setlWC8CoO4YdIHTY9Q43Qip7E6vh940JsbyF28hcAl81vFcm3XmtLnUT5f2pSAQ13
	 b1+ZqZpILojANIxMQ1tY6r0mhNPJ7omXdbLVbybpPORXB7Im7LIxPUrMpWCIbSnAit
	 TsoCVTQV0I3+8DHHfmRF7cM95Vx+tfodXxVpZf173T980V2VXyQXSRNRcfllj4OKcm
	 1Eq8M63hRraog==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1F9F83780629;
	Mon, 11 Mar 2024 10:45:02 +0000 (UTC)
Message-ID: <3cb2528a-6e09-45c8-a590-f38d37660b91@collabora.com>
Date: Mon, 11 Mar 2024 11:45:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm64: mediatek: add Kontron
 3.5"-SBC-i1200
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240221155905.1217340-1-mwalle@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240221155905.1217340-1-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_034505_235630_9C3F8E29 
X-CRM114-Status: UNSURE (   5.55  )
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

Il 21/02/24 16:59, Michael Walle ha scritto:
> Add the compatible string for the Kontron 3.5"-SBC-i1200 single board
> computer.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



