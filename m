Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E924C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 11:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5NoRRi7JQCjIk1xqUCtVI8cDFuV6FXn+HTo381PIcQ=; b=1GT87MTVF92q8CyM2ykuOSjPcX
	witzmt88kn2tinzdVvfpjdcJCQMD1vuDrHvujolr6/uO698ZB3cHfgrxIW5l0iih82VFr9K2dzKy1
	vo6l2b656qchAhPnjCmr+8tWUz7XHuM8RxVQ/EKenSweTl7y+WfUt6nq/PJlTPLjAwWDTXUCmZBom
	8JHgC1ArS3y2kT/ggRUk7RBe74ZmTGRXcmQY2VmY2RBg4HrtySgLqYezwt0XXc8nMpFr2z93wehCN
	B7AaohaBuOdt6cm7F9rSVhMpUqldcPYA2/MyKoBfqV/2/sS5RnyYcAO+GkMqIrLWir3TAQiXMr75T
	YJ7STcLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8K4G-007afr-2K; Mon, 04 Jul 2022 11:16:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JWA-0077m2-8V; Mon, 04 Jul 2022 10:41:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 50A2B66015A6;
	Mon,  4 Jul 2022 11:41:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656931285;
	bh=i28ZvFcc8bzPMhft40LZSMVn6qoZUDqMH70VKWT90TI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gwy4XxiOtP3SrERFSglWVW7yzxAz7GCgBlDHLh7i/8zsH3T1mvEEA8Fzdl04K6F60
	 BNzM1Aq7m7BR8VzZeLwwNQz47FBG5qVFPxHftyIxH66jl3Lp3adshuOB+0urtrEnlO
	 nAkV6zVA6Tg7IM0+cQAmWVd/B8yEuxZp4A4NnF7szNQ9P/B4G9TdlltuKqXuj7IKXe
	 HOjqA/3IQ+qSOnyFfFWfUmS5+/fth6J+M15haOt9Qb/DQ+ZwQiJ+Znd8plmrz1KBCs
	 /9tp4ubPIDPP0zaynX43o9dIhPUnmHMSxxQ5Vg5u1k3UE8twrqDpe3kH75SAsZVEed
	 ur6cfqyxjpEUQ==
Message-ID: <1fc0d7b9-3842-4fae-6bae-47492779254b@collabora.com>
Date: Mon, 4 Jul 2022 12:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 10/16] arm64: dts: mt8195: Add scp node
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-11-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220704100028.19932-11-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_034126_482389_40867846 
X-CRM114-Status: UNSURE (   8.17  )
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

Il 04/07/22 12:00, Tinghan Shen ha scritto:
> Add scp node for mt8195.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


