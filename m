Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C807C04FFE
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 May 2024 12:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBjywMojmKefC14yR0AzVjG42TRL4xe7n8bh+xS6TYw=; b=FE6TxZ5Fj1QN3sISfXv4Jf7sPi
	oKeOntSdrWxzfmkyKm8S571cQJrK49pLX1O00QsrYGJON4YJ+G7VjJyq5RsUg+rjRtG0jc3R+XUy4
	/ix/ZHt6681qEr+vHa+hd/g6x3n7kJKGGKn24tnnuteuevKqlvrDwOlV560yWb3wHFLtC/hHCWOU5
	bj2muuYvsz2w0mjceRBoxjqg0A9GWMayLhnu/3hpR//IwfDj7Yoz7HuuNk3CQi/OGKzgNATyOyA36
	2ylE3E1Giebc8W2ydJneHsM1T8Y0/hLVI7hZc8f0zhZfnHhE5ngLrJvNJ38WO2LwTvp0reBY4dv7+
	qhGe5U9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6r4U-0000000FqSH-2IQs;
	Tue, 14 May 2024 12:15:54 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6r4R-0000000FqRb-0ZqL;
	Tue, 14 May 2024 12:15:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715688946;
	bh=V1ALFL3Ofg23rEQA7JjAvEWOEBiuGxWlwTVlh0vhA+A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=05/nQMvmvmRvuQ9JBknzao7jOQfBabCx1tQ5FPP/ng6xNI99r3o1SUTigySTvPzqt
	 xQYKpfwLrT7SGzI3JoV52NSJnzOfrAPX846NpGkGL8f7xwPXVCjEaZAZGcXA9BV5t8
	 Z8X4Ta02XfajyanWjwj4ddYN1PM04zRBQ4RZnRty9F77z8iT1FbeX1QaYqehwEyVEy
	 OfDtinfMCT0BT3EAw/qAhp9Uzj0kgZBY4cC5jX1g9TMzsmAlqrTigEHRKyXIAc70nk
	 7oBwZEgXZA44BUGofdIw0LRfItZDKN7zUbVHUqes6RyV0//7o3jqrLJX6gjEm9lvGT
	 mNGTTwI13ka2A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4372137810C3;
	Tue, 14 May 2024 12:15:45 +0000 (UTC)
Message-ID: <68d24f47-1b4d-4278-b7db-bc0eacbbfcb4@collabora.com>
Date: Tue, 14 May 2024 14:15:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] dt-bindings: nvmem: mediatek: efuse: add support
 for MT7981
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240514015154.11206-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240514015154.11206-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_051551_333501_38B6F300 
X-CRM114-Status: UNSURE (   5.32  )
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

Il 14/05/24 03:51, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Add compatible for MT7981 SoC.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



