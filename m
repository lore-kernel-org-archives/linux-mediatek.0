Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD59CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 12:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnWgeA7y67GoVbYkPyxyRXR0Dx51UBv0QfPO6JCxUV8=; b=pG7Or1xT+A/7jt1Efqb17Mwh5a
	pbww+OGtiJj5pcIA1SulBbXa1kvGuyB7nDjV748NLsfwHB0MxM6xPnYXIDQvUprhtODNJyyYfMkAC
	PinA31THJGiMv0ypBAZC72ZUV1SbtOdNvEH9dozeK80DQpoBSMQAzvpzVVpU9cwIjKOBtvrsdB0/8
	yu5az2/w+KPqiqIDDEYnO8iUDA30VNCqNWSgWYrTtvXE8Uubw5/MMUgiKq0YZrbjSZ+IhEWKIVsj9
	9Xh3dcPvM+biJd8FIOD8aa/E0jnqVIp+Lt2FRJAnOTddi4r9lXgMOVIW9UcsB9Z8Z91EEiWJVw9fz
	fyOEq8ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruAKg-00000001sN5-1hxX;
	Tue, 09 Apr 2024 12:12:10 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruAKV-00000001sHa-2mgM;
	Tue, 09 Apr 2024 12:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712664718;
	bh=v0RQHTIRFDC41mS96xZoh27SZqw4jzWtkR/nAo3pAB4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Sfvet1GzYabCTR3o7M2mjfoh0odXuBq3BtLvTRdNenZLcjqXnid0lKLMZJjGlDrXR
	 vbdXYEMOvz5pLLx5ZNveOlVapvkJKEtvwuse7qeAsNxqI2qigPmfTpbI1sCjVgBhxL
	 NaL2mbjQAwfDtR2VrxmbhymdDkmgwqqmA9zdTWtwDwTsOss7xDjH9DrTWa9yECYMmh
	 QQXK6agbu3YOMA6H8PStgF1h0RB6Ml53t3sJjh2OVY2EPhMsSb9URy4EBGa/8Ax0D5
	 HI0J0N5a+F9K0CH/Ad1XAHdG+EDczp6NEKQBSfTYAE8DfftiMu03d+k9NIVQHAcIsA
	 fBYq+CGN5Dqow==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1B8CC37820F8;
	Tue,  9 Apr 2024 12:11:57 +0000 (UTC)
Message-ID: <2bfff311-87f0-488e-a0f0-709513ae2799@collabora.com>
Date: Tue, 9 Apr 2024 14:11:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: qcom: Add MSM8974 APCS
 compatible
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240408-msm8974-apcs-v1-0-90cb7368836e@z3ntu.xyz>
 <20240408-msm8974-apcs-v1-1-90cb7368836e@z3ntu.xyz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240408-msm8974-apcs-v1-1-90cb7368836e@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_051159_884689_7106CB4A 
X-CRM114-Status: UNSURE (   5.06  )
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

Il 08/04/24 21:32, Luca Weiss ha scritto:
> Add compatible for the Qualcomm MSM8974 APCS block.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


