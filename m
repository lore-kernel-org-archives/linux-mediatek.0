Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E250ED7833F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2024 09:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4FNL2H6mlLG/DouXXryxX5UEa4Xns3WzKjdc7At4Ms4=; b=EARxXj9Su90yaq
	oGbRAJFYNq3SH0+44Xx38Tz2mfyi5m99pABiyOqMkbTBBMUtSouhFkJrw4GCcj6Dvh2MxsIiztcwN
	rd/JdNdPV3dRlcDcC886jhJBKMQUXzV0FeOxMwcYjaddzXvXxIGU5HEEhq59TnXlPXBkjwuF6xKf+
	jpv0xuQZPaMrzFTHXL9VUyArruGvj2wH9m5bl6ODculVWAUCmx2Fz2f7b43zFYd8yDJw7oKLdbjwD
	UpNtoogZSeHN2eGtTLdMpW+fJ0e6WJvSbTRHOMRK0C3R7Gh9OgAEH0vas7HMpQvRW/XWC6/l5zaGo
	tEcx/1q44fPPgDP+9+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPZE-00000008ykq-0Lop;
	Tue, 03 Dec 2024 09:51:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPOh-00000008vzm-2bOe;
	Tue, 03 Dec 2024 09:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733218846;
	bh=6WuAClq8M68owHut10bo/Y4zfAyMTKIxsgOOv/8ymMs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EReIGTd7WIAMBf3p4YP7I5bDNR2b7UoNya5BSCY+hTD2abhrmLQvUQptTG8QxeKND
	 teMXfHbIRttBh6Qg09bPckAvQO2odtMNE4/MabDLAbdqFhFfAKe61bQ74Kg3RLEGtz
	 YyDEYfu54ZD1p4OffiNi/eoOqS4yvEecm/Pmrs5EltpD0xPQufofi/ZsGEd5dEiLRM
	 o9CRp3CeicuXVl/kw7VIZB1Dx1hXo7lqsbyRlfEjc8IL5dQg1F9klhqewQmXIOrMBF
	 ILbD1q3ko1XS+rtEAnm+gcmf5SvLk9DSxoIbinN8sNV/YmBwHdl+ullx4wnJ96n8dU
	 b25xGEieFUY5A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CD1317E35E0;
	Tue,  3 Dec 2024 10:40:45 +0100 (CET)
Message-ID: <6a547915-4a20-427c-ab91-9e64d3afeb67@collabora.com>
Date: Tue, 3 Dec 2024 10:40:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/18] arm64: dts: mediatek: mt7988: add missing
 clock-div property for i2c
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-13-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202122602.30734-13-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_014047_830147_B360DFF0 
X-CRM114-Status: UNSURE (   7.05  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 02/12/24 13:25, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> I2C binding requires clock-div property.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Can you please group all of the DTSI commits at the beginning, and all of the
BPI-R4 commits after?
Of course, do that *only* where possible - like, this one can be moved as it
is only touching the dtsi and *nothing else*.

...Besides, this commit also needs a Fixes tag ;-)

After adding the relevant Fixes tag:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



