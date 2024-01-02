Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11200C47073
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 09:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BT1PNJegy/1AgEc1HcHN0Fb7bulhbF3x21fFqPfAdyk=; b=4zJLzILMPnij5FLmD88fyaVuqR
	EnPjx57gSL+4Rw4qKTau0TrLDl29ZRkf06KHgSq0SU+zFOWKRCosC739cQMOtNkuVkILNx/18D8QG
	28Q1fQa8VYbhVcF4Cqua7r8y9DhKM6gqlImXKMicFzaEcm++djaI4a1gVE9KFBRUjftybPkVqAnjX
	k/k3ouPup1Vz0pBFhvI5iqTiKMN5E2s0NLfxaT3RCZI7xkciW0NUp2Jm9C9dc2zakNtYxCilWeCXb
	r8UbD4smJNd1ozAkBjuJGqRPwgxbx+N6GtPJa8nbYaNFq0QAg9v8FafVvqOxqP8TuoFZ53eK8D6s9
	11UUzRCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKbOW-007VMR-0X;
	Tue, 02 Jan 2024 09:49:08 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKbOT-007VJ5-0P;
	Tue, 02 Jan 2024 09:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704188943;
	bh=4rfbsWJGA+cIk/1N1fb6kSLynUYzumolMwwKnRzoCW8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T8YfcSbGRxz6NbknwqNFJiAvy1AhOSQ52kztlGG3D7PACVUB8yfoCr4k3asXO4jyd
	 jviqkZt7+OvBDkhgyiWhauzmo/wYYOhiRoRHtkAxMbFv2DG51qw1qkWK+q/6vp8q4/
	 cwgjIFzZCxhtLWZoBUSRpvLULgUIZ7SRdB7IN284hRRgquRhZi6cfcvM7UzjOyFowd
	 Y3WsFcmeS8KqwZwbFh4uZ2hFiNS/icdN3CpOzi/mpZqBX+dM2gF4+uQFQ3cMoEpGbH
	 lTGuMqSDgBm4+u+cqlpCDLadvePTfCi1n4eTViXnhkVIzkS4GFIQRrV3jsEpz8TwJd
	 71XVn17HCcmdg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2506A37813DB;
	Tue,  2 Jan 2024 09:49:03 +0000 (UTC)
Message-ID: <14b1465e-678f-4809-9753-2e0bcb8c541f@collabora.com>
Date: Tue, 2 Jan 2024 10:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm64: dts: mediatek: Add socinfo efuses to
 MT8173/83/96/92/95 SoCs
Content-Language: en-US
To: William-tw Lin <william-tw.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231222080739.21706-1-william-tw.lin@mediatek.com>
 <20231222080739.21706-2-william-tw.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231222080739.21706-2-william-tw.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_014905_293753_85CC24BE 
X-CRM114-Status: UNSURE (   7.56  )
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

Il 22/12/23 09:07, William-tw Lin ha scritto:
> Add efuse nodes for socinfo retrieval for MT8173, MT8183, MT8186,
> MT8192 and MT8195.
> 
> Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



