Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4505C19F29
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 11:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxpoSVdR7uNDOB7sUsHFpsFLRMEbn2LGkvA8jWfffD4=; b=1Yy55R2ggZg5wpESiX2LvzdVrh
	czXfW+j2jIIAcb8utkXGtRof8D091le6zIotV1Hkne0EEmpzZfb2bSeH8nwCZ8fQywsNnPtlqZxAf
	Cf5btaiy0JFKYd3zW0l4m3JQic0B8nFlJZa6fXnQD2O5UhLONYA0jouB4Ozx+PcuCKDIwKTRtYgKa
	qbD9lj7TXwklzDihGAlZbTkz9aav/H8GTzk8ZUU+NMaLQh5fUWskdBHcWYjMmmnoS97Yu+TQh16E4
	GoLj/6BowAwI4BoFRSMfFmrh9C7VG0NI7BQMXoLpllUIeqzDsP0y2uZ8dBBjz+wObX9gcl9HD79NA
	TyfW42zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1JD-008Zy9-2u; Thu, 28 Jul 2022 11:04:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1J1-008Ztb-EC; Thu, 28 Jul 2022 11:03:52 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C4746601B43;
	Thu, 28 Jul 2022 12:03:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659006229;
	bh=5PSsydhhOMtbhFzmYI7d4uSivGplYNo4i42RIM9m6OI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MWlgOyIs4xBYQa0d57UFr47gtKi6o77pfzSH+Sz+SSO2azezBuHE9kzoZ2MjmoMlt
	 4cguuqw2koD1RCUksv1tnu9TwdwYVyy3hjPmBAUlovg3L/kbRTJng3670CSLpzvcoL
	 iXeKArJ5aPZkiPxatLvXNIQlmWsxedSPuXuYl1Hc6Y/jtovpsVzCBrETTIof63a4kh
	 lRuqoydkIVY/c49r79BGKzpcslvhisPg7MM/2QOYiJDt0bmi1KHXLmXPXD2JJaKkMF
	 TZg/wVAkGHJhM6FImouUpp8vcNkA7MtLD246NRcXDH1UnM372NFHHGpQ88dmAJAKu+
	 74Mnt4h7l0SRA==
Message-ID: <69f91268-d8bc-f973-d1ca-5e9840826ffc@collabora.com>
Date: Thu, 28 Jul 2022 13:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/3] memory: mtk-smi: mt8188: Add SMI Support
Content-Language: en-US
To: "Chengci.Xu" <chengci.xu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220727104541.7309-1-chengci.xu@mediatek.com>
 <20220727104541.7309-4-chengci.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220727104541.7309-4-chengci.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_040351_629729_8739384F 
X-CRM114-Status: UNSURE (   6.83  )
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

Il 27/07/22 12:45, Chengci.Xu ha scritto:
> Add mt8188 smi common & larb support
> 
> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
> Reviewed-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


