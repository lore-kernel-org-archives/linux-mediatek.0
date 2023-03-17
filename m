Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C27C74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yx5GMCAChKn1fVcxkYpPswN9bVYsAxxaAK/86Eo5b+U=; b=i24NNIp05NchcKiflRiHKrO6rh
	Uq5fVoCrOE5pdH96oJQ9PCC7qp29++FxESnIV1Bw04fcjw6N2aUgcZZLKWgm02413mTFnVG7uYlVI
	iC6ePYdzuEvB3HPE40kB5cON2qOQrwNXTaD1cf5rZOMkTndjmeeGTkLepm7U1XbGkzTmFvRi2Zh0o
	Xv7NS3v/l8d8xuunVm3hupgeYoRGObMv9NlvrBt9wWXwbGxs6fhFWcjRN2lc2H3pAekSqBiZL08Nf
	o5y2nhGqFG1i7mCFY7sEwf/zhP4sayVNqZKbfkqiditMPv/JFp5liwoaOIsnBjMXvaqZiuPXq0bbw
	LNqDo4RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6Tu-001kcT-02;
	Fri, 17 Mar 2023 09:34:38 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6Tq-001kah-1v;
	Fri, 17 Mar 2023 09:34:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 619FE660309F;
	Fri, 17 Mar 2023 09:34:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679045673;
	bh=NPnMSIT8GhdkxFjv1oWWysOJEh2QHcceiGEgx5s2ACU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nx3mnF3sIVTsy3pv8yoUYiMu/2x0n3yndWxedYuspeNWINEY7F5lQ0hf60F18gQOj
	 Pb14+QnipFsAniwoK+lib7DvABxjp/fWQFwuB99mBw3JRrW327pki7Vh3Dd6hdPVw4
	 jhMkVskFwdm/AjZOVHkPTqvaUzcyuUblGCxdnjTdh0UoZ/ZJJWLW3JzkrgiVd2HNYi
	 Nm2Gtoza7ssXZV/SI9LQXkaa+Lvi3680+736qjDWx8vnfvGOGYZMMQLm2coMRe8vLu
	 euTLlMzIx1PQiPBQzado95BCB3jciD+ofA8BUol6LHKkkrrjITXrnFAb74tbVesqau
	 3HBu5jeQoev/A==
Message-ID: <797dcbef-8485-72cc-4eb5-f58153d147ce@collabora.com>
Date: Fri, 17 Mar 2023 10:34:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v9 3/7] iommu/mediatek: Adjust mtk_iommu_config flow
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mingyuan.ma@mediatek.com,
 yf.wang@mediatek.com, jianjiao.zeng@mediatek.com, chengci.xu@mediatek.com
References: <20230317085541.20447-1-yong.wu@mediatek.com>
 <20230317085541.20447-4-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230317085541.20447-4-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_023434_761884_FD276791 
X-CRM114-Status: GOOD (  11.55  )
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

Il 17/03/23 09:55, Yong Wu ha scritto:
> From: "Chengci.Xu" <chengci.xu@mediatek.com>
> 
> If there are many ports in a infra master, current flow will update
> the INFRA register many times. This patch saves all ports to portid_msk
> in the front of mtk_iommu_config(), then update only once for the IOMMU
> configure. After this, we could avoid send too many SMC calls to ATF in
> MT8188.
> 
> Prepare for MT8188, also reduce the indention without functional change.
> 
> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



