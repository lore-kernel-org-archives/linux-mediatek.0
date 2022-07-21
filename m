Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C1EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jais5JyG/hEXitgHW8wYDGDnpG/qM3aoRWhpORyltFw=; b=HfzoQ1YPuL7DrjXuq2K/dNiTQT
	eB6u77yb94x7v0utUu3US+NZtSCCLEummjUYXbdBimfy5EAuBmubygql8+2jxGVqbJ7sYHu33nVaS
	nuk4IAl7QQ9ezPTZYMRox90Yn5WkgcY+l0N0vS9/6qHxcbp5VSRHn+gTTvkPyRA7lZPoW+w0ejUHL
	7qtk+9VdhTwJyTWQdsGDKLnHRTsDPEAD+zdn4qWItr1Tk8ztlMFVPNGEgfmqu+jcRJwtGB09qGYTJ
	Z0VoptK6Kl1EqNNub8y7rOI27Dh1hsG2VzGqF+42Lw21GJ2nAzDgluLAWfky86T1AjAg1GjHHgxu3
	NmsErBfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXSO-008HjA-UT; Thu, 21 Jul 2022 14:47:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXS4-008HTV-Hx; Thu, 21 Jul 2022 14:46:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 40E576601AAA;
	Thu, 21 Jul 2022 15:46:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658414812;
	bh=kmcFUz7HIbwRc4mzs+43jNO9MKiSsiz0lRBnk1Qv66U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WiNlK+jJO9MKGiv1SfmksqZ+t2NkSfC/n7H/UuahJS+QO112TuHxeoqQ91VUziI6g
	 +XnGMjb+dg+0JY0khKUXHaCetUgj5vpnJEZd1NkyA+fwsJtFaCMPrZNQ4nPcAlL9cB
	 QNLnMJqzu+MgKqmcPmmzXTCW67QUsQExeT6VhatgUaElEbkfj4TfHPzm0HhloTbS2U
	 QTPqEEVB8k52ZkOlPvkiOcn5ncTE2EgU8QlO05T8rRsc3WJDtrlQ3ho5CFGic+IDP2
	 Jjrafcc00zOpduyx0nTn1s4kXUuUSQYKRRfcChfHCaJxHsCMNy4TR9hI1NL71lTr1d
	 Zn4suss5nO8YQ==
Message-ID: <d8b638a2-1f4b-2d9e-ba44-401bf3ce488a@collabora.com>
Date: Thu, 21 Jul 2022 16:46:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 8/8] arm64: dts: mediatek: cherry: Enable MT6315
 regulators on SPMI bus
Content-Language: en-US
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220721134228.310178-1-angelogioacchino.delregno@collabora.com>
 <20220721134228.310178-9-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220721134228.310178-9-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_074656_857244_0691778B 
X-CRM114-Status: UNSURE (   6.96  )
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

Il 21/07/22 15:42, AngeloGioacchino Del Regno ha scritto:
> All machines in the Cherry platform use MT6315 over SPMI: add the
> two instances, providing Vbcpu and Vgpu regulators.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Sorry, the Makefile slipped through (did that for a fast dtbs_check).

Sending a V2 soon.

Cheers,
Angelo

