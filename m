Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF16C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 14:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2p6O5gnbUCbxxT4rrCdhutnrIgT8lwmFVGSTvrgdECw=; b=srbW633mNWJrNn
	SU12xCsws1rySnQPhDfS3Za4V9l11P+6ens+mUak0YPhPTlGoL3iL7JboVC/1U9+oj0URR/lQOyp3
	qLANrjHzPuHKfZ/C9zWgGPHRMqq2nIJfrZY9vWrL6LZ55t8/lvHrCnggzjiuukRN5yEs563u4uU+q
	pOARhyMA7aGnQSsTqAxs3axeXEXmuae6vwBFcgDqN1fYzRcnZrBkOjj8RcN/fI/wbZ67EiOps0JP6
	cveLIXkVhUIcO6cl3hvb9USIVLnAs2qD0CKNx4KLwO5rlEXfnIF6RyMDV54O4LSvyTyZ8D/2vGkBq
	RKSlSCNOwPz0UVUyaoIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmcxB-00GVcR-MQ; Thu, 05 May 2022 14:59:41 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmcwz-00GVYe-RY; Thu, 05 May 2022 14:59:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A7CF21F458A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651762768;
 bh=Sf7k/0OhMAAsnIEczTQGZSW4QzFAgs4S4sdWB28tCLI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JAYFAOPLuOcHT2NGoHGyAtRuK2Sg0/UD1HLKA8CEtiAdnyt2Ev+IbRuSbTWb4zhOh
 a/VJysDId5WYcUfYdr7HmbAnVOw/pTJkLkhWZwB4aUXqxZiDY4brtTOtc/fTimUePy
 8NN9vpeqgkcSR1ISUt56zn0dJW0w8ItJAfhsyL4VCXXlcSgA9M9Fp/eFSksxnRaxun
 K65YRx+zSa5wyp3B6pXw1toIV7w6tQTmNbzKPriedDekfHmJjM4LPZA80X1PUZHApt
 0/3J96n3qWRD/ncurNnqgwjqdy4hwIWbE+VeX2URuD5M00+lF9375ZRIcysbhCW5vO
 CrTuwLvX8hGKg==
Message-ID: <eb0cd3f6-6248-0494-9a5d-297c2247a4c4@collabora.com>
Date: Thu, 5 May 2022 16:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RESEND v2] dt-bindings: gce: add the GCE header file for MT8186
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, jassisinghbrar@gmail.com,
 robh+dt@kernel.org
Cc: jaswinder.singh@linaro.org, matthias.bgg@gmail.com,
 yongqiang.niu@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220505034820.12759-1-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220505034820.12759-1-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_075930_069438_07A62A87 
X-CRM114-Status: UNSURE (   6.29  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 05/05/22 05:48, Rex-BC Chen ha scritto:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Add the GCE header file to define GCE subsys ids, hardware event ids
> and constants for MT8186.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
