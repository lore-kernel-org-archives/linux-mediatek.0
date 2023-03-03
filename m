Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DB3C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 11:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/gzP8QVdtVhCVE0NDEh7nr/VbvH+gyEtlVFcAdVxuo=; b=xeKhcUaYnWQOK0lLSlOxDo34ZL
	S2k1J3C20YXkwvLc4cEAgQsneeOokTS6G9V+/YjHHQbIVq9xLOqXLNRVqqI9yFuJvQ8i11yAny4fa
	KIsals7qT3GG4eKX8XL2rGuq77iA65RWSuxlHF01TfD8P9L/u2uMmeqfkTZezqvHSYFDJOcFDSG0Q
	Jvhg+f9mcg6gDdUfPoOUUhCpzNYEtAgC0dAIuIULqzPJ1m2j3bE7ZumeT0DsWDShtF1AG2xROPiIC
	vhcxu4ft5V/0CReuI0GHGZU1KvsLwW4T0W486x1xB1WsOuVPrFsrTO2ioAwbM/VDzNgDXMVESbF9i
	QIZNLd+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY3bB-006956-2h; Fri, 03 Mar 2023 11:29:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY3au-0068x7-2Z; Fri, 03 Mar 2023 11:29:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 403AE6602FA9;
	Fri,  3 Mar 2023 11:28:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677842938;
	bh=8lQuKTNqLLG4sN9pbkryYhyeTvUWxhRYtUSB6j0wgAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lh7SPkdmCQ/69MTyf96sNf05le0sbwG5NyaG7iKKP+O37iq4/r1Hy9HLd4Rw9rPJy
	 xb0zHSN6qEh21exUYDlVIr5WJCfxYakOx10CvdN2V5GMWn0qHj80vl3tFLYCZumfzY
	 6zV/LyBuihJtn1U7KvIZNLDEQi99LPkss5NkfZ5eWnuIrQNP60Bjk5kgonPPnRLR+T
	 EgZ/bn6NnyRORUzaXnVzNt2vU62wWM8Q8baaAutexKy+UqGfeApCrz3drdO/YkCJVG
	 QI4krf+rJOEMNY653ljDksw7QhhQ7CgV76owJ9388RDc7hTb0YlPjNKZdVomX89VZO
	 qoICzcbZgvEbQ==
Message-ID: <9e28aadc-fc47-705d-008d-dff5e9d6bb18@collabora.com>
Date: Fri, 3 Mar 2023 12:28:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/7] arm64: dts: mediatek: mt8186: Add SPMI node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20230303031728.24251-1-allen-kh.cheng@mediatek.com>
 <20230303031728.24251-4-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230303031728.24251-4-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_032900_302336_7F7F27E5 
X-CRM114-Status: UNSURE (   7.68  )
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

Il 03/03/23 04:17, Allen-KH Cheng ha scritto:
> Add SPMI node for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


