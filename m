Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFE8C83F17
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 10:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hhfm5/iQ+YebgtcsVNWtZo6uJFJt9t2AJ4spMusVxjw=; b=JDKX9Sa6cWbQ5Xo29avGP7xtt/
	TBCsLWkpZJoMfrcJh3fWeqyiLBmn5h8B/FtEN5+4RL/Z56m1rJC2Qvg0JwkEvNarZo8clDz/LYdhj
	14jzJIFwxCVsbIczISaCDRFmk4zgCOHcTu5L/Cek8UsjjOm83Q+dGouikDxpX38Z0u7dgdHVWLoTQ
	1LeNXGfIeSjeMJAHScuFhM/yXfzcfz/nXcAsm4u0DTWfOJOM+z8xN+pMNAmRNMHSt4S+vPdOOMREI
	3LjBRdY6uLB3K6c2l2wWVgkq3c71iyIn1u66KOSadXOP8KmQVVkZ+3Z2SHjdeFPOKJ66t7YCQ25AV
	uz5UdEnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeCZd-00BqoZ-1j;
	Thu, 07 Sep 2023 10:49:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeCZZ-00BqkT-2H;
	Thu, 07 Sep 2023 10:49:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C3BE066072FC;
	Thu,  7 Sep 2023 11:49:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694083754;
	bh=OFLJjkH0n3nuvjKy5n4yw1ihmDQMqgkN8jJdfrUz49c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PZUAyQIL3eLgRZ1dsWDYci/fuecgDE+LjOI4plnfUOCi9rOXqGJz/zsk/vlrgKsuf
	 XvQ4AnOIR7T+VtEsgTIgTj0q2WWtUQ0nL3QGkg0EMZGLhviDz3OFgn6vVDjY5N5yg5
	 sGvFnai2PknMLqVPU94uQKS5NGU71U4qw0YyKYs0sEOIF+7taVf5jo+ALoybRJYElc
	 CKkvzDnbLWu8ZTOgbrvgzRBql0KM9+TpQ2V+2ubdK2+X4wD8o1MkX8aQFMDUSi67te
	 l1LLbHMwz6o63UciiQZ9qMwEVgqEI8kloAqSc2xjxKeA7A5d6qAqWukik1R0zNCRQx
	 asT6oy6p10otw==
Message-ID: <ebf80e22-77c4-8f8d-6e98-e8b33949e6e1@collabora.com>
Date: Thu, 7 Sep 2023 12:49:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v17 05/14] remoteproc: mediatek: Extract SCP common
 registers
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230901080935.14571-1-tinghan.shen@mediatek.com>
 <20230901080935.14571-6-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230901080935.14571-6-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_034917_899348_548FCEEF 
X-CRM114-Status: UNSURE (   8.30  )
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

Il 01/09/23 10:09, Tinghan Shen ha scritto:
> This is the 1st preliminary steps for probing multi-core SCP.
> The registers of config and l1tcm are common on single-core SCP
> and multi-core SCP. Extract these registers out to reduce duplicated
> fields in mtk_scp when multiple SCP instances are created.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



