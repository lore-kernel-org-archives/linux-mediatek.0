Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268D8EE644B
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 09:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieFEE+bIeImsOctC7uN7P96v23w8BMliLdHUdnSC5Og=; b=MAUylGzhhJygOZ+DuGnYwsZJaw
	WSgxiWyZPok1F03WJUHVKrZTdsER2Os01SKJqiPZ5bpgUHvViut6muKs0I7CBdOVCtbzn0hqgdo21
	+2BuAebdJwkK5FUk2xsxd15+eU8CKYUZ2iU1iBxnv58w5kbbpPNI0w7+pTjx+COb3IJP2bDORMkN7
	yDld7JadcKmWHMQAlg93CQiU9NHvIKVcjmZ0jRkkEz4DCVYAU4F0Wjdn6wa+xtPOwdlDHDr5xZvsu
	BNO0V+Dy1unzMBke0r+0QQyIs4peT0/5N6dEOaR2dDuVukdNW4j52mhjaGd9k/CuvYlvZ+RnvAa9o
	9RjhePKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh520-00AGi5-0S;
	Fri, 15 Sep 2023 09:22:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh51v-00AGeH-2P;
	Fri, 15 Sep 2023 09:22:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C2A8066072F9;
	Fri, 15 Sep 2023 10:22:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694769746;
	bh=fzWaPZEsAH1sXxqOkzkVtQ4njuoVic2dFspzQhvmEhQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hLKOt4CQSs1fT5XRZVgDtipG8WoOmZASj/JOMREm3A29RtJ9QGt0Z3jPdU05Y2DdE
	 aG+x2vOsMsD48u2FVmgr5jcD2tpjZKXKzekCQTY01kFRr8LDL5xCcASGcaLGxnN/8v
	 cxOzBNZHO32+VfRniTSz6FZumw6pWdCOlkqsa8MRG/03MP/lFx6ten0E8QgULgQT72
	 N2hiCs18TNhtWQ2fXCiQVfQIyXdraOMzxqeXmOXa5obPEtqiks4vWHR7leejQyV3/A
	 Il262QCiRBVDL2ZVbBe0qxn53LeZcZyb0/LZBua7CZ/IMiXG025Up3V2rN6SAPnOkM
	 fzqHsE/0J+nCA==
Message-ID: <bf87aa29-ea42-f811-7ae9-3888336989fb@collabora.com>
Date: Fri, 15 Sep 2023 11:22:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1 1/2] dt-bindings: soc: mediatek: add mt8188 svs
 dt-bindings
Content-Language: en-US
To: Mark Tseng <chun-jen.tseng@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Lu <roger.lu@mediatek.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230915075003.1552-1-chun-jen.tseng@mediatek.com>
 <20230915075003.1552-2-chun-jen.tseng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230915075003.1552-2-chun-jen.tseng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_022227_923547_3A8EFB41 
X-CRM114-Status: GOOD (  13.33  )
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

Il 15/09/23 09:50, Mark Tseng ha scritto:
> Add mt8188 svs compatible in dt-bindings.
> 
> Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>

This commit does not apply. Please always develop and test on upstream.

> ---
>   Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> index f21eb907ee90..7eda63d5682f 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> @@ -22,6 +22,7 @@ properties:
>     compatible:
>       enum:
>         - mediatek,mt8183-svs
> +      - mediatek,mt8188-svs
>         - mediatek,mt8192-svs
>   
>     reg:



