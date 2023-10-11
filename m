Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A6FCD6E5A
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 11:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNPNkwOEDk91iw9h3rV4AviZxmeWeoLT693UpVyQp7Q=; b=xBrMa/N5sLvMQh8oi8h+Soa0nB
	7dJy+vNN3bjbNyeO3IBc2eHN5cvzZnPyYNsfacPR2+KPqmV/l9oSHf1ZAgq+g0eN6Uu1p/WBqy5DU
	7EgzIwYFkjnqnOS0e1S8NKlx1SIWeEsOHCrSh59le+QXYJmsFggzpSsOBZsxFwHz/EI9wBLur2j06
	xQ34bWLk+ErjZHltBtj8mgdb0mZagOAMfSeSx1yIm++1PP47G3500B8DUsap7J1xr7V5uxvUX1G6k
	KmgsqwvFPoBg+Wxs3J73ab4yXix9O14P+cnNhMkX9ZC4/7mFqlwLm/onfh62853fzG7gslzHmRcoX
	CrIvoduw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXZq-00FleD-2d;
	Wed, 11 Oct 2023 11:40:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXZm-00Fldm-2Q;
	Wed, 11 Oct 2023 11:40:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D43C06607312;
	Wed, 11 Oct 2023 12:40:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697024428;
	bh=OAMxSeQ6P5OM3kNDdwo69a8n51/BNIPMjIOkxQ7766s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NUigGBNW6cMl0UPf5ATiyCBG/6NiwnVGibUC7TWy9Fx2nq6JRWCzg78cLjmhRantd
	 24iERycqpetEV8+scZLms7O3eBWLmKVHMlVn4BLInT/lt0K/fEoEc9eKUVKrDu4QSj
	 lh6LOOzhbgcNuMFpRZp+1c7LvdI237Kp+K2JZ1NdOh1OZllW+1t1/PP480J/9Yp+GG
	 r6bz4f9/t91CkgCxjXv3HM2vQuFTbXApvxqqiRjupOwWnnZH7WnhPB32WlR60enX/9
	 9gjaon5QJQtNE7hGu5uLsjs51C89Fg68KqTOnkRt5OVQkMdNPzhMhlxssJ27A+YsPX
	 xJYCkN1E+GjaA==
Message-ID: <9b822d2d-7e2f-98f5-218c-22e0bb516a6a@collabora.com>
Date: Wed, 11 Oct 2023 13:40:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 2/3] arm64: dts: mediatek: mt8195: revise VDOSYS RDMA
 node name
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "Nancy . Lin" <nancy.lin@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231011075031.30660-1-moudy.ho@mediatek.com>
 <20231011075031.30660-3-moudy.ho@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231011075031.30660-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_044030_993471_034A2A81 
X-CRM114-Status: UNSURE (   8.14  )
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

Il 11/10/23 09:50, Moudy Ho ha scritto:
> DMA-related nodes have their own standardized naming. Therefore,
> the MT8195 VDOSYS RDMA has been unified and corrected.
> Additionally, these modifications will facilitate the further
> integration of bindings.
> 
> Fixes: 92d2c23dc269 ("arm64: dts: mt8195: add display node for vdosys1")
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



