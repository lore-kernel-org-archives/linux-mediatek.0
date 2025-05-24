Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FE0C54E71
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 May 2025 08:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYBFJ9U8mLqbbc+8f0SAmMzl/oGwiW2pOKW6PfNaUxo=; b=FyXNratkCLuAI06i70uUnak2i7
	MNmVtoaorl5zWdWDYZKtacKmM5wiGRsalDfvuGmV2neHPwLnipXBD+jpZUYOQRqAumc2oMsXRzQT8
	ePagARuh+/wyWT7VGV2yPdp+nKo7aEciY1+Hugobbp0mgR7GhGrfhGnv3nzpzVktJdVakExMTB5tH
	tJfnh+6n476xY9jk+wNQpIX32gcaKomDZ4K0ZLKEjwVhM3qat2sTbziypSyx8lg4Z9rbadcgOO5+8
	s1bLIXqYg7t6K54vIawawU+V5nMjEFrgM/l3zDGdoUcn7Q44qiVMtfbIzUx/WPgolWKA+zTAlugWy
	04t4WGnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIkeI-00000005deQ-1OyI;
	Sat, 24 May 2025 08:54:34 +0000
Received: from smtp-74.smtpout.orange.fr ([80.12.242.74] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIkeD-00000005dds-0cmq;
	Sat, 24 May 2025 08:54:32 +0000
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id Ike6uMjyN9ZLlIke7uwbb3; Sat, 24 May 2025 10:54:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1748076866;
	bh=XYBFJ9U8mLqbbc+8f0SAmMzl/oGwiW2pOKW6PfNaUxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=sTEdrC0DBn7oWtbnLgUXHImJiDKkX1AGajfKV0lWlBMrXZdL6Y3JiD+BcObayhREZ
	 +SApgEFK+URDi5StLfr88TRbIIEh3kkQSI5ry/c7sSSshkuThg7/LD3URWldrnBa01
	 boAEBYBhxkqTSXaj0aH3oWnmYJwFKcZO3NuPBjkqd60Yvk/kTRdasyY+KPhtfYpx8p
	 hBJ0PPowjgqB8tgEEXS+uNtL7LbzNk7AcIAorHKE+3vsa0GsHxxqwwxFQMPkBiYQei
	 ywwpfpYEEWB9OeW5ATKOOv6uZmG9FGGI1X08HufsOaOdIiFBPpoyEm7hXZDWjCcWpC
	 r7dlaRNlq9IEA==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 24 May 2025 10:54:26 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <7ae4c256-b14e-4add-b5f1-8b861e853407@wanadoo.fr>
Date: Sat, 24 May 2025 10:54:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] net: airoha: Fix an error handling path in
 airoha_probe()
To: Simon Horman <horms@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
References: <5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr>
 <47910951a3fa3c3bd2a942210e821d9301362128.1746715755.git.christophe.jaillet@wanadoo.fr>
 <20250516201625.GI3339421@horms.kernel.org>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250516201625.GI3339421@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_015429_596345_9907CBDE 
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

Le 16/05/2025 à 22:16, Simon Horman a écrit :
> On Thu, May 15, 2025 at 09:59:36PM +0200, Christophe JAILLET wrote:
>> If an error occurs after a successful airoha_hw_init() call,
>> airoha_ppe_deinit() needs to be called as already done in the remove
>> function.
>>
>> Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Reviewed-by: Simon Horman <horms@kernel.org>
> 

Hi,

I guess, that is patch should also be targeted against -net?

CJ

