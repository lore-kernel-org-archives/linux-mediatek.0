Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECD3C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 07:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwVXKWq5GNnWoTDUHcyAd8EJGBrIdQm1nCY/RZ844Ig=; b=yy9P31Cvyg0T28bpR3Ac0BIk7/
	h6VkRkibNSlIKaG0EEbYSd/vZQPMmYboosDO35o7Q6ss+SJ49WuH95jfLN02AFUQ4TxieKNsgYt4d
	oYRXMP1JQUwinJdE3ONzgXRt/RdgkBX4Dnr4vtLAZBFtwrNmeTBe+09ph+0uJdcbLxhPFTN5rRjBe
	3xx/FQElfMYSMnOh6Hhw6HS1q9JtiDe6rI6BmXb+3ShuqpnbvZhNHrhjYYJ60Tg699Ahacg4FEpWM
	BRTwyz6cTqjj9pn9sTvCEgOfDGUSypGosKapXp0BvdWEe9J9QHFgAuXR0iWC1a9OAFgOtrSPpdCNb
	BW0hRcFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q64lm-00EZCi-0w;
	Mon, 05 Jun 2023 07:36:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q64lj-00EZAt-0X;
	Mon, 05 Jun 2023 07:36:48 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CEA0A66056AA;
	Mon,  5 Jun 2023 08:36:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685950603;
	bh=Vjm3ihthJvkZLq+tjlrnOh0IMA05G6NIKzps6uAqPq4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D66lucLU60+oysiEO+49sOUc+ebQrmsgjhrN5JHtLefKmhNh8EhiilKzGFZBKl+YF
	 ADZbnI9PEeGpHmNHyoQNuJjeVQLnOZR1ikTSW8FOD/5+kar0zhnIZXbcY/0sTpa1cZ
	 gKj0lZ7vodDLmBNmGPorXC62hvzrSfFcwuZLJJ7MJTK8EtDCTc8VvgXiu2Sl2i06SM
	 reLN219D71BIdCLGqlQjEIUPrJzV1fqQhKX0KkWg5SewHB4/r7HJC8+0TIK/QzkHZr
	 v1+q8et83WMBojnOs3/jzayTvNAb8K5KbphnXvxwYQSlI7sc3YcMlCN4ZiFxktJTeW
	 46o6fh5/WNHeQ==
Message-ID: <0144a00a-aa87-58f0-9d49-6ce35e41c945@collabora.com>
Date: Mon, 5 Jun 2023 09:36:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: mediatek: Move auxdac
 binding to yaml
To: matthias.bgg@kernel.org, rafael@kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230601134425.29499-1-matthias.bgg@kernel.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230601134425.29499-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_003647_418397_D643CE92 
X-CRM114-Status: UNSURE (   8.54  )
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

Il 01/06/23 15:44, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Convert the older binding to yaml syntax.
> The thermal IP has several sensors, to reflect that
> thermal-sensors-cells is set to '1'. Apart optional regulator
> for bank supply wasn't part of the old binding description,
> this patch adds them.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



