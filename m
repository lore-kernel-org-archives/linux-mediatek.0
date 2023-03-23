Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8395C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 09:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSGMZ0DXxSMkETvQUMza3l/dMCnNL+ukYiI0PwAfIfc=; b=KWac6z+qrCF9+R5U9vmSTNpV76
	cj+j5NiCrMTW82XDG8umXgruXP6jFCF3hez3C4h5b0x/odefHddZkX5sd8iDA2sM9hWx3WeSOXl4B
	oXLzT7yy26KrJzfTqMMPqU/qZPqw5exR/3CuPtdQrhSwj73996v8XPxmjeuvE6MwZxx0+7RKD0QpK
	E0aCAOn4oM/9kEwrP6zIcX8ODNNdZYH0iUE6Qa3FL19+kjQkzkbsLfV2D5/btjyKoa0sT6Ky2oHy4
	OGYu1MiNNvL1+CDXo95kUqeRnXS+tUMNui/o2cuSw8HY/nmG96rX2sNJAL90R6Ji4ywHmPungRACC
	j31elixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGtB-001Mv8-0m;
	Thu, 23 Mar 2023 09:05:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGt7-001MsE-14;
	Thu, 23 Mar 2023 09:05:38 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0E43866030B7;
	Thu, 23 Mar 2023 09:05:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679562333;
	bh=wwINqe29kiBtmq4po2HZOBPJxJovHBx9wl35mDz0eHA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UEZnifG9ZX7v5DHzmaog9mbNJaM9MNnXyW5cYBM1yhc20gaYpj95pjQglnTVLKPkN
	 H7dr5DbBuw3EOBUP6hOvhMkd4sGhN7gSWRu/dh1ilMxGUyPwbR7dTJJzoZ2pWEJ5bv
	 OpJ89TPNAzNQDT2GvaDBqL4BW/6nRXrjMicFjFDjS0Ow3fb7i+WUrnzp9Bvl7alNuq
	 PeygCLTgOod7dR/hk2Hf2UTTJnapZ5aEuGvyAIt/DDKHYqhr8rmeOUgVwZMxdRk7iP
	 Tw2AZA3mV8+D40ZP+4evhb9q2xSchBLcAyZv4NA47rvzAx5wr6Jq4JLLXmFF8ZKKQ2
	 5UjCLVLIDCL7w==
Message-ID: <99e1d5b2-509f-3291-f327-2050f1bd9aa3@collabora.com>
Date: Thu, 23 Mar 2023 10:05:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v30 0/7] Add MediaTek SoC DRM (vdosys1) support for mt8195
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: "Nancy.Lin" <nancy.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, singo.chang@mediatek.com,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230321121859.2355-1-nancy.lin@mediatek.com>
 <17831605-5c9d-9c92-d190-04f91060ace4@collabora.com>
 <CAGXv+5F82Ctz0pit4LsR5mQizPq-v2k3OVfiRhsGnG0a2J=Dyg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5F82Ctz0pit4LsR5mQizPq-v2k3OVfiRhsGnG0a2J=Dyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_020537_502092_B3E0C287 
X-CRM114-Status: GOOD (  11.23  )
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

Il 23/03/23 10:04, Chen-Yu Tsai ha scritto:
> On Thu, Mar 23, 2023 at 4:58 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 21/03/23 13:18, Nancy.Lin ha scritto:
>>> The hardware path of vdosys1 with DPTx output need to go through by several modules, such as, OVL_ADAPTOR and MERGE.
>>>
>>> Add DRM and these modules support by the patches below:
>>>
>>
>> I've tested v30 again on MT8173, MT8192 and MT8195 based Chromebooks.
>> Green light from me.
>>
>> Chun-Kuang, can you please pick it?
> 
> It was picked up a few hours ago.
> 
> ChenYu

Sorry, I didn't receive that email. Perfect!

Thanks!
Angelo

