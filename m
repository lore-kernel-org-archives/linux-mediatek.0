Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2ACC0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 11:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/t01C0EN/QpTHgEBz222IZKPLFehmewtEJJGjauLMaI=; b=Ioy/DNKeDqICnOakipRFGsav+8
	kntR5EJbcBMMPZH6QwE/wyAsf7Na+g9ffPdv1y/izkfdJcFTYopeU0PWjZtZRYce54+m+f8Xw7Taj
	cp/r+OP4FioWhTbBndIXZ7rET3VDUHqBZNqHezehxNRMUyb0pI0ZpKIbAW0mQ3IRz31LE3WPg6kvw
	EMIN7a20y4NsKcaG32lP2peMi4sNdu/iogBg4bwgJxxlJU8vg6sN2uszF7x3UcPC/FqGZIcqKIYYw
	2GfkB0ZtiC1TLtycweX3+vRBEGGdAOBhce/MAjnaDjar9ZF2SjiLRm5M2u9Qf8FSF0BexGioTowO3
	1XJmdNkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuJB-0033Ys-2a;
	Thu, 13 Jul 2023 11:16:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuJ8-0033X7-0M
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 11:16:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbd33a57ddso5087365e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 04:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689246982; x=1691838982;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/t01C0EN/QpTHgEBz222IZKPLFehmewtEJJGjauLMaI=;
        b=eRP3N/6ImevwUzf9czr7Mdt+g6cvqkQ7wpsBpGJHV8fbjaClh7al/4pY9OBafDFXYA
         D5TdzfwwF2JW1E/2TjAQmgik9OXcJalB1dLjaOeaO2ITcgq3u2mxIoqJlZ1B/PdvVULq
         jbEAGF9XLNZZpgq9dS/BlGBYpEVagd0o9mskBHewBAV95kCHgUzR3XylysPYiz+frBXz
         glgLnxxraooy6deqE2iRPcirfNU3mtSea43nn7beyTfS5aD1PbQ51yh64ceH8hJtJWZo
         La54GOgtvu8KVi7v78PRVbsRls5NHtkdWRIOZVeyWopj/iIw0gT8dFXTeOAhnieXx7oJ
         MgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689246982; x=1691838982;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/t01C0EN/QpTHgEBz222IZKPLFehmewtEJJGjauLMaI=;
        b=iEcayRXAqzchnjuk2d10X3ObZnfIgk4AcPu10RUZ6FQM9x+n6B6cSIi+t+y+Z3mQP5
         Y0fXiNbcx0dFls5JsipeVxANz6+Y20rKbQo+x8gyvqsLoIUKxWzg/FLAjRQBUpLMJJft
         aOPE3fxl7E+H8Y0ErTA6bBye7dXfx3osJYCjWRKqwIIPUivYfidhQdgeunEw5QOw6QeM
         nRx+iAH2ShuFdyWzJnDMYTc3rebKYvTeIjw9GLG480lzW4bPT/8KZGJsgTjItxpOwJgn
         r3D2WUUOKGFRvNY4q/ITTbYBfYdShGA9jJfq7j+7oQEYVl0dtQvQIJCQk3MOP1y+L39X
         xjIw==
X-Gm-Message-State: ABy/qLYErJLf939WC/RgPcc246kyGkLjJy7Q2Uh9iyXBehGl2BkWQTuG
	I2T7BCvGOh5/udhLXKXP/v59iQ==
X-Google-Smtp-Source: APBJJlGmlptlgLgKMVcHCZdHYBHYEoZEjp0eeJuOJ8LpxrUplb1P3+Uoj54fMqYDX19vmUDfuXT51w==
X-Received: by 2002:a05:6000:181b:b0:313:f86f:2851 with SMTP id m27-20020a056000181b00b00313f86f2851mr1336211wrh.3.1689246982433;
        Thu, 13 Jul 2023 04:16:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id k4-20020a056000004400b00314326c91e2sm7702997wrx.28.2023.07.13.04.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 04:16:21 -0700 (PDT)
Message-ID: <f2cf63ac-9bf4-157a-b24e-58dc31336d63@linaro.org>
Date: Thu, 13 Jul 2023 13:16:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 net-next 1/9] dt-bindings: net: mediatek,net: add
 missing mediatek,mt7621-eth
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, =?UTF-8?Q?Bj=c3=b8rn_Mork?=
 <bjorn@mork.no>, Florian Fainelli <f.fainelli@gmail.com>,
 Greg Ungerer <gerg@kernel.org>
References: <cover.1689012506.git.daniel@makrotopia.org>
 <c472c5611c9c7133978b312a766295a975a0e91a.1689012506.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c472c5611c9c7133978b312a766295a975a0e91a.1689012506.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_041626_198570_216565AF 
X-CRM114-Status: UNSURE (   9.66  )
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

On 13/07/2023 04:17, Daniel Golle wrote:
> Document the Ethernet controller found in the MediaTek MT7621 MIPS SoC
> family which is supported by the mtk_eth_soc driver.
> 
> Fixes: 889bcbdeee57 ("net: ethernet: mediatek: support MT7621 SoC ethernet hardware")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


