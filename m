Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51F5C38A02
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Oct 2022 00:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNgqXTLQzx+OH/VLw8tzUbgm93wzNbAskM4thLbUDas=; b=S+4dWaeLnlYQyAi4daKNXQYZa/
	hyqmxGsgTcX3Zo5C/0a7Z+ep08c5EET+/3rw7lUwYIYISDWAHlMqdJ7GH5y3t2QAkO+KwvWaP5S0J
	5gF+XQELsc+Hb7SHWRpnahIeWLuIrN/JCDUPdLcQ92P58clXKG0uKkTe23g6OmWvBE7Lsv7c5y3FL
	Xz/4V25kyovj0qupJfaXkfJfU6lXM153T553ie0iZGEoUv8yh9J4syDouFFjSHSR+bw9qB+l7ZtjP
	QqYOnFPEZMKLWeM6lKOgrBImE6R8MVC2FDydLjVGgTKSGKSf3PpGYAwl9VQ5YYG2SV/htROTLWJLq
	6y/FgyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZPl-003OvO-N7; Sat, 29 Oct 2022 00:09:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZMq-003NLf-Rg; Sat, 29 Oct 2022 00:06:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EFB7762B27;
	Sat, 29 Oct 2022 00:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6815CC433C1;
	Sat, 29 Oct 2022 00:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667001987;
	bh=9mAs5jNV4WUCIWHIz12h6HYmxWFxyAyczC1Iz+15III=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O4Jn5exJSC1oinHzGUVzKD6MQB97DxrY5kPQCT7jfJSvJEeaH+NW8VeyzSdCXkGfg
	 nQsuxM5d3FLx+aVigLkvxDNRt+tTF4xkJlOy8KWJLzvWjBtRqqOjIhWjD4hWVzn2sA
	 L/VBCQttsy+qON+gUPZ5CnhjD6kNMoK8A/5+f+1S0TugTv9pEaLx5G8aDz9u/jyN6p
	 KtU8fV3gz2v5ovTbnuh7gvZz5eW5z+cu/0CIWWaSjDHLA/+hzzShWiDNzz39EH04Xj
	 usoRuNEEb+VIwPgqxNotwSBEj6i97F2+QSR7HQRxJ16mHcGqibPuiIhslcWgtVYJve
	 RQWDlgClnvANA==
Message-ID: <1cd3a240-886e-82cb-e821-74f82f1afec1@kernel.org>
Date: Fri, 28 Oct 2022 20:06:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 10/12] dt-bindings: mediatek: mt8188: add audio afe
 document
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de
Cc: angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221021082719.18325-1-trevor.wu@mediatek.com>
 <20221021082719.18325-11-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221021082719.18325-11-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_170628_983370_7901A43E 
X-CRM114-Status: GOOD (  13.59  )
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

On 21/10/2022 04:27, Trevor Wu wrote:
> Add mt8188 audio afe document.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

> ---
>  .../bindings/sound/mt8188-afe-pcm.yaml        | 187 ++++++++++++++++++
>  1 file changed, 187 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
> new file mode 100644
> index 000000000000..b2c548c31e4d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml

Name matching compatible.


Best regards,
Krzysztof


