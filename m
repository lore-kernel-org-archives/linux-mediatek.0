Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCA1C7EE2E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 08:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2q4WA1PZkZY39oLMXws9ZFwNK7MAPPEe6w1IC+ooOa8=; b=QhE+VF5EbAw6ONgBlTRVWR0DTu
	2JNQqDgzV0huBArJhusA8bKyv/6CpMnDD0CL6zJt+p9hBRLCXEOD/x8h1Eu/czsGTNAlafcj3febO
	KO2HSE2YekhowBa0L2+qOogbK3hLVZVEJ3jpWhSrBeS5wujBdTwvHzTtdLuMzh09RqrBqOc2+9/2Z
	WrSKwXaYPTLMExEw0GURVOGsU/tTqnGXkAXw+4eB+wrvx1MTd9aiU/nEd1aZGuuk08+vRhyvwxCww
	lJ+9DauPUN9tGtbL6k+Dj8LdaG5hMCEPCi/nWas1LnEQH15XA/jYgJqAR1j67bj/iSH9Z/RNpyZkU
	fVHCc+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q264y-00Fvie-1X;
	Thu, 25 May 2023 08:12:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q264v-00FvfN-0y;
	Thu, 25 May 2023 08:12:10 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7EABD6605835;
	Thu, 25 May 2023 09:12:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685002325;
	bh=MN9eqSpRVglS1WDgssyRKlrNQodr0dvGosGQ0rVhxN4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MnFq75WRF5WGpp6NYskGgRv9yi+/pV5UI95oKZlq3HUN3LVugVxNwFKSxjqu0ygSs
	 +NELlkT1vukd/OKbkzXaMs0lJFJMpcdXQR1vkd3P+SgYlLfbA6oqvZYj8RveHtuPkv
	 VH7t+mCZeVoK2tle7uZLGtBo/XUpe5ZBQfsHlcPhQHk40WMefJG/YeFmVCF6qnIsAZ
	 tKd9w2mTUekoqQmC/1Tb74AcKbywsTCsXCYCNrJFq3UpKs3ouD0NwhBtrF+byDRkv3
	 Dqhr5IaM3o+1bclqdyyQzI5379HMsCNb+kAjGt0qfdqiOB9LKRPQZDkV8oIdg2tZgY
	 eSAksMQ52PfSw==
Message-ID: <816a4aa4-cf6d-8f2b-8c86-5ea33e14a48c@collabora.com>
Date: Thu, 25 May 2023 10:12:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4,2/4] media: mediatek: vcodec: using decoder status
 instead of core work count
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230525014009.23345-1-yunfei.dong@mediatek.com>
 <20230525014009.23345-3-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230525014009.23345-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_011209_470569_8FBB6155 
X-CRM114-Status: UNSURE (   8.58  )
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

Il 25/05/23 03:40, Yunfei Dong ha scritto:
> Adding the definition of decoder status to separate different decoder
> period for core hardware.
> 
> core_work_cnt is the number of core work queued to work queue, the control
> is very complex, leading to some unreasonable test result.
> 
> Using parameter status to indicate whether queue core work to work queue.
> 
> Fixes: 2e0ef56d81cb ("media: mediatek: vcodec: making sure queue_work successfully")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


