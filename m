Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64188C7EE24
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 07:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bXqpaHTdgYwJON3WHQgI+ej2ddWI0zcoiMega8Otes=; b=EW1AeD48a3hu8ti30SeXQj+/dA
	yjMGj+/ZQsYMZJE7wZATS4SVPiTOMInIcCdENPQ0NLoJrhVLSb8r/+flJBgY5JrbJHFOc2JfzmoQK
	pUHmbdYvFmhRnQ2y4sJg/6209O1vboGzEf0FGMFcahVvshi+VKjrW8v51mWOvGMPi0Ry692U6VFyc
	Ro6lqasubgRA3ZvqLyH7Cb1DeBRPoNA2wf6sNP/0jIwRb+Pjs2gI1j2FrkY/g5PavuI4SANRNF73p
	A8FaLeiOQGT0QVMjLggEvIgEi+tNkKxRMwgXvu6/RpvlsHSyPN6cuez+yruLrKXji92L5vKdeCDn/
	BXkIopHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6RIU-000Yhq-2t;
	Tue, 06 Jun 2023 07:40:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6RIM-000YaJ-2S;
	Tue, 06 Jun 2023 07:40:00 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6255C6602242;
	Tue,  6 Jun 2023 08:39:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686037194;
	bh=AyLGC1kOoL6K0cSmbrR1fdDN+OihSXHNH7vj0pD3n1U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h58UPlb6KYpmLMV5A0ofTOXvFjiRuWAwgeIgz3fLUQwLflrDZ+eIUrI4La1g3WuCN
	 beAEFScwk03oLO3bft2kb+a9ivOkoEQab3SuMjoaLIwY+D65q/lhp9oq4jdeQiGFNP
	 dfqc20gg0Cg5GkAnNUTeoP5qoeoGo7kS75HJUGVo3Y+uPyCC4pcWHtGvblufMNZu2W
	 K7B/GvRfRb45SjzZ2/B44ERPckJOyxAE4h4emHximPGoE5QM+GTRQs52w4DhHuQITr
	 jQw7HkfrZlCcVA5bBJEfUT/iNXx8DAvA4qOy3lh44xhqyQdNxokZEB+G0VPYuQXUQM
	 pltKyA1dFBtKg==
Message-ID: <4250d8d0-2e51-d76c-d1d8-b3829ce838ce@collabora.com>
Date: Tue, 6 Jun 2023 09:39:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 5/6] clk: mediatek: mt8183: Add CLK_VDEC_ACTIVE to vdec
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230605162030.274395-1-nfraprado@collabora.com>
 <20230605162030.274395-6-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230605162030.274395-6-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_003958_957534_9E2EC23A 
X-CRM114-Status: UNSURE (   9.68  )
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

Il 05/06/23 18:20, Nícolas F. R. A. Prado ha scritto:
> Add the CLK_VDEC_ACTIVE clock to the vdec clock driver. This clock is
> enabled by the VPU once it starts decoding.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Since this is hw managed, it's a good idea to add CLK_IGNORE_UNUSED to this
clock's flags to avoid potential lockups at boot. Please add that flag.

Cheers,
Angelo


