Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E51C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 11:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJZe3s4inpT/hcwKJ3vZgCwpOglZxifr7rndVpXtWsE=; b=vVkU081J76QomhunBEJv0FvWxH
	ueRN8HStwHnAUBLkqlzbvGxOC8mGqDq0wvnKREHjf0S5HMohCZQvfNnWsF4fhq+1BYREvgYIEryus
	o7pjgC7y/c6HJs09an3vO2tZqkC5V7XB8oU86Y4i+s64JyEG0oxbhGzsWFTGj0Ca1DJVqFPq+R2im
	OkDwM2793IjZ50gB1Z7EIU7bBp9NXL5iLbyXdrBimW+zNOULeHrK3BAFLemios+tCBbiq5vbvY4xG
	SSEIlocUEty+wh0R3ZWN7C9MMgzmw87lasQitiO8R93nnKLIW/FCJsHwhaHlpgPagykAbvZFBHhwA
	yqerE8zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIpIo-009x0F-7B; Fri, 20 Jan 2023 11:11:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIpIZ-009wvx-Mp; Fri, 20 Jan 2023 11:11:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 41E5A660230B;
	Fri, 20 Jan 2023 11:11:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674213062;
	bh=k6CDrFMFNBBTo0iy9o/fuYF/D5i8QlRkB7/+jV9nrOk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nR+3UleAsemunHhYoEqXI5W7peTA3EirkVKy8eb6C+4stfe002V6194laqGu7APx1
	 Vq9FjWlC9bupqdQXvEZSuubvETGn5mVVAiGo6JeGHEI5HjZpq6MT4jVHnak7WngAFL
	 YF6GHS9RY5/nqHCkgKb2388iTWbVBhGhyB9L1emHwn7UWjM2+na5qPs7Zlg51LMpBQ
	 o0rW2bDLmAu8JFLLVDi9Hf80IfUnlwNrO5xvkse0ZyS3nEXk9V9wuy/waegO3ba95E
	 AGTnlCQBFIcsl5vN0wL2kZiePJT9uhgIe18rh6jeRhoX5q3FakFtEUmdb4bxIcNUrb
	 +NruoKUBw4hqg==
Message-ID: <91627ce5-1eb0-1a8d-3e73-4966cb7a817f@collabora.com>
Date: Fri, 20 Jan 2023 12:10:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v30 00/11] Add MediaTek SoC(vdosys1) support for mt8195
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Nathan Lu <nathan.lu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Xinlei Lee <xinlei.lee@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, llvm@lists.linux.dev,
 singo.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230113104434.28023-1-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230113104434.28023-1-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_031107_924838_A56CD92D 
X-CRM114-Status: GOOD (  11.58  )
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

Il 13/01/23 11:44, Nancy.Lin ha scritto:
> The hardware path of vdosys1 with DPTx output need to go through by several modules, such as, OVL_ADAPTOR and MERGE.
> 
> Add mmsys and mutex modules support by the patches below:
> 
> Changes in v30:

Matthias, can you please pick this one?

It reached -> v30 <-.... I think that's way beyond being enough versions :-P

P.S.: We have MT8195 support and Tomato Chromebook support, but the display
       doesn't work because of the VDOSYS1 soc+drm[1] not being there...
       I'd really like to get this machine fully upstreamed.

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=707095

Also, CK, please can you coordinate with Matthias so that we get both series
merged in now?

Thanks,
Angelo

> - rebase to next-20230113
> - fix reviewer comment in v29
>    - fix mmysy binding doc for vdosys1
> 


