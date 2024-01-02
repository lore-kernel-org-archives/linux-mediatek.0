Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BEEC47073
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 09:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9ZyRut8Su9gPWiZE3Z2tBln9hlDccnRDwewdUbuoHI=; b=TsadIPHzXL2TA92qe2ynemDT+L
	3CD/lciWy/PHI0qgnWSCkBu8UzBr8MG3y0Fa9JoHvo0wRCTwKArwYcIizUufzOo5+08fVucQIPR/C
	pEF/vWl/anmBHKIeoVMo2i4SsccVJu1sdk9btYbkiAHuAEG52texyy4iq9Z2+d8wc6bMncSuvNlLx
	pt4aDmqmoOHCS7djzSH08Q5OgLPhjo+fA17uzF5Feq4mJCLT5kSftbSkf8RFzU4B4puBe3LGiOrCP
	O1UBpFH71YAXAycMDBbVu8ff0cfaY5eDxkbwvcZX2NXMvJZ6+F7yfzLcEnIcptFoADuMk5G3jGkxp
	N5H2Aq+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKaqY-007QLG-2c;
	Tue, 02 Jan 2024 09:14:02 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKaqU-007QJp-2t;
	Tue, 02 Jan 2024 09:14:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704186835;
	bh=ImQ+ymQfWqAxdMGCUQbM0o1Jmc0/6yS4KLapzuXqGhw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=w6JNbAmknwR8jiIFUkRky+Lu1jqEU9GHaf6rZZDjMwnjTQWvGC0mgGa5wqe3ajNKN
	 +eeoKfWG6vs7mCfNnuQL/S+5d0e8uM97zK3HpW0RDN82K/AkmH8WWLpiihti97Vvmr
	 Ykkeicc4j9uhqDc2dZkvJB+msv3wdKG/8GO3I6bon0YQKDeje6PITa2wJM4FUN6tSy
	 etfL3pQg5kU1bgeksb/i21rJoTwT6mt79/+whW84YQIdGla3tYNhSHrBpGseK68eHZ
	 w0gnCU0/4aZw6InmZMnCpXGiI1fe53cWBywPwWRQLpeYe1AP+RN7ZjIQdE1He8tJnF
	 DhBoEwKRJSl5Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0BA5437804B2;
	Tue,  2 Jan 2024 09:13:54 +0000 (UTC)
Message-ID: <9c2c42f6-e10a-4ff1-89c7-8635b8f8b73e@collabora.com>
Date: Tue, 2 Jan 2024 10:13:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] dt-bindings: media: mtk-vcodec-encoder: fix
 non-vp8 clock name
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, tiffany.lin@mediatek.com,
 andrew-ct.chen@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, kernel@collabora.com, Rob Herring <robh@kernel.org>
References: <20231228113245.174706-1-eugen.hristev@collabora.com>
 <20231228113245.174706-3-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231228113245.174706-3-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_011359_064148_D2E560BE 
X-CRM114-Status: GOOD (  13.02  )
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

Il 28/12/23 12:32, Eugen Hristev ha scritto:
> Looking at the binding it makes sense that the `-vp8` compatible has
> the `venc_lt_sel` while the other bindings have the `venc_sel` as name for
> the clock.
> This was also mentioned in the txt version of the binding before the
> conversion:
>   `
>   clock-names: avc encoder must contain "venc_sel", vp8 encoder must
>   contain "venc_lt_sel", decoder must contain "vcodecpll", "univpll_d2",
>   `
> 
> So it is easier to check for compatible that includes vp8, since that's
> just one, to have the requirement for the clock name property as
> `venc_lt_sel`, rather than for all the others, some of which are missing,
> thus for them, the requirement is wrongly `venc_lt_sel`.
> 
> Reordered the if/then/else to match `-vp8` and have all the rest of
> the compatibles using the other clock name (`venc_sel`).
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



