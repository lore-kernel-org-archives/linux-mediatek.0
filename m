Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1FCC001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 07:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucqUgSJ7hJLIAcuUVJ7taQCfv0GsKX3pEG35O5vd0II=; b=5D3k81P7nIaVtoH5GpcGhXXry5
	MU03BoNEzazo2Da6YfuR+EMfIwkaLfqvs5Df96Hwz9thwv0GI/8dBH4R54XqJJm1fYCAett2YznOt
	7h/VoMRuh2XxjmTqT2CGNmilDVF876hazKMBXk7UuxvgalRqPCfz3WKYu9Rk1Zl6dbAXrq2NrjLpz
	v0PHUs0z2bJHlsENCDJLLBEy8FKmFJAUESGr1XYYh/+EmVs4bzW9MNN8EetPUlrElHF6DNdAv9vBa
	Ig4BQLOjXIK/2OuvzWN88mV7ow65nC9/ARhR/sg02QOInP4Cux5ZA3rYBhmSskSS6QzW6zOzg2jMd
	LZIk/Fyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVS5E-00GNhc-1K;
	Mon, 14 Aug 2023 07:33:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVS5B-00GNgh-27;
	Mon, 14 Aug 2023 07:33:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 29F30640BC;
	Mon, 14 Aug 2023 07:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0E0C433CA;
	Mon, 14 Aug 2023 07:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691998424;
	bh=JkB+gn7TUvdkscEzzhGD4nxnOVfoiK8M/8pot+rQxjA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E0hQSBoIplR3tvqH4TwYJxKLt6RPldcik5v0ZG9kzTbkeDhac3ivVa56sE3p82Ay4
	 0axYNLQeymiGFzoeZs+jgLSfnfsS7nzNW0yz/CpTZgLttZMwRUqGoAW5X+/x5mWYcN
	 Ax12PAIkBFw2+pQDABejb1fxqmeHV73w8oz4nGe0zIctGU1xbazL+0mW/FO0w8FBhR
	 QXvvZhSfUNpdOplOE7MDzVB2o0IGHjNoi2tnyvGJYhfGLMru57LqNp9gEwID47LOGE
	 ThCBzOe03vxj1Tyn7NKtsmbUeMZ1AUrOocOH/AnGGrWHX4HSccyzIA/7agbGu16a9G
	 YEUhwx0dXPUfg==
Message-ID: <bc5a1d8f-0630-9b4a-81db-6bf17cdb07e7@kernel.org>
Date: Mon, 14 Aug 2023 09:33:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] dt-bindings: arm: mediatek: convert audsys to yaml
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>,
 Eugen Hristev <eugen.hristev@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230810133602.48024-1-eugen.hristev@collabora.com>
 <20230810-syrup-matador-f00ec8ad381d@spud>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230810-syrup-matador-f00ec8ad381d@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_003345_733573_D6429A89 
X-CRM114-Status: GOOD (  11.88  )
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

On 10/08/2023 21:24, Conor Dooley wrote:
> On Thu, Aug 10, 2023 at 04:36:02PM +0300, Eugen Hristev wrote:
>> +  audio-controller:
>> +    #  $ref: /schemas/sound/mt2701-afe-pcm.yaml#
>> +    type: object
> 
> Other than this "informative" reference, which really feels like it
> should be a second patch in a series with this one, this looks good to
> me. You can add a
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> when the reference is a real one.


For the record - this wasn't tested, so even though patch was reviewed,
should not be applied till it is tested.

Best regards,
Krzysztof


