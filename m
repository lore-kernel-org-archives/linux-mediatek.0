Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A1AC001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 08:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aH41CdCdAlTU9cQzwSa98wfh/Q2/HPzFBMrUO8pIS+4=; b=49mCvy101V9rjIVrlNd5pFQvus
	zeX8rrKKaL/Ps2IOTOPDiAM4dVoLHw29jQVFdqsHrwyYT4xrTb2dZO/zVmV+WrvRjeClk7h0MebXu
	AjzVmpjLKhLRYBtLgDvsakYFLF6K0/Zup3Bf1U4wyuUrTjVyQTD1zng6BvWQTRzJoCqjIBnwSnWQa
	yYqpO8rAGQmUbo1viHGjJn++WMY56U1NCrQNBxZc214SELKq9G20jSP0JICd43y1J+B7fs0zDWc7n
	F/qLCsJoIKQ3NSCo7dJfRtplyVUsVm+PeAAooyMUwdUHTmQO2uYuxpSOaccbo6N4l0opVFrHgWsj+
	Y/B+dYvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqmj-003DyY-17;
	Mon, 24 Jul 2023 08:19:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqmg-003DwV-1d;
	Mon, 24 Jul 2023 08:19:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E08AF660702C;
	Mon, 24 Jul 2023 09:19:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690186751;
	bh=GCFnrMzv+rNigLSD0v1cN1fv4vmk6WyzFgWQ1ZaSsio=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GbfkbmG/lD+WW5KPpaXX5Vif3xElrqaxm7WNWoQCBGjT52O+f3oY3fZCEZes8Rohk
	 CqxPTT5oGwtCB63i4Liv7WfMcFa8yshINQ2tygToyNov2laaE8qYw8mLM94QqFgvEM
	 j9iN3Di1q4O2yJdO4729zStWGyG4mb7YH6KlPzTkJlF/K4M2OsDnjxqLzs8o7/h/jm
	 P7+yniWWn3zHtt40KjN2tZFH9Cmy1fmfpMvl+5HBV2NIbj8L2X2rJkQYjwV77b6uYH
	 UYva0bU7K3KTJ2yxg6vnpkV5r9jiuIAqIfI5xQbLnxr3BbqOLaOde0tZ9VyeDvE7T9
	 ff8RJQiNSQejw==
Message-ID: <815a67c6-0006-7a63-a940-bb9e3efc7217@collabora.com>
Date: Mon, 24 Jul 2023 10:19:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/5] arm64: dts: mediatek: Add hayato-rev5-sku2
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230721201705.387426-1-nfraprado@collabora.com>
 <20230721201705.387426-5-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230721201705.387426-5-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_011914_693864_134FF075 
X-CRM114-Status: UNSURE (   9.08  )
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
> Add a devicetree for rev5-sku2 of Hayato. It uses the rt5682s audio
> codec instead of the rt5682 used in the previous revision.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



