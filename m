Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179B7C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 09:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8yGsy+D3K32EJZcd3XVuuYIfqTdsqaq1I5KLcvqf6iE=; b=f7BTdcuf0O3nXj
	qM3RN40lZ4rW81U1MFaEdhGiVHev4o862D22DADlnvSJP2JukOC0KjpJU0Q9pTCdUEiuddHuxrhRW
	IZfyFFXi8VDWF5ujOsaYgA+bf58anoFhBDu8U9PjRGA/OJT33B1844/25gmPLzjd/sX6oVF+Gs0cE
	3poqx8Mv9RFVFPu2QB0dYdUE4a552tzuNwMCOcqv7pRN46TM/YU3LQYEoWdNwH6bDIw/Q2zPy1ePc
	NZ/fag5G23nq76t6bTZ1QvP+VjlVz+JWgM+3+s+K77CMqfkYN5A7+71ux7NhJyJMQ/Zbkhz9kEvqa
	o62VWpEKWNaLn/MBWrHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3Aq-000nCl-Uc; Thu, 09 Feb 2023 09:25:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ36q-000l2r-DL; Thu, 09 Feb 2023 09:20:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2093366020BC;
	Thu,  9 Feb 2023 09:20:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675934448;
	bh=XK89DpHTkrbWesh1OFAIn18zG/r2PRgD+/v++LschwY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lqtvD/mTT0Ly2chZp849w/RLuviHsFeOJD1cgW9SpALvw1pwRE8yT88jAUe2ufll4
	 6AWlK77SBPAlnFztsCo9KFtM87fQTk1BcnhfYQfRponS3JVsPEpgsCy4Q9h3ivveI+
	 LDmYQ5fL/rA2f4/vt9vHT4x2Z6ABhoBwABrXfRC6FT9Zbi12hasLs7uBhkL4FmZmGU
	 5+yYxapS1gsYEQ2Mbs5gRHvt1+VTnABTwUboGxPgRv30vUFMx6Qtejs/lC1CKSNv7W
	 uLkCvo1z3CZ936nCMnQqbqlbNLcj2vtMjQwD+Gxs/gkckCtgohqkcYYB/UcOmMszSp
	 F/6dOiDm357Pg==
Message-ID: <7784f5a2-3cfc-9999-0ad6-cb9cfc1f2822@collabora.com>
Date: Thu, 9 Feb 2023 10:20:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 5/9] dt-bindings: gpu: mali-bifrost: Add a compatible for
 MediaTek MT8186
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-6-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FZqrGzzG8FrmLVzMd7=a23ZJPYGSy5yhYWgH+BFHNmxw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FZqrGzzG8FrmLVzMd7=a23ZJPYGSy5yhYWgH+BFHNmxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_012052_629187_7F48DC14 
X-CRM114-Status: GOOD (  13.82  )
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
Cc: devicetree@vger.kernel.org, tomeu.vizoso@collabora.com, Nick Fan <Nick.Fan@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 09/02/23 09:49, Chen-Yu Tsai ha scritto:
> On Wed, Feb 8, 2023 at 6:37 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Get GPU support on MT8186 by adding its compatible.
> 
> I'd skip MT8186 for now. We have to work out some binning details for the
> OPP, in particular how to deal with both Panfrost (or Mali) and SVS adding
> the OPP table. We were just looking at the Mali driver today.
> 

Dealing with binning is fairly easy... I have something already done for
that one, but I'm not sure that it would be the best option.
My solution makes use of opp-supported-hw by "standard means", but perhaps
let's have a separated conversation about it?

I don't think that skipping this would give any benefit though, because
that is only adding a compatible and whatever binning support would have
to be generic and 99% not bound to any mediatek specific compatible.

Angelo

> ChenYu


