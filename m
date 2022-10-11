Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AB6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 10:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IF1lyTj657Ib1k58iymz6y8lpEzBDXiL9Hcq5Rkjqp4=; b=34XfB1wHpQrOKnl5UQQOJ4fREa
	K1sYIZWSoDt9vP/zNC/X/RTStlFac45RIOMsWxA0RFmPRhllGtBZJS6XTnqhfRnfIb5I6RmaeXgYb
	LC+f5mJ0VeS2RAIaLTSuZjP/hKMS/4q1alPTzPEvnUReTTns864C0E8krwBNW9y58biPTNpJzKE12
	kIcLlyWlbd0rFsQFYDw60lsoj32oAK+bIUESLzHfmgr9yRLNRJ/6kjwV6VfHnZDiJHjgdQhZIKEEY
	Scpio6QH19pBwUcvcaPsIkklaw1CZsKE3NLvMbJdL7pPID/9SVPiGYeG+t0fJfWDMi/w2X0GxHvJa
	J8CPfCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiCD7-003y59-89; Tue, 11 Oct 2022 10:10:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiCCL-003xkR-De; Tue, 11 Oct 2022 10:09:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A30756602356;
	Tue, 11 Oct 2022 11:09:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665482956;
	bh=KheL8efT8Q96RJOrwtrfyrYEayKrb6iY+HjU4M1eBgc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jqKA6J73hIKrKBEqpcEJcrdREuyXUU5x/u6yBt8FzQAFAQ09wq0+7LIIaHtSrknfn
	 yx8RoLy+0ftvaDrzjzI/aww7kiVRy65tFqrhu22T9zn5qv42su1GjwVIF8xHBq9yaI
	 uzTafVxfA6HQq90mcefcqHKzXemNg9UTeOjyl1qDX59BpwTigHsXW4CiZ9VhYbvYwT
	 USWMdHktLCCpH02ReXVpJCUTgLjMEKO485KYWOciySUC90pQVvtYkHvt4lI+K+RfWt
	 KDI2/Ee0kmOhg0+E8Lhmj0o3a7WaTsh5/Lzm69miFYeCt4F88Dm2ZyDdr93DxnPdDY
	 bjN2Nu3hcvQBA==
Message-ID: <a7831463-c4a3-d89e-3f33-fbf00441b517@collabora.com>
Date: Tue, 11 Oct 2022 12:09:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 6/7] soc: mediatek: mutex: Add mtk_mutex_set_mod
 support to set MOD1
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
References: <20221011070356.682-1-moudy.ho@mediatek.com>
 <20221011070356.682-7-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221011070356.682-7-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_030917_637621_E679152A 
X-CRM114-Status: UNSURE (   7.98  )
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

Il 11/10/22 09:03, Moudy Ho ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add mtk_mutex_set_mod support to set MOD1
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



