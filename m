Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61461C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 07:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVulM/0QhJyBcgtu8PZWMQBsy1xuEVjScjwL0A/oSF0=; b=1WEWzv/bEGnGnc/A5wdyeeB/iX
	9zxvf/VHX0YuQN/wkQLcdsDdMvWtNidYKe1e54NpdnUV3vTwH2ePQkeQlye1Wdsj69pIdBVglPkyL
	8GGhkELydFGJCaTg0rlQI/V/ioiT0ru92at2xQ7MTuajNfgpgeyIsqsKXqI4wOXFSBSh7b7A1cKsz
	kWZyiWFl72cxWCbSWb1gbwTVw0VkSaa87LU/hZMzrqvPhDV3OW0zY1RkuKHMzkqPQ5Hr4lYC7XJ7I
	VCCqnmcU6Aw8sRpJ6KxVvpoqMdJI0Uz9lokssXgShnd3cleUUpnX6a/lC4uaOEkId3LYQPP//FIXg
	uV96lGNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVS4R-00GNUJ-17;
	Mon, 14 Aug 2023 07:32:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVS4O-00GNSu-1g;
	Mon, 14 Aug 2023 07:32:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 07BB560EF6;
	Mon, 14 Aug 2023 07:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9AAC433C7;
	Mon, 14 Aug 2023 07:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691998375;
	bh=t5/MsvFWknOoDFPSV8iv6i5JpN85LvBKxQvGVQF6HFc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m/vD1xO/Sw78K6HNAv3mCQXCpvw2eW9lo1RTk0Gk42Bc65r/mcVB/gc+Q/Ro4u/aw
	 jFAIUiwOwHDix/TGZhxebjzKxB9q68Xbvj2EFMVRc7mwy2I+wWxovNvnKZ/1tqVFR9
	 ABynLf13vm5Yazy9dy+XNbm5lKiQV/jPrrrpsp3Zj4IQjTTh5C65IRd18pAOeUBC7W
	 Hw9kBml592imxrF0hRaT91Pniz4hq9TkPAv+VNe/4L/47QCUbstRoJOqqgkpFjmnIT
	 o4vLaCbSEQTHzCjzA6gaj/klvbWZc5O3FX1pRwZwLIYUS2HYxeBZsV1pcADVPOkoKi
	 +leV4NlQjXcYg==
Message-ID: <63913396-5661-f73b-728a-2f3801c67f25@kernel.org>
Date: Mon, 14 Aug 2023 09:32:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] dt-bindings: arm: mediatek: convert audsys to yaml
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20230810133602.48024-1-eugen.hristev@collabora.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230810133602.48024-1-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_003256_602713_D96A7C18 
X-CRM114-Status: GOOD (  11.29  )
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

On 10/08/2023 15:36, Eugen Hristev wrote:
> Convert the mediatek,audsys binding to YAML.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
> 
> Ref to /schemas/sound/mt2701-afe-pcm.yaml added as informative only because
> that schema has not been converted yet

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC. It might happen, that command when run on an older
kernel, gives you outdated entries. Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested by
automated tooling. Performing review on untested code might be a waste
of time, thus I will skip this patch entirely till you follow the
process allowing the patch to be tested.

Please kindly resend and include all necessary To/Cc entries.


Best regards,
Krzysztof


