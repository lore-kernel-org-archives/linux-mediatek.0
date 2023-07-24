Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEA5C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 08:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0H8EBp8KKF9Pfvb3ashnooYb9eKTYZEte+51sTamMs4=; b=c6VvJVH7tMGOmzbImB/AtPB40E
	iBL3SV8ZpjQdrP3iiJOoxBpqmpZj3YQiQE46WdmFLhoVXz6EoMu03phk9u5vU9kc2sw4E7cYpIJcZ
	iz7EJHmoxpXJv00SA75of1uwNBF6TuG7MSsSVeLgwXUpQ9RBh/9Vw058vfxJRd+jiqT1CrzIT7zWV
	M4jS9C8G0BQLDhzWVllaBaUo+pf0FKmQJODhEi086b8dPw8uReQanmEGbAm9ubrVqZZBV16OSUMNv
	VTUNcVcHELpUAXRpA0xUtAnviVG0ICeV7e31E0LTqnmAP6z4LUelRQkRSDGKhbhMUqD6ahupCPW46
	ToeXtODw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqn1-003E4N-16;
	Mon, 24 Jul 2023 08:19:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqmh-003Dwg-1w;
	Mon, 24 Jul 2023 08:19:16 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8BFA4660703C;
	Mon, 24 Jul 2023 09:19:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690186753;
	bh=urkKoxu8DIqx9yaZETGWB5AtfWNXPKcI9c8Y868BmLs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n/ZOVuMLH2lulIivPNWAKcjQmEyX4SXp/kPvPpp1cafw/UCiLs8pJPtU9Cg6Qe73r
	 BsqlU4EHl+MuUou2YVE0NLliNjw5ETWwgzhazT2vEa50k2lK2dynt9uZFBMbgkq2cr
	 cGIglMFfZBmaQw3gfzh/txrAloYyVW5Twjb/6iEKgnbLrT8895xqC8YsR2iX2Hq+mj
	 dyicOcRlgfdd4wSRNMiEh0ZSxSllpZGL4D0V4S8HjHzYMx7qlIVOWY6Qw/I+GaeHlL
	 Sd1WrsxKvAsPCO81rtJx9DZlQP+YRB9j6DrbHQjRAt0XMXgO7pH4/kyf5ZJrJzNHfW
	 yQsM/OTkszrmQ==
Message-ID: <c40a6205-7f4a-fe61-9b66-4bbc57304831@collabora.com>
Date: Mon, 24 Jul 2023 10:19:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/5] arm64: dts: mediatek: Remove asurada-audio dtsi
 files
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230721201705.387426-1-nfraprado@collabora.com>
 <20230721201705.387426-4-nfraprado@collabora.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230721201705.387426-4-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_011915_784599_532F825D 
X-CRM114-Status: UNSURE (   8.51  )
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

Il 21/07/23 22:16, Nícolas F. R. A. Prado ha scritto:
> There aren't enough users of the common asurada-audio dtsi files to
> justify having them. It is simpler to just have the audio nodes directly
> on the board files.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



